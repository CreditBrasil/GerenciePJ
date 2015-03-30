unit SerasaLocal;

interface

uses
  Serasa;

type
  TSerasaLocal = class(TSeComunicacao)
  public
    function Get(Se: string): string; override;
    function TamanhoMaximo: Integer; override;
  end;

implementation

uses
  dialogs, classes, SysUtils;

{ TSerasaLocal }

function TSerasaLocal.Get(Se: string): string;
var
  S: TStringList;
begin
  with TOpenDialog.Create(nil) do
  try
    if Execute then
    begin
      S := TStringList.Create;
      try
        S.LoadFromFile(FileName);
        Result := {S.Text;} StringReplace(S.Text, #10, '#L', [rfReplaceAll]);
      finally
        S.Free;
      end;
    end;
  finally
    Free;
  end;
end;

function TSerasaLocal.TamanhoMaximo: Integer;
begin
  Result := 0;
end;

end.
