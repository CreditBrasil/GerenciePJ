unit uObserverModelClasses;

interface

uses
  SysUtils,
  Classes,
  uObserverModelIntf;

type
  TSubject = class(TInterfacedObject, ISubject)
  private
    FController: IUnknown;
    FObservers: IInterfaceList;
    procedure AttachObserver(const AObserver: IObserver);
    procedure DetachObserver(const AObserver: IObserver);
    procedure NotifyObservers;
  public
    constructor Create(const AController: IUnknown);
  end;

implementation

{ TSubject }

procedure TSubject.AttachObserver(const AObserver: IObserver);
begin
  if Assigned(AObserver) then
  begin
    if not Assigned(FObservers) then
      FObservers := TInterfaceList.Create;
    if FObservers.IndexOf(AObserver) = -1 then
    begin
      FObservers.Add(AObserver);
      NotifyObservers;
    end;
  end;
end;

constructor TSubject.Create(const AController: IUnknown);
begin
  FController := AController;
end;

procedure TSubject.DetachObserver(const AObserver: IObserver);
begin
  if Assigned(AObserver) and Assigned(FObservers) and (FObservers.Remove(AObserver) >= 0) and (FObservers.Count = 0) then
    FObservers := nil;
end;

procedure TSubject.NotifyObservers;
var
  i: Integer;
  LObserver: IObserver;
begin
  if Assigned(FObservers) then
  begin
    for i := 0 to FObservers.Count - 1 do
    begin
      if Supports(FObservers[i], IObserver, LObserver) then
        LObserver.UpdateObserver(FController);
    end;
  end;
end;

end.
