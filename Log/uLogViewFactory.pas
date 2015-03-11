unit uLogViewFactory;

interface

uses
  ServiceLocator,
  uLogViewIntf,
  uLogViewClasses;

type
  TLogViewFactory = class(TInterfacedObject, ILogViewFactory)
  private
    function CreateDefaultViewMode: ILogViewMode;
    function CreateView: ILogView;
    function CreateViewMode: ILogViewMode;
  end;

implementation

var
  LLogViewFactory: ILogViewFactory;

function LogViewFactory: IUnknown;
begin
  if not Assigned(LLogViewFactory) then
    LLogViewFactory := TLogViewFactory.Create;
  Result := LLogViewFactory;
end;

{ TLogViewFactory }

function TLogViewFactory.CreateDefaultViewMode: ILogViewMode;
begin
  Result := CreateViewMode;
  Result.DisplayData := True;
  Result.DisplayTipo := True;
  Result.LogViewTipo := lvtTree;
end;

function TLogViewFactory.CreateView: ILogView;
begin
  Result := TLogView.Create;
end;

function TLogViewFactory.CreateViewMode: ILogViewMode;
begin
  Result := TLogViewMode.Create;
end;

initialization

  LLogViewFactory := nil;
  SL.Add(ILogViewFactory, LogViewFactory);

finalization

  LLogViewFactory := nil;

end.
