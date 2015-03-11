unit ConsultaCredito;

interface

uses
  SysUtils,
  Classes,
  Contnrs,
  cachecod,
  FacMetodos,
  SerasaIP20,
  //SerasaB49C,
  Serasa,
  //EquifaxFac,
  ConsultaCreditoDefinicoes,
  ConsultaCreditoConfiguracoes,
  uLogControlIntf,
  uActiveRecord,
  SerasaComunicacao,
  ServiceLocator,
  //uSigcreModel,
  //uSigcadModel,
  SerasaMonitoreDefinicoes,
  SerasaNR054,
  uCMC7;

type
  TTitulo = class(TInteger)
  private
    //FAcheiRecheque: TAcheiRecheque;
    FDados: TDadosTitulo;
    //function GetAcheiRecheque: TAcheiRecheque;
    function GetDados: TDadosTitulo;
  public
    destructor Destroy; override;
    //property AcheiRecheque: TAcheiRecheque read GetAcheiRecheque;
    property Dados: TDadosTitulo read GetDados;
  end;

  TTitulos = class(TCacheInteger)
  private
    function GetTitulo: TTitulo;
  public
    constructor Create;
    property Titulo: TTitulo read GetTitulo;
  end;

  TCadastro = class(TString)
  private
    FCGC: string;
    //FCreditBureau: TCreditBureau;
    FRelatoSegmento: TRelatoSegmento;
    FTitulos: TTitulos;
    FStringSerasa: string;
    //function GetCreditBureau: TCreditBureau;
    function GetRelatoSegmento: TRelatoSegmento;
    function GetTemTitutlos: Boolean;
    function GetTitulos: TTitulos;
  public
    destructor Destroy; override;
    property CGC: string read FCGC write FCGC;
    //property CreditBureau: TCreditBureau read GetCreditBureau;
    property RelatoSegmento: TRelatoSegmento read GetRelatoSegmento;
    property TemTitulos: Boolean read GetTemTitutlos;
    property Titulos: TTitulos read GetTitulos;
    property StringSerasa: string read FStringSerasa write FStringSerasa;
  end;

  TClasseConsulta = class of TConsulta;

  TCadastros = class; //foward

  TConsulta = class(TObject)
  protected
    FTipoConsulta: TTipoConsulta;
    FCadastros: TCadastros;
    FConfiguracoes: TConfiguracoes;
    FConsultados: TCacheString;
    procedure ValidaCGC;
    procedure ValidaCMC7;
  public
    constructor Create(ATipoConsulta: TTipoConsulta; ACadastros: TCadastros;
      AConfiguracoes: TConfiguracoes); virtual;
    destructor Destroy; override;
    procedure Consulta(const ALogControl: ILogControl); virtual; abstract;
    property Consultados: TCacheString read FConsultados;
  end;

  TConsultaSerasa = class(TConsulta)
  protected
    FEnvio: TSeDetalhes;
    FRetorno: TSeDetalhes;
    FSerasa: TSerasa;
    procedure Adiciona(ADetalhe: TSeDetalhes); overload; virtual; abstract;
    procedure Adiciona(AItemDetalhe: TSeItemDetalhes); overload; virtual; abstract;
    procedure PopulaConsultados; virtual;
    procedure LimpaConsultados;
    procedure IniciaDetalhes; virtual; abstract;
    function PegaClasse: TClasseSeDetalhes; virtual; abstract;
    function PegaIndividual: Boolean; virtual;
    procedure Persiste; virtual; abstract;
    function Serasa: TSerasa; virtual;
    procedure Valida; virtual; abstract;
    function ValidaClasse(ADetalhe: TSeDetalhes): Boolean; virtual; abstract;
    function ValidaClasseItem(AItemDetalhe: TSeItemDetalhes): Boolean; virtual; abstract;
  public
    constructor Create(ATipoConsulta: TTipoConsulta; ACadastros: TCadastros;
      AConfiguracoes: TConfiguracoes); override;
    destructor Destroy; override;
    procedure Consulta(const ALogControl: ILogControl); override;
    property Consultados: TCacheString read FConsultados;
  end;

  {TConsultaAcheiRecheque = class(TConsultaSerasa)
  protected
    procedure Adiciona(ADetalhe: TSeDetalhes); overload; override;
    procedure Adiciona(AItemDetalhe: TSeItemDetalhes); overload; override;
    procedure IniciaDetalhes; override;
    function PegaClasse: TClasseSeDetalhes; override;
    function PegaIndividual: Boolean; override;
    procedure Persiste; override;
    procedure Valida; override;
    function ValidaClasse(ADetalhe: TSeDetalhes): Boolean; override;
    function ValidaClasseItem(AItemDetalhe: TSeItemDetalhes): Boolean; override;
  end;}

  {TConsultaCreditBureau = class(TConsultaSerasa)
  protected
    procedure Adiciona(ADetalhe: TSeDetalhes); overload; override;
    procedure Adiciona(AItemDetalhe: TSeItemDetalhes); overload; override;
    procedure IniciaDetalhes; override;
    function PegaClasse: TClasseSeDetalhes; override;
    function PegaIndividual: Boolean; override;
    procedure Persiste; override;
    procedure Valida; override;
    function ValidaClasse(ADetalhe: TSeDetalhes): Boolean; override;
    function ValidaClasseItem(AItemDetalhe: TSeItemDetalhes): Boolean; override;
  end;}

  TConsultaRelatoSegmento = class(TConsultaSerasa)
  protected
    procedure Adiciona(ADetalhe: TSeDetalhes); overload; override;
    procedure Adiciona(AItemDetalhe: TSeItemDetalhes); overload; override;
    procedure IniciaDetalhes; override;
    function PegaClasse: TClasseSeDetalhes; override;
    function PegaIndividual: Boolean; override;
    procedure Persiste; override;
    procedure Valida; override;
    function ValidaClasse(ADetalhe: TSeDetalhes): Boolean; override;
    function ValidaClasseItem(AItemDetalhe: TSeItemDetalhes): Boolean; override;
  end;

  TConsultaMonitore = class(TConsultaSerasa)
  protected
    procedure Adiciona(ADetalhe: TSeDetalhes); overload; override;
    procedure Adiciona(AItemDetalhe: TSeItemDetalhes); overload; override;
    procedure IniciaDetalhes; override;
    function PegaClasse: TClasseSeDetalhes; override;
    function PegaIndividual: Boolean; override;
    procedure Persiste; override;
    procedure PopulaConsultados; override;
    function Serasa: TSerasa; override;
    procedure Valida; override;
    function ValidaClasse(ADetalhe: TSeDetalhes): Boolean; override;
    function ValidaClasseItem(AItemDetalhe: TSeItemDetalhes): Boolean; override;
  end;

  {TConsultaEquifax = class(TConsulta)
  private
    FRelatoriosEquifax: TRelatoriosEquifax;
  public
    constructor Create(ATipoConsulta: TTipoConsulta; ACadastros: TCadastros;
      AConfiguracoes: TConfiguracoes); override;
    procedure Consulta(const ALogControl: ILogControl); override;
  end;}

  TCadastros = class(TCacheString)
  private
    FCNPJsConsultados: array [TTipoConsulta] of TCacheString;
    FConfiguracoes: TConfiguracoes;
    FConsultando: Integer;
    FConnection: IActiveRecordConnection;
    //FValidarPrazoValidadeConsulta: Boolean;
    FComunicacao: TSeComunicacao;
    function GetCadastro: TCadastro;
    function GetConsultando: Boolean;
    function GetFlagTipoConsulta: Integer;
    function GetFCNPJsConsultados(Index: TTipoConsulta): TCacheString;
  protected
    FTipoConsulta: TTipoConsulta;
    {procedure EquifaxConsultaEGrava(ARelatorioEquifax: TRelatorioEquifax; ACodigo: Integer;
      const ACnpjCpf: string); virtual;}
    procedure FinalizaConsulta; virtual;
    procedure IniciaConsulta; virtual;
    //procedure PersisteAcheiRecheque; virtual;
    //procedure PersisteCreditBureau; virtual;
    procedure PersisteRelatoSegmento; virtual;
    property Consultando: Boolean read GetConsultando;
  public
    constructor Create(const AConnection: IActiveRecordConnection);
    destructor Destroy; override;
    function PodeConsultar(const ACadastro: string; const ATipoConsulta: ConsultaCreditoDefinicoes.TTipoConsulta;
      const ALogControl: ILogControl): Boolean; virtual; abstract;
    function Consulta(const TiposConsultas: TTiposConsultas; const ALogControl: ILogControl;
      const AConsultarSelecionado: Boolean): Boolean; overload;
    function Consulta(const Serasa: Serasa.TTipoRelatorio; const ALogControl: ILogControl;
      const AConsultarSelecionado: Boolean): Boolean; overload;
    procedure ConsultaTodasListas(const TiposConsultas: TTiposConsultas; const ALogControl: ILogControl; const AConsultarSelecionado: Boolean);
    property Cadastro: TCadastro read GetCadastro;
    property Comunicacao: TSeComunicacao read FComunicacao write FComunicacao;
    property Configuracoes: TConfiguracoes read FConfiguracoes;
    property Connection: IActiveRecordConnection read FConnection;
    property CNPJsConsultados[Index: TTipoConsulta]: TCacheString
      read GetFCNPJsConsultados;
    property FlagTipoConsulta: Integer read GetFlagTipoConsulta;
    //property ValidarPrazoValidadeConsulta: Boolean read FValidarPrazoValidadeConsulta write FValidarPrazoValidadeConsulta;
  end;

