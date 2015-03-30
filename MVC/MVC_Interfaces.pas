unit MVC_Interfaces;

interface

uses
  Classes, SysUtils, HTTPApp;

type
  TTipoResposta = (respostaHTML, respostaJSON);

  TOutrosElementos = array of string;

  IMVCStrings = interface
    ['{B05A3D51-F645-48B7-A83B-8A6F9DC4919B}']
    procedure Assign(AStrings: TStrings);
    procedure Clear;
    function Tem(AValue: string): Boolean;
  end;

  IIteratorParametros = interface
    ['{BD366F65-0908-4794-8F52-2F0C1BD51E23}']
    function GetNome: string;
    function GetValor: Variant;

    function Next: Boolean;
    property Nome: string read GetNome;
    property Valor: Variant read GetValor;
  end;

  IParametros = interface
    ['{4D83D1D0-ACE2-4459-B796-AEFC1E435785}']
    function GetAsInterface(const AIndex: string): IUnknown;
    function GetAsMVCStrings(const AIndex: string): IMVCStrings;
    function GetItem(const AIndex: string): Variant;
    procedure SetAsInterface(const AIndex: string; const AValue: IUnknown);
    procedure SetAsMVCStrings(const AIndex: string; const AValue: IMVCStrings);
    procedure SetItem(const AIndex: string; const AValue: Variant);

    procedure Assign(const AParametros: IParametros);
    function Iterator: IIteratorParametros;
    function TemCodigo(const AIndex: string): Boolean;
    procedure Clear;
    property AsInterface[const AIndex: string]: IUnknown read GetAsInterface write SetAsInterface;
    property AsMVCStrings[const AIndex: string]: IMVCStrings read GetAsMVCStrings write SetAsMVCStrings;
    property Item[const AIndex: string]: Variant read GetItem write SetItem; default;
  end;

  IRota = interface
    ['{B9DBDE3D-060F-4F27-A541-BD341BFEF806}']
    function GetNome: string;
    function GetNomeAcao: string;
    function GetNomeControlador: string;
    function GetOutrosElementos: TOutrosElementos;
    function GetQueryString: IParametros;
    function GetTerceiroElementoComoInteiro: Integer;

    function NomeInternoDoControlador: string;
    function RotaSimilar(const ARota: IRota): Boolean;                                      
    function URL: string;
    function TemQueryString: Boolean;
    property Nome: string read GetNome;
    property NomeAcao: string read GetNomeAcao;
    property NomeControlador: string read GetNomeControlador;
    property OutrosElementos: TOutrosElementos read GetOutrosElementos;
    property QueryString: IParametros read GetQueryString;
    property TerceiroElementoComoInteiro: Integer read GetTerceiroElementoComoInteiro;
  end;

  TErroModelo = class(TObject)
  private
    FCodigo: Integer;
    FDescricao: string;
    FMensagem: string;
  public
    constructor CreateParaException(const AMensagem: string);
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property Mensagem: string read FMensagem write FMensagem;
  end;

  ERota = class(Exception)
  protected
    procedure AjustaValoresErroModelo(LErroModelo: TErroModelo); virtual; abstract;
  public
    function CriaErroModelo: TErroModelo;
  end;

  ENaoEncontrado = class(ERota)
  protected
    procedure AjustaValoresErroModelo(LErroModelo: TErroModelo); override;
  end;

  ENaoAutorizado = class(ERota)
  protected
    procedure AjustaValoresErroModelo(LErroModelo: TErroModelo); override;
  end;

  EFaltaInformacao = class(ERota)
  protected
    procedure AjustaValoresErroModelo(LErroModelo: TErroModelo); override;
  end;

  ITipoDeRota = interface
    ['{3B39EA43-F43D-4BE4-A887-3CBCD95D9344}']
    function GetNome: string;

    function CriaRota: IRota; overload;
    function CriaRota(const ANomeControlador, ANomeAcao: string; const AArgumentos: array of string): IRota; overload;
    function NomeInternoDoControlador(const ANomeControlador: string): string;
    function RotasSimilares(const ARota1, ARota2: IRota): Boolean;
    function URLPara(const ARota: IRota): string;
    property Nome: string read GetNome;
  end;

  IRotaFluente = interface
    ['{90F7E98D-4848-4D99-91F3-A7628EABE871}']
    function Acao(const ANomeAcao: string): IRotaFluente;
    function AddOutro(const AOutroElemento: string): IRotaFluente;
    function Clonar: IRotaFluente; 
    function Controlador(const ANomeControlador: string): IRotaFluente;
    function CriaRota: IRota;
    function LimpaOutros: IRotaFluente;
    function LimpaQuerysStrings: IRotaFluente;    
    function Nome(const ANomeRota: string): IRotaFluente;
    function Outro(APosicao: Integer; const AOutroElemento: string): IRotaFluente;
    function Outros(const AOutrosElementos: array of string): IRotaFluente; overload;
    function Outros(const AOutrosElementosComBarra: string): IRotaFluente; overload;
    function Query(const ANome, AValor: string): IRotaFluente;
    function RotaSimilar(const ARota: IRota): Boolean;                                      
    function URL: string;
  end;

  IFabricaTipoDeRota = interface
    ['{7C24DC48-54B3-4BC6-8F68-6159E922470F}']
    function GetRequest: TWebRequest;

    function CriaRotaFluente(const ARotaExemplo: IRota = nil): IRotaFluente;
    function CriaTipoDeRota(const ANomeRota: string): ITipoDeRota;
    function CriaTipoDeRotaAtual: ITipoDeRota;
    property Request: TWebRequest read GetRequest;
  end;

  IFabricaVisao = interface; //Foward

  IVisao = interface
    ['{35375119-3826-4309-A71A-4CEA74327C7F}']
    procedure GeraResposta(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota; AResponse: TWebResponse);
    function GetConteudo(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
      AResponse: TWebResponse): string;
    function GetFabricaVisao: IFabricaVisao;
    function GetModeloInterface: IInterface;
    function GetModeloObject: TObject;
    function GetModeloValor: Variant;
    function GetParametros: IParametros;
    procedure SetFabricaVisao(const Value: IFabricaVisao);
    procedure SetModeloInterface(const AValue: IInterface);
    procedure SetModeloObject(const AValue: TObject);
    procedure SetModeloValor(const AValue: Variant);

    property FabricaVisao: IFabricaVisao read GetFabricaVisao write SetFabricaVisao;
    property ModeloInterface: IInterface read GetModeloInterface write SetModeloInterface;
    property ModeloObject: TObject read GetModeloObject write SetModeloObject;
    property ModeloValor: Variant read GetModeloValor write SetModeloValor;
    property Parametros: IParametros read GetParametros;
  end;

  IFabricaVisao = interface
    ['{4859F85F-1109-424D-B9A4-472009C3AA20}']
    function CriaNaoModificado: IVisao;
    function CriaRedireciona(const AURL: string): IVisao;
    function CriaRedirecionaJavascript(const AURL: string): IVisao;
    function CriaVisao(const ANomeControlador, ANomeVisao: string): IVisao;
    function CriaVisaoErro(ATipoResposta: TTipoResposta): IVisao;
  end;

  IControlador = interface
    ['{DE64AF28-861B-49DA-8579-BDB50169AC11}']
    function GetFabricaTipoDeRota: IFabricaTipoDeRota;
    function GetFabricaVisao: IFabricaVisao;
    function GetTipoResposta: TTipoResposta;
    function ProcessaERetornaVisao(const ARota: IRota; ARequest: TWebRequest; AResponse: TWebResponse): IVisao;
    procedure SetFabricaTipoDeRota(const AValue: IFabricaTipoDeRota);
    procedure SetFabricaVisao(const Value: IFabricaVisao);
    procedure SetTipoResposta(AValue: TTipoResposta);

    property FabricaVisao: IFabricaVisao read GetFabricaVisao write SetFabricaVisao;
    property FabricaTipoDeRota: IFabricaTipoDeRota read GetFabricaTipoDeRota write SetFabricaTipoDeRota;
    property TipoResposta: TTipoResposta read GetTipoResposta write SetTipoResposta;
  end;

  IFabricaControlador = interface
    ['{5C81C806-1EBF-46BF-A9E5-E6860C55236B}']
    function CriaControlador(const ARota: IRota): IControlador;
  end;

  ISessao = interface
    ['{4DD2B791-8677-49BE-9CEA-206628EB5F08}']
    function GetAutenticado: Boolean;
    function GetGUID: TGUID;
    procedure SetAutenticado(AValue: Boolean);
    procedure SetGUID(const AValue: TGUID);

    property Autenticado: Boolean read GetAutenticado write SetAutenticado;
    property GUID: TGUID read GetGUID write SetGUID;
  end;

  ISessoes = interface
    ['{3B4B7D39-2B55-4224-A6A0-AEE585C77081}']
    procedure ArmazenaSessao(const ASessao: ISessao);
    procedure ExcluiTodasAsSessoes;
    function RecuperaSessao(const AGUID: TGUID; AForca: Boolean): ISessao;
  end;

