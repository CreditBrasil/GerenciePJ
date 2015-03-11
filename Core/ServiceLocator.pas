unit ServiceLocator;

interface

uses
  SysUtils, Classes, ActiveX, uArrayIntf, uArrayClass, SyncObjs;

type
  TFunctionFactory = function: IUnknown;

  TSLClass = class of TSLObject;

  TSLObject = class(TInterfacedObject)
  public
    constructor Create; virtual;
    class procedure SelfRegister(const IID: TGUID); overload;
    class procedure SelfRegister(const IIDs: array of TGUID); overload;
    {$IFDEF Test}
    class procedure SelfRegisterForTest(const IID: TGUID); overload;
    class procedure SelfRegisterForTest(const IIDs: array of TGUID); overload;
    {$ENDIF}
  end;

  IServiceLocator = interface
    ['{F1DE158E-7D80-424C-BEF8-B16B1FFB7556}']
    procedure Add(const IID: TGUID; ASLClass: TSLClass); overload;
    procedure Add(const IID: TGUID; AFunctionFactory: TFunctionFactory); overload;
    procedure Add(const IID: TGUID; const AInstance: IUnknown); overload;
    {$IFDEF Test}
    procedure AddForTest(const IID: TGUID; ASLClass: TSLClass); overload;
    procedure AddForTest(const IID: TGUID; AFunctionFactory: TFunctionFactory); overload;
    procedure AddForTest(const IID: TGUID; const AInstance: IUnknown); overload;
    {$ENDIF}
    function Exist(const IID: TGUID): Boolean;
    function Get(const IID: TGUID): IUnknown;
    procedure Remove(const IID: TGUID);
    {$IFDEF Test}
    procedure RemoveAllForTests;
    {$ENDIF}
  end;

var
  SL: IServiceLocator;

implementation

type
  IFactory = interface
    ['{A3A46F84-9227-4CFB-B646-7E19B7179DEF}']
    function GetIID: TGUID;
    procedure SetIID(const Value: TGUID);

    function Build: IUnknown;
    property IID: TGUID read GetIID write SetIID;
  end;

  TFactory = class(TInterfacedObject)
  private
    FIID: TGUID;
  protected
    { IFactory }
    function GetIID: TGUID;
    procedure SetIID(const Value: TGUID);
  end;

  TFactoryBySLClassCreate = class(TFactory, IFactory)
  private
    FSLClass: TSLClass;
  protected
    { IFactory }
    function Build: IUnknown;
  public
    constructor Create(const AIID: TGUID; const ASLClass: TSLClass);
  end;

  TFactoryByFunctionFactory = class(TFactory, IFactory)
  private
    FFunctionFactory: TFunctionFactory;
  protected
    { IFactory }
    function Build: IUnknown;
  public
    constructor Create(const AIID: TGUID; const AFunctionFactory: TFunctionFactory);
  end;

  TFactoryByAlreadyBuilded = class(TFactory, IFactory)
  private
    FInstance: IUnknown;
  protected
    { IFactory }
    function Build: IUnknown;
  public
    constructor Create(const AIID: TGUID; const AInstance: IUnknown);
  end;

  IFactories = interface
    ['{ABC08895-EEE6-4713-88A9-6F781E65F195}']
    function GetFactory(const AIID: TGUID): IFactory;
    procedure SetFactory(const AIID: TGUID; const Value: IFactory);

    function Exist(const AIID: TGUID): Boolean;
    function FindFactory(const AIID: TGUID): IFactory;
    property Factory[const AIID: TGUID]: IFactory read GetFactory write SetFactory; default;
  end;

  TFactories = class(TInterfacedObject, IFactories)
  private
    FD2: IInterfaceArray;
    FCriticalSection: TCriticalSection;
  protected
    { IFactories }
    function GetFactory(const AIID: TGUID): IFactory;
    procedure SetFactory(const AIID: TGUID; const Value: IFactory);

    function Exist(const AIID: TGUID): Boolean;
    function FindFactory(const AIID: TGUID): IFactory;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  {$IFDEF Test}
  TSimpleFactories = class(TInterfacedObject, IFactories)
  private
    FFactoryList: IInterfaceList;
  protected
    { IFactories }
    function GetFactory(const AIID: TGUID): IFactory;
    procedure SetFactory(const AIID: TGUID; const Value: IFactory);

    function Exist(const AIID: TGUID): Boolean;
    function FindFactory(const AIID: TGUID): IFactory;
  public
    constructor Create;
  end;
 {$ENDIF}

  TServiceLocator = class(TInterfacedObject, IUnknown, IServiceLocator)
  private
    FFactories: IFactories;
    {$IFDEF Test}
    FFactoriesTest: IFactories;
    {$ENDIF}
  protected
    { IUnknown }
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    { IServiceLocator }
    procedure Add(const IID: TGUID; ASLClass: TSLClass); overload;
    procedure Add(const IID: TGUID; AFunctionFactory: TFunctionFactory); overload;
    procedure Add(const IID: TGUID; const AInstance: IUnknown); overload;
    {$IFDEF Test}
    procedure AddForTest(const IID: TGUID; ASLClass: TSLClass); overload;
    procedure AddForTest(const IID: TGUID; AFunctionFactory: TFunctionFactory); overload;
    procedure AddForTest(const IID: TGUID; const AInstance: IUnknown); overload;
    {$ENDIF}
    function Exist(const IID: TGUID): Boolean;
    function Get(const IID: TGUID): IUnknown;
    procedure Remove(const IID: TGUID);
    {$IFDEF Test}
    procedure RemoveAllForTests;
    {$ENDIF}
  public
    constructor Create;
  end;

