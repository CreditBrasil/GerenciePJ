unit MVC_Visao_NaoModificado;

interface

uses
  Variants, HTTPApp, MVC_Interfaces;

type
  TVisaoNaoModificado = class(TInterfacedObject, IVisao)
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
  end;

implementation

{ TVisaoNaoModificado }

procedure TVisaoNaoModificado.GeraResposta(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
  AResponse: TWebResponse);
begin
  AResponse.StatusCode := 304;
  AResponse.SendResponse;
end;

function TVisaoNaoModificado.GetConteudo(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
  AResponse: TWebResponse): string;
begin
  Result := '';
end;

function TVisaoNaoModificado.GetFabricaVisao: IFabricaVisao;
begin
  Result := nil;
end;

function TVisaoNaoModificado.GetModeloInterface: IInterface;
begin
  Result := nil;
end;

function TVisaoNaoModificado.GetModeloObject: TObject;
begin
  Result := nil;
end;

function TVisaoNaoModificado.GetModeloValor: Variant;
begin
  Result := Unassigned;
end;

function TVisaoNaoModificado.GetParametros: IParametros;
begin
  Result := nil;
end;

procedure TVisaoNaoModificado.SetFabricaVisao(const Value: IFabricaVisao);
begin
  //Faz Nada
end;

procedure TVisaoNaoModificado.SetModeloInterface(const AValue: IInterface);
begin
  //Faz Nada
end;

procedure TVisaoNaoModificado.SetModeloObject(const AValue: TObject);
begin
  //Faz Nada
end;

procedure TVisaoNaoModificado.SetModeloValor(const AValue: Variant);
begin
  //Faz Nada
end;

end.
