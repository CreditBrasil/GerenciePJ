unit uLogControlIntf;

interface

uses
  uObserverModelIntf,
  uLogModelIntf;

type
  ILogControl = interface
    ['{97827ACC-89EA-496C-814C-52AE9BC6FD4E}']
    function AddInformacao(const AMensagem: string): ILogItem;
    function AddAlerta(const AMensagem: string): ILogItem;
    function AddErro(const AMensagem: string; const AExcecao: string = ''): ILogItem;
    function AddOK(const AMensagem: string): ILogItem;
    function AddProcesso(const AMensagem: string): ILogItem;
    function AddSubInformacao(const ALogItem: ILogItem; const AMensagem: string): ILogItem;
    function AddSubAlerta(const ALogItem: ILogItem; const AMensagem: string): ILogItem;
    function AddSubErro(const ALogItem: ILogItem; const AMensagem: string; const AExcecao: string = ''): ILogItem;
    function AddSubOK(const ALogItem: ILogItem; const AMensagem: string): ILogItem;
    function AddSubProcesso(const ALogItem: ILogItem; const AMensagem: string): ILogItem;
    function GetLog: ILog;
    function GetOnChange: ISubject;
    function ProcessoAlerta(var AlogItem: ILogItem; const AMensagem: string = ''): ILogItem;
    function ProcessoErro(var ALogItem: ILogItem; const AMensagem: string = ''; const AExcecao: string = ''): ILogItem;
    function ProcessoOK(var ALogItem: ILogItem; const AMensagem: string = ''): ILogItem;
    procedure AddLogList(const ALogList: ILogList);
    procedure AddSubLogList(const ALogItem: ILogItem; const ALogList: ILogList);
    property Log: ILog read GetLog;
    property OnChange: ISubject read GetOnChange;
  end;

  ILogControlFactory = interface
    ['{B7264BBC-39CF-4FD0-91E2-8CD39AB351F5}']
    function CreateLogControl: ILogControl; overload;
    function CreateLogControl(const ALog: ILog): ILogControl; overload;
  end;

implementation

end.
