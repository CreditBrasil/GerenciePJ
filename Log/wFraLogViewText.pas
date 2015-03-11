unit wFraLogViewText;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls,
  uObserverModelIntf,
  uLogModelIntf,
  uLogViewIntf;

type
  TFraLogViewText = class(TFrame)
    reLog: TRichEdit;
    pnlBottom: TPanel;
    btnSalvar: TBitBtn;
    procedure btnSalvarClick(Sender: TObject);
  private
    FLogList: ILogList;
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

procedure TFraLogViewText.btnSalvarClick(Sender: TObject);
var
  LSaveDialog: TSaveDialog;
begin
  LSaveDialog := TSaveDialog.Create(nil);
  try
    LSaveDialog.DefaultExt := FViewMode.LogArquivoExtensao;
    LSaveDialog.Filter := Format('Arquivo de Log (*.%s)|*.%s|', [FViewMode.LogArquivoExtensao, FViewMode.LogArquivoExtensao]);
    LSaveDialog.FilterIndex := 1;
    if LSaveDialog.Execute then
      reLog.Lines.SaveToFile(LSaveDialog.FileName);
  finally
    LSaveDialog.Free;
  end;
end;

function TFraLogViewText.GetViewMode: ILogViewMode;
begin
  Result := FViewMode;
end;

function TFraLogViewText.JSONLog: string;
begin
  { TODO -oEdgar : Falta implementar este código }
end;

procedure TFraLogViewText.SetViewMode(const Value: ILogViewMode);
begin
  FViewMode := Value;
end;

procedure TFraLogViewText.ShowLog(const ALog: ILog);

  procedure LogListToRichEdit(const ALogList: ILogList; const ARichEdit: TRichEdit; const ANivel: Integer);
  const
    LFontColor: array [TLogTipo] of TColor = (clWindowText, clWindowText, clRed, clWindowText, clWindowText, clWindowText, clRed, clWindowText);
    LFontStyle: array [TLogTipo] of TFontStyles = ([], [fsUnderline], [], [], [fsBold], [fsUnderline], [], []);
  var
    i: Integer;
    LLogItem: ILogItem;
    s: string;
    l: Integer;
  begin
    for i := 0 to ALogList.Count - 1 do
    begin
      LLogItem := ALogList[i];
      s := StringOfChar(#9, ANivel) + FViewMode.LogItemToString(LLogItem);
      l := Length(ARichEdit.Text);
      ARichEdit.Lines.Add(s);
      ARichEdit.SelStart := l + ANivel;
      ARichEdit.SelLength := Length(s) - ANivel;
      ARichEdit.SelAttributes.Color := LFontColor[LLogItem.Tipo];
      ARichEdit.SelAttributes.Style := LFontStyle[LLogItem.Tipo];
      ARichEdit.SelStart := 0;
      ARichEdit.SelLength := 0;
      LogListToRichEdit(LLogItem.LogList, ARichEdit, ANivel + 1);
    end;
  end;

begin
  FLogList := ALog.LogList;
  reLog.Lines.BeginUpdate;
  try
    reLog.Lines.Clear;
    LogListToRichEdit(ALog.LogList, reLog, 0);
  finally
    reLog.Lines.EndUpdate;
  end;
end;

procedure TFraLogViewText.UpdateObserver(const ASubject: IUnknown);
var
  LLog: ILog;
begin
  if Supports(ASubject, ILog, LLog) then
    ShowLog(LLog);
end;

end.
