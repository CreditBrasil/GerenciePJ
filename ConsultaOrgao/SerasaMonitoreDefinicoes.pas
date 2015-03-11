unit SerasaMonitoreDefinicoes;

interface

uses
  SysUtils, Classes;

type
  TSeMonitoreEstado = (smeNao, smeSim, smeIncluir, smeExcluir);

  TSetupSeMonitoreEstado = record
    Letra: Char;
    Texto: string;
    Descricao: string;
  end;

  TSeMonitoreEstadoMetodos = class(TObject)
  public
    class function SeMonitoreDescricao(AEstado: TSeMonitoreEstado): string;
    class function SeMonitoreEstadoPorLetra(const ALetra: string): TSeMonitoreEstado;
    class function SeMonitoreEstadoPorTexto(const ATexto: string): TSeMonitoreEstado;
    class function SeMonitoreLetra(AEstado: TSeMonitoreEstado): Char;
  end;

  TDadosCadastroMonitore = class(TPersistent)
  private
    FCGC: string;
    FEstado: TSeMonitoreEstado;
    FValidade: TDateTime;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    function Descricao: string; overload;
    function Letra: Char; overload;
    property CGC: string read FCGC write FCGC;
    property Estado: TSeMonitoreEstado read FEstado write FEstado;
    property Validade: TDateTime read FValidade write FValidade;
  end;

const
  SetupSeMonitoreEstado: array [TSeMonitoreEstado] of TSetupSeMonitoreEstado = (
    (//smeNao
      Letra: 'N';
      Texto: 'Não';
      Descricao: 'não monitorando'),
    (//smeSim
      Letra: 'S';
      Texto: 'Sim';
      Descricao: 'monit. até %s'),
    (//smeIncluir
      Letra: 'I';
      Texto: 'Incluir';
      Descricao: 'incluir no monitore'),
    (//smeExcluir
      Letra: 'E';
      Texto: 'Excluir';
      Descricao: 'excluir do monitore')
    );

implementation

{ TSeMonitoreEstadoMetodos }

class function TSeMonitoreEstadoMetodos.SeMonitoreDescricao(AEstado: TSeMonitoreEstado): string;
begin
  Result := SetupSeMonitoreEstado[AEstado].Descricao;
end;

class function TSeMonitoreEstadoMetodos.SeMonitoreEstadoPorLetra(const ALetra: string): TSeMonitoreEstado;
var
  laco: TSeMonitoreEstado;
begin
  Result := smeNao;
  for laco := Low(TSeMonitoreEstado) to High(TSeMonitoreEstado) do
    if ALetra = SetupSeMonitoreEstado[laco].Letra then
    begin
      Result := laco;
      Break;
    end;
end;

class function TSeMonitoreEstadoMetodos.SeMonitoreEstadoPorTexto(const ATexto: string): TSeMonitoreEstado;
var
  laco: TSeMonitoreEstado;
begin
  Result := smeNao;
  for laco := Low(TSeMonitoreEstado) to High(TSeMonitoreEstado) do
    if AnsiSameText(ATexto, SetupSeMonitoreEstado[laco].Texto) then
    begin
      Result := laco;
      Break;
    end;
end;

class function TSeMonitoreEstadoMetodos.SeMonitoreLetra(AEstado: TSeMonitoreEstado): Char;
begin
  Result := SetupSeMonitoreEstado[AEstado].Letra;
end;

{ TDadosCadastroMonitore }

procedure TDadosCadastroMonitore.AssignTo(Dest: TPersistent);
var
  D: TDadosCadastroMonitore;
begin
  D := Dest as TDadosCadastroMonitore;
  D.CGC := FCGC;
  D.Estado := FEstado;
  D.Validade := FValidade;
end;

function TDadosCadastroMonitore.Descricao: string;
begin
  Result := TSeMonitoreEstadoMetodos.SeMonitoreDescricao(FEstado);
end;

function TDadosCadastroMonitore.Letra: Char;
begin
  Result := TSeMonitoreEstadoMetodos.SeMonitoreLetra(FEstado);
end;

end.
