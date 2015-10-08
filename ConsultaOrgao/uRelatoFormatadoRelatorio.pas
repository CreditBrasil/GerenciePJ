unit uRelatoFormatadoRelatorio;

interface

uses
  Classes, SysUtils, StringBuilder, uRelatoFormatadoModel, uDescobreEmailAgente;

type
  TRelatoFormatadoRelatorio = class(TObject)
  private
    function Cor(ACor, AEntrada: string): string;
  public
    function RelatorioDasDiferencas(const AResultadoDescobreEmailAgente: IResultadoDescobreEmailAgente; AAnterior,
      AAtual: TRelatoFormatadoModel; ALink: string): string;
    function RelatorioResumoDasDiferencas(const AResultadoDescobreEmailAgente: IResultadoDescobreEmailAgente; AAnterior,
      AAtual: TRelatoFormatadoModel; ALink: string): string;
    class function ResumoParaTipoSecao(AResumo: string): TRelatoFormatadoTipoSecao;
    class function Table: string;
    class function FimTable: string;
  end;

const
  RelatoFormatadoTipoSecaoTextoResumo: array [TRelatoFormatadoTipoSecao] of string = (
    '', //rfsPendenciasFinanceiras
    '', //rfsPefin
    '', //rfsRefin
    '', //rfsResumo
    'FALEN/RECUP/CONC          ', //rfsFalenRecupConc
    'DIVIDA VENCIDA            ', //rfsDividaVencida
    'ACAO JUDICIAL             ', //rfsAcaoJudicial
    'PROTESTO                  ', //rfsProtesto
    'CHEQUE                    ', //rfsCheque
    '', //rfsConcentre
    '' //rfsRecheque
    );

implementation

const
  GCor: array [Boolean, Boolean] of string = (('navy', 'navy'), ('red', 'rgb(0, 203, 57)'));
  GSinal: array [Boolean] of string = ('', '+');
  GDirecao: array [Boolean] of string = ('&darr;', '&uarr;');

{ TRelatoFormatadoRelatorio }

function TRelatoFormatadoRelatorio.Cor(ACor, AEntrada: string): string;
begin
  Result := Format('<span style="color:%s">%s</span>', [ACor, AEntrada]);
end;

class function TRelatoFormatadoRelatorio.FimTable: string;
begin
  Result := '</table></div>';
end;

