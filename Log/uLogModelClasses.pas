unit uLogModelClasses;

interface

uses
  SysUtils,
  Classes,
  uLogModelIntf;

type
  TLogDefinicoes = class(TInterfacedObject, ILogDefinicoes)
  private
    function LogStatus(const ALogTipo: TLogTipo): string;
  end;

  TLogItem = class(TInterfacedObject, ILogItem)
  private
    FTipo: TLogTipo;
    FData: TDateTime;
    FMensagem: string;
    FExcecao: string;
    FLogList: ILogList;
    function GetTipo: TLogTipo;
    function GetData: TDateTime;
    function GetMensagem: string;
    function GetExcecao: string;
    function GetLogList: ILogList;
    procedure SetTipo(const Value: TLogTipo);
    procedure SetMensagem(const Value: string);
    procedure SetExcecao(const Value: string);
  public
    constructor Create(const AData: TDateTime);
  end;

  TLogList = class(TInterfacedObject, ILogList)
  private
    FList: IInterfaceList;
    function Add(const AItem: ILogItem): Integer;
    function GetCount: Integer;
    function GetItems(const AIndex: Integer): ILogItem;
    procedure AddLogList(const ALogList: ILogList);
  public
    constructor Create;
  end;

  TLog = class(TInterfacedObject, ILog)
  private
    FLogList: ILogList;
    function GetLogList: ILogList;
  public
    constructor Create;
  end;

implementation

{ TLogDefinicoes }

function TLogDefinicoes.LogStatus(const ALogTipo: TLogTipo): string;
const
  LLogStatus: array [TLogTipo] of string = ('Informação', 'Alerta', 'Erro', 'Concluído', 'Processo em andamento', 'Processo concluído com alerta', 'Processo concluído com erro', 'Processo concluído');
begin
  Result := LLogStatus[ALogTipo];
end;

{ TLogItem }

constructor TLogItem.Create(const AData: TDateTime);
begin
  FData := AData;
  FLogList := TLogList.Create;
end;

function TLogItem.GetData: TDateTime;
begin
  Result := FData;
end;

function TLogItem.GetExcecao: string;
begin
  Result := FExcecao;
end;

function TLogItem.GetLogList: ILogList;
begin
  Result := FLogList;
end;

function TLogItem.GetMensagem: string;
begin
  Result := FMensagem;
end;

function TLogItem.GetTipo: TLogTipo;
begin
  Result := FTipo;
end;

procedure TLogItem.SetExcecao(const Value: string);
begin
  FExcecao := Value;
end;

procedure TLogItem.SetMensagem(const Value: string);
begin
  FMensagem := Value;
end;

procedure TLogItem.SetTipo(const Value: TLogTipo);
begin
  FTipo := Value;
end;

{ TLogList }

function TLogList.Add(const AItem: ILogItem): Integer;
begin
  Result := FList.Add(AItem);
end;

procedure TLogList.AddLogList(const ALogList: ILogList);
var
  i: Integer;
begin
  for i := 0 to ALogList.Count - 1 do
    Add(ALogList[i]);
end;

constructor TLogList.Create;
begin
  FList := TInterfaceList.Create;
end;

function TLogList.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TLogList.GetItems(const AIndex: Integer): ILogItem;
begin
  Supports(FList[AIndex], ILogItem, Result);
end;

{ TLog }

constructor TLog.Create;
begin
  FLogList := TLogList.Create;
end;

function TLog.GetLogList: ILogList;
begin
  Result := FLogList;
end;

end.
