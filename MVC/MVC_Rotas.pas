unit MVC_Rotas;

interface

uses
  SysUtils, Classes, Contnrs, SyncObjs, HTTPApp, ServiceLocator, MVC_Interfaces;

type
  TRota = class(TInterfacedObject, IRota)
  private
    FTipoDeRota: ITipoDeRota;
    FNomeAcao: string;
    FNomeControlador: string;
    FOutrosElementos: TOutrosElementos;
    FQueryString: IParametros;
  protected
    { IRota }
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
    property NomeAcao: string read GetNomeAcao write FNomeAcao;
    property NomeControlador: string read GetNomeControlador write FNomeControlador;
    property OutrosElementos: TOutrosElementos read GetOutrosElementos write FOutrosElementos;
    property QueryString: IParametros read GetQueryString;
    property TerceiroElementoComoInteiro: Integer read GetTerceiroElementoComoInteiro;
  public
    constructor Create(const ATipoDeRota: ITipoDeRota; const ANomeControlador, ANomeAcao: string;
      const AArgumentos: array of string);
  end;

  TClasseFabricaRota = class of TTipoDeRota;

  TTipoDeRota = class(TInterfacedObject, ITipoDeRota)
  private
    FNomeAcao: string;
    FNomeControlador: string;
    FOutrosElementos: TOutrosElementos;
    FQueryString: IParametros;
    FRequest: TWebRequest;
    function GetQueryString: IParametros;
  protected
    procedure CapturaElementos(ARequest: TWebRequest; AListaElementos: TStrings); virtual;
    procedure CapturaQueryString(ARequest: TWebRequest);
    class function CreateListaElementos(const APathInfo: string): TStrings;
    class function NomeFabricaRota: string; virtual; abstract;
    class function QueryStringURL(AQueryString: IParametros): string;
    property NomeAcao: string read FNomeAcao write FNomeAcao;
    property NomeControlador: string read FNomeControlador write FNomeControlador;
    property OutrosElementos: TOutrosElementos read FOutrosElementos write FOutrosElementos;
    property QueryString: IParametros read GetQueryString;
    property Request: TWebRequest read FRequest;
    { ITipoDeRota }
    function GetNome: string;

    function CriaRota: IRota; overload;
    function CriaRota(const ANomeControlador, ANomeAcao: string; const AArgumentos: array of string): IRota; overload;
    function NomeInternoDoControlador(const ANomeControlador: string): string; virtual;
    function RotasSimilares(const ARota1, ARota2: IRota): Boolean; virtual; abstract;
    function URLPara(const ARota: IRota): string; virtual;
  public
    constructor Create(ARequest: TWebRequest);
    constructor CreateECapturaORequest(ARequest: TWebRequest);
    class function Atende(ARequest: TWebRequest): Boolean; virtual;
  end;

  TRotas = class(TObject)
  private
    class function Count: Integer;
    class function GetClasseFabricaRota(AIndex: Integer): TClasseFabricaRota;
  public
    class procedure Adiciona(AClasseFabricaRota: TClasseFabricaRota); overload;
    class procedure Adiciona(const AClassesFabricaRota: array of TClasseFabricaRota); overload;
    class function Determina(ARequest: TWebRequest): ITipoDeRota;
    class function FabricaPeloNome(const ANomeRota: string; ARequest: TWebRequest): ITipoDeRota;
  end;

  TRotaFluente = class(TInterfacedObject, IRotaFluente)
  private
    FFabricaTipoDeRota: IFabricaTipoDeRota;
    FNomeRota,
    FNomeControlador,
    FNomeAcao: string;
    FOutrosElementos: TOutrosElementos;
    FQueryString: IParametros;
    function GetQueryString: IParametros;
  protected
    property QueryString: IParametros read GetQueryString;
    { IRotaFluente }
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
  public
    constructor Create(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARotaExemplo: IRota);
  end;

  TFabricaTipoDeRota = class(TInterfacedObject, IFabricaTipoDeRota)
  private
    FRequest: TWebRequest;
  protected
    { IFabricaTipoDeRota }
    function GetRequest: TWebRequest;

    function CriaRotaFluente(const ARotaExemplo: IRota = nil): IRotaFluente;
    function CriaTipoDeRota(const ANomeRota: string): ITipoDeRota;
    function CriaTipoDeRotaAtual: ITipoDeRota;
  public
    constructor Create(ARequest: TWebRequest);
  end;

implementation