function CriaOutrosElementos(const AOutrosElementos: array of string): TOutrosElementos;

implementation

function CriaOutrosElementos(const AOutrosElementos: array of string): TOutrosElementos;
var
  laco: Integer;
begin
  SetLength(Result, Length(AOutrosElementos));
  for laco := 0 to Length(AOutrosElementos) - 1 do
    Result[laco] := AOutrosElementos[laco];
end;

{ TErroModelo }

constructor TErroModelo.CreateParaException(const AMensagem: string);
begin
  FCodigo := 500;
  FDescricao := 'Erro!';
  FMensagem := AMensagem;
end;

{ ERota }

function ERota.CriaErroModelo: TErroModelo;
begin
  Result := TErroModelo.Create;
  AjustaValoresErroModelo(Result);
end;

{ ENaoEncontrado }

procedure ENaoEncontrado.AjustaValoresErroModelo(LErroModelo: TErroModelo);
begin
  LErroModelo.Codigo := 404;
  LErroModelo.Descricao := 'Não encontrado!';
  LErroModelo.Mensagem := Message;
end;

{ ENaoAutorizado }

procedure ENaoAutorizado.AjustaValoresErroModelo(LErroModelo: TErroModelo);
begin
  LErroModelo.Codigo := 401;
  LErroModelo.Descricao := 'Não autorizado!';
  LErroModelo.Mensagem := Message;
end;

{ EFaltaInformacao }

procedure EFaltaInformacao.AjustaValoresErroModelo(LErroModelo: TErroModelo);
begin
  LErroModelo.Codigo := 500;
  LErroModelo.Descricao := 'Falta Informação!';
  LErroModelo.Mensagem := Message;
end;

end.
