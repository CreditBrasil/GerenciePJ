unit SerasaHTTPS;

interface

uses
  Serasa{, IdHTTP, IdSSLOpenSSL};

type
  TSeHTTPS = class(TSeComunicacao)
  private
    FURLPrefix: string;
    //FHTTP: TIdHTTP;
  public
    constructor Create;
    destructor Destroy; override;
    function TamanhoMaximo: Integer; override;
    property URLPrefix: string read FURLPrefix write FURLPrefix;
    function Get(Se: string): string; override;
  end;

  TSeHTTPS_Post = class(TSeComunicacao)
  private
    FURL: string;
    //FHTTP: TIdHTTP;
  public
    constructor Create;
    destructor Destroy; override;
    function TamanhoMaximo: Integer; override;
    property URL: string read FURL write FURL;
    function Get(Se: string): string; override;
  end;

implementation

uses
  Classes, Windows, Forms, Controls, SysUtils{, IdURI};

{$R CurSERASA.RES}

const
  crSerasa = TCursor(10);

{ TSeHTTPS }

constructor TSeHTTPS.Create;
begin
  inherited;
  //FHTTP := TIdHTTP.Create(nil);
  //Suporte para SSL, necessário ssleay32.dll e libeay32.dll na pasta da aplicação
  //FHTTP.IOHandler := TIdSSLIOHandlerSocket.Create(FHTTP);
end;

destructor TSeHTTPS.Destroy;
begin
  //FHTTP.IOHandler.Free;
  //FHTTP.Free;
  inherited;
end;

function TSeHTTPS.Get(Se: string): string;
begin
  Screen.Cursor := crSerasa;
  try
    Result := inherited Get(Se);
    try
      //Result := FURLPrefix + TIdURI.ParamsEncode(Result);
      Result := Se;//FHTTP.Get(Result);
    except
      on e: Exception do
      begin
        e.Message := 'Erro na comunicação HTTPS com o SERASA:'#13#10 + e.Message;
        raise;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TSeHTTPS.TamanhoMaximo: Integer;
begin
  Result := 3900;
end;

{ TSeHTTPS_Post }

constructor TSeHTTPS_Post.Create;
begin
  inherited;
  //FHTTP := TIdHTTP.Create(nil);
  //Suporte para SSL, necessário ssleay32.dll e libeay32.dll na pasta da aplicação
  //FHTTP.IOHandler := TIdSSLIOHandlerSocket.Create(FHTTP);
end;

destructor TSeHTTPS_Post.Destroy;
begin
  //FHTTP.IOHandler.Free;
  //FHTTP.Free;
  inherited;
end;

function TSeHTTPS_Post.Get(Se: string): string;
var
  S: TStringList;
begin
  Screen.Cursor := crSerasa;
  S := TStringList.Create;
  try
    S.Values['p'] := inherited Get(Se);
    try
      Result := Se;//FHTTP.Post(FURL, S);
    except
      on e: Exception do
      begin
        e.Message := 'Erro na comunicação HTTPS com o SERASA:'#13#10 + e.Message;
        raise;
      end;
    end;
  finally
    S.Free;
    Screen.Cursor := crDefault;
  end;
end;

function TSeHTTPS_Post.TamanhoMaximo: Integer;
begin
  Result := 32768; //32 KBytes, limite imposto pela SERASA e nao pelo protocolo
end;

initialization

  Screen.Cursors[crSerasa] := LoadCursor(HInstance, 'CURSERASA');

end.
