unit SerasaMonitore;

interface

uses
  Serasa,
  //DB,
  cachecod,
  ServiceLocator,
  uLogViewIntf,
  uLogControlIntf,
  uDialogos{, Funcoes, uSigcadModel, uSigcreModel}, SerasaLocal, uActiveRecord;

type
  TMonitore = class(TObject)
  private
    FConsultados: TCacheString;
    //procedure Imprime;
    //procedure RetornoMonitoreEmail(ASerasa: TSerasa);
  public
    //function EnvioMonitore(Lote: Integer): Boolean;
    procedure RetornoMonitore(const AConnection: IActiveRecordConnection);
    //procedure MonitoreRelato;
  end;

implementation

uses
  Classes, SysUtils, Windows, Dialogs{, DBTables, Progrss, Funcoes_fac,
  compatib}, SerasaComunicacao, SerasaMonitoreDefinicoes{, CacheCad,
  FacParametros, QST_FINANCEIRO}, DBConsultaCredito, ConsultaCreditoDefinicoes{,
  qrddlgs, PreProcessamento, wFacDataModule, uQuickReport};

{procedure TMonitore.Imprime;
var
  LRelMonitore: TReportPrinterDialog;
  LEntrada: TEntrada;
begin
  LRelMonitore := TReportPrinterDialog.Create(nil);
  try
    TQuickReportMetodos.ConfigurarReportPrinterDialog(
      LRelMonitore,
      nil,
      nil,
      TFacDataMod.CheckAliasConnect,
      nil);
    LimpaEntrada(LEntrada);
    LEntrada.Texto := FConsultados.StringCodigos('''', ',');
    LEntrada.TipoConsulta := Ord(Serasa.trMonitore);
    LEntrada.Inteiro := 0;

    PreProcessaRelatorio(pprRelatoEMonitore, LEntrada);
    LRelMonitore.PreviewReport(fServerPath + 'CadastrosRetornoMonitore.qrw');
  finally
    LRelMonitore.Free;
  end;
end;}

(*procedure TMonitore.RetornoMonitoreEmail(ASerasa: TSerasa);

  procedure Detalhes(Detalhes: TStrings; Progresso: TProgresso;
    Linhas: Integer);

    procedure Detalhe(const S: string; Cadastro: Integer; Linha: Integer;
      Criticas: TStrings);
    const
      TextoMensagem: string = 'Linha %d. Mensagem: "%s".';
    var
      Estado: TSeMonitoreEstado;
      Mensagem: string;
      Validade: TDateTime;
    begin
      if S[3] = 'I' then
        Estado := smeSim
      else
        Estado := smeNao;
      Validade := TSeMetodos.DDMMAAAAToDate(Copy(S, 16, 8));
      CacheCadastro.Codigo := Cadastro;
      CacheCadastro.RegistraMonitore(Estado, Validade);
      Mensagem := Trim(Copy(S, 43, 39));
      if Mensagem <> '' then
        Criticas.Append(Format(TextoMensagem, [Linha, Mensagem]));
    end;

    function SQLCGC(const S: string): string;
    var
      DV, Raiz: string;
      laco: Integer;
      HaCaractereNaoZero: Boolean;
    begin
      Result := '';
      DV := Copy(S, 14, 2);
      Raiz := Copy(S, 5, 9);
      {(Edgar 01/03/2006) a partir da raiz e digito verificador de um CGC, devo
      determinar como ele pode estar armazenado no banco de dados.
      Ex.: "000.002.919/0001-14".}
      HaCaractereNaoZero := False;
      for laco := 1 to Length(Raiz) do
        {(Edgar 01/03/2006) zeros a esquerda são consultados como "%", pois os
        CGCs armazenados no banco de dados tem quantidade variável de
        caracteres.}
        if not HaCaractereNaoZero and (S[laco] = '0') then
          Result := Result + '%'
        else
        begin
          HaCaractereNaoZero := True;
          {(Edgar 01/03/2006) o 4º e 8º caracteres devem ser ".".}
          if laco in [4, 8] then
            Result := Result + '.';
          Result := Result + S[laco];
        end;
      if S[4] = 'J' then
        Result := Result + '/????';
      Result := Result + '-' + DV;
    end;

  const
    TextoProgresso: string = 'Processando linha %d';
    TextoCGCNaoLocalizado: string = 'Linha %d. CGC "%s" não localizado.';
  var
    Criticas: TStringList;
    Q: TQuery;
    laco: Integer;
    Linha: Integer;
  begin
    Criticas := TStringList.Create;
    Q := TQuery.Create(nil);
    try
      Q.DatabaseName := 'DADOSSRV';
      Q.UniDirectional := CreateCompatib(nil).PermiteUniDirectional;
      Q.SQL.Append('select');
      Q.SQL.Append('  codigo');
      Q.SQL.Append('from');
      Q.SQL.Append('  sigcad');
      Q.SQL.Append('where');
      Q.SQL.Append('  cgc like :cgc');
      Q.Prepare;
      for laco := 0 to Detalhes.Count - 1 do
      begin
        Linha := laco + Linhas - Detalhes.Count;
        Progresso.Posicao(Format(TextoProgresso, [Linha]), Linha, Linhas);
        Q.Params[0].AsString := SQLCGC(Detalhes[laco]);
        Q.Open;
        if CreateCompatib(nil).QuantidadeRegistros(Q) = 1 then
          Detalhe(Detalhes[laco], Q.FieldByName('codigo').AsInteger, Linha,
            Criticas)
        else
          Criticas.Append(Format(TextoCGCNaoLocalizado, [Linha,
            Q.Params[0].AsString]));
        Q.Close;
      end;
      if Criticas.Count > 0 then
        TDialogo.Fatal('Monitore do Relato', ['Erros encontrados:', Criticas.Text]);
    finally
      Criticas.Free;
      Q.Free;
    end;

  end;

  function ValidaCabecalho(const S, CNPJ: String): Boolean;
  begin
    Result := (Length(S) = 100) and (Copy(S, 1, 10) = '00MONITORE') and
      (Copy(S, 23, 8) = TSeMetodos.SeRaizCNPJ(CNPJ));
  end;

  function ValidaRodape(const S: String): Boolean;
  begin
    Result := Length(S) = 100;
  end;

var
  Arq, Dts: TStringList;
  P: TProgresso;
begin
  Arq := TStringList.Create;
  try
    with TOpenDialog.Create(nil) do
    try
      DefaultExt := 'TXT';
      Options := [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing];
      Filter := 'Arquivo Texto (*.TXT)|*.TXT|Todos (*.* )|*.*';
      Title := 'Monitore do Relato';
      if Execute then
        Arq.LoadFromFile(FileName)
      else
        Exit;
    finally
      Free;
    end;
    P := TProgresso.Create(nil);
    try
      P.Mostrar('Retorno do Monitore');
      P.Posicao('Validando cabeçalho', 1, Arq.Count);
      if not ValidaCabecalho(Arq[0], ASerasa.CNPJContrato) then
      begin
        TDialogo.Fatal('Monitore do Relato', ['Cabeçalho inválido:', Arq[0]]);
        Exit;
      end;
      P.Posicao('Validando Rodapé', 2, Arq.Count);
      if not ValidaRodape(Arq[Arq.Count - 1]) then
      begin
        TDialogo.Fatal('Monitore do Relato', ['Rodapé inválido:', Arq[Arq.Count - 1]]);
        Exit;
      end;
      Dts := TStringList.Create;
      try
        Dts.Assign(Arq);
        Dts.Delete(0);
        Dts.Delete(Dts.Count - 1);
        Detalhes(Dts, P, Arq.Count);
      finally
        Dts.Free;
      end;
    finally
      P.Free;
    end;
  finally
    Arq.Free;
  end;
end;*)

(*function TMonitore.EnvioMonitore(Lote: Integer): Boolean;
var
  Hoje: TDateTime;
  S: TSerasa;
  P: TProgresso;
  Arq: TStringList;
  Qtd, NumSequencial: Integer;
  CNPJ: string;

  procedure Detalhes;
  var
    CGC: string;
    Validade: TDateTime;
  begin
    with TQuery.Create(nil) do
    try
      DatabaseName := 'DadosSrv';
      UniDirectional := CreateCompatib(nil).PermiteUniDirectional;
      Validade := Hoje + S.DiasMonitore;
      NumSequencial := 2;
      SQL.Text := 'select S.Codigo';
      SQL.Add('from Sigcad S, SigCre C');
      SQL.Add('where (S.Codigo = C.Codigo) and ');
      SQL.Add('  (C.SeMonitoriEstado in (''' + TSigcreModel.SeMonitoreLetra(smeIncluir) + ''', ''' +
        TSigcreModel.SeMonitoreLetra(smeExcluir) + '''))');
      SQL.Add('order by S.Codigo');
      Open;
      P.MaisUm('Classificando Cadastros');
      while not Eof do
      begin
        CacheCadastro.Codigo := Fields[0].AsInteger;
        if CacheCadastro.SigCre.Monitore.Estado in [smeIncluir, smeExcluir] then
        begin
          CGC := SoNumero(CacheCadastro.Geral.CGC);
          Arq.Add(TSeMetodos.SeNum(NumSequencial,9) + '1' + TSeMetodos.SeRaizCNPJ(CGC) +
            TSeMetodos.SeFilialCNPJ(CGC) + TSeMetodos.SeDVCGC(CGC) +
            TSigcreModel.SeMonitoreLetra(CacheCadastro.SigCre.Monitore.Estado) +
            TSeMetodos.SeNum(S.DiasMonitore, 3) + StringOfChar(' ', 15) +
            PoeLetra(S.MonitoreGrupoEMail, 15) + StringOfChar(' ', 142));
          CacheCadastro.RegistraMonitore(CacheCadastro.SigCre.Monitore.Estado,
            Validade);
          Inc(NumSequencial);
          Inc(Qtd);
        end;
        Next;
      end;
    finally
      Free;
    end;
  end;

begin
  Result := False;
  Hoje := SQLDate;
  Qtd := 0;
  Arq := TStringList.Create;
  try
    P := TProgresso.Create(nil);
    S := CreateSerasa(TSigcadModel.DefaultConnection);
    try
      P.Mostrar('Envio para o Monitore');
      P.Posicao('Lendo Cadastro', 1, 2);
      CNPJ := SoNumero(S.CNPJContrato);
      Arq.Add('0000000010GERENCIE CARTEIRA-LOTE   ' + TSeMetodos.SeRaizCNPJ(CNPJ) +
        TSeMetodos.SeFilialCNPJ(CNPJ) + TSeMetodos.SeDVCGC(CNPJ) +
        PoeLetra(Prm.Empresa.RazaoSocial,70) + PoeLetra('GERENCIE COMPLETO',20) + '0' +
        TSeMetodos.SeNum(Lote,8) + FormatDateTime('YYYYMMDD', Hoje) +
        FormatDateTime('HHMMSS',Now) + ' 00000' + StringOfChar(' ', 32));
      Detalhes;
      Arq.Add(TSeMetodos.SeNum(NumSequencial,9) + '9' +
        TSeMetodos.SeNum(Qtd + 2, 6) + StringOfChar(' ', 184));
    finally
      S.Free;
      P.Free;
    end;
    if Qtd = 0 then
      TDialogo.Informacao('Monitore do Relato',
        ['Não há inclusão e/ou exclusão a ser enviada.'])
    else
      with TSaveDialog.Create(nil) do
      try
        DefaultExt := 'TXT';
        Options := [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing];
        Filter := 'Arquivo Texto (*.TXT)|*.TXT|Todos (*.* )|*.*';
        Title := 'Monitore do Relato';
        if Execute then
        begin
          Arq.SaveToFile(FileName);
          Result := True;
        end;
      finally
        Free;
      end;
  finally
    Arq.Free;
  end;
end;*)

procedure TMonitore.RetornoMonitore(const AConnection: IActiveRecordConnection);
var
  Serasa: TSerasa;
  LLogViewMode: ILogViewMode;
  LLogView: ILogView;
  LLogControl: ILogControl;
begin
  Serasa := CreateSerasa(AConnection);
  FConsultados := TCacheString.Create;
  try
    if Serasa.MonitoreRetorno = mrEmail then
      //RetornoMonitoreEmail(Serasa)
    else
    begin
      with TDBCadastros.Create(AConnection) do
      try
        LLogViewMode := (SL as ILogViewFactory).CreateDefaultViewMode;
        LLogView := (SL as ILogViewFactory).CreateView;
        LLogView.ViewMode := LLogViewMode;
        LLogControl := (SL as ILogControlFactory).CreateLogControl;
        LLogControl.OnChange.AttachObserver(LLogView);
        Comunicacao := TSerasaLocal.Create;
        Consulta([tcMonitore], LLogControl, False);
        if CNPJsConsultados[tcMonitore].Count > 0 then
        begin
          FConsultados.Assign(CNPJsConsultados[tcMonitore]);
          //Imprime;
        end;
      finally
        Comunicacao.Free;
        Free;
      end;
    end;
  finally
    Serasa.Free;
  end;
end;

(*procedure TMonitore.MonitoreRelato;

  procedure Detalhes(Detalhes: TStrings; Progresso: TProgresso;
    Linhas: Integer);

    procedure Detalhe(const S: string; Cadastro: Integer; Linha: Integer;
      Criticas: TStrings);
    const
      TextoMensagem: string = 'Linha %d. Mensagem: "%s".';
    var
      Estado: TSeMonitoreEstado;
      Mensagem: string;
      Validade: TDateTime;
    begin
      if S[3] = 'I' then
        Estado := smeSim
      else
        Estado := smeNao;
      Validade := TSeMetodos.DDMMAAAAToDate(Copy(S, 16, 8));
      CacheCadastro.Codigo := Cadastro;
      CacheCadastro.RegistraMonitore(Estado, Validade);
      Mensagem := Trim(Copy(S, 43, 39));
      if Mensagem <> '' then
        Criticas.Append(Format(TextoMensagem, [Linha, Mensagem]));
    end;

    function SQLCGC(const S: string): string;
    var
      DV, Raiz: string;
      laco: Integer;
      HaCaractereNaoZero: Boolean;
    begin
      Result := '';
      DV := Copy(S, 14, 2);
      Raiz := Copy(S, 5, 9);
      {(Edgar 01/03/2006) a partir da raiz e digito verificador de um CGC, devo
      determinar como ele pode estar armazenado no banco de dados.
      Ex.: "000.002.919/0001-14".}
      HaCaractereNaoZero := False;
      for laco := 1 to Length(Raiz) do
        {(Edgar 01/03/2006) zeros a esquerda são consultados como "%", pois os
        CGCs armazenados no banco de dados tem quantidade variável de
        caracteres.}
        if not HaCaractereNaoZero and (S[laco] = '0') then
          Result := Result + '%'
        else
        begin
          HaCaractereNaoZero := True;
          {(Edgar 01/03/2006) o 4º e 8º caracteres devem ser ".".}
          if laco in [4, 8] then
            Result := Result + '.';
          Result := Result + S[laco];
        end;
      if S[4] = 'J' then
        Result := Result + '/????';
      Result := Result + '-' + DV;
    end;

  const
    TextoProgresso: string = 'Processando linha %d';
    TextoCGCNaoLocalizado: string = 'Linha %d. CGC "%s" não localizado.';
  var
    Criticas: TStringList;
    Q: TQuery;
    laco: Integer;
    Linha: Integer;
  begin
    Criticas := TStringList.Create;
    Q := TQuery.Create(nil);
    try
      Q.DatabaseName := 'DADOSSRV';
      Q.UniDirectional := CreateCompatib(nil).PermiteUniDirectional;
      Q.SQL.Append('select');
      Q.SQL.Append('  codigo');
      Q.SQL.Append('from');
      Q.SQL.Append('  sigcad');
      Q.SQL.Append('where');
      Q.SQL.Append('  cgc like :cgc');
      Q.Prepare;
      for laco := 0 to Detalhes.Count - 1 do
      begin
        Linha := laco + Linhas - Detalhes.Count;
        Progresso.Posicao(Format(TextoProgresso, [Linha]), Linha, Linhas);
        Q.Params[0].AsString := SQLCGC(Detalhes[laco]);
        Q.Open;
        if CreateCompatib(nil).QuantidadeRegistros(Q) = 1 then
          Detalhe(Detalhes[laco], Q.FieldByName('codigo').AsInteger, Linha,
            Criticas)
        else
          Criticas.Append(Format(TextoCGCNaoLocalizado, [Linha,
            Q.Params[0].AsString]));
        Q.Close;
      end;
      if Criticas.Count > 0 then
        TDialogo.Fatal('Monitore do Relato', ['Erros encontrados:', Criticas.Text]);
    finally
      Criticas.Free;
      Q.Free;
    end;

  end;

  function ValidaCabecalho(const S, CNPJ: String): Boolean;
  begin
    Result := (Length(S) = 100) and (Copy(S, 1, 10) = '00MONITORE') and
      (Copy(S, 23, 8) = TSeMetodos.SeRaizCNPJ(CNPJ));
  end;

  function ValidaRodape(const S: String): Boolean;
  begin
    Result := Length(S) = 100;
  end;

var
  Arq, Dts: TStringList;
  P: TProgresso;
  S: TSerasa;
begin
  Arq := TStringList.Create;
  try
    with TOpenDialog.Create(nil) do
    try
      DefaultExt := 'TXT';
      Options := [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing];
      Filter := 'Arquivo Texto (*.TXT)|*.TXT|Todos (*.* )|*.*';
      Title := 'Monitore do Relato';
      if Execute then
        Arq.LoadFromFile(FileName)
      else
        Exit;
    finally
      Free;
    end;
    P := TProgresso.Create(nil);
    S := CreateSerasa(TSigcadModel.DefaultConnection);
    try
      P.Mostrar('Retorno do Monitore');
      P.Posicao('Validando cabeçalho', 1, Arq.Count);
      if not ValidaCabecalho(Arq[0], S.CNPJContrato) then
      begin
        TDialogo.Fatal('Monitore do Relato', ['Cabeçalho inválido:', Arq[0]]);
        Exit;
      end;
      P.Posicao('Validando Rodapé', 2, Arq.Count);
      if not ValidaRodape(Arq[Arq.Count - 1]) then
      begin
        TDialogo.Fatal('Monitore do Relato', ['Rodapé inválido:', Arq[Arq.Count - 1]]);
        Exit;
      end;
      Dts := TStringList.Create;
      try
        Dts.Assign(Arq);
        Dts.Delete(0);
        Dts.Delete(Dts.Count - 1);
        Detalhes(Dts, P, Arq.Count);
      finally
        Dts.Free;
      end;
    finally
      S.Free;
      P.Free;
    end;
  finally
    Arq.Free;
  end;
end;*)

end.

