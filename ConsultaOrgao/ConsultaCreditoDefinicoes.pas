unit ConsultaCreditoDefinicoes;

interface

uses
  Classes, Serasa, SerasaMonitoreDefinicoes{, EquifaxFac, uSigcreModel};

type
  TTipoConsulta = (
    tcRelatoSegmento,
    //tcCreditBureau,
    //tcAcheiRecheque,
    tcMonitore{,
    tcEmpresarial,
    tcPessoal,
    tcChequeEmpresarial,
    tcChequePessoal,
    tcScoreEmpresarial,
    tcScoreEmpresarialCompleto,
    tcEmpresarialCompleto,
    tcConsultePJ,
    tcPessoalCompleto,
    tcClickFactorPF,
    tcClickFactorPJ,
    tcChequeMais,
    tcPessoalPlus,
    tcConsultePF,
    tcEmprGold});

  TTiposConsultas = set of TTipoConsulta;

  TMetodos = class(TObject)
  public
    {class function EquifaxTiposConsultas(
       Equifax: EquifaxFac.TTipoRelatorioEquifax): TTiposConsultas;}
    class function SerasaTiposConsultas(
       Serasa: Serasa.TTipoRelatorio): TTiposConsultas;
    {class function TiposConsultasEquifax(
       TipoConsulta: TTipoConsulta): EquifaxFac.TTiposRelatorioEquifax;}
  end;

  TDadosTitulo = class(TPersistent)
  private
    FChequeAgencia: string;
    FChequeBanco: string;
    FChequeContaCorrente: string;
    FChequeQuantidade: Integer;
    FData: TDateTime;
    FDocumento: string;
    FValor: Double;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    property ChequeAgencia: string read FChequeAgencia write FChequeAgencia;
    property ChequeBanco: string read FChequeBanco write FChequeBanco;
    property ChequeContaCorrente: string read FChequeContaCorrente write FChequeContaCorrente;
    property ChequeQuantidade: Integer read FChequeQuantidade write FChequeQuantidade;
    property Data: TDateTime read FData write FData;
    property Documento: string read FDocumento write FDocumento;
    property Valor: Double read FValor write FValor;
  end;

  TDadosConfiguracaoRelatoSegmento = class(TPersistent)
  private
    FCalculoRiskScoring: Integer;
    FConsultaMonitore: Boolean;
    FConsultaParticipacoes: Boolean;
    FConsultaQuadroSocial: Boolean;
    FIndicadorRiskAtacadista: Integer;
    FConsultaCentralDeTitulos: Boolean;
  protected
     procedure AssignTo(Dest: TPersistent); override;
  public
    property CalculoRiskScoring: Integer read FCalculoRiskScoring
      write FCalculoRiskScoring;
    property ConsultaMonitore: Boolean read FConsultaMonitore
      write FConsultaMonitore;
    property ConsultaParticipacoes: Boolean read FConsultaParticipacoes
      write FConsultaParticipacoes;
    property ConsultaQuadroSocial: Boolean read FConsultaQuadroSocial
      write FConsultaQuadroSocial;
    property IndicadorRiskAtacadista: Integer read FIndicadorRiskAtacadista
      write FIndicadorRiskAtacadista;
    property ConsultaCentralDeTitulos: Boolean read FConsultaCentralDeTitulos
      write FConsultaCentralDeTitulos;
  end;

  TDadosConfiguracaoCreditBureau = class(TPersistent)
  private
    FConsultaSPC: Boolean;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    property ConsultaSPC: Boolean read FConsultaSPC write FConsultaSPC;
  end;

implementation

const
  LSerasaTiposConsultas: array [Serasa.TTipoRelatorio] of TTiposConsultas = (
    [tcRelatoSegmento],
    {[tcCreditBureau],
    [],
    [],
    [tcAcheiRecheque],}
    [tcMonitore]);
  {LEquifaxTiposConsultas: array [EquifaxFac.TTipoRelatorioEquifax] of TTiposConsultas = (
    [tcEmpresarial],
    [tcPessoal],
    [tcChequeEmpresarial],
    [tcChequePessoal],
    [tcScoreEmpresarial],
    [tcScoreEmpresarialCompleto],
    [tcEmpresarialCompleto],
    [tcConsultePJ],
    [tcPessoalCompleto],
    [tcClickFactorPF],
    [tcClickFactorPJ],
    [tcChequeMais],
    [tcPessoalPlus],
    [tcConsultePF],
    [tcEmprGold]
    );
  LTiposConsultasEquifax: array [TTipoConsulta] of EquifaxFac.TTiposRelatorioEquifax = (
    [],
    [],
    [],
    [],
    [treEmpresarial],
    [trePessoal],
    [treChequeEmpresarial],
    [treChequePessoal],
    [treScoreEmpresarial],
    [treScoreEmpresarialCompleto],
    [treEmpresarialCompleto],
    [treConsultePJ],
    [trePessoalCompleto],
    [treClickFactorPF],
    [treClickFactorPJ],
    [treChequeMais],
    [trePessoalPlus],
    [treConsultePF],
    [treEmprGold]);}

{ TMetodos }

{class function TMetodos.EquifaxTiposConsultas(
  Equifax: TTipoRelatorioEquifax): TTiposConsultas;
begin
  Result := LEquifaxTiposConsultas[Equifax];
end;}

class function TMetodos.SerasaTiposConsultas(
  Serasa: TTipoRelatorio): TTiposConsultas;
begin
  Result := LSerasaTiposConsultas[Serasa];
end;

{class function TMetodos.TiposConsultasEquifax(
  TipoConsulta: TTipoConsulta): EquifaxFac.TTiposRelatorioEquifax;
begin
  Result := LTiposConsultasEquifax[TipoConsulta];
end;}

{ TDadosTitulo }

procedure TDadosTitulo.AssignTo(Dest: TPersistent);
var
  D: TDadosTitulo;
begin
  D := Dest as TDadosTitulo;
  D.Data := FData;
  D.Documento := FDocumento;
  D.Valor := FValor;
end;

{ TDadosConfiguracaoRelatoSegmento }

procedure TDadosConfiguracaoRelatoSegmento.AssignTo(Dest: TPersistent);
var
  D: TDadosConfiguracaoRelatoSegmento;
begin
  D := Dest as TDadosConfiguracaoRelatoSegmento;
  D.CalculoRiskScoring := FCalculoRiskScoring;
  D.ConsultaMonitore := FConsultaMonitore;
  D.ConsultaParticipacoes := FConsultaParticipacoes;
  D.ConsultaQuadroSocial := FConsultaQuadroSocial;
  D.IndicadorRiskAtacadista := FIndicadorRiskAtacadista;
  D.ConsultaCentralDeTitulos := FConsultaCentralDeTitulos;
end;

{ TDadosConfiguracaoCreditBureau }

procedure TDadosConfiguracaoCreditBureau.AssignTo(Dest: TPersistent);
var
  D: TDadosConfiguracaoCreditBureau;
begin
  D := Dest as TDadosConfiguracaoCreditBureau;
  D.ConsultaSPC := FConsultaSPC;
end;

end.
