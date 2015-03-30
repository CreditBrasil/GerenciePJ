unit DBConsultaCredito;

interface

uses
  SysUtils,
  Classes,
  FacMetodos,
  SerasaIP20,
  Serasa,
  SerasaComunicacao,
  //EquifaxFac,
  ConsultaCreditoDefinicoes,
  ConsultaCredito,
  uLogModelIntf,
  uLogControlIntf{,
  uValidacaoModelIntf,
  uValidacaoModelFactory,
  uValidacaoControlIntf,
  uValidacaoControlFactory},
  uActiveRecord,
  ServiceLocator{,
  uRelatoSegmentoModel,
  uRelatoSegmentoLinhaModel,
  uRelatoSegmentoBaseModel,
  uRelatoSegmento20_01_01_06Model,
  uRelatoSegmento20_01_01_09Model,
  uRelatoSegmento20_02_01_PrinFonModel,
  uRelatoSegmento20_02_01_03Model,
  uRelatoSegmento20_02_01_OcorModel,
  uRelatoSegmento20_02_01_PotComModel,
  uRelatoSegmento20_02_01_08Model,
  uRelatoSegmento_FornecedoresModel,
  uRelatoSegmento20_02_01_14Model,
  uRelatoSegmento20_03_01_01Model,
  uRelatoSegmento20_03_01_03Model,
  uRelatoSegmento20_03_01_02Model,
  uRelatoSegmento20_04_01_VlrFinModel,
  uRelatoSegmento20_04_02_02Model,
  uRelatoSegmento20_04_03_01Model,
  uRelatoSegmento20_04_08_01Model,
  uRelatoSegmento20_04_10_01Model,
  uRelatoSegmento20_07_01_RiskMesModel,
  uRelatoSegmento20_07_01_RiskModel,
  uRelatoSegmento20_04_02_01Model,
  uRelatoSegmento20_02_01_FonInfModel,
  uRelatoSegmento20_08_01_02Model,
  uCreditBureauModel,
  uCreditBureauLinhaModel,
  uCreditBureauLinhaSPCModel,
  uAcheiRechequeModel,
  uAcheiRechequeLinhaModel,
  uAcheiRechequeChequesModel,
  uAcheiRechequeLocalizacaoModel,
  uAcheiRechequeMensagemModel,
  uAcheiRechequeOcorrenciasModel,
  uAcheiRechequePendenciasModel,
  uAcheiRechequePessoaTipoModel,
  uAcheiRechequeRegConsultaModel,
  uAcheiRechequeRGModel,
  uAcheiRechequeSituacaoModel,
  uAcheiRechequeTelsAnterioresModel,
  uSigcadModel,
  SerasaB49C,
  uIniFilesModel,
  uRelatoModel,
  uConcentreModel,
  uRelatoSegmentoFatAutorModel,
  uRelatoSegmento20_01_01_14Model,
  uRelatoSegmento20_89_00_00Model,
  uRelatoSegmento20_89_01_01Model,
  uRelatoSegmento20_89_01_02Model,
  uRelatoSegmento20_89_01_03Model,
  uRelatoSegmento20_89_02_01Model,
  uRelatoSegmento20_89_02_02Model,
  uRelatoSegmento20_89_02_03Model,
  uRelatoSegmento20_89_02_04Model,
  uRelatoSegmento20_89_02_05Model,
  uRelatoSegmento20_89_02_06Model,
  uRelatoSegmento20_89_02_07Model,
  uRelatoSegmento20_89_02_08Model,
  uRelatoSegmento20_89_02_09Model,
  uRelatoSegmento20_89_02_10Model,
  uRelatoSegmento20_89_02_11Model},
  uNFConsultaSerasaModel;

type
  TRelatorioSerasa = class(TObject)
  public
    class function UltimaConsultaEm(ATipoRelatorio: Serasa.TTipoRelatorio; ACodigo: Integer;
      const AConnection: IActiveRecordConnection): TNullableDateTime; virtual; abstract;
  end;

  TClasseRelatorioSerasa = class of TRelatorioSerasa;

  TRelatorios = class(TObject)
  public
    {class function Arquivo(const Nome: string): string; overload;
    class function Arquivo(TipoRelatorio: TTipoRelatorio): string; overload;}
    class function Nome(TipoRelatorio: TTipoRelatorio): string;
    class procedure Nomes(Strings: TStrings); overload;
    class procedure Nomes(Strings: TStrings; TipoPessoa: TTipoPessoa); overload;
    class function Online(const Nome: string): Boolean; overload;
    class function Online(TipoRelatorio: TTipoRelatorio): Boolean; overload;
    {class function Tabela(const Nome: string): string; overload;
    class function Tabela(TipoRelatorio: TTipoRelatorio): string; overload;}
    class function TipoRelatorio(const Nome: string): TTipoRelatorio;
    class function Configuravel(const Nome: string): Boolean; overload;
    class function Configuravel(TipoRelatorio: TTipoRelatorio): Boolean; overload;
    class function TiposRelatorios(TipoPessoa: TTipoPessoa): TTiposRelatorios;
    class function TiposRelatoriosConfiguraveis: TTiposRelatorios;
    class function TiposRelatoriosOnline: TTiposRelatorios;
    class function PermiteRelatorio(TipoPessoa: TTipoPessoa;
      TipoRelatorio: TTipoRelatorio): Boolean; overload;
    class function PermiteRelatorio(TipoTitulo: string;
      TipoRelatorio: TTipoRelatorio): Boolean; overload;
    class function RelatorioSerasa(const Nome: string): TClasseRelatorioSerasa; overload;
    class function RelatorioSerasa(TipoRelatorio: TTipoRelatorio): TClasseRelatorioSerasa; overload;
  end;

  TDBCadastros = class(TCadastros)
  private
    //function GetTipoParaTabela(AClasse: TSeIP20_Detalhe): Integer;
  protected
    {procedure EquifaxConsultaEGrava(ARelatorioEquifax: TRelatorioEquifax; ACodigo: Integer;
      const ACnpjCpf: string); override;}
    //procedure PersisteAcheiRecheque; override;
    //procedure PersisteCreditBureau; override;
    procedure PersisteRelatoSegmento; override;
  public
    function PodeConsultar(const ACadastro: string; const ATipoConsulta: ConsultaCreditoDefinicoes.TTipoConsulta;
      const ALogControl: ILogControl): Boolean; override;
  end;

implementation

type
  TClasseSeIP20_DetalheArray = array [0..10] of TClasseSeIP20_Detalhe;
  PClasseSeIP20_DetalheArray = ^TClasseSeIP20_DetalheArray;

  IConsultaCredito = interface
    ['{57C42E71-2413-4313-83AD-3DD63D58096B}']
    function GetCadastro: string;
    function GetConnection: IActiveRecordConnection;
    procedure SetCadastro(const Value: string);
    procedure SetConnection(const AValue: IActiveRecordConnection);

    property Cadastro: string read GetCadastro write SetCadastro;
    property Connection: IActiveRecordConnection read GetConnection write SetConnection;
  end;

  TConsultaCredito = class(TInterfacedObject, IConsultaCredito)
  private
    FCadastro: string;
    FConnection: IActiveRecordConnection;
    function GetCadastro: string;
    function GetConnection: IActiveRecordConnection;
    procedure SetCadastro(const Value: string);
    procedure SetConnection(const AValue: IActiveRecordConnection);
  end;

  {TValidacaoPrazoValidadeConsultaSerasa = class(TValidacao)
  protected
    function IntValidar(const ADado: IUnknown; const ALogControl: ILogControl): Boolean; override;
  end;}

  {TValidacaoPrazoValidadeConsultaEquifax = class(TValidacao)
  protected
    function IntValidar(const ADado: IUnknown; const ALogControl: ILogControl): Boolean; override;
  end;}

  TRelatorioSerasaRelatoSegmento = class(TRelatorioSerasa)
  public
    class function UltimaConsultaEm(ATipoRelatorio: Serasa.TTipoRelatorio; ACodigo: Integer;
      const AConnection: IActiveRecordConnection): TNullableDateTime; override;
  end;

  {TRelatorioSerasaCreditBureau = class(TRelatorioSerasa)
  public
    class function UltimaConsultaEm(ATipoRelatorio: Serasa.TTipoRelatorio; ACodigo: Integer;
      const AConnection: IActiveRecordConnection): TNullableDateTime; override;
  end;

  TRelatorioSerasaRelato = class(TRelatorioSerasa)
  public
    class function UltimaConsultaEm(ATipoRelatorio: Serasa.TTipoRelatorio; ACodigo: Integer;
      const AConnection: IActiveRecordConnection): TNullableDateTime; override;
  end;

  TRelatorioSerasaConcentre = class(TRelatorioSerasa)
  public
    class function UltimaConsultaEm(ATipoRelatorio: Serasa.TTipoRelatorio; ACodigo: Integer;
      const AConnection: IActiveRecordConnection): TNullableDateTime; override;
  end;}

const
  LTipoRelatorioNome: array [TTipoRelatorio] of string = ('Relato Segmento'{,
    'Credit Bureau', 'Síntese Comportamental', 'Concentre', 'Achei-Recheque'},
    'Monitore');

  {LTipoRelatorioTabela: array [TTipoRelatorio] of string = ('RelatoSegmento',
    'CreditBureau', 'Relato', 'Concentre', 'AcheiRecheque', 'RelatoSegmento');}

  {LTipoRelatorioArquivo: array [TTipoRelatorio] of string = ('RelatoSeg.qrw',
    'CreditBureau.qrw', 'Relato.qrw', 'Concentre.qrw', 'AcheiRecheque.qrw',
    'RelatoSeg.qrw');}

  LRelatoriosSerasa: array [TTipoRelatorio] of TClasseRelatorioSerasa = (TRelatorioSerasaRelatoSegmento{,
    TRelatorioSerasaCreditBureau, TRelatorioSerasaRelato, TRelatorioSerasaConcentre, nil},
    TRelatorioSerasaRelatoSegmento);

  LTiposRelatoriosConfiguraveis: TTiposRelatorios = [trRelatoSegmento{, trCreditBureau}];

  LTiposRelatoriosOnLine: TTiposRelatorios = [trRelatoSegmento{, trCreditBureau,
    trAcheiRecheque}];

  LTiposRelatoriosPessoa: array [TTipoPessoa] of TTiposRelatorios = (
    [{trCreditBureau, trConcentre}],
    [trRelatoSegmento{, trSinteseComportamental, trConcentre}, trMonitore]);

{ TRelatorios }

{class function TRelatorios.Arquivo(const Nome: string): string;
begin
  Result := Arquivo(TipoRelatorio(Nome));
end;

class function TRelatorios.Arquivo(TipoRelatorio: TTipoRelatorio): string;
begin
  Result := LTipoRelatorioArquivo[TipoRelatorio];
end;}

class function TRelatorios.Configuravel(const Nome: string): Boolean;
begin
  Result := Configuravel(TipoRelatorio(Nome));
end;

class function TRelatorios.Configuravel(TipoRelatorio: TTipoRelatorio): Boolean;
begin
  Result := TipoRelatorio in TiposRelatoriosConfiguraveis;
end;

class function TRelatorios.Nome(TipoRelatorio: TTipoRelatorio): string;
begin
  Result := LTipoRelatorioNome[TipoRelatorio];
end;

class procedure TRelatorios.Nomes(Strings: TStrings);
var
  laco: TTipoRelatorio;
begin
  Strings.Clear;
  for laco := Low(TTipoRelatorio) to High(TTipoRelatorio) do
    Strings.Append(Nome(laco));
end;

class procedure TRelatorios.Nomes(Strings: TStrings; TipoPessoa: TTipoPessoa);
var
  laco: TTipoRelatorio;
begin
  Strings.Clear;
  for laco := Low(TTipoRelatorio) to High(TTipoRelatorio) do
    if laco in TiposRelatorios(TipoPessoa) then
      Strings.Append(Nome(laco));
end;

class function TRelatorios.Online(const Nome: string): Boolean;
begin
  Result := OnLine(TipoRelatorio(Nome));
end;

class function TRelatorios.Online(TipoRelatorio: TTipoRelatorio): Boolean;
begin
  Result := TipoRelatorio in LTiposRelatoriosOnline;
end;

class function TRelatorios.PermiteRelatorio(TipoPessoa: TTipoPessoa;
  TipoRelatorio: TTipoRelatorio): Boolean;
begin
  Result := TipoRelatorio in TiposRelatorios(TipoPessoa);
end;

class function TRelatorios.PermiteRelatorio(TipoTitulo: string;
  TipoRelatorio: TTipoRelatorio): Boolean;
begin
  {case TipoRelatorio of
    trAcheiRecheque: Result := TipoTitulo = 'CH';
  else}
    Result := False;
  //end;
end;

class function TRelatorios.RelatorioSerasa(const Nome: string): TClasseRelatorioSerasa;
begin
  Result := RelatorioSerasa(TipoRelatorio(Nome));
end;

class function TRelatorios.RelatorioSerasa(TipoRelatorio: TTipoRelatorio): TClasseRelatorioSerasa;
begin
  Result := LRelatoriosSerasa[TipoRelatorio];
end;

{class function TRelatorios.Tabela(const Nome: string): string;
begin
  Result := Tabela(TipoRelatorio(Nome));
end;

class function TRelatorios.Tabela(TipoRelatorio: TTipoRelatorio): string;
begin
  Result := LTipoRelatorioTabela[TipoRelatorio];
end;}

class function TRelatorios.TipoRelatorio(
  const Nome: string): TTipoRelatorio;
var
  laco: TTipoRelatorio;
begin
  Result := Low(TTipoRelatorio);
  for laco := Low(TTipoRelatorio) to High(TTipoRelatorio) do
    if Nome = LTipoRelatorioNome[laco] then
    begin
      Result := laco;
      Break;
    end;
end;

class function TRelatorios.TiposRelatorios(
  TipoPessoa: TTipoPessoa): TTiposRelatorios;
begin
  Result := LTiposRelatoriosPessoa[TipoPessoa];
end;

class function TRelatorios.TiposRelatoriosConfiguraveis: TTiposRelatorios;
begin
  Result := LTiposRelatoriosConfiguraveis;
end;

class function TRelatorios.TiposRelatoriosOnline: TTiposRelatorios;
begin
  Result := LTiposRelatoriosOnLine;
end;

{ TRelatorioSerasaRelatoSegmento }

class function TRelatorioSerasaRelatoSegmento.UltimaConsultaEm(ATipoRelatorio: Serasa.TTipoRelatorio; ACodigo: Integer;
  const AConnection: IActiveRecordConnection): TNullableDateTime;
begin
//  Result := (SL as IRelatoSegmentoModelService).SummaryUltimoEm(ACodigo, Ord(ATipoRelatorio), AConnection);
end;

{ TRelatorioSerasaCreditBureau }

{class function TRelatorioSerasaCreditBureau.UltimaConsultaEm(ATipoRelatorio: Serasa.TTipoRelatorio; ACodigo: Integer;
  const AConnection: IActiveRecordConnection): TNullableDateTime;
begin
  Result := (SL as ICreditBureauModelService).SummaryUltimoEm(ACodigo, AConnection);
end;}

{ TRelatorioSerasaRelato }

{class function TRelatorioSerasaRelato.UltimaConsultaEm(ATipoRelatorio: TTipoRelatorio; ACodigo: Integer;
  const AConnection: IActiveRecordConnection): TNullableDateTime;
begin
  Result := (SL as IRelatoModelService).SummaryUltimoEm(ACodigo, AConnection);
end;}

{ TRelatorioSerasaConcentre }

{class function TRelatorioSerasaConcentre.UltimaConsultaEm(ATipoRelatorio: TTipoRelatorio; ACodigo: Integer;
  const AConnection: IActiveRecordConnection): TNullableDateTime;
begin
  Result := (SL as IConcentreModelService).SummaryUltimoEm(ACodigo, AConnection);
end;}

{ TConsultaCredito }

function TConsultaCredito.GetCadastro: string;
begin
  Result := FCadastro;
end;

function TConsultaCredito.GetConnection: IActiveRecordConnection;
begin
  Result := FConnection;
end;

procedure TConsultaCredito.SetCadastro(const Value: string);
begin
  FCadastro := Value;
end;

procedure TConsultaCredito.SetConnection(const AValue: IActiveRecordConnection);
begin
  FConnection := AValue;
end;

{ TValidacaoPrazoValidadeConsultaSerasa }

(*function TValidacaoPrazoValidadeConsultaSerasa.IntValidar(
  const ADado: IUnknown; const ALogControl: ILogControl): Boolean;
var
  LLogItemNivel1: ILogItem;
  LConsultaCredito: IConsultaCredito;
  LSerasa: TSerasa;
  LPrazo: Integer;
  laco: Serasa.TTipoRelatorio;
  em: TDateTime;
  LLogItemNivel2: ILogItem;
  LSigcad: ISigcadModel;
  achou: Integer;
begin
  Result := False;
  achou := 0;
  LLogItemNivel1 := ALogControl.AddProcesso('Verificando consultas dentro do prazo de validade');
  try
    try
      if Supports(ADado, IConsultaCredito, LConsultaCredito) then
      begin
        LSigcad := (SL as ISigcadModelService).FindByCodigoOrDefault(LConsultaCredito.Cadastro,
          LConsultaCredito.Connection);
        ALogControl.AddSubInformacao(LLogItemNivel1, Format('Cadastro: %d - %s', [LConsultaCredito.Cadastro, LSigcad.Nome.Value]));
        LSerasa := CreateSerasa(LConsultaCredito.Connection);
        try
          LPrazo := LSerasa.PrazoConsulta;
        finally
          LSerasa.Free;
        end;
        if LPrazo > 0 then
        begin
          ALogControl.AddSubInformacao(LLogItemNivel1, Format('Prazo de validade: %d dias', [LPrazo]));
          for laco := Low(Serasa.TTipoRelatorio) to High(Serasa.TTipoRelatorio) do
          begin
            LLogItemNivel2 := nil;
            if laco in DBConsultaCredito.TRelatorios.TiposRelatorios(TTipoPessoa(LSigcad.PessoaJuridica)) then
            begin
              em := DBConsultaCredito.TRelatorios.RelatorioSerasa(laco).UltimaConsultaEm(laco, LConsultaCredito.Cadastro,
                LConsultaCredito.Connection).Value;
              if Trunc(em) >= (TSigcadModel.DatabaseDate(LConsultaCredito.Connection) - LPrazo) then
              begin
                if not Assigned(LLogItemNivel2) then
                  LLogItemNivel2 := ALogControl.AddSubErro(LLogItemNivel1, Format('Existem consultas dentro do prazo de validade', [LConsultaCredito.Cadastro]));
                ALogControl.AddSubInformacao(LLogItemNivel2, Format('%s (a %d dias) - %s', [DateTimeToStr(em),
                  Trunc(TSigcadModel.DatabaseDate(LConsultaCredito.Connection) - em), DBConsultaCredito.TRelatorios.Nome(laco)]));
                Inc(achou);
              end;
            end;
            if Assigned(LLogItemNivel2) then
              ALogControl.AddSubInformacao(LLogItemNivel1, 'O cadastro não será consultado. Uma nova consulta pode ser feita diretamente no cadastro de cedentes e sacados');
          end;
          if achou = 0 then
            Result := True;
        end
        else
          Result := True;
      end
      else
        raise EValidacao.DadoInvalido(Self, ADado);
    except
      on E: Exception do
      begin
        ALogControl.AddSubErro(LLogItemNivel1, '', E.Message);
      end;
    end;
  finally
    if Result then
      ALogControl.ProcessoOK(LLogItemNivel1)
    else
      ALogControl.ProcessoErro(LLogItemNivel1);
  end;
end;*)

{ TValidacaoPrazoValidadeConsultaEquifax }

(*function TValidacaoPrazoValidadeConsultaEquifax.IntValidar(
  const ADado: IUnknown; const ALogControl: ILogControl): Boolean;
var
  LLogItemNivel1: ILogItem;
  LConsultaCredito: IConsultaCredito;
  LRelatoriosEquifax: TRelatoriosEquifax;
  laco: TTipoRelatorioEquifax;
  em: TDateTime;
  LLogItemNivel2: ILogItem;
  LSigcad: ISigcadModel;
  LPrazoConsultaEquifax: Integer;
  achou: Integer;
begin
  Result := False;
  achou := 0;
  LLogItemNivel1 := ALogControl.AddProcesso('Verificando consultas dentro do prazo de validade');
  try
    try
      if Supports(ADado, IConsultaCredito, LConsultaCredito) then
      begin
        LSigcad := (SL as ISigcadModelService).FindByCodigoOrDefault(LConsultaCredito.Cadastro,
          LConsultaCredito.Connection);
        ALogControl.AddSubInformacao(LLogItemNivel1, Format('Cadastro: %d - %s', [LConsultaCredito.Cadastro, LSigcad.Nome.Value]));
        LPrazoConsultaEquifax := (SL as IIniFilesModelService).Get(0, wbaEquifaxPrazoConsulta, LConsultaCredito.Connection)
          .ValorAsInteger;
        if LPrazoConsultaEquifax > 0 then
        begin
          ALogControl.AddSubInformacao(LLogItemNivel1, Format('Prazo de validade: %d dias', [LPrazoConsultaEquifax]));
          LRelatoriosEquifax := TRelatoriosEquifax.Create;
          try
            LLogItemNivel2 := nil;
            for laco := Low(TTipoRelatorioEquifax) to High(TTipoRelatorioEquifax) do
            begin
              if TTipoPessoaEquifax(LSigcad.PessoaJuridica) in LRelatoriosEquifax[laco].TiposPessoa then
              begin
                em := LRelatoriosEquifax[laco].UltimaConsultaEm(LConsultaCredito.Cadastro, LConsultaCredito.Connection);
                if Trunc(em) >= (TSigcadModel.DatabaseDate(LConsultaCredito.Connection) - LPrazoConsultaEquifax) then
                begin
                  if not Assigned(LLogItemNivel2) then
                    LLogItemNivel2 := ALogControl.AddSubErro(LLogItemNivel1, Format('Existem consultas dentro do prazo de validade', [LConsultaCredito.Cadastro]));
                  ALogControl.AddSubInformacao(LLogItemNivel2, Format('%s (a %d dias) - %s', [DateTimeToStr(em),
                    Trunc(TSigcadModel.DatabaseDate(LConsultaCredito.Connection) - em), LRelatoriosEquifax[laco].Nome]));
                  Inc(achou);
                end;
              end;
            end;
            if achou > 0 then
              ALogControl.AddSubInformacao(LLogItemNivel1, 'O cadastro não será consultado. Uma nova consulta pode ser feita diretamente no cadastro de cedentes e sacados')
            else
              Result := True;
          finally
            LRelatoriosEquifax.Free;
          end;
        end
        else
          Result := True;
      end
      else
        raise EValidacao.DadoInvalido(Self, ADado);
    except
      on E: Exception do
      begin
        ALogControl.AddSubErro(LLogItemNivel1, '', E.Message);
      end;
    end;
  finally
    if Result then
      ALogControl.ProcessoOK(LLogItemNivel1)
    else
      ALogControl.ProcessoErro(LLogItemNivel1);
  end;
end;*)

