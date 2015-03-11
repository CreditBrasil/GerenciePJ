unit uLogViewIntf;

interface

uses
  uObserverModelIntf,
  uLogModelIntf;

type
  TLogViewTipo = (lvtTree, lvtText);

  ILogViewMode = interface
    ['{9B86CDD5-6891-4263-8E5F-B14349549788}']
    function GetDisplayData: Boolean;
    function GetDisplayTipo: Boolean;
    function GetLogViewTipo: TLogViewTipo;
    procedure SetDisplayData(const Value: Boolean);
    procedure SetDisplayTipo(const Value: Boolean);
    procedure SetLogViewTipo(const Value: TLogViewTipo);
    function LogArquivoExtensao: string;
    function LogItemToString(const ALogItem: ILogItem): string;
    property DisplayData: Boolean read GetDisplayData write SetDisplayData;
    property DisplayTipo: Boolean read GetDisplayTipo write SetDisplayTipo;
    property LogViewTipo: TLogViewTipo read GetLogViewTipo write SetLogViewTipo;
  end;

  ILogView = interface(IObserver)
    ['{30FA9AF7-5BBB-4D9E-8413-FCD1EE560A08}']
    function GetViewMode: ILogViewMode;
    function JSONLog: string;
    procedure SetViewMode(const Value: ILogViewMode);
    procedure ShowLog(const ALog: ILog);
    property ViewMode: ILogViewMode read GetViewMode write SetViewMode;
  end;

  ILogViewFactory = interface
    ['{BC07C0F4-19BD-4530-8AB4-AEBADAC14E79}']
    function CreateDefaultViewMode: ILogViewMode;
    function CreateView: ILogView;
    function CreateViewMode: ILogViewMode;
  end;

implementation

end.