function TRelatoFormatadoRelatorio.RelatorioDasDiferencas(
  const AResultadoDescobreEmailAgente: IResultadoDescobreEmailAgente; AAnterior, AAtual: TRelatoFormatadoModel;
  ALink: string): string;

  function Ocorrencia(ATexto: string; AOcorrenciasAnterior, AOcorrenciasAtual: Integer;
    AStringBuilder: TStringBuilder): TStringBuilder;
  begin
    AStringBuilder
      .AppendFormat(Cor(GCor[AOcorrenciasAnterior <> AOcorrenciasAtual, AOcorrenciasAnterior > AOcorrenciasAtual], ATexto), [AOcorrenciasAtual]);
    if AOcorrenciasAnterior <> AOcorrenciasAtual then
      AStringBuilder.AppendFormat(' anterior %d %s (%s%d)', [AOcorrenciasAnterior,
        GDirecao[AOcorrenciasAtual > AOcorrenciasAnterior], GSinal[AOcorrenciasAtual > AOcorrenciasAnterior],
        AOcorrenciasAtual - AOcorrenciasAnterior]);
    AStringBuilder
      .AppendLine;
    Result := AStringBuilder;
  end;

  function TotalDeOcorrencia(AOcorrenciasAnterior, AOcorrenciasAtual: Integer;
    AStringBuilder: TStringBuilder): TStringBuilder;
  begin
    Result := Ocorrencia('TOTAL DE OCORRENCIAS = %5d', AOcorrenciasAnterior, AOcorrenciasAtual, AStringBuilder);
  end;

  function Total(AValorAnterior, AValorAtual: Currency; AStringBuilder: TStringBuilder): TStringBuilder;
  begin
    AStringBuilder
      .AppendFormat(Cor(GCor[AValorAnterior <> AValorAtual, AValorAnterior > AValorAtual], 'VALOR TOTAL = %14s'), [FormatFloat(',0', AValorAtual)]);
    if AValorAnterior <> AValorAtual then
      AStringBuilder.AppendFormat(' anterior %s %s (%s%s)', [FormatFloat(',0', AValorAnterior),
        GDirecao[AValorAtual > AValorAnterior], GSinal[AValorAtual > AValorAnterior],
        FormatFloat(',0', AValorAtual - AValorAnterior)]);
    AStringBuilder
      .AppendLine;
    Result := AStringBuilder;
  end;

  function OcorrenciaRecheque(AOcorrenciasAnterior, AOcorrenciasAtual, AQuantidade: Integer;
    AStringBuilder: TStringBuilder): TStringBuilder;
  begin
    AStringBuilder
      .AppendFormat(Cor(GCor[AOcorrenciasAnterior <> AOcorrenciasAtual, AOcorrenciasAnterior > AOcorrenciasAtual],
        'TOTAL DE %3d OCORRENCIAS DE SUSTACAO DE CHEQUES NOS ULTIMOS SEIS MESES %2d ULT.:'), [AOcorrenciasAtual, AQuantidade]);
    if AOcorrenciasAnterior <> AOcorrenciasAtual then
      AStringBuilder.AppendFormat(' anterior %d %s (%s%d)', [AOcorrenciasAnterior,
        GDirecao[AOcorrenciasAtual > AOcorrenciasAnterior], GSinal[AOcorrenciasAtual > AOcorrenciasAnterior],
        AOcorrenciasAtual - AOcorrenciasAnterior]);
    AStringBuilder
      .AppendLine;
    Result := AStringBuilder;
  end;

  function TemResumo(AUltima: string; AUltimas: TStrings): Boolean;
  var
    laco: Integer;
  begin
    Result := False;
    for laco := 0 to AUltimas.Count - 1 do
      if SameText(Copy(AUltima, 7, 26), Copy(AUltimas[laco], 7, 26)) then
      begin
        Result := True;
        Break;
      end;
  end;

var
  LStringBuilder: TStringBuilder;
  laco: Integer;
  LSecaoDoResumo: TRelatoFormatadoTipoSecao;
  LVerde: Boolean;