{ TDBCadastros }

(*procedure TDBCadastros.EquifaxConsultaEGrava(ARelatorioEquifax: TRelatorioEquifax; ACodigo: Integer;
  const ACnpjCpf: string);
begin
  ARelatorioEquifax.ConsultaEGrava(ACodigo, ACnpjCpf, Connection);
end;*)

(*function TDBCadastros.GetTipoParaTabela(AClasse: TSeIP20_Detalhe): Integer;

  procedure PegaPosicao(const AArray: TClasseSeIP20_DetalheArray);
  var
    laco: Integer;
  begin
    for laco := 0 to Length(AArray) - 1 do
      if AClasse is AArray[laco] then
      begin
        Result := laco + 1;
        Break;
      end;
  end;

const
  Concentre: array [0..5] of TClasseSeIP20_Detalhe = (
    TSeIP20_04_02_03, TSeIP20_04_03_01, TSeIP20_04_04_01, TSeIP20_04_05_01,
    TSeIP20_04_06_01, TSeIP20_04_07_01);
  Fontes: array [0..1] of TClasseSeIP20_Detalhe = (
    TSeIP20_02_01_02, TSeIP20_02_01_13);
  PrincipaisFontes: array [0..1] of TClasseSeIP20_Detalhe = (
    TSeIP20_02_01_12, TSeIP20_02_01_01);
  Ocorrencias: array [0..8] of TClasseSeIP20_Detalhe = (
    TSeIP20_02_01_04, TSeIP20_02_01_05, TSeIP20_02_01_06, TSeIP20_02_01_15,
    TSeIP20_02_01_16, TSeIP20_02_01_20, TSeIP20_02_01_21, TSeIP20_02_01_25,
    TSeIP20_02_01_26);
  Fornecedores: array [0..3] of TClasseSeIP20_Detalhe = (
    TSeIP20_02_01_09, TSeIP20_02_01_10, TSeIP20_02_01_18, TSeIP20_02_01_19);
  PotencialCompra: array [0..2] of TClasseSeIP20_Detalhe = (
    TSeIP20_02_01_07, TSeIP20_02_01_17, TSeIP20_02_01_27);
  PefinRefin: array [0..1] of TClasseSeIP20_Detalhe = (
    TSeIP20_04_01_01, TSeIP20_04_01_02);
  Recheque: array [0..1] of TClasseSeIP20_Detalhe = (
    TSeIP20_04_08_01, TSeIP20_04_09_01);
  RiskScoringMeses: array [0..1] of TClasseSeIP20_Detalhe = (
    TSeIP20_07_01_01, TSeIP20_07_01_09);
  FatoresAutorizadores: array [0..3] of TClasseSeIP20_Detalhe = (
    TSeIP20_07_01_02, TSeIP20_07_01_03, TSeIP20_07_01_04, TSeIP20_07_01_05);
  InformacoesRiskScoring: array [0..1] of TClasseSeIP20_Detalhe = (
    TSeIP20_07_01_99, TSeIP20_07_01_06);
  Monitore: array [0..0] of TClasseSeIP20_Detalhe = (TSeIP20_08_01_02);
  Detalhes: array [0..11] of PClasseSeIP20_DetalheArray = (
    @Concentre,
    @Fontes,
    @PrincipaisFontes,
    @Ocorrencias,
    @Fornecedores,
    @PotencialCompra,
    @PefinRefin,
    @Recheque,
    @RiskScoringMeses,
    @FatoresAutorizadores,
    @InformacoesRiskScoring,
    @Monitore);
var
  laco: Integer;
begin
  Result := -1;
  for laco := 0 to Length(Detalhes) do
  begin
    PegaPosicao(Detalhes[laco]^);
    if Result >= 0 then
      Break;
  end;
end;*)

(*procedure TDBCadastros.PersisteAcheiRecheque;
const
  R0ou1: array [Boolean] of string = ('0', '1');
var
  laco: Integer;
  LAcheiRecheque: TAcheiRecheque;
  LAcheiRechequeModelService: IAcheiRechequeModelService;
  LAcheiRechequeModel: IAcheiRechequeModel;
  LAcheiRechequeLinha: IAcheiRechequeLinhaModel;
  LAcheiRechequeCheques: IAcheiRechequeChequesModel;
  LAcheiRechequeLocalizacao: IAcheiRechequeLocalizacaoModel;
  LAcheiRechequeMensagem: IAcheiRechequeMensagemModel;
  LAcheiRechequeOcorrencias: IAcheiRechequeOcorrenciasModel;
  LAcheiRechequePendencias: IAcheiRechequePendenciasModel;
  LAcheiRechequePessoaTipo: IAcheiRechequePessoaTipoModel;
  LAcheiRechequeRegConsulta: IAcheiRechequeRegConsultaModel;
  LAcheiRechequeRG: IAcheiRechequeRGModel;
  LAcheiRechequeSituacao: IAcheiRechequeSituacaoModel;
  LAcheiRechequeTelsAnteriores: IAcheiRechequeTelsAnterioresModel;
begin
  inherited;
  LAcheiRecheque := Cadastro.Titulos.Titulo.AcheiRecheque;
  LAcheiRechequeModelService := SL as IAcheiRechequeModelService;
  LAcheiRechequeModel := LAcheiRechequeModelService.FindByCMC7(Cadastro.Titulos.Titulo.Dados.Documento, Connection);
  if LAcheiRechequeModel = nil then
  begin
    LAcheiRechequeModel := TAcheiRechequeModel.Create(Connection);
    LAcheiRechequeModel.CMC7 := Cadastro.Titulos.Titulo.Dados.Documento;
  end;
  LAcheiRechequeModel.CNPJ := TAcheiRechequeModel.Nullable(Cadastro.CGC);

  for laco := 0 to LAcheiRecheque.FormatadoLinhasQuantidade - 1 do
  begin
    LAcheiRechequeLinha := LAcheiRechequeModel.AcheiRechequeLinhas.FindByCMC7AndLinhaOrNew(LAcheiRechequeModel.CMC7,
      LAcheiRecheque.FormatadoLinhas[laco].Linha, Connection);
    LAcheiRechequeLinha.LinhaEditada := TAcheiRechequeLinhaModel.Nullable(
      LAcheiRecheque.FormatadoLinhas[laco].LinhaEditada);
    LAcheiRechequeLinha.Alterado := True;
  end;
  with TIteratorAcheiRechequeLinhaModelDecorator.Decore(LAcheiRechequeModel.AcheiRechequeLinhas) do
    while Next do
      if (not CurrentItem.Novo) and (not CurrentItem.Alterado) then
        CurrentItem.MarkDeleted;

  for laco := 0 to LAcheiRecheque.PosicionalRechequeOutrasQuantidade - 1 do
  begin
    LAcheiRechequeCheques := LAcheiRechequeModel.AcheiRechequeChequess.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR26', laco, Connection);
    LAcheiRechequeCheques.Banco := LAcheiRecheque.PosicionalRechequeOutras[laco].Banco;
    LAcheiRechequeCheques.Agencia := LAcheiRecheque.PosicionalRechequeOutras[laco].Agencia;
    LAcheiRechequeCheques.Conta := LAcheiRecheque.PosicionalRechequeOutras[laco].Conta;
    LAcheiRechequeCheques.ChequeInicial := LAcheiRecheque.PosicionalRechequeOutras[laco].ChequeInicial;
    LAcheiRechequeCheques.ChequeFinal := LAcheiRecheque.PosicionalRechequeOutras[laco].ChequeFinal;
    LAcheiRechequeCheques.Motivo := LAcheiRecheque.PosicionalRechequeOutras[laco].Motivo;
    LAcheiRechequeCheques.Data := LAcheiRecheque.PosicionalRechequeOutras[laco].Data;
    LAcheiRechequeCheques.CodigoFonte := TAcheiRechequeChequesModel.Nullable(
      LAcheiRecheque.PosicionalRechequeOutras[laco].CodigoFonte);
    LAcheiRechequeCheques.CGC := NullString;
    LAcheiRechequeCheques.PessoaJuridica := NullString;
    LAcheiRechequeCheques.Alterado := True;
  end;
  for laco := 0 to LAcheiRecheque.PosicionalRechequeDetalhesQuantidade - 1 do
  begin
    LAcheiRechequeCheques := LAcheiRechequeModel.AcheiRechequeChequess.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR22', laco, Connection);
    LAcheiRechequeCheques.Banco := LAcheiRecheque.PosicionalRechequeDetalhes[laco].Banco;
    LAcheiRechequeCheques.Agencia := LAcheiRecheque.PosicionalRechequeDetalhes[laco].Agencia;
    LAcheiRechequeCheques.Conta := LAcheiRecheque.PosicionalRechequeDetalhes[laco].Conta;
    LAcheiRechequeCheques.ChequeInicial := LAcheiRecheque.PosicionalRechequeDetalhes[laco].ChequeInicial;
    LAcheiRechequeCheques.ChequeFinal := LAcheiRecheque.PosicionalRechequeDetalhes[laco].ChequeFinal;
    LAcheiRechequeCheques.Motivo := LAcheiRecheque.PosicionalRechequeDetalhes[laco].Motivo;
    LAcheiRechequeCheques.Data := LAcheiRecheque.PosicionalRechequeDetalhes[laco].DataHora;
    LAcheiRechequeCheques.CodigoFonte := TAcheiRechequeChequesModel.Nullable(
      LAcheiRecheque.PosicionalRechequeDetalhes[laco].CodigoFonte);
    LAcheiRechequeCheques.CGC := TAcheiRechequeChequesModel.Nullable(
      LAcheiRecheque.PosicionalRechequeDetalhes[laco].CGC);
    LAcheiRechequeCheques.PessoaJuridica := TAcheiRechequeChequesModel.Nullable(
      R0ou1[LAcheiRecheque.PosicionalRechequeDetalhes[laco].PessoaJuridica]);
    LAcheiRechequeCheques.Alterado := True;
  end;
  with TIteratorAcheiRechequeChequesModelDecorator.Decore(LAcheiRechequeModel.AcheiRechequeChequess) do
    while Next do
      if (not CurrentItem.Novo) and (not CurrentItem.Alterado) then
        CurrentItem.MarkDeleted;

  if Assigned(LAcheiRecheque.PosicionalAgenciaBancariaNome) then
  begin
    LAcheiRechequeLocalizacao := LAcheiRechequeModel.AcheiRechequeLocalizacoes.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR52_1', 1, Connection);
    LAcheiRechequeLocalizacao.Nome := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalAgenciaBancariaNome.Nome);
    LAcheiRechequeLocalizacao.Cidade := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalAgenciaBancariaNome.Cidade);
    LAcheiRechequeLocalizacao.UF := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalAgenciaBancariaNome.UF);
    LAcheiRechequeLocalizacao.Data := TAcheiRechequeLocalizacaoModel.NullableDateTime(
      LAcheiRecheque.PosicionalAgenciaBancariaNome.Data);
    LAcheiRechequeLocalizacao.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalTeleconfirmaBairroCidade) then
  begin
    LAcheiRechequeLocalizacao := LAcheiRechequeModel.AcheiRechequeLocalizacoes.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR32_2', 1, Connection);
    LAcheiRechequeLocalizacao.Bairro := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalTeleconfirmaBairroCidade.Bairro);
    LAcheiRechequeLocalizacao.Cidade := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalTeleconfirmaBairroCidade.Cidade);
    LAcheiRechequeLocalizacao.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalEnderecoDoCEP) then
  begin
    LAcheiRechequeLocalizacao := LAcheiRechequeModel.AcheiRechequeLocalizacoes.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR49', 1, Connection);
    LAcheiRechequeLocalizacao.Endereco := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalEnderecoDoCEP.Endereco);
    LAcheiRechequeLocalizacao.Bairro := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalEnderecoDoCEP.Bairro);
    LAcheiRechequeLocalizacao.Cidade := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalEnderecoDoCEP.Cidade);
    LAcheiRechequeLocalizacao.UF := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalEnderecoDoCEP.UF);
    LAcheiRechequeLocalizacao.CEP := TAcheiRechequeLocalizacaoModel.Nullable(
      R0ou1[LAcheiRecheque.PosicionalEnderecoDoCEP.CEPGenerico]);
    LAcheiRechequeLocalizacao.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalTeleconfirmaEndereco) then
  begin
    LAcheiRechequeLocalizacao := LAcheiRechequeModel.AcheiRechequeLocalizacoes.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR32_1', 1, Connection);
    LAcheiRechequeLocalizacao.Endereco := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalTeleconfirmaEndereco.Endereco);
    LAcheiRechequeLocalizacao.CEP := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalTeleconfirmaEndereco.CEP);
    LAcheiRechequeLocalizacao.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalAgenciaBancariaEndereco) then
  begin
    LAcheiRechequeLocalizacao := LAcheiRechequeModel.AcheiRechequeLocalizacoes.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR52_2', 1, Connection);
    LAcheiRechequeLocalizacao.Endereco := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalAgenciaBancariaEndereco.Endereco);
    LAcheiRechequeLocalizacao.DDDTelefone := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalAgenciaBancariaEndereco.DDDTelefone);
    LAcheiRechequeLocalizacao.Telefone := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalAgenciaBancariaEndereco.Telefone);
    LAcheiRechequeLocalizacao.DDDFax := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalAgenciaBancariaEndereco.DDDFax);
    LAcheiRechequeLocalizacao.Fax := TAcheiRechequeLocalizacaoModel.Nullable(
      LAcheiRecheque.PosicionalAgenciaBancariaEndereco.Fax);
    LAcheiRechequeLocalizacao.Alterado := True;
  end;
  with TIteratorAcheiRechequeLocalizacaoModelDecorator.Decore(LAcheiRechequeModel.AcheiRechequeLocalizacoes) do
    while Next do
      if (not CurrentItem.Novo) and (not CurrentItem.Alterado) then
        CurrentItem.MarkDeleted;

  for laco := 0 to LAcheiRecheque.PosicionalMensagensQuantidade - 1 do
  begin
    LAcheiRechequeMensagem := LAcheiRechequeModel.AcheiRechequeMensagens.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR90', laco, Connection);
    LAcheiRechequeMensagem.CodigoMensagem := TAcheiRechequeMensagemModel.Nullable(
      LAcheiRecheque.PosicionalMensagens[laco].CodigoMensagem);
    LAcheiRechequeMensagem.Mensagem := LAcheiRecheque.PosicionalMensagens[laco].Mensagem;
    LAcheiRechequeMensagem.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalConfirmeiMsgNomeMae) then
  begin
    LAcheiRechequeMensagem := LAcheiRechequeModel.AcheiRechequeMensagens.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR00_2', 1, Connection);
    LAcheiRechequeMensagem.Mensagem := LAcheiRecheque.PosicionalConfirmeiMsgNomeMae.Mensagem;
    LAcheiRechequeMensagem.Nome := TAcheiRechequeMensagemModel.Nullable(
      LAcheiRecheque.PosicionalConfirmeiMsgNomeMae.Nome);
    LAcheiRechequeMensagem.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalMensagemDaAgenciaBancaria) then
  begin
    LAcheiRechequeMensagem := LAcheiRechequeModel.AcheiRechequeMensagens.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR54', 1, Connection);
    LAcheiRechequeMensagem.Mensagem := LAcheiRecheque.PosicionalMensagemDaAgenciaBancaria.Mensagem;
    LAcheiRechequeMensagem.Data := TAcheiRechequeMensagemModel.NullableDateTime(
      LAcheiRecheque.PosicionalMensagemDaAgenciaBancaria.Data);
    LAcheiRechequeMensagem.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalRechequeOnlineParticipaDoRecheque) then
  begin
    LAcheiRechequeMensagem := LAcheiRechequeModel.AcheiRechequeMensagens.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR46', 1, Connection);
    LAcheiRechequeMensagem.Banco := TAcheiRechequeMensagemModel.Nullable(
      LAcheiRecheque.PosicionalRechequeOnlineParticipaDoRecheque.Banco);
    LAcheiRechequeMensagem.Participante := TAcheiRechequeMensagemModel.Nullable(
      R0ou1[LAcheiRecheque.PosicionalRechequeOnlineParticipaDoRecheque.Participante]);
    LAcheiRechequeMensagem.Mensagem := LAcheiRecheque.PosicionalRechequeOnlineParticipaDoRecheque.Mensagem;
    LAcheiRechequeMensagem.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalTeleconfirmaResposta) then
  begin
    LAcheiRechequeMensagem := LAcheiRechequeModel.AcheiRechequeMensagens.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR34', 1, Connection);
    LAcheiRechequeMensagem.CodigoIndicador := TAcheiRechequeMensagemModel.Nullable(
      LAcheiRecheque.PosicionalTeleconfirmaResposta.CodigoIndicador);
    LAcheiRechequeMensagem.Indicador := TAcheiRechequeMensagemModel.Nullable(
      LAcheiRecheque.PosicionalTeleconfirmaResposta.Indicador);
    LAcheiRechequeMensagem.Mensagem := LAcheiRecheque.PosicionalTeleconfirmaResposta.Mensagem;
    LAcheiRechequeMensagem.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalChequesSemFundoCCF_BACENNadaConsta) then
  begin
    LAcheiRechequeMensagem := LAcheiRechequeModel.AcheiRechequeMensagens.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR20', 1, Connection);
    LAcheiRechequeMensagem.Mensagem := LAcheiRecheque.PosicionalChequesSemFundoCCF_BACENNadaConsta.Mensagem;
    LAcheiRechequeMensagem.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalConfirmeiNadaConsta) then
  begin
    LAcheiRechequeMensagem := LAcheiRechequeModel.AcheiRechequeMensagens.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR02', 1, Connection);
    LAcheiRechequeMensagem.Mensagem := LAcheiRecheque.PosicionalConfirmeiNadaConsta.Mensagem;
    LAcheiRechequeMensagem.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalRechequeOutrasNadaConsta) then
  begin
    LAcheiRechequeMensagem := LAcheiRechequeModel.AcheiRechequeMensagens.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR28', 1, Connection);
    LAcheiRechequeMensagem.Mensagem := LAcheiRecheque.PosicionalRechequeOutrasNadaConsta.Mensagem;
    LAcheiRechequeMensagem.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalRechequeDetalhesNadaConsta) then
  begin
    LAcheiRechequeMensagem := LAcheiRechequeModel.AcheiRechequeMensagens.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR24', 1, Connection);
    LAcheiRechequeMensagem.Mensagem := LAcheiRecheque.PosicionalRechequeDetalhesNadaConsta.Mensagem;
    LAcheiRechequeMensagem.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalChequesSemFundoVarejoNadaConsta) then
  begin
    LAcheiRechequeMensagem := LAcheiRechequeModel.AcheiRechequeMensagens.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR16', 1, Connection);
    LAcheiRechequeMensagem.Mensagem := LAcheiRecheque.PosicionalChequesSemFundoVarejoNadaConsta.Mensagem;
    LAcheiRechequeMensagem.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalPendenciasInternasNadaConsta) then
  begin
    LAcheiRechequeMensagem := LAcheiRechequeModel.AcheiRechequeMensagens.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR06', 1, Connection);
    LAcheiRechequeMensagem.Mensagem := LAcheiRecheque.PosicionalPendenciasInternasNadaConsta.Mensagem;
    LAcheiRechequeMensagem.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalMensagemDoCep) then
  begin
    LAcheiRechequeMensagem := LAcheiRechequeModel.AcheiRechequeMensagens.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR50', 1, Connection);
    LAcheiRechequeMensagem.Mensagem := LAcheiRecheque.PosicionalMensagemDoCep.Mensagem;
    LAcheiRechequeMensagem.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalTelefonesAnterioresConsultadosNadaConsta) then
  begin
    LAcheiRechequeMensagem := LAcheiRechequeModel.AcheiRechequeMensagens.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR42', 1, Connection);
    LAcheiRechequeMensagem.Mensagem := LAcheiRecheque.PosicionalTelefonesAnterioresConsultadosNadaConsta.Mensagem;
    LAcheiRechequeMensagem.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalRegistroDeConsultasNadaConsta) then
  begin
    LAcheiRechequeMensagem := LAcheiRechequeModel.AcheiRechequeMensagens.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR38', 1, Connection);
    LAcheiRechequeMensagem.Mensagem := LAcheiRecheque.PosicionalRegistroDeConsultasNadaConsta.Mensagem;
    LAcheiRechequeMensagem.Alterado := True;
  end;
  with TIteratorAcheiRechequeMensagemModelDecorator.Decore(LAcheiRechequeModel.AcheiRechequeMensagens) do
    while Next do
      if (not CurrentItem.Novo) and (not CurrentItem.Alterado) then
        CurrentItem.MarkDeleted;

  if Assigned(LAcheiRecheque.PosicionalChequesSemFundoCCF_BACEN) then
  begin
    LAcheiRechequeOcorrencias := LAcheiRechequeModel.AcheiRechequeOcorrenciass.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR18', 1, Connection);
    LAcheiRechequeOcorrencias.Quantidade := LAcheiRecheque.PosicionalChequesSemFundoCCF_BACEN.Quantidade;
    LAcheiRechequeOcorrencias.DataPrimeiraOcorrencia := TAcheiRechequeOcorrenciasModel.NullableDateTime(
      LAcheiRecheque.PosicionalChequesSemFundoCCF_BACEN.DataPrimeiraOcorrencia);
    LAcheiRechequeOcorrencias.DataUltimaOcorrencia := TAcheiRechequeOcorrenciasModel.NullableDateTime(
      LAcheiRecheque.PosicionalChequesSemFundoCCF_BACEN.DataUltimaOcorrencia);
    LAcheiRechequeOcorrencias.Banco := TAcheiRechequeOcorrenciasModel.Nullable(
      LAcheiRecheque.PosicionalChequesSemFundoCCF_BACEN.Banco);
    LAcheiRechequeOcorrencias.Agencia := TAcheiRechequeOcorrenciasModel.Nullable(
      LAcheiRecheque.PosicionalChequesSemFundoCCF_BACEN.Agencia);
    LAcheiRechequeOcorrencias.Nome := TAcheiRechequeOcorrenciasModel.Nullable(
      LAcheiRecheque.PosicionalChequesSemFundoCCF_BACEN.Nome);
    LAcheiRechequeOcorrencias.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalChequesSemFundoVarejo) then
  begin
    LAcheiRechequeOcorrencias := LAcheiRechequeModel.AcheiRechequeOcorrenciass.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR14', 1, Connection);
    LAcheiRechequeOcorrencias.Quantidade := LAcheiRecheque.PosicionalChequesSemFundoVarejo.Quantidade;
    LAcheiRechequeOcorrencias.Data := TAcheiRechequeOcorrenciasModel.NullableDateTime(
      LAcheiRecheque.PosicionalChequesSemFundoVarejo.Data);
    LAcheiRechequeOcorrencias.Nome := TAcheiRechequeOcorrenciasModel.Nullable(
      LAcheiRecheque.PosicionalChequesSemFundoVarejo.Nome);
    LAcheiRechequeOcorrencias.Banco := TAcheiRechequeOcorrenciasModel.Nullable(
      LAcheiRecheque.PosicionalChequesSemFundoVarejo.Banco);
    LAcheiRechequeOcorrencias.Agencia := TAcheiRechequeOcorrenciasModel.Nullable(
      LAcheiRecheque.PosicionalChequesSemFundoVarejo.Agencia);
    LAcheiRechequeOcorrencias.Origem := TAcheiRechequeOcorrenciasModel.Nullable(
      LAcheiRecheque.PosicionalChequesSemFundoVarejo.Origem);
    LAcheiRechequeOcorrencias.CodigoEmbratel := TAcheiRechequeOcorrenciasModel.Nullable(
      LAcheiRecheque.PosicionalChequesSemFundoVarejo.CodigoEmbratel);
    LAcheiRechequeOcorrencias.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalPendenciasInternasQuantidade) then
  begin
    LAcheiRechequeOcorrencias := LAcheiRechequeModel.AcheiRechequeOcorrenciass.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR05', 1, Connection);
    LAcheiRechequeOcorrencias.Quantidade := LAcheiRecheque.PosicionalPendenciasInternasQuantidade.Quantidade;
    LAcheiRechequeOcorrencias.DataPrimeiraOcorrencia := TAcheiRechequeOcorrenciasModel.NullableDateTime(
      LAcheiRecheque.PosicionalPendenciasInternasQuantidade.DataPrimeiraOcorrencia);
    LAcheiRechequeOcorrencias.DataUltimaOcorrencia := TAcheiRechequeOcorrenciasModel.NullableDateTime(
      LAcheiRecheque.PosicionalPendenciasInternasQuantidade.DataUltimaOcorrencia);
    LAcheiRechequeOcorrencias.Alterado := True;
  end;
  with TIteratorAcheiRechequeOcorrenciasModelDecorator.Decore(LAcheiRechequeModel.AcheiRechequeOcorrenciass) do
    while Next do
      if (not CurrentItem.Novo) and (not CurrentItem.Alterado) then
        CurrentItem.MarkDeleted;

  if Assigned(LAcheiRecheque.PosicionalPendenciasInternasMaisRecente) then
  begin
    LAcheiRechequePendencias := LAcheiRechequeModel.AcheiRechequePendenciass.FindByCMC7AndLinhaOrNew(
      LAcheiRechequeModel.CMC7{, 'AR04'}, 1, Connection);
    LAcheiRechequePendencias.Data := LAcheiRecheque.PosicionalPendenciasInternasMaisRecente.Data;
    LAcheiRechequePendencias.Modalidade := LAcheiRecheque.PosicionalPendenciasInternasMaisRecente.Modalidade;
    LAcheiRechequePendencias.Avalista := R0ou1[LAcheiRecheque.PosicionalPendenciasInternasMaisRecente.Avalista];
    LAcheiRechequePendencias.CodigoMoeda := LAcheiRecheque.PosicionalPendenciasInternasMaisRecente.CodigoMoeda;
    LAcheiRechequePendencias.Moeda := LAcheiRecheque.PosicionalPendenciasInternasMaisRecente.Moeda;
    LAcheiRechequePendencias.Valor := LAcheiRecheque.PosicionalPendenciasInternasMaisRecente.Valor;
    LAcheiRechequePendencias.Contrato := LAcheiRecheque.PosicionalPendenciasInternasMaisRecente.Contrato;
    LAcheiRechequePendencias.Origem := LAcheiRecheque.PosicionalPendenciasInternasMaisRecente.Origem;
    LAcheiRechequePendencias.CodigoEmbratel := LAcheiRecheque.PosicionalPendenciasInternasMaisRecente.CodigoEmbratel;
    LAcheiRechequePendencias.Alterado := True;
  end;
  with TIteratorAcheiRechequePendenciasModelDecorator.Decore(LAcheiRechequeModel.AcheiRechequePendenciass) do
    while Next do
      if (not CurrentItem.Novo) and (not CurrentItem.Alterado) then
        CurrentItem.MarkDeleted;

  if Assigned(LAcheiRecheque.PosicionalTeleconfirmaAssinante) then
  begin
    LAcheiRechequePessoaTipo := LAcheiRechequeModel.AcheiRechequePessoasTipo.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR30', 1, Connection);
    LAcheiRechequePessoaTipo.Confere := TAcheiRechequePessoaTipoModel.Nullable(
      R0ou1[LAcheiRecheque.PosicionalTeleconfirmaAssinante.Confere]);
    LAcheiRechequePessoaTipo.Nome := LAcheiRecheque.PosicionalTeleconfirmaAssinante.Nome;
    LAcheiRechequePessoaTipo.CodigoTipoPessoa := LAcheiRecheque.PosicionalTeleconfirmaAssinante.CodigoTipoPessoa;
    LAcheiRechequePessoaTipo.TipoPessoa := LAcheiRecheque.PosicionalTeleconfirmaAssinante.TipoPessoa;
    LAcheiRechequePessoaTipo.CodigoClasse := TAcheiRechequePessoaTipoModel.Nullable(
      LAcheiRecheque.PosicionalTeleconfirmaAssinante.CodigoClasse);
    LAcheiRechequePessoaTipo.Classe := TAcheiRechequePessoaTipoModel.Nullable(
      LAcheiRecheque.PosicionalTeleconfirmaAssinante.Classe);
    LAcheiRechequePessoaTipo.Data := LAcheiRecheque.PosicionalTeleconfirmaAssinante.Data;
    LAcheiRechequePessoaTipo.Alterado := True;
  end;
  if Assigned(LAcheiRecheque.PosicionalRechequeOnlineSituacaoContaCorrente) then
  begin
    LAcheiRechequePessoaTipo := LAcheiRechequeModel.AcheiRechequePessoasTipo.FindByCMC7AndTipoAndLinhaOrNew(
      LAcheiRechequeModel.CMC7, 'AR44_1', 1, Connection);
    LAcheiRechequePessoaTipo.Mensagem := TAcheiRechequePessoaTipoModel.Nullable(
      LAcheiRecheque.PosicionalRechequeOnlineSituacaoContaCorrente.Mensagem);
    LAcheiRechequePessoaTipo.Data := LAcheiRecheque.PosicionalRechequeOnlineSituacaoContaCorrente.Data;
    LAcheiRechequePessoaTipo.CodigoTipoPessoa :=
      LAcheiRecheque.PosicionalRechequeOnlineSituacaoContaCorrente.CodigoTipoPessoa;
    LAcheiRechequePessoaTipo.TipoPessoa := LAcheiRecheque.PosicionalRechequeOnlineSituacaoContaCorrente.TipoPessoa;
    LAcheiRechequePessoaTipo.Cgc := TAcheiRechequePessoaTipoModel.Nullable(
      LAcheiRecheque.PosicionalRechequeOnlineSituacaoContaCorrente.CGC);
    LAcheiRechequePessoaTipo.Nome := LAcheiRecheque.PosicionalRechequeOnlineSituacaoContaCorrente.Nome;
    LAcheiRechequePessoaTipo.Alterado := True;
  end;
  with TIteratorAcheiRechequePessoaTipoModelDecorator.Decore(LAcheiRechequeModel.AcheiRechequePessoasTipo) do
    while Next do
      if (not CurrentItem.Novo) and (not CurrentItem.Alterado) then
        CurrentItem.MarkDeleted;

  if Assigned(LAcheiRecheque.PosicionalRegistroDeConsultas) then
  begin
    //'AR36'
    LAcheiRechequeRegConsulta := LAcheiRechequeModel.AcheiRechequeRegConsulta;
    LAcheiRechequeRegConsulta.DataEmissaoPrimeiroCheque :=
      LAcheiRecheque.PosicionalRegistroDeConsultas.DataEmissaoPrimeiroCheque;
    LAcheiRechequeRegConsulta.DataEmissaoUltimoCheque :=
      LAcheiRecheque.PosicionalRegistroDeConsultas.DataEmissaoUltimoCheque;
    LAcheiRechequeRegConsulta.QuantidadeAPrazo :=
      LAcheiRecheque.PosicionalRegistroDeConsultas.QuantidadeAPrazo;
    LAcheiRechequeRegConsulta.QuantidadeAPrazo30Dias :=
      LAcheiRecheque.PosicionalRegistroDeConsultas.QuantidadeAPrazo30Dias;
    LAcheiRechequeRegConsulta.QuantidadeAPrazoEntre31E60Dias :=
      LAcheiRecheque.PosicionalRegistroDeConsultas.QuantidadeAPrazoEntre31E60Dias;
    LAcheiRechequeRegConsulta.QuantidadeAPrazoEntre61E90Dias :=
      LAcheiRecheque.PosicionalRegistroDeConsultas.QuantidadeAPrazoEntre61E90Dias;
    LAcheiRechequeRegConsulta.QuantidadeAVista15Dias :=
      LAcheiRecheque.PosicionalRegistroDeConsultas.QuantidadeAVista15Dias;
  end;

  if Assigned(LAcheiRecheque.PosicionalRechequeOnlineDCTOIdentificacao) then
  begin
    //'AR44_2'
    LAcheiRechequeRG := LAcheiRechequeModel.AcheiRechequeRG;
    LAcheiRechequeRG.Data := LAcheiRecheque.PosicionalRechequeOnlineDCTOIdentificacao.Data;
    LAcheiRechequeRG.Numero := LAcheiRecheque.PosicionalRechequeOnlineDCTOIdentificacao.Numero;
    LAcheiRechequeRG.OrgaoEmissor := LAcheiRecheque.PosicionalRechequeOnlineDCTOIdentificacao.OrgaoEmissor;
    LAcheiRechequeRG.RG := LAcheiRecheque.PosicionalRechequeOnlineDCTOIdentificacao.RG;
    LAcheiRechequeRG.UF := LAcheiRecheque.PosicionalRechequeOnlineDCTOIdentificacao.UF;
  end;

  if Assigned(LAcheiRecheque.PosicionalConfirmeiIdentificacao) then
  begin
    LAcheiRechequeSituacao := LAcheiRechequeModel.AcheiRechequeSituacoes.FindByCMC7AndLinhaOrNew(
      LAcheiRechequeModel.CMC7{, 'AR00_1'}, 1, Connection);
    LAcheiRechequeSituacao.CodigoSituacao := LAcheiRecheque.PosicionalConfirmeiIdentificacao.CodigoSituacao;
    LAcheiRechequeSituacao.Data := LAcheiRecheque.PosicionalConfirmeiIdentificacao.Data;
    LAcheiRechequeSituacao.DataSituacao := LAcheiRecheque.PosicionalConfirmeiIdentificacao.DataSituacao;
    LAcheiRechequeSituacao.Nome := LAcheiRecheque.PosicionalConfirmeiIdentificacao.Nome;
    LAcheiRechequeSituacao.Situacao := LAcheiRecheque.PosicionalConfirmeiIdentificacao.Situacao;
    LAcheiRechequeSituacao.Alterado := True;
  end;
  with TIteratorAcheiRechequeSituacaoModelDecorator.Decore(LAcheiRechequeModel.AcheiRechequeSituacoes) do
    while Next do
      if (not CurrentItem.Novo) and (not CurrentItem.Alterado) then
        CurrentItem.MarkDeleted;

  if Assigned(LAcheiRecheque.PosicionalTelefonesAnterioresConsultados) then
    for laco := 0 to LAcheiRecheque.PosicionalTelefonesAnterioresConsultados.QuantidadeTelefonesPesquisados - 1 do
    begin
      LAcheiRechequeTelsAnteriores := LAcheiRechequeModel.AcheiRechequeTelsAnterioress.FindByCMC7AndOrdemOrNew(
        LAcheiRechequeModel.CMC7{, 'AR40'}, laco + 1, Connection);
      LAcheiRechequeTelsAnteriores.Telefone := LAcheiRecheque.PosicionalTelefonesAnterioresConsultados[laco];
      LAcheiRechequeTelsAnteriores.Alterado := True;
    end;
  with TIteratorAcheiRechequeTelsAnterioresModelDecorator.Decore(LAcheiRechequeModel.AcheiRechequeTelsAnterioress) do
    while Next do
      if (not CurrentItem.Novo) and (not CurrentItem.Alterado) then
        CurrentItem.MarkDeleted;

  with Connection.StartTransaction do
  begin
    LAcheiRechequeModelService.Save(LAcheiRechequeModel);
    Commit;
  end;