{ TSLObject }

constructor TSLObject.Create;
begin
  //Faz nada, apenas faz com que o Create torne-se virtual.
end;

class procedure TSLObject.SelfRegister(const IID: TGUID);
begin
  SL.Add(IID, Self);
end;

class procedure TSLObject.SelfRegister(const IIDs: array of TGUID);
var
  laco: Integer;
begin
  for laco := Low(IIDs) to High(IIDs) do
    SelfRegister(IIDs[laco]);
end;

{$IFDEF Test}
class procedure TSLObject.SelfRegisterForTest(const IID: TGUID);
begin
  SL.AddForTest(IID, Self);
end;
{$ENDIF}

{$IFDEF Test}
class procedure TSLObject.SelfRegisterForTest(const IIDs: array of TGUID);
var
  laco: Integer;
begin
  for laco := Low(IIDs) to High(IIDs) do
    SelfRegisterForTest(IIDs[laco]);
end;
{$ENDIF}

{ TFactory }

function TFactory.GetIID: TGUID;
begin
  Result := FIID;
end;

procedure TFactory.SetIID(const Value: TGUID);
begin
  FIID := Value;
end;

{ TFactoryBySLClassCreate }

function TFactoryBySLClassCreate.Build: IUnknown;
begin
  Result := FSLClass.Create;
end;

constructor TFactoryBySLClassCreate.Create(const AIID: TGUID; const ASLClass: TSLClass);
begin
  SetIID(AIID);
  FSLClass := ASLClass;
end;

{ TFactoryByFunctionFactory }

function TFactoryByFunctionFactory.Build: IUnknown;
begin
  Result := FFunctionFactory();
end;

constructor TFactoryByFunctionFactory.Create(const AIID: TGUID; const AFunctionFactory: TFunctionFactory);
begin
  SetIID(AIID);
  FFunctionFactory := AFunctionFactory;
end;

{ TFactoryByAlreadyBuilded }

function TFactoryByAlreadyBuilded.Build: IUnknown;
begin
  Result := FInstance;
end;

constructor TFactoryByAlreadyBuilded.Create(const AIID: TGUID; const AInstance: IUnknown);
begin
  SetIID(AIID);
  FInstance := AInstance;
end;

{ TFactories }

constructor TFactories.Create;
begin
  FCriticalSection := TCriticalSection.Create;
  FD2 := TSimpleInterfaceArray.Create(High(Word) + 1);
end;

destructor TFactories.Destroy;
begin
  FreeAndNil(FCriticalSection);
  inherited;
end;

function TFactories.Exist(const AIID: TGUID): Boolean;
begin
  Result := FindFactory(AIID) <> nil;
end;

function TFactories.FindFactory(const AIID: TGUID): IFactory;
var
  LInterfaceList: IInterfaceList;
  LFactory: IFactory;
  laco: Integer;
begin
  Result := nil;
  FCriticalSection.Acquire;
  try
    LInterfaceList := FD2[AIID.D2] as IInterfaceList;
    if LInterfaceList <> nil then
      for laco := 0 to LInterfaceList.Count - 1 do
      begin
        LFactory := LInterfaceList[laco] as IFactory;
        if (LFactory <> nil) and IsEqualIID(LFactory.IID, AIID) then
        begin
          Result := LFactory;
          Break;
        end;
      end;
  finally
    FCriticalSection.Release;
  end;
end;

function TFactories.GetFactory(const AIID: TGUID): IFactory;
begin
  Result := FindFactory(AIID);
  Assert(Result <> nil, 'Factory não encontrado');
end;

procedure TFactories.SetFactory(const AIID: TGUID; const Value: IFactory);
var
  LFactory: IFactory;
  LInterfaceList: IInterfaceList;
begin
  LFactory := FindFactory(AIID);
  FCriticalSection.Acquire;
  try
    if LFactory = nil then
    begin
      if Value <> nil then
      begin
        LInterfaceList := FD2[AIID.D2] as IInterfaceList;
        if LInterfaceList = nil then
        begin
          LInterfaceList := TInterfaceList.Create;
          FD2[AIID.D2] := LInterfaceList;
        end;
        LInterfaceList.Add(Value);
      end;
    end
    else
    begin
      LInterfaceList := FD2[AIID.D2] as IInterfaceList;
      if Value = nil then
      begin
        LInterfaceList.Remove(LFactory);
        if LInterfaceList.Count = 0 then
          FD2[AIID.D2] := nil;
      end
      else
        LInterfaceList[LInterfaceList.IndexOf(LFactory)] := Value;
    end;
  finally
    FCriticalSection.Release;
  end;
