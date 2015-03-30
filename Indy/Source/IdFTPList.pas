unit IdFTPList;

{
 - Fixes as per user request for parsing non-detailed lists (SP).
   [Added flfNoDetails list format].

Initial version by
  D. Siders
  Integral Systems
  October 2000

Additions and extensions
  A Neillans

  Apr.2002
  - Fixed bug with MSDos Listing format - space in front of file names.

  Sep.2001 & Jan.2002
  - Merged changes submitted by Andrew P.Rybin

  Doychin Bondzhev (doychin@dsoft-bg.com)
  dSoft-Bulgaria

  February 2001
  - TFTPListItem now descends from TCollectionItem
  - TFTPList now descends from TCollection
  Jun 2001
  - Fixes in UNIX format parser
  Aug 2001
  - It is now used in the FTP server component
}

interface

uses
  Classes, SysUtils, IdException, IdGlobal;

{ Indy TIdFtp extensions to support automatic parsing of FTP directory listings }

type
  EIdInvalidFTPListingFormat = class(EIdException);

  // TFTPListFormat directory listing format.  flfNone, flfUnknown, flfCustom are not parsed
  TIdFTPListFormat = (flfNone, flfDos, flfUnix, flfVax, flfNoDetails, flfUnknown, flfCustom);
  TIdDirItemType = (ditDirectory, ditFile, ditSymbolicLink);

  TIdFTPListItems = class;

  // TIdFTPListItem stores an item in the FTP directory listing
  TIdFTPListItem = class(TCollectionItem)
  protected
    FSize: Int64;
    FItemCount: Integer;
    FData: string;
    FFileName: string;
    FGroupPermissions: string;
    FGroupName: string;
    FOwnerPermissions: string;
    FOwnerName: string;
    FUserPermissions: string;
    FModifiedDate: TDateTime;
    FLinkedItemName : string;
    FItemType: TIdDirItemType;
    //
    function DoGetCustomListFormat: string;
  public
    procedure Assign(Source: TPersistent); override;
    constructor Create(AOwner: TCollection); override;
    function Text: string;
    //
    property Data: string read FData write FData;
    property OwnerPermissions: string read FOwnerPermissions write FOwnerPermissions;
    property GroupPermissions: string read FGroupPermissions write FGroupPermissions;
    property UserPermissions: string read FUserPermissions write FUserPermissions;
    property ItemCount: Integer read FItemCount write FItemCount;
    property OwnerName: string read FOwnerName write FOwnerName;
    property GroupName: string read FGroupName write FGroupName;
    property Size: Int64 read FSize write FSize;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property FileName: string read FFileName write FFileName;
    property ItemType: TIdDirItemType read FItemType write FItemType;
    property LinkedItemName: string read FLinkedItemName write FLinkedItemName;
  end;

  TIdOnGetCustomListFormat = procedure(AItem: TIdFTPListItem; var VText: string) of object;
  TIdOnParseCustomListFormat = procedure(AItem: TIdFTPListItem) of object;

  // TFTPList is the container and parser for items in the directory listing
  TIdFTPListItems = class(TCollection)
  protected
    FDirectoryName: string;
    //
    procedure SetDirectoryName(const AValue: string);
  protected
    FOnGetCustomListFormat: TIdOnGetCustomListFormat;
    FOnParseCustomListFormat: TIdOnParseCustomListFormat;
    FListFormat: TIdFTPListFormat;
    //
    function GetItems(AIndex: Integer): TIdFTPListItem;
    procedure ParseDOS(AItem: TIdFTPListItem);
    procedure ParseUnix(AItem: TIdFTPListItem); //APR
    procedure ParseVax(AItem: TIdFTPListItem);
    procedure SetItems(AIndex: Integer; const Value: TIdFTPListItem);
  public
    function Add: TIdFTPListItem;
    function CheckListFormat(Data: string; const ADetails: Boolean = False): TIdFTPListFormat; virtual;
    constructor Create; overload;
    function IndexOf(AItem: TIdFTPListItem): Integer;
    procedure LoadList(AData: TStrings);
    procedure Parse(ListFormat: TIdFTPListFormat; AItem: TIdFTPListItem);
    procedure ParseUnknown(AItem: TIdFTPListItem);
    procedure ParseCustom(AItem: TIdFTPListItem); virtual;
    //
    property DirectoryName: string read FDirectoryName write SetDirectoryName;
    property Items[AIndex: Integer]: TIdFTPListItem read GetItems write SetItems; default;
    property ListFormat: TIdFTPListFormat read FListFormat write FListFormat;
    property OnGetCustomListFormat: TIdOnGetCustomListFormat read FOnGetCustomListFormat
     write FOnGetCustomListFormat;
    property OnParseCustomListFormat: TIdOnParseCustomListFormat read FOnParseCustomListFormat
     write FOnParseCustomListFormat;
  end;

