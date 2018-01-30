{Alex - 18/04/2012 - chupado de http://code.google.com/p/extdirectdelphi/source/browse/trunk/StringBuilder.pas
e adaptado para rodar em Delphi 7}
unit StringBuilder;

interface

uses
  SysUtils;

type
  TCharArray = array of Char;

  TStringBuilder = class
  private
    function get_Capacity: Integer;
    procedure set_Capacity(Value: Integer);
    function get_Chars(Index: Integer): Char;
    procedure set_Chars(Index: Integer; Value: Char);
    function get_Length: Integer;
    procedure set_Length(Value: Integer);
    function get_MaxCapacity: Integer;

    procedure ExpandCapacity;
    procedure ReduceCapacity;

    procedure CheckBounds(Index: Integer);
    function _Replace(Index: Integer; const Old, New: string): Boolean;

  protected
    FData: TCharArray;
    FLength: Integer;
    FMaxCapacity: Integer;

  public
    constructor Create; overload;
    constructor Create(aCapacity: Integer); overload;
    constructor Create(const Value: string); overload;
    constructor Create(aCapacity: Integer; aMaxCapacity: Integer); overload;
    constructor Create(const Value: string; aCapacity: Integer); overload;
    constructor Create(const Value: string; StartIndex: Integer; Length: Integer; aCapacity: Integer); overload;

    function Append(const Value: Boolean): TStringBuilder; overload;
    function Append(const Value: Byte): TStringBuilder; overload;
    function Append(const Value: Char): TStringBuilder; overload;
    function Append(const Value: Currency): TStringBuilder; overload;
    function Append(const Value: Double): TStringBuilder; overload;
    function Append(const Value: Smallint): TStringBuilder; overload;
    function Append(const Value: Integer): TStringBuilder; overload;
    function Append(const Value: Int64): TStringBuilder; overload;
    function Append(const Value: TObject): TStringBuilder; overload;
    function Append(const Value: Shortint): TStringBuilder; overload;
    function Append(const Value: Single): TStringBuilder; overload;
    function Append(const Value: string): TStringBuilder; overload;
    function Append(const Value: UInt64): TStringBuilder; overload;
    function Append(const Value: TCharArray): TStringBuilder; overload;
    function Append(const Value: Word): TStringBuilder; overload;
    function Append(const Value: Cardinal): TStringBuilder; overload;
    function Append(const Value: Char; RepeatCount: Integer): TStringBuilder; overload;
    function Append(const Value: TCharArray; StartIndex: Integer; CharCount: Integer): TStringBuilder; overload;
    function Append(const Value: string; StartIndex: Integer; Count: Integer): TStringBuilder; overload;

    function AppendFormat(const Format: string; const Args: array of const): TStringBuilder; overload;
    function AppendLine: TStringBuilder; overload;
    function AppendLine(const Value: string): TStringBuilder; overload;

    procedure CopyTo(SourceIndex: Integer; const Destination: TCharArray; DestinationIndex: Integer; Count: Integer);
    function EnsureCapacity(aCapacity: Integer): Integer;
    function Equals(StringBuilder: TStringBuilder): Boolean; reintroduce;

    function Insert(Index: Integer; const Value: Boolean): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: Byte): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: Char): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: Currency): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: Double): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: Smallint): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: Integer): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: TCharArray): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: Int64): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: TObject): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: Shortint): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: Single): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: string): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: Word): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: Cardinal): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: UInt64): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: string; count: Integer): TStringBuilder; overload;
    function Insert(Index: Integer; const Value: TCharArray; startIndex: Integer; charCount: Integer): TStringBuilder; overload;

    function Remove(StartIndex: Integer; RemLength: Integer): TStringBuilder;

    function Replace(const OldChar: Char; const NewChar: Char): TStringBuilder; overload;
    function Replace(const OldValue: string; const NewValue: string): TStringBuilder; overload;
    function Replace(const OldChar: Char; const NewChar: Char; StartIndex: Integer; Count: Integer): TStringBuilder; overload;
    function Replace(const OldValue: string; const NewValue: string; StartIndex: Integer; Count: Integer): TStringBuilder; overload;

    function ToString: string; overload;
    function ToString(StartIndex: Integer; StrLength: Integer): string; reintroduce; overload;

    property Capacity: Integer read get_Capacity write set_Capacity;
    property Chars[index: Integer]: Char read get_Chars write set_Chars; default;
    property Length: Integer read get_Length write set_Length;
    property MaxCapacity: Integer read get_MaxCapacity;
  end;