var
  GFabricaRotas: TClassList;
  GRotasCriticalSection: TCriticalSection;

{ TRota }

constructor TRota.Create(const ATipoDeRota: ITipoDeRota; const ANomeControlador, ANomeAcao: string;
  const AArgumentos: array of string);
begin
  FTipoDeRota := ATipoDeRota;
  FNomeControlador := ANomeControlador;
  FNomeAcao := ANomeAcao;
  FOutrosElementos := CriaOutrosElementos(AArgumentos);
end;

function TRota.GetNome: string;
begin
  Result := FTipoDeRota.Nome;
end;

function TRota.GetNomeAcao: string;
begin
  Result := FNomeAcao;
end;

function TRota.GetNomeControlador: string;
begin
  Result := FNomeControlador;
end;

function TRota.GetOutrosElementos: TOutrosElementos;
begin
  Result := FOutrosElementos;
end;

function TRota.GetQueryString: IParametros;
begin
  if FQueryString = nil then
    FQueryString := SL as IParametros;
  Result := FQueryString;
end;

function TRota.GetTerceiroElementoComoInteiro: Integer;
begin
  if Length(FOutrosElementos) >= 1 then
    Result := StrToIntDef(FOutrosElementos[0], -1)
  else
    Result := -1;
end;

function TRota.NomeInternoDoControlador: string;
begin
  Result := FTipoDeRota.NomeInternoDoControlador(FNomeControlador);
end;

function TRota.RotaSimilar(const ARota: IRota): Boolean;
begin
  Result := FTipoDeRota.RotasSimilares(Self, ARota);
end;

function TRota.TemQueryString: Boolean;
begin
  Result := FQueryString <> nil;
end;

function TRota.URL: string;
begin
  Result := FTipoDeRota.URLPara(Self);
end;

{ TTipoDeRota }

class function TTipoDeRota.Atende(ARequest: TWebRequest): Boolean;
begin
  Result := False;
end;

procedure TTipoDeRota.CapturaElementos(ARequest: TWebRequest; AListaElementos: TStrings);
var
  laco: Integer;
begin
  if AListaElementos.Count > 0 then
    FNomeControlador := AListaElementos[0];
  if AListaElementos.Count > 1 then
    FNomeAcao := AListaElementos[1];
  if AListaElementos.Count > 2 then
  begin
    SetLength(FOutrosElementos, AListaElementos.Count - 2);
    for laco := 2 to AListaElementos.Count - 1 do
      FOutrosElementos[laco - 2] := AListaElementos[laco];
  end;
end;

procedure TTipoDeRota.CapturaQueryString(ARequest: TWebRequest);
var
  laco: Integer;
begin
  for laco := 0 to ARequest.QueryFields.Count - 1 do
    QueryString[ARequest.QueryFields.Names[laco]] := ARequest.QueryFields.Values[ARequest.QueryFields.Names[laco]];
end;

constructor TTipoDeRota.Create(ARequest: TWebRequest);
begin
  FRequest := ARequest;
end;

constructor TTipoDeRota.CreateECapturaORequest(ARequest: TWebRequest);
var
  LListaElementos: TStrings;
begin
  Create(ARequest);
  if Atende(ARequest) then
  begin
    LListaElementos := CreateListaElementos(ARequest.InternalPathInfo);
    try
      CapturaElementos(ARequest, LListaElementos);
    finally
      LListaElementos.Free;
    end;
    CapturaQueryString(ARequest);
  end;
end;

class function TTipoDeRota.CreateListaElementos(const APathInfo: string): TStrings;
var
  laco, i, t: Integer;
begin
  Result := TStringList.Create;
  i := 1;
  for laco := 1 to Length(APathInfo) do
    if APathInfo[laco] = '/' then
    begin
      t := laco - i;
      if t > 0 then
        Result.Append(HTTPDecode(Copy(APathInfo, i, t)));
      i := laco + 1;
    end;
  if i <= Length(APathInfo) then
    Result.Append(HTTPDecode(Copy(APathInfo, i, MaxInt)));
end;

function TTipoDeRota.CriaRota: IRota;
begin
  Result := CriaRota(FNomeControlador, FNomeAcao, FOutrosElementos);
end;

function TTipoDeRota.CriaRota(const ANomeControlador, ANomeAcao: string; const AArgumentos: array of string): IRota;
begin
  Result := TRota.Create(Self, ANomeControlador, ANomeAcao, AArgumentos);
  if FQueryString <> nil then
    Result.QueryString.Assign(FQueryString);