implementation

{ TTitulo }

destructor TTitulo.Destroy;
begin
  //FAcheiRecheque.Free;
  FDados.Free;
  inherited;
end;

{function TTitulo.GetAcheiRecheque: TAcheiRecheque;
begin
  if not Assigned(FAcheiRecheque) then
    FAcheiRecheque := TAcheiRecheque.Create;
  Result := FAcheiRecheque;
end;}

function TTitulo.GetDados: TDadosTitulo;
begin
  if not Assigned(FDados) then
    FDados := TDadosTitulo.Create;
  Result := FDados;
end;

{ TTitulos }

constructor TTitulos.Create;
begin
  inherited Create;
  FClasse := TTitulo;
end;

function TTitulos.GetTitulo: TTitulo;
begin
  Result := FObjeto as TTitulo;
end;

{ TCadastro }

destructor TCadastro.Destroy;
begin
  //FCreditBureau.Free;
  FRelatoSegmento.Free;
  FTitulos.Free;
  inherited;
end;

{function TCadastro.GetCreditBureau: TCreditBureau;
begin
  if not Assigned(FCreditBureau) then
    FCreditBureau := TCreditBureau.Create;
  Result := FCreditBureau;
end;}

function TCadastro.GetRelatoSegmento: TRelatoSegmento;
begin
  if not Assigned(FRelatoSegmento) then
    FRelatoSegmento := TRelatoSegmento.Create;
  Result := FRelatoSegmento;
