unit uRelatoFormatadoRelatorio;

interface

uses
  SysUtils, StringBuilder, uRelatoFormatadoModel;

type
  TRelatoFormatadoRelatorio = class(TObject)
  private
    function Cor(ACor, AEntrada: string): string;
  public
    function RelatorioDasDiferencas(AAnterior, AAtual: TRelatoFormatadoModel; ALink: string): string;
  end;

implementation

{ TRelatoFormatadoRelatorio }

function TRelatoFormatadoRelatorio.Cor(ACor, AEntrada: string): string;
begin
  Result := Format('<span style="color:%s">%s</span>', [ACor, AEntrada]);
end;

function TRelatoFormatadoRelatorio.RelatorioDasDiferencas(AAnterior, AAtual: TRelatoFormatadoModel;
  ALink: string): string;
const
  LCor: array [Boolean, Boolean] of string = (('navy', 'navy'), ('red', 'rgb(0, 203, 57)'));
  LSinal: array [Boolean] of string = ('', '+');
  LDirecao: array [Boolean] of string = ('&darr;', '&uarr;');

  function Ocorrencia(ATexto: string; AOcorrenciasAnterior, AOcorrenciasAtual: Integer;
    AStringBuilder: TStringBuilder): TStringBuilder;
  begin
    AStringBuilder
      .AppendFormat(Cor(LCor[AOcorrenciasAnterior <> AOcorrenciasAtual, AOcorrenciasAnterior > AOcorrenciasAtual], ATexto), [AOcorrenciasAtual]);
    if AOcorrenciasAnterior <> AOcorrenciasAtual then
      AStringBuilder.AppendFormat(' anterior %d %s (%s%d)', [AOcorrenciasAnterior,
        LDirecao[AOcorrenciasAtual > AOcorrenciasAnterior], LSinal[AOcorrenciasAtual > AOcorrenciasAnterior],
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
      .AppendFormat(Cor(LCor[AValorAnterior <> AValorAtual, AValorAnterior > AValorAtual], 'VALOR TOTAL = %14s'), [FormatFloat(',0', AValorAtual)]);
    if AValorAnterior <> AValorAtual then
      AStringBuilder.AppendFormat(' anterior %s %s (%s%s)', [FormatFloat(',0', AValorAnterior),
        LDirecao[AValorAtual > AValorAnterior], LSinal[AValorAtual > AValorAnterior],
        FormatFloat(',0', AValorAtual - AValorAnterior)]);
    AStringBuilder
      .AppendLine;
    Result := AStringBuilder;
  end;

  function OcorrenciaRecheque(AOcorrenciasAnterior, AOcorrenciasAtual, AQuantidade: Integer;
    AStringBuilder: TStringBuilder): TStringBuilder;
  begin
    AStringBuilder
      .AppendFormat(Cor(LCor[AOcorrenciasAnterior <> AOcorrenciasAtual, AOcorrenciasAnterior > AOcorrenciasAtual],
        'TOTAL DE %3d OCORRENCIAS DE SUSTACAO DE CHEQUES NOS ULTIMOS SEIS MESES %2d ULT.:'), [AOcorrenciasAtual, AQuantidade]);
    if AOcorrenciasAnterior <> AOcorrenciasAtual then
      AStringBuilder.AppendFormat(' anterior %d %s (%s%d)', [AOcorrenciasAnterior,
        LDirecao[AOcorrenciasAtual > AOcorrenciasAnterior], LSinal[AOcorrenciasAtual > AOcorrenciasAnterior],
        AOcorrenciasAtual - AOcorrenciasAnterior]);
    AStringBuilder
      .AppendLine;
    Result := AStringBuilder;
  end;

var
  LStringBuilder: TStringBuilder;
  laco: Integer;
begin
  LStringBuilder := TStringBuilder.Create;
  try
    LStringBuilder
      .AppendLine('<hr><p><strong>CNPJ na Serasa:</strong> ' + AAtual.CNPJ + '<br>')
      .AppendLine('<strong>RAZÃO SOCIAL na Serasa:</strong> ' + AAtual.RazaoSocial + '<br>')
      .AppendLine('<strong>Relato completo:</strong> ' + ALink + '</p>')
      .AppendLine('<pre>');
    if (AAtual.Secoes[rfsPefin].Ultimas.Count > 0) or (AAtual.Secoes[rfsRefin].Ultimas.Count > 0) then
    begin
      LStringBuilder
        .AppendLine(Cor('blue', 'PENDENCIAS FINANCEIRAS'));
      Ocorrencia('TOTAL DE %5d OCORRENCIAS.', AAnterior.Secoes[rfsPefin].TotalOcorrencias +
        AAnterior.Secoes[rfsRefin].TotalOcorrencias, AAtual.Secoes[rfsPefin].TotalOcorrencias +
        AAtual.Secoes[rfsRefin].TotalOcorrencias, LStringBuilder);
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
        LStringBuilder.AppendLine(Cor(LCor[AAnterior.Secoes[rfsPefin].Ultimas.IndexOf(AAtual.Secoes[rfsPefin].Ultimas[laco]) = -1, AAnterior.Secoes[rfsPefin].ValorTotal > AAtual.Secoes[rfsPefin].ValorTotal], AAtual.Secoes[rfsPefin].Ultimas[laco]));
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
        LStringBuilder.AppendLine(Cor(LCor[AAnterior.Secoes[rfsRefin].Ultimas.IndexOf(AAtual.Secoes[rfsRefin].Ultimas[laco]) = -1, AAnterior.Secoes[rfsRefin].ValorTotal > AAtual.Secoes[rfsRefin].ValorTotal], AAtual.Secoes[rfsRefin].Ultimas[laco]));
      LStringBuilder
        .AppendLine('')
    end;
    if AAtual.Secoes[rfsResumo].Ultimas.Count > 0 then
    begin
      LStringBuilder
        .AppendLine(Cor('blue', 'RESUMO'))
        .AppendLine(Cor('navy', 'QTDE  DISCRIMINACAO              PERIODO     OCORRENCIA MAIS RECENTE'))
        .AppendLine(Cor('navy', '                                             VALOR          ORIGEM     AG/PRACA'));
      for laco := 0 to AAtual.Secoes[rfsResumo].Ultimas.Count - 1 do
        LStringBuilder.AppendLine(Cor(LCor[AAnterior.Secoes[rfsResumo].Ultimas.IndexOf(AAtual.Secoes[rfsResumo].Ultimas[laco]) = -1, False{*}], AAtual.Secoes[rfsResumo].Ultimas[laco]));
      LStringBuilder
        .AppendLine('')
        .AppendLine(Cor('blue', 'OCORRENCIAS MAIS RECENTES (ATE 05)'))
        .AppendLine('');
    end;
    if AAtual.Secoes[rfsFalenRecupConc].Ultimas.Count > 0 then
    begin
      LStringBuilder
        .AppendLine(Cor('blue', 'FALENCIA,RECUPERACAO JUDICIAL/EXTRAJUDICIAL E CONCORDATA'))
        .AppendLine(Cor('navy', 'DATA         TIPO                            ORIGEM          CIDADE          UF'));
      for laco := 0 to AAtual.Secoes[rfsFalenRecupConc].Ultimas.Count - 1 do
        LStringBuilder.AppendLine(Cor(LCor[AAnterior.Secoes[rfsFalenRecupConc].Ultimas.IndexOf(AAtual.Secoes[rfsFalenRecupConc].Ultimas[laco]) = -1, AAnterior.Secoes[rfsFalenRecupConc].TotalOcorrencias > AAtual.Secoes[rfsFalenRecupConc].TotalOcorrencias], AAtual.Secoes[rfsFalenRecupConc].Ultimas[laco]));
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
        LStringBuilder.AppendLine(Cor(LCor[AAnterior.Secoes[rfsDividaVencida].Ultimas.IndexOf(AAtual.Secoes[rfsDividaVencida].Ultimas[laco]) = -1, AAnterior.Secoes[rfsDividaVencida].ValorTotal > AAtual.Secoes[rfsDividaVencida].ValorTotal], AAtual.Secoes[rfsDividaVencida].Ultimas[laco]));
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
        LStringBuilder.AppendLine(Cor(LCor[AAnterior.Secoes[rfsAcaoJudicial].Ultimas.IndexOf(AAtual.Secoes[rfsAcaoJudicial].Ultimas[laco]) = -1, AAnterior.Secoes[rfsAcaoJudicial].ValorTotal > AAtual.Secoes[rfsAcaoJudicial].ValorTotal], AAtual.Secoes[rfsAcaoJudicial].Ultimas[laco]));
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
        LStringBuilder.AppendLine(Cor(LCor[AAnterior.Secoes[rfsProtesto].Ultimas.IndexOf(AAtual.Secoes[rfsProtesto].Ultimas[laco]) = -1, AAnterior.Secoes[rfsProtesto].ValorTotal > AAtual.Secoes[rfsProtesto].ValorTotal], AAtual.Secoes[rfsProtesto].Ultimas[laco]));
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
        LStringBuilder.AppendLine(Cor(LCor[AAnterior.Secoes[rfsCheque].Ultimas.IndexOf(AAtual.Secoes[rfsCheque].Ultimas[laco]) = -1, AAnterior.Secoes[rfsCheque].ValorTotal > AAtual.Secoes[rfsCheque].ValorTotal], AAtual.Secoes[rfsCheque].Ultimas[laco]));
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
        LStringBuilder.AppendLine(Cor(LCor[AAnterior.Secoes[rfsRecheque].Ultimas.IndexOf(AAtual.Secoes[rfsRecheque].Ultimas[laco]) = -1, AAnterior.Secoes[rfsRecheque].TotalOcorrencias > AAtual.Secoes[rfsRecheque].TotalOcorrencias], AAtual.Secoes[rfsRecheque].Ultimas[laco]));
    end;
    LStringBuilder
      .AppendLine('</pre>');
    Result := LStringBuilder.ToString;
  finally
    LStringBuilder.Free;
  end;
end;

end.
