unit MVC_Visao;

interface

uses
  SysUtils, Variants, HTTPApp, ServiceLocator, Utilitario_StringToGUID, MVC_Interfaces;

type
  TProcuraVisao = function (const ANomeControlador, ANomeVisao: string): IVisao;

  TVisao = class(TSLObject, IVisao)
  private
    FFabricaVisao: IFabricaVisao;
    FModeloValor: Variant;
    FParametros: IParametros;
  protected
    class procedure RegistreSe;
    { IVisao }
    procedure GeraResposta(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
      AResponse: TWebResponse); virtual; abstract;
    function GetConteudo(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
      AResponse: TWebResponse): string; virtual; abstract;
    function GetFabricaVisao: IFabricaVisao;
    function GetModeloInterface: IInterface; virtual;
    function GetModeloObject: TObject; virtual;
    function GetModeloValor: Variant;
    function GetParametros: IParametros;
    procedure SetFabricaVisao(const Value: IFabricaVisao);
    procedure SetModeloInterface(const AValue: IInterface); virtual;
    procedure SetModeloObject(const AValue: TObject); virtual;
    procedure SetModeloValor(const AValue: Variant);

    property FabricaVisao: IFabricaVisao read GetFabricaVisao write SetFabricaVisao;
    property ModeloValor: Variant read GetModeloValor write SetModeloValor;
    property Parametros: IParametros read GetParametros;
  public
    constructor Create; override;
  end;

var
  ProcuraVisao: TProcuraVisao;

implementation

var
  GGUIDVisoes: TStringToGUID;

function ProcuraVisaoPadrao(const ANomeControlador, ANomeVisao: string): IVisao;
var
  LNomeClasseVisao: string;
begin
  LNomeClasseVisao := 'TVisao' + ANomeControlador + ANomeVisao;
  if GGUIDVisoes.Exists(LNomeClasseVisao) then
    Result := SL.Get(GGUIDVisoes.GetGUID(LNomeClasseVisao)) as IVisao
  else
    raise ENaoEncontrado.CreateFmt('A visão %s do controlador %s não foi encontrada', [ANomeVisao, ANomeControlador]);
end;

{ TVisao }

constructor TVisao.Create;
begin
  inherited;
  FParametros := SL as IParametros;
end;

function TVisao.GetFabricaVisao: IFabricaVisao;
begin
  Result := FFabricaVisao;
end;

function TVisao.GetModeloInterface: IInterface;
begin
  if VarIsType(FModeloValor, varUnknown) then
    Result := FModeloValor
  else
    Result := nil;
end;

function TVisao.GetModeloObject: TObject;
begin
  Result := nil;
end;

function TVisao.GetModeloValor: Variant;
begin
  Result := FModeloValor;
end;

function TVisao.GetParametros: IParametros;
begin
  Result := FParametros;
end;

class procedure TVisao.RegistreSe;
var
  LGUID: TGUID;
begin
  Assert(CreateGUID(LGUID) = 0);
  GGUIDVisoes.Add(Self.ClassName, LGUID);
  SelfRegister(LGUID);
end;

procedure TVisao.SetFabricaVisao(const Value: IFabricaVisao);
begin
  FFabricaVisao := Value;
end;

procedure TVisao.SetModeloInterface(const AValue: IInterface);
begin
  FModeloValor := AValue;
end;

procedure TVisao.SetModeloObject(const AValue: TObject);
begin
  //Faz Nada
end;

procedure TVisao.SetModeloValor(const AValue: Variant);
begin
  FModeloValor := AValue;
end;

initialization

  GGUIDVisoes := TStringToGUID.Create;
  ProcuraVisao := @ProcuraVisaoPadrao;

finalization

  ProcuraVisao := nil;
  FreeAndNil(GGUIDVisoes);

end.