end;

function TCadastro.GetTemTitutlos: Boolean;
begin
  Result := Assigned(FTitulos) and (Titulos.Count > 0);
end;

function TCadastro.GetTitulos: TTitulos;
begin
  if not Assigned(FTitulos) then
    FTitulos := TTitulos.Create;
  Result := FTitulos;
end;

{ TCadastros }

function TCadastros.Consulta(const TiposConsultas: TTiposConsultas; const ALogControl: ILogControl;
  const AConsultarSelecionado: Boolean): Boolean;
const
  Consultas: array [TTipoConsulta] of TClasseConsulta  = (
    TConsultaRelatoSegmento,
    //TConsultaCreditBureau,
    //TConsultaAcheiRecheque,
    TConsultaMonitore{,
    TConsultaEquifax,
    TConsultaEquifax,
    TConsultaEquifax,
    TConsultaEquifax,
    TConsultaEquifax,
    TConsultaEquifax,
    TConsultaEquifax,
    TConsultaEquifax,
    TConsultaEquifax,
    TConsultaEquifax,
    TConsultaEquifax,
    TConsultaEquifax,
    TConsultaEquifax,
    TConsultaEquifax,
    TConsultaEquifax});
var
  consultou: Boolean;
  consultouOK: Boolean;
  laco: TTipoConsulta;
begin
  consultou := False;
  consultouOK := True;
  IniciaConsulta;
  try
    for laco := Low(TTipoConsulta) to High(TTipoConsulta) do
    begin
      FTipoConsulta := laco;
      if laco in TiposConsultas then
      begin
        with Consultas[laco].Create(laco, Self, FConfiguracoes) do
        try
          Consulta(ALogControl);
          consultou := True;
          consultouOK := consultouOK and (Consultados.Count > 0);
          if Consultados.Count > 0 then
          begin
            CNPJsConsultados[laco].Assign(Consultados);
          end;
        finally
          Free;
        end;
      end;
    end;
  finally
    FinalizaConsulta;
    FConfiguracoes.Restaura;
  end;
  Result := consultou and consultouOK; 
end;

