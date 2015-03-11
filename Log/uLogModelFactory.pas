unit uLogModelFactory;

interface

uses
  SysUtils,
  ServiceLocator,
  uLogModelIntf,
  uLogModelClasses;

type
  TLogModelFactory = class(TInterfacedObject, ILogModelFactory)
  private
    function CreateLog: ILog; overload;
    function CreateLogItem: ILogItem; overload;
    function CreateLogItem(const ALogTipo: TLogTipo; const AMensagem: string; const AExcecao: string = ''): ILogItem; overload;
  end;

implementation

var
  LLogDefinicoes: ILogDefinicoes;
  LLogModelFactory: ILogModelFactory;

function LogDefinicoes: IUnknown;
begin
  if not Assigned(LLogDefinicoes) then
    LLogDefinicoes := TLogDefinicoes.Create;
  Result := LLogDefinicoes;
end;

function LogModelFactory: IUnknown;
begin
  if not Assigned(LLogModelFactory) then
    LLogModelFactory := TLogModelFactory.Create;
  Result := LLogModelFactory;
end;

{ TLogModelFactory }

function TLogModelFactory.CreateLog: ILog;
begin
  Result := TLog.Create;
end;

function TLogModelFactory.CreateLogItem: ILogItem;
begin
  Result := TLogItem.Create(Now);
end;

function TLogModelFactory.CreateLogItem(const ALogTipo: TLogTipo; const AMensagem,
  AExcecao: string): ILogItem;
begin
  Result := CreateLogItem;
  Result.Tipo := ALogTipo;
  Result.Mensagem := AMensagem;
  Result.Excecao := AExcecao;
end;

initialization

  LLogDefinicoes := nil;
  SL.Add(ILogDefinicoes, LogDefinicoes);
  LLogModelFactory := nil;
  SL.Add(ILogModelFactory, LogModelFactory);

finalization

  LLogDefinicoes := nil;
  LLogModelFactory := nil;

end.