begin
  LStringBuilder := TStringBuilder.Create;
  try
    LStringBuilder
      .AppendLine('<hr><p><strong>CNPJ na Serasa:</strong> ' + AAtual.CNPJ + '<br>')
      .AppendLine('<strong>CNPJ na Credit:</strong> ' + AResultadoDescobreEmailAgente.PesCNPJCPF + '<br>')
      .AppendLine('<strong>RAZÃO SOCIAL na Serasa:</strong> ' + AAtual.RazaoSocial + '<br>')
      .AppendLine('<strong>RAZÃO SOCIAL na Credit:</strong> ' + AResultadoDescobreEmailAgente.PesNomeCedente.Value + '<br>')
      .AppendLine('<strong>Relato completo:</strong> ' + ALink + '<br>')
      .AppendLine('<strong>Total Risco:</strong> ' + FormatFloat(',0.00', AResultadoDescobreEmailAgente.Risco.Value) + '<br>')
      .AppendLine(Cor(GCor[AResultadoDescobreEmailAgente.Vencido.Value >= 0.01, False],
        '<strong>Vencidos:</strong> ' + FormatFloat(',0.00', AResultadoDescobreEmailAgente.Vencido.Value)) + '<br>')
      .AppendLine(Cor(GCor[AResultadoDescobreEmailAgente.NegativaGrave.Value >= 0.01, False],
        '<strong>Negativa Grave:</strong> ' + FormatFloat(',0.00', AResultadoDescobreEmailAgente.NegativaGrave.Value)) + '</p>')
      .AppendLine('<pre>');
    if (AAtual.Secoes[rfsPefin].Ultimas.Count > 0) or (AAtual.Secoes[rfsRefin].Ultimas.Count > 0) or
      (AAtual.Secoes[rfsPendenciasFinanceiras].Ultimas.Count > 0) then
    begin
      LStringBuilder
        .AppendLine(Cor('blue', 'PENDENCIAS FINANCEIRAS'));
      if AAtual.Secoes[rfsPendenciasFinanceiras].Ultimas.Count = 0 then
        Ocorrencia('TOTAL DE %5d OCORRENCIAS.', AAnterior.Secoes[rfsPefin].TotalOcorrencias +
          AAnterior.Secoes[rfsRefin].TotalOcorrencias, AAtual.Secoes[rfsPefin].TotalOcorrencias +
          AAtual.Secoes[rfsRefin].TotalOcorrencias, LStringBuilder)
      else
      begin
        for laco := 0 to AAtual.Secoes[rfsPendenciasFinanceiras].Ultimas.Count - 1 do
          LStringBuilder.AppendLine(Cor(GCor[AAnterior.Secoes[rfsPendenciasFinanceiras].Ultimas.IndexOf(AAtual.Secoes[rfsPendenciasFinanceiras].Ultimas[laco]) = -1, False], AAtual.Secoes[rfsPendenciasFinanceiras].Ultimas[laco]));
        LStringBuilder.AppendLine('');
      end;
    end;
    if AAtual.Secoes[rfsPefin].Ultimas.Count > 0 then
    begin
      LStringBuilder
        .AppendLine('')
        .AppendLine(Cor('navy', 'PENDENCIA:PEFIN'));
      TotalDeOcorrencia(AAnterior.Secoes[rfsPefin].TotalOcorrencias, AAtual.Secoes[rfsPefin].TotalOcorrencias,
        LStringBuilder);
      Total(AAnterior.Secoes[rfsPefin].ValorTotal, AAtual.Secoes[rfsPefin].ValorTotal, LStringBuilder)
        .AppendLine(Cor('navy', 'OCORRENCIAS MAIS RECENTES (ATE 05)'))
        .AppendLine(Cor('navy', 'DATA       MODALIDADE   AVAL       VALOR CONTRATO         ORIGEM          LOCAL'));
      for laco := 0 to AAtual.Secoes[rfsPefin].Ultimas.Count - 1 do
        LStringBuilder.AppendLine(Cor(GCor[AAnterior.Secoes[rfsPefin].Ultimas.IndexOf(AAtual.Secoes[rfsPefin].Ultimas[laco]) = -1, AAnterior.Secoes[rfsPefin].ValorTotal > AAtual.Secoes[rfsPefin].ValorTotal], AAtual.Secoes[rfsPefin].Ultimas[laco]));
      LStringBuilder
        .AppendLine('')
    end;
    if AAtual.Secoes[rfsRefin].Ultimas.Count > 0 then
    begin
      LStringBuilder
        .AppendLine('')
        .AppendLine(Cor('navy', 'PENDENCIA:REFIN'));
      TotalDeOcorrencia(AAnterior.Secoes[rfsRefin].TotalOcorrencias, AAtual.Secoes[rfsRefin].TotalOcorrencias,
        LStringBuilder);
      Total(AAnterior.Secoes[rfsRefin].ValorTotal, AAtual.Secoes[rfsRefin].ValorTotal, LStringBuilder)
        .AppendLine(Cor('navy', 'OCORRENCIAS MAIS RECENTES (ATE 05)'))
        .AppendLine(Cor('navy', 'DATA       MODALIDADE   AVAL       VALOR CONTRATO         ORIGEM          LOCAL'));
      for laco := 0 to AAtual.Secoes[rfsRefin].Ultimas.Count - 1 do
        LStringBuilder.AppendLine(Cor(GCor[AAnterior.Secoes[rfsRefin].Ultimas.IndexOf(AAtual.Secoes[rfsRefin].Ultimas[laco]) = -1, AAnterior.Secoes[rfsRefin].ValorTotal > AAtual.Secoes[rfsRefin].ValorTotal], AAtual.Secoes[rfsRefin].Ultimas[laco]));
      LStringBuilder
        .AppendLine('')
    end;
    if (AAtual.Secoes[rfsResumo].Ultimas.Count > 0) or (AAnterior.Secoes[rfsResumo].Ultimas.Count > 0) then
    begin
      LStringBuilder
        .AppendLine(Cor('blue', 'RESUMO'))
        .AppendLine(Cor('navy', 'QTDE  DISCRIMINACAO              PERIODO     OCORRENCIA MAIS RECENTE'))
        .AppendLine(Cor('navy', '                                             VALOR          ORIGEM     AG/PRACA'));
      for laco := 0 to AAtual.Secoes[rfsResumo].Ultimas.Count - 1 do
      begin
        LSecaoDoResumo := ResumoParaTipoSecao(AAtual.Secoes[rfsResumo].Ultimas[laco]);
        LVerde := (LSecaoDoResumo <> TRelatoFormatadoTipoSecao(-1)) and (AAnterior.Secoes[LSecaoDoResumo].TotalOcorrencias > AAtual.Secoes[LSecaoDoResumo].TotalOcorrencias);
        LStringBuilder.AppendLine(Cor(GCor[AAnterior.Secoes[rfsResumo].Ultimas.IndexOf(AAtual.Secoes[rfsResumo].Ultimas[laco]) = -1, LVerde], AAtual.Secoes[rfsResumo].Ultimas[laco]));
      end;
      for laco := 0 to AAnterior.Secoes[rfsResumo].Ultimas.Count - 1 do
        if not TemResumo(AAnterior.Secoes[rfsResumo].Ultimas[laco], AAtual.Secoes[rfsResumo].Ultimas) then
          LStringBuilder.AppendLine(Format('<span style="color:rgb(0, 203, 57);text-decoration:line-through">%s</span>', [AAnterior.Secoes[rfsResumo].Ultimas[laco]]));
      if AAtual.Secoes[rfsResumo].Ultimas.Count > 0 then
        LStringBuilder
          .AppendLine('')
          .AppendLine(Cor('blue', 'OCORRENCIAS MAIS RECENTES (ATE 05)'));
      LStringBuilder
        .AppendLine('');
    end;
    if AAtual.Secoes[rfsFalenRecupConc].Ultimas.Count > 0 then
    begin
      LStringBuilder
        .AppendLine(Cor('blue', 'FALENCIA,RECUPERACAO JUDICIAL/EXTRAJUDICIAL E CONCORDATA'))
        .AppendLine(Cor('navy', 'DATA         TIPO                            ORIGEM          CIDADE          UF'));
      for laco := 0 to AAtual.Secoes[rfsFalenRecupConc].Ultimas.Count - 1 do
        LStringBuilder.AppendLine(Cor(GCor[AAnterior.Secoes[rfsFalenRecupConc].Ultimas.IndexOf(AAtual.Secoes[rfsFalenRecupConc].Ultimas[laco]) = -1, AAnterior.Secoes[rfsFalenRecupConc].TotalOcorrencias > AAtual.Secoes[rfsFalenRecupConc].TotalOcorrencias], AAtual.Secoes[rfsFalenRecupConc].Ultimas[laco]));
      TotalDeOcorrencia(AAnterior.Secoes[rfsFalenRecupConc].TotalOcorrencias, AAtual.Secoes[rfsFalenRecupConc].TotalOcorrencias,
        LStringBuilder)
        .AppendLine('');
    end;
    if AAtual.Secoes[rfsDividaVencida].Ultimas.Count > 0 then
    begin
      LStringBuilder
        .AppendLine(Cor('blue', 'DIVIDA VENCIDA'))
        .AppendLine(Cor('navy', 'DATA       MODALIDADE               VALOR TITULO          INST.COBRADORA  LOCAL'));
      for laco := 0 to AAtual.Secoes[rfsDividaVencida].Ultimas.Count - 1 do
        LStringBuilder.AppendLine(Cor(GCor[AAnterior.Secoes[rfsDividaVencida].Ultimas.IndexOf(AAtual.Secoes[rfsDividaVencida].Ultimas[laco]) = -1, AAnterior.Secoes[rfsDividaVencida].ValorTotal > AAtual.Secoes[rfsDividaVencida].ValorTotal], AAtual.Secoes[rfsDividaVencida].Ultimas[laco]));
      TotalDeOcorrencia(AAnterior.Secoes[rfsDividaVencida].TotalOcorrencias, AAtual.Secoes[rfsDividaVencida].TotalOcorrencias,
        LStringBuilder);
      Total(AAnterior.Secoes[rfsDividaVencida].ValorTotal, AAtual.Secoes[rfsDividaVencida].ValorTotal, LStringBuilder)
        .AppendLine('');
    end;
    if AAtual.Secoes[rfsAcaoJudicial].Ultimas.Count > 0 then
    begin
      LStringBuilder
        .AppendLine(Cor('blue', 'ACAO JUDICIAL'))
        .AppendLine(Cor('navy', 'DATA       NATUREZA            AVAL          VALOR DIST VARA CIDADE         UF'));
      for laco := 0 to AAtual.Secoes[rfsAcaoJudicial].Ultimas.Count - 1 do
        LStringBuilder.AppendLine(Cor(GCor[AAnterior.Secoes[rfsAcaoJudicial].Ultimas.IndexOf(AAtual.Secoes[rfsAcaoJudicial].Ultimas[laco]) = -1, AAnterior.Secoes[rfsAcaoJudicial].ValorTotal > AAtual.Secoes[rfsAcaoJudicial].ValorTotal], AAtual.Secoes[rfsAcaoJudicial].Ultimas[laco]));
      TotalDeOcorrencia(AAnterior.Secoes[rfsAcaoJudicial].TotalOcorrencias, AAtual.Secoes[rfsAcaoJudicial].TotalOcorrencias,
        LStringBuilder);
      Total(AAnterior.Secoes[rfsAcaoJudicial].ValorTotal, AAtual.Secoes[rfsAcaoJudicial].ValorTotal, LStringBuilder)
        .AppendLine('');
    end;
    if AAtual.Secoes[rfsProtesto].Ultimas.Count > 0 then
    begin
      LStringBuilder
        .AppendLine(Cor('blue', 'PROTESTO'))
        .AppendLine(Cor('navy', 'DATA                      VALOR CARTORIO CIDADE                            UF'));
      for laco := 0 to AAtual.Secoes[rfsProtesto].Ultimas.Count - 1 do
        LStringBuilder.AppendLine(Cor(GCor[AAnterior.Secoes[rfsProtesto].Ultimas.IndexOf(AAtual.Secoes[rfsProtesto].Ultimas[laco]) = -1, AAnterior.Secoes[rfsProtesto].ValorTotal > AAtual.Secoes[rfsProtesto].ValorTotal], AAtual.Secoes[rfsProtesto].Ultimas[laco]));
      TotalDeOcorrencia(AAnterior.Secoes[rfsProtesto].TotalOcorrencias, AAtual.Secoes[rfsProtesto].TotalOcorrencias,
        LStringBuilder);
      Total(AAnterior.Secoes[rfsProtesto].ValorTotal, AAtual.Secoes[rfsProtesto].ValorTotal, LStringBuilder)
        .AppendLine('');
    end;
    if AAtual.Secoes[rfsCheque].Ultimas.Count > 0 then
    begin
      LStringBuilder
        .AppendLine(Cor('blue', 'CHEQUE'))
        .AppendLine(Cor('navy', 'DATA       CHEQUE    AL  QTD          VALOR BANCO      AGEN CIDADE          UF'));
      for laco := 0 to AAtual.Secoes[rfsCheque].Ultimas.Count - 1 do
        LStringBuilder.AppendLine(Cor(GCor[AAnterior.Secoes[rfsCheque].Ultimas.IndexOf(AAtual.Secoes[rfsCheque].Ultimas[laco]) = -1, AAnterior.Secoes[rfsCheque].ValorTotal > AAtual.Secoes[rfsCheque].ValorTotal], AAtual.Secoes[rfsCheque].Ultimas[laco]));
      TotalDeOcorrencia(AAnterior.Secoes[rfsCheque].TotalOcorrencias, AAtual.Secoes[rfsCheque].TotalOcorrencias,
        LStringBuilder);
      Total(AAnterior.Secoes[rfsCheque].ValorTotal, AAtual.Secoes[rfsCheque].ValorTotal, LStringBuilder)
        .AppendLine('');
    end;
    if AAtual.Secoes[rfsRecheque].Ultimas.Count > 0 then
    begin
      LStringBuilder
        .AppendLine(Cor('blue', 'INFORMACOES DO RECHEQUE (CHEQUES EXTRAVIADOS/SUSTADOS)'));
      if (AAtual.Secoes[rfsRecheque].TotalOcorrencias <> 0) or (AAnterior.Secoes[rfsRecheque].TotalOcorrencias <> 0) then
        OcorrenciaRecheque(AAnterior.Secoes[rfsRecheque].TotalOcorrencias, AAtual.Secoes[rfsRecheque].TotalOcorrencias,
          AAtual.Secoes[rfsRecheque].Ultimas.Count, LStringBuilder);
      LStringBuilder
        .AppendLine(Cor('navy', 'DATA        BANCO         AG         CONTA  CH INICIAL   CH FINAL    MOTIVO'));
      for laco := 0 to AAtual.Secoes[rfsRecheque].Ultimas.Count - 1 do
        LStringBuilder.AppendLine(Cor(GCor[AAnterior.Secoes[rfsRecheque].Ultimas.IndexOf(AAtual.Secoes[rfsRecheque].Ultimas[laco]) = -1, AAnterior.Secoes[rfsRecheque].TotalOcorrencias > AAtual.Secoes[rfsRecheque].TotalOcorrencias], AAtual.Secoes[rfsRecheque].Ultimas[laco]));
    end;
    LStringBuilder
      .AppendLine('</pre>');
    Result := LStringBuilder.ToString;
  finally
    LStringBuilder.Free;
  end;