end;

function TTipoDeRota.GetNome: string;
begin
  Result := NomeFabricaRota;
end;

function TTipoDeRota.GetQueryString: IParametros;
begin
  if FQueryString = nil then
    FQueryString := SL as IParametros;
  Result := FQueryString;
end;

function TTipoDeRota.URLPara(const ARota: IRota): string;
begin
  if ARota.TemQueryString then
    Result := QueryStringURL(ARota.QueryString);
end;

class function TTipoDeRota.QueryStringURL(AQueryString: IParametros): string;
const
  InclueE: array [Boolean] of string = ('', '&');
var
  laco: Integer;
  LIterator: IIteratorParametros;
begin
  if AQueryString <> nil then
  begin
    Result := '?';
    LIterator := AQueryString.Iterator;
    laco := 0;
    while LIterator.Next do
    begin
      Result := Result + InclueE[laco > 0] + HTTPEncode(LIterator.Nome) + '=' + HTTPEncode(LIterator.Valor);
      Inc(laco);
    end;
  end;
end;

function TTipoDeRota.NomeInternoDoControlador(const ANomeControlador: string): string;
begin
  Result := ANomeControlador;
end;

{ TRotas }

class procedure TRotas.Adiciona(AClasseFabricaRota: TClasseFabricaRota);
begin
  GRotasCriticalSection.Acquire;
  try
    GFabricaRotas.Add(AClasseFabricaRota);
  finally
    GRotasCriticalSection.Release;
  end;
end;

class procedure TRotas.Adiciona(const AClassesFabricaRota: array of TClasseFabricaRota);
var
  laco: Integer;
begin
  for laco := Low(AClassesFabricaRota) to High(AClassesFabricaRota) do
    Adiciona(AClassesFabricaRota[laco]);
end;

class function TRotas.Count: Integer;
begin
  GRotasCriticalSection.Acquire;
  try
    Result := GFabricaRotas.Count;
  finally
    GRotasCriticalSection.Release;
  end;
end;

class function TRotas.Determina(ARequest: TWebRequest): ITipoDeRota;
var
  laco: Integer;
  LClasseFabricaRota: TClasseFabricaRota;
begin
  LClasseFabricaRota := nil;
  for laco := 0 to Count - 1 do
  begin
    LClasseFabricaRota := GetClasseFabricaRota(laco);
    if LClasseFabricaRota.Atende(ARequest) then
      Break;
  end;
  if LClasseFabricaRota = nil then
    raise ENaoEncontrado.CreateFmt('Não existe rota definida para %s', [ARequest.InternalPathInfo]);
  Result := LClasseFabricaRota.CreateECapturaORequest(ARequest);
end;

class function TRotas.FabricaPeloNome(const ANomeRota: string; ARequest: TWebRequest): ITipoDeRota;
var
  laco: Integer;
  LClasseFabricaRota: TClasseFabricaRota;
begin
  LClasseFabricaRota := nil;
  for laco := 0 to Count - 1 do
  begin
    LClasseFabricaRota := GetClasseFabricaRota(laco);
    if SameText(LClasseFabricaRota.NomeFabricaRota, ANomeRota) then
      Break;
  end;
  if LClasseFabricaRota = nil then
    raise ENaoEncontrado.CreateFmt('Não existe a rota %s', [ANomeRota]);
  Result := LClasseFabricaRota.Create(ARequest);
end;

class function TRotas.GetClasseFabricaRota(AIndex: Integer): TClasseFabricaRota;
begin
  GRotasCriticalSection.Acquire;
  try
    Result := TClasseFabricaRota(GFabricaRotas[AIndex]);
  finally
    GRotasCriticalSection.Release;
  end;
end;

{ TRotaFluente }

function TRotaFluente.Acao(const ANomeAcao: string): IRotaFluente;
begin
  Result := Self;
  FNomeAcao := ANomeAcao;
end;

function TRotaFluente.AddOutro(const AOutroElemento: string): IRotaFluente;
var
  LPosicao: Integer;
begin
  Result := Self;
  LPosicao := Length(FOutrosElementos);
  SetLength(FOutrosElementos, LPosicao + 1);
  FOutrosElementos[LPosicao] := AOutroElemento;
end;

function TRotaFluente.Clonar: IRotaFluente;
begin
  Result := TRotaFluente.Create(FFabricaTipoDeRota, CriaRota);
end;