function TCadastros.Consulta(const Serasa: TTipoRelatorio; const ALogControl: ILogControl; const AConsultarSelecionado: Boolean): Boolean;
begin
  Result := Consulta(TMetodos.SerasaTiposConsultas(Serasa), ALogControl, AConsultarSelecionado);
end;

procedure TCadastros.ConsultaTodasListas(const TiposConsultas: TTiposConsultas; const ALogControl: ILogControl; const AConsultarSelecionado: Boolean);
var
  lacocadastro{, lacotitulo}: Integer;
  lacoconsulta: TTipoConsulta;
  {LTiposConsultasEquifax: TTiposRelatorioEquifax;
  lacoRelatorioEquifax: TTipoRelatorioEquifax;
  LTipoPessoaEquifax: TTipoPessoaEquifax;
  LRelatoriosEquifax: TRelatoriosEquifax;}
begin
  //LRelatoriosEquifax := nil;
  IniciaConsulta;
  try
  for lacocadastro := 0 to Count - 1 do
    begin
      Posicao := lacocadastro;
      for lacoconsulta := Low(TTipoConsulta) to High(TTipoConsulta) do
        if lacoconsulta in TiposConsultas then
          case lacoconsulta of
            {tcAcheiRecheque:
              if Cadastro.TemTitulos then
              begin
                Cadastro.Titulos.BeginUpdate;
                try
                  for lacotitulo := 0 to Cadastro.Titulos.Count - 1 do
                  begin
                    Cadastro.Titulos.Posicao := lacotitulo;
                    if TCMC7Metodos.CMC7Valido(Cadastro.Titulos.Titulo.Dados.Documento) then
                      Consulta([tcAcheiRecheque], ALogControl, AConsultarSelecionado);
                  end;
                finally
                  Cadastro.Titulos.EndUpdate;
                end;
              end;
            tcCreditBureau:
              if not TSeMetodos.PessoaJuridica(Cadastro.CGC) then
                Consulta([tcCreditBureau], ALogControl, AConsultarSelecionado);}
            tcRelatoSegmento:
              if TSeMetodos.PessoaJuridica(Cadastro.CGC) then
                Consulta([tcRelatoSegmento], ALogControl, AConsultarSelecionado);
          else
            {LTiposConsultasEquifax := TMetodos.TiposConsultasEquifax(lacoConsulta);
            for lacoRelatorioEquifax := Low(TTipoRelatorioEquifax) to High(TTipoRelatorioEquifax) do
            begin
              if lacoRelatorioEquifax in LTiposConsultasEquifax then
              begin
                LTipoPessoaEquifax := TTipoPessoaEquifax(TFacMetodos.PessoaJuridica(Cadastro.CGC));
                if not Assigned(LRelatoriosEquifax) then
                  LRelatoriosEquifax := TRelatoriosEquifax.Create;
                if LTipoPessoaEquifax in LRelatoriosEquifax.Item[lacoRelatorioEquifax].TiposPessoa then
                  Consulta([lacoConsulta], ALogControl, AConsultarSelecionado);
                Break;
              end;
            end;}
          end;
    end;
  finally
    FinalizaConsulta;
    FConfiguracoes.Restaura;
    //LRelatoriosEquifax.Free;
  end;
end;

constructor TCadastros.Create(const AConnection: IActiveRecordConnection);
begin
  inherited Create;
  FConnection := AConnection;
  FConfiguracoes := TConfiguracoes.Create(FConnection);
  FClasse := TCadastro;
end;

destructor TCadastros.Destroy;
var
  laco: TTipoConsulta;
begin
  FConfiguracoes.Free;
  for laco := Low(TTipoConsulta) to High(TTipoConsulta) do
    FCNPJsConsultados[laco].Free;
  inherited;
end;

{procedure TCadastros.EquifaxConsultaEGrava(ARelatorioEquifax: TRelatorioEquifax; ACodigo: Integer;
  const ACnpjCpf: string);
begin
  //Faz Nada
end;}

procedure TCadastros.FinalizaConsulta;
begin
  EndUpdate;
  Dec(FConsultando);
end;

function TCadastros.GetCadastro: TCadastro;
begin
  Result := FObjeto as TCadastro;
end;

function TCadastros.GetConsultando: Boolean;
begin
  Result := FConsultando <> 0;
end;

function TCadastros.GetFCNPJsConsultados(
  Index: TTipoConsulta): TCacheString;
