unit MVC_Visao_Erro_JSON;

interface

uses
  HTTPApp, MVC_Interfaces, MVC_Visao_JSON, superobject;

type
  TVisaoErroJSON = class(TVisaoJSON)
  private
    FModelo: TErroModelo;
  protected
    procedure GeraResposta(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
      AResponse: TWebResponse); override;
    function GetModeloObject: TObject; override;
    procedure HTML; override;
    procedure SetModeloObject(const AValue: TObject); override;
    property Modelo: TErroModelo read FModelo;
  public
    destructor Destroy; override;
  end;

implementation

{ TVisaoErroJSON }

destructor TVisaoErroJSON.Destroy;
begin
  FModelo.Free; FModelo := nil;
  inherited;
end;

procedure TVisaoErroJSON.GeraResposta(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
  AResponse: TWebResponse);
begin
  inherited;
  AResponse.StatusCode := Modelo.Codigo;; 
end;

function TVisaoErroJSON.GetModeloObject: TObject;
begin
  Result := FModelo;
end;

procedure TVisaoErroJSON.HTML;
begin
  SetModeloInterface(SO(['StatusCode', Modelo.Codigo, 'Descricao', Modelo.Descricao, 'Mensagem', Modelo.Mensagem]));
  inherited;
end;

procedure TVisaoErroJSON.SetModeloObject(const AValue: TObject);
begin
  FModelo := AValue as TErroModelo;
  inherited;
end;

initialization

  TVisaoErroJSON.RegistreSe;

end.
