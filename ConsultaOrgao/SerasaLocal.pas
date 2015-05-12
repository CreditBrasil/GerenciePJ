unit SerasaLocal;

interface

uses
  Forms, Windows, ShellApi, SysUtils, Serasa, uDialogos;

type
  TSerasaLocal = class(TSeComunicacao)
  public
    function Get(Se: string): string; override;
    function TamanhoMaximo: Integer; override;
  end;

implementation

uses
  dialogs, classes;

{ TSerasaLocal }

function TSerasaLocal.Get(Se: string): string;

  procedure MudaArquivoDeLugar(AArquivo: string);
  var
    aux: string;
    Dados: TSHFileOpStruct;
    Fonte: array[0..1023] of char;
    ADestino: array[0..255] of char;
  begin
    aux := ExtractFilePath(AArquivo);
    FillChar(Dados, SizeOf(Dados), 0);
    FillChar(Fonte, SizeOf(Fonte), 0);
    FillChar(ADestino, SizeOf(ADestino), 0);
    with Dados do
    begin
      wnd := Application.Handle;
      wFunc := FO_MOVE;
      StrPCopy(Fonte, AArquivo);
      pFrom := Fonte;
      StrPCopy(ADestino, aux + FormatDateTime('YYYY-MM', Date) + '\' + ExtractFileName(AArquivo));
      pTo := ADestino;
      fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION or FOF_NOCONFIRMMKDIR;
      lpszProgressTitle := 'Movendo arquivo';
    end;
    if SHFileOperation(Dados) <> 0 then
      TDialogo.Fatal('Não foi possível', ['Não foi possível mover o arquivo',
        'para a subpasta "Ano-Mês".']);
  end;
  
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
        Result := StringReplace(S.Text, #13#10, '#L', [rfReplaceAll]);
      finally
        S.Free;
      end;
      MudaArquivoDeLugar(FileName);
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