begin
  if not Assigned(FCNPJsConsultados[Index]) then
    FCNPJsConsultados[Index] := TCacheString.Create;
  Result := FCNPJsConsultados[Index];
end;

function TCadastros.GetFlagTipoConsulta: Integer;
var
  laco: Serasa.TTipoRelatorio;
begin
  Result := 0;
  for laco := Low(Serasa.TTipoRelatorio) to High(Serasa.TTipoRelatorio) do
    if FTipoConsulta in ConsultaCreditoDefinicoes.TMetodos.SerasaTiposConsultas(laco) then
    begin
      Result := Ord(laco);
      Break;
    end
end;

procedure TCadastros.IniciaConsulta;
begin
  BeginUpdate;
  Inc(FConsultando);
end;

{procedure TCadastros.PersisteAcheiRecheque;
begin
  //Faz nada.
end;}

{procedure TCadastros.PersisteCreditBureau;
begin
  //Faz nada.
end;}

procedure TCadastros.PersisteRelatoSegmento;
begin
  //Faz nada.
end;

{ TConsulta }

constructor TConsulta.Create(ATipoConsulta: TTipoConsulta;
  ACadastros: TCadastros; AConfiguracoes: TConfiguracoes);
begin
  FTipoConsulta := ATipoConsulta;
  FCadastros := ACadastros;
  FConfiguracoes := AConfiguracoes;
  FConsultados := TCacheString.Create;
end;

destructor TConsulta.Destroy;
begin
  FConsultados.Free;
end;

procedure TConsulta.ValidaCGC;
begin
  if Assigned(FCadastros.Cadastro) and not TFacMetodos.ChecaDigitoVerificadorCnpjCpf(FCadastros.Cadastro.CGC) then
    raise Exception.CreateFmt('CNPJ/CPF "%s" inválido.', [FCadastros.Cadastro.CGC]);
end;

procedure TConsulta.ValidaCMC7;
begin
  if not TCMC7Metodos.CMC7Valido(FCadastros.Cadastro.Titulos.Titulo.Dados.Documento) then
    raise Exception.CreateFmt('CMC7 "%s" inválido.',
      [FCadastros.Cadastro.Titulos.Titulo.Dados.Documento]);
end;

{ TConsultaSerasa }

procedure TConsultaSerasa.Consulta(const ALogControl: ILogControl);
var
  laco1: Integer;
  laco2: Integer;
  Continua: Boolean;
  SeString: TSeString;
  LRetornos: TObjectList;
  LRetorno: TSeDetalhes;
begin
  Valida;
  Continua := False;
  LimpaConsultados;
  if (FCadastros.Posicao < 0) or FCadastros.PodeConsultar(FCadastros.Cadastro.Codigo, FTipoConsulta, ALogControl) then
  begin
    LRetornos := TObjectList.Create;
    try
      repeat
        if Assigned(FCadastros.Cadastro) then
          FEnvio.CNPJ := FCadastros.Cadastro.CGC;
        IniciaDetalhes;

        SeString := Serasa.Get((FEnvio as PegaClasse));
        if Assigned(SeString) then
          LRetorno := SeString as TSeDetalhes
        else
          LRetorno := nil;

        if Assigned(LRetorno) then
        begin
          LRetornos.Add(LRetorno);
          Continua := FEnvio.Mais or LRetorno.Mais;
          {if (FEnvio is TSeB49C) and (LRetorno is TSeB49C) then
            (FEnvio as TSeB49C).Retorno := LRetorno as TSeB49C;}
        end;
      until not Continua;

      for laco1 := 0 to LRetornos.Count - 1 do
      begin
        LRetorno := LRetornos[laco1] as TSeDetalhes;
        if PegaIndividual then
        begin
          if not ValidaClasse(LRetorno as TSeDetalhes) then
            raise ESerasa.Create('String de retorno inválida.');

          for laco2 := 0 to LRetorno.Quantidade - 1 do
          begin
            if ValidaClasseItem(LRetorno[laco2]) then
              Adiciona(LRetorno[laco2])
            else
              LRetorno[laco2].Free;
          end;
        end
        else
          Adiciona(LRetorno);
      end;

      //Todos os retornos serão liberados, menos o último, que é removido da lista.
      if LRetornos.Count > 0 then
      begin
        FRetorno := LRetornos[LRetornos.Count - 1] as TSeDetalhes;
        LRetornos.Extract(FRetorno);
        if Assigned(FRetorno) then
          Persiste;
      end;
      PopulaConsultados;
    finally
      for laco1 := 0 to LRetornos.Count - 1 do
        (LRetornos[laco1] as TSeDetalhes).Limpa;
      LRetornos.Free;
    end;
  end;
