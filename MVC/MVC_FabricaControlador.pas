unit MVC_FabricaControlador;

interface

uses
  SysUtils, Classes, ServiceLocator, MVC_Interfaces, MVC_Controlador;

implementation

type
  TFabricaControlador = class(TSLObject, IFabricaControlador)
  protected
    { IFabricaControlador }
    function CriaControlador(const ARota: IRota): IControlador;
  end;

{ TFabricaControlador }

function TFabricaControlador.CriaControlador(const ARota: IRota): IControlador;
begin
  Result := ProcuraControlador(ARota);
end;

initialization

  TFabricaControlador.SelfRegister(IFabricaControlador);

end.
