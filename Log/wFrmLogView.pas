unit wFrmLogView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wFraLogViewTree,
  wFraLogViewText,
  uObserverModelIntf,
  uLogModelIntf,
  uLogViewIntf;

type
  TFrmLogView = class(TForm, IUnknown, IObserver, ILogView)
  private
    FFraLogView: TFrame;
    FViewMode: ILogViewMode;
  public
    function GetViewMode: ILogViewMode;
    function JSONLog: string;
    procedure SetViewMode(const Value: ILogViewMode);
    procedure ShowLog(const ALog: ILog);
    procedure UpdateObserver(const ASubject: IUnknown);
    property ViewMode: ILogViewMode read GetViewMode write SetViewMode;
  end;

implementation

{$R *.DFM}

{ TFrmLogView }

function TFrmLogView.GetViewMode: ILogViewMode;
begin
  Result := FViewMode;
end;

function TFrmLogView.JSONLog: string;
begin
  Assert(FViewMode.LogViewTipo in [lvtTree, lvtText]);
  case FViewMode.LogViewTipo of
    lvtTree: Result := (FFraLogView as TFraLogViewTree).JSONLog;
    lvtText: Result := (FFraLogView as TFraLogViewText).JSONLog;
  end;
end;

procedure TFrmLogView.SetViewMode(const Value: ILogViewMode);
begin
  FViewMode := Value;
  if not Assigned(FFraLogView) then
  begin
    Assert(FViewMode.LogViewTipo in [lvtTree, lvtText]);
    case FViewMode.LogViewTipo of
      lvtTree: FFraLogView := TFraLogViewTree.Create(Self);
      lvtText: FFraLogView := TFraLogViewText.Create(Self);
    end;
    FFraLogView.Parent := Self;
    FFraLogView.Align := alClient;
  end;
end;

procedure TFrmLogView.ShowLog(const ALog: ILog);
begin
  Assert(FViewMode.LogViewTipo in [lvtTree, lvtText]);
  case FViewMode.LogViewTipo of
    lvtTree: begin
      (FFraLogView as TFraLogViewTree).ViewMode := FViewMode;
      (FFraLogView as TFraLogViewTree).UpdateObserver(ALog);
    end;
    lvtText: begin
      (FFraLogView as TFraLogViewText).ViewMode := FViewMode;
      (FFraLogView as TFraLogViewText).UpdateObserver(ALog);
    end;
  end;
end;

procedure TFrmLogView.UpdateObserver(const ASubject: IUnknown);
var
  LLog: ILog;
begin
  if Supports(ASubject, ILog, LLog) then
    ShowLog(LLog);
end;

end.
