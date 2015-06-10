unit uRelatoFormatadoParse;

interface

uses
  SysUtils, Classes, uRelatoFormatadoModel;

type
  TRelatoFormatadoTipoSecaoProcessosClass = class of TRelatoFormatadoTipoSecaoProcessos;

  TRelatoFormatadoTipoSecaoProcessos = class(TObject)
  public
    class function EDetalhe(AEntrada: string): Boolean; virtual;
  end;

  TRelatoFormatadoTipoSecaoProcessosResumo = class(TRelatoFormatadoTipoSecaoProcessos)
  public
    class function EDetalhe(AEntrada: string): Boolean; override;
  end;

  TRelatoFormatadoTipoSecaoConfiguracao = record
    Cabecalho: string;
    TemQuantidade: Boolean;
    Processos: TRelatoFormatadoTipoSecaoProcessosClass;
  end;

  TRelatoFormatadoParser = class(TObject)
  private
    function CabecalhoParaTipoSecao(ACabecalho: string): TRelatoFormatadoTipoSecao;
    function ParseCurrency(AEntrada: string): Currency;
    function ParseInteger(AEntrada: string): Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure TextoParaRelatoFormatadoModel(ALinhas: TStrings; ARelatoFormatadoModel: TRelatoFormatadoModel);
  end;

const
  SemTipoDeSecaoDefinida = TRelatoFormatadoTipoSecao(-1);
  RelatoFormatadoTipoSecaoConfiguracoes: array [TRelatoFormatadoTipoSecao] of TRelatoFormatadoTipoSecaoConfiguracao = (
    (//rfsPefin
      Cabecalho: 'PENDENCIA:PEFIN                                                                       ';
      TemQuantidade: True;
      Processos: TRelatoFormatadoTipoSecaoProcessos
    ),
    (//rfsRefin
      Cabecalho: 'PENDENCIA:REFIN                                                                       ';
      TemQuantidade: True;
      Processos: TRelatoFormatadoTipoSecaoProcessos
    ),
    (//rfsResumo
      Cabecalho: 'RESUMO                                                                                ';
      TemQuantidade: False;
      Processos: TRelatoFormatadoTipoSecaoProcessosResumo
    ),
    (//rfsFalenRecupConc
      Cabecalho: 'FALENCIA,RECUPERACAO JUDICIAL/EXTRAJUDICIAL E CONCORDATA                              ';
      TemQuantidade: True;
      Processos: TRelatoFormatadoTipoSecaoProcessos
    ),
    (//rfsDividaVencida
      Cabecalho: 'DIVIDA VENCIDA                                                                        ';
      TemQuantidade: True;
      Processos: TRelatoFormatadoTipoSecaoProcessos
    ),
    (//rfsAcaoJudicial
      Cabecalho: 'ACAO JUDICIAL                                                                         ';
      TemQuantidade: True;
      Processos: TRelatoFormatadoTipoSecaoProcessos
    ),
    (//rfsProtesto
      Cabecalho: 'PROTESTO                                                                              ';
      TemQuantidade: True;
      Processos: TRelatoFormatadoTipoSecaoProcessos
    ),
    (//rfsCheque
      Cabecalho: 'CHEQUE                                                                                ';
      TemQuantidade: True;
      Processos: TRelatoFormatadoTipoSecaoProcessos
    ),
    (//rfsConcentre
      Cabecalho: 'INFORMACOES DO CONCENTRE                                                              ';
      TemQuantidade: False;
      Processos: TRelatoFormatadoTipoSecaoProcessos
    ),
    (//rfsRecheque
      Cabecalho: 'INFORMACOES DO RECHEQUE (CHEQUES EXTRAVIADOS/SUSTADOS)                                ';
      TemQuantidade: True;
      Processos: TRelatoFormatadoTipoSecaoProcessos
    )
    );

implementation

{ TRelatoFormatadoTipoSecaoProcessos }

class function TRelatoFormatadoTipoSecaoProcessos.EDetalhe(AEntrada: string): Boolean;
var
  ALixo: TDateTime;
begin
  Result := TryStrToDate(Copy(AEntrada, 1, 10), ALixo) or (Copy(AEntrada, 1, 3) = '===');
end;

{ TRelatoFormatadoTipoSecaoProcessosResumo }

class function TRelatoFormatadoTipoSecaoProcessosResumo.EDetalhe(AEntrada: string): Boolean;
var
  ALixo: Integer;