end;

{$IFDEF Test}
{ TSimpleFactories }

constructor TSimpleFactories.Create;
begin
  FFactoryList := TInterfaceList.Create;
end;

function TSimpleFactories.Exist(const AIID: TGUID): Boolean;
begin
  Result := FindFactory(AIID) <> nil;
end;

function TSimpleFactories.FindFactory(const AIID: TGUID): IFactory;
var
  LFactory: IFactory;
  laco: Integer;
begin
  for laco := 0 to FFactoryList.Count - 1 do
  begin
    LFactory := FFactoryList[laco] as IFactory;
    if (LFactory <> nil) and IsEqualIID(LFactory.IID, AIID) then
    begin
      Result := LFactory;
      Break;
    end;
  end;
end;

function TSimpleFactories.GetFactory(const AIID: TGUID): IFactory;
begin
  Result := FindFactory(AIID);
  Assert(Result <> nil, 'Factory não encontrado');
end;

procedure TSimpleFactories.SetFactory(const AIID: TGUID; const Value: IFactory);
var
  LFactory: IFactory;
begin
  LFactory := FindFactory(AIID);
  if LFactory = nil then
  begin
    if Value <> nil then
      FFactoryList.Add(Value);
  end
  else
  begin
    if Value = nil then
      FFactoryList.Remove(LFactory)
    else
      FFactoryList[FFactoryList.IndexOf(LFactory)] := Value;
  end;
end;
{$ENDIF}

{ TServiceLocator }

procedure TServiceLocator.Add(const IID: TGUID; ASLClass: TSLClass);
begin
  Assert(not Exist(IID));
  FFactories[IID] := TFactoryBySLClassCreate.Create(IID, ASLClass);
end;

procedure TServiceLocator.Add(const IID: TGUID; AFunctionFactory: TFunctionFactory);
begin
  Assert(not Exist(IID));
  FFactories[IID] := TFactoryByFunctionFactory.Create(IID, AFunctionFactory);
end;

procedure TServiceLocator.Add(const IID: TGUID; const AInstance: IUnknown);
begin
  Assert(not Exist(IID));
  FFactories[IID] := TFactoryByAlreadyBuilded.Create(IID, AInstance);
end;

{$IFDEF Test}
procedure TServiceLocator.AddForTest(const IID: TGUID; ASLClass: TSLClass);
begin
  Assert(Exist(IID));
  Assert(not FFactoriesTest.Exist(IID));
  FFactoriesTest[IID] := TFactoryBySLClassCreate.Create(IID, ASLClass);
end;
{$ENDIF}

{$IFDEF Test}
procedure TServiceLocator.AddForTest(const IID: TGUID; AFunctionFactory: TFunctionFactory);
begin
  Assert(Exist(IID));
  Assert(not FFactoriesTest.Exist(IID));
  FFactoriesTest[IID] := TFactoryByFunctionFactory.Create(IID, AFunctionFactory);
end;
{$ENDIF}

{$IFDEF Test}
procedure TServiceLocator.AddForTest(const IID: TGUID; const AInstance: IUnknown);
begin
  Assert(Exist(IID));
  Assert(not FFactoriesTest.Exist(IID));
  FFactoriesTest[IID] := TFactoryByAlreadyBuilded.Create(IID, AInstance);
end;
{$ENDIF}

constructor TServiceLocator.Create;
begin
  FFactories := TFactories.Create;
  {$IFDEF Test}
  RemoveAllForTests;
  {$ENDIF}
end;

function TServiceLocator.Exist(const IID: TGUID): Boolean;
begin
  Result := FFactories.Exist(IID);
end;

function TServiceLocator.Get(const IID: TGUID): IUnknown;
begin
  {$IFDEF Test}
  if FFactoriesTest.Exist(IID) then
    Result := FFactoriesTest[IID].Build
  else
  {$ENDIF}
    Result := FFactories[IID].Build;
end;

function TServiceLocator.QueryInterface(const IID: TGUID; out Obj): HResult;
var
  LFactory: IFactory;
  LUnknown: IUnknown;
begin
  {$IFDEF Test}
  if FFactoriesTest.Exist(IID) then
    LFactory := FFactoriesTest.FindFactory(IID)
  else
  {$ENDIF}
    LFactory := FFactories.FindFactory(IID);
  if IsEqualIID(IID, IServiceLocator) or (LFactory = nil) then
    Result := inherited QueryInterface(IID, Obj)
  else
  begin
    LUnknown := LFactory.Build;
    Result := LUnknown.QueryInterface(IID, Obj);
  end;
end;

procedure TServiceLocator.Remove(const IID: TGUID);
begin
  Assert(FFactories.Exist(IID), 'Não encontrado o Factory para remover');
  FFactories[IID] := nil;
end;

{$IFDEF Test}
procedure TServiceLocator.RemoveAllForTests;
begin
  FFactoriesTest := TSimpleFactories.Create;
end;
{$ENDIF}

initialization

  SL := TServiceLocator.Create;

finalization

  SL := nil;

end.
