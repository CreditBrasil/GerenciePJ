unit uLogControlClasses;

interface

uses
  uObserverModelIntf,
  uObserverModelFactory,
  uLogModelIntf,
  uLogControlIntf;

type
  TLogControl = class(TInterfacedObject, ILogControl)
  private
    FLog: ILog;
    FLogDefinicoes: ILogDefinicoes;
    FLogModelFactory: ILogModelFactory;
    FOnChange: ISubject;
    function AddInformacao(const AMensagem: string): ILogItem;
    function AddAlerta(const AMensagem: string): ILogItem;
    function AddErro(const AMensagem: string; const AExcecao: string = ''): ILogItem;
    function AddOK(const AMensagem: string): ILogItem;
    function AddProcesso(const AMensagem: string): ILogItem;
    function AddSubInformacao(const ALogItem: ILogItem; const AMensagem: string): ILogItem;
    function AddSubAlerta(const ALogItem: ILogItem; const AMensagem: string): ILogItem;
    function AddSubErro(const ALogItem: ILogItem; const AMensagem: string; const AExcecao: string = ''): ILogItem;
    function AddSubOK(const ALogItem: ILogItem; const AMensagem: string): ILogItem;
    function AddSubProcesso(const ALogItem: ILogItem; const AMensagem: string): ILogItem;
    function GetLog: ILog;
    function GetOnChange: ISubject;
    function ProcessoAlerta(var AlogItem: ILogItem; const AMensagem: string = ''): ILogItem;
    function ProcessoErro(var ALogItem: ILogItem; const AMensagem: string = ''; const AExcecao: string = ''): ILogItem;
    function ProcessoOK(var ALogItem: ILogItem; const AMensagem: string = ''): ILogItem;
    procedure AddLogList(const ALogList: ILogList);
    procedure AddSubLogList(const ALogItem: ILogItem; const ALogList: ILogList);
  public
    constructor Create(const ALog: ILog; const ALogModelFactory: ILogModelFactory;
      const ALogDefinicoes: ILogDefinicoes);
  end;

implementation

{ TLogControl }

function TLogControl.AddAlerta(const AMensagem: string): ILogItem;
begin
  Result := FLogModelFactory.CreateLogItem(ltAlerta, AMensagem);
  FLog.LogList.Add(Result);
  FOnChange.NotifyObservers;
end;

function TLogControl.AddErro(const AMensagem, AExcecao: string): ILogItem;
begin
  Result := FLogModelFactory.CreateLogItem(ltErro, AMensagem, AExcecao);
  FLog.LogList.Add(Result);
  FOnChange.NotifyObservers;
end;

function TLogControl.AddInformacao(const AMensagem: string): ILogItem;
begin
  Result := FLogModelFactory.CreateLogItem(ltInformacao, AMensagem);
  FLog.LogList.Add(Result);
  FOnChange.NotifyObservers;
end;

procedure TLogControl.AddLogList(const ALogList: ILogList);
begin
  FLog.LogList.AddLogList(ALogList);
  FOnChange.NotifyObservers;
end;

function TLogControl.AddOK(const AMensagem: string): ILogItem;
begin
  Result := FLogModelFactory.CreateLogItem(ltOK, AMensagem);
  FLog.LogList.Add(Result);
  FOnChange.NotifyObservers;
end;

function TLogControl.AddProcesso(const AMensagem: string): ILogItem;
begin
  Result := FLogModelFactory.CreateLogItem(ltProcesso, AMensagem);
  FLog.LogList.Add(Result);
  FOnChange.NotifyObservers;
end;

function TLogControl.AddSubAlerta(const ALogItem: ILogItem;
  const AMensagem: string): ILogItem;
begin
  Result := FLogModelFactory.CreateLogItem(ltAlerta, AMensagem);
  if Assigned(ALogItem) then
    ALogItem.LogList.Add(Result)
  else
    FLog.LogList.Add(Result);
  FOnChange.NotifyObservers;
end;

function TLogControl.AddSubErro(const ALogItem: ILogItem; const AMensagem,
  AExcecao: string): ILogItem;