end;

function TRelatoFormatadoRelatorio.RelatorioResumoDasDiferencas(
  const AResultadoDescobreEmailAgente: IResultadoDescobreEmailAgente; AAnterior, AAtual: TRelatoFormatadoModel;
  ALink: string): string;
const
  LTR = '<tr style="font-size:10px; font-family:Helvetica;">';

  function TD(ATexto: string; ADiferenca: Boolean): string;
  const
    LColor: array [Boolean] of string = ('', 'background-color:#e8fffc; ');
  begin
    Result := Format('<td style="%spadding:4px; border:1px solid #000000; border-width:0px 0px 1px 1px; text-align:center;">%s</td>',
      [LColor[ADiferenca], ATexto]);
  end;

  function SerasaCompleto(ATipoSecao: TRelatoFormatadoTipoSecao; ATemValor: Boolean = True): string;
  var
    LOcorrenciasAtual: Integer;
    LValorAtual: Currency;
  begin
    LOcorrenciasAtual := AAtual.Secoes[ATipoSecao].TotalOcorrencias;
    LValorAtual := AAtual.Secoes[ATipoSecao].ValorTotal;
    if (LOcorrenciasAtual = 0) and (LValorAtual = 0) then
      Result := '&nbsp;'
    else
    begin
      Result := Format('%d', [LOcorrenciasAtual]);
      if ATemValor then
        Result := Format('%s<br>%s', [Result, FormatFloat(',0', LValorAtual)]);
    end;
  end;

  function Diferenca(ATipoSecao: TRelatoFormatadoTipoSecao; ATemValor: Boolean = True): string;
  var
    LOcorrenciasAnterior, LOcorrenciasAtual: Integer;
    LValorAnterior, LValorAtual: Currency;
  begin
    LOcorrenciasAnterior := AAnterior.Secoes[ATipoSecao].TotalOcorrencias;
    LOcorrenciasAtual := AAtual.Secoes[ATipoSecao].TotalOcorrencias;
    LValorAnterior := AAnterior.Secoes[ATipoSecao].ValorTotal;
    LValorAtual := AAtual.Secoes[ATipoSecao].ValorTotal;
    if LOcorrenciasAnterior = LOcorrenciasAtual then
      Result := '&nbsp;'
    else
    begin
      Result := Cor(GCor[LOcorrenciasAnterior <> LOcorrenciasAtual, LOcorrenciasAnterior > LOcorrenciasAtual],
        Format('%s%s%d',  [GDirecao[LOcorrenciasAtual > LOcorrenciasAnterior],
          GSinal[LOcorrenciasAtual > LOcorrenciasAnterior],
          LOcorrenciasAtual - LOcorrenciasAnterior]));
      if ATemValor and (TRue) then
        Result := Result + '<br>' + Cor(GCor[LOcorrenciasAnterior <> LOcorrenciasAtual, LOcorrenciasAnterior > LOcorrenciasAtual],
          Format('%s%s%s', [GDirecao[LValorAtual > LValorAnterior],
          GSinal[LValorAtual > LValorAnterior],
          FormatFloat(',0', LValorAtual - LValorAnterior)]));
    end;
  end;

