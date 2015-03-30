unit MVC_Visao_Redireciona;

interface

uses
  Variants, HTTPApp, MVC_Interfaces;

type
  TVisaoRedireciona = class(TInterfacedObject, IVisao)
  private
    FURL: string;
  protected
    { IVisao }
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
  public
    constructor Create(const AURL: string);
  end;

implementation

{ TVisaoRedireciona }

constructor TVisaoRedireciona.Create(const AURL: string);
begin
  FURL := AURL;
end;

procedure TVisaoRedireciona.GeraResposta(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
  AResponse: TWebResponse);
begin
  AResponse.SendRedirect(FURL);
end;

function TVisaoRedireciona.GetConteudo(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
  AResponse: TWebResponse): string;
begin
  Result := '';
end;

function TVisaoRedireciona.GetFabricaVisao: IFabricaVisao;
begin
  Result := nil;
end;

function TVisaoRedireciona.GetModeloInterface: IInterface;
begin
  Result := nil;
end;

function TVisaoRedireciona.GetModeloObject: TObject;
begin
  Result := nil;
end;

function TVisaoRedireciona.GetModeloValor: Variant;
begin
  Result := Unassigned;
end;

function TVisaoRedireciona.GetParametros: IParametros;
begin
  Result := nil;
end;

procedure TVisaoRedireciona.SetFabricaVisao(const Value: IFabricaVisao);
begin
  //Faz Nada
end;

procedure TVisaoRedireciona.SetModeloInterface(const AValue: IInterface);
begin
  //Faz Nada
end;

procedure TVisaoRedireciona.SetModeloObject(const AValue: TObject);
begin
  //Faz Nada
end;

procedure TVisaoRedireciona.SetModeloValor(const AValue: Variant);
begin
  //Faz Nada
end;

end.
