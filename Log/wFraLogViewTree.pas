unit wFraLogViewTree;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, Metodos, StdCtrls, Buttons, ExtCtrls,
  uImgDataModule,
  ServiceLocator,
  uObserverModelIntf,
  uLogModelIntf,
  uLogViewIntf;

type
  TFraLogViewTree = class(TFrame, IUnknown, IObserver, ILogView)
    tvLog: TTreeView;
    pnlBottom: TPanel;
    btnSalvar: TBitBtn;
    procedure btnSalvarClick(Sender: TObject);
    procedure tvLogCustomDraw(Sender: TCustomTreeView; const ARect: TRect;
      var DefaultDraw: Boolean);
  private
    FLogList: ILogList;
    FProcessoAtualNode: TTreeNode;
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

{ TFraLogViewTree }

procedure TFraLogViewTree.btnSalvarClick(Sender: TObject);
var
  LSaveDialog: TSaveDialog;
begin
  LSaveDialog := TSaveDialog.Create(nil);
  try
    LSaveDialog.DefaultExt := FViewMode.LogArquivoExtensao;
    LSaveDialog.Filter := Format('Arquivo de Log (*.%s)|*.%s|', [FViewMode.LogArquivoExtensao, FViewMode.LogArquivoExtensao]);
    LSaveDialog.FilterIndex := 1;
    if LSaveDialog.Execute then
      tvLog.SaveToFile(LSaveDialog.FileName);
  finally
    LSaveDialog.Free;
  end;
end;

function TFraLogViewTree.GetViewMode: ILogViewMode;
begin
  Result := FViewMode;
end;

function TFraLogViewTree.JSONLog: string;
var
  LLogDefinicoes: ILogDefinicoes;

  function IntJSONLog(const ALogList: ILogList; ANivel: Integer): string;

    procedure Add(const S: string);
    begin
      Result := Result + S;
    end;

  const
    LUltimo: array [Boolean] of string = (',', '');
  var
    laco: Integer;
    LRecuo: string;
  begin
    LRecuo := StringOfChar(#9, ANivel);
    Result := LRecuo + '['#13#10;
    for laco := 0 to ALogList.Count - 1 do
    begin
      Add(Format('%s'#9'{"Tipo": "%s", "Data": "%s", "Mensagem": "%s", "Excecao": "%s", "LogList":'#13#10, [
        LRecuo,
        LLogDefinicoes.LogStatus(ALogList[laco].Tipo),
        DateToStr(ALogList[laco].Data),
        ALogList[laco].Mensagem,
        ALogList[laco].Excecao,
        IntJSONLog(ALogList[laco].LogList, ANivel + 1)]));
      Add(LRecuo + #9'}' + LUltimo[laco = (ALogList.Count - 1)] + #13#10);
    end;
    Add(LRecuo + ']'#13#10);
  end;

const
  JSONFalseTrue: array [Boolean] of string = ('false', 'true'); //tem que ser minúsculo
begin
  { TODO -oAlex : Falta testar este código }
  LLogDefinicoes := SL as ILogDefinicoes;
  Result := Format('{ "DisplayData": %s, "DisplayTipo": %s, "LogList":'#13#10'%s'#13#10'}', [
    JSONFalseTrue[FViewMode.DisplayData],
    JSONFalseTrue[FViewMode.DisplayTipo],
    IntJSONLog(FLogList, 1)]);
end;

procedure TFraLogViewTree.SetViewMode(const Value: ILogViewMode);
begin
  FViewMode := Value;
end;

procedure TFraLogViewTree.ShowLog(const ALog: ILog);

  procedure LogListToTreeNodes(const ALogList: ILogList; const ATreeNodes: TTreeNodes; const ATreeNode: TTreeNode);
  const
    LImageIndex: array [TLogTipo] of Integer = (64, 45, 34, 4, 65, 45, 34, 4);
  var
    i: Integer;
    LLogItem: ILogItem;
    LText: string;
    LTreeNode: TTreeNode;
  begin
    for i := 0 to ALogList.Count - 1 do
    begin
      LLogItem := ALogList[i];
      {(Edgar 20/06/2011) mensagens a partir de 260 caracteres estouram erro no TTreeView.}
      LText := Copy(FViewMode.LogItemToString(LLogItem), 1, 259);
      if Assigned(ATreeNode) then
        LTreeNode := tvLog.Items.AddChild(ATreeNode, LText)
      else
        LTreeNode := tvLog.Items.Add(nil, LText);
      LTreeNode.ImageIndex := LImageIndex[LLogItem.Tipo];
      LTreeNode.SelectedIndex := LImageIndex[LLogItem.Tipo];
      if LLogItem.Tipo = ltProcesso then
        FProcessoAtualNode := LTreeNode;
      LogListToTreeNodes(LLogItem.LogList, ATreeNodes, LTreeNode);
    end;
  end;

begin
  FLogList := ALog.LogList;
  FProcessoAtualNode := nil;
  tvLog.Items.BeginUpdate;
  try
    tvLog.Items.Clear;
    LogListToTreeNodes(ALog.LogList, tvLog.Items, nil);
    tvLog.FullExpand;
  finally
    tvLog.Items.EndUpdate;
  end;
end;

procedure TFraLogViewTree.tvLogCustomDraw(Sender: TCustomTreeView;
  const ARect: TRect; var DefaultDraw: Boolean);
var
  LRect: TRect;
  LText: string;
begin
  {(Edgar 11/09/2009) isto é um "workaround" para mostrar o processo atual em
  negrito. Como efeito colateral, o nó fica temporariamente sem texto. Mas o nó
  deve recuperar o texto ao termino do log (quando não haverão mais processos
  pendentes), a tempo de salvar o log em arquivo corretamente.}
  DefaultDraw := True;
  if Assigned(FProcessoAtualNode) and (FProcessoAtualNode.Text > '') then
  begin
    LRect := FProcessoAtualNode.DisplayRect(True);
    LText := FProcessoAtualNode.Text;
    FProcessoAtualNode.Text := '';
    Sender.Canvas.Font.Style := [fsBold];
    Sender.Canvas.TextRect(LRect, LRect.Left + 2, LRect.Top, LText);
  end;
end;

procedure TFraLogViewTree.UpdateObserver(const ASubject: IUnknown);
var
  LLog: ILog;
begin
  if Supports(ASubject, ILog, LLog) then
    ShowLog(LLog);
end;

end.