const
  DefaultCapacity = $10;

resourcestring
  SListIndexError = 'List index out of bounds (%d)';
  SListCapacityError = 'List capacity out of bounds (%d)';

implementation


{ TStringBuilder }

function TStringBuilder.get_Length: Integer;
begin
  Result := FLength;
end;

function TStringBuilder.Append(const Value: UInt64): TStringBuilder;
begin
  Append(IntToStr(Value));
  Result := self;
end;

function TStringBuilder.Append(const Value: TCharArray): TStringBuilder;
var
  I: Integer;
begin
  Result := self;

  for I := 0 to System.Length(Value) - 1 do
    if Value[I] = #0 then
      Break;

  Append(Value, 0, I);
end;

function TStringBuilder.Append(const Value: Single): TStringBuilder;
begin
  Append(FloatToStr(Value));
  Result := self;
end;

function TStringBuilder.Append(const Value: string): TStringBuilder;
begin
  Length := Length + System.Length(Value);
  Move(PChar(Value)^, FData[Length - System.Length(Value)], System.Length(Value) * SizeOf(Char));
  Result := self;
end;

function TStringBuilder.Append(const Value: Word): TStringBuilder;
begin
  Append(IntToStr(Value));
  Result := self;
end;

function TStringBuilder.Append(const Value: TCharArray; StartIndex,
  CharCount: Integer): TStringBuilder;
begin
  if StartIndex + CharCount > System.Length(Value) then
    raise ERangeError.CreateResFmt(@SListIndexError, [StartIndex]);
  if StartIndex < 0 then
    raise ERangeError.CreateResFmt(@SListIndexError, [StartIndex]);

  Length := Length + CharCount;
  Move(Value[StartIndex], FData[Length - CharCount], CharCount * SizeOf(Char));
  Result := self;
end;

function TStringBuilder.Append(const Value: string; StartIndex,
  Count: Integer): TStringBuilder;
begin
  if StartIndex + Count > System.Length(Value) then
    raise ERangeError.CreateResFmt(@SListIndexError, [StartIndex]);
  if StartIndex < 0 then
    raise ERangeError.CreateResFmt(@SListIndexError, [StartIndex]);

  Length := Length + Count;
  Move(Value[StartIndex + 1], FData[Length - Count], Count * SizeOf(Char));
  Result := Self;
end;

function TStringBuilder.Append(const Value: Cardinal): TStringBuilder;
begin
  Append(IntToStr(Value));
  Result := self;
end;

function TStringBuilder.Append(const Value: Char;
  RepeatCount: Integer): TStringBuilder;
begin
  Append(System.StringOfChar(Value, RepeatCount));
  Result := Self;
end;

function TStringBuilder.Append(const Value: Shortint): TStringBuilder;
begin
  Append(IntToStr(Value));
  Result := Self;
end;

function TStringBuilder.Append(const Value: Char): TStringBuilder;
begin
  Length := Length + 1;
  FData[Length - 1] := Value;
  Result := Self;
end;

function TStringBuilder.Append(const Value: Currency): TStringBuilder;
begin
  Append(CurrToStr(Value));
  Result := Self;
end;

function TStringBuilder.Append(const Value: Boolean): TStringBuilder;
begin
  Append(BoolToStr(Value, True));
  Result := Self;
end;

function TStringBuilder.Append(const Value: Byte): TStringBuilder;
begin
  Append(IntToStr(Value));
  Result := Self;
end;

function TStringBuilder.Append(const Value: Double): TStringBuilder;
begin
  Append(FloatToStr(Value));
  Result := Self;
end;

function TStringBuilder.Append(const Value: Int64): TStringBuilder;
begin
  Append(IntToStr(Value));
  Result := Self;