implementation
Uses IdResourceStrings, IdStrings;

{ TFTPListItem }

constructor TIdFTPListItem.Create(AOwner: TCollection);
begin
  inherited Create(AOwner);
  Data := '';    {Do not Localize}
  FItemType := ditFile;
  OwnerPermissions := '???';    {Do not Localize}
  GroupPermissions := '???';    {Do not Localize}
  UserPermissions := '???';    {Do not Localize}
  ItemCount := 0;
  OwnerName := '????????';    {Do not Localize}
  GroupName := '????????';    {Do not Localize}
  Size := 0;
  ModifiedDate := 0.0;
  FileName := '';    {Do not Localize}
  LinkedItemName := '';    {Do not Localize}
end;

procedure TIdFTPListItem.Assign(Source: TPersistent);
Var
  Item: TIdFTPListItem;
begin
  Item := TIdFTPListItem(Source);
  Data := Item.Data;
  ItemType := Item.ItemType;
  OwnerPermissions := Item.OwnerPermissions;
  GroupPermissions := Item.GroupPermissions;
  UserPermissions := Item.UserPermissions;
  ItemCount := Item.ItemCount;
  OwnerName := Item.OwnerName;
  GroupName := Item.GroupName;
  Size := Item.Size;
  ModifiedDate := Item.ModifiedDate;
  FileName := Item.FileName;
  LinkedItemName := Item.LinkedItemName;
end;

{ TFTPList }

constructor TIdFTPListItems.Create;
begin
  inherited Create(TIdFTPListItem);
  ListFormat := flfUnix;
end;

function TIdFTPListItems.Add: TIdFTPListItem;
begin
  Result := TIdFTPListItem(inherited Add);
end;

procedure TIdFTPListItems.LoadList(AData: TStrings);
var
  iCtr: Integer;
  LStartLine: Integer;
  AItem: TIdFTPListItem;