end;

procedure TConsultaSerasa.PopulaConsultados;
begin
  FConsultados.Codigo := FEnvio.CNPJ;
end;

constructor TConsultaSerasa.Create(ATipoConsulta: TTipoConsulta;
  ACadastros: TCadastros; AConfiguracoes: TConfiguracoes);
begin
  inherited Create(ATipoConsulta, ACadastros, AConfiguracoes);
  FEnvio := PegaClasse.Create(Serasa);
end;

destructor TConsultaSerasa.Destroy;
begin
  FEnvio.Free;
  if Assigned(FRetorno) then
  begin
    FRetorno.Limpa;
    FRetorno.Free;
  end;
  FSerasa.Free;
  inherited;
end;

function TConsultaSerasa.PegaIndividual: Boolean;
begin
  Result := True;
end;

function TConsultaSerasa.Serasa: TSerasa;
begin
  if not Assigned(FSerasa) then
    FSerasa := CreateSerasa(FCadastros.Connection);
  Result := FSerasa;
end;

procedure TConsultaSerasa.LimpaConsultados;
begin
  FConsultados.Clear;
end;

{ TConsultaAcheiRecheque }

(*procedure TConsultaAcheiRecheque.Adiciona(AItemDetalhe: TSeItemDetalhes);
begin
  FCadastros.Cadastro.Titulos.Titulo.AcheiRecheque.AdicionaFormatadoLinhas(
    AItemDetalhe as TSeB49C_990101);
end;

procedure TConsultaAcheiRecheque.Adiciona(ADetalhe: TSeDetalhes);
begin
  {(Douglas 08/2006) inclusão do Achei-Recheque ao PDV.}
  SerasaB49C.TClassificacao.SeB49CParaAcheiRecheque(ADetalhe,
    FCadastros.Cadastro.Titulos.Titulo.AcheiRecheque);
end;

procedure TConsultaAcheiRecheque.IniciaDetalhes;
begin
  (FEnvio as TSeB49C).TipoConsulta := SerasaB49C.tcAcheiRecheque;
  (FEnvio as TSeB49C).Titulo.Assign(FCadastros.Cadastro.Titulos.Titulo.Dados);
end;

function TConsultaAcheiRecheque.PegaClasse: TClasseSeDetalhes;
begin
  Result := TSeB49C;
end;

function TConsultaAcheiRecheque.PegaIndividual: Boolean;
begin
  {(Douglas 08/2006) alterado para false pois agora o
  método SerasaB49C.TClassificacao.SeB49CParaAcheiRecheque
  será o responsável por adicionar os detalhes}
  Result := False;
end;

procedure TConsultaAcheiRecheque.Persiste;
begin
  FCadastros.PersisteAcheiRecheque;
end;

procedure TConsultaAcheiRecheque.Valida;
begin
  ValidaCGC;
  validaCMC7;
end;

function TConsultaAcheiRecheque.ValidaClasse(ADetalhe: TSeDetalhes): Boolean;
begin
  Result := ADetalhe is PegaClasse;
end;

function TConsultaAcheiRecheque.ValidaClasseItem(
  AItemDetalhe: TSeItemDetalhes): Boolean;
begin
  {(Douglas 08/2006) aqui pode entrar qualquer item do tipo detalhe
  que será tratado por SerasaB49C.TClassificacao.SeB49CParaAcheiRecheque}
  Result := AItemDetalhe.InheritsFrom(TSeB49C_Detalhe);
end;*)

{ TConsultaCreditBureau }