end;

function TStringBuilder.Append(const Value: TObject): TStringBuilder;
begin
  Append(IntToStr(Integer(Value)));
  Result := Self;
end;

function TStringBuilder.Append(const Value: Smallint): TStringBuilder;
begin
  Append(IntToStr(Value));
  Result := Self;
end;

function TStringBuilder.Append(const Value: Integer): TStringBuilder;
begin
  Append(IntToStr(Value));
  Result := Self;
end;

function TStringBuilder.AppendFormat(const Format: string; const Args: array of const): TStringBuilder;
begin
  Append(SysUtils.Format(Format, Args));
  Result := Self;
end;

function TStringBuilder.AppendLine: TStringBuilder;
begin
  Append(sLineBreak);
  Result := Self;
end;

function TStringBuilder.AppendLine(const Value: string): TStringBuilder;
begin
  Append(Value);
  AppendLine;
  Result := Self;
end;

procedure TStringBuilder.CheckBounds(Index: Integer);
begin
  if Cardinal(Index) >= Cardinal(Length) then
    raise ERangeError.CreateResFmt(@SListIndexError, [Index]);
{  if (Index < 0) or (Index >= Length) then
    raise ERangeError.CreateRes(@SListIndexError, [Index]); }
end;

procedure TStringBuilder.CopyTo(SourceIndex: Integer;
  const Destination: TCharArray; DestinationIndex, Count: Integer);
begin
  CheckBounds(SourceIndex);
  CheckBounds(SourceIndex + Count - 1);

  Move(FData[SourceIndex], Destination[DestinationIndex], Count * SizeOf(Char));
end;

constructor TStringBuilder.Create;
begin
  inherited Create;
  FMaxCapacity := MaxInt;
  Capacity := DefaultCapacity;
  FLength := 0;
end;

constructor TStringBuilder.Create(const Value: string; aCapacity: Integer);
begin
  inherited Create;
  FMaxCapacity := MaxInt;
  Capacity := aCapacity;
  FLength := 0;
  Append(Value);
end;

constructor TStringBuilder.Create(const Value: string; StartIndex, length,
  aCapacity: Integer);
begin
  Create(copy(Value, StartIndex + 1, length), aCapacity);
end;

constructor TStringBuilder.Create(aCapacity, aMaxCapacity: Integer);
begin
  Create(aCapacity);
  FMaxCapacity := aMaxCapacity;
end;

constructor TStringBuilder.Create(aCapacity: Integer);
begin
  inherited Create;
  FMaxCapacity := MaxInt;
  Capacity := aCapacity;
  FLength := 0;
end;

constructor TStringBuilder.Create(const Value: string);
begin
  Create;
  Append(Value);
end;

function TStringBuilder.EnsureCapacity(aCapacity: Integer): Integer;
begin
  if Cardinal(aCapacity) > Cardinal(MaxCapacity) then
    raise ERangeError.CreateResFmt(@SListIndexError, [aCapacity]);

  if Capacity < aCapacity then
    Capacity := aCapacity;

  Result := Capacity;
end;

function TStringBuilder.Equals(StringBuilder: TStringBuilder): Boolean;
begin
  Result := (StringBuilder <> nil) and (Length = StringBuilder.Length) and
    (MaxCapacity = StringBuilder.MaxCapacity) and
    CompareMem(@FData[0], @StringBuilder.FData[0], Length * SizeOf(Char));
end;

procedure TStringBuilder.ExpandCapacity;
var
  NewCapacity: Integer;
begin
  NewCapacity := Capacity * 2;
  if Length > NewCapacity then
    NewCapacity := Length * 2;
  if NewCapacity > MaxCapacity then
    NewCapacity := MaxCapacity;
  Capacity := NewCapacity;
end;

function TStringBuilder.get_Capacity: Integer;
begin
  Result := System.Length(FData);
end;

function TStringBuilder.get_Chars(Index: Integer): Char;
begin
  CheckBounds(Index);

  Result := FData[Index];
end;

function TStringBuilder.get_MaxCapacity: Integer;
begin
  Result := FMaxCapacity;
