unit csvstrings;

interface

uses
  SysUtils, Classes, Windows;

type
  TCSVStringList = class(TStringList)
  private
    FSeparador: Char;
    FLimitador: Char;
    FForcaLimitador: Boolean;
    function GetCSVText: String;
    procedure SetCSVText(const Value: String);
  public
    constructor Create;
    constructor CreateParams(ASeparador, ALimitador: Char;
      AForcaLimitador: Boolean);
    constructor CreateSQL(ALista: TStrings = nil);
    class function ListaSQL(ALista: TStrings): string;
    property CSVText: String read GetCSVText write SetCSVText;
    property Separador: Char read FSeparador write FSeparador;
    property Limitador: Char read FLimitador write FLimitador;
    property ForcaLimitador: Boolean read FForcaLimitador write FForcaLimitador;
  end;

implementation

{ TCSVStringList }

constructor TCSVStringList.Create;
begin
  inherited;
  FSeparador := ';';
  FLimitador := '"';
end;

constructor TCSVStringList.CreateParams(ASeparador, ALimitador: Char;
  AForcaLimitador: Boolean);
begin
  Create;
  FSeparador := ASeparador;
  FLimitador := ALimitador;
  FForcaLimitador := AForcaLimitador;
end;

constructor TCSVStringList.CreateSQL(ALista: TStrings);
begin
  CreateParams(',', '''', True);
  if Assigned(ALista) then
    AddStrings(ALista);
end;

function TCSVStringList.GetCSVText: String;
var
  S: string;
  P: PChar;
  I, Count: Integer;
begin
  Count := GetCount;
  if (Count = 1) and (Get(0) = '') then
    Result := AnsiQuotedStr('', FLimitador)
  else
  begin
    Result := '';
    for I := 0 to Count - 1 do
    begin
      S := Get(I);
      if FForcaLimitador then
        S := AnsiQuotedStr(S, FLimitador)
      else
      begin
        P := PChar(S);
        while not (P^ in [#0..' ', FLimitador, FSeparador]) do P := CharNext(P);
        if (P^ <> #0) then S := AnsiQuotedStr(S, FLimitador);
      end;
      Result := Result + S + FSeparador;
    end;
    System.Delete(Result, Length(Result), 1);
  end;
end;

class function TCSVStringList.ListaSQL(ALista: TStrings): string;
var
  csv: TCSVStringList;
begin
  csv := TCSVStringList.CreateSQL;
  try
    csv.AddStrings(ALista);
    Result := csv.CSVText;
  finally
    csv.Free;
  end;
end;

procedure TCSVStringList.SetCSVText(const Value: String);
var
  aux: String;
  TemLimitador: Boolean;
  p: Integer;
begin
  Clear;
  aux := Value;
  while Length(aux) > 0 do
  begin
    while (Length(aux) > 0) and (aux[1] in [#1..' ']) do
      System.Delete(aux, 1, 1);
    if Length(aux) = 0 then
      Break;
    TemLimitador := (aux[1] = Limitador);
    if TemLimitador then
      System.Delete(aux, 1, 1);
    if TemLimitador then
      p := Pos(Limitador, aux)
    else
      p := Pos(Separador, aux);
    if p = 0 then
      p := Length(aux) + 1;
    Add(Copy(aux, 1, p - 1));
    System.Delete(aux, 1, p);
    if TemLimitador then
    begin
      p := Pos(Separador, aux);
      if p <> 0 then
        System.Delete(aux, 1, p);
    end;
  end;
end;

end.