begin
  Result := FLogModelFactory.CreateLogItem(ltErro, AMensagem, AExcecao);
  if Assigned(ALogItem) then
    ALogItem.LogList.Add(Result)
  else
    FLog.LogList.Add(Result);
  FOnChange.NotifyObservers;
end;

function TLogControl.AddSubInformacao(const ALogItem: ILogItem;
  const AMensagem: string): ILogItem;
begin
  Result := FLogModelFactory.CreateLogItem(ltInformacao, AMensagem);
  if Assigned(ALogItem) then
    ALogItem.LogList.Add(Result)
  else
    FLog.LogList.Add(Result);
  FOnChange.NotifyObservers;
end;

procedure TLogControl.AddSubLogList(const ALogItem: ILogItem;
  const ALogList: ILogList);
begin
  if Assigned(ALogItem) then
    ALogItem.LogList.AddLogList(ALogList)
  else
    FLog.LogList.AddLogList(ALogList);
  FOnChange.NotifyObservers;
end;

function TLogControl.AddSubOK(const ALogItem: ILogItem;
  const AMensagem: string): ILogItem;
begin
  Result := FLogModelFactory.CreateLogItem(ltOK, AMensagem);
  if Assigned(ALogItem) then
    ALogItem.LogList.Add(Result)
  else
    FLog.LogList.Add(Result);
  FOnChange.NotifyObservers;
end;

function TLogControl.AddSubProcesso(const ALogItem: ILogItem;
  const AMensagem: string): ILogItem;
begin
  Result := FLogModelFactory.CreateLogItem(ltProcesso, AMensagem);
  if Assigned(ALogItem) then
    ALogItem.LogList.Add(Result)
  else
    FLog.LogList.Add(Result);
  FOnChange.NotifyObservers;
end;

constructor TLogControl.Create(const ALog: ILog; const ALogModelFactory: ILogModelFactory;
  const ALogDefinicoes: ILogDefinicoes);
begin
  FLog := ALog;
  FOnChange := ObserverModelFactory.CreateSubject(FLog);
  FLogModelFactory := ALogModelFactory;
  FLogDefinicoes := ALogDefinicoes;
end;

function TLogControl.GetLog: ILog;
begin
  Result := FLog;
end;

function TLogControl.GetOnChange: ISubject;
begin
  Result := FOnChange;
end;

function TLogControl.ProcessoAlerta(var AlogItem: ILogItem;
  const AMensagem: string): ILogItem;
var
  LMensagem: string;
begin
  if Assigned(ALogItem) then
  begin
    ALogItem.Tipo := ltProcessoAlerta;
    if AMensagem > '' then
      LMensagem := AMensagem
    else
      LMensagem := FLogDefinicoes.LogStatus(ltProcessoAlerta);
    Result := AddSubAlerta(ALogItem, LMensagem);
    ALogItem := nil;
  end
  else
    Result := nil;
  FOnChange.NotifyObservers;
end;

function TLogControl.ProcessoErro(var ALogItem: ILogItem; const AMensagem,
  AExcecao: string): ILogItem;
var
  LMensagem: string;
begin
  if Assigned(ALogItem) then
  begin
    ALogItem.Tipo := ltProcessoErro;
    if AMensagem > '' then
      LMensagem := AMensagem
    else
      LMensagem := FLogDefinicoes.LogStatus(ltProcessoErro);
    Result := AddSubErro(ALogItem, LMensagem, AExcecao);
    ALogItem := nil;
  end
  else
    Result := AddErro(AMensagem, AExcecao);
  FOnChange.NotifyObservers;
end;

function TLogControl.ProcessoOK(var ALogItem: ILogItem;
  const AMensagem: string): ILogItem;
var
  LMensagem: string;
begin
  if Assigned(ALogItem) then
  begin
    ALogItem.Tipo := ltProcessoOK;
    if AMensagem > '' then
      LMensagem := AMensagem
    else
      LMensagem := FLogDefinicoes.LogStatus(ltProcessoOK);
    Result := AddSubOK(ALogItem, LMensagem);
    ALogItem := nil;
  end
  else
    Result := nil;
  FOnChange.NotifyObservers;
end;

end.