end;

function TStringBuilder.Insert(Index: Integer; const Value: TObject): TStringBuilder;
begin
  Insert(Index, IntToStr(Integer(Value)));
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: Int64): TStringBuilder;
begin
  Insert(Index, IntToStr(Value));
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: Single): TStringBuilder;
begin
  Insert(Index, FloatToStr(Value));
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: string): TStringBuilder;
begin
  Length := Length + System.Length(Value);
  Move(FData[Index], FData[Index + System.Length(Value)], (Length - System.Length(Value) - Index) * SizeOf(Char));
  Move(Value[1], FData[Index], System.Length(Value) * SizeOf(Char));
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: Word): TStringBuilder;
begin
  Insert(Index, IntToStr(Value));
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: Shortint): TStringBuilder;
begin
  Insert(Index, IntToStr(Value));
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer;
  const Value: TCharArray): TStringBuilder;
begin
  Length := Length + System.Length(Value);
  Move(FData[Index], FData[Index + System.Length(Value)], System.Length(Value) * SizeOf(Char));
  Move(Value[0], FData[Index], System.Length(Value) * SizeOf(Char));
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: Currency): TStringBuilder;
begin
  Insert(Index, CurrToStr(Value));
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: Char): TStringBuilder;
begin
  Length := Length + 1;
  Move(FData[Index], FData[Index + 1], (Length - Index - 1) * SizeOf(Char));
  FData[Index] := Value;
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: Byte): TStringBuilder;
begin
  Insert(Index, IntToStr(Value));
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: Double): TStringBuilder;
begin
  Insert(Index, FloatToStr(Value));
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: Integer): TStringBuilder;
begin
  Insert(Index, IntToStr(Value));
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: Smallint): TStringBuilder;
begin
  Insert(Index, IntToStr(Value));
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: Boolean): TStringBuilder;
begin
  Insert(Index, BoolToStr(Value, True));
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: string;
  Count: Integer): TStringBuilder;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    Insert(Index, Value);
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: TCharArray; StartIndex,
  CharCount: Integer): TStringBuilder;
begin
  if Index - 1 >= Length then
    raise ERangeError.CreateResFmt(@SListIndexError, [Index])
  else if Index < 0 then
    raise ERangeError.CreateResFmt(@SListIndexError, [Index]);

  Length := Length + CharCount;

  if Length - Index > 0 then
    Move(FData[Index], FData[Index + CharCount], (Length - Index) * SizeOf(Char));
  Move(Value[StartIndex], FData[Index], CharCount * SizeOf(Char));
  Result := Self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: Cardinal): TStringBuilder;
begin
  Insert(Index, IntToStr(Value));
  Result := self;
end;

function TStringBuilder.Insert(Index: Integer; const Value: UInt64): TStringBuilder;
begin

  Insert(Index, IntToStr(Value));
  Result := self;
end;

procedure TStringBuilder.ReduceCapacity;
var
  NewCapacity: Integer;
begin
  if Length > Capacity div 4 then
    Exit;

  NewCapacity := Capacity div 2;
  if NewCapacity < Length then
    NewCapacity := Length;
  Capacity := NewCapacity;
end;

function TStringBuilder.Remove(StartIndex, RemLength: Integer): TStringBuilder;
begin
  CheckBounds(StartIndex);
  CheckBounds(StartIndex + RemLength - 1);

  if (Length - (StartIndex + RemLength)) > 0 then
    Move(FData[StartIndex + RemLength], FData[StartIndex], (Length - (StartIndex + RemLength)) * SizeOf(Char));
  Length := Length - RemLength;

  ReduceCapacity;
  Result := self;
end;

function TStringBuilder.Replace(const OldValue, NewValue: string; StartIndex,
  Count: Integer): TStringBuilder;
var
  CurPtr: PChar;
  EndPtr: PChar;
  Index: Integer;
  EndIndex: Integer;
  oldLen, newLen: Integer;