(*procedure TConsultaCreditBureau.Adiciona(AItemDetalhe: TSeItemDetalhes);
begin
  FCadastros.Cadastro.CreditBureau.AdicionaFormatadoLinhas(
    AItemDetalhe as TSeB49C_CreditBureauFormatado)
end;

procedure TConsultaCreditBureau.Adiciona(ADetalhe: TSeDetalhes);
begin
  SerasaB49C.TClassificacao.SeB49CParaCreditBureau(ADetalhe,
    FCadastros.Cadastro.CreditBureau);
end;

procedure TConsultaCreditBureau.IniciaDetalhes;
begin
  (FEnvio as TSeB49C).TipoConsulta := SerasaB49C.tcCreditBureau;
  (FEnvio as TSeB49C).Configuracao.Assign(
    FConfiguracoes.Atuais.CreditBureau);
end;

function TConsultaCreditBureau.PegaClasse: TClasseSeDetalhes;
begin
  Result := TSeB49C;
end;

function TConsultaCreditBureau.PegaIndividual: Boolean;
begin
  Result := False;
end;

procedure TConsultaCreditBureau.Persiste;
begin
  FCadastros.PersisteCreditBureau;
end;

procedure TConsultaCreditBureau.Valida;
begin
  ValidaCGC;
end;

function TConsultaCreditBureau.ValidaClasse(
  ADetalhe: TSeDetalhes): Boolean;
begin
  Result := ADetalhe is PegaClasse;
end;

function TConsultaCreditBureau.ValidaClasseItem(
  AItemDetalhe: TSeItemDetalhes): Boolean;
begin
  Result := AItemDetalhe is TSeB49C_CreditBureauFormatado;
end;*)

{ TConsultaRelatoSegmento }

procedure TConsultaRelatoSegmento.Adiciona(AItemDetalhe: TSeItemDetalhes);
begin
  // faz nada
end;

procedure TConsultaRelatoSegmento.Adiciona(ADetalhe: TSeDetalhes);
{var
  LService: ISigcreModelService;
  LSigcre: ISigcreModel;}
begin
  {SerasaIP20.TClassificacao.SeIP20ParaRelatoSegmento(ADetalhe,
    FCadastros.Cadastro.RelatoSegmento);}
  if Assigned(FCadastros.Cadastro.RelatoSegmento.PosicionalInformacoesMonitore) and
    FCadastros.Cadastro.RelatoSegmento.PosicionalInformacoesMonitore.InclusaoEfetuada then
  begin
    {LService := SL as ISigcreModelService;
    LSigcre := LService.FindByCodigoOrDefault(FCadastros.Cadastro.Codigo, FCadastros.Connection);
    LSigcre.RegistraMonitore(smeSim, Date + (ADetalhe as PegaClasse).Serasa.DiasMonitore);
    LService.Save(LSigcre);}
  end;
end;

procedure TConsultaRelatoSegmento.IniciaDetalhes;
begin
  (FEnvio as TComunicacaoIP20).Configuracao.Assign(
    FConfiguracoes.Atuais.RelatoSegmento);
end;

function TConsultaRelatoSegmento.PegaClasse: TClasseSeDetalhes;
begin
  Result := TComunicacaoIP20;
end;

function TConsultaRelatoSegmento.PegaIndividual: Boolean;
begin
  Result := False;
end;

procedure TConsultaRelatoSegmento.Persiste;
begin
  FCadastros.PersisteRelatoSegmento;
end;

procedure TConsultaRelatoSegmento.Valida;
begin
  ValidaCGC;
end;

function TConsultaRelatoSegmento.ValidaClasse(
  ADetalhe: TSeDetalhes): Boolean;
begin
  Result := False;
end;

function TConsultaRelatoSegmento.ValidaClasseItem(
  AItemDetalhe: TSeItemDetalhes): Boolean;
begin
  Result := False;
end;

{ TConsultaMonitore }

procedure TConsultaMonitore.Adiciona(AItemDetalhe: TSeItemDetalhes);
begin
  // faz nada
end;

procedure TConsultaMonitore.Adiciona(ADetalhe: TSeDetalhes);
begin
// faz nada
end;

function TConsultaMonitore.Serasa: TSerasa;
begin
  if not Assigned(FSerasa) then
  begin
    Assert(FCadastros.Comunicacao <> nil, 'Falta definir a propriedade Comunicacao');
    FSerasa := CreateSerasa(FCadastros.Connection, tcLocal, TSerasaLocalNR054.Create(FCadastros.Comunicacao));
  end;
  Result := FSerasa;
end;

procedure TConsultaMonitore.IniciaDetalhes;
begin
// faz nada
end;

function TConsultaMonitore.PegaClasse: TClasseSeDetalhes;
begin
  Result := TSeNR054;
end;

function TConsultaMonitore.PegaIndividual: Boolean;
begin
  Result := False;
end;

procedure TConsultaMonitore.Persiste;
var
  laco: Integer;
  CNPJ: string;
  //LSigcadModelService: ISigcadModelService;
  //LCollectionSigcad: ICollectionSigcadModel;