function TRotaFluente.Controlador(const ANomeControlador: string): IRotaFluente;
begin
  Result := Self;
  FNomeControlador := ANomeControlador;
end;

constructor TRotaFluente.Create(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARotaExemplo: IRota);
begin
  FFabricaTipoDeRota := AFabricaTipoDeRota;
  if ARotaExemplo <> nil then
  begin
    FNomeRota := ARotaExemplo.Nome;
    FNomeControlador := ARotaExemplo.NomeControlador;
    FNomeAcao := ARotaExemplo.NomeAcao;
    FOutrosElementos := Copy(ARotaExemplo.OutrosElementos);
    if ARotaExemplo.TemQueryString then
      QueryString.Assign(ARotaExemplo.QueryString);
  end;
end;

function TRotaFluente.CriaRota: IRota;
begin
  Result := FFabricaTipoDeRota.CriaTipoDeRota(FNomeRota).CriaRota(FNomeControlador, FNomeAcao, FOutrosElementos);
  if FQueryString <> nil then
    Result.QueryString.Assign(FQueryString);
end;

function TRotaFluente.GetQueryString: IParametros;
begin
  if FQueryString = nil then
    FQueryString := SL as IParametros;
  Result := FQueryString;
end;

function TRotaFluente.LimpaOutros: IRotaFluente;
begin
  Result := Self;
  SetLength(FOutrosElementos, 0);
end;

function TRotaFluente.LimpaQuerysStrings: IRotaFluente;
begin
  Result := Self;
  FQueryString.Clear;
end;

function TRotaFluente.Nome(const ANomeRota: string): IRotaFluente;
begin
  Result := Self;
  FNomeRota := ANomeRota;
end;

function TRotaFluente.Outro(APosicao: Integer; const AOutroElemento: string): IRotaFluente;
begin
  Result := Self;
  if Length(FOutrosElementos) <= APosicao then
    SetLength(FOutrosElementos, APosicao + 1);
  FOutrosElementos[APosicao] := AOutroElemento;
end;

function TRotaFluente.Outros(const AOutrosElementos: array of string): IRotaFluente;
begin
  Result := Self;
  FOutrosElementos := CriaOutrosElementos(AOutrosElementos);
end;

function TRotaFluente.Outros(const AOutrosElementosComBarra: string): IRotaFluente;
var
  i, f: Integer;
  LOutros: array of string;
begin
  i := 1;
  f := AnsiPos('/', AOutrosElementosComBarra);
  while f > 0 do
  begin
    SetLength(LOutros, Length(LOutros) + 1);
    LOutros[Length(LOutros) - 1] := Copy(AOutrosElementosComBarra, i, f - 1);
    i := i + f;
    f := AnsiPos('/', Copy(AOutrosElementosComBarra, i, MaxInt));
  end;
  SetLength(LOutros, Length(LOutros) + 1);
  LOutros[Length(LOutros) - 1] := Copy(AOutrosElementosComBarra, i, MaxInt);
  Result := Outros(LOutros);
end;

function TRotaFluente.Query(const ANome, AValor: string): IRotaFluente;
begin
  Result := Self;
  QueryString[ANome] := AValor;
end;

function TRotaFluente.RotaSimilar(const ARota: IRota): Boolean;
begin
  Result := CriaRota.RotaSimilar(ARota);
end;

function TRotaFluente.URL: string;
begin
  Result := CriaRota.URL;
end;

{ TFabricaTipoDeRota }

function TFabricaTipoDeRota.CriaRotaFluente(const ARotaExemplo: IRota): IRotaFluente;
begin
  Result := TRotaFluente.Create(Self, ARotaExemplo);
end;

function TFabricaTipoDeRota.CriaTipoDeRota(const ANomeRota: string): ITipoDeRota;
begin
  Result := TRotas.FabricaPeloNome(ANomeRota, FRequest);
end;

function TFabricaTipoDeRota.CriaTipoDeRotaAtual: ITipoDeRota;
begin
  Result := TRotas.Determina(FRequest);
end;

constructor TFabricaTipoDeRota.Create(ARequest: TWebRequest);
begin
  FRequest := ARequest;
end;

function TFabricaTipoDeRota.GetRequest: TWebRequest;
begin
  Result := FRequest;
end;

initialization

  GRotasCriticalSection := TCriticalSection.Create;
  GFabricaRotas := TClassList.Create;

finalization

  FreeAndNil(GFabricaRotas);
  FreeAndNil(GRotasCriticalSection);

end.
