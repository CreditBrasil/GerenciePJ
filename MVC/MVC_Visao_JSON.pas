unit MVC_Visao_JSON;

interface

uses
  MVC_Visao_HTML, superobject;

type
  TVisaoJSON = class(TVisaoHTML)
  private
    FSuperObject: ISuperObject;
  protected
    procedure HTML; override;
    function GetModeloInterface: IInterface; override;
    procedure SetModeloInterface(const AValue: IInterface); override;
  end;

implementation

{ TVisaoJSON }

function TVisaoJSON.GetModeloInterface: IInterface;
begin
  Result := FSuperObject;
end;

procedure TVisaoJSON.HTML;
begin
  Response.ContentType := 'text/json';
  Write(FSuperObject.AsJSon({$IFDEF FullDebugMode}True{$ELSE}False{$ENDIF}));
end;

procedure TVisaoJSON.SetModeloInterface(const AValue: IInterface);
begin
  FSuperObject := AValue as ISuperObject;
  inherited;
end;

initialization

  TVisaoJSON.RegistreSe;

end.