begin
  Result := self;

  oldLen := System.Length(OldValue);
  newLen := System.Length(NewValue);
  Index := StartIndex;
  CurPtr := @FData[StartIndex];
  EndIndex := StartIndex + Count - oldLen;
  EndPtr := @FData[EndIndex];

  while CurPtr <= EndPtr do
  begin
    if CurPtr^ = OldValue[1] then
    begin
      if StrLComp(CurPtr, PChar(OldValue), oldLen) = 0 then
      begin
        if _Replace(Index, OldValue, NewValue) then
        begin
          CurPtr := @FData[Index];
          EndPtr := @FData[EndIndex];
        end;
        Inc(CurPtr, newLen);
        Inc(Index, newLen);
        Inc(EndPtr, newLen - oldLen);
        Inc(EndIndex, newLen - oldLen);
      end;
    end;

    Inc(CurPtr);
    Inc(Index);
  end;
end;

function TStringBuilder.Replace(const OldChar, NewChar: Char; StartIndex,
  Count: Integer): TStringBuilder;
var
  Ptr: PChar;
  EndPtr: PChar;
begin
  CheckBounds(StartIndex);
  CheckBounds(StartIndex + Count - 1);

  EndPtr := @FData[StartIndex + Count - 1];
  Ptr := @FData[StartIndex];
  while Ptr <= EndPtr do
  begin
    if Ptr^ = OldChar then
      Ptr^ := NewChar;
    Inc(Ptr);
  end;
  Result := self;
end;

function TStringBuilder.Replace(const OldChar, NewChar: Char): TStringBuilder;
var
  Ptr: PChar;
  EndPtr: PChar;
begin
  EndPtr := @FData[Length - 1];
  Ptr := @FData[0];
  while Ptr <= EndPtr do
  begin
    if Ptr^ = OldChar then
      Ptr^ := NewChar;
    Inc(Ptr);
  end;
  Result := self;
end;

function TStringBuilder.Replace(const OldValue, NewValue: string): TStringBuilder;
begin
  Result := self;
  Replace(OldValue, NewValue, 0, Length);
end;

procedure TStringBuilder.set_Capacity(Value: Integer);
begin
  if Value < Length then
    raise ERangeError.CreateResFmt(@SListCapacityError, [Value]);
  if Value > FMaxCapacity then
    raise ERangeError.CreateResFmt(@SListCapacityError, [Value]);

  SetLength(FData, Value);
end;

procedure TStringBuilder.set_Chars(Index: Integer; Value: Char);
begin
  CheckBounds(Index);

  FData[Index] := Value;
end;

procedure TStringBuilder.set_Length(Value: Integer);
begin
  if Value > MaxCapacity then
    raise ERangeError.CreateResFmt(@SListCapacityError, [Value]);

  FLength := Value;
  if FLength > Capacity then
    ExpandCapacity;
end;

function TStringBuilder.ToString: string;
begin
  SetLength(Result, Length);
  Move(FData[0], Result[1], Length * SizeOf(Char));
end;

function TStringBuilder.ToString(StartIndex, StrLength: Integer): string;
begin
  CheckBounds(StartIndex);
  CheckBounds(StartIndex + StrLength - 1);

  SetLength(Result, StrLength);
  Move(FData[StartIndex], Result[1], StrLength * SizeOf(Char));
end;

function TStringBuilder._Replace(Index: Integer; const Old, New: string): Boolean;
var
  OldCapacity: Integer;
  SizeChange: Integer;
begin
  Result := False;
  SizeChange := System.Length(New) - System.Length(Old);

  if SizeChange = 0 then
  begin
    Move(New[1], FData[Index], System.Length(New) * SizeOf(Char));
  end
  else
  begin
    if SizeChange > 0 then
    begin
      OldCapacity := Capacity;
      Length := Length + SizeChange;
      if OldCapacity <> Capacity then
        Result := True;
    end;

    Move(FData[Index + System.Length(Old)], FData[Index + System.Length(New)], (Length - (System.Length(Old) + Index)) * SizeOf(Char));
    Move(New[1], FData[Index], System.Length(New) * SizeOf(Char));

    if SizeChange < 0 then
      Length := Length + SizeChange;
  end;
end;

end.

