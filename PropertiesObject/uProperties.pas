unit uProperties;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  SysUtils, Classes, Controls, ComObj, ActiveX, Helper_TLB, StdVcl, uFormProperties;

type
  TProperties = class(TAutoObject, IProperties)
  private
    FList: IInterfaceList;
    function GetList: IInterfaceList;
  protected
    function FindByName(const AName: WideString): IAlxProperty; safecall;
    function Get_Item(AIndexOrName: OleVariant): IAlxProperty; safecall;
    function Get_Count: Integer; safecall;
    function NewProperty(const AName: WideString; AValue: OleVariant; AType: EnumTypes): IAlxProperty; safecall;
    procedure Set_Item(AIndexOrName: OleVariant; const Value: IAlxProperty);
      safecall;
    function Show(const ACaption: WideString): WordBool; safecall;
  end;

implementation

uses
  ComServ, Variants;

function TProperties.FindByName(const AName: WideString): IAlxProperty;
var
  laco: Integer;
begin
  Result := nil;
  for laco := 0 to Get_Count - 1 do
    if AnsiSameText(AName, Get_Item(laco).Name) then
    begin
      Result := Get_Item(laco);
      Break;
    end;
end;

function TProperties.GetList: IInterfaceList;
begin
  if FList = nil then
    FList := TInterfaceList.Create;
  Result := FList;
end;

function TProperties.Get_Count: Integer;
begin
  Result := GetList.Count;
end;

function TProperties.Get_Item(AIndexOrName: OleVariant): IAlxProperty;
var
  LIndex: Integer;
begin
  if VarIsType(AIndexOrName, varInteger) then
  begin
    LIndex := AIndexOrName;
    Assert((LIndex >= 0) and (LIndex < Get_Count), 'Index fora do intervalo');
    Result := GetList[LIndex] as IAlxProperty;
  end
  else
    Result := FindByName(AIndexOrName);
end;

function TProperties.NewProperty(const AName: WideString; AValue: OleVariant; AType: EnumTypes): IAlxProperty;
begin
  Result := CoAlxProperty.Create;
  Result.Name := AName;
  Result.Value := AValue;
  Result.AlxType := AType;
  GetList.Add(Result);
end;

procedure TProperties.Set_Item(AIndexOrName: OleVariant;
  const Value: IAlxProperty);
var
  LAlxProperty: IAlxProperty;
begin
  LAlxProperty := Get_Item(Value.Name);
  if LAlxProperty <> nil then
  begin
    LAlxProperty.Name := Value.Name;
    LAlxProperty.Value := Value.Value;
    LAlxProperty.AlxType := Value.AlxType;
  end;
end;

function TProperties.Show(const ACaption: WideString): WordBool;
var
  LFormProperties: TFormProperties;
begin
  Result := False;
  LFormProperties := TFormProperties.Create(nil);
  try
    LFormProperties.Caption := ACaption;
    LFormProperties.Properties := Self;
    Result := LFormProperties.ShowModal = mrOk;
  finally
    LFormProperties.Free;
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TProperties, Class_Properties, ciMultiInstance, tmApartment);
end.
