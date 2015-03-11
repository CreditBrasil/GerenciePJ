unit uLogControlFactory;

interface

uses
  ServiceLocator,
  uLogModelIntf,
  uLogControlIntf,
  uLogControlClasses;

type
  TLogControlFactory = class(TInterfacedObject, ILogControlFactory)
  private
    FLogDefinicoes: ILogDefinicoes;
    FLogModelFactory: ILogModelFactory;
    function CreateLogControl: ILogControl; overload;
    function CreateLogControl(const ALog: ILog): ILogControl; overload;
  public
    constructor Create(const ALogModelFactory: ILogModelFactory; const ALogDefinicoes: ILogDefinicoes);
  end;

implementation

var
  LLogControlFactory: ILogControlFactory;

function LogControlFactory: IUnknown;
begin
  if not Assigned(LLogControlFactory) then
    LLogControlFactory := TLogControlFactory.Create(SL as ILogModelFactory, SL as ILogDefinicoes);
  Result := LLogControlFactory;
end;

{ TLogControlFactory }

function TLogControlFactory.CreateLogControl: ILogControl;
begin
  Result := CreateLogControl(FLogModelFactory.CreateLog);
end;

constructor TLogControlFactory.Create(const ALogModelFactory: ILogModelFactory; const ALogDefinicoes: ILogDefinicoes);
begin
  FLogModelFactory := ALogModelFactory;
  FLogDefinicoes := ALogDefinicoes;
end;

function TLogControlFactory.CreateLogControl(const ALog: ILog): ILogControl;
begin
  Result := TLogControl.Create(ALog, FLogModelFactory, FLogDefinicoes);
end;

initialization

  LLogControlFactory := nil;
  SL.Add(ILogControlFactory, LogControlFactory);

finalization

  LLogControlFactory := nil;

end.
