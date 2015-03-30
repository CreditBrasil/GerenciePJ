unit MVC_Recurso;

interface

uses
  SysUtils, Classes, Windows, DateUtils;

type
  TRecurso = record
    Nome, Tipo: string;
  end;

  TRecursoMimeType = record
    Tipo, Mime: string;
  end;

  TRecursoAplicacao = class(TObject)
  private
    FModule: HMODULE;
  protected
    property Module: HMODULE read FModule write FModule;
  public
    constructor Create;
    function CreateStreamRecurso(const ARecurso: string): TStream;
    function Mime(const ARecurso: string): string;
    class function Recurso(const ARecurso: string): TRecurso;
    function TemRecurso(const ARecurso: string): Boolean;
  end;

  TTema = class(TRecursoAplicacao)
  public
    constructor Create(const ANomeDLL: string);
    destructor Destroy; override;
  end;

  TRecursoModelo = class(TObject)
  private
    FMimeType: string;
    FContent: TStream;
  public
    property MimeType: string read FMimeType write FMimeType;
    property Content: TStream read FContent write FContent;
  end;

const
  RecursoMimeType: array [0..9] of TRecursoMimeType = (
    (Tipo: 'HTML'; Mime: 'text/html'),
    (Tipo: 'CSS'; Mime: 'text/css'),
    (Tipo: 'GIF'; Mime: 'image/gif'),
    (Tipo: 'PNG'; Mime: 'image/png'),
    (Tipo: 'ICO'; Mime: 'image/vnd.microsoft.icon'),
    (Tipo: 'JS'; Mime: 'application/javascript'),
    (Tipo: 'EOT'; Mime: 'application/vnd.ms-fontobject'),
    (Tipo: 'SVG'; Mime: 'image/svg+xml'),
    (Tipo: 'TTF'; Mime: 'application/octet-stream'),
    (Tipo: 'WOFF'; Mime: 'application/font-woff')
    );

var
  RecursoAplicacao: TRecursoAplicacao;
  Tema: TTema;
  GDataHoraDosRecursos: TDateTime;

implementation

{ TRecursoAplicacao }

constructor TRecursoAplicacao.Create;
begin
  FModule := HInstance;
end;

function TRecursoAplicacao.CreateStreamRecurso(const ARecurso: string): TStream;
var
  LRecurso: TRecurso;
begin
  LRecurso := Recurso(ARecurso);
  Result := TResourceStream.Create(FModule, LRecurso.Nome, PChar(LRecurso.Tipo));
end;

function TRecursoAplicacao.Mime(const ARecurso: string): string;
var
  laco: Integer;
  LRecurso: TRecurso;
begin
  Result := RecursoMimeType[Low(RecursoMimeType)].Mime;
  LRecurso := Recurso(ARecurso);
  for laco := Low(RecursoMimeType) to High(RecursoMimeType) do
    if SameText(RecursoMimeType[laco].Tipo, LRecurso.Tipo) then
    begin
      Result := RecursoMimeType[laco].Mime;
      Break;
    end;
end;

class function TRecursoAplicacao.Recurso(const ARecurso: string): TRecurso;
begin
  Result.Tipo := ExtractFileExt(ARecurso);
  Result.Nome := Copy(ARecurso, 1, Length(ARecurso) - Length(Result.Tipo));
  if Result.Tipo = '' then
    Result.Tipo := RT_RCDATA
  else
    Result.Tipo := UpperCase(Copy(Result.Tipo, 2, MaxInt));
end;

function TRecursoAplicacao.TemRecurso(const ARecurso: string): Boolean;
var
  HRsrc: THandle;
  LRecurso: TRecurso;
begin
  LRecurso := Recurso(ARecurso);
  HRsrc := FindResource(FModule, PChar(LRecurso.Nome), PChar(LRecurso.Tipo));
  Result := HRsrc <> 0;
end;

{ TTema }

constructor TTema.Create(const ANomeDLL: string);
begin
  Module := LoadLibrary(PChar(ANomeDLL));
  if Module = 0 then
    raise Exception.CreateFmt('O tema "%s" não foi encontrado', [ANomeDLL]);
end;

destructor TTema.Destroy;
begin
  FreeLibrary(Module);
  Module := 0;
  inherited;
end;

procedure AjustaDataHoraDosRecursos;
var
  y, m, d, h, n, s, ms: Word;
begin
  DecodeDateTime(Now, y, m, d, h, n, s, ms);
  GDataHoraDosRecursos := EncodeDateTime(y, m, d, h, n, s, 0);
end;

initialization

  RecursoAplicacao := TRecursoAplicacao.Create;
  AjustaDataHoraDosRecursos;

finalization

  FreeAndNil(RecursoAplicacao);
  FreeAndNil(Tema);

end.