end;*)

(*procedure TDBCadastros.PersisteCreditBureau;
var
  laco: Integer;
  LCreditBureauModelService: ICreditBureauModelService;
  LCreditBureau: ICreditBureauModel;
  LCreditBureauLinha: ICreditBureauLinhaModel;
  LCreditBureauLinhaSPC: ICreditBureauLinhaSPCModel;
begin
  inherited;
  LCreditBureauModelService := SL as ICreditBureauModelService;
  Cadastro.CreditBureau.Numero := LCreditBureauModelService.SummaryUltimoNumero(Codigo, Connection).Value + 1;

  LCreditBureau := TCreditBureauModel.Create(Connection);
  LCreditBureau.Codigo := Codigo;
  LCreditBureau.Numero := Cadastro.CreditBureau.Numero;

  for laco := 0 to Cadastro.CreditBureau.FormatadoLinhasQuantidade - 1 do
  begin
    LCreditBureauLinha := LCreditBureau.CreditBureauLinhas.New(Connection);
    LCreditBureauLinha.Linha := Cadastro.CreditBureau.FormatadoLinhas[laco].Linha;
    LCreditBureauLinha.LinhaEditada := TCreditBureauLinhaModel.Nullable(
      Cadastro.CreditBureau.FormatadoLinhas[laco].LinhaEditada);
    LCreditBureauLinha.TipLinha := TCreditBureauLinhaModel.Nullable(
      Cadastro.CreditBureau.FormatadoLinhas[laco].TipoLinha);
  end;

  for laco := 0 to Cadastro.CreditBureau.QuantidadeLinhasSPC - 1 do
  begin
    LCreditBureauLinhaSPC := LCreditBureau.CreditBureauLinhaSPCs.New(Connection);
    LCreditBureauLinhaSPC.Linha := Cadastro.CreditBureau.LinhasSPC[laco].Linha;
    LCreditBureauLinhaSPC.TipLinha := TCreditBureauLinhaSPCModel.Nullable(
      Cadastro.CreditBureau.LinhasSPC[laco].TipoLinha);
    LCreditBureauLinhaSPC.CodigoMensagem := TCreditBureauLinhaSPCModel.Nullable(
      Cadastro.CreditBureau.LinhasSPC[laco].CodigoMensagem);
    LCreditBureauLinhaSPC.Subtipo := Cadastro.CreditBureau.LinhasSPC[laco].SubTipo;
    case LCreditBureauLinhaSPC.Subtipo of
      0: begin
        LCreditBureauLinhaSPC.LinhaEditada := TCreditBureauLinhaSPCModel.Nullable(
          Cadastro.CreditBureau.LinhasSPC[laco].LinhaEditada);
      end;
      1: begin
        LCreditBureauLinhaSPC.DataInclusao := TCreditBureauLinhaSPCModel.NullableDateTime(
          Cadastro.CreditBureau.LinhasSPC[laco].DataInclusao);
        LCreditBureauLinhaSPC.DataVencimento := TCreditBureauLinhaSPCModel.NullableDateTime(
          Cadastro.CreditBureau.LinhasSPC[laco].DataVencimento);
        LCreditBureauLinhaSPC.TipoOperacao := TCreditBureauLinhaSPCModel.Nullable(
          Cadastro.CreditBureau.LinhasSPC[laco].TipoOperacao);
        LCreditBureauLinhaSPC.NumeroContrato := TCreditBureauLinhaSPCModel.Nullable(
          Cadastro.CreditBureau.LinhasSPC[laco].NumeroContrato);
        LCreditBureauLinhaSPC.ValorDebito := TCreditBureauLinhaSPCModel.NullableCurrency(
          Cadastro.CreditBureau.LinhasSPC[laco].ValorDebito);
      end;
      2: begin
        LCreditBureauLinhaSPC.NumeroContrato := TCreditBureauLinhaSPCModel.Nullable(
          Cadastro.CreditBureau.LinhasSPC[laco].NomeDoAssociado);
        LCreditBureauLinhaSPC.NumeroContrato := TCreditBureauLinhaSPCModel.Nullable(
          Cadastro.CreditBureau.LinhasSPC[laco].NomeDoAssociado);
        LCreditBureauLinhaSPC.NumeroContrato := TCreditBureauLinhaSPCModel.Nullable(
          Cadastro.CreditBureau.LinhasSPC[laco].UF);
      end;
      3: begin
        LCreditBureauLinhaSPC.NumeroContrato := TCreditBureauLinhaSPCModel.Nullable(
          Cadastro.CreditBureau.LinhasSPC[laco].NomeDoConsumidor);
        LCreditBureauLinhaSPC.NumeroContrato := TCreditBureauLinhaSPCModel.Nullable(
          Cadastro.CreditBureau.LinhasSPC[laco].EntidadeOrigem);
      end;
    end;
  end;

  with Connection.StartTransaction do
  begin
    LCreditBureauModelService.Save(LCreditBureau);
    Commit;
  end;
end;*)

procedure TDBCadastros.PersisteRelatoSegmento;
var
  laco: Integer;
  {LRelatoSegmentoModelService: IRelatoSegmentoModelService;
  LRelatoSegmento: IRelatoSegmentoModel;
  LRelatoSegmentoLinha: IRelatoSegmentoLinhaModel;
  LRelatoSegmentoBase: IRelatoSegmentoBaseModel;
  LRelatoSegmento20_01_01_06: IRelatoSegmento20_01_01_06Model;
  LRelatoSegmento20_01_01_09: IRelatoSegmento20_01_01_09Model;
  LRelatoSegmento20_02_01_PrinFon: IRelatoSegmento20_02_01_PrinFonModel;
  LRelatoSegmento20_02_01_03: IRelatoSegmento20_02_01_03Model;
  LRelatoSegmento20_02_01_Ocor: IRelatoSegmento20_02_01_OcorModel;
  LRelatoSegmento20_02_01_PotCom: IRelatoSegmento20_02_01_PotComModel;
  LRelatoSegmento20_02_01_08: IRelatoSegmento20_02_01_08Model;
  LRelatoSegmento_Fornecedores: IRelatoSegmento_FornecedoresModel;
  LRelatoSegmento20_02_01_14: IRelatoSegmento20_02_01_14Model;
  LRelatoSegmento20_03_01_01: IRelatoSegmento20_03_01_01Model;
  LRelatoSegmento20_03_01_03: IRelatoSegmento20_03_01_03Model;
  LRelatoSegmento20_03_01_02: IRelatoSegmento20_03_01_02Model;
  LRelatoSegmento20_04_01_VlrFin: IRelatoSegmento20_04_01_VlrFinModel;
  LRelatoSegmento20_04_02_02: IRelatoSegmento20_04_02_02Model;
  LRelatoSegmento20_04_03_01: IRelatoSegmento20_04_03_01Model;
  LRelatoSegmento20_04_08_01: IRelatoSegmento20_04_08_01Model;
  LRelatoSegmento20_04_10_01: IRelatoSegmento20_04_10_01Model;
  LRelatoSegmento20_07_01_RiskMes: IRelatoSegmento20_07_01_RiskMesModel;
  LRelatoSegmento20_07_01_Risk: IRelatoSegmento20_07_01_RiskModel;
  LRelatoSegmento20_04_02_01: IRelatoSegmento20_04_02_01Model;
  LRelatoSegmento20_02_01_FonInf: IRelatoSegmento20_02_01_FonInfModel;
  LRelatoSegmento20_08_01_02: IRelatoSegmento20_08_01_02Model;
  LSigcad: ISigcadModel;
  LRelatoSegmentoFatAutor: IRelatoSegmentoFatAutorModel;
  LRelatoSegmento20_01_01_14: IRelatoSegmento20_01_01_14Model;
  LRelatoSegmento20_89_00_00: IRelatoSegmento20_89_00_00Model;
  LRelatoSegmento20_89_01_01: IRelatoSegmento20_89_01_01Model;
  LRelatoSegmento20_89_01_02: IRelatoSegmento20_89_01_02Model;
  LRelatoSegmento20_89_01_03: IRelatoSegmento20_89_01_03Model;
  LRelatoSegmento20_89_02_01: IRelatoSegmento20_89_02_01Model;
  LRelatoSegmento20_89_02_02: IRelatoSegmento20_89_02_02Model;
  LRelatoSegmento20_89_02_03: IRelatoSegmento20_89_02_03Model;
  LRelatoSegmento20_89_02_04: IRelatoSegmento20_89_02_04Model;
  LRelatoSegmento20_89_02_05: IRelatoSegmento20_89_02_05Model;
  LRelatoSegmento20_89_02_06: IRelatoSegmento20_89_02_06Model;
  LRelatoSegmento20_89_02_07: IRelatoSegmento20_89_02_07Model;
  LRelatoSegmento20_89_02_08: IRelatoSegmento20_89_02_08Model;
  LRelatoSegmento20_89_02_09: IRelatoSegmento20_89_02_09Model;
  LRelatoSegmento20_89_02_10: IRelatoSegmento20_89_02_10Model;
  LRelatoSegmento20_89_02_11: IRelatoSegmento20_89_02_11Model;}
  LService: INFConsultaSerasaModelService;
  LNFConsultaSerasa: INFConsultaSerasaModel;
  LTeste: string;
  LArquivo: TStringList;
