unit uLogModelIntf;

interface

type
  TLogTipo = (ltInformacao, ltAlerta, ltErro, ltOK, ltProcesso, ltProcessoAlerta, ltProcessoErro, ltProcessoOK);

  ILogDefinicoes = interface
    ['{7C46078E-9CDD-4B3C-AB7A-C4A790A402EF}']
    function LogStatus(const ALogTipo: TLogTipo): string;
  end;

  ILogList = interface;

  ILogItem = interface
    ['{64AB6B49-D187-47D5-BE87-205A427B87BA}']
    function GetTipo: TLogTipo;
    function GetData: TDateTime;
    function GetMensagem: string;
    function GetExcecao: string;
    function GetLogList: ILogList;
    procedure SetTipo(const Value: TLogTipo);
    procedure SetMensagem(const Value: string);
    procedure SetExcecao(const Value: string);
    property Tipo: TLogTipo read GetTipo write SetTipo;
    property Data: TDateTime read GetData;
    property Mensagem: string read GetMensagem write SetMensagem;
    property Excecao: string read GetExcecao write SetExcecao;
    property LogList: ILogList read GetLogList;
  end;

  ILogList = interface
    ['{8282ABEF-FE1D-44C9-801A-C6D4070A6C7C}']
    function Add(const AItem: ILogItem): Integer;
    function GetCount: Integer;
    function GetItems(const AIndex: Integer): ILogItem;
    procedure AddLogList(const ALogList: ILogList);
    property Count: Integer read GetCount;
    property Items[const AIndex: Integer]: ILogItem read GetItems; default;
  end;

  {(Edgar 16/10/2009) poderiamos modelar uma nova interface ILogSessao, com
  informações como usuário, nome da estação de trabalho, endereço ip, etc.
  Declarada a nova interface, ela se tornaria uma propriedade em ILog.}
  ILog = interface
    ['{995995DC-DC15-4157-AF55-94954E63CC6C}']
    function GetLogList: ILogList;
    property LogList: ILogList read GetLogList;
  end;

  ILogModelFactory = interface
    ['{9554661D-9727-4D32-AAB2-F8309B085860}']
    function CreateLog: ILog; overload;
    function CreateLogItem: ILogItem; overload;
    function CreateLogItem(const ALogTipo: TLogTipo; const AMensagem: string; const AExcecao: string = ''): ILogItem; overload;
  end;

implementation

end.
