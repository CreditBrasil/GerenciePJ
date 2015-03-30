unit MVC_Visao_JSONLiberadoAcesso;

interface

uses
  HTTPApp, MVC_Interfaces, MVC_Visao_JSON;

type
  TVisaoJSONLiberadoAcesso = class(TVisaoJSON)
  protected
    procedure GeraResposta(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
      AResponse: TWebResponse); override;
  end;

implementation

{ TVisaoJSONLiberadoAcesso }


{ TVisaoJSONLiberadoAcesso }

procedure TVisaoJSONLiberadoAcesso.GeraResposta(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
  AResponse: TWebResponse);
begin
  AResponse.SetCustomHeader('Access-Control-Allow-Origin', '*');
  inherited;
end;

initialization

  TVisaoJSONLiberadoAcesso.RegistreSe;

end.
