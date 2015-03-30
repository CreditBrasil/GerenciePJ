unit CreditBr_Tema;

interface

uses
  SysUtils, MVC_Recurso, MVC_Iniciadores, CreditBr_Configuracao;

type
  TIniciadorTema = class(TIniciador)
  public
    procedure RodaAoIniciar; override;
    procedure RodaAoFinalizar; override;
  end;

implementation

{ TIniciadorTema }

procedure TIniciadorTema.RodaAoFinalizar;
begin
  FreeAndNil(Tema);
end;

procedure TIniciadorTema.RodaAoIniciar;
begin
  Tema := TTema.Create(ExtractFilePath(GetModuleName(HInstance)) + Configuracao.Tema);
end;

initialization

  Iniciadores.AdicionaIniciador(TIniciadorTema.Create);

end.