begin
  Result := LTR + '<td rowspan="2" style="padding:4px; border:1px solid #000000; border-width:0px 0px 1px 1px;">' +
    AResultadoDescobreEmailAgente.PesNomeCedente.Value + ' - ' + AResultadoDescobreEmailAgente.PesCNPJCPF +
    '<br><strong>Total Risco: </strong>' + FormatFloat(',0.00', AResultadoDescobreEmailAgente.Risco.Value) +
    ' / ' + Cor(GCor[AResultadoDescobreEmailAgente.Vencido.Value >= 0.01, False],
    '<strong>Vencidos:</strong> ' + FormatFloat(',0.00', AResultadoDescobreEmailAgente.Vencido.Value)) +
    ' / ' + Cor(GCor[AResultadoDescobreEmailAgente.NegativaGrave.Value >= 0.01, False],
    '<strong>Negativa Grave:</strong> ' + FormatFloat(',0.00', AResultadoDescobreEmailAgente.NegativaGrave.Value)) +
    '</td>' +
    TD('Novo<br>Apontamento', True) +
    TD(Diferenca(rfsPefin), True) +
    TD(Diferenca(rfsRefin), True) +
    TD(Diferenca(rfsFalenRecupConc, False), True) +
    TD(Diferenca(rfsDividaVencida), True) +
    TD(Diferenca(rfsAcaoJudicial), True) +
    TD(Diferenca(rfsProtesto), True) +
    TD(Diferenca(rfsCheque), True) +
    TD(Diferenca(rfsRecheque, False), True) +
    '</tr>' + LTR +
    TD(ALink, False) +
    TD(SerasaCompleto(rfsPefin), False) +
    TD(SerasaCompleto(rfsRefin), False) +
    TD(SerasaCompleto(rfsFalenRecupConc, False), False) +
    TD(SerasaCompleto(rfsDividaVencida), False) +
    TD(SerasaCompleto(rfsAcaoJudicial), False) +
    TD(SerasaCompleto(rfsProtesto), False) +
    TD(SerasaCompleto(rfsCheque), False) +
    TD(SerasaCompleto(rfsRecheque, False), False) +
    '</tr>';