begin
  Clear;
  // Some Unix ftp servers retunr 'total' in the first line of the directory listing    {Do not Localize}
  if (FListFormat = flfUnix) and (AData.Count > 0) and
    (IndyPos('TOTAL', UpperCase(AData.Strings[0])) = 1) then begin    {Do not Localize}
    LStartLine := 1;
  end
  else begin
    LStartLine := 0;
  end;
  for iCtr := LStartLine to AData.Count - 1 do begin
    if NOT IsWhiteString(AData.Strings[iCtr]) then begin
      AItem := Add;
      AItem.Data := AData.Strings[iCtr];
      try
        if (ListFormat <> flfNone) then begin
          Parse(ListFormat, AItem);
        end;
      except
        {on E: Exception do
          raise EIdException.Create('Please report this exception into Indy Bug list.' + #13 +
            E.Message + #13 + AItem.Data);}
         // When We don't know the exact listing type we will just ignore it and nothing will happen    
         Clear;
      end;
    end;
  end;//for
end;

function TIdFTPListItems.CheckListFormat(Data: string; const ADetails: Boolean = false): TIdFTPListFormat;
  function IsUnixItem(SData: string): Boolean;
  begin
    result := (SData[1] in ['L', 'D', '-']) and    {Do not Localize}
    (SData[2] in ['T','S','R','W','X','-']) and    {Do not Localize}
    (SData[3] in ['T','S','R','W','X','-']) and    {Do not Localize}
    (SData[4] in ['T','S','R','W','X','-']) and    {Do not Localize}
    (SData[5] in ['T','S','R','W','X','-']) and    {Do not Localize}
    (SData[6] in ['T','S','R','W','X','-']) and    {Do not Localize}
    (SData[7] in ['T','S','R','W','X','-']) and    {Do not Localize}
    (SData[8] in ['T','S','R','W','X','-','A']) and    {Do not Localize}
    {VxWorks 5.3.1 FTP Server has a quirk where a "A" is in the permissions
    See:
http://groups.google.com/groups?hl=en&lr=&ie=UTF-8&oe=utf-8&threadm=slrn73rfie.
1g2.chc%40nasa2.ksc.nasa.gov&rnum=1&prev=/groups%3Fq%3DVxWorks%2BFTP%2BLIST%2
Bformat%2Bdate%26hl%3Den%26lr%3D%26ie%3DUTF-8%26oe%3Dutf-8%26selm%3D
slrn73rfie.1g2.chc%2540nasa2.ksc.nasa.gov%26rnum%3D1

}
    (SData[9] in ['T','S','R','W','X','-']) and    {Do not Localize}
    (SData[10] in ['T','S','R','W','X','-']);    {Do not Localize}
  end;

var
  sData: string;
  sDir: string;
  sSize: string;
begin
  Result := flfUnknown;
  if ADetails then
  begin
    SData := UpperCase(Data);

    if IsUnixItem(SData) or (Pos('TOTAL', SData) = 1) then    {Do not Localize}
    begin
      Result := flfUnix;
    end
    else
    begin
      if (IndyPos('DSK:', SData) <> 0) then    {Do not Localize}
      begin
        Result := flfVax;
      end
      else
      begin
        sDir := Trim(Copy(SData, 25, 6));
        sSize := StringReplace(Trim(Copy(SData, 31, 8)), ',', '', [rfReplaceAll]);    {Do not Localize}

        if ((SData[3] in ['/', '-']) and (SData[6] in ['/', '-'])) and ((sDir = '<DIR>') or ((sDir = '') and    {Do not Localize}
            (StrToInt64Def(sSize, -1) <> -1))) then
        begin
          Result := flfDos;
        end;
      end;
    end;
  end
  else
  begin
    Result := flfNoDetails;
  end;
end;

function TIdFTPListItems.GetItems(AIndex: Integer): TIdFTPListItem;
begin
  Result := TIdFTPListItem(inherited Items[AIndex]);
end;

function TIdFTPListItems.IndexOf(AItem: TIdFTPListItem): Integer;
Var
  i: Integer;
begin
  result := -1;
  for i := 0 to Count - 1 do 
    if AItem = Items[i] then begin
      result := i;
      break;
    end;
end;

procedure TIdFTPListItems.Parse(ListFormat: TIdFTPListFormat; AItem: TIdFTPListItem);
begin
  case ListFormat of
    //flfNone - Data unchanged
    flfDos: ParseDos(AItem);
    flfUnix: ParseUnix(AItem);
    flfVax: ParseVax(AItem);
    flfNoDetails: AItem.FileName := Trim(AItem.Data);
    flfCustom: ParseCustom(AItem);
    flfUnknown: ParseUnknown(AItem);
  end;
end;

procedure TIdFTPListItems.ParseDOS(AItem: TIdFTPListItem);
var
  LModified: string;
  LTime: string;
  LDir: string;
  LSize: string;
  LName: string;
  LValue: string;
  LBuffer: string;
  LPosMarker : Integer;

  function Y2Year(const AYear : Integer): Integer;
{
This function ensures that 2 digit dates returned
by some FTP servers are interpretted just like Borland's year
handling routines.
}
    function CurrentYear : Integer;
    var LYear, LMonth, LDay : Word;
    begin
      DecodeDate(Now,LYear,LMonth,LDay);
      Result := LYear;
    end;

  begin
    Result := AYear;
    //Y2K Complience for current code
    if (Result < 100) then
    begin
      if TwoDigitYearCenturyWindow > 0 then
      begin
        if Result > TwoDigitYearCenturyWindow then
        begin
          Result := Result + (((CurrentYear div 100)-1)*100);
        end
        else
        begin
          Result := Result + ((CurrentYear div 100)*100);
        end;
      end
      else
      begin
        Result := Result + ((CurrentYear div 100)*100);
      end;
    end;
  end;

  function FindDelim(const AData : String) : String;
  var i : Integer;
  begin
    Result := '';
    for i := 1 to Length(AData) do
    begin
      if (IdGlobal.IsNumeric(AData[i])=False) then
      begin
        Result := AData[i];
        Break;
      end;
    end;
  end;

  function DateMMDDYY(const AData: String): TDateTime;
  var LMonth, LDay, LYear : Integer;
    LBuffer : String;
    LDelim : String;

  begin
    LBuffer := AData;
    LDelim := FindDelim(AData);
    LMonth := StrToIntDef(Trim(Fetch(LBuffer,LDelim)),0);
    LDay := StrToIntDef(Trim(Fetch(LBuffer,LDelim)),0);
    LYear := StrToIntDef(Trim(Fetch(LBuffer,LDelim)),0);
    LYear := Y2Year(LYear);
    Result := EncodeDate(LYear,LMonth,LDay);
  end;

  function TimeHHMMSS(const AData : String):TDateTime;
  var LCHour, LCMin, LCSec, LCMSec : Word;
    LHour, LMin, LSec, LMSec : Word;
    LBuffer : String;
    LPM : Boolean;
  begin
    LPM := False;
    LBuffer := UpperCase(AData);
    LBuffer := Fetch(LBuffer,'AM');
    if (IndyPos('PM',LBuffer)>0) then
    begin
      LPM := True;
      LBuffer := Fetch(LBuffer,'PM');
    end;
    LBuffer := Trim(LBuffer);
    DecodeTime(Now,LCHour,LCMin,LCSec,LCMSec);
    LHour :=  StrToIntDef( Fetch(LBuffer,':'),LCHour);
    LMin := StrToIntDef( Fetch(LBuffer,':'),LCMin);
    if LPM then
    begin
      //in the 12 hour format, afternoon is 12:00PM followed by 1:00PM
      //while midnight is written as 12:00 AM
    //Not exactly technically correct but fairly accurate
      if LHour < 12 then
      begin
        LHour := LHour + 12;
      end;
    end;
    LSec := StrToIntDef( Fetch(LBuffer,':'),0);
    LMSec := StrToIntDef( Fetch(LBuffer,':'),0);
    Result := EncodeTime(LHour,LMin,LSec,LMSec);
  end;

begin
  LModified := Copy(AItem.Data, 1, 2) + '/' + Copy(AItem.Data, 4, 2) + '/' +    {Do not Localize}
    Copy(AItem.Data, 7, 2) + ' ';    {Do not Localize}

  LBuffer := Trim(Copy(AItem.Data, 9, Length(AItem.Data)));

  // Scan time info
  LTime := Fetch(LBuffer);

  // Scan optional letter in a[m]/p[m]
  LModified := LModified + LTime;

  LBuffer := Trim(LBuffer);

  LDir := '';    {Do not Localize}
  LSize := '';    {Do not Localize}

  // Scan file size or dir marker
  LValue := Fetch(LBuffer);

  // Strip commas or StrToInt64Def will barf
  if (IndyPos(',', LValue) <> 0) then    {Do not Localize}
    LValue := StringReplace(LValue, ',', '', [rfReplaceAll]);    {Do not Localize}

  // What did we get?
  if (UpperCase(LValue) = '<DIR>') then    {Do not Localize}
    LDir := '<DIR>'    {Do not Localize}
  else
    LSize := LValue;

  if LDir = '<DIR>' then begin    {Do not Localize}
    AItem.ItemType := ditDirectory;
  end else begin
    AItem.ItemType := ditFile;
  end;

  //We do things this way because a space starting a file name is legel
  LPosMarker := IndyPos(LValue,AItem.Data) +Length(LValue);
  if (AItem.ItemType = ditDirectory) then
  begin
    LPosMarker := LPosMarker + 10;
  end
  else
  begin
    LPosMarker := LPosMarker + 1;
  end;

  // Rest of the buffer is item name
  LName := TrimRight( Copy(AItem.Data,LPosMarker,Length(AItem.Data )));

  AItem.Size := StrToInt64Def(LSize, 0);
  AItem.FileName := LName;

  // Convert modified to date time
  try

    AItem.ModifiedDate := DateMMDDYY(Fetch(LModified));
    AItem.ModifiedDate := AItem.ModifiedDate + TimeHHMMSS(LModified);
  except
    AItem.ModifiedDate := 0.0;
  end;
end;

procedure TIdFTPListItems.ParseUnix(AItem: TIdFTPListItem);
type
  TParseUnixSteps = (pusPerm,pusCount,pusOwner,pusGroup,pusSize,pusMonth,pusDay,pusYear,pusTime,pusName,pusDone);
var
  LStep: TParseUnixSteps;
  LData, LTmp: String;
  LDir, LGPerm, LOPerm, LUPerm, LCount, LOwner, LGroup: String;
  LName, LSize, LLinkTo: String;
  wYear, LCurrentMonth, wMonth, wDay: Word;
  wHour, wMin, wSec, wMSec: Word;
  ADate: TDateTime;
  i: Integer;
Begin
  // Get defaults for modified date/time
  ADate := Now;
  DecodeDate(ADate, wYear, wMonth, wDay);
  DecodeTime(ADate, wHour, wMin, wSec, wMSec);
  LCurrentMonth := wMonth;
  LData := AItem.Data;
  LStep := pusPerm;

  while NOT (LStep = pusDone) do begin
    case LStep of
    pusPerm: begin//1.-rw-rw-rw-
      LTmp := Fetch(LData);
      LData := TrimLeft(LData);
      // Copy the predictable pieces
      LDir := UpperCase(Copy(LTmp, 1, 1));
      LOPerm := Copy(LTmp, 2, 3);
      LGPerm := Copy(LTmp, 5, 3);
      LUPerm := Copy(LTmp, 8, 3);
      LStep := pusCount;
    end;

    pusCount: begin
      LTmp := Fetch(LData);
      LData := TrimLeft(LData);

      //Patch for NetPresenz
      // "-------r--         326  1391972  1392298 Nov 22  1995 MegaPhone.sit" */
      // "drwxrwxr-x               folder        2 May 10  1996 network" */
      if AnsiSameText(LTmp,'folder') then begin
        LStep := pusSize;
   //     LStep := pusMonth;
      end
      else begin
        LCount := LTmp;
        LStep := pusOwner;
      end;
    end;

    pusOwner: begin
      LTmp := Fetch(LData);
      LData := TrimLeft(LData);
      LOwner := LTmp;
(*    if (SL[4] > '') and    {Do not Localize}
     //Ericsson Switch FTP returns empty owner.
     (SL[4][1] in ['A'..'Z','a'..'z']) then begin    {Do not Localize}
      SL.Insert(2, '');    {Do not Localize}
    end; *)
      LStep := pusGroup;
    end;

    pusGroup: begin
      LTmp := Fetch(LData);
      LData := TrimLeft(LData);
      LGroup := LTmp;
      LStep := pusSize;
    end;

    pusSize: begin
      //Ericsson Switch FTP returns empty owner
      if (LData>'') and (LData[1] in ['A'..'Z','a'..'z']) then begin
        LSize := LGroup;
        LGroup := LOwner;
        LOwner := '';
      end
      else begin
        LTmp := Fetch(LData);
        LData := TrimLeft(LData);
        LSize := LTmp;
      end;
      LStep := pusMonth;
    end;

    pusMonth: begin // Scan modified MMM
      LTmp := Fetch(LData);
      LData := TrimLeft(LData);
      wMonth := StrToMonth(LTmp);
      LStep := pusDay;
    end;

    pusDay: begin // Scan DD
      LTmp := Fetch(LData);
      LData := TrimLeft(LData);
      wDay := StrToIntDef(LTmp, wDay);
      LStep := pusYear;
    end;

    pusYear: begin
      LTmp := Fetch(LData);

    //
      // Not time info, scan year
      if IndyPos(':', LTmp) = 0 then begin    {Do not Localize}
        wYear := StrToIntDef(LTmp, wYear);

        // Set time info to 00:00:00.999
        wHour := 0;
        wMin := 0;
        wSec := 0;
        wMSec := 999;
     //   System.Delete(LData,1,1);
        LStep := pusName;
      end//if IndyPos(':', SL[7])=0    {Do not Localize}
      else begin // Time info, scan hour, min
    //    LData := TrimLeft(LData);
        LStep := pusTime;
      end;
    end;

    pusTime: begin
      // correct year and Scan hour
      if LCurrentMonth < wMonth then begin
        wYear := wYear - 1;
      end;
      wHour:= StrToIntDef(Fetch(LTmp,':'), 0);    {Do not Localize}
      // Scan minutes
      wMin := StrToIntDef(LTmp, 0);

      // Set sec and ms to 0.999
      wSec := 0;
      wMSec := 999;
      LStep := pusName;
    end;

    pusName: begin
      LName := LData;
      LStep := pusDone;
    end;
    end;//case LStep
  end;//while

    if LDir = 'D' then begin    {Do not Localize}
      AItem.ItemType := ditDirectory;
    end else if LDir = 'L' then begin    {Do not Localize}
      AItem.ItemType := ditSymbolicLink;
    end else begin
      AItem.ItemType := ditFile;
    end;
    AItem.OwnerPermissions := LOPerm;
    AItem.GroupPermissions := LGPerm;
    AItem.UserPermissions := LUPerm;

    AItem.ItemCount := StrToIntDef(LCount, 0);

    AItem.OwnerName := LOwner;
    AItem.GroupName := LGroup;
    AItem.Size := StrToInt64Def(LSize, 0);
    AItem.ModifiedDate := EncodeDate(wYear, wMonth, wDay) + EncodeTime(wHour, wMin, wSec, wMSec);

    if AItem.ItemType = ditSymbolicLink then begin
      i := IndyPos(' -> ', LName);    {Do not Localize}
      LLinkTo := Copy(LName, i + 4, Length(LName) - i - 3);
      LName := Copy(LName, 1, i - 1);
      AItem.LinkedItemName := LLinkTo;
    end;
    AItem.FileName:= LName;
End;//ParseUnix

procedure TIdFTPListItems.ParseVax(AItem: TIdFTPListItem);
begin
  // TODO: determine special characteristics for VAX other than disk prefix
  ParseUnix(AItem);
end;

procedure TIdFTPListItems.ParseUnknown(AItem: TIdFTPListItem);
begin
  raise EIdInvalidFTPListingFormat.Create(RSInvalidFTPListingFormat);
end;

procedure TIdFTPListItems.ParseCustom(AItem: TIdFTPListItem);
begin
  if Assigned(FOnParseCustomListFormat) then begin
    FOnParseCustomListFormat(AItem);
  end else begin
    raise EIdInvalidFTPListingFormat.Create(RSInvalidFTPListingFormat);
  end;
end;

procedure TIdFTPListItems.SetItems(AIndex: Integer; const Value: TIdFTPListItem);
begin
  inherited Items[AIndex] := Value;
end;

procedure TIdFTPListItems.SetDirectoryName(const AValue: string);
begin
  if not AnsiSameText(FDirectoryName, AValue) then begin
    FDirectoryName := AValue;
    Clear;
  end;
end;

function TIdFTPListItem.Text: string;
var
  LSize, LTime: string;
  l, month: Word;
begin
  case TIdFTPListItems(Collection).FListFormat of
    flfNone: Result := Data;
    flfNoDetails: Result := FileName;
    //flfUnknown: - No handler
    flfCustom: Result := DoGetCustomListFormat;
    flfDos: begin
      if ItemType = ditDirectory then begin
        LSize := '      ' + '<DIR>' + StringOfChar(' ', 9);    {Do not Localize}
      end else begin
        LSize := StringOfChar(' ', 20 - Length(IntToStr(Size))) + IntToStr(Size);    {Do not Localize}
      end;
      Result := FormatDateTime('mm-dd-yy  hh:mma/p', ModifiedDate) + ' ' + LSize    {Do not Localize}
       + '  ' + FileName;    {Do not Localize}
    end;
    flfUnix, flfVax: begin
      LSize := '-';    {Do not Localize}
      case ItemType of
        ditDirectory: begin
          Size := 512;
          LSize := 'd';    {Do not Localize}
        end;
        ditSymbolicLink: LSize := 'l';    {Do not Localize}
      end;
      LSize := LSize + Format('%3:3s%4:3s%5:3s   1 %1:8s %2:8s %0:8d'    {Do not Localize}
       , [Size, OwnerName, GroupName, OwnerPermissions, GroupPermissions, UserPermissions]);
      DecodeDate(ModifiedDate, l, month, l);
      LTime := MonthNames[month] + FormatDateTime(' dd', ModifiedDate);    {Do not Localize}
      if FormatDateTime('yy', ModifiedDate) = FormatDateTime('yy', Now) then begin    {Do not Localize}
        LTime := LTime + FormatDateTime(' hh:mm', ModifiedDate);    {Do not Localize}
      end else begin
        LTime := LTime + FormatDateTime(' yyyy ', ModifiedDate);    {Do not Localize}
      end;
      // A.Neillans, 20 Apr 2002, Fixed glitch, extra space in front of names.
      //      Result := LSize + ' ' + LTime + '  ' + FileName;    {Do not Localize}
      Result := LSize + ' ' + LTime + ' ' + FileName;    {Do not Localize}
    end;
  end;
end;

function TIdFTPListItem.DoGetCustomListFormat: string;
begin
  Result := '';    {Do not Localize}
  if Assigned(TIdFTPListItems(Collection).OnGetCustomListFormat) then begin
    TIdFTPListItems(Collection).OnGetCustomListFormat(Self, Result);
  end;
end;

end.