begin
  inherited;
  LService := SL as INFConsultaSerasaModelService;
  LNFConsultaSerasa := TNFConsultaSerasaModel.Create(Connection);
  LNFConsultaSerasa.SConsData := TNFConsultaSerasaModel.NullableDateTime(Date);
  LNFConsultaSerasa.SConsHora := TNFConsultaSerasaModel.Nullable(FormatDateTime('HH:NN', Now));
  LNFConsultaSerasa.SConsCnpjCpf := TNFConsultaSerasaModel.Nullable(Codigo);
  LNFConsultaSerasa.RetLinhaSerasa := TNFConsultaSerasaModel.Nullable(Cadastro.StringSerasa);
  LNFConsultaSerasa.SConsEmpTipo := TNFConsultaSerasaModel.Nullable('R');
  LNFConsultaSerasa.UsuLogin := TNFConsultaSerasaModel.Nullable('master');
  LNFConsultaSerasa.UserConsulta := TNFConsultaSerasaModel.Nullable('35008104');
  LNFConsultaSerasa.SConsAcaoGerencie := TNFConsultaSerasaModel.Nullable(False);
  LNFConsultaSerasa.SConsPrazoGerencie := TNFConsultaSerasaModel.Nullable(0);
  LNFConsultaSerasa.Gru_ID := TNFConsultaSerasaModel.Nullable(0);
  LNFConsultaSerasa.Per_ID := TNFConsultaSerasaModel.Nullable(0);
  LService.Save(LNFConsultaSerasa);
  LTeste := IntToStr(LNFConsultaSerasa.ID);

  LArquivo := TStringList.Create;
  try
    for laco := 0 to Cadastro.RelatoSegmento.FormatadoLinhasQuantidade - 1 do
      LArquivo.Append(Cadastro.RelatoSegmento.FormatadoLinhas[laco].LinhaEditada);
    LArquivo.SaveToFile('c:\Lixo\' + 'SERASA-P' + IntToStr(LNFConsultaSerasa.ID) + FormatDateTime('YYYY-MM-DD', LNFConsultaSerasa.SConsData.Value) + '.TXT');
  finally
    LArquivo.Free;
  end;

  //LRelatoSegmentoModelService := SL as IRelatoSegmentoModelService;
  //Cadastro.RelatoSegmento.Numero := LRelatoSegmentoModelService.SummaryUltimoNumero(Codigo, Connection).Value + 1;

  (*LRelatoSegmento := TRelatoSegmentoModel.Create(Connection);
  LRelatoSegmento.Codigo := Codigo;
  LRelatoSegmento.Numero := Cadastro.RelatoSegmento.Numero;
  LRelatoSegmento.TipoConsulta := FlagTipoConsulta;
  if Assigned(Cadastro.RelatoSegmento.FormatadoControle) then
  begin
    LRelatoSegmento.CNPJ := TRelatoSegmentoModel.Nullable(Cadastro.RelatoSegmento.FormatadoControle.CNPJ);
    LRelatoSegmento.RazaoSocial := TRelatoSegmentoModel.Nullable(Cadastro.RelatoSegmento.FormatadoControle.Nome);
  end
  else
  begin
    LSigcad := (SL as ISigcadModelService).FindByCodigoOrDefault(Codigo, Connection);
    LRelatoSegmento.CNPJ := TRelatoSegmentoModel.Nullable(TFacMetodos.SoNumero(LSigcad.CnpjCpf.Value));
    LRelatoSegmento.RazaoSocial := TRelatoSegmentoModel.Nullable(LSigcad.CnpjCpf.Value);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.FormatadoLinhasQuantidade - 1 do
  begin
    LRelatoSegmentoLinha := LRelatoSegmento.RelatoSegmentoLinhas.New(Connection);
    LRelatoSegmentoLinha.Linha := Cadastro.RelatoSegmento.FormatadoLinhas[laco].Linha;
    LRelatoSegmentoLinha.LinhaEditada :=
      TRelatoSegmentoLinhaModel.Nullable(Cadastro.RelatoSegmento.FormatadoLinhas[laco].LinhaEditada);
    LRelatoSegmentoLinha.TipReg :=
      TRelatoSegmentoLinhaModel.Nullable(Cadastro.RelatoSegmento.FormatadoLinhas[laco].TipoRegistro);
    LRelatoSegmentoLinha.TipLinha :=
      TRelatoSegmentoLinhaModel.Nullable(Cadastro.RelatoSegmento.FormatadoLinhas[laco].TipoLinha);
    LRelatoSegmentoLinha.Atributo :=
      TRelatoSegmentoLinhaModel.Nullable(Cadastro.RelatoSegmento.FormatadoLinhas[laco].Atributo);
    LRelatoSegmentoLinha.Conjunto := Cadastro.RelatoSegmento.FormatadoLinhas[laco].Conjunto;
    LRelatoSegmentoLinha.NomeBloco :=
      TRelatoSegmentoLinhaModel.Nullable(Cadastro.RelatoSegmento.FormatadoLinhas[laco].NomeBloco);
  end;

  if not Cadastro.RelatoSegmento.EstaCompleto then
  begin
    //Adiciona linha em branco.
    if LRelatoSegmento.RelatoSegmentoLinhas.Count > 0 then
      laco := LRelatoSegmento.RelatoSegmentoLinhas[LRelatoSegmento.RelatoSegmentoLinhas.Count - 1].Linha + 1
    else
      laco := 0;
    LRelatoSegmentoLinha := LRelatoSegmento.RelatoSegmentoLinhas.New(Connection);
    LRelatoSegmentoLinha.Linha := laco;
    LRelatoSegmentoLinha.LinhaEditada := TRelatoSegmentoLinhaModel.Nullable('');

    //Adiciona mensagem com atribuido B para aparecer em negrito no relatório.
    LRelatoSegmentoLinha.Atributo := TRelatoSegmentoLinhaModel.Nullable('B');
    LRelatoSegmentoLinha.Linha := laco + 1;
    LRelatoSegmentoLinha.LinhaEditada :=
      TRelatoSegmentoLinhaModel.Nullable('***************** CONSULTA INCOMPLETA, TENTE NOVAMENTE! *****************');
  end;

  if Assigned(Cadastro.RelatoSegmento.PosicionalDadosControle) then
  begin
    LRelatoSegmentoBase := LRelatoSegmento.RelatoSegmentoBase;
    LRelatoSegmentoBase.Cnpj := TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalDadosControle.CNPJ);
    LRelatoSegmentoBase.TemFicha :=
      TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalDadosControle.TemFicha);
    LRelatoSegmentoBase.UltimaRemessaReciprocidade := TRelatoSegmentoBaseModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalDadosControle.UltimaRemessaReciprocidade,
      Cadastro.RelatoSegmento.PosicionalDadosControle.UltimaRemessaReciprocidade <= 0);
    LRelatoSegmentoBase.TipoRelato :=
      TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalDadosControle.TipoRelato);
    if Assigned(Cadastro.RelatoSegmento.PosicionalFraseStatus) then
       LRelatoSegmentoBase.MensagemStatusEmpresa :=
         TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalFraseStatus.MensagemStatusEmpresa);
    LRelatoSegmentoBase.ConfidencialPara :=
      TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalContabilizacao.ConfidencialPara);
    LRelatoSegmentoBase.DataHoraContConsulta := TRelatoSegmentoBaseModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalContabilizacao.DataHoraContabilizacaoConsulta);
    LRelatoSegmentoBase.CnpjEditado :=
      TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalContabilizacao.CNPJEditado);
    LRelatoSegmentoBase.DataAtualizacaoBloco :=
      TRelatoSegmentoBaseModel.NullableDateTime(Cadastro.RelatoSegmento.PosicionalContabilizacao.DataAtualizacaoBloco);
    LRelatoSegmentoBase.NumUltimoRegOrgaosOficiais := TRelatoSegmentoBaseModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalContabilizacao.NumeroUltimoRegistroOrgaosOficiais);
    LRelatoSegmentoBase.DataUltimoRegOrgaosOficiais := TRelatoSegmentoBaseModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalContabilizacao.DataUltimoRegistroOrgaosOficiais);
    LRelatoSegmentoBase.Nome := TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalIdentificacao.Nome);
    LRelatoSegmentoBase.NomeFantasia :=
      TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalIdentificacao.NomeFantasia);
    if Assigned(Cadastro.RelatoSegmento.PosicionalEndereco) then
      LRelatoSegmentoBase.Endereco :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalEndereco.Endereco);
    if Assigned(Cadastro.RelatoSegmento.PosicionalLocalizacao) then
    begin
      LRelatoSegmentoBase.Cidade :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalLocalizacao.Cidade);
      LRelatoSegmentoBase.UF :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalLocalizacao.UF);
      LRelatoSegmentoBase.CEP :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalLocalizacao.CEP);
      LRelatoSegmentoBase.DDD :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalLocalizacao.DDD);
      LRelatoSegmentoBase.Telefone :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalLocalizacao.Telefone);
      LRelatoSegmentoBase.Fax :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalLocalizacao.Fax);
      LRelatoSegmentoBase.CodigoEmbratel :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalLocalizacao.CodigoEmbratel);
      LRelatoSegmentoBase.PaginaInternet :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalLocalizacao.PaginaInternet);
    end;
    if Assigned(Cadastro.RelatoSegmento.PosicionalAtividade) then
    begin
      LRelatoSegmentoBase.DataFundacao :=
        TRelatoSegmentoBaseModel.NullableDateTime(Cadastro.RelatoSegmento.PosicionalAtividade.DataFundacao);
      LRelatoSegmentoBase.DataInscricaoCnpj :=
        TRelatoSegmentoBaseModel.NullableDateTime(Cadastro.RelatoSegmento.PosicionalAtividade.DataInscricaoCNPJ);
      LRelatoSegmentoBase.RamoAtividade :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalAtividade.RamoAtividade);
      LRelatoSegmentoBase.CodigoSerasaCompleto :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalAtividade.CodigoSerasaCompleto);
      LRelatoSegmentoBase.QuantidadeEmpregados :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalAtividade.QuantidadeEmpregados);
      LRelatoSegmentoBase.PercentualCompra :=
        TRelatoSegmentoBaseModel.NullableExtended(Cadastro.RelatoSegmento.PosicionalAtividade.PercentualCompra);
      LRelatoSegmentoBase.PercentualVenda :=
        TRelatoSegmentoBaseModel.NullableExtended(Cadastro.RelatoSegmento.PosicionalAtividade.PercentualVendas);
      LRelatoSegmentoBase.QuantidadeFiliais :=
        TRelatoSegmentoBaseModel.NullableExtended(Cadastro.RelatoSegmento.PosicionalAtividade.QuantidadeFiliais);
    end;
    if Assigned(Cadastro.RelatoSegmento.PosicionalPrincipaisProdutos) then
      LRelatoSegmentoBase.PrincipaisProdutos :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalPrincipaisProdutos.PrincipaisProdutos);
    if Assigned(Cadastro.RelatoSegmento.PosicionalControleSocietario) then
    begin
      LRelatoSegmentoBase.DataAtualizacao :=
        TRelatoSegmentoBaseModel.NullableDateTime(Cadastro.RelatoSegmento.PosicionalControleSocietario.DataAtualizacao);
      LRelatoSegmentoBase.CapitalSocial :=
        TRelatoSegmentoBaseModel.NullableCurrency(Cadastro.RelatoSegmento.PosicionalControleSocietario.CapitalSocial);
      LRelatoSegmentoBase.CapitalRealizado :=
        TRelatoSegmentoBaseModel.NullableCurrency(Cadastro.RelatoSegmento.PosicionalControleSocietario.CapitalRealizado);
      LRelatoSegmentoBase.CapitalAutorizado :=
        TRelatoSegmentoBaseModel.NullableCurrency(Cadastro.RelatoSegmento.PosicionalControleSocietario.CapitalAutorizado);
      LRelatoSegmentoBase.Nacionalidade :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalControleSocietario.Nacionalidade);
      LRelatoSegmentoBase.Origem :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalControleSocietario.Origem);
      LRelatoSegmentoBase.Natureza :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalControleSocietario.Natureza);
      LRelatoSegmentoBase.BaseJuntaComercial :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalControleSocietario.BaseJuntaComercial);
    end;
    if Assigned(Cadastro.RelatoSegmento.PosicionalAntecessora) then
    begin
      LRelatoSegmentoBase.Antecessora_Nome :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalAntecessora.Nome);
      LRelatoSegmentoBase.Antecessora_DataMotivo :=
        TRelatoSegmentoBaseModel.NullableDateTime(Cadastro.RelatoSegmento.PosicionalAntecessora.DataMotivo);
    end;
    if Assigned(Cadastro.RelatoSegmento.PosicionalInformacoesRechequeUltimaOcorrencia) then
    begin
      LRelatoSegmentoBase.Recheque_Qtd :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalInformacoesRechequeUltimaOcorrencia.Quantidade);
      LRelatoSegmentoBase.Recheque_QtdUltimaOcorrencia :=
        TRelatoSegmentoBaseModel.Nullable(Cadastro.RelatoSegmento.PosicionalInformacoesRechequeUltimaOcorrencia.QuantidadeUltimaOcorrencia);
    end;
  end
  else
    LRelatoSegmentoBase := nil;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalFiliaisQuantidade - 1 do
  begin
    LRelatoSegmento20_01_01_06 := LRelatoSegmento.RelatoSegmento20_01_01_06s.New(Connection);
    LRelatoSegmento20_01_01_06.Linha := laco;
    LRelatoSegmento20_01_01_06.NomeFilial := TRelatoSegmento20_01_01_06Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalFiliais[laco].NomeFilial);
    LRelatoSegmento20_01_01_06.CodigoEmbratel := TRelatoSegmento20_01_01_06Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalFiliais[laco].CodigoEmbratel);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalControleSocietarioDetalheQuantidade - 1 do
  begin
    LRelatoSegmento20_01_01_09 := LRelatoSegmento.RelatoSegmento20_01_01_09s.New(Connection);
    LRelatoSegmento20_01_01_09.Tipo := StrToInt(Cadastro.RelatoSegmento.PosicionalControleSocietarioDetalhe[laco].Tipo);
    LRelatoSegmento20_01_01_09.Linha := laco;
    LRelatoSegmento20_01_01_09.Pais := TRelatoSegmento20_01_01_09Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalControleSocietarioDetalhe[laco].Pais);
    LRelatoSegmento20_01_01_09.PercentualCapital := TRelatoSegmento20_01_01_09Model.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalControleSocietarioDetalhe[laco].PercentualCapital);
    LRelatoSegmento20_01_01_09.DataEntrada := TRelatoSegmento20_01_01_09Model.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalControleSocietarioDetalhe[laco].DataEntrada);
    LRelatoSegmento20_01_01_09.PercentualCapitalVotante := TRelatoSegmento20_01_01_09Model.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalControleSocietarioDetalhe[laco].PercentualCapitalVotante);
    LRelatoSegmento20_01_01_09.CodigoSerasa := TRelatoSegmento20_01_01_09Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalControleSocietarioDetalhe[laco].CodigoSerasa);
    LRelatoSegmento20_01_01_09.Cgc := TRelatoSegmento20_01_01_09Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalControleSocietarioDetalhe[laco].CGC);
    LRelatoSegmento20_01_01_09.Nome := TRelatoSegmento20_01_01_09Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalControleSocietarioDetalhe[laco].Nome);
    LRelatoSegmento20_01_01_09.Restrito := TRelatoSegmento20_01_01_09Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalControleSocietarioDetalhe[laco].Restrito);
    LRelatoSegmento20_01_01_09.Auxiliar_TipoSituacao_Codigo :=
      Cadastro.RelatoSegmento.PosicionalControleSocietarioDetalhe[laco].CodigoSituacao;
    LRelatoSegmento20_01_01_09.Auxiliar_TipoDocumento_Codigo :=
      Cadastro.RelatoSegmento.PosicionalControleSocietarioDetalhe[laco].CodigoTipoDocumento;
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalControleAdministrativoQuantidade - 1 do
  begin
    LRelatoSegmento20_01_01_09 := LRelatoSegmento.RelatoSegmento20_01_01_09s.New(Connection);
    LRelatoSegmento20_01_01_09.Tipo := StrToInt(Cadastro.RelatoSegmento.PosicionalControleAdministrativo[laco].Tipo);
    LRelatoSegmento20_01_01_09.Linha := laco;
    LRelatoSegmento20_01_01_09.Cgc := TRelatoSegmento20_01_01_09Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalControleAdministrativo[laco].CGC);
    LRelatoSegmento20_01_01_09.Nome := TRelatoSegmento20_01_01_09Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalControleAdministrativo[laco].Nome);
    LRelatoSegmento20_01_01_09.Restrito := TRelatoSegmento20_01_01_09Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalControleAdministrativo[laco].Restrito);
    LRelatoSegmento20_01_01_09.Auxiliar_TipoSituacao_Codigo :=
      Cadastro.RelatoSegmento.PosicionalControleAdministrativo[laco].CodigoSituacao;
    LRelatoSegmento20_01_01_09.Auxiliar_TipoDocumento_Codigo :=
      Cadastro.RelatoSegmento.PosicionalControleAdministrativo[laco].CodigoTipoDocumento;
    LRelatoSegmento20_01_01_09.Cargo := TRelatoSegmento20_01_01_09Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalControleAdministrativo[laco].Cargo);
    LRelatoSegmento20_01_01_09.EstadoCivil := TRelatoSegmento20_01_01_09Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalControleAdministrativo[laco].EstadoCivil);
    LRelatoSegmento20_01_01_09.DataFinalMandato := TRelatoSegmento20_01_01_09Model.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalControleAdministrativo[laco].DataFinalMandato);
    LRelatoSegmento20_01_01_09.CodigoCargo := TRelatoSegmento20_01_01_09Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalControleAdministrativo[laco].CodigoCargo);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalParticipacoesDetalheQuantidade - 1 do
  begin
    LRelatoSegmento20_01_01_14 := LRelatoSegmento.RelatoSegmento20_01_01_14s.New(Connection);
    LRelatoSegmento20_01_01_14.Linha := laco;
    LRelatoSegmento20_01_01_14.VinculoParticipante :=
      Cadastro.RelatoSegmento.PosicionalParticipacoesDetalhe[laco].VinculoParticipante;
    LRelatoSegmento20_01_01_14.CodigoEmbratel :=
      Cadastro.RelatoSegmento.PosicionalParticipacoesDetalhe[laco].CodigoEmbratel;
    LRelatoSegmento20_01_01_14.MunicipioEmbratel :=
      Cadastro.RelatoSegmento.PosicionalParticipacoesDetalhe[laco].MunicipioEmbratel;
    LRelatoSegmento20_01_01_14.UfEmbratel :=
      Cadastro.RelatoSegmento.PosicionalParticipacoesDetalhe[laco].UFEmbratel;
    LRelatoSegmento20_01_01_14.PercentualParticipacao :=
      Cadastro.RelatoSegmento.PosicionalParticipacoesDetalhe[laco].PercentualParticipacao;
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalPrincipaisFontesQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_PrinFon := LRelatoSegmento.RelatoSegmento20_02_01_PrinFons.New(Connection);
    LRelatoSegmento20_02_01_PrinFon.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalPrincipaisFontes[laco]);
    LRelatoSegmento20_02_01_PrinFon.Linha := laco;
    LRelatoSegmento20_02_01_PrinFon.Nome := TRelatoSegmento20_02_01_PrinFonModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPrincipaisFontes[laco].Nome);
    LRelatoSegmento20_02_01_PrinFon.Cnpj := TRelatoSegmento20_02_01_PrinFonModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPrincipaisFontes[laco].CNPJ);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalPrincipaisFontesSegmentoConsolidadoQuantidade -1 do
  begin
    LRelatoSegmento20_02_01_PrinFon := LRelatoSegmento.RelatoSegmento20_02_01_PrinFons.New(Connection);
    LRelatoSegmento20_02_01_PrinFon.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalPrincipaisFontesSegmentoConsolidado[laco]);
    LRelatoSegmento20_02_01_PrinFon.Linha := laco;
    LRelatoSegmento20_02_01_PrinFon.DataAtualizacaoBloco := TRelatoSegmento20_02_01_PrinFonModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalPrincipaisFontesDataAtualizacao.DataAtualizacaoBloco);
    LRelatoSegmento20_02_01_PrinFon.Nome := TRelatoSegmento20_02_01_PrinFonModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPrincipaisFontesSegmentoConsolidado[laco].Nome);
    LRelatoSegmento20_02_01_PrinFon.Cnpj := TRelatoSegmento20_02_01_PrinFonModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPrincipaisFontesSegmentoConsolidado[laco].CNPJ);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresPeriodoQuantidade - 1 do
  begin
     LRelatoSegmento20_02_01_03 := LRelatoSegmento.RelatoSegmento20_02_01_03s.New(Connection);
     LRelatoSegmento20_02_01_03.Linha := laco;
     LRelatoSegmento20_02_01_03.Descricao := TRelatoSegmento20_02_01_03Model.Nullable(
       Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresPeriodo[laco].Descricao);
     LRelatoSegmento20_02_01_03.Quantidade := TRelatoSegmento20_02_01_03Model.Nullable(
       Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresPeriodo[laco].Quantidade);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresAntigosQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_Ocor := LRelatoSegmento.RelatoSegmento20_02_01_Ocors.New(Connection);
    LRelatoSegmento20_02_01_Ocor.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresAntigos[laco]);
    LRelatoSegmento20_02_01_Ocor.Linha := laco;
    LRelatoSegmento20_02_01_Ocor.Ano := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresAntigos[laco].AnoMes.Ano);
    LRelatoSegmento20_02_01_Ocor.Mes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresAntigos[laco].AnoMes.Mes);
    LRelatoSegmento20_02_01_Ocor.DescricaoMes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresAntigos[laco].DescricaoMes);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_Ocor := LRelatoSegmento.RelatoSegmento20_02_01_Ocors.New(Connection);
    LRelatoSegmento20_02_01_Ocor.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalHistoricoPagamento[laco]);
    LRelatoSegmento20_02_01_Ocor.Linha := laco;
    LRelatoSegmento20_02_01_Ocor.Ano := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamento[laco].AnoMes.Ano);
    LRelatoSegmento20_02_01_Ocor.Mes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamento[laco].AnoMes.Mes);
    LRelatoSegmento20_02_01_Ocor.DescricaoMes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamento[laco].DescricaoMes);
    LRelatoSegmento20_02_01_Ocor.Descricao := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamento[laco].Descricao);
    LRelatoSegmento20_02_01_Ocor.Valor := TRelatoSegmento20_02_01_OcorModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamento[laco].Valor);
    LRelatoSegmento20_02_01_Ocor.Percentual := TRelatoSegmento20_02_01_OcorModel.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamento[laco].Percentual);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_Ocor := LRelatoSegmento.RelatoSegmento20_02_01_Ocors.New(Connection);
    LRelatoSegmento20_02_01_Ocor.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissos[laco]);
    LRelatoSegmento20_02_01_Ocor.Linha := laco;
    LRelatoSegmento20_02_01_Ocor.Ano := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissos[laco].AnoMes.Ano);
    LRelatoSegmento20_02_01_Ocor.Mes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissos[laco].AnoMes.Mes);
    LRelatoSegmento20_02_01_Ocor.DescricaoMes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissos[laco].DescricaoMes);
    LRelatoSegmento20_02_01_Ocor.Vencidos := TRelatoSegmento20_02_01_OcorModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissos[laco].Vencidos);
    LRelatoSegmento20_02_01_Ocor.AVencer := TRelatoSegmento20_02_01_OcorModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissos[laco].AVencer);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoSegmentoQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_Ocor := LRelatoSegmento.RelatoSegmento20_02_01_Ocors.New(Connection);
    LRelatoSegmento20_02_01_Ocor.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoSegmento[laco]);
    LRelatoSegmento20_02_01_Ocor.Linha := laco;
    LRelatoSegmento20_02_01_Ocor.Ano := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoSegmento[laco].AnoMes.Ano);
    LRelatoSegmento20_02_01_Ocor.Mes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoSegmento[laco].AnoMes.Mes);
    LRelatoSegmento20_02_01_Ocor.DescricaoMes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoSegmento[laco].DescricaoMes);
    LRelatoSegmento20_02_01_Ocor.Descricao := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoSegmento[laco].Descricao);
    LRelatoSegmento20_02_01_Ocor.Valor := TRelatoSegmento20_02_01_OcorModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoSegmento[laco].Valor);
    LRelatoSegmento20_02_01_Ocor.Percentual := TRelatoSegmento20_02_01_OcorModel.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoSegmento[laco].Percentual);
    LRelatoSegmento20_02_01_Ocor.SegmentoOrigemInformacao := TRelatoSegmento20_02_01_OcorModel.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoSegmento[laco].SegmentoOrigemInformacao);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosVencidosQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_Ocor := LRelatoSegmento.RelatoSegmento20_02_01_Ocors.New(Connection);
    LRelatoSegmento20_02_01_Ocor.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosVencidos[laco]);
    LRelatoSegmento20_02_01_Ocor.Linha := laco;
    LRelatoSegmento20_02_01_Ocor.Ano := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosVencidos[laco].AnoMes.Ano);
    LRelatoSegmento20_02_01_Ocor.Mes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosVencidos[laco].AnoMes.Mes);
    LRelatoSegmento20_02_01_Ocor.DescricaoMes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosVencidos[laco].DescricaoMes);
    LRelatoSegmento20_02_01_Ocor.Descricao := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosVencidos[laco].Descricao);
    LRelatoSegmento20_02_01_Ocor.Valor := TRelatoSegmento20_02_01_OcorModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosVencidos[laco].Valor);
    LRelatoSegmento20_02_01_Ocor.Percentual := TRelatoSegmento20_02_01_OcorModel.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosVencidos[laco].Percentual);
    LRelatoSegmento20_02_01_Ocor.SegmentoOrigemInformacao := TRelatoSegmento20_02_01_OcorModel.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosVencidos[laco].SegmentoOrigemInformacao);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosAVencerQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_Ocor := LRelatoSegmento.RelatoSegmento20_02_01_Ocors.New(Connection);
    LRelatoSegmento20_02_01_Ocor.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosAVencer[laco]);
    LRelatoSegmento20_02_01_Ocor.Linha := laco;
    LRelatoSegmento20_02_01_Ocor.Ano := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosAVencer[laco].AnoMes.Ano);
    LRelatoSegmento20_02_01_Ocor.Mes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosAVencer[laco].AnoMes.Mes);
    LRelatoSegmento20_02_01_Ocor.DescricaoMes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosAVencer[laco].DescricaoMes);
    LRelatoSegmento20_02_01_Ocor.Descricao := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosAVencer[laco].Descricao);
    LRelatoSegmento20_02_01_Ocor.Valor := TRelatoSegmento20_02_01_OcorModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosAVencer[laco].Valor);
    LRelatoSegmento20_02_01_Ocor.Percentual := TRelatoSegmento20_02_01_OcorModel.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosAVencer[laco].Percentual);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalHistoricoPagamentosCedenteQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_Ocor := LRelatoSegmento.RelatoSegmento20_02_01_Ocors.New(Connection);
    LRelatoSegmento20_02_01_Ocor.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalHistoricoPagamentosCedente[laco]);
    LRelatoSegmento20_02_01_Ocor.Linha := laco;
    LRelatoSegmento20_02_01_Ocor.Ano := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentosCedente[laco].AnoMes.Ano);
    LRelatoSegmento20_02_01_Ocor.Mes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentosCedente[laco].AnoMes.Mes);
    LRelatoSegmento20_02_01_Ocor.DescricaoMes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentosCedente[laco].DescricaoMes);
    LRelatoSegmento20_02_01_Ocor.Descricao := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentosCedente[laco].Descricao);
    LRelatoSegmento20_02_01_Ocor.Valor := TRelatoSegmento20_02_01_OcorModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentosCedente[laco].Valor);
    LRelatoSegmento20_02_01_Ocor.Percentual := TRelatoSegmento20_02_01_OcorModel.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentosCedente[laco].Percentual);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosCedenteQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_Ocor := LRelatoSegmento.RelatoSegmento20_02_01_Ocors.New(Connection);
    LRelatoSegmento20_02_01_Ocor.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosCedente[laco]);
    LRelatoSegmento20_02_01_Ocor.Linha := laco;
    LRelatoSegmento20_02_01_Ocor.Ano := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosCedente[laco].AnoMes.Ano);
    LRelatoSegmento20_02_01_Ocor.Mes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosCedente[laco].AnoMes.Mes);
    LRelatoSegmento20_02_01_Ocor.DescricaoMes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosCedente[laco].DescricaoMes);
    LRelatoSegmento20_02_01_Ocor.Vencidos := TRelatoSegmento20_02_01_OcorModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosCedente[laco].Vencidos);
    LRelatoSegmento20_02_01_Ocor.AVencer := TRelatoSegmento20_02_01_OcorModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosCedente[laco].AVencer);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosSegmentoQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_Ocor := LRelatoSegmento.RelatoSegmento20_02_01_Ocors.New(Connection);
    LRelatoSegmento20_02_01_Ocor.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosSegmento[laco]);
    LRelatoSegmento20_02_01_Ocor.Linha := laco;
    LRelatoSegmento20_02_01_Ocor.Ano := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosSegmento[laco].AnoMes.Ano);
    LRelatoSegmento20_02_01_Ocor.Mes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosSegmento[laco].AnoMes.Mes);
    LRelatoSegmento20_02_01_Ocor.DescricaoMes := TRelatoSegmento20_02_01_OcorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosSegmento[laco].DescricaoMes);
    LRelatoSegmento20_02_01_Ocor.Vencidos := TRelatoSegmento20_02_01_OcorModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosSegmento[laco].Vencidos);
    LRelatoSegmento20_02_01_Ocor.AVencer := TRelatoSegmento20_02_01_OcorModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosSegmento[laco].AVencer);
    LRelatoSegmento20_02_01_Ocor.SegmentoOrigemInformacao := TRelatoSegmento20_02_01_OcorModel.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalEvolucaoCompromissosSegmento[laco].SegmentoOrigemInformacao);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_PotCom := LRelatoSegmento.RelatoSegmento20_02_01_PotComs.New(Connection);
    LRelatoSegmento20_02_01_PotCom.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalReferenciaisNegocios[laco]);
    LRelatoSegmento20_02_01_PotCom.Linha := laco;
    LRelatoSegmento20_02_01_PotCom.Descricao := TRelatoSegmento20_02_01_PotComModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegocios[laco].Descricao);
    LRelatoSegmento20_02_01_PotCom.Data := TRelatoSegmento20_02_01_PotComModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegocios[laco].Data);
    LRelatoSegmento20_02_01_PotCom.Valor := TRelatoSegmento20_02_01_PotComModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegocios[laco].Valor);
    LRelatoSegmento20_02_01_PotCom.Media := TRelatoSegmento20_02_01_PotComModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegocios[laco].Media);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosSegmentoQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_PotCom := LRelatoSegmento.RelatoSegmento20_02_01_PotComs.New(Connection);
    LRelatoSegmento20_02_01_PotCom.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosSegmento[laco]);
    LRelatoSegmento20_02_01_PotCom.Linha := laco;
    LRelatoSegmento20_02_01_PotCom.Descricao := TRelatoSegmento20_02_01_PotComModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosSegmento[laco].Descricao);
    LRelatoSegmento20_02_01_PotCom.Data := TRelatoSegmento20_02_01_PotComModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosSegmento[laco].Data);
    LRelatoSegmento20_02_01_PotCom.Valor := TRelatoSegmento20_02_01_PotComModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosSegmento[laco].Valor);
    LRelatoSegmento20_02_01_PotCom.Media := TRelatoSegmento20_02_01_PotComModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosSegmento[laco].Media);
    LRelatoSegmento20_02_01_PotCom.SegmentoOrigemInformacao := TRelatoSegmento20_02_01_PotComModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosSegmento[laco].SegmentoOrigemInformacao);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionaReferenciaisNegociosCedenteQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_PotCom := LRelatoSegmento.RelatoSegmento20_02_01_PotComs.New(Connection);
    LRelatoSegmento20_02_01_PotCom.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionaReferenciaisNegociosCedente[laco]);
    LRelatoSegmento20_02_01_PotCom.Linha := laco;
    LRelatoSegmento20_02_01_PotCom.Descricao := TRelatoSegmento20_02_01_PotComModel.Nullable(
      Cadastro.RelatoSegmento.PosicionaReferenciaisNegociosCedente[laco].Descricao);
    LRelatoSegmento20_02_01_PotCom.Data := TRelatoSegmento20_02_01_PotComModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionaReferenciaisNegociosCedente[laco].Data);
    LRelatoSegmento20_02_01_PotCom.Valor := TRelatoSegmento20_02_01_PotComModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionaReferenciaisNegociosCedente[laco].Valor);
    LRelatoSegmento20_02_01_PotCom.Media := TRelatoSegmento20_02_01_PotComModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionaReferenciaisNegociosCedente[laco].Media);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoQuantidadeTitulosQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_08 := LRelatoSegmento.RelatoSegmento20_02_01_08s.New(Connection);
    LRelatoSegmento20_02_01_08.Linha := laco;
    LRelatoSegmento20_02_01_08.Descricao := TRelatoSegmento20_02_01_08Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoQuantidadeTitulos[laco].Descricao);
    LRelatoSegmento20_02_01_08.Quantidade := TRelatoSegmento20_02_01_08Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoQuantidadeTitulos[laco].Quantidade);
    LRelatoSegmento20_02_01_08.Percentual := TRelatoSegmento20_02_01_08Model.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoQuantidadeTitulos[laco].Percentual);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosAnaliticoQuantidade - 1 do
  begin
    LRelatoSegmento_Fornecedores := LRelatoSegmento.RelatoSegmento_Fornecedoress.New(Connection);
    LRelatoSegmento_Fornecedores.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosAnalitico[laco]);
    LRelatoSegmento_Fornecedores.Linha := laco;
    LRelatoSegmento_Fornecedores.Mnemonico := TRelatoSegmento_FornecedoresModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosAnalitico[laco].Mnemonico);
    LRelatoSegmento_Fornecedores.DataAtualizacao := TRelatoSegmento_FornecedoresModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosAnalitico[laco].DataAtualizacao);
    LRelatoSegmento_Fornecedores.SegmentoOrigemInformacao := TRelatoSegmento_FornecedoresModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosAnalitico[laco].SegmentoOrigemInformacao);
    LRelatoSegmento_Fornecedores.DataUltimaCompra := TRelatoSegmento_FornecedoresModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosAnalitico[laco].DataUltimaCompra);
    LRelatoSegmento_Fornecedores.ValorUltimaCompra := TRelatoSegmento_FornecedoresModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosAnalitico[laco].ValorUltimaCompra);
    LRelatoSegmento_Fornecedores.DataMaiorFatura := TRelatoSegmento_FornecedoresModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosAnalitico[laco].DataMaiorFatura);
    LRelatoSegmento_Fornecedores.ValorMaiorFatura := TRelatoSegmento_FornecedoresModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosAnalitico[laco].ValorMaiorFatura);
    LRelatoSegmento_Fornecedores.DataMaiorAcumulo := TRelatoSegmento_FornecedoresModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosAnalitico[laco].DataMaiorAcumulo);
    LRelatoSegmento_Fornecedores.ValorMaiorAcumulo := TRelatoSegmento_FornecedoresModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosAnalitico[laco].ValorMaiorAcumulo);
    LRelatoSegmento_Fornecedores.AVista := TRelatoSegmento_FornecedoresModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalReferenciaisNegociosAnalitico[laco].AVista);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalCompromissosAnaliticosQuantidade - 1 do
  begin
    LRelatoSegmento_Fornecedores := LRelatoSegmento.RelatoSegmento_Fornecedoress.New(Connection);
    LRelatoSegmento_Fornecedores.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalCompromissosAnaliticos[laco]);
    LRelatoSegmento_Fornecedores.Linha := laco;
    LRelatoSegmento_Fornecedores.Mnemonico := TRelatoSegmento_FornecedoresModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalCompromissosAnaliticos[laco].Mnemonico);
    LRelatoSegmento_Fornecedores.DataAtualizacao := TRelatoSegmento_FornecedoresModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalCompromissosAnaliticos[laco].DataAtualizacao);
    LRelatoSegmento_Fornecedores.SegmentoOrigemInformacao := TRelatoSegmento_FornecedoresModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalCompromissosAnaliticos[laco].SegmentoOrigemInformacao);
    LRelatoSegmento_Fornecedores.Vencidos := TRelatoSegmento_FornecedoresModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalCompromissosAnaliticos[laco].Vencidos);
    LRelatoSegmento_Fornecedores.AVencer := TRelatoSegmento_FornecedoresModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalCompromissosAnaliticos[laco].AVencer);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoIndividualQuantidade - 1 do
  begin
    LRelatoSegmento_Fornecedores := LRelatoSegmento.RelatoSegmento_Fornecedoress.New(Connection);
    LRelatoSegmento_Fornecedores.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoIndividual[laco]);
    LRelatoSegmento_Fornecedores.Linha := laco;
    LRelatoSegmento_Fornecedores.Mnemonico := TRelatoSegmento_FornecedoresModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoIndividual[laco].Mnemonico);
    LRelatoSegmento_Fornecedores.DataAtualizacao := TRelatoSegmento_FornecedoresModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoIndividual[laco].DataAtualizacao);
    LRelatoSegmento_Fornecedores.SegmentoOrigemInformacao := TRelatoSegmento_FornecedoresModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoIndividual[laco].SegmentoOrigemInformacao);
    LRelatoSegmento_Fornecedores.DataMaiorValor := TRelatoSegmento_FornecedoresModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoIndividual[laco].DataMaiorValor);
    LRelatoSegmento_Fornecedores.MaiorValor := TRelatoSegmento_FornecedoresModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoIndividual[laco].MaiorValor);
    LRelatoSegmento_Fornecedores.DataAtraso := TRelatoSegmento_FornecedoresModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoIndividual[laco].DataAtraso);
    LRelatoSegmento_Fornecedores.DiasAtraso := TRelatoSegmento_FornecedoresModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoIndividual[laco].DiasAtraso);
    LRelatoSegmento_Fornecedores.DiasPositivo := TRelatoSegmento_FornecedoresModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoIndividual[laco].DiasPositivo);
    LRelatoSegmento_Fornecedores.Pagamentos := TRelatoSegmento_FornecedoresModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoIndividual[laco].Pagamentos);
    LRelatoSegmento_Fornecedores.PagamentosAtrasados := TRelatoSegmento_FornecedoresModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoIndividual[laco].PagamentosAtrasados);
    LRelatoSegmento_Fornecedores.MediaDiasAtraso := TRelatoSegmento_FornecedoresModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalHistoricoPagamentoIndividual[laco].MediaDiasAtraso);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresIndividualQuantidade - 1 do
  begin
    LRelatoSegmento_Fornecedores := LRelatoSegmento.RelatoSegmento_Fornecedoress.New(Connection);
    LRelatoSegmento_Fornecedores.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresIndividual[laco]);
    LRelatoSegmento_Fornecedores.Linha := laco;
    LRelatoSegmento_Fornecedores.Mnemonico := TRelatoSegmento_FornecedoresModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresIndividual[laco].Mnemonico);
    LRelatoSegmento_Fornecedores.DataAtualizacao := TRelatoSegmento_FornecedoresModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresIndividual[laco].DataAtualizacao);
    LRelatoSegmento_Fornecedores.SegmentoOrigemInformacao := TRelatoSegmento_FornecedoresModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresIndividual[laco].SegmentoOrigemInformacao);
    LRelatoSegmento_Fornecedores.ClienteDesde := TRelatoSegmento_FornecedoresModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresIndividual[laco].ClienteDesde);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresPeriodoSegmentoQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_14 := LRelatoSegmento.RelatoSegmento20_02_01_14s.New(Connection);
    LRelatoSegmento20_02_01_14.Linha := laco;
    LRelatoSegmento20_02_01_14.Descricao := TRelatoSegmento20_02_01_14Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresPeriodoSegmento[laco].Descricao);
    LRelatoSegmento20_02_01_14.Quantidade := TRelatoSegmento20_02_01_14Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresPeriodoSegmento[laco].Quantidade);
    LRelatoSegmento20_02_01_14.SegmentoOrigemInformacao := TRelatoSegmento20_02_01_14Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresPeriodoSegmento[laco].SegmentoOrigemInformacao);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalRegistroConsultasQuantidade - 1 do
  begin
    LRelatoSegmento20_03_01_01 := LRelatoSegmento.RelatoSegmento20_03_01_01s.New(Connection);
    LRelatoSegmento20_03_01_01.Linha := laco;
    LRelatoSegmento20_03_01_01.Ano := TRelatoSegmento20_03_01_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalRegistroConsultas[laco].AnoMes.Ano);
    LRelatoSegmento20_03_01_01.Mes := TRelatoSegmento20_03_01_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalRegistroConsultas[laco].AnoMes.Mes);
    LRelatoSegmento20_03_01_01.DescricaoMes := TRelatoSegmento20_03_01_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalRegistroConsultas[laco].Registro);
    LRelatoSegmento20_03_01_01.ConsultaEmpresa := TRelatoSegmento20_03_01_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalRegistroConsultas[laco].ConsultasEmpresa);
    LRelatoSegmento20_03_01_01.ConsultaBanco := TRelatoSegmento20_03_01_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalRegistroConsultas[laco].ConsultasBanco);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalAlertaQuantidade - 1 do
  begin
    LRelatoSegmento20_03_01_03 := LRelatoSegmento.RelatoSegmento20_03_01_03s.New(Connection);
    LRelatoSegmento20_03_01_03.Linha := laco;
    LRelatoSegmento20_03_01_03.Alerta := TRelatoSegmento20_03_01_03Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalAlerta[laco].Alerta);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalUltimasConsultasQuantidade - 1 do
  begin
    LRelatoSegmento20_03_01_02 := LRelatoSegmento.RelatoSegmento20_03_01_02s.New(Connection);
    LRelatoSegmento20_03_01_02.Linha := laco;
    LRelatoSegmento20_03_01_02.Data := TRelatoSegmento20_03_01_02Model.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalUltimasConsultas[laco].Data);
    LRelatoSegmento20_03_01_02.Nome := TRelatoSegmento20_03_01_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalUltimasConsultas[laco].Nome);
    LRelatoSegmento20_03_01_02.ConsultasNoDiaPorCliente := TRelatoSegmento20_03_01_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalUltimasConsultas[laco].ConsultasNoDiaPorCliente);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalPefinQuantidade - 1 do
  begin
    LRelatoSegmento20_04_01_VlrFin := LRelatoSegmento.RelatoSegmento20_04_01_VlrFins.New(Connection);
    LRelatoSegmento20_04_01_VlrFin.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalPefin[laco]);
    LRelatoSegmento20_04_01_VlrFin.Linha := laco;
    LRelatoSegmento20_04_01_VlrFin.Quantidade := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].Quantidade);
    LRelatoSegmento20_04_01_VlrFin.QuantidadeUltimaOcorrencia := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].QuantidadeUltimaOcorrencia);
    LRelatoSegmento20_04_01_VlrFin.Data := TRelatoSegmento20_04_01_VlrFinModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].Data);
    LRelatoSegmento20_04_01_VlrFin.TituloOcorrencia := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].TituloOcorrencia);
    LRelatoSegmento20_04_01_VlrFin.Avalista := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].Avalista);
    LRelatoSegmento20_04_01_VlrFin.Valor := TRelatoSegmento20_04_01_VlrFinModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].Valor);
    LRelatoSegmento20_04_01_VlrFin.Contrato := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].Contrato);
    LRelatoSegmento20_04_01_VlrFin.Origem := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].Origem);
    LRelatoSegmento20_04_01_VlrFin.Filial := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].Filial);
    LRelatoSegmento20_04_01_VlrFin.SubjudicePraca := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].SubJudice.Praca);
    LRelatoSegmento20_04_01_VlrFin.SubjudiceDistrito := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].SubJudice.Distrito);
    LRelatoSegmento20_04_01_VlrFin.SubjudiceVara := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].SubJudice.Vara);
    LRelatoSegmento20_04_01_VlrFin.SubjudiceData := TRelatoSegmento20_04_01_VlrFinModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].SubJudice.Data);
    LRelatoSegmento20_04_01_VlrFin.SubjudiceProcesso := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].SubJudice.Processo);
    LRelatoSegmento20_04_01_VlrFin.Natureza_Codigo := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalPefin[laco].CodigoNatureza);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalRefinQuantidade - 1 do
  begin
    LRelatoSegmento20_04_01_VlrFin := LRelatoSegmento.RelatoSegmento20_04_01_VlrFins.New(Connection);
    LRelatoSegmento20_04_01_VlrFin.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalRefin[laco]);
    LRelatoSegmento20_04_01_VlrFin.Linha := laco;
    LRelatoSegmento20_04_01_VlrFin.Quantidade := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].Quantidade);
    LRelatoSegmento20_04_01_VlrFin.QuantidadeUltimaOcorrencia := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].QuantidadeUltimaOcorrencia);
    LRelatoSegmento20_04_01_VlrFin.Data := TRelatoSegmento20_04_01_VlrFinModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].Data);
    LRelatoSegmento20_04_01_VlrFin.TituloOcorrencia := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].TituloOcorrencia);
    LRelatoSegmento20_04_01_VlrFin.Avalista := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].Avalista);
    LRelatoSegmento20_04_01_VlrFin.Valor := TRelatoSegmento20_04_01_VlrFinModel.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].Valor);
    LRelatoSegmento20_04_01_VlrFin.Contrato := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].Contrato);
    LRelatoSegmento20_04_01_VlrFin.Origem := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].Origem);
    LRelatoSegmento20_04_01_VlrFin.Filial := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].Filial);
    LRelatoSegmento20_04_01_VlrFin.SubjudicePraca := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].SubJudice.Praca);
    LRelatoSegmento20_04_01_VlrFin.SubjudiceDistrito := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].SubJudice.Distrito);
    LRelatoSegmento20_04_01_VlrFin.SubjudiceVara := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].SubJudice.Vara);
    LRelatoSegmento20_04_01_VlrFin.SubjudiceData := TRelatoSegmento20_04_01_VlrFinModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].SubJudice.Data);
    LRelatoSegmento20_04_01_VlrFin.SubjudiceProcesso := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].SubJudice.Processo);
    LRelatoSegmento20_04_01_VlrFin.Natureza_Codigo := TRelatoSegmento20_04_01_VlrFinModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRefin[laco].CodigoNatureza);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalConcentreResumoQuantidade - 1 do
  begin
    LRelatoSegmento20_04_02_02 := LRelatoSegmento.RelatoSegmento20_04_02_02s.New(Connection);
    LRelatoSegmento20_04_02_02.Linha := laco;
    LRelatoSegmento20_04_02_02.Quantidade := TRelatoSegmento20_04_02_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreResumo[laco].Quantidade);
    LRelatoSegmento20_04_02_02.Grupo := TRelatoSegmento20_04_02_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreResumo[laco].Grupo);
    LRelatoSegmento20_04_02_02.AnoInicial := TRelatoSegmento20_04_02_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreResumo[laco].AnoMesInicial.Ano);
    LRelatoSegmento20_04_02_02.MesInicial := TRelatoSegmento20_04_02_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreResumo[laco].AnoMesInicial.Mes);
    LRelatoSegmento20_04_02_02.DescricaoMesInicial := TRelatoSegmento20_04_02_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreResumo[laco].DescricaoMesInicial);
    LRelatoSegmento20_04_02_02.AnoFinal := TRelatoSegmento20_04_02_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreResumo[laco].AnoMesFinal.Ano);
    LRelatoSegmento20_04_02_02.MesFinal := TRelatoSegmento20_04_02_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreResumo[laco].AnoMesFinal.Mes);
    LRelatoSegmento20_04_02_02.DescricaoMesFinal := TRelatoSegmento20_04_02_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreResumo[laco].DescricaoMesFinal);
    LRelatoSegmento20_04_02_02.Moeda := TRelatoSegmento20_04_02_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreResumo[laco].Moeda);
    LRelatoSegmento20_04_02_02.Valor := TRelatoSegmento20_04_02_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalConcentreResumo[laco].Valor);
    LRelatoSegmento20_04_02_02.Origem := TRelatoSegmento20_04_02_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreResumo[laco].Origem);
    LRelatoSegmento20_04_02_02.Agencia := TRelatoSegmento20_04_02_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreResumo[laco].Agencia);
    LRelatoSegmento20_04_02_02.TotalProtesto := TRelatoSegmento20_04_02_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalConcentreResumo[laco].TotalProtesto);
    LRelatoSegmento20_04_02_02.CodigoNatureza := TRelatoSegmento20_04_02_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreResumo[laco].CodigoNatureza);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalConcentreInaptoQuantidade - 1 do
  begin
    LRelatoSegmento20_04_03_01 := LRelatoSegmento.RelatoSegmento20_04_03_01s.New(Connection);
    LRelatoSegmento20_04_03_01.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalConcentreInapto[laco]);
    LRelatoSegmento20_04_03_01.Linha := laco;
    LRelatoSegmento20_04_03_01.Quantidade := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreInapto[laco].Quantidade);
    LRelatoSegmento20_04_03_01.Descricao := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreInapto[laco].Descricao);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalConcentreProtestoQuantidade - 1 do
  begin
    LRelatoSegmento20_04_03_01 := LRelatoSegmento.RelatoSegmento20_04_03_01s.New(Connection);
    LRelatoSegmento20_04_03_01.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco]);
    LRelatoSegmento20_04_03_01.Linha := laco;
    LRelatoSegmento20_04_03_01.Quantidade := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].Quantidade);
    LRelatoSegmento20_04_03_01.Data := TRelatoSegmento20_04_03_01Model.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].Data);
    LRelatoSegmento20_04_03_01.Moeda := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].Moeda);
    LRelatoSegmento20_04_03_01.Valor := TRelatoSegmento20_04_03_01Model.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].Valor);
    LRelatoSegmento20_04_03_01.Cartorio := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].Cartorio);
    LRelatoSegmento20_04_03_01.Cidade := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].Cidade);
    LRelatoSegmento20_04_03_01.UF := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].UF);
    LRelatoSegmento20_04_03_01.SubjudicePraca := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].SubJudice.Praca);
    LRelatoSegmento20_04_03_01.SubjudiceDistrito := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].SubJudice.Distrito);
    LRelatoSegmento20_04_03_01.SubjudiceVara := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].SubJudice.Vara);
    LRelatoSegmento20_04_03_01.SubjudiceData := TRelatoSegmento20_04_03_01Model.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].SubJudice.Data);
    LRelatoSegmento20_04_03_01.SubjudiceProcesso := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].SubJudice.Processo);
    LRelatoSegmento20_04_03_01.CodigoNatureza := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].CodigoNatureza);
    LRelatoSegmento20_04_03_01.TipoCartaAnuencia_Codigo := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].CodigoTipoCartaAnuencia);
    LRelatoSegmento20_04_03_01.DataCartaAnuencia := TRelatoSegmento20_04_03_01Model.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalConcentreProtesto[laco].DataCartaAnuencia);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicialQuantidade - 1 do
  begin
    LRelatoSegmento20_04_03_01 := LRelatoSegmento.RelatoSegmento20_04_03_01s.New(Connection);
    LRelatoSegmento20_04_03_01.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco]);
    LRelatoSegmento20_04_03_01.Linha := laco;
    LRelatoSegmento20_04_03_01.Quantidade := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].Quantidade);
    LRelatoSegmento20_04_03_01.Data := TRelatoSegmento20_04_03_01Model.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].Data);
    LRelatoSegmento20_04_03_01.Moeda := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].Moeda);
    LRelatoSegmento20_04_03_01.NaturezaAcao := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].NaturezaAcao);
    LRelatoSegmento20_04_03_01.Avalista := TRelatoSegmento20_04_03_01Model.Nullable(
       Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].Avalista);
    LRelatoSegmento20_04_03_01.Valor := TRelatoSegmento20_04_03_01Model.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].Valor);
    LRelatoSegmento20_04_03_01.Distrito := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].Distrito);
    LRelatoSegmento20_04_03_01.Vara := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].Vara);
    LRelatoSegmento20_04_03_01.Cidade := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].Cidade);
    LRelatoSegmento20_04_03_01.UF := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].UF);
    LRelatoSegmento20_04_03_01.SubjudicePraca := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].SubJudice.Praca);
    LRelatoSegmento20_04_03_01.SubjudiceDistrito := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].SubJudice.Distrito);
    LRelatoSegmento20_04_03_01.SubjudiceVara := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].SubJudice.Vara);
    LRelatoSegmento20_04_03_01.SubjudiceData := TRelatoSegmento20_04_03_01Model.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].SubJudice.Data);
    LRelatoSegmento20_04_03_01.SubjudiceProcesso := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].SubJudice.Processo);
    LRelatoSegmento20_04_03_01.CodigoNatureza := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreAcaoJudicial[laco].CodigoNatureza);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalConcentreFalenciaQuantidade - 1 do
  begin
    LRelatoSegmento20_04_03_01 := LRelatoSegmento.RelatoSegmento20_04_03_01s.New(Connection);
    LRelatoSegmento20_04_03_01.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalConcentreFalencia[laco]);
    LRelatoSegmento20_04_03_01.Linha := laco;
    LRelatoSegmento20_04_03_01.Quantidade := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreFalencia[laco].Quantidade);
    LRelatoSegmento20_04_03_01.Data := TRelatoSegmento20_04_03_01Model.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalConcentreFalencia[laco].Data);
    LRelatoSegmento20_04_03_01.Descricao := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreFalencia[laco].Descricao);
    LRelatoSegmento20_04_03_01.Nome := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreFalencia[laco].Nome);
    LRelatoSegmento20_04_03_01.Cnpj := TRelatoSegmento20_04_03_01Model.Nullable(
        Cadastro.RelatoSegmento.PosicionalConcentreFalencia[laco].CNPJ);
    LRelatoSegmento20_04_03_01.CodigoNatureza := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreFalencia[laco].CodigoNatureza);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalConcentreFalenciaConcordataQuantidade - 1 do
  begin
    LRelatoSegmento20_04_03_01 := LRelatoSegmento.RelatoSegmento20_04_03_01s.New(Connection);
    LRelatoSegmento20_04_03_01.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalConcentreFalenciaConcordata[laco]);
    LRelatoSegmento20_04_03_01.Linha := laco;
    LRelatoSegmento20_04_03_01.Quantidade := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreFalenciaConcordata[laco].Quantidade);
    LRelatoSegmento20_04_03_01.Data := TRelatoSegmento20_04_03_01Model.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalConcentreFalenciaConcordata[laco].Data);
    LRelatoSegmento20_04_03_01.Descricao := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreFalenciaConcordata[laco].Descricao);
    LRelatoSegmento20_04_03_01.Origem := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreFalenciaConcordata[laco].Origem);
    LRelatoSegmento20_04_03_01.Vara := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreFalenciaConcordata[laco].Vara);
    LRelatoSegmento20_04_03_01.Cidade := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreFalenciaConcordata[laco].Cidade);
    LRelatoSegmento20_04_03_01.UF := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreFalenciaConcordata[laco].UF);
    LRelatoSegmento20_04_03_01.CodigoNatureza := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreFalenciaConcordata[laco].CodigoNatureza);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalConcentreDividasVencidasQuantidade - 1 do
  begin
    LRelatoSegmento20_04_03_01 := LRelatoSegmento.RelatoSegmento20_04_03_01s.New(Connection);
    LRelatoSegmento20_04_03_01.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalConcentreDividasVencidas[laco]);
    LRelatoSegmento20_04_03_01.Linha := laco;
    LRelatoSegmento20_04_03_01.Quantidade := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreDividasVencidas[laco].Quantidade);
    LRelatoSegmento20_04_03_01.Data := TRelatoSegmento20_04_03_01Model.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalConcentreDividasVencidas[laco].Data);
    LRelatoSegmento20_04_03_01.Descricao := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreDividasVencidas[laco].Descricao);
    LRelatoSegmento20_04_03_01.Moeda := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreDividasVencidas[laco].Moeda);
    LRelatoSegmento20_04_03_01.Valor := TRelatoSegmento20_04_03_01Model.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalConcentreDividasVencidas[laco].Valor);
    LRelatoSegmento20_04_03_01.TituloOcorrencia := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreDividasVencidas[laco].TituloOcorrencia);
    LRelatoSegmento20_04_03_01.InstituicaoFinanceira := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreDividasVencidas[laco].InstituicaoFinanceira);
    LRelatoSegmento20_04_03_01.Local := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreDividasVencidas[laco].Local);
    LRelatoSegmento20_04_03_01.CodigoNatureza := TRelatoSegmento20_04_03_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentreDividasVencidas[laco].CodigoNatureza);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalInformacoesRechequeQuantidade - 1 do
  begin
    LRelatoSegmento20_04_08_01 := LRelatoSegmento.RelatoSegmento20_04_08_01s.New(Connection);
    LRelatoSegmento20_04_08_01.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalInformacoesRecheque[laco]);
    LRelatoSegmento20_04_08_01.Linha := laco;
    LRelatoSegmento20_04_08_01.Quantidade := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRecheque[laco].Quantidade);
    LRelatoSegmento20_04_08_01.Data := TRelatoSegmento20_04_08_01Model.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalInformacoesRecheque[laco].Data);
    LRelatoSegmento20_04_08_01.NumeroCheque := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRecheque[laco].NumeroCheque);
    LRelatoSegmento20_04_08_01.Alinea := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRecheque[laco].Alinea);
    LRelatoSegmento20_04_08_01.QuantidadeNoBanco := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRecheque[laco].QuantidadeNoBanco);
    LRelatoSegmento20_04_08_01.Moeda := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRecheque[laco].Moeda);
    LRelatoSegmento20_04_08_01.Valor := TRelatoSegmento20_04_08_01Model.NullableCurrency(
      Cadastro.RelatoSegmento.PosicionalInformacoesRecheque[laco].Valor);
    LRelatoSegmento20_04_08_01.Banco := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRecheque[laco].Banco);
    LRelatoSegmento20_04_08_01.Agencia := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRecheque[laco].Agencia);
    LRelatoSegmento20_04_08_01.Cidade := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRecheque[laco].Cidade);
    LRelatoSegmento20_04_08_01.UF := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRecheque[laco].UF);
    LRelatoSegmento20_04_08_01.CodigoNatureza := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRecheque[laco].CodigoNatureza);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalInformacoesRechequeCCFQuantidade - 1 do
  begin
    LRelatoSegmento20_04_08_01 := LRelatoSegmento.RelatoSegmento20_04_08_01s.New(Connection);
    LRelatoSegmento20_04_08_01.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalInformacoesRechequeCCF[laco]);
    LRelatoSegmento20_04_08_01.Linha := laco;
    LRelatoSegmento20_04_08_01.Quantidade := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeCCF[laco].Quantidade);
    LRelatoSegmento20_04_08_01.Data := TRelatoSegmento20_04_08_01Model.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeCCF[laco].Data);
    LRelatoSegmento20_04_08_01.NumeroCheque := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeCCF[laco].NumeroCheque);
    LRelatoSegmento20_04_08_01.QuantidadeNoBanco := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeCCF[laco].QuantidadeNoBanco);
    LRelatoSegmento20_04_08_01.Banco := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeCCF[laco].Banco);
    LRelatoSegmento20_04_08_01.Agencia := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeCCF[laco].Agencia);
    LRelatoSegmento20_04_08_01.Cidade := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeCCF[laco].Cidade);
    LRelatoSegmento20_04_08_01.UF := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeCCF[laco].UF);
    LRelatoSegmento20_04_08_01.CodigoNatureza := TRelatoSegmento20_04_08_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeCCF[laco].CodigoNatureza);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalInformacoesRechequeDetalheQuantidade - 1 do
  begin
    LRelatoSegmento20_04_10_01 := LRelatoSegmento.RelatoSegmento20_04_10_01s.New(Connection);
    LRelatoSegmento20_04_10_01.Linha := laco;
    LRelatoSegmento20_04_10_01.Data := TRelatoSegmento20_04_10_01Model.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeDetalhe[laco].Data);
    LRelatoSegmento20_04_10_01.Banco := TRelatoSegmento20_04_10_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeDetalhe[laco].Banco);
    LRelatoSegmento20_04_10_01.Agencia := TRelatoSegmento20_04_10_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeDetalhe[laco].Agencia);
    LRelatoSegmento20_04_10_01.Conta := TRelatoSegmento20_04_10_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeDetalhe[laco].Conta);
    LRelatoSegmento20_04_10_01.DigitoConta := TRelatoSegmento20_04_10_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeDetalhe[laco].DigitoConta);
    LRelatoSegmento20_04_10_01.ChequeInicial := TRelatoSegmento20_04_10_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeDetalhe[laco].ChequeInicial);
    LRelatoSegmento20_04_10_01.ChequeFinal := TRelatoSegmento20_04_10_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeDetalhe[laco].ChequeFinal);
    LRelatoSegmento20_04_10_01.Motivo := TRelatoSegmento20_04_10_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRechequeDetalhe[laco].Motivo);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalRiskscoringMesesQuantidade - 1 do
  begin
    LRelatoSegmento20_07_01_RiskMes := LRelatoSegmento.RelatoSegmento20_07_01_RiskMeses.New(Connection);
    LRelatoSegmento20_07_01_RiskMes.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalRiskscoringMeses[laco]);
    LRelatoSegmento20_07_01_RiskMes.Linha := laco;
    LRelatoSegmento20_07_01_RiskMes.DataHora := TRelatoSegmento20_07_01_RiskMesModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalRiskscoringMeses[laco].DataHora);
    LRelatoSegmento20_07_01_RiskMes.FatorRiskScoring := TRelatoSegmento20_07_01_RiskMesModel.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalRiskscoringMeses[laco].FatorRiskscoring);
    LRelatoSegmento20_07_01_RiskMes.FatorPrInad := TRelatoSegmento20_07_01_RiskMesModel.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalRiskscoringMeses[laco].FatorPrinad);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalRiskscoringPrinadMesesQuantidade - 1 do
  begin
    LRelatoSegmento20_07_01_RiskMes := LRelatoSegmento.RelatoSegmento20_07_01_RiskMeses.New(Connection);
    LRelatoSegmento20_07_01_RiskMes.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalRiskscoringPrinadMeses[laco]);
    LRelatoSegmento20_07_01_RiskMes.Linha := laco;
    LRelatoSegmento20_07_01_RiskMes.DataHora := TRelatoSegmento20_07_01_RiskMesModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalRiskscoringPrinadMeses[laco].DataHora);
    LRelatoSegmento20_07_01_RiskMes.FatorRiskScoring := TRelatoSegmento20_07_01_RiskMesModel.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalRiskscoringPrinadMeses[laco].FatorRiskscoring);
    LRelatoSegmento20_07_01_RiskMes.FatorPrInad := TRelatoSegmento20_07_01_RiskMesModel.NullableExtended(
      Cadastro.RelatoSegmento.PosicionalRiskscoringPrinadMeses[laco].FatorPrinad);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalFatoresAutorizadoresQuantidade - 1 do
  begin
    LRelatoSegmentoFatAutor := LRelatoSegmento.RelatoSegmentoFatAutores.New(Connection);
    LRelatoSegmentoFatAutor.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalFatoresAutorizadores[laco]);
    LRelatoSegmentoFatAutor.Linha := laco;
    LRelatoSegmentoFatAutor.DataHora :=
      Cadastro.RelatoSegmento.PosicionalFatoresAutorizadores[laco].DataHora;
    LRelatoSegmentoFatAutor.FatorAutorizador := TRelatoSegmentoFatAutorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalFatoresAutorizadores[laco].FatorAutorizador);
    LRelatoSegmentoFatAutor.CodigoCnae := TRelatoSegmentoFatAutorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalFatoresAutorizadores[laco].CodigoCNAE);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalFatoresAutorizadoresPQQuantidade - 1 do
  begin
    LRelatoSegmentoFatAutor := LRelatoSegmento.RelatoSegmentoFatAutores.New(Connection);
    LRelatoSegmentoFatAutor.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalFatoresAutorizadoresPQ[laco]);
    LRelatoSegmentoFatAutor.Linha := laco;
    LRelatoSegmentoFatAutor.DataHora :=
      Cadastro.RelatoSegmento.PosicionalFatoresAutorizadoresPQ[laco].DataHora;
    LRelatoSegmentoFatAutor.FatorAutorizador := TRelatoSegmentoFatAutorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalFatoresAutorizadoresPQ[laco].FatorAutorizador);
    LRelatoSegmentoFatAutor.CodigoCnae := TRelatoSegmentoFatAutorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalFatoresAutorizadoresPQ[laco].CodigoCNAE);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalInformacoesAutorizadoresHQuantidade - 1 do
  begin
    LRelatoSegmentoFatAutor := LRelatoSegmento.RelatoSegmentoFatAutores.New(Connection);
    LRelatoSegmentoFatAutor.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalInformacoesAutorizadoresH[laco]);
    LRelatoSegmentoFatAutor.Linha := laco;
    LRelatoSegmentoFatAutor.DataHora :=
      Cadastro.RelatoSegmento.PosicionalInformacoesAutorizadoresH[laco].DataHora;
    LRelatoSegmentoFatAutor.Mensagem := TRelatoSegmentoFatAutorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesAutorizadoresH[laco].Mensagem);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalInformacoesAutorizadoresEQuantidade - 1 do
  begin
    LRelatoSegmentoFatAutor := LRelatoSegmento.RelatoSegmentoFatAutores.New(Connection);
    LRelatoSegmentoFatAutor.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalInformacoesAutorizadoresE[laco]);
    LRelatoSegmentoFatAutor.Linha := laco;
    LRelatoSegmentoFatAutor.DataHora :=
      Cadastro.RelatoSegmento.PosicionalInformacoesAutorizadoresE[laco].DataHora;
    LRelatoSegmentoFatAutor.FatorAutorizador := TRelatoSegmentoFatAutorModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesAutorizadoresE[laco].FatorAutorizador);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalInformacoesRiskscoringQuantidade - 1 do
  begin
    LRelatoSegmento20_07_01_Risk := LRelatoSegmento.RelatoSegmento20_07_01_Risks.New(Connection);
    LRelatoSegmento20_07_01_Risk.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalInformacoesRiskscoring[laco]);
    LRelatoSegmento20_07_01_Risk.Linha := laco;
    LRelatoSegmento20_07_01_Risk.DataHora := TRelatoSegmento20_07_01_RiskModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalInformacoesRiskscoring[laco].DataHora);
    LRelatoSegmento20_07_01_Risk.Mensagem := TRelatoSegmento20_07_01_RiskModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRiskscoring[laco].Mensagem);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalInformacoesRiskscoringPrinadQuantidade - 1 do
  begin
    LRelatoSegmento20_07_01_Risk := LRelatoSegmento.RelatoSegmento20_07_01_Risks.New(Connection);
    LRelatoSegmento20_07_01_Risk.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalInformacoesRiskscoringPrinad[laco]);
    LRelatoSegmento20_07_01_Risk.Linha := laco;
    LRelatoSegmento20_07_01_Risk.DataHora := TRelatoSegmento20_07_01_RiskModel.NullableDateTime(
      Cadastro.RelatoSegmento.PosicionalInformacoesRiskscoringPrinad[laco].DataHora);
    LRelatoSegmento20_07_01_Risk.Mensagem := TRelatoSegmento20_07_01_RiskModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesRiskscoringPrinad[laco].Mensagem);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalConcentreQuantidade - 1 do
  begin
    LRelatoSegmento20_04_02_01 := LRelatoSegmento.RelatoSegmento20_04_02_01s.New(Connection);
    LRelatoSegmento20_04_02_01.Linha := laco;
    LRelatoSegmento20_04_02_01.Grafias := TRelatoSegmento20_04_02_01Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalConcentre[laco].Grafias);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_FonInf := LRelatoSegmento.RelatoSegmento20_02_01_FonInfs.New(Connection);
    LRelatoSegmento20_02_01_FonInf.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedores[laco]);
    LRelatoSegmento20_02_01_FonInf.Linha := laco;
    LRelatoSegmento20_02_01_FonInf.QtdFontes := TRelatoSegmento20_02_01_FonInfModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedores[laco].QuantidadeFontes);
    LRelatoSegmento20_02_01_FonInf.QtdFontesPerfilHistPag := TRelatoSegmento20_02_01_FonInfModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedores[laco].QuantidadeFontesPefilHistoricoPagamentos);
    LRelatoSegmento20_02_01_FonInf.QtdFontesEvCompromisso := TRelatoSegmento20_02_01_FonInfModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedores[laco].QuantidadeFontesEvolucaoCompromisso);
    LRelatoSegmento20_02_01_FonInf.QtdFontesRefNegocios := TRelatoSegmento20_02_01_FonInfModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedores[laco].QuantidadeFontesReferenciaisNegocios);
    LRelatoSegmento20_02_01_FonInf.QtdFontesRefNegPag := TRelatoSegmento20_02_01_FonInfModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedores[laco].QuantidadeFontesReferenciaisNegociosPagamentoAVista);
    LRelatoSegmento20_02_01_FonInf.QtdFontesHistPag := TRelatoSegmento20_02_01_FonInfModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedores[laco].QuantidadeFontesHistoricoPagamentos);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresSegmentoQuantidade - 1 do
  begin
    LRelatoSegmento20_02_01_FonInf := LRelatoSegmento.RelatoSegmento20_02_01_FonInfs.New(Connection);
    LRelatoSegmento20_02_01_FonInf.Tipo :=
      GetTipoParaTabela(Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresSegmento[laco]);
    LRelatoSegmento20_02_01_FonInf.Linha := laco;
    LRelatoSegmento20_02_01_FonInf.QtdFontes := TRelatoSegmento20_02_01_FonInfModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresSegmento[laco].QuantidadeFontes);
    LRelatoSegmento20_02_01_FonInf.QtdFontesPerfilHistPag := TRelatoSegmento20_02_01_FonInfModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresSegmento[laco].QuantidadeFontesPefilHistoricoPagamentos);
    LRelatoSegmento20_02_01_FonInf.QtdFontesEvCompromisso := TRelatoSegmento20_02_01_FonInfModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresSegmento[laco].QuantidadeFontesEvolucaoCompromisso);
    LRelatoSegmento20_02_01_FonInf.QtdFontesRefNegocios := TRelatoSegmento20_02_01_FonInfModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresSegmento[laco].QuantidadeFontesReferenciaisNegocios);
    LRelatoSegmento20_02_01_FonInf.QtdFontesRefNegPag := TRelatoSegmento20_02_01_FonInfModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresSegmento[laco].QuantidadeFontesReferenciaisNegociosPagamentoAVista);
    LRelatoSegmento20_02_01_FonInf.QtdFontesHistPag := TRelatoSegmento20_02_01_FonInfModel.Nullable(
      Cadastro.RelatoSegmento.PosicionalRelacionamentoFornecedoresSegmento[laco].QuantidadeFontesHistoricoPagamentos);
  end;

  if Assigned(Cadastro.RelatoSegmento.PosicionalInformacoesMonitore) then
  begin
    LRelatoSegmento20_08_01_02 := LRelatoSegmento.RelatoSegmento20_08_01_02;
    LRelatoSegmento20_08_01_02.CodigoRetorno := TRelatoSegmento20_08_01_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesMonitore.CodigoRetorno);
    LRelatoSegmento20_08_01_02.Mensagem := TRelatoSegmento20_08_01_02Model.Nullable(
      Cadastro.RelatoSegmento.PosicionalInformacoesMonitore.Mensagem);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabilQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_00_00 := LRelatoSegmento.RelatoSegmento20_89_00_00s.New(Connection);
    LRelatoSegmento20_89_00_00.Linha := laco;
    LRelatoSegmento20_89_00_00.CNPJ := TRelatoSegmento20_89_00_00Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabilNRCT[laco].CNPJ);
    LRelatoSegmento20_89_00_00.UserId := TRelatoSegmento20_89_00_00Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabilNRCT[laco].UserId);
    LRelatoSegmento20_89_00_00.DataHora := TRelatoSegmento20_89_00_00Model.NullableDateTime(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabilNRCT[laco].DataHora);
    LRelatoSegmento20_89_00_00.Trans := TRelatoSegmento20_89_00_00Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabilNRCT[laco].Trans);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_01_01 := LRelatoSegmento.RelatoSegmento20_89_01_01s.New(Connection);
    LRelatoSegmento20_89_01_01.Linha := laco;
    LRelatoSegmento20_89_01_01.DesPer := TRelatoSegmento20_89_01_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT[laco].DesPer);
    LRelatoSegmento20_89_01_01.ValVencCli := TRelatoSegmento20_89_01_01Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT[laco].ValVencCli);
    LRelatoSegmento20_89_01_01.ValVencOut := TRelatoSegmento20_89_01_01Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT[laco].ValVencOut);
    LRelatoSegmento20_89_01_01.QtdVencFact := TRelatoSegmento20_89_01_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT[laco].QtdVencFact);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_01_02 := LRelatoSegmento.RelatoSegmento20_89_01_02s.New(Connection);
    LRelatoSegmento20_89_01_02.Linha := laco;
    LRelatoSegmento20_89_01_02.DesPer := TRelatoSegmento20_89_01_02Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT[laco].DesPer);
    LRelatoSegmento20_89_01_02.ValAVencCli := TRelatoSegmento20_89_01_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT[laco].ValAVencCli);
    LRelatoSegmento20_89_01_02.ValAVencOut := TRelatoSegmento20_89_01_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT[laco].ValAVencOut);
    LRelatoSegmento20_89_01_02.QtdAVencFact := TRelatoSegmento20_89_01_02Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT[laco].QtdAVencFact);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_01_03 := LRelatoSegmento.RelatoSegmento20_89_01_03s.New(Connection);
    LRelatoSegmento20_89_01_03.Linha := laco;
    LRelatoSegmento20_89_01_03.Ano1Prf := TRelatoSegmento20_89_01_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT[laco].Ano1Prf);
    LRelatoSegmento20_89_01_03.Mes1Prf := TRelatoSegmento20_89_01_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT[laco].Mes1Prf);
    LRelatoSegmento20_89_01_03.MesDesp := TRelatoSegmento20_89_01_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT[laco].MesDesp);
    LRelatoSegmento20_89_01_03.ValVencCli := TRelatoSegmento20_89_01_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT[laco].ValVencCli);
    LRelatoSegmento20_89_01_03.ValVencOut := TRelatoSegmento20_89_01_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT[laco].ValVencOut);
    LRelatoSegmento20_89_01_03.QtdVencFact := TRelatoSegmento20_89_01_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT[laco].QtdVencFact);
    LRelatoSegmento20_89_01_03.ValAVencCli := TRelatoSegmento20_89_01_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT[laco].ValAVencCli);
    LRelatoSegmento20_89_01_03.ValAVencOut := TRelatoSegmento20_89_01_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT[laco].ValAVencOut);
    LRelatoSegmento20_89_01_03.QtdAVencFact := TRelatoSegmento20_89_01_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT[laco].QtdAVencFact);
    LRelatoSegmento20_89_01_03.TotValAbr := TRelatoSegmento20_89_01_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT[laco].TotValAbr);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_02_01 := LRelatoSegmento.RelatoSegmento20_89_02_01s.New(Connection);
    LRelatoSegmento20_89_02_01.Linha := laco;
    LRelatoSegmento20_89_02_01.Ano1Prf := TRelatoSegmento20_89_02_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT[laco].Ano1Prf);
    LRelatoSegmento20_89_02_01.Mes1Prf := TRelatoSegmento20_89_02_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT[laco].Mes1Prf);
    LRelatoSegmento20_89_02_01.MesDesp := TRelatoSegmento20_89_02_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT[laco].MesDesp);
    LRelatoSegmento20_89_02_01.QtdCliPont := TRelatoSegmento20_89_02_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT[laco].QtdCliPont);
    LRelatoSegmento20_89_02_01.QtdCli815 := TRelatoSegmento20_89_02_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT[laco].QtdCli815);
    LRelatoSegmento20_89_02_01.QtdCli1630 := TRelatoSegmento20_89_02_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT[laco].QtdCli1630);
    LRelatoSegmento20_89_02_01.QtdCli3160 := TRelatoSegmento20_89_02_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT[laco].QtdCli3160);
    LRelatoSegmento20_89_02_01.QtdCliM60 := TRelatoSegmento20_89_02_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT[laco].QtdCliM60);
    LRelatoSegmento20_89_02_01.QtdCliVist := TRelatoSegmento20_89_02_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT[laco].QtdCliVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_02_02 := LRelatoSegmento.RelatoSegmento20_89_02_02s.New(Connection);
    LRelatoSegmento20_89_02_02.Linha := laco;
    LRelatoSegmento20_89_02_02.Ano1Prf := TRelatoSegmento20_89_02_02Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT[laco].Ano1Prf);
    LRelatoSegmento20_89_02_02.Mes1Prf := TRelatoSegmento20_89_02_02Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT[laco].Mes1Prf);
    LRelatoSegmento20_89_02_02.MesDesp := TRelatoSegmento20_89_02_02Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT[laco].MesDesp);
    LRelatoSegmento20_89_02_02.ValCliPont := TRelatoSegmento20_89_02_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT[laco].ValCliPont);
    LRelatoSegmento20_89_02_02.ValCli815 := TRelatoSegmento20_89_02_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT[laco].ValCli815);
    LRelatoSegmento20_89_02_02.ValCli1630 := TRelatoSegmento20_89_02_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT[laco].ValCli1630);
    LRelatoSegmento20_89_02_02.ValCli3160 := TRelatoSegmento20_89_02_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT[laco].ValCli3160);
    LRelatoSegmento20_89_02_02.ValCliM60 := TRelatoSegmento20_89_02_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT[laco].ValCliM60);
    LRelatoSegmento20_89_02_02.ValCliVist := TRelatoSegmento20_89_02_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT[laco].ValCliVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_02_03 := LRelatoSegmento.RelatoSegmento20_89_02_03s.New(Connection);
    LRelatoSegmento20_89_02_03.Linha := laco;
    LRelatoSegmento20_89_02_03.Ano1Prf := TRelatoSegmento20_89_02_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT[laco].Ano1Prf);
    LRelatoSegmento20_89_02_03.Mes1Prf := TRelatoSegmento20_89_02_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT[laco].Mes1Prf);
    LRelatoSegmento20_89_02_03.MesDesp := TRelatoSegmento20_89_02_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT[laco].MesDesp);
    LRelatoSegmento20_89_02_03.VlmCliPont := TRelatoSegmento20_89_02_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT[laco].VlmCliPont);
    LRelatoSegmento20_89_02_03.VlmCli815 := TRelatoSegmento20_89_02_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT[laco].VlmCli815);
    LRelatoSegmento20_89_02_03.VlmCli1630 := TRelatoSegmento20_89_02_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT[laco].VlmCli1630);
    LRelatoSegmento20_89_02_03.VlmCli3160 := TRelatoSegmento20_89_02_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT[laco].VlmCli3160);
    LRelatoSegmento20_89_02_03.VlmCliM60 := TRelatoSegmento20_89_02_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT[laco].VlmCliM60);
    LRelatoSegmento20_89_02_03.VlmCliVist := TRelatoSegmento20_89_02_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT[laco].VlmCliVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_02_04 := LRelatoSegmento.RelatoSegmento20_89_02_04s.New(Connection);
    LRelatoSegmento20_89_02_04.Linha := laco;
    LRelatoSegmento20_89_02_04.TotCliPont := TRelatoSegmento20_89_02_04Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT[laco].TotCliPont);
    LRelatoSegmento20_89_02_04.TotCli815 := TRelatoSegmento20_89_02_04Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT[laco].TotCli815);
    LRelatoSegmento20_89_02_04.TotCli1630 := TRelatoSegmento20_89_02_04Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT[laco].TotCli1630);
    LRelatoSegmento20_89_02_04.TotCli3160 := TRelatoSegmento20_89_02_04Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT[laco].TotCli3160);
    LRelatoSegmento20_89_02_04.TotCliM60 := TRelatoSegmento20_89_02_04Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT[laco].TotCliM60);
    LRelatoSegmento20_89_02_04.TotCliVist := TRelatoSegmento20_89_02_04Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT[laco].TotCliVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_02_05 := LRelatoSegmento.RelatoSegmento20_89_02_05s.New(Connection);
    LRelatoSegmento20_89_02_05.Linha := laco;
    LRelatoSegmento20_89_02_05.Ano1Prf := TRelatoSegmento20_89_02_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT[laco].Ano1Prf);
    LRelatoSegmento20_89_02_05.Mes1Prf := TRelatoSegmento20_89_02_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT[laco].Mes1Prf);
    LRelatoSegmento20_89_02_05.MesDesp := TRelatoSegmento20_89_02_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT[laco].MesDesp);
    LRelatoSegmento20_89_02_05.QtdOutPont := TRelatoSegmento20_89_02_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT[laco].QtdOutPont);
    LRelatoSegmento20_89_02_05.QtdOut815 := TRelatoSegmento20_89_02_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT[laco].QtdOut815);
    LRelatoSegmento20_89_02_05.QtdOut1630 := TRelatoSegmento20_89_02_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT[laco].QtdOut1630);
    LRelatoSegmento20_89_02_05.QtdOut3160 := TRelatoSegmento20_89_02_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT[laco].QtdOut3160);
    LRelatoSegmento20_89_02_05.QtdOutM60 := TRelatoSegmento20_89_02_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT[laco].QtdOutM60);
    LRelatoSegmento20_89_02_05.QtdOutVist := TRelatoSegmento20_89_02_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT[laco].QtdOutVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_02_06 := LRelatoSegmento.RelatoSegmento20_89_02_06s.New(Connection);
    LRelatoSegmento20_89_02_06.Linha := laco;
    LRelatoSegmento20_89_02_06.Ano1Prf := TRelatoSegmento20_89_02_06Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT[laco].Ano1Prf);
    LRelatoSegmento20_89_02_06.Mes1Prf := TRelatoSegmento20_89_02_06Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT[laco].Mes1Prf);
    LRelatoSegmento20_89_02_06.MesDesp := TRelatoSegmento20_89_02_06Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT[laco].MesDesp);
    LRelatoSegmento20_89_02_06.ValOutPont := TRelatoSegmento20_89_02_06Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT[laco].ValOutPont);
    LRelatoSegmento20_89_02_06.ValOut815 := TRelatoSegmento20_89_02_06Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT[laco].ValOut815);
    LRelatoSegmento20_89_02_06.ValOut1630 := TRelatoSegmento20_89_02_06Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT[laco].ValOut1630);
    LRelatoSegmento20_89_02_06.ValOut3160 := TRelatoSegmento20_89_02_06Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT[laco].ValOut3160);
    LRelatoSegmento20_89_02_06.ValOutM60 := TRelatoSegmento20_89_02_06Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT[laco].ValOutM60);
    LRelatoSegmento20_89_02_06.ValOutVist := TRelatoSegmento20_89_02_06Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT[laco].ValOutVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_02_07 := LRelatoSegmento.RelatoSegmento20_89_02_07s.New(Connection);
    LRelatoSegmento20_89_02_07.Linha := laco;
    LRelatoSegmento20_89_02_07.Ano1Prf := TRelatoSegmento20_89_02_07Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT[laco].Ano1Prf);
    LRelatoSegmento20_89_02_07.Mes1Prf := TRelatoSegmento20_89_02_07Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT[laco].Mes1Prf);
    LRelatoSegmento20_89_02_07.MesDesp := TRelatoSegmento20_89_02_07Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT[laco].MesDesp);
    LRelatoSegmento20_89_02_07.VlmOutPont := TRelatoSegmento20_89_02_07Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT[laco].VlmOutPont);
    LRelatoSegmento20_89_02_07.VlmOut815 := TRelatoSegmento20_89_02_07Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT[laco].VlmOut815);
    LRelatoSegmento20_89_02_07.VlmOut1630 := TRelatoSegmento20_89_02_07Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT[laco].VlmOut1630);
    LRelatoSegmento20_89_02_07.VlmOut3160 := TRelatoSegmento20_89_02_07Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT[laco].VlmOut3160);
    LRelatoSegmento20_89_02_07.VlmOutM60 := TRelatoSegmento20_89_02_07Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT[laco].VlmOutM60);
    LRelatoSegmento20_89_02_07.VlmOutVist := TRelatoSegmento20_89_02_07Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT[laco].VlmOutVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_02_08 := LRelatoSegmento.RelatoSegmento20_89_02_08s.New(Connection);
    LRelatoSegmento20_89_02_08.Linha := laco;
    LRelatoSegmento20_89_02_08.Ano1Prf := TRelatoSegmento20_89_02_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT[laco].Ano1Prf);
    LRelatoSegmento20_89_02_08.Mes1Prf := TRelatoSegmento20_89_02_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT[laco].Mes1Prf);
    LRelatoSegmento20_89_02_08.MesDesp := TRelatoSegmento20_89_02_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT[laco].MesDesp);
    LRelatoSegmento20_89_02_08.QtdFacPont := TRelatoSegmento20_89_02_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT[laco].QtdFacPont);
    LRelatoSegmento20_89_02_08.QtdFac815 := TRelatoSegmento20_89_02_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT[laco].QtdFac815);
    LRelatoSegmento20_89_02_08.QtdFac1630 := TRelatoSegmento20_89_02_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT[laco].QtdFac1630);
    LRelatoSegmento20_89_02_08.QtdFac3160 := TRelatoSegmento20_89_02_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT[laco].QtdFac3160);
    LRelatoSegmento20_89_02_08.QtdFacM60 := TRelatoSegmento20_89_02_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT[laco].QtdFacM60);
    LRelatoSegmento20_89_02_08.QtdFacVist := TRelatoSegmento20_89_02_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT[laco].QtdFacVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_02_09 := LRelatoSegmento.RelatoSegmento20_89_02_09s.New(Connection);
    LRelatoSegmento20_89_02_09.Linha := laco;
    LRelatoSegmento20_89_02_09.TotOutPont := TRelatoSegmento20_89_02_09Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT[laco].TotOutPont);
    LRelatoSegmento20_89_02_09.TotOut815 := TRelatoSegmento20_89_02_09Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT[laco].TotOut815);
    LRelatoSegmento20_89_02_09.TotOut1630 := TRelatoSegmento20_89_02_09Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT[laco].TotOut1630);
    LRelatoSegmento20_89_02_09.TotOut3160 := TRelatoSegmento20_89_02_09Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT[laco].TotOut3160);
    LRelatoSegmento20_89_02_09.TotOutM60 := TRelatoSegmento20_89_02_09Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT[laco].TotOutM60);
    LRelatoSegmento20_89_02_09.TotOutCedVist := TRelatoSegmento20_89_02_09Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT[laco].TotOutCedVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_02_10 := LRelatoSegmento.RelatoSegmento20_89_02_10s.New(Connection);
    LRelatoSegmento20_89_02_10.Linha := laco;
    LRelatoSegmento20_89_02_10.TotFacPont := TRelatoSegmento20_89_02_10Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT[laco].TotFacPont);
    LRelatoSegmento20_89_02_10.TotFac815 := TRelatoSegmento20_89_02_10Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT[laco].TotFac815);
    LRelatoSegmento20_89_02_10.TotFac1630 := TRelatoSegmento20_89_02_10Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT[laco].TotFac1630);
    LRelatoSegmento20_89_02_10.TotFac3160 := TRelatoSegmento20_89_02_10Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT[laco].TotFac3160);
    LRelatoSegmento20_89_02_10.TotFacM60 := TRelatoSegmento20_89_02_10Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT[laco].TotFacM60);
    LRelatoSegmento20_89_02_10.TotFacVist := TRelatoSegmento20_89_02_10Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT[laco].TotFacVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaQuantidadeNRCT - 1 do
  begin
    LRelatoSegmento20_89_02_11 := LRelatoSegmento.RelatoSegmento20_89_02_11s.New(Connection);
    LRelatoSegmento20_89_02_11.Linha := laco;
    LRelatoSegmento20_89_02_11.Ano1Prf := TRelatoSegmento20_89_02_11Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT[laco].Ano1Prf);
    LRelatoSegmento20_89_02_11.Mes1Prf := TRelatoSegmento20_89_02_11Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT[laco].Mes1Prf);
    LRelatoSegmento20_89_02_11.MesDesp := TRelatoSegmento20_89_02_11Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT[laco].MesDesp);
    LRelatoSegmento20_89_02_11.PercCliQtde := TRelatoSegmento20_89_02_11Model.NullableExtended(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT[laco].PercCliQtde);
    LRelatoSegmento20_89_02_11.PercCliVal := TRelatoSegmento20_89_02_11Model.NullableExtended(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT[laco].PercCliVal);
    LRelatoSegmento20_89_02_11.PercOutQtde := TRelatoSegmento20_89_02_11Model.NullableExtended(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT[laco].PercOutQtde);
    LRelatoSegmento20_89_02_11.PercOutVal := TRelatoSegmento20_89_02_11Model.NullableExtended(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT[laco].PercOutVal);
    LRelatoSegmento20_89_02_11.QtdOutFact := TRelatoSegmento20_89_02_11Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT[laco].QtdOutFact);
  end;
{ Central de Títulos Segmento Factoring
  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabilQuantidade - 1 do
  begin
    LRelatoSegmento20_89_11_00 := LRelatoSegmento.RelatoSegmento20_89_11_00s.New(Connection);
    LRelatoSegmento20_89_11_00.Linha := laco;
    LRelatoSegmento20_89_11_00.CNPJ := TRelatoSegmento20_89_11_00Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabil[laco].CNPJ);
    LRelatoSegmento20_89_11_00.UserId := TRelatoSegmento20_89_11_00Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabil[laco].UserId);
    LRelatoSegmento20_89_11_00.DataHora := TRelatoSegmento20_89_11_00Model.NullableDateTime(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabil[laco].DataHora);
    LRelatoSegmento20_89_11_00.Tran1 := TRelatoSegmento20_89_11_00Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabil[laco].Tran1);
    LRelatoSegmento20_89_11_00.Tran2 := TRelatoSegmento20_89_11_00Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabil[laco].Tran2);
    LRelatoSegmento20_89_11_00.Tran3 := TRelatoSegmento20_89_11_00Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabil[laco].Tran3);
    LRelatoSegmento20_89_11_00.Tran4 := TRelatoSegmento20_89_11_00Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabil[laco].Tran4);
    LRelatoSegmento20_89_11_00.Tran5 := TRelatoSegmento20_89_11_00Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabil[laco].Tran5);
    LRelatoSegmento20_89_11_00.Tran6 := TRelatoSegmento20_89_11_00Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoRegistroControleContabil[laco].Tran6);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteQuantidade - 1 do
  begin
    LRelatoSegmento20_89_11_01 := LRelatoSegmento.RelatoSegmento20_89_11_01s.New(Connection);
    LRelatoSegmento20_89_11_01.Linha := laco;
    LRelatoSegmento20_89_11_01.CodSub := TRelatoSegmento20_89_11_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosCedente[laco].CodSub);
    LRelatoSegmento20_89_11_01.DesPer := TRelatoSegmento20_89_11_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosCedente[laco].DesPer);
    LRelatoSegmento20_89_11_01.ValVencCli := TRelatoSegmento20_89_11_01Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosCedente[laco].ValVencCli);
    LRelatoSegmento20_89_11_01.ValVencOut := TRelatoSegmento20_89_11_01Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosCedente[laco].ValVencOut);
    LRelatoSegmento20_89_11_01.QtdVencFact := TRelatoSegmento20_89_11_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosCedente[laco].QtdVencFact);
    LRelatoSegmento20_89_11_01.ValVencSub := TRelatoSegmento20_89_11_01Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosCedente[laco].ValVencSub);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteQuantidade - 1 do
  begin
    LRelatoSegmento20_89_11_02 := LRelatoSegmento.RelatoSegmento20_89_11_02s.New(Connection);
    LRelatoSegmento20_89_11_02.Linha := laco;
    LRelatoSegmento20_89_11_02.CodSub := TRelatoSegmento20_89_11_02Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosAVencerCedente[laco].CodSub);
    LRelatoSegmento20_89_11_02.DesPer := TRelatoSegmento20_89_11_02Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosAVencerCedente[laco].DesPer);
    LRelatoSegmento20_89_11_02.ValAVencCli := TRelatoSegmento20_89_11_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosAVencerCedente[laco].ValAVencCli);
    LRelatoSegmento20_89_11_02.ValAVencOut := TRelatoSegmento20_89_11_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosAVencerCedente[laco].ValAVencOut);
    LRelatoSegmento20_89_11_02.QtdAVencFact := TRelatoSegmento20_89_11_02Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosAVencerCedente[laco].QtdAVencFact);
    LRelatoSegmento20_89_11_02.ValAVencSub := TRelatoSegmento20_89_11_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosAVencerCedente[laco].ValAVencSub);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalQuantidade - 1 do
  begin
    LRelatoSegmento20_89_11_03 := LRelatoSegmento.RelatoSegmento20_89_11_03s.New(Connection);
    LRelatoSegmento20_89_11_03.Linha := laco;
    LRelatoSegmento20_89_11_03.CodSub := TRelatoSegmento20_89_11_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal[laco].CodSub);
    LRelatoSegmento20_89_11_03.Ano1Prf := TRelatoSegmento20_89_11_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal[laco].Ano1Prf);
    LRelatoSegmento20_89_11_03.Mes1Prf := TRelatoSegmento20_89_11_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal[laco].Mes1Prf);
    LRelatoSegmento20_89_11_03.MesDesp := TRelatoSegmento20_89_11_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal[laco].MesDesp);
    LRelatoSegmento20_89_11_03.ValVencCli := TRelatoSegmento20_89_11_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal[laco].ValVencCli);
    LRelatoSegmento20_89_11_03.ValVencOut := TRelatoSegmento20_89_11_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal[laco].ValVencOut);
    LRelatoSegmento20_89_11_03.QtdVencFact := TRelatoSegmento20_89_11_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal[laco].QtdVencFact);
    LRelatoSegmento20_89_11_03.ValVencSub := TRelatoSegmento20_89_11_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal[laco].ValVencSub);
    LRelatoSegmento20_89_11_03.ValAVencCli := TRelatoSegmento20_89_11_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal[laco].ValAVencCli);
    LRelatoSegmento20_89_11_03.ValAVencOut := TRelatoSegmento20_89_11_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal[laco].ValAVencOut);
    LRelatoSegmento20_89_11_03.QtdAVencFact := TRelatoSegmento20_89_11_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal[laco].QtdAVencFact);
    LRelatoSegmento20_89_11_03.ValAVencSub := TRelatoSegmento20_89_11_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal[laco].ValAVencSub);
    LRelatoSegmento20_89_11_03.TotValAbr := TRelatoSegmento20_89_11_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal[laco].TotValAbr);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosQuantidade - 1 do
  begin
    LRelatoSegmento20_89_12_01 := LRelatoSegmento.RelatoSegmento20_89_12_01s.New(Connection);
    LRelatoSegmento20_89_12_01.Linha := laco;
    LRelatoSegmento20_89_12_01.Ano1Prf := TRelatoSegmento20_89_12_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulos[laco].Ano1Prf);
    LRelatoSegmento20_89_12_01.Mes1Prf := TRelatoSegmento20_89_12_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulos[laco].Mes1Prf);
    LRelatoSegmento20_89_12_01.MesDesp := TRelatoSegmento20_89_12_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulos[laco].MesDesp);
    LRelatoSegmento20_89_12_01.QtdCliPont := TRelatoSegmento20_89_12_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulos[laco].QtdCliPont);
    LRelatoSegmento20_89_12_01.QtdCli815 := TRelatoSegmento20_89_12_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulos[laco].QtdCli815);
    LRelatoSegmento20_89_12_01.QtdCli1630 := TRelatoSegmento20_89_12_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulos[laco].QtdCli1630);
    LRelatoSegmento20_89_12_01.QtdCli3160 := TRelatoSegmento20_89_12_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulos[laco].QtdCli3160);
    LRelatoSegmento20_89_12_01.QtdCliM60 := TRelatoSegmento20_89_12_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulos[laco].QtdCliM60);
    LRelatoSegmento20_89_12_01.QtdCliVist := TRelatoSegmento20_89_12_01Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulos[laco].QtdCliVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorQuantidade - 1 do
  begin
    LRelatoSegmento20_89_12_02 := LRelatoSegmento.RelatoSegmento20_89_12_02s.New(Connection);
    LRelatoSegmento20_89_12_02.Linha := laco;
    LRelatoSegmento20_89_12_02.Ano1Prf := TRelatoSegmento20_89_12_02Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValor[laco].Ano1Prf);
    LRelatoSegmento20_89_12_02.Mes1Prf := TRelatoSegmento20_89_12_02Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValor[laco].Mes1Prf);
    LRelatoSegmento20_89_12_02.MesDesp := TRelatoSegmento20_89_12_02Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValor[laco].MesDesp);
    LRelatoSegmento20_89_12_02.ValCliPont := TRelatoSegmento20_89_12_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValor[laco].ValCliPont);
    LRelatoSegmento20_89_12_02.ValCli815 := TRelatoSegmento20_89_12_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValor[laco].ValCli815);
    LRelatoSegmento20_89_12_02.ValCli1630 := TRelatoSegmento20_89_12_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValor[laco].ValCli1630);
    LRelatoSegmento20_89_12_02.ValCli3160 := TRelatoSegmento20_89_12_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValor[laco].ValCli3160);
    LRelatoSegmento20_89_12_02.ValCliM60 := TRelatoSegmento20_89_12_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValor[laco].ValCliM60);
    LRelatoSegmento20_89_12_02.ValCliVist := TRelatoSegmento20_89_12_02Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValor[laco].ValCliVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioQuantidade - 1 do
  begin
    LRelatoSegmento20_89_12_03 := LRelatoSegmento.RelatoSegmento20_89_12_03s.New(Connection);
    LRelatoSegmento20_89_12_03.Linha := laco;
    LRelatoSegmento20_89_12_03.Ano1Prf := TRelatoSegmento20_89_12_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedio[laco].Ano1Prf);
    LRelatoSegmento20_89_12_03.Mes1Prf := TRelatoSegmento20_89_12_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedio[laco].Mes1Prf);
    LRelatoSegmento20_89_12_03.MesDesp := TRelatoSegmento20_89_12_03Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedio[laco].MesDesp);
    LRelatoSegmento20_89_12_03.VlmCliPont := TRelatoSegmento20_89_12_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedio[laco].VlmCliPont);
    LRelatoSegmento20_89_12_03.VlmCli815 := TRelatoSegmento20_89_12_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedio[laco].VlmCli815);
    LRelatoSegmento20_89_12_03.VlmCli1630 := TRelatoSegmento20_89_12_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedio[laco].VlmCli1630);
    LRelatoSegmento20_89_12_03.VlmCli3160 := TRelatoSegmento20_89_12_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedio[laco].VlmCli3160);
    LRelatoSegmento20_89_12_03.VlmCliM60 := TRelatoSegmento20_89_12_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedio[laco].VlmCliM60);
    LRelatoSegmento20_89_12_03.VlmCliVist := TRelatoSegmento20_89_12_03Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedio[laco].VlmCliVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalQuantidade - 1 do
  begin
    LRelatoSegmento20_89_12_04 := LRelatoSegmento.RelatoSegmento20_89_12_04s.New(Connection);
    LRelatoSegmento20_89_12_04.Linha := laco;
    LRelatoSegmento20_89_12_04.TotCliPont := TRelatoSegmento20_89_12_04Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotal[laco].TotCliPont);
    LRelatoSegmento20_89_12_04.TotCli815 := TRelatoSegmento20_89_12_04Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotal[laco].TotCli815);
    LRelatoSegmento20_89_12_04.TotCli1630 := TRelatoSegmento20_89_12_04Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotal[laco].TotCli1630);
    LRelatoSegmento20_89_12_04.TotCli3160 := TRelatoSegmento20_89_12_04Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotal[laco].TotCli3160);
    LRelatoSegmento20_89_12_04.TotCliM60 := TRelatoSegmento20_89_12_04Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotal[laco].TotCliM60);
    LRelatoSegmento20_89_12_04.TotCliVist := TRelatoSegmento20_89_12_04Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotal[laco].TotCliVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosQuantidade - 1 do
  begin
    LRelatoSegmento20_89_12_05 := LRelatoSegmento.RelatoSegmento20_89_12_05s.New(Connection);
    LRelatoSegmento20_89_12_05.Linha := laco;
    LRelatoSegmento20_89_12_05.Ano1Prf := TRelatoSegmento20_89_12_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulos[laco].Ano1Prf);
    LRelatoSegmento20_89_12_05.Mes1Prf := TRelatoSegmento20_89_12_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulos[laco].Mes1Prf);
    LRelatoSegmento20_89_12_05.MesDesp := TRelatoSegmento20_89_12_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulos[laco].MesDesp);
    LRelatoSegmento20_89_12_05.QtdOutPont := TRelatoSegmento20_89_12_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulos[laco].QtdOutPont);
    LRelatoSegmento20_89_12_05.QtdOut815 := TRelatoSegmento20_89_12_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulos[laco].QtdOut815);
    LRelatoSegmento20_89_12_05.QtdOut1630 := TRelatoSegmento20_89_12_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulos[laco].QtdOut1630);
    LRelatoSegmento20_89_12_05.QtdOut3160 := TRelatoSegmento20_89_12_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulos[laco].QtdOut3160);
    LRelatoSegmento20_89_12_05.QtdOutM60 := TRelatoSegmento20_89_12_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulos[laco].QtdOutM60);
    LRelatoSegmento20_89_12_05.QtdOutVist := TRelatoSegmento20_89_12_05Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulos[laco].QtdOutVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorQuantidade - 1 do
  begin
    LRelatoSegmento20_89_12_06 := LRelatoSegmento.RelatoSegmento20_89_12_06s.New(Connection);
    LRelatoSegmento20_89_12_06.Linha := laco;
    LRelatoSegmento20_89_12_06.Ano1Prf := TRelatoSegmento20_89_12_06Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValor[laco].Ano1Prf);
    LRelatoSegmento20_89_12_06.Mes1Prf := TRelatoSegmento20_89_12_06Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValor[laco].Mes1Prf);
    LRelatoSegmento20_89_12_06.MesDesp := TRelatoSegmento20_89_12_06Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValor[laco].MesDesp);
    LRelatoSegmento20_89_12_06.ValOutPont := TRelatoSegmento20_89_12_06Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValor[laco].ValOutPont);
    LRelatoSegmento20_89_12_06.ValOut815 := TRelatoSegmento20_89_12_06Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValor[laco].ValOut815);
    LRelatoSegmento20_89_12_06.ValOut1630 := TRelatoSegmento20_89_12_06Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValor[laco].ValOut1630);
    LRelatoSegmento20_89_12_06.ValOut3160 := TRelatoSegmento20_89_12_06Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValor[laco].ValOut3160);
    LRelatoSegmento20_89_12_06.ValOutM60 := TRelatoSegmento20_89_12_06Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValor[laco].ValOutM60);
    LRelatoSegmento20_89_12_06.ValOutVist := TRelatoSegmento20_89_12_06Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValor[laco].ValOutVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioQuantidade - 1 do
  begin
    LRelatoSegmento20_89_12_07 := LRelatoSegmento.RelatoSegmento20_89_12_07s.New(Connection);
    LRelatoSegmento20_89_12_07.Linha := laco;
    LRelatoSegmento20_89_12_07.Ano1Prf := TRelatoSegmento20_89_12_07Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedio[laco].Ano1Prf);
    LRelatoSegmento20_89_12_07.Mes1Prf := TRelatoSegmento20_89_12_07Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedio[laco].Mes1Prf);
    LRelatoSegmento20_89_12_07.MesDesp := TRelatoSegmento20_89_12_07Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedio[laco].MesDesp);
    LRelatoSegmento20_89_12_07.VlmOutPont := TRelatoSegmento20_89_12_07Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedio[laco].VlmOutPont);
    LRelatoSegmento20_89_12_07.VlmOut815 := TRelatoSegmento20_89_12_07Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedio[laco].VlmOut815);
    LRelatoSegmento20_89_12_07.VlmOut1630 := TRelatoSegmento20_89_12_07Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedio[laco].VlmOut1630);
    LRelatoSegmento20_89_12_07.VlmOut3160 := TRelatoSegmento20_89_12_07Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedio[laco].VlmOut3160);
    LRelatoSegmento20_89_12_07.VlmOutM60 := TRelatoSegmento20_89_12_07Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedio[laco].VlmOutM60);
    LRelatoSegmento20_89_12_07.VlmOutVist := TRelatoSegmento20_89_12_07Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedio[laco].VlmOutVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsQuantidade - 1 do
  begin
    LRelatoSegmento20_89_12_08 := LRelatoSegmento.RelatoSegmento20_89_12_08s.New(Connection);
    LRelatoSegmento20_89_12_08.Linha := laco;
    LRelatoSegmento20_89_12_08.Ano1Prf := TRelatoSegmento20_89_12_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactorings[laco].Ano1Prf);
    LRelatoSegmento20_89_12_08.Mes1Prf := TRelatoSegmento20_89_12_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactorings[laco].Mes1Prf);
    LRelatoSegmento20_89_12_08.MesDesp := TRelatoSegmento20_89_12_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactorings[laco].MesDesp);
    LRelatoSegmento20_89_12_08.QtdFacPont := TRelatoSegmento20_89_12_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactorings[laco].QtdFacPont);
    LRelatoSegmento20_89_12_08.QtdFac815 := TRelatoSegmento20_89_12_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactorings[laco].QtdFac815);
    LRelatoSegmento20_89_12_08.QtdFac1630 := TRelatoSegmento20_89_12_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactorings[laco].QtdFac1630);
    LRelatoSegmento20_89_12_08.QtdFac3160 := TRelatoSegmento20_89_12_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactorings[laco].QtdFac3160);
    LRelatoSegmento20_89_12_08.QtdFacM60 := TRelatoSegmento20_89_12_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactorings[laco].QtdFacM60);
    LRelatoSegmento20_89_12_08.QtdFacVist := TRelatoSegmento20_89_12_08Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactorings[laco].QtdFacVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalQuantidade - 1 do
  begin
    LRelatoSegmento20_89_12_09 := LRelatoSegmento.RelatoSegmento20_89_12_09s.New(Connection);
    LRelatoSegmento20_89_12_09.Linha := laco;
    LRelatoSegmento20_89_12_09.TotOutPont := TRelatoSegmento20_89_12_09Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotal[laco].TotOutPont);
    LRelatoSegmento20_89_12_09.TotOut815 := TRelatoSegmento20_89_12_09Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotal[laco].TotOut815);
    LRelatoSegmento20_89_12_09.TotOut1630 := TRelatoSegmento20_89_12_09Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotal[laco].TotOut1630);
    LRelatoSegmento20_89_12_09.TotOut3160 := TRelatoSegmento20_89_12_09Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotal[laco].TotOut3160);
    LRelatoSegmento20_89_12_09.TotOutM60 := TRelatoSegmento20_89_12_09Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotal[laco].TotOutM60);
    LRelatoSegmento20_89_12_09.TotOutVist := TRelatoSegmento20_89_12_09Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotal[laco].TotOutVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsQuantidade - 1 do
  begin
    LRelatoSegmento20_89_12_10 := LRelatoSegmento.RelatoSegmento20_89_12_10s.New(Connection);
    LRelatoSegmento20_89_12_10.Linha := laco;
    LRelatoSegmento20_89_12_10.TotFacPont := TRelatoSegmento20_89_12_10Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactorings[laco].TotFacPont);
    LRelatoSegmento20_89_12_10.TotFac815 := TRelatoSegmento20_89_12_10Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactorings[laco].TotFac815);
    LRelatoSegmento20_89_12_10.TotFac1630 := TRelatoSegmento20_89_12_10Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactorings[laco].TotFac1630);
    LRelatoSegmento20_89_12_10.TotFac3160 := TRelatoSegmento20_89_12_10Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactorings[laco].TotFac3160);
    LRelatoSegmento20_89_12_10.TotFacM60 := TRelatoSegmento20_89_12_10Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactorings[laco].TotFacM60);
    LRelatoSegmento20_89_12_10.TotFacVist := TRelatoSegmento20_89_12_10Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactorings[laco].TotFacVist);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaQuantidade - 1 do
  begin
    LRelatoSegmento20_89_12_11 := LRelatoSegmento.RelatoSegmento20_89_12_11s.New(Connection);
    LRelatoSegmento20_89_12_11.Linha := laco;
    LRelatoSegmento20_89_12_11.Ano1Prf := TRelatoSegmento20_89_12_11Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatistica[laco].Ano1Prf);
    LRelatoSegmento20_89_12_11.Mes1Prf := TRelatoSegmento20_89_12_11Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatistica[laco].Mes1Prf);
    LRelatoSegmento20_89_12_11.MesDesp := TRelatoSegmento20_89_12_11Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatistica[laco].MesDesp);
    LRelatoSegmento20_89_12_11.PercCliQtde := TRelatoSegmento20_89_12_11Model.NullableExtended(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatistica[laco].PercCliQtde);
    LRelatoSegmento20_89_12_11.PercCliVal := TRelatoSegmento20_89_12_11Model.NullableExtended(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatistica[laco].PercCliVal);
    LRelatoSegmento20_89_12_11.PercOutQtde := TRelatoSegmento20_89_12_11Model.NullableExtended(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatistica[laco].PercOutQtde);
    LRelatoSegmento20_89_12_11.PercOutVal := TRelatoSegmento20_89_12_11Model.NullableExtended(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatistica[laco].PercOutVal);
    LRelatoSegmento20_89_12_11.QtdOutFact := TRelatoSegmento20_89_12_11Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatistica[laco].QtdOutFact);
  end;

  for laco := 0 to Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteSubGrupoQuantidade - 1 do
  begin
    LRelatoSegmento20_89_12_12 := LRelatoSegmento.RelatoSegmento20_89_12_12s.New(Connection);
    LRelatoSegmento20_89_12_12.Linha := laco;
    LRelatoSegmento20_89_12_12.CodSub := TRelatoSegmento20_89_12_12Model.Nullable(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteSubGrupo[laco].CodSub);
    LRelatoSegmento20_89_12_12.TotSubPont := TRelatoSegmento20_89_12_12Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteSubGrupo[laco].TotSubPont);
    LRelatoSegmento20_89_12_12.TotSub815 := TRelatoSegmento20_89_12_12Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteSubGrupo[laco].TotSub815);
    LRelatoSegmento20_89_12_12.TotSub1630 := TRelatoSegmento20_89_12_12Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteSubGrupo[laco].TotSub1630);
    LRelatoSegmento20_89_12_12.TotSub3160 := TRelatoSegmento20_89_12_12Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteSubGrupo[laco].TotSub3160);
    LRelatoSegmento20_89_12_12.TotSubM60 := TRelatoSegmento20_89_12_12Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteSubGrupo[laco].TotSubM60);
    LRelatoSegmento20_89_12_12.TotSubVist := TRelatoSegmento20_89_12_12Model.NullableCurrency(
      Cadastro.RelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteSubGrupo[laco].TotSubVist);
  end;
}
  with Connection.StartTransaction do
  begin
    LRelatoSegmentoModelService.Save(LRelatoSegmento);
    Commit;
  end;*)
