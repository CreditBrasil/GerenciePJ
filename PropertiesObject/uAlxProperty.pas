unit uAlxProperty;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, Helper_TLB, StdVcl;

type
  TAlxProperty = class(TAutoObject, IAlxProperty)
  private
    FAlxType: EnumTypes;
    FName: WideString;
    FValue: OleVariant;
    FPickList: WideString;
  protected
    function Get_AlxType: EnumTypes; safecall;
    function Get_Name: WideString; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_AlxType(Value: EnumTypes); safecall;
    procedure Set_Name(const Value: WideString); safecall;
    procedure Set_Value(Value: OleVariant); safecall;
    function Get_PickList: WideString; safecall;
    procedure Set_PickList(const Value: WideString); safecall;
  end;

implementation

uses ComServ;

function TAlxProperty.Get_AlxType: EnumTypes;
begin
  Result := FAlxType;
end;

function TAlxProperty.Get_Name: WideString;
begin
  Result := FName;
end;

function TAlxProperty.Get_Value: OleVariant;
begin
  Result := FValue;
end;

procedure TAlxProperty.Set_AlxType(Value: EnumTypes);
begin
  FAlxType := Value;
end;

procedure TAlxProperty.Set_Name(const Value: WideString);
begin
  FName := Value;
end;

procedure TAlxProperty.Set_Value(Value: OleVariant);
begin
  FValue := Value;
end;

function TAlxProperty.Get_PickList: WideString;
begin
  Result := FPickList;
end;

procedure TAlxProperty.Set_PickList(const Value: WideString);
begin
  FPickList := Value;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TAlxProperty, Class_AlxProperty,
    ciMultiInstance, tmApartment);
end.
