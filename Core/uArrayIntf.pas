unit uArrayIntf;

interface

type
  IApplyFunctionItemArray = interface
    ['{3D3ACDA2-AD84-4CDF-AF4B-0D871FF81646}']
    procedure Apply(var AItem: IUnknown);
  end;

  IInterfaceArray = interface
    ['{C46DB362-F5AB-4232-B9F4-299AC84555A1}']
    procedure ForAll(AApplyFunction: IApplyFunctionItemArray);
    function GetInterfaces(Index: Integer): IUnknown;
    procedure SetInterfaces(Index: Integer; const Value: IUnknown);

    property Interfaces[Index: Integer]: IUnknown read GetInterfaces write SetInterfaces; default;
  end;

implementation

end.
