unit uObserverModelFactory;

interface

uses
  uObserverModelIntf,
  uObserverModelClasses;

type
  TObserverModelFactory = class(TInterfacedObject, IObserverModelFactory)
    function CreateSubject(const AController: IUnknown): ISubject;
  end;

function ObserverModelFactory: IObserverModelFactory;

implementation

var
  LObserverModelFactory: IObserverModelFactory;

function ObserverModelFactory: IObserverModelFactory;
begin
  if not Assigned(LObserverModelFactory) then
    LObserverModelFactory := TObserverModelFactory.Create;
  Result := LObserverModelFactory;
end;

{ TObserverModelFactory }

function TObserverModelFactory.CreateSubject(const AController: IUnknown): ISubject;
begin
  Result := TSubject.Create(AController);
end;

initialization

  LObserverModelFactory := nil;

finalization

  LObserverModelFactory := nil;

end.
