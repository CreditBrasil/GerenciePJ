//Baseado no artigo http://dn.codegear.com/article/22576
//Definição de Singleton http://pt.wikipedia.org/wiki/Singleton
//Para utilizar herde a classe TSingleton e
//sobrescreva InitializePrivate e FinalizePrivate ao invés de Create e Destroy
unit uSingleton;

interface

uses
  SysUtils, uArrayIntf, uArrayClass, SyncObjs;

type
  TSingleton = class(TObject)
  protected
    procedure InitializePrivate; virtual;
    procedure FinalizePrivate; virtual;
  public
    procedure FreeInstance; override;
    class function NewInstance: TObject; override;
    class function RefCount: Integer;
  end;

implementation

type
  IInstanceSingleton = interface
    ['{850322DC-DA3B-43E7-BB98-412281F2A221}']
    function GetObject_: TObject;
    function GetRefCount: Integer;
    procedure SetObject_(Value: TObject);
    procedure SetRefCount(Value: Integer);

    property Object_: TObject read GetObject_ write SetObject_;
    property RefCount: Integer read GetRefCount write SetRefCount;
  end;

  IInstancesSingleton = interface
    ['{2C4025E6-A84E-4F48-B68F-A3E0D954C1BE}']
    function GetInstanceSingleton(AClass: TClass): IInstanceSingleton;

    property InstanceSingleton[AClass: TClass]: IInstanceSingleton
      read GetInstanceSingleton; default;
  end;

  TInstanceSingleton = class(TInterfacedObject, IInstanceSingleton)
  private
    FObject_: TObject;
    FRefCount: Integer;
  protected
    { IInstanceSingleton }
    function GetObject_: TObject;
    function GetRefCount: Integer;
    procedure SetObject_(Value: TObject);
    procedure SetRefCount(Value: Integer);
  public
    destructor Destroy; override;
  end;

  TInstancesSingleton = class(TInterfacedObject, IInstancesSingleton)
  private
    FArray: IInterfaceArray;
  protected
    { IInstancesSingleton }
    function GetInstanceSingleton(AClass: TClass): IInstanceSingleton;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TApplyFunctionFreeSingleton = class(TInterfacedObject, IApplyFunctionItemArray)
  protected
    { IApplyFunctionItemArray }
    procedure Apply(var AItem: IUnknown);
  end;

var
  InstancesSingleton: IInstancesSingleton;
  GCriticalSectionSingleton: TCriticalSection;

{ TSingleton }

procedure TSingleton.FinalizePrivate;
begin
  //Faz Nada
end;

procedure TSingleton.FreeInstance;
var
  LInstanceSingleton: IInstanceSingleton;
  LLibera: Boolean;
begin
  LLibera := False;
  GCriticalSectionSingleton.Acquire;
  try
    if InstancesSingleton <> nil then
    begin
      LInstanceSingleton := InstancesSingleton[Self.ClassType];
      LInstanceSingleton.RefCount := LInstanceSingleton.RefCount - 1;
      if LInstanceSingleton.RefCount = 0 then
      begin
        LInstanceSingleton.Object_ := nil;
        FinalizePrivate;
        LLibera := True;
      end;
    end
    else
      LLibera := True;
  finally
    GCriticalSectionSingleton.Release;
  end;
  if LLibera then
    inherited;
end;

procedure TSingleton.InitializePrivate;
begin
  //Faz Nada
end;

class function TSingleton.NewInstance: TObject;
var
  LInstanceSingleton: IInstanceSingleton;
begin
  GCriticalSectionSingleton.Acquire;
  try
    LInstanceSingleton := InstancesSingleton[Self];
    if LInstanceSingleton.Object_ = nil then
    begin
      Result := inherited NewInstance;
      LInstanceSingleton.Object_ := Result;
      (LInstanceSingleton.Object_ as TSingleton).InitializePrivate;
    end
    else
      Result := LInstanceSingleton.Object_;
    LInstanceSingleton.RefCount := LInstanceSingleton.RefCount + 1;
  finally
    GCriticalSectionSingleton.Release;
  end;
end;

class function TSingleton.RefCount: Integer;
begin
  Result := InstancesSingleton[Self].RefCount;
end;

{ TInstanceSingleton }

destructor TInstanceSingleton.Destroy;
begin
  FreeAndNil(FObject_);
  inherited;
end;

function TInstanceSingleton.GetObject_: TObject;
begin
  Result := FObject_;
end;

function TInstanceSingleton.GetRefCount: Integer;
begin
  Result := FRefCount;
end;

procedure TInstanceSingleton.SetObject_(Value: TObject);
begin
  FObject_ := Value;
end;

procedure TInstanceSingleton.SetRefCount(Value: Integer);
begin
  FRefCount := Value;
end;

{ TInstancesSingleton }

constructor TInstancesSingleton.Create;
begin
  FArray := TSparseInterfaceArray.Create(SIALarge);
end;

destructor TInstancesSingleton.Destroy;
begin
  FArray.ForAll(TApplyFunctionFreeSingleton.Create);
  inherited;
end;

function TInstancesSingleton.GetInstanceSingleton(
  AClass: TClass): IInstanceSingleton;
begin
  if FArray[Integer(AClass)] = nil then
  begin
    Result := TInstanceSingleton.Create;
    FArray[Integer(AClass)] := Result;
  end
  else
    Result := FArray[Integer(AClass)] as IInstanceSingleton;
end;

{ TApplyFunctionFreeSingleton }

procedure TApplyFunctionFreeSingleton.Apply(var AItem: IUnknown);
var
  LObject_: TObject;
begin
  LObject_ := (AItem as IInstanceSingleton).Object_;
  (AItem as IInstanceSingleton).Object_ := nil;
  LObject_.Free;
  AItem := nil;
end;

initialization

  GCriticalSectionSingleton := TCriticalSection.Create;
  InstancesSingleton := TInstancesSingleton.Create;

finalization

  InstancesSingleton := nil;
  FreeAndNil(GCriticalSectionSingleton);

end.
