unit ConsultaCreditoConfiguracoes;

interface

uses
  Serasa,
  //EquifaxFac,
  ConsultaCreditoDefinicoes,
  uActiveRecord,
  ConfiguracaoRelatoSegmento{,
  ConfiguracaoCreditBureau};

type
  TDadosConfiguracoes = class(TObject)
  private
    FRelatoSegmento: TDadosConfiguracaoRelatoSegmento;
    FCreditBureau: TDadosConfiguracaoCreditBureau;
    function GetRelatoSegmento: TDadosConfiguracaoRelatoSegmento;
    function GetCreditBureau: TDadosConfiguracaoCreditBureau;
  public
    destructor Destroy; override;
    property RelatoSegmento: TDadosConfiguracaoRelatoSegmento
      read GetRelatoSegmento;
    property CreditBureau: TDadosConfiguracaoCreditBureau
      read GetCreditBureau;
  end;

  TConfiguracoes = class(TObject)
  private
    FConnection: IActiveRecordConnection;
    FAtuais: TDadosConfiguracoes;
    FOriginais: TDadosConfiguracoes;
    function ConfiguraRelatoSegmento: Boolean;
    function ConfiguraCreditBureau: Boolean;
  public
    constructor Create(const AConnection: IActiveRecordConnection);
    destructor Destroy; override;
    function Configura(
      const TiposConsultas: TTiposConsultas): Boolean; overload;
    function Configura(Serasa: Serasa.TTipoRelatorio): Boolean; overload;
    procedure Restaura;
    property Atuais: TDadosConfiguracoes read FAtuais;
    property Originais: TDadosConfiguracoes read FOriginais;
  end;

  TConfiguraDadosConfiguracoes = function (AOriginais, AAtuais: TDadosConfiguracoes): Boolean;

var
  GConfiguraCreditBureau: TConfiguraDadosConfiguracoes = nil;
  GConfiguraRelatoSegmento: TConfiguraDadosConfiguracoes = nil;

implementation

{ TDadosConfiguracoes }

destructor TDadosConfiguracoes.Destroy;
begin
  FRelatoSegmento.Free;
  FCreditBureau.Free;
  inherited;
end;

function TDadosConfiguracoes.GetCreditBureau: TDadosConfiguracaoCreditBureau;
begin
  if not Assigned(FCreditBureau) then
    FCreditBureau := TDadosConfiguracaoCreditBureau.Create;
  Result := FCreditBureau;
end;

function TDadosConfiguracoes.GetRelatoSegmento:
  TDadosConfiguracaoRelatoSegmento;
begin
  if not Assigned(FRelatoSegmento) then
    FRelatoSegmento := TDadosConfiguracaoRelatoSegmento.Create;
  Result := FRelatoSegmento;
end;

{ TConfiguracoes }

function TConfiguracoes.Configura(
  const TiposConsultas: TTiposConsultas): Boolean;
var
  laco: TTipoConsulta;
  //LTiposRelatorioEquifax: TTiposRelatorioEquifax;
  //LRelatoriosEquifax: TRelatoriosEquifax;
  //lacoRelatorioEquifax: TTipoRelatorioEquifax;
begin
  Result := False;
  for laco := Low(TTipoConsulta) to High(TTipoConsulta) do
    if laco in TiposConsultas then
    begin
      {LTiposRelatorioEquifax := TMetodos.TiposConsultasEquifax(laco);
      if LTiposRelatorioEquifax <> [] then
      begin
        LRelatoriosEquifax := TRelatoriosEquifax.Create;
        try
          for lacoRelatorioEquifax := Low(TTipoRelatorioEquifax) to High(TTipoRelatorioEquifax) do
            if (lacoRelatorioEquifax in LTiposRelatorioEquifax) then
            begin
              LRelatoriosEquifax[lacoRelatorioEquifax].IniciaParametros;
              Result := LRelatoriosEquifax[lacoRelatorioEquifax].TemConfiguracoes and
                (@GConfiguracoesRelatorioEquifax[lacoRelatorioEquifax] <> nil) and
                GConfiguracoesRelatorioEquifax[lacoRelatorioEquifax](lacoRelatorioEquifax,
                LRelatoriosEquifax[lacoRelatorioEquifax]);
              Break;
            end;
        finally
          LRelatoriosEquifax.Free;
        end;
        Break;
      end
      else}
        case laco of
          tcRelatoSegmento: begin
            Result := ConfiguraRelatoSegmento;
            if not Result then
              Break;
          end;
          {tcCreditBureau : begin
            Result := ConfiguraCreditBureau;
            if not Result then
              Break;
          end;}
        else
          Result := False;
          if not Result then
            Break;
        end;
    end;
end;

function TConfiguracoes.Configura(Serasa: TTipoRelatorio): Boolean;
begin
  Result := Configura(TMetodos.SerasaTiposConsultas(Serasa));
end;

function TConfiguracoes.ConfiguraCreditBureau: Boolean;
begin
  Result := (@GConfiguraCreditBureau = nil) or GConfiguraCreditBureau(FOriginais, FAtuais);
end;

function TConfiguracoes.ConfiguraRelatoSegmento: Boolean;
begin
  Result := (@GConfiguraRelatoSegmento = nil) or GConfiguraRelatoSegmento(FOriginais, FAtuais);
end;

constructor TConfiguracoes.Create(const AConnection: IActiveRecordConnection);

  procedure IniciaRelatoSegmento;
  var
    Configuracao: TConfiguracaoRelatoSegmento;
  begin
    Configuracao := TConfiguracaoRelatoSegmento.Create(FConnection);
    try
      FAtuais.RelatoSegmento.Assign(Configuracao.Dados);
      FOriginais.RelatoSegmento.Assign(Configuracao.Dados);
    finally
      Configuracao.Free;
    end;
  end;

  {procedure IniciaCreditBureau;
  var
    Configuracao: TConfiguracaoCreditBureau;
  begin
    Configuracao := TConfiguracaoCreditBureau.Create(FConnection);
    try
      FAtuais.CreditBureau.Assign(Configuracao.Dados);
      FOriginais.CreditBureau.Assign(Configuracao.Dados);
    finally
      Configuracao.Free;
    end;
  end;}

begin
  inherited Create;
  FConnection := AConnection;
  FAtuais := TDadosConfiguracoes.Create;
  FOriginais := TDadosConfiguracoes.Create;
  IniciaRelatoSegmento;
  //IniciaCreditBureau;
end;

destructor TConfiguracoes.Destroy;
begin
  FAtuais.Free;
  FOriginais.Free;
  inherited;
end;

procedure TConfiguracoes.Restaura;
begin
  FAtuais.RelatoSegmento.Assign(FOriginais.RelatoSegmento);
  FAtuais.CreditBureau.Assign(FOriginais.CreditBureau);
end;

end.
