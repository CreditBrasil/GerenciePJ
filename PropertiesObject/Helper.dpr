library Helper;

{%File 'teste.js'}

uses
  ComServ,
  Helper_TLB in 'Helper_TLB.pas',
  uProperties in 'uProperties.pas' {Properties: CoClass},
  uAlxProperty in 'uAlxProperty.pas' {AlxProperty: CoClass},
  uFormProperties in 'uFormProperties.pas' {FormProperties};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
