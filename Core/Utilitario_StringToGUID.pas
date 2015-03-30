unit Utilitario_StringToGUID;

interface

uses
  SysUtils, Classes, SyncObjs;

type
  TStringToGUID = class(TObject)
  private
    FCriticalSection: TCriticalSection;
    FList: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const AString: string; const AGUID: TGUID);
    function Exists(const AString: string): Boolean;
    function GetGUID(const AString: string): TGUID;
  end;

implementation

type
  TObjectGUID = class(TObject)
  private
    FGUID: TGUID;
  public
    property GUID: TGUID read FGUID write FGUID;
    constructor Create(const AGUID: TGUID);
  end;

{ TObjectGUID }

constructor TObjectGUID.Create(const AGUID: TGUID);
begin
  FGUID := AGUID;
end;

{ TStringToGUID }

procedure TStringToGUID.Add(const AString: string; const AGUID: TGUID);
begin
  FCriticalSection.Acquire;
  try
    FList.AddObject(AString, TObjectGUID.Create(AGUID));
  finally
    FCriticalSection.Release;
  end;
end;

constructor TStringToGUID.Create;
begin
  FCriticalSection := TCriticalSection.Create;
  FList := TStringList.Create;
  FList.Sorted := True;
  FList.Duplicates := dupError;
end;

destructor TStringToGUID.Destroy;
var
  laco: Integer;
begin
  FCriticalSection.Acquire;
  try
    for laco := 0 to FList.Count - 1 do
      FList.Objects[laco].Free;
    FreeAndNil(FList);
  finally
    FCriticalSection.Release;
  end;
  FreeAndNil(FCriticalSection);
  inherited;
end;

function TStringToGUID.Exists(const AString: string): Boolean;
begin
  FCriticalSection.Acquire;
  try
     Result := FList.IndexOf(AString) >= 0;
  finally
    FCriticalSection.Release;
  end;
end;

function TStringToGUID.GetGUID(const AString: string): TGUID;
begin
  FCriticalSection.Acquire;
  try
    Result := (FList.Objects[FList.IndexOf(AString)] as TObjectGUID).GUID;
  finally
    FCriticalSection.Release;
  end;
end;

end.
