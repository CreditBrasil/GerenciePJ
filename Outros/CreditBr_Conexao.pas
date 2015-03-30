unit CreditBr_Conexao;

interface

uses
  SysUtils, ServiceLocator, uActiveRecord, ADOInt, Variants, MVC_Iniciadores, CreditBr_Configuracao{, uCtrl_IdModel},
  SyncObjs;

function CriaConexao_WBA: IActiveRecordConnection;

implementation

type
  TActiveRecordDependenciaProjetoGenerico = class(TInterfacedObject)
  private
    FDiferencaDeTempo, FUltimoSincronismo: TDateTime;
    FSecaoCritica: TCriticalSection;
    procedure AjustesIniciais(const AConnection: IActiveRecordConnection);
  protected
    function DatabaseDate(const AConnection: IActiveRecordConnection): TDateTime;
    function DatabaseNow(const AConnection: IActiveRecordConnection): TDateTime;
    function GetNewCtrl_Id(const ACtrlIDName: string; const AConnection: IActiveRecordConnection): Integer;
    function SincronizaDatabaseNow(const AConnection: IActiveRecordConnection): TDateTime; virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TActiveRecordDependenciaProjetoMsSQLServer = class(TActiveRecordDependenciaProjetoGenerico, IActiveRecordDependenciaProjeto)
  protected
    function SincronizaDatabaseNow(const AConnection: IActiveRecordConnection): TDateTime; override;
    { IActiveRecordDependenciaProjeto }
    function LimitadorCondicionalQuantidadeRegistros(AQuantidade: Integer; AIncluiAnd: Boolean): string;
    function LimitadorSeletivoQuantidadeRegistros(AQuantidade: Integer): string;
    function SQLData(const AData: TDateTime): string;
    function SQLNow: string;
  end;

  TActiveRecordDependenciaProjetoOracle = class(TActiveRecordDependenciaProjetoGenerico, IActiveRecordDependenciaProjeto)
  protected
    function SincronizaDatabaseNow(const AConnection: IActiveRecordConnection): TDateTime; override;
    { IActiveRecordDependenciaProjeto }
    function LimitadorCondicionalQuantidadeRegistros(AQuantidade: Integer; AIncluiAnd: Boolean): string;
    function LimitadorSeletivoQuantidadeRegistros(AQuantidade: Integer): string;
    function SQLData(const AData: TDateTime): string;
    function SQLNow: string;
  end;

  TIniciadorBancoDeDados = class(TIniciador)
  public
    procedure RodaAoIniciar; override;
    procedure RodaAoFinalizar; override;
  end;

function CriaConexao_WBA: IActiveRecordConnection;
begin
  Result := TActiveRecordConnectionADO.Create(Configuracao.ADOConnectionString);
end;

{ TActiveRecordDependenciaProjetoGenerico }

procedure TActiveRecordDependenciaProjetoGenerico.AjustesIniciais(const AConnection: IActiveRecordConnection);
begin
  FSecaoCritica.Acquire;
  try
    FUltimoSincronismo := Now;
    FDiferencaDeTempo := SincronizaDatabaseNow(AConnection) - FUltimoSincronismo;
  finally
    FSecaoCritica.Release;
  end;
end;

constructor TActiveRecordDependenciaProjetoGenerico.Create;
begin
  FSecaoCritica := TCriticalSection.Create;
end;

function TActiveRecordDependenciaProjetoGenerico.DatabaseDate(const AConnection: IActiveRecordConnection): TDateTime;
begin
  Result := Int(DatabaseNow(AConnection));
end;

function TActiveRecordDependenciaProjetoGenerico.DatabaseNow(const AConnection: IActiveRecordConnection): TDateTime;
const
  DezMinutos = 1 / 24 / 6;
begin
  if FUltimoSincronismo <= (Now + DezMinutos) then
    AjustesIniciais(AConnection);
  Result := Now + FDiferencaDeTempo;
end;

destructor TActiveRecordDependenciaProjetoGenerico.Destroy;
begin
  FSecaoCritica.Free;
  inherited;
end;

function TActiveRecordDependenciaProjetoGenerico.GetNewCtrl_Id(const ACtrlIDName: string;
  const AConnection: IActiveRecordConnection): Integer;
