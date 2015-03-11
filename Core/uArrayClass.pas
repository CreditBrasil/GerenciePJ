unit uArrayClass;

interface

uses
  SysUtils, Classes, uArrayIntf, SyncObjs;

type
  TSimpleInterfaceArray = class(TInterfacedObject, IInterfaceArray)
  private
    FList: IInterfaceList;
    FForAllCriticalSection: TCriticalSection;
  protected
    { IInterfaceArray }
    procedure ForAll(AApplyFunction: IApplyFunctionItemArray);
    function GetInterfaces(Index: Integer): IUnknown;
    procedure SetInterfaces(Index: Integer; const Value: IUnknown);
  public
    constructor Create(ACount: Integer);
    destructor Destroy; override;
  end;

  TSIAQuantum = (SIASmall, SIALarge);

  TSparseInterfaceArray = class(TInterfacedObject, IInterfaceArray)
  private
    FCacheIndex: Integer;
    FCacheInterface: IUnknown;
    FSections: IInterfaceList;
    FIndexMask, FSectionShift, FSectionSize: Word;
    FCriticalSection: TCriticalSection;
    function GetSection(Index: Integer; ACreate: Boolean): IInterfaceArray;
  protected
    { IInterfaceArray }
    procedure ForAll(AApplyFunction: IApplyFunctionItemArray);
    function GetInterfaces(Index: Integer): IUnknown;
    procedure SetInterfaces(Index: Integer; const Value: IUnknown);
  public
    constructor Create(ASIAQuantum: TSIAQuantum);
    destructor Destroy; override;
  end;

implementation

const
  SIAIndexMask: array [TSIAQuantum] of Byte = (15, 255);
  SIASectionShift: array [TSIAQuantum] of Byte = (4, 8);

{ TSimpleInterfaceArray }

constructor TSimpleInterfaceArray.Create(ACount: Integer);
begin
  FForAllCriticalSection := TCriticalSection.Create;
  FList := TInterfaceList.Create;
  FList.Count := ACount;
end;

destructor TSimpleInterfaceArray.Destroy;
begin
  FreeAndNil(FForAllCriticalSection);
  inherited;
end;

procedure TSimpleInterfaceArray.ForAll(
  AApplyFunction: IApplyFunctionItemArray);
var
  laco: Integer;
  LItem: IUnknown;
begin
  FForAllCriticalSection.Acquire;
  try
    for laco := 0 to FList.Count - 1 do
    begin
      LItem := FList[laco];
      if LItem <> nil then
      begin
        AApplyFunction.Apply(LItem);
        if FList[laco] <> LItem then
          FList[laco] := LItem;
      end;
    end;
  finally
    FForAllCriticalSection.Release;
  end;
end;

function TSimpleInterfaceArray.GetInterfaces(Index: Integer): IUnknown;
begin
  Result := FList[Index];
end;

procedure TSimpleInterfaceArray.SetInterfaces(Index: Integer;
  const Value: IUnknown);
begin
  FList[Index] := Value;
end;

{ TSparseInterfaceArray }

constructor TSparseInterfaceArray.Create(ASIAQuantum: TSIAQuantum);
begin
  FCriticalSection := TCriticalSection.Create;
  FSections := TInterfaceList.Create;
  FSectionSize := Word(SIAIndexMask[ASIAQuantum]) + 1;
  FIndexMask := Word(SIAIndexMask[ASIAQuantum]);
  FSectionShift := Word(SIASectionShift[ASIAQuantum]);
  FCacheIndex := -MaxInt;
end;

destructor TSparseInterfaceArray.Destroy;
begin
  FreeAndNil(FCriticalSection);
  inherited;
end;

procedure TSparseInterfaceArray.ForAll(
  AApplyFunction: IApplyFunctionItemArray);
var
  laco: Integer;
begin
  FCriticalSection.Acquire;
  try
    for laco := 0 to FSections.Count - 1 do
      if FSections[laco] <> nil then
        (FSections[laco] as IInterfaceArray).ForAll(AApplyFunction);
  finally
    FCriticalSection.Release;
  end;
end;

function TSparseInterfaceArray.GetInterfaces(Index: Integer): IUnknown;
var
  LSection: IInterfaceArray;
begin
  FCriticalSection.Acquire;
  try
    if Index = FCacheIndex then
      Result := FCacheInterface
    else
    begin
      LSection := GetSection(Index, False);
      if LSection = nil then
        Result := nil
      else
        Result := LSection[Index and FIndexMask];
      FCacheIndex := Index;
      FCacheInterface := Result;
    end;
  finally
    FCriticalSection.Release;
  end;
end;

function TSparseInterfaceArray.GetSection(
  Index: Integer; ACreate: Boolean): IInterfaceArray;
var
  LSectionIndex: Integer;
begin
  LSectionIndex := Index shr FSectionShift;
  if ACreate and (FSections.Count <= LSectionIndex) then
    FSections.Count := LSectionIndex + 1;
  if (not ACreate) and (FSections.Count <= LSectionIndex) then
    Result := nil
  else
    Result := FSections[LSectionIndex] as IInterfaceArray;
  if (Result = nil) and ACreate then
  begin
    Result := TSimpleInterfaceArray.Create(FSectionSize);
    FSections[LSectionIndex] := Result;
  end;
end;

procedure TSparseInterfaceArray.SetInterfaces(Index: Integer;
  const Value: IUnknown);
var
  LSection: IInterfaceArray;
begin
  FCriticalSection.Acquire;
  try
    LSection := GetSection(Index, True);
    LSection[Index and FIndexMask] := Value;
    FCacheIndex := Index;
    FCacheInterface := Value;
  finally
    FCriticalSection.Release;
  end;
end;

end.
