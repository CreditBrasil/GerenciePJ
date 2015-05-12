unit SerasaMonitore;

interface

uses
  Classes,
  Serasa,
  //DB,
  cachecod,
  ServiceLocator,
  uLogViewIntf,
  uLogControlIntf,
  uDialogos{, Funcoes, uSigcadModel, uSigcreModel}, SerasaLocal, uActiveRecord, IdSMTP, IdMessage, IdEMailAddress,
  uDescobreEmailAgente, uNFParametroConfiguracaoEmailModel, progrssInterface, uRelatoFormatadoRelatorio,
  uRelatoFormatadoModel, uRelatoFormatadoParse, uNFConsultaSerasaModel, Math, FacMetodos;

type
  TPlataforma = class(TString)
  private
    FMensagem: TStringList;
    FResumo: TStringList;
  public
    constructor Create; override;
    destructor Destroy; override;
    property Mensagem: TStringList read FMensagem;
    property Resumo: TStringList read FResumo;
  end;

  TPlataformas = class(TCacheString)
  private
    function GetPlataforma: TPlataforma;
  public
    constructor Create;
    procedure SetEmails(AEmails, ANome: string);
    property Plataforma: TPlataforma read GetPlataforma;
  end;          

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
  SysUtils, Windows, Dialogs{, DBTables, Progrss, Funcoes_fac,
  compatib}, SerasaComunicacao, SerasaMonitoreDefinicoes{, CacheCad,
  FacParametros, QST_FINANCEIRO}, DBConsultaCredito, ConsultaCreditoDefinicoes{,
  qrddlgs, PreProcessamento, wFacDataModule, uQuickReport},
  uARNFParametroConfiguracaoEmail;

{ TPlataforma }

constructor TPlataforma.Create;
begin
  inherited;
  FMensagem := TStringList.Create;
  FResumo := TStringList.Create;
end;

destructor TPlataforma.Destroy;
begin
  FResumo.Free;
  FMensagem.Free;
  inherited;
end;

{ TPlataformas }

constructor TPlataformas.Create;
begin
  inherited;
  FClasse := TPlataforma;
end;

function TPlataformas.GetPlataforma: TPlataforma;
begin
  Result := FObjeto as TPlataforma;
end;

procedure TPlataformas.SetEmails(AEmails, ANome: string);
var
  LEmails: TStringList;
begin
  LEmails := TStringList.Create;
  try
    LEmails.CommaText := Trim(AEmails);
    if LEmails.Count > 0 then
      Codigo := Trim(LEmails[LEmails.Count - 1])
    else
      Codigo := ANome;
  finally
    LEmails.Free;
  end;
end;

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
  LNFParametroConfiguracaoEmail: INFParametroConfiguracaoEmailModel;

  procedure EnviarEmail(AEmails, AConteudo, AComplementoAssunto: string);
  var
    LSMTP: TIdSMTP;
    LMsg: TIdMessage;
    LText: TIdText;
    LEmails: TStringList;
    laco: Integer;
  begin
    LEmails := TStringList.Create;
    LSMTP := TIdSMTP.Create(nil);
    try
      LSMTP.Host := LNFParametroConfiguracaoEmail.CEmSMTP.Value;
      LSMTP.Port := LNFParametroConfiguracaoEmail.CEmPorta.Value;
      LSMTP.Username := LNFParametroConfiguracaoEmail.CEmEmailFactoring.Value;
      LSMTP.Password := LNFParametroConfiguracaoEmail.CEmSenha.Value;
      LSMTP.AuthenticationType := atLogin;
      LSMTP.UseEhlo := False;
      LSMTP.MailAgent := 'CreditBR';
      LMsg := TIdMessage.Create(LSMTP);
      try
        LMsg.Priority := mpNormal;
        LMsg.Subject := 'Serasa - Gerencie Carteira - ' + AComplementoAssunto + ' - ' + FormatDateTime('DD/MM/YYYY', Date);
        LMsg.From.Address := LNFParametroConfiguracaoEmail.CEmEmailFactoring.Value;
        LMsg.From.Name := 'Sistema Credit Brasil';
        LMsg.ExtraHeaders.Values['Return-Path'] := LNFParametroConfiguracaoEmail.CEmEmailFactoring.Value;
        LEmails.CommaText := Trim(AEmails);
        for laco := 0 to LEmails.Count - 1 do
        begin
          if TFacMetodos.IsEMailValido(Trim(LEmails[laco])) then
            with LMsg.Recipients.Add do
            begin
              Name := AComplementoAssunto;
              Address := Trim(LEmails[laco]);
            end
          else
          begin
            TDialogo.Fatal('E-mail inválido', [LEmails[laco] + ' não é um e-mail válido.',
              'Pertence a ' + AComplementoAssunto + '.']);
          end;
        end;
        with LMsg.CCList.Add do
        begin
          Name := 'Alex Dundes';
          Address := 'alex.dundes@creditbr.com.br';
        end;
        LText := TIdText.Create(LMsg.MessageParts);
        LText.Body.Text := 'Este e-mail esta no formato HTML,'#13#10 +
          'altere a visualizacao do seu programa de e-mail.';
        LText := TIdText.Create(LMsg.MessageParts);
        LText.ContentType := 'text/html';
        LText.ContentTransfer := '8BIT';
        LText.Body.Text := AConteudo;
        LSMTP.Connect(15000); //15 segundos de timeout;
        try;
          LSMTP.Send(LMsg);
        finally
          LSMTP.Disconnect;
        end;
      finally
        LMsg.Free;
      end;
    finally
      LSMTP.Free;
      LEmails.Free;
    end;
  end;  

