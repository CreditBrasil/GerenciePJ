unit MVC_Controlador_Recurso;

interface

uses
  SysUtils, Classes, MVC_Controlador, MVC_Recurso;

type
  TControladorRecurso = class(TControlador)
  protected
    procedure DespachaAcao(const ANomeAcao: string); override;
    procedure Recurso(const ANomeRecurso: string);
    function RecursoAplicacao: TRecursoAplicacao; virtual;
  end;

  TControladorTema = class(TControladorRecurso)
  protected
    function RecursoAplicacao: TRecursoAplicacao; override;
  end;

const
  IID_ControladorRecurso: TGUID = '{627E4DDE-C7CD-46FC-9DD7-2DA13838D723}';
  IID_ControladorTema: TGUID = '{579A3ED2-1335-40F1-AA66-22CA6FBCC83E}';

implementation

function FabricaControladorRecurso: IUnknown;
begin
  Result := TControladorRecurso.Create;
end;

function FabricaControladorTema: IUnknown;
begin
  Result := TControladorTema.Create;
end;

{ TControladorRecurso }

procedure TControladorRecurso.DespachaAcao(const ANomeAcao: string);
var
  LNomeRecurso, LExtensao: string;
  laco: Integer;
begin
  LNomeRecurso := ANomeAcao;
  for laco := 0 to High(Rota.OutrosElementos) do
    LNomeRecurso := LNomeRecurso + '_' + Rota.OutrosElementos[laco];
  LNomeRecurso := StringReplace(LNomeRecurso, '-', '', [rfReplaceAll]);
  LExtensao := ExtractFileExt(LNomeRecurso);
  LNomeRecurso := StringReplace(Copy(LNomeRecurso, 1, Length(LNomeRecurso) - Length(LExtensao)), '.', '',
    [rfReplaceAll]) + LExtensao;
  if RecursoAplicacao.TemRecurso(LNomeRecurso) then
    Recurso(LNomeRecurso)
  else
    NaoFoiEncontrado;
end;

procedure TControladorRecurso.Recurso(const ANomeRecurso: string);
var
  LModelo: TRecursoModelo;
  LModificadoDesde: TDateTime;
begin
  if (not TemModificadoDesde(LModificadoDesde)) or (LModificadoDesde < GDataHoraDosRecursos) then
  begin
    LModelo := TRecursoModelo.Create;
    LModelo.MimeType := RecursoAplicacao.Mime(ANomeRecurso);
    LModelo.Content := RecursoAplicacao.CreateStreamRecurso(ANomeRecurso);
    Visao('Recurso', '', LModelo);
  end
  else
    NaoModificado;
end;

function TControladorRecurso.RecursoAplicacao: TRecursoAplicacao;
begin
  Result := MVC_Recurso.RecursoAplicacao;
end;

{ TControladorTema }

function TControladorTema.RecursoAplicacao: TRecursoAplicacao;
begin
  Result := Tema;
end;

initialization

  TControladorRecurso.RegistreSe(IID_ControladorRecurso, FabricaControladorRecurso);
  TControladorTema.RegistreSe(IID_ControladorTema, FabricaControladorTema);

end.
