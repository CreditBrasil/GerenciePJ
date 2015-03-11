unit uLogViewClasses;

interface

uses
  SysUtils,
  ServiceLocator,
  uObserverModelIntf,
  uLogModelIntf,
  uLogViewIntf,
  wFrmLogView;

type
  TLogViewMode = class(TInterfacedObject, ILogViewMode)
  private
    FDisplayData: Boolean;
    FDisplayTipo: Boolean;
    FLogViewTipo: TLogViewTipo;
    function GetDisplayData: Boolean;
    function GetDisplayTipo: Boolean;
    function GetLogViewTipo: TLogViewTipo;
    procedure SetDisplayData(const Value: Boolean);
    procedure SetDisplayTipo(const Value: Boolean);
    procedure SetLogViewTipo(const Value: TLogViewTipo);
    function LogArquivoExtensao: string;
    function LogItemToString(const ALogItem: ILogItem): string;
  end;

  TLogView = class(TInterfacedObject, IObserver, ILogView)
  private
    FForm: TFrmLogView;
    FViewMode: ILogViewMode;
    function GetViewMode: ILogViewMode;
    function JSONLog: string;
    procedure SetViewMode(const Value: ILogViewMode);
    procedure ShowLog(const ALog: ILog);
    procedure UpdateObserver(const ASubject: IUnknown);
  public
    destructor Destroy; override;
  end;

implementation

{ TLogViewMode }

function TLogViewMode.GetDisplayData: Boolean;
begin
  Result := FDisplayData;
end;

function TLogViewMode.GetDisplayTipo: Boolean;
begin
  Result := FDisplayTipo;
end;

function TLogViewMode.GetLogViewTipo: TLogViewTipo;
begin
  Result := FLogViewTipo;
end;

function TLogViewMode.LogArquivoExtensao: string;
const
  LLogArquivoExtensao: array [TLogViewTipo] of string = ('TXT', 'RTF');
begin
  Result := LLogArquivoExtensao[FLogViewTipo];
end;

function TLogViewMode.LogItemToString(const ALogItem: ILogItem): string;
begin
  //DD/MM/YYYY HH:NN:SS - LogStatus: Mensagem - Erro técnico: Excecao
  Result := '';
  if FDisplayData then
    Result := DateTimeToStr(ALogItem.Data);
  if FDisplayTipo then
  begin
    if Result > '' then
      Result := Result + ' - ';
    Result := Result + (SL as ILogDefinicoes).LogStatus(ALogItem.Tipo);
  end;
  if (ALogItem.Mensagem > '') then
  begin
    if Result > '' then
      Result := Result + ': ';
    Result := Result + ALogItem.Mensagem;
  end;
  if ALogItem.Excecao > '' then
  begin
    if Result > '' then
      Result := Result + ' - ';
    Result := Result + 'Erro técnico: ' + ALogItem.Excecao;
  end;
end;

procedure TLogViewMode.SetDisplayData(const Value: Boolean);
begin
  FDisplayData := Value;
end;

procedure TLogViewMode.SetDisplayTipo(const Value: Boolean);
begin
  FDisplayTipo := Value;
end;

procedure TLogViewMode.SetLogViewTipo(const Value: TLogViewTipo);
begin
  FLogViewTipo := Value;
end;

{ TLogView }

destructor TLogView.Destroy;
begin
  if Assigned(FForm) then
  begin
    FForm.Visible := False;
    FForm.ShowModal;
    FForm.Free;
  end;
end;

function TLogView.GetViewMode: ILogViewMode;
begin
  Result := FViewMode;
end;

function TLogView.JSONLog: string;
begin
 if Assigned(FForm) then
   Result := FForm.JSONLog
 else
   Result := '';
end;

procedure TLogView.SetViewMode(const Value: ILogViewMode);
begin
  FViewMode := Value;
end;

procedure TLogView.ShowLog(const ALog: ILog);
begin
  if ALog.LogList.Count > 0 then
  begin
    if not Assigned(FForm) then
      FForm := TFrmLogView.Create(nil);
    FForm.ViewMode := FViewMode;
    if not FForm.Visible then
      FForm.Show;
    FForm.UpdateObserver(ALog);
  end;
end;

procedure TLogView.UpdateObserver(const ASubject: IUnknown);
var
  LLog: ILog;
begin
  if Supports(ASubject, ILog, LLog) then
    ShowLog(LLog);
end;

end.