var
  Serasa: TSerasa;
  LLogViewMode: ILogViewMode;
  LLogView: ILogView;
  LLogControl: ILogControl;
  LCollectionResultadoDescobreEmailAgente: ICollectionResultadoDescobreEmailAgente;
  laco: Integer;
  LAgenteAnterior, LAgenteEmail: string;
  LEmail, LResumos: TStringList;
  LProgresso: IProgresso;
  LRelatorio: TRelatoFormatadoRelatorio;
  LArquivo, LArquivoAntigo: TStringList;
  LRelato, LRelatoAnterior: TRelatoFormatadoModel;
  LParser: TRelatoFormatadoParser;
  LNFConsultaSerasaModelService: INFConsultaSerasaModelService;
  LConsultaAnterior: INFConsultaSerasaModel;
  LPlataformas: TPlataformas;
begin
  LProgresso := SL as IProgresso;
  LProgresso.Mostrar('Gerecie Carteira');
  LProgresso.Posicao('Lendo arquivo e gravando no banco...', 0, 0);
  LNFParametroConfiguracaoEmail := (SL as INFParametroConfiguracaoEmailModelService).Find(AConnection);
  Serasa := CreateSerasa(AConnection);
  FConsultados := TCacheString.Create;
  LArquivo := TStringList.Create;
  LArquivoAntigo := TStringList.Create;
  LRelato := TRelatoFormatadoModel.Create;
  LRelatoAnterior := TRelatoFormatadoModel.Create;
  LParser := TRelatoFormatadoParser.Create;
  LRelatorio := TRelatoFormatadoRelatorio.Create;
  LNFConsultaSerasaModelService := SL as INFConsultaSerasaModelService;
  LPlataformas := TPlataformas.Create;
  try
    if Serasa.MonitoreRetorno = mrEmail then
      //RetornoMonitoreEmail(Serasa)
    else
    begin
      LEmail := TStringList.Create;
      LResumos :=  TStringList.Create;
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
          LCollectionResultadoDescobreEmailAgente := TCollectionResultadoDescobreEmailAgente.CreateFromIterator(
            (SL as IResultadoDescobreEmailAgenteService).FindByCnpjs(FConsultados, AConnection));
          LAgenteAnterior := '@@@@@';
          LProgresso.Posicao('Enviando e-mails', 0, LCollectionResultadoDescobreEmailAgente.Count);
          for laco := 0 to LCollectionResultadoDescobreEmailAgente.Count - 1 do
          begin
            LProgresso.MaisUm('Enviando e-mails');
            if LAgenteAnterior <> LCollectionResultadoDescobreEmailAgente[laco].PesNomeAgente.Value then
            begin
              if (LAgenteAnterior <> '@@@@@') then
                EnviarEmail(LAgenteEmail, LEmail.Text + LResumos.Text, LAgenteAnterior);
              LAgenteAnterior := LCollectionResultadoDescobreEmailAgente[laco].PesNomeAgente.Value;
              LAgenteEmail := LCollectionResultadoDescobreEmailAgente[laco].PesEmail.Value;
              LEmail.Clear;
              LEmail.Add('<h2>' + LCollectionResultadoDescobreEmailAgente[laco].PesNomeAgente.Value + '</h2>');
              LEmail.Add('<h3">Informamos que as seguintes empresas monitoradas tiveram alterações em suas informações comportamentais e/ou cadastrais.</h3>');
              LResumos.Clear;
            end;
            Codigo := LCollectionResultadoDescobreEmailAgente[laco].PesCNPJCPF;
            LPlataformas.SetEmails(LCollectionResultadoDescobreEmailAgente[laco].PesEmail.Value,
              LCollectionResultadoDescobreEmailAgente[laco].PesNomeAgente.Value);
            LEmail.Add('<p>' + LCollectionResultadoDescobreEmailAgente[laco].PesCNPJCPF + ' - ' +
              LCollectionResultadoDescobreEmailAgente[laco].PesNomeCedente.Value + '</p>');
            LPlataformas.Plataforma.Mensagem.Add(LEmail[LEmail.Count - 1]);
            LArquivo.LoadFromFile('\\orderbyapp3\serasaemail\' + Cadastro.NomeArquivoGerado);
            LParser.TextoParaRelatoFormatadoModel(LArquivo, LRelato);
            LConsultaAnterior := LNFConsultaSerasaModelService
              .FindBySConsCnpjCpfAndAntesDeSConsData(LCollectionResultadoDescobreEmailAgente[laco].PesCNPJCPF,
              Int(LRelato.EmitidoEm), Connection);
            LArquivoAntigo.Clear;
            if LConsultaAnterior <> nil then
              LConsultaAnterior.CarregaRelatoFormatado(LArquivoAntigo);
            LParser.TextoParaRelatoFormatadoModel(LArquivoAntigo, LRelatoAnterior);
            LResumos.Add(LRelatorio.RelatorioDasDiferencas(LRelatoAnterior, LRelato,
              '<a href="http://sistema.creditbr.com.br:8080/netFactor/serasaemail/' + Cadastro.NomeArquivoGerado + '">' +
              Cadastro.NomeArquivoGerado + '</a>'));
            LPlataformas.Plataforma.Resumo.Add(LResumos[LResumos.Count - 1]);
          end;
          if (LAgenteAnterior <> '@@@@@') then
            EnviarEmail(LAgenteEmail, LEmail.Text + LResumos.Text, LAgenteAnterior);
          LEmail.Clear;
          LResumos.Clear;
          LEmail.Add('<h3">Informamos que as seguintes empresas monitoradas tiveram alterações em suas informações comportamentais e/ou cadastrais.</h3>');
          for laco := 0 to LPlataformas.Count - 1 do
          begin
            LPlataformas.Posicao := laco;
            LEmail.Add('<h2>' + LPlataformas.Codigo + '</h2>');
            LEmail.AddStrings(LPlataformas.Plataforma.Mensagem);
            LResumos.Add('<hr><h2>' + LPlataformas.Codigo + '</h2>');
            LResumos.AddStrings(LPlataformas.Plataforma.Resumo);
          end;
          EnviarEmail('catenacci@creditbr.com.br,gustavo@creditbr.com.br,felipe.avelar@creditbr.com.br,walter@creditbr.com.br,assistentes@creditbr.com.br,risco@creditbr.com.br', LEmail.Text + LResumos.Text, 'Plataformas');
        end;
      finally
        Comunicacao.Free;
        Free;
        LResumos.Free;
        LEmail.Free;
      end;
    end;
  finally
    LPlataformas.Free;
    LRelatorio.Free;
    LParser.Free;
    LRelatoAnterior.Free;
    LRelato.Free;
    LArquivoAntigo.Free;
    LArquivo.Free;
    Serasa.Free;
    FConsultados.Free;
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