end;

function TDBCadastros.PodeConsultar(const ACadastro: string;
  const ATipoConsulta: ConsultaCreditoDefinicoes.TTipoConsulta;
  const ALogControl: ILogControl): Boolean;

  function GetConsultaCredito: IConsultaCredito;
  begin
    Result := TConsultaCredito.Create;
    Result.Cadastro := ACadastro;
    Result.Connection := Connection;
  end;

{const
  LValidacaoPrazoValidadeConsulta: array [ConsultaCreditoDefinicoes.TTipoConsulta] of TValidacaoClass = (
    TValidacaoPrazoValidadeConsultaSerasa, //tcRelatoSegmento
    TValidacaoPrazoValidadeConsultaSerasa, //tcCreditBureau
    TValidacaoPrazoValidadeConsultaSerasa, //tcAcheiRecheque
    TValidacaoPrazoValidadeConsultaSerasa, //tcMonitore
    TValidacaoPrazoValidadeConsultaEquifax, //tcEmpresarial
    TValidacaoPrazoValidadeConsultaEquifax, //tcPessoal
    TValidacaoPrazoValidadeConsultaEquifax, //tcChequeEmpresarial
    TValidacaoPrazoValidadeConsultaEquifax, //tcChequePessoal
    TValidacaoPrazoValidadeConsultaEquifax, //tcScoreEmpresarial
    TValidacaoPrazoValidadeConsultaEquifax, //tcScoreEmpresarialCompleto
    TValidacaoPrazoValidadeConsultaEquifax, //tcEmpresarialCompleto
    TValidacaoPrazoValidadeConsultaEquifax, //tcConsultePJ
    TValidacaoPrazoValidadeConsultaEquifax, //tcPessoalCompleto
    TValidacaoPrazoValidadeConsultaEquifax, //tcClickFactorPF
    TValidacaoPrazoValidadeConsultaEquifax, //tcClickFactorPJ
    TValidacaoPrazoValidadeConsultaEquifax, //tcChequeMais
    TValidacaoPrazoValidadeConsultaEquifax, //tcPessoalPlus
    TValidacaoPrazoValidadeConsultaEquifax, //tcConsultePF
    TValidacaoPrazoValidadeConsultaEquifax); //tcEmprGold}
//var
  //LValidacao: IValidacao;
  //LConsultaCredito: IConsultaCredito;
  //LValidacaoSaida: IValidacaoSaida;
begin
  {if ValidarPrazoValidadeConsulta then
  begin
    LValidacao := LValidacaoPrazoValidadeConsulta[ATipoConsulta].Create;
    LConsultaCredito := GetConsultaCredito;
    LValidacaoSaida := LValidacao.Validar(LConsultaCredito);
    Result := LValidacaoSaida.Valido;
    if not Result then
      ALogControl.AddLogList(LValidacaoSaida.Log.LogList);
  end
  else}
    Result := True;
end;

end.