begin
  Result := -1;//(SL as ICtrl_IdModelService).PegaProximoCtrl_IdDe(ACtrlIDName, AConnection);
end;

{ TActiveRecordDependenciaProjetoMsSQLServer }

function TActiveRecordDependenciaProjetoMsSQLServer.LimitadorCondicionalQuantidadeRegistros(AQuantidade: Integer;
  AIncluiAnd: Boolean): string;
begin
  Result := '';
end;

function TActiveRecordDependenciaProjetoMsSQLServer.LimitadorSeletivoQuantidadeRegistros(AQuantidade: Integer): string;
const
  LSQL = 'top %d ';
begin
  Result := Format(LSQL, [AQuantidade]);
end;

function TActiveRecordDependenciaProjetoMsSQLServer.SincronizaDatabaseNow(
  const AConnection: IActiveRecordConnection): TDateTime;
var
  LRecordset: _Recordset;
  LRegistrosAfetados: OleVariant;
begin
  LRecordset := (AConnection as IActiveRecordConnectionADO).ADOConnection.Execute('select ' + SQLNow,
    LRegistrosAfetados, 0);
  Result := LRecordset.Fields[0].Value;
  LRecordset.Close;
end;

function TActiveRecordDependenciaProjetoMsSQLServer.SQLData(const AData: TDateTime): string;
begin
  Result := 'convert(datetime, ''' + FormatDateTime('DD/MM/YYYY', AData) +  ''', 103)';
end;

function TActiveRecordDependenciaProjetoMsSQLServer.SQLNow: string;
begin
  Result := 'GetDate()';
end;

{ TActiveRecordDependenciaProjetoOracle }

function TActiveRecordDependenciaProjetoOracle.LimitadorCondicionalQuantidadeRegistros(AQuantidade: Integer;
  AIncluiAnd: Boolean): string;
const
  LSQL = '(ROWNUM <= %d)';
begin
  Result := Format(LSQL, [AQuantidade]);
  if AIncluiAnd then
    Result := ' and ' + Result;
end;

function TActiveRecordDependenciaProjetoOracle.LimitadorSeletivoQuantidadeRegistros(AQuantidade: Integer): string;
begin
  Result := '';
end;

function TActiveRecordDependenciaProjetoOracle.SincronizaDatabaseNow(
  const AConnection: IActiveRecordConnection): TDateTime;
var
  LRecordset: _Recordset;
  LResultado: string;
  d, m, y: Word;
  LRegistrosAfetados: OleVariant;
begin
  LRecordset := (AConnection as IActiveRecordConnectionADO).ADOConnection.Execute('SELECT TO_char(' + SQLNow +
    ',''DD/MM/YYYY HH24:MI:SS'') FROM DUAL', LRegistrosAfetados, 0);
  LResultado := LRecordset.Fields[0].Value;
  LRecordset.Close;
  d := StrToInt(Copy(LResultado, 1, 2));
  m := StrToInt(Copy(LResultado, 4, 2));
  y := StrToInt(Copy(LResultado, 7, 4));
  Result := EncodeDate(y, m, d) + StrToTime(Copy(LResultado, 12, 8));
end;

function TActiveRecordDependenciaProjetoOracle.SQLData(const AData: TDateTime): string;
begin
  Result := 'To_Date(''' + FormatDateTime('DD/MM/YYYY', AData) + ''', ''DD/MM/YYYY'')';
end;

function TActiveRecordDependenciaProjetoOracle.SQLNow: string;
begin
  Result := 'SYSDATE';
end;

{ TIniciadorBancoDeDados }

procedure TIniciadorBancoDeDados.RodaAoFinalizar;
begin
  ActiveRecordDependenciaProjeto := nil;
end;

procedure TIniciadorBancoDeDados.RodaAoIniciar;
begin
  case Configuracao.BancoDeDados of
    bdMsSQLServer: ActiveRecordDependenciaProjeto := TActiveRecordDependenciaProjetoMsSQLServer.Create;
    bdOracle: ActiveRecordDependenciaProjeto := TActiveRecordDependenciaProjetoOracle.Create;
  end;
end;

initialization

  Iniciadores.AdicionaIniciador(TIniciadorBancoDeDados.Create);

end.
