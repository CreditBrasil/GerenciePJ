unit uGerenciePJ_Conexao;

interface

uses
  SysUtils, ServiceLocator, uActiveRecord, ADOInt, Variants, SyncObjs;

function CriaConexao_GerenciePJ: IActiveRecordConnection;

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

function CriaConexao_GerenciePJ: IActiveRecordConnection;
begin
  Result := TActiveRecordConnectionADO.Create('Driver={SQL Server};Server=(local);DataBase=Teste;UID=sa;PWD=chica;Library=dbmssocn;');
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

initialization

  ActiveRecordDependenciaProjeto := TActiveRecordDependenciaProjetoMsSQLServer.Create;

finalization

  ActiveRecordDependenciaProjeto := nil;

end.
