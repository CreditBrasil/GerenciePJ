unit Utils;

interface

uses
  SysUtils, Windows;

function GetTempDirectory: String;

implementation

function GetTempDirectory: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

end.
 