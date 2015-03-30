unit MVC_IniciadoresConectado;

interface

uses
  SysUtils, Classes, Contnrs, uActiveRecord;

type
  TIniciadorConectado = class(TObject)
  private
    FIniciado: Boolean;
  public
    procedure RodaAoIniciar(const AConnection: IActiveRecordConnection); virtual;
    procedure RodaAoFinalizar; virtual;
  public
    destructor Destroy; override;
  end;

  TIniciadoresConectado = class(TObject)
  private
    FIniciadores: TObjectList;
    FIniciado: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AdicionaIniciador(AIniciador: TIniciadorConectado);
    procedure Finalizar;
    procedure Iniciar(const AConnection: IActiveRecordConnection);
    procedure Reiniciar(const AConnection: IActiveRecordConnection);
    property Iniciado: Boolean read FIniciado;
  end;

var
  IniciadoresConectado: TIniciadoresConectado;

implementation

{ TIniciadoresConectado }

procedure TIniciadoresConectado.AdicionaIniciador(AIniciador: TIniciadorConectado);
begin
  FIniciadores.Add(AIniciador);
end;

constructor TIniciadoresConectado.Create;
begin
  FIniciadores := TObjectList.Create(True);
end;

destructor TIniciadoresConectado.Destroy;
begin
  FIniciadores.Free;
  inherited;
end;

procedure TIniciadoresConectado.Finalizar;
var
  laco: Integer;
begin
  Assert(FIniciado, 'Não foi iniciado');
  for laco := FIniciadores.Count - 1 downto 0 do
    (FIniciadores[laco] as TIniciadorConectado).RodaAoFinalizar;
  FIniciado := False;
end;

procedure TIniciadoresConectado.Iniciar(const AConnection: IActiveRecordConnection);
var
  laco: Integer;
begin
  Assert(not FIniciado, 'Já foi iniciado');
  for laco := 0 to FIniciadores.Count - 1 do
    (FIniciadores[laco] as TIniciadorConectado).RodaAoIniciar(AConnection);
  FIniciado := True;
end;

procedure TIniciadoresConectado.Reiniciar(const AConnection: IActiveRecordConnection);
begin
  if FIniciado then
  begin
    Finalizar;
    FIniciado := False;
  end;
  Iniciar(AConnection);
end;

{ TIniciadorConectado }

destructor TIniciadorConectado.Destroy;
begin
  if FIniciado then
    RodaAoFinalizar;
  inherited;
end;

procedure TIniciadorConectado.RodaAoFinalizar;
begin
  FIniciado := False;
end;

procedure TIniciadorConectado.RodaAoIniciar(const AConnection: IActiveRecordConnection);
begin
  FIniciado := True;
end;

initialization

  IniciadoresConectado := TIniciadoresConectado.Create;

finalization

  FreeAndNil(IniciadoresConectado);

end.
