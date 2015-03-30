unit MVC_Iniciadores;

interface

uses
  SysUtils, Classes, Contnrs;

type
  TIniciador = class(TObject)
  public
    procedure RodaAoIniciar; virtual; abstract;
    procedure RodaAoFinalizar; virtual; abstract;
  end;

  TIniciadores = class(TObject)
  private
    FIniciadores: TObjectList;
    FIniciado, FFinalizado: Boolean;
    FErrosIniciar: TStringList;
    function GetErrosIniciar: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AdicionaIniciador(AIniciador: TIniciador);
    procedure Finalizar;
    procedure Iniciar;
    procedure Reiniciar;
    function TemErros: Boolean;
    property ErrosIniciar: TStringList read GetErrosIniciar;
    property Iniciado: Boolean read FIniciado;
  end;

var
  Iniciadores: TIniciadores;

implementation

{ TIniciadores }

procedure TIniciadores.AdicionaIniciador(AIniciador: TIniciador);
begin
  FIniciadores.Add(AIniciador);
end;

constructor TIniciadores.Create;
begin
  FIniciadores := TObjectList.Create(True);
end;

destructor TIniciadores.Destroy;
begin
  Assert((not FIniciado) or FFinalizado, 'Faltou finalizar');
  FIniciadores.Free;
  FreeAndNil(FErrosIniciar);
  inherited;
end;

procedure TIniciadores.Finalizar;
var
  laco: Integer;
begin
  Assert(FIniciado, 'Não foi iniciado');
  Assert(not FFinalizado, 'Já foi finalizado');
  for laco := FIniciadores.Count - 1 downto 0 do
    (FIniciadores[laco] as TIniciador).RodaAoFinalizar;
  FFinalizado := True;
  FIniciado := False;
end;

function TIniciadores.GetErrosIniciar: TStringList;
begin
  if FErrosIniciar = nil then
    FErrosIniciar := TStringList.Create;
  Result := FErrosIniciar;
end;

procedure TIniciadores.Iniciar;
var
  laco: Integer;
begin
  Assert(not FIniciado, 'Já foi iniciado');
  for laco := 0 to FIniciadores.Count - 1 do
    try
      (FIniciadores[laco] as TIniciador).RodaAoIniciar;
    except
      on e: Exception do
        ErrosIniciar.Append(Format('%s: %s: %s', [FIniciadores[laco].ClassName, e.ClassName, e.Message]));
    end;
  FFinalizado := False;
  FIniciado := True;
end;

procedure TIniciadores.Reiniciar;
begin
  if FIniciado then
  begin
    Finalizar;
    FIniciado := False;
    FreeAndNil(FErrosIniciar);
    FFinalizado := False;
  end;
  Iniciar;
end;

function TIniciadores.TemErros: Boolean;
begin
  Result := (FErrosIniciar <> nil) and (FErrosIniciar.Count > 0);
end;

initialization

  Iniciadores := TIniciadores.Create;

finalization

  FreeAndNil(Iniciadores);

end.