begin
  //LSigcadModelService := SL as ISigcadModelService;
  for laco := 0 to (FRetorno as TSeNR054).QuantidadeSeIP20 - 1 do
  begin
    CNPJ := (FRetorno as TSeNR054).SeIP20[laco].CNPJ + '0001';
    CNPJ := CNPJ + TFacMetodos.CalculaDigitoVerificadorCnpjCpf(CNPJ, False);
    {LCollectionSigcad := LSigcadModelService.CollectionByInicioCnpjCpfAndGerente(CNPJ, NullString, tfCedenteOrSacado,
      FCadastros.Connection);
    if LCollectionSigcad.Count > 0 then
    begin}
      FCadastros.Codigo := TFacMetodos.SoNumero(CNPJ);{LCollectionSigcad[0].Codigo;}
      FCadastros.Cadastro.StringSerasa := (FRetorno as TSeNR054).SeIP20[laco].TextOut;
      SerasaIP20.TClassificacao.SeIP20ParaRelatoSegmento((FRetorno as TSeNR054).SeIP20[laco],
        FCadastros.Cadastro.RelatoSegmento);
      FCadastros.PersisteRelatoSegmento;
    //end;
  end;
end;

procedure TConsultaMonitore.Valida;
begin
  ValidaCGC;
end;

function TConsultaMonitore.ValidaClasse(
  ADetalhe: TSeDetalhes): Boolean;
begin
  Result := False;
end;

function TConsultaMonitore.ValidaClasseItem(
  AItemDetalhe: TSeItemDetalhes): Boolean;
begin
  Result := False;
end;

procedure TConsultaMonitore.PopulaConsultados;
var
  laco: Integer;
begin
  if Assigned(FRetorno) then
    for laco := 0 to (FRetorno as TSeNR054).QuantidadeSeIP20 - 1 do
      FConsultados.Codigo := (FRetorno as TSeNR054).SeIP20[laco].CNPJ;
end;

{ TConsultaEquifax }

(*procedure TConsultaEquifax.Consulta(const ALogControl: ILogControl);
var
  lacoRelatorioEquifax: TTipoRelatorioEquifax;
  LRelatorioChequeMais: TRelatorioChequeMais;
begin
  ValidaCGC;
  FConsultados.Clear;
  if (FCadastros.Posicao < 0) or FCadastros.PodeConsultar(FCadastros.Cadastro.Codigo, FTipoConsulta, ALogControl) then
  begin
    for lacoRelatorioEquifax := Low(EquifaxFac.TTipoRelatorioEquifax) to High(TTipoRelatorioEquifax) do
    begin
      if lacoRelatorioEquifax in ConsultaCreditoDefinicoes.TMetodos.TiposConsultasEquifax(FTipoConsulta) then
      begin
        FRelatoriosEquifax[lacoRelatorioEquifax].IniciaParametros;
        if (FTipoConsulta = tcChequeMais) and (FCadastros.Cadastro.Titulos.Count > 0) then
        begin
          LRelatorioChequeMais := FRelatoriosEquifax[lacoRelatorioEquifax] as TRelatorioChequeMais;
          LRelatorioChequeMais.Banco := FCadastros.Cadastro.Titulos.Titulo.Dados.ChequeBanco;
          LRelatorioChequeMais.Agencia := FCadastros.Cadastro.Titulos.Titulo.Dados.ChequeAgencia;
          LRelatorioChequeMais.ContaCorrente := FCadastros.Cadastro.Titulos.Titulo.Dados.ChequeContaCorrente;
          LRelatorioChequeMais.Cheque := FCadastros.Cadastro.Titulos.Titulo.Dados.Documento;
          LRelatorioChequeMais.Quantidade := FCadastros.Cadastro.Titulos.Titulo.Dados.ChequeQuantidade;
        end;
        FCadastros.EquifaxConsultaEGrava(FRelatoriosEquifax[lacoRelatorioEquifax], FCadastros.Cadastro.Codigo,
          FCadastros.Cadastro.CGC);
        FConsultados.Codigo := FCadastros.Cadastro.CGC;
        Break;
      end;
    end;
  end;
end;

constructor TConsultaEquifax.Create(ATipoConsulta: TTipoConsulta;
  ACadastros: TCadastros; AConfiguracoes: TConfiguracoes);
begin
  inherited Create(ATipoConsulta, ACadastros, AConfiguracoes);
  FRelatoriosEquifax := TRelatoriosEquifax.Create;
end;*)

end.