begin
  Result := (TryStrToInt(Trim(Copy(AEntrada, 1, 5)), ALixo) and (Copy(AEntrada, 6, 1) = ' ')) or
    (Copy(AEntrada, 1, 3) = '===');
end;

{ TRelatoFormatadoParser }

function TRelatoFormatadoParser.CabecalhoParaTipoSecao(ACabecalho: string): TRelatoFormatadoTipoSecao;
var
  laco: TRelatoFormatadoTipoSecao;
begin
  Result := SemTipoDeSecaoDefinida;
  for laco := Low(TRelatoFormatadoTipoSecao) to High(TRelatoFormatadoTipoSecao) do
    if SameText(ACabecalho, RelatoFormatadoTipoSecaoConfiguracoes[laco].Cabecalho) then
    begin
      Result := laco;
      Break;
    end;
end;

constructor TRelatoFormatadoParser.Create;
begin

end;

destructor TRelatoFormatadoParser.Destroy;
begin

  inherited;
end;

function TRelatoFormatadoParser.ParseCurrency(AEntrada: string): Currency;
begin
  if not TryStrToCurr(StringReplace(Trim(AEntrada), '.', '', [rfReplaceAll]), Result) then
    Result := 0;
end;

function TRelatoFormatadoParser.ParseInteger(AEntrada: string): Integer;
begin
  Result := StrToIntDef(StringReplace(Trim(AEntrada), '.', '', [rfReplaceAll]), 0);
end;

procedure TRelatoFormatadoParser.TextoParaRelatoFormatadoModel(ALinhas: TStrings;
  ARelatoFormatadoModel: TRelatoFormatadoModel);
var
  laco: Integer;
  LSecaoAtual, LSecaoNova: TRelatoFormatadoTipoSecao;
  LEmitidoEmData, LEmitidoEmHora: TDateTime;
  LProximoNome: Boolean;
begin
  LSecaoAtual := SemTipoDeSecaoDefinida;
  ARelatoFormatadoModel.Clear;
  ARelatoFormatadoModel.EmitidoEm := Now;
  LProximoNome := False;
  for laco := 0 to ALinhas.Count - 1 do
  begin
    LSecaoNova := CabecalhoParaTipoSecao(ALinhas[laco]);
    if LSecaoNova <> SemTipoDeSecaoDefinida then
      LSecaoAtual := LSecaoNova
    else if LSecaoAtual <> SemTipoDeSecaoDefinida then
    begin
      if RelatoFormatadoTipoSecaoConfiguracoes[LSecaoAtual].TemQuantidade then
      begin
        if Pos('TOTAL DE OCORRENCIAS =', ALinhas[laco]) = 1 then
          ARelatoFormatadoModel[LSecaoAtual].TotalOcorrencias := ParseInteger(Copy(ALinhas[laco], 23, 64));
        if Pos('VALOR TOTAL =', ALinhas[laco]) = 1 then
          ARelatoFormatadoModel[LSecaoAtual].ValorTotal := ParseCurrency(Copy(ALinhas[laco], 14, 73));
        if (LSecaoAtual = rfsRecheque) and (Pos('TOTAL DE ', ALinhas[laco]) = 1) then
          ARelatoFormatadoModel[LSecaoAtual].TotalOcorrencias := ParseInteger(Copy(ALinhas[laco], 10, 3));
      end;
      if RelatoFormatadoTipoSecaoConfiguracoes[LSecaoAtual].Processos.EDetalhe(ALinhas[laco]) then
        ARelatoFormatadoModel[LSecaoAtual].Ultimas.Add(ALinhas[laco]);
    end
    else
      if (Pos('CONFIDENCIAL P/ ', ALinhas[laco]) = 1) and (Copy(ALinhas[laco], 51, 5) = 'DATA ') and
        (Copy(ALinhas[laco], 66, 6) = ' HORA ') and TryStrToDate(Copy(ALinhas[laco], 56, 10), LEmitidoEmData) and
        TryStrToTime(Copy(ALinhas[laco], 72, 8), LEmitidoEmHora) then
        ARelatoFormatadoModel.EmitidoEm := LEmitidoEmData + LEmitidoEmHora
      else if (Pos('CNPJ: ', ALinhas[laco]) = 1) then
      begin
        ARelatoFormatadoModel.CNPJ := Trim(Copy(ALinhas[laco], 7, 19));
        LProximoNome := True;
      end
      else if LProximoNome then
      begin
        ARelatoFormatadoModel.RazaoSocial := Trim(ALinhas[laco]);
        LProximoNome := False;
      end;
  end;
end;

end.