end;

class function TRelatoFormatadoRelatorio.ResumoParaTipoSecao(AResumo: string): TRelatoFormatadoTipoSecao;
var
  laco: TRelatoFormatadoTipoSecao;
begin
  Result := TRelatoFormatadoTipoSecao(-1);
  for laco := Low(TRelatoFormatadoTipoSecao) to High(TRelatoFormatadoTipoSecao) do
    if SameText(Copy(AResumo, 7, 26), RelatoFormatadoTipoSecaoTextoResumo[laco]) then
    begin
      Result := laco;
      Break;
    end;
end;

class function TRelatoFormatadoRelatorio.Table: string;
begin
  Result := '<div style="margin:0px;padding:0px; width:100%; box-shadow: 5px 5px 5px #888888; border:1px solid #000000; border-width:1px 1px 0px 0px;">' +
    '<table style="border-collapse: collapse; border-spacing: 0; width:100%; margin:0px;padding:0px;">' +
    '<tr style="background-color:#005fbf; font-size:12px; font-family:Helvetica; color:#ffffff;">' +
    '<th style="padding:4px; border:1px solid #000000; border-width:0px 0px 1px 1px;">Empresa</th>' +
    '<th style="border:1px solid #000000; border-width:0px 0px 1px 1px;">Situação</th>' +
    '<th style="border:1px solid #000000; border-width:0px 0px 1px 1px;">PEFIN</th>' +
    '<th style="border:1px solid #000000; border-width:0px 0px 1px 1px;">REFIN</th>' +
    '<th style="border:1px solid #000000; border-width:0px 0px 1px 1px;">Fal Rec Con</th>' +
    '<th style="border:1px solid #000000; border-width:0px 0px 1px 1px;">Divida</th>' +
    '<th style="border:1px solid #000000; border-width:0px 0px 1px 1px;">Ação</th>' +
    '<th style="border:1px solid #000000; border-width:0px 0px 1px 1px;">Protesto</th>' +
    '<th style="border:1px solid #000000; border-width:0px 0px 1px 1px;">Cheque</th>' +
    '<th style="border:1px solid #000000; border-width:0px 0px 1px 1px;">Recheque</th></tr>';
end;

end.
