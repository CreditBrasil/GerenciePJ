unit SerasaIP20;

interface

uses
  Contnrs, cachecod, Serasa, ConsultaCreditoDefinicoes;

type
  TSeIP20 = class; //forward

  TClasseSeIP20_Detalhe = class of TSeIP20_Detalhe;

  TSeIP20_Detalhe = class(TSeItemDetalhes)
  private
    FSeIP20: TSeIP20;
  protected
    procedure SetText(const Value: string); override;
    property SeIP20: TSeIP20 read FSeIP20;
  public
    constructor Create(ASeIP20: TSeIP20);
    class function ID: string; virtual; abstract;
    class function Bloco: string; virtual; abstract;
    class function Tipo: string; virtual; abstract;
    class function Registro: string;
    property Text: string write SetText;
  end;

  {"Cadastral".}
  TSeIP20_01 = class(TSeIP20_Detalhe)
  public
    class function ID: string; override;
  end;

  {"Controle".}
  TSeIP20_01_00 = class(TSeIP20_01)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_01_00_99 = class(TSeIP20_01_00)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  {"Dados de Controle da Empresa Consultada".}
  TSeIP20_01_00_00 = class(TSeIP20_01_00)
  private
    FCodigoSituacao: Integer;
    FDescricaoSituacao: string;
    FCNPJ: string;
    FTemFicha: Boolean;
    FTransacaoContabilizada: string;
    FCodigoMensagemReciprocidade: Char;
    FUltimaRemessaReciprocidade: TDateTime;
    FTransacoesDesmembradas: array [0..8] of string;
    FTipoRelato: Char;
    function GetSituacao: string;
    function GetTransacoesContabilizadasDesmembradas(Index: Integer): string;
    function GetMensagemReciprocidade: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property CodigoSituacao: Integer read FCodigoSituacao;
    property Situacao: string read GetSituacao;
    property DescricaoSituacao: string read FDescricaoSituacao;
    property CNPJ: string read FCNPJ;
    property TemFicha: Boolean read FTemFicha;
    property TransacaoContabilizada: string read FTransacaoContabilizada;
    property CodigoMensagemReciprocidade: Char
      read FCodigoMensagemReciprocidade;
    property MensagemReciprocidade: string read GetMensagemReciprocidade;
    property UltimaRemessaReciprocidade: TDateTime
      read FUltimaRemessaReciprocidade;
    property TransacoesContabilizadasDesmembradas[Index: Integer]: string
      read GetTransacoesContabilizadasDesmembradas;
    property TipoRelato: Char read FTipoRelato;
  end;

  {"Empresa".}
  TSeIP20_01_01 = class(TSeIP20_01)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_01_01_99 = class(TSeIP20_01_01)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  {"Frase de status da empresa".}
  TSeIP20_01_01_00 = class(TSeIP20_01_01)
  private
    FMensagemStatusEmpresa: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property MensagemStatusEmpresa: string read FMensagemStatusEmpresa;
  end;

  {"Contabilização".}
  TSeIP20_01_01_01 = class(TSeIP20_01_01)
  private
    FConfidencialPara: string;
    FDataHoraContabilizacaoConsulta: TDateTime;
    FCNPJEditado: string;
    FDataAtualizacaoBloco: TDateTime;
    FNumeroUltimoRegistroOrgaosOficiais: string;
    FDataUltimoRegistroOrgaosOficiais: TDateTime;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property ConfidencialPara: string read FConfidencialPara;
    property DataHoraContabilizacaoConsulta: TDateTime
      read FDataHoraContabilizacaoConsulta;
    property CNPJEditado: string read FCNPJEditado;
    property DataAtualizacaoBloco: TDateTime read FDataAtualizacaoBloco;
    property NumeroUltimoRegistroOrgaosOficiais: string
      read FNumeroUltimoRegistroOrgaosOficiais;
    property DataUltimoRegistroOrgaosOficiais: TDateTime
      read FDataUltimoRegistroOrgaosOficiais;
  end;

  {"Identificação".}
  TSeIP20_01_01_02 = class(TSeIP20_01_01)
  private
    FNome: string;
    FCNPJ: string;
    FNomeFantasia: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Nome: string read FNome;
    property CNPJ: string read FCNPJ;
    property NomeFantasia: string read FNomeFantasia;
  end;

  {"Endereço".}
  TSeIP20_01_01_03 = class(TSeIP20_01_01)
  private
    FEndereco: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Endereco: string read FEndereco;
  end;

  {"Localização".}
  TSeIP20_01_01_04 = class(TSeIP20_01_01)
  private
    FCidade: string;
    FUF: string;
    FCEP: string;
    FDDD: string;
    FTelefone: string;
    FFAX: string;
    FCodigoEmbratel: string;
    FPaginaInternet: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Cidade: string read FCidade;
    property UF: string read FUF;
    property CEP: string read FCEP;
    property DDD: string read FDDD;
    property Telefone: string read FTelefone;
    property FAX: string read FFAX;
    property CodigoEmbratel: string read FCodigoEmbratel;
    property PaginaInternet: string read FPaginaInternet;
  end;

  {"Atividade".}
  TSeIP20_01_01_05 = class(TSeIP20_01_01)
  private
    FDataFundacao: TDateTime;
    FDataInscricaoCNPJ: TDateTime;
    FRamoAtividade: string;
    FCodigoSerasaCompleto: string;
    FQuantidadeEmpregados: Integer;
    FPercentualCompra: Double;
    FPercentualVendas: Double;
    FQuantidadeFiliais: Integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property DataFundacao: TDateTime read FDataFundacao;
    property DataInscricaoCNPJ: TDateTime read FDataInscricaoCNPJ;
    property RamoAtividade: string read FRamoAtividade;
    property CodigoSerasaCompleto: string read FCodigoSerasaCompleto;
    property QuantidadeEmpregados: Integer read FQuantidadeEmpregados;
    property PercentualCompra: Double read FPercentualCompra;
    property PercentualVendas: Double read FPercentualVendas;
    property QuantidadeFiliais: Integer read FQuantidadeFiliais;
  end;

  {"Filiais".}
  TSeIP20_01_01_06 = class(TSeIP20_01_01)
  private
    FNomeFilial: string;
    FCodigoEmbratel: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property NomeFilial: string read FNomeFilial;
    property CodigoEmbratel: string read FCodigoEmbratel;
  end;

  {"Principais Produtos".}
  TSeIP20_01_01_07 = class(TSeIP20_01_01)
  private
    FPrincipaisProdutos: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property PrincipaisProdutos: string read FPrincipaisProdutos;
  end;

  {"Controle Societário (Data da Última Atualização e Capital
  Social)".}
  TSeIP20_01_01_08 = class(TSeIP20_01_01)
  private
    FDataAtualizacao: TDatetime;
    FCapitalSocial: Double;
    FCapitalRealizado: Double;
    FCapitalAutorizado: Double;
    FNacionalidade: string;
    FOrigem: string;
    FNatureza: string;
    FBaseJuntaComercial: Boolean;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property DataAtualizacao: TDatetime read FDataAtualizacao;
    property CapitalSocial: Double read FCapitalSocial;
    property CapitalRealizado: Double read FCapitalRealizado;
    property CapitalAutorizado: Double read FCapitalAutorizado;
    property Nacionalidade: string read FNacionalidade;
    property Origem: string read FOrigem;
    property Natureza: string read FNatureza;
    property BaseJuntaComercial: Boolean read FBaseJuntaComercial;
  end;

  {esta classe registra pessoas físicas e jurídicas ligadas a
  empresa, sejam sócios ou administradores.
  Atualmente, esta classe não força as filhas a determinarem valores para as
  propriedades abaixo, embora poderia fazê-lo implementando-se "getters"
  abstratos para as propriedades, ou até mesmo implementar uma interface ao
  invés do uso desta classe.}
  TSeIP20_01_01_Pessoa = class(TSeIP20_01_01)
  private
    function GetSituacao: string;
    function GetTipoDocumento: string;
  protected
    FCGC: string;
    FCodigoTipoDocumento: Integer;
    FNome: string;
    FRestrito: Boolean;
    FCodigoSituacao: Integer;
  public
    property CGC: string read FCGC;
    property CodigoTipoDocumento: Integer read FCodigoTipoDocumento;
    property TipoDocumento: string read GetTipoDocumento;
    property Nome: string read FNome;
    property Restrito: Boolean read FRestrito;
    property CodigoSituacao: Integer read FCodigoSituacao;
    property Situacao: string read GetSituacao;
  end;

  {"Controle Societário (Detalhes dos Sócios)".}
  TSeIP20_01_01_09 = class(TSeIP20_01_01_Pessoa)
  private
    FPais: string;
    FPercentualCapital: Double;
    FDataEntrada: TDateTime;
    FPercentualCapitalVotante: Double;
    FCodigoSerasa: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Pais: string read FPais;
    property PercentualCapital: Double read FPercentualCapital;
    property DataEntrada: TDateTime read FDataEntrada;
    property PercentualCapitalVotante: Double read FPercentualCapitalVotante;
    property CodigoSerasa: string read FCodigoSerasa;
  end;

  {"Quadro Administrativo (Data da Última Atualização)".}
  TSeIP20_01_01_10 = class(TSeIP20_01_01)
  private
    FDataAtualizacao: TDatetime;
    FBaseJuntaComercial: Boolean;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property DataAtualizacao: TDatetime read FDataAtualizacao;
    property BaseJuntaComercial: Boolean read FBaseJuntaComercial;
  end;

  {"Quadro Administrativo (Detalhes)".}
  TSeIP20_01_01_11 = class(TSeIP20_01_01_Pessoa)
  private
    FCargo: string;
    FPais: string;
    FEstadoCivil: string;
    FDataEntrada: TDateTime;
    FDataFinalMandato: TDateTime;
    FCodigoCargo: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Cargo: string read FCargo;
    property Pais: string read FPais;
    property EstadoCivil: string read FEstadoCivil;
    property DataEntrada: TDateTime read FDataEntrada;
    property DataFinalMandato: TDateTime read FDataFinalMandato;
    property CodigoCargo: string read FCodigoCargo;
  end;

  {"Participações (Data da Última Atualização)".}
  TSeIP20_01_01_12 = class(TSeIP20_01_01)
  private
    FDataAtualizacao: TDatetime;
    FBaseJuntaComercial: Boolean;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property DataAtualizacao: TDatetime read FDataAtualizacao;
    property BaseJuntaComercial: Boolean read FBaseJuntaComercial;
  end;

  {"Participações - Participada (Detalhes)".}
  TSeIP20_01_01_13 = class(TSeIP20_01_01_Pessoa)
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
  end;

  {"Participações - Participante (Detalhes)".}
  TSeIP20_01_01_14 = class(TSeIP20_01_01_Pessoa)
  private
    FVinculoParticipante: string;
    FCodigoEmbratel: string;
    FMunicipioEmbratel: string;
    FUFEmbratel: string;
    FPercentualParticipacao: Double;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property VinculoParticipante: string read FVinculoParticipante;
    property CodigoEmbratel: string read FCodigoEmbratel;
    property MunicipioEmbratel: string read FMunicipioEmbratel;
    property UFEmbratel: string read FUFEmbratel;
    property PercentualParticipacao: Double read FPercentualParticipacao;
  end;

  {"Antecessora".}
  TSeIP20_01_01_16 = class(TSeIP20_01_01)
  private
    FNome: string;
    FDataMotivo: TDateTime;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Nome: string read FNome;
    property DataMotivo: TDateTime read FDataMotivo;
  end;

  {"Situação empresa, incorporação, fusão, cisão".}
  TSeIP20_01_01_98 = class(TSeIP20_01_01)
  private
    FMensagemBloco: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property MensagemBloco: string read FMensagemBloco;
  end;

  {"Situação". Este bloco não é informado no layout, mas em
  consulta ao apoio técnico da Serasa, fomos informados de que este bloco apenas
  consiste em uma mensagem.}
  TSeIP20_01_02 = class(TSeIP20_01)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_01_02_99 = class(TSeIP20_01_02)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  {"Informações comerciais".}
  TSeIP20_02 = class(TSeIP20_Detalhe)
  public
    class function ID: string; override;
  end;

  {"Fontes".}
  TSeIP20_02_01 = class(TSeIP20_02)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_02_01_99 = class(TSeIP20_02_01)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  {"Principais Fontes - Data da Última Atualização".}
  TSeIP20_02_01_00 = class(TSeIP20_02_01)
  private
    FDataAtualizacaoBloco: TDateTime;
    FSegmentoOrigemInformacao: Integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property DataAtualizacaoBloco: TDateTime read FDataAtualizacaoBloco;
    property SegmentoOrigemInformacao: Integer read FSegmentoOrigemInformacao;
  end;

  {esta classe registra fornecedores que sejam principais
  fontes. Ele implementa o "SetText" pois a implementação seria igual nas
  classes filhas (algo incomum neste layout, onde as informações não são
  dispostas na string em uma ordernação padrão).}
  TSeIP20_02_01_PrincipaisFontes = class(TSeIP20_02_01)
  private
    FNome: string;
    FCNPJ: string;
  protected
    procedure SetText(const Value: string); override;
  public
    property Nome: string read FNome;
    property CNPJ: string read FCNPJ;
  end;

  {"Pricipais Fontes".}
  TSeIP20_02_01_01 = class(TSeIP20_02_01_PrincipaisFontes)
  public
    class function Tipo: string; override;
  end;

  {esta classe registra totais de fontes de informações.
  Atualmente, esta classe não força as filhas a determinarem valores para as
  propriedades abaixo, embora poderia fazê-lo implementando-se "getters"
  abstratos para as propriedades, ou até mesmo implementar uma interface ao
  invés do uso desta classe.}
  TSeIP20_02_01_FontesInformacoes = class(TSeIP20_02_01)
  protected
    FQuantidadeFontes: Integer;
    FQuantidadeFontesPefilHistoricoPagamentos: Integer;
    FQuantidadeFontesEvolucaoCompromisso: Integer;
    FQuantidadeFontesReferenciaisNegocios: Integer;
    FQuantidadeFontesReferenciaisNegociosPagamentoAVista: Integer;
    FQuantidadeFontesHistoricoPagamentos: Integer;
  public
    property QuantidadeFontes: Integer read FQuantidadeFontes;
    property QuantidadeFontesPefilHistoricoPagamentos: Integer
      read FQuantidadeFontesPefilHistoricoPagamentos;
    property QuantidadeFontesEvolucaoCompromisso: Integer
      read FQuantidadeFontesEvolucaoCompromisso;
    property QuantidadeFontesReferenciaisNegocios: Integer
      read FQuantidadeFontesReferenciaisNegocios;
    property QuantidadeFontesReferenciaisNegociosPagamentoAVista: Integer
      read FQuantidadeFontesReferenciaisNegociosPagamentoAVista;
    property QuantidadeFontesHistoricoPagamentos: Integer
      read FQuantidadeFontesHistoricoPagamentos;
  end;

  {"Relacionamento com Fornecedores".}
  TSeIP20_02_01_02 = class(TSeIP20_02_01_FontesInformacoes)
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
  end;

  {"Relacionamento com Fornecedores - Por Período".}
  TSeIP20_02_01_03 = class(TSeIP20_02_01)
  private
    FDescricao: string;
    FQuantidade: Integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Descricao: string read FDescricao;
    property Quantidade: Integer read FQuantidade;
  end;

  TAnoMes = record
    Ano: Integer;
    Mes: Integer;
  end;

  {esta classe registra ano, mês e abreviação do mês de
  ocorrências.
  Atualmente, esta classe não força as filhas a determinarem valores para as
  propriedades abaixo, embora poderia fazê-lo implementando-se "getters"
  abstratos para as propriedades, ou até mesmo implementar uma interface ao
  invés do uso desta classe.}
  TSeIP20_02_01_Ocorrencias = class(TSeIP20_02_01)
  private
    function GetDescricaoMes: string;
  protected
    FAnoMes: TAnoMes;
  public
    property AnoMes: TAnoMes read FAnoMes;
    property DescricaoMes: string read GetDescricaoMes;
  end;

  {"Relacionamento com Fornecedores - Mais Antigo".}
  TSeIP20_02_01_04 = class(TSeIP20_02_01_Ocorrencias)
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
  end;

  {Há diversos registros ao longo do código que possuem
  exatamente estes mesmo tipos de informações ("Descrição", "Valor, etc.),
  embora pertenção a conTextos diferentes ("Pagamento", "AVencer", etc.).
  As propriedades são lidas do mesmo modo em todas as classes filhas.}
  TSeIP20_02_01_Ocorrencias_HistoricoEvolucao = class(TSeIP20_02_01_Ocorrencias)
  private
    FDescricao: string;
    FValor: Double;
    FPercentual: Double;
  protected
    procedure SetText(const Value: string); override;
  public
    property Descricao: string read FDescricao;
    property Valor: Double read FValor;
    property Percentual: Double read FPercentual;
  end;

  {"Histórico de Pagamentos (valores em R$)".}
  TSeIP20_02_01_05 = class(TSeIP20_02_01_Ocorrencias_HistoricoEvolucao)
  public
    class function Tipo: string; override;
  end;

  {há diversos registros ao longo do código que possuem
  exatamente estes mesmo tipos de informações ("Descrição", "Valor, etc.).
  As propriedades são lidas do mesmo modo em todas as classes filhas.}
  TSeIP20_02_01_Ocorrencias_VencidosAVencer = class(TSeIP20_02_01_Ocorrencias)
  private
    FVenvidos: Double;
    FAVencer: Double;
  protected
    procedure SetText(const Value: string); override;
  public
    property Vencidos: Double read FVenvidos;
    property AVencer: Double read FAVencer;
  end;

  {"Evolução de Compromissos de Fornecedores".}
  TSeIP20_02_01_06 = class(TSeIP20_02_01_Ocorrencias_VencidosAVencer)
  public
    class function Tipo: string; override;
  end;

  {há diversos registros ao longo do código que possuem
  exatamente estes mesmo tipos de informações ("Descrição", "Valor, etc.).
  As propriedades são lidas do mesmo modo em todas as classes filhas.}
  TSeIP20_02_01_PotencialCompra = class(TSeIP20_02_01)
  private
    FDescricao: string;
    FData: TDateTime;
    FValor: Double;
    FMedia: Double;
  protected
    procedure SetText(const Value: string); override;
  public
    property Descricao: string read FDescricao;
    property Data: TDateTime read FData;
    property Valor: Double read FValor;
    property Media: Double read FMedia;
  end;

  {"Referenciais de Negócios".}
  TSeIP20_02_01_07 = class(TSeIP20_02_01_PotencialCompra)
  public
    class function Tipo: string; override;
  end;

  {"Histórico de Pagamento(Qtde de títulos)".}
  TSeIP20_02_01_08 = class(TSeIP20_02_01)
  private
    FDescricao: string;
    FQuantidade: Integer;
    FPercentual: Double;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Descricao: string read FDescricao;
    property Quantidade: Integer read FQuantidade;
    property Percentual: Double read FPercentual;
  end;

  {esta classe registra fornecedores da empresa.
  Atualmente, esta classe não força as filhas a determinarem valores para as
  propriedades abaixo, embora poderia fazê-lo implementando-se "getters"
  abstratos para as propriedades, ou até mesmo implementar uma interface ao
  invés desta classe.}
  TSeIP20_02_01_Fornecedores = class(TSeIP20_02_01)
  protected
    FMnemonico: string;
    FDataAtualizacao: TDateTime;
    FSegmentoOrigemInformacao: Integer;
  public
    property Mnemonico: string read FMnemonico;
    property DataAtualizacao: TDateTime read FDataAtualizacao;
    property SegmentoOrigemInformacao: Integer read FSegmentoOrigemInformacao;
  end;

  {"Referenciais de Negócios Analítico(Individual)".}
  TSeIP20_02_01_09 = class(TSeIP20_02_01_Fornecedores)
  private
    FDataUltimaCompra: TDateTime;
    FValorUltimaCompra: Double;
    FDataMaiorFatura: TDateTime;
    FValorMaiorFatura: Double;
    FDataMaiorAcumulo: TDateTime;
    FValorMaiorAcumulo: Double;
    FAVista: Boolean;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property DataUltimaCompra: TDateTime read FDataUltimaCompra;
    property ValorUltimaCompra: Double read FValorUltimaCompra;
    property DataMaiorFatura: TDateTime read FDataMaiorFatura;
    property ValorMaiorFatura: Double read FValorMaiorFatura;
    property DataMaiorAcumulo: TDateTime read FDataMaiorAcumulo;
    property ValorMaiorAcumulo: Double read FValorMaiorAcumulo;
    property AVista: Boolean read FAVista;
  end;

  {"Compromissos Analítico(Individual)".}
  TSeIP20_02_01_10 = class(TSeIP20_02_01_Fornecedores)
  private
    FVencidos: Double;
    FAVencer: Double;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Vencidos: Double read FVencidos;
    property AVencer: Double read FAVencer;
  end;

  {"Principais Fontes - Data da Última Atualização - (Segmento
  Consolidado)".}
  TSeIP20_02_01_11 = class(TSeIP20_02_01)
  private
    FDataAtualizacaoBloco: TDateTime;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property DataAtualizacaoBloco: TDateTime read FDataAtualizacaoBloco;
  end;

  {"Pricipais Fontes(Segmento Consolidado)".}
  TSeIP20_02_01_12 = class(TSeIP20_02_01_PrincipaisFontes)
  public
    class function Tipo: string; override;
  end;

  {"Relacionamento com Fornecedores (Segmento Consolidado)".}
  TSeIP20_02_01_13 = class(TSeIP20_02_01_FontesInformacoes)
  private
    FSegmentoOrigemInformacao: Integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property SegmentoOrigemInformacao: Integer read FSegmentoOrigemInformacao;
  end;

  {"Relacionamento com Fornecedores - por Período- (Segmento
  Consolidado)".}
  TSeIP20_02_01_14 = class(TSeIP20_02_01)
  private
    FDescricao: string;
    FQuantidade: Integer;
    FSegmentoOrigemInformacao: Integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Descricao: string read FDescricao;
    property Quantidade: Integer read FQuantidade;
    property SegmentoOrigemInformacao: Integer read FSegmentoOrigemInformacao;
  end;

  {"Histórico de Pagamentos(Valores em R$) - (Segmento
  Consolidado)".}
  TSeIP20_02_01_15 = class(TSeIP20_02_01_Ocorrencias_HistoricoEvolucao)
  private
    FSegmentoOrigemInformacao: Integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property SegmentoOrigemInformacao: Integer read FSegmentoOrigemInformacao;
  end;

  {"Evolução dos Compromissos com Fornecedores - (Segmento
  Consolidado)".}
  TSeIP20_02_01_16 = class(TSeIP20_02_01_Ocorrencias_VencidosAVencer)
  private
    FSegmentoOrigemInformacao: Integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property SegmentoOrigemInformacao: Integer read FSegmentoOrigemInformacao;
  end;

  {"Referenciais de Negócios - (Segmento Consolidado)".}
  TSeIP20_02_01_17 = class(TSeIP20_02_01_PotencialCompra)
  private
    FSegmentoOrigemInformacao: Integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property SegmentoOrigemInformacao: Integer read FSegmentoOrigemInformacao;
  end;

  {"Histórico de Pagamentos (valores em R$)(Individual)".}
  TSeIP20_02_01_18 = class(TSeIP20_02_01_Fornecedores)
  private
    FDataMaiorValor: Double;
    FMaiorValor: Double;
    FDataAtraso: TDateTime;
    FDiasAtraso: Integer;
    FDiasPositivo: Boolean;
    FPagamentos: Double;
    FPagamentosAtrasados: Double;
    FMediaDiasAtraso: Integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property DataMaiorValor: Double read FDataMaiorValor;
    property MaiorValor: Double read FMaiorValor;
    property DataAtraso: TDateTime read FDataAtraso;
    property DiasAtraso: Integer read FDiasAtraso;
    property DiasPositivo: Boolean read FDiasPositivo;
    property Pagamentos: Double read FPagamentos;
    property PagamentosAtrasados: Double read FPagamentosAtrasados;
    property MediaDiasAtraso: Integer read FMediaDiasAtraso;
  end;

  {"Relacionamento com Fornecedores(Individual)".}
  TSeIP20_02_01_19 = class(TSeIP20_02_01_Fornecedores)
  private
    FClienteDesde: TDateTime;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property ClienteDesde: TDateTime read FClienteDesde;
  end;

  {"Evolução de Compromissos Vencidos - (Segmento
  Consolidado)".}
  TSeIP20_02_01_20 = class(TSeIP20_02_01_Ocorrencias_HistoricoEvolucao)
  private
    FSegmentoOrigemInformacao: Integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property SegmentoOrigemInformacao: Integer read FSegmentoOrigemInformacao;
  end;

  {"Evolução de Compromissos a Vencer - (Segmento
  Consolidado)".}
  TSeIP20_02_01_21 = class(TSeIP20_02_01_Ocorrencias_HistoricoEvolucao)
  public
    class function Tipo: string; override;
  end;

  {"Histórico de Pagamentos visão cedente (valores em R$)".}
  TSeIP20_02_01_25 = class(TSeIP20_02_01_Ocorrencias_HistoricoEvolucao)
  public
    class function Tipo: string; override;
  end;

  {"Evolução de Compromissos com Fornecedores visão cedente".}
  TSeIP20_02_01_26 = class(TSeIP20_02_01_Ocorrencias_VencidosAVencer)
  public
    class function Tipo: string; override;
  end;

  {"Referenciais de Negócios visão cedente".}
  TSeIP20_02_01_27 = class(TSeIP20_02_01_PotencialCompra)
  public
    class function Tipo: string; override;
  end;

  {"Referenciais de Negócios visão cedente".}
  TSeIP20_02_01_28 = class(TSeIP20_02_01_PotencialCompra)
  public
    class function Tipo: string; override;
  end;
  
  {"Passagem".}
  TSeIP20_03 = class(TSeIP20_Detalhe)
  public
    class function ID: string; override;
  end;

  {"Controle".}
  TSeIP20_03_01 = class(TSeIP20_03)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_03_01_99 = class(TSeIP20_03_01)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  {"Registro de Consultas".}
  TSeIP20_03_01_01 = class(TSeIP20_03_01)
  private
    FAnoMes: TAnoMes;
    FConsultasEmpresa: Integer;
    FConsultasBanco: Integer;
    function GetDescricaoMes: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property AnoMes: TAnoMes read FAnoMes;
    property DescricaoMes: string read GetDescricaoMes;
    property ConsultasEmpresa: Integer read FConsultasEmpresa;
    property ConsultasBanco: Integer read FConsultasBanco;
  end;

  {"Últimas Consultas".}
  TSeIP20_03_01_02 = class(TSeIP20_03_01)
  private
    FData: TDateTime;
    FNome: string;
    FConsultasNoDiaPorCliente: Integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Data: TDateTime read FData;
    property Nome: string read FNome;
    property ConsultasNoDiaPorCliente: Integer read FConsultasNoDiaPorCliente;
  end;

  {"Alerta - Feature".}
  TSeIP20_03_01_03 = class(TSeIP20_03_01)
  private
    FAlerta: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Alerta: string read FAlerta;
  end;

  {"Apontamentos".}
  TSeIP20_04 = class(TSeIP20_Detalhe)
  public
    class function ID: string; override;
  end;

  {"Pefin/Refin".}
  TSeIP20_04_01 = class(TSeIP20_04)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_04_01_99 = class(TSeIP20_04_01)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  TSubJudice = record
    Praca: string;
    Distrito: string;
    Vara: string;
    Data: TDateTime;
    Processo: string;
  end;

  {esta implementação é válida para o "Pefin" e o "Refin"}
  TSeIP20_04_01_ValoresFinanceiros = class(TSeIP20_04_01)
  private
    FQuantidade: Integer;
    FQuantidadeUltimaOcorrencia: Integer;
    FData: TDateTime;
    FTituloOcorrencia: string;
    FAvalista: Boolean;
    FValor: Double;
    FContrato: string;
    FOrigem: string;
    FFilial: string;
    FSubJudice: TSubJudice;
    FCodigoNatureza: string;
  protected
    function GetNatureza: string; virtual; abstract;
    procedure SetText(const Value: string); override;
  public
    property Quantidade: Integer read FQuantidade;
    property QuantidadeUltimaOcorrencia: Integer
      read FQuantidadeUltimaOcorrencia;
    property Data: TDateTime read FData;
    property TituloOcorrencia: string read FTituloOcorrencia;
    property Avalista: Boolean read FAvalista;
    property Valor: Double read FValor;
    property Contrato: string read FContrato;
    property Origem: string read FOrigem;
    property Filial: string read FFilial;
    property SubJudice: TSubJudice read FSubJudice;
    property CodigoNatureza: string read FCodigoNatureza;
    property Natureza: string read GetNatureza;
  end;

  {"Pendências Financeiras - Pefin".}
  TSeIP20_04_01_01 = class(TSeIP20_04_01_ValoresFinanceiros)
  protected
    function GetNatureza: string; override;
  public
    class function Tipo: string; override;
  end;

  {"Pendências Financeiras - Refin".}
  TSeIP20_04_01_02 = class(TSeIP20_04_01_ValoresFinanceiros)
  protected
    function GetNatureza: string; override;
  public
    class function Tipo: string; override;
  end;

  {"Informações resumo".}
  TSeIP20_04_02 = class(TSeIP20_04)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_04_02_99 = class(TSeIP20_04_02)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  {"Informações do Concentre - Grafias".}
  TSeIP20_04_02_01 = class(TSeIP20_04_02)
  private
    FGrafias: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Grafias: string read FGrafias;
  end;

  {"Informações do Concentre - Resumo".}
  TSeIP20_04_02_02 = class(TSeIP20_04_02)
  private
    FQuantidade: Integer;
    FGrupo: string;
    FAnoMesInicial: TAnoMes;
    FAnoMesFinal: TAnoMes;
    FMoeda: string;
    FValor: Double;
    FOrigem: string;
    FAgencia: string;
    FTotalProtesto: Double;
    FCodigoNatureza: string;
    function GetDescricaoMesFinal: string;
    function GetDescricaoMesInicial: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Quantidade: Integer read FQuantidade;
    property Grupo: string read FGrupo;
    property AnoMesInicial: TAnoMes read FAnoMesInicial;
    property DescricaoMesInicial: string read GetDescricaoMesInicial;
    property AnoMesFinal: TAnoMes read FAnoMesFinal;
    property DescricaoMesFinal: string read GetDescricaoMesFinal;
    property Moeda: string read FMoeda;
    property Valor: Double read FValor;
    property Origem: string read FOrigem;
    property Agencia: string read FAgencia;
    property TotalProtesto: Double read FTotalProtesto;
    property CodigoNatureza: string read FCodigoNatureza;
  end;

  {"Informações do Concentre - Inapto".}
  TSeIP20_04_02_03 = class(TSeIP20_04_02)
  private
    FQuantidade: Integer;
    FDescricao: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Quantidade: Integer read FQuantidade;
    property Descricao: string read FDescricao;
  end;

  {"Protestos".}
  TSeIP20_04_03 = class(TSeIP20_04)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_04_03_99 = class(TSeIP20_04_03)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  {"Informações do Concentre (Protestos)".}
  TSeIP20_04_03_01 = class(TSeIP20_04_03)
  private
    FQuantidade: Integer;
    FData: TDateTime;
    FMoeda: string;
    FValor: Double;
    FCartorio: string;
    FCidade: string;
    FUF: string;
    FSubJudice: TSubJudice;
    FCodigoNatureza: string;
    FCodigoTipoCartaAnuencia: Char;
    FDataCartaAnuencia: TDateTime;
    function GetTipoCartaAnuencia: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Quantidade: Integer read FQuantidade;
    property Data: TDateTime read FData;
    property Moeda: string read FMoeda;
    property Valor: Double read FValor;
    property Cartorio: string read FCartorio;
    property Cidade: string read FCidade;
    property UF: string read FUF;
    property SubJudice: TSubJudice read FSubJudice;
    property CodigoNatureza: string read FCodigoNatureza;
    property CodigoTipoCartaAnuencia: Char read FCodigoTipoCartaAnuencia;
    property TipoCartaAnuencia: string read GetTipoCartaAnuencia;
    property DataCartaAnuencia: TDateTime read FDataCartaAnuencia;
  end;

  {"Ações".}
  TSeIP20_04_04 = class(TSeIP20_04)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_04_04_99 = class(TSeIP20_04_04)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  {"Informações do Concentre (Ação Judicial)".}
  TSeIP20_04_04_01 = class(TSeIP20_04_04)
  private
    FQuantidade: Integer;
    FData: TDateTime;
    FNaturezaAcao: string;
    FAvalista: Boolean;
    FMoeda: string;
    FValor: Double;
    FDistrito: string;
    FVara: string;
    FCidade: string;
    FUF: string;
    FSubJudice: TSubJudice;
    FCodigoNatureza: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Quantidade: Integer read FQuantidade;
    property Data: TDateTime read FData;
    property NaturezaAcao: string read FNaturezaAcao;
    property Avalista: Boolean read FAvalista;
    property Moeda: string read FMoeda;
    property Valor: Double read FValor;
    property Distrito: string read FDistrito;
    property Vara: string read FVara;
    property Cidade: string read FCidade;
    property UF: string read FUF;
    property SubJudice: TSubJudice read FSubJudice;
    property CodigoNatureza: string read FCodigoNatureza;
  end;

  {"Participação em falência".}
  TSeIP20_04_05 = class(TSeIP20_04)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_04_05_99 = class(TSeIP20_04_05)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  {"Informações do Concentre (Participação em Falência)".}
  TSeIP20_04_05_01 = class(TSeIP20_04_05)
  private
    FQuantidade: Integer;
    FData: TDateTime;
    FDescricao: string;
    FCNPJ: string;
    FNome: string;
    FCodigoNatureza: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Quantidade: Integer read FQuantidade;
    property Data: TDateTime read FData;
    property Descricao: string read FDescricao;
    property CNPJ: string read FCNPJ;
    property Nome: string read FNome;
    property CodigoNatureza: string read FCodigoNatureza;
  end;

  {"Facon".}
  TSeIP20_04_06 = class(TSeIP20_04)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_04_06_99 = class(TSeIP20_04_06)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  {"Informações do Concentre (Falência e Concordata)".}
  TSeIP20_04_06_01 = class(TSeIP20_04_06)
  private
    FQuantidade: Integer;
    FData: TDateTime;
    FDescricao: string;
    FOrigem: string;
    FVara: string;
    FCidade: string;
    FUF: string;
    FCodigoNatureza: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Quantidade: Integer read FQuantidade;
    property Data: TDateTime read FData;
    property Descricao: string read FDescricao;
    property Origem: string read FOrigem;
    property Vara: string read FVara;
    property Cidade: string read FCidade;
    property UF: string read FUF;
    property CodigoNatureza: string read FCodigoNatureza;
  end;

  {"Dívidas vencidas".}
  TSeIP20_04_07 = class(TSeIP20_04)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_04_07_99 = class(TSeIP20_04_07)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  {"Informações do Concentre (Dívidas Vencidas)".}
  TSeIP20_04_07_01 = class(TSeIP20_04_07)
  private
    FQuantidade: Integer;
    FData: TDateTime;
    FDescricao: string;
    FMoeda: string;
    FValor: Double;
    FTituloOcorrencia: string;
    FInstituicaoFinanceira: string;
    FLocal: string;
    FCodigoNatureza: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Quantidade: Integer read FQuantidade;
    property Data: TDateTime read FData;
    property Descricao: string read FDescricao;
    property Moeda: string read FMoeda;
    property Valor: Double read FValor;
    property TituloOcorrencia: string read FTituloOcorrencia;
    property InstituicaoFinanceira: string read FInstituicaoFinanceira;
    property Local: string read FLocal;
    property CodigoNatureza: string read FCodigoNatureza;
  end;

  {"Achei".}
  TSeIP20_04_08 = class(TSeIP20_04)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_04_08_99 = class(TSeIP20_04_08)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  {"Informações do Recheque (Cheque sem Fundo-Achei)".}
  TSeIP20_04_08_01 = class(TSeIP20_04_08)
  private
    FQuantidade: Integer;
    FData: TDateTime;
    FNumeroCheque: string;
    FAlinea: Integer;
    FQuantidadeNoBanco: Integer;
    FMoeda: string;
    FValor: Double;
    FBanco: string;
    FAgencia: string;
    FCidade: string;
    FUF: string;
    FCodigoNatureza: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Quantidade: Integer read FQuantidade;
    property Data: TDateTime read FData;
    property NumeroCheque: string read FNumeroCheque;
    property Alinea: Integer read FAlinea;
    property QuantidadeNoBanco: Integer read FQuantidadeNoBanco;
    property Moeda: string read FMoeda;
    property Valor: Double read FValor;
    property Banco: string read FBanco;
    property Agencia: string read FAgencia;
    property Cidade: string read FCidade;
    property UF: string read FUF;
    property CodigoNatureza: string read FCodigoNatureza;
  end;

  {"Achei-CCF".}
  TSeIP20_04_09 = class(TSeIP20_04)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_04_09_99 = class(TSeIP20_04_09)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  {"Informações do Recheque (Cheque sem Fundo-Achei CCF)".}
  TSeIP20_04_09_01 = class(TSeIP20_04_09)
  private
    FQuantidade: Integer;
    FData: TDateTime;
    FNumeroCheque: string;
    FQuantidadeNoBanco: Integer;
    FBanco: string;
    FAgencia: string;
    FCidade: string;
    FUF: string;
    FCodigoNatureza: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Quantidade: Integer read FQuantidade;
    property Data: TDateTime read FData;
    property NumeroCheque: string read FNumeroCheque;
    property QuantidadeNoBanco: Integer read FQuantidadeNoBanco;
    property Banco: string read FBanco;
    property Agencia: string read FAgencia;
    property Cidade: string read FCidade;
    property UF: string read FUF;
    property CodigoNatureza: string read FCodigoNatureza;
  end;

  {"Recheque".}
  TSeIP20_04_10 = class(TSeIP20_04)
  public
    class function Bloco: string; override;
  end;

  {"Mensagem de Bloco".}
  TSeIP20_04_10_99 = class(TSeIP20_04_10)
  private
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Mensagem: string read FMensagem;
  end;

  {"Informações do Recheque (Qtd. e Ultima Ocorrencia)".}
  TSeIP20_04_10_00 = class(TSeIP20_04_10)
  private
    FQuantidade: Integer;
    FQuantidadeUltimaOcorrencia: Integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Quantidade: Integer read FQuantidade;
    property QuantidadeUltimaOcorrencia: Integer
      read FQuantidadeUltimaOcorrencia;
  end;

  {"Informações do Recheque (Detalhes)".}
  TSeIP20_04_10_01 = class(TSeIP20_04_10)
  private
    FData: TDateTime;
    FBanco: string;
    FAgencia: string;
    FConta: string;
    FDigitoConta: Char;
    FChequeInicial: string;
    FChequeFinal: string;
    FMotivo: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Data: TDateTime read FData;
    property Banco: string read FBanco;
    property Agencia: string read FAgencia;
    property Conta: string read FConta;
    property DigitoConta: Char read FDigitoConta;
    property ChequeInicial: string read FChequeInicial;
    property ChequeFinal: string read FChequeFinal;
    property Motivo: string read FMotivo;
  end;

  {"Riskscoring".}
  TSeIP20_07 = class(TSeIP20_Detalhe)
  public
    class function ID: string; override;
  end;

  {"Cálculo".}
  TSeIP20_07_01 = class(TSeIP20_07)
  public
    class function Bloco: string; override;
  end;

  {"Informações de Riskscoring/Autorizador".}
  TSeIP20_07_01_99 = class(TSeIP20_07_01)
  private
    FMensagem: string;
    FDataHora: TDateTime;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property DataHora: TDateTime read FDataHora;
    property Mensagem: string read FMensagem;
  end;

  {esta classe registra fatores do "Riskscoring" para meses.
  Atualmente, esta classe não força as filhas a determinarem valores para as
  propriedades abaixo, embora poderia fazê-lo implementando-se "getters"
  abstratos para as propriedades, ou até mesmo implementar uma interface ao
  invés desta classe.}
  TSeIP20_07_01_RiskscoringMeses = class(TSeIP20_07_01)
  protected
    FDataHora: TDateTime;
    FFatorRiskscoring: Double;
    FFatorPrinad: Double;
  public
    property DataHora: TDateTime read FDataHora;
    property FatorRiskscoring: Double read FFatorRiskscoring;
    property FatorPrinad: Double read FFatorPrinad;
  end;

  {"Informações de Riskscoring/Prinad (12 Meses)".}
  TSeIP20_07_01_01 = class(TSeIP20_07_01_RiskscoringMeses)
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
  end;

  {esta classe registra fatores autorizadores "B", "P" e "Q".}
  TSeIP20_07_01_FatoresAutorizadores = class(TSeIP20_07_01)
  private
    FDataHora: TDateTime;
    FFatorAutorizador: string;
    FCodigoCNAE: string;
  protected
    procedure SetText(const Value: string); override;
  public
    property DataHora: TDateTime read FDataHora;
    property FatorAutorizador: string read FFatorAutorizador;
    property CodigoCNAE: string read FCodigoCNAE;
  end;

  {"Informações de Autorizador (B)".}
  TSeIP20_07_01_02 = class(TSeIP20_07_01_FatoresAutorizadores)
  public
    class function Tipo: string; override;
  end;

  {"Informações de Autorizador (P) (Q)".}
  TSeIP20_07_01_03 = class(TSeIP20_07_01_FatoresAutorizadores)
  public
    class function Tipo: string; override;
  end;

  {"Informações do Autorizador (H)".}
  TSeIP20_07_01_04 = class(TSeIP20_07_01)
  private
    FDataHora: TDateTime;
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property DataHora: TDateTime read FDataHora;
    property Mensagem: string read FMensagem;
  end;

  {"Informações do Autorizador (E)".}
  TSeIP20_07_01_05 = class(TSeIP20_07_01)
  private
    FDataHora: TDateTime;
    FFatorAutorizador: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property DataHora: TDateTime read FDataHora;
    property FatorAutorizador: string read FFatorAutorizador;
  end;

  {"Informações de Riskscoring/Prinad".}
  TSeIP20_07_01_06 = class(TSeIP20_07_01)
  private
    FDataHora: TDateTime;
    FMensagem: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property DataHora: TDateTime read FDataHora;
    property Mensagem: string read FMensagem;
  end;

  {"Informações de Riskscoring/Prinad (6 Meses)".}
  TSeIP20_07_01_09 = class(TSeIP20_07_01_RiskscoringMeses)
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
  end;

  TSeIP20_08 = class(TSeIP20_Detalhe)
  public
    class function ID: string; override;
  end;

  TSeIP20_08_01 = class(TSeIP20_08)
  public
    class function Bloco: string; override;
  end;

  TSeIP20_08_01_02 = class(TSeIP20_08_01)
  private
    FCodigoRetorno: string;
    FMensagem: string;
    function GetInclusaoEfetuada: Boolean;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property CodigoRetorno: string read FCodigoRetorno;
    property Mensagem: string read FMensagem;
    property InclusaoEfetuada: Boolean read GetInclusaoEfetuada;
  end;

  {"Relato formatado".}
  TSeIP20_99 = class(TSeIP20_Detalhe)
  public
    class function ID: string; override;
  end;

  {"Controle".}
  TSeIP20_99_00 = class(TSeIP20_99)
  public
    class function Bloco: string; override;
  end;

  {"Layout Formatado - Consulta Relato".}
  TSeIP20_99_00_00 = class(TSeIP20_99_00)
  private
    FCNPJ: string;
    FNome: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property CNPJ: string read FCNPJ;
    property Nome: string read FNome;
  end;

  {"Produto formatado".}
  TSeIP20_99_01 = class(TSeIP20_99)
  public
    class function Bloco: string; override;
  end;

  {"Layout Formatado - Consulta Relato".}
  TSeIP20_99_01_01 = class(TSeIP20_99_01)
  private
    FLinha: Integer;
    FLinhaEditada: string;
    FTipoRegistro: Char;
    FTipoLinha: Char;
    FAtributo: Char;
    FConjunto: Integer;
    FNomeBloco: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Linha: Integer read FLinha write FLinha;
    property LinhaEditada: string read FLinhaEditada;
    property TipoRegistro: Char read FTipoRegistro;
    property TipoLinha: Char read FTipoLinha;
    property Atributo: Char read FAtributo;
    property Conjunto: Integer read FConjunto;
    property NomeBloco: string read FNomeBloco;
  end;

  TSeIP20_89 = class(TSeIP20_Detalhe)
  public
    class function ID: string; override;
  end;

  TSeIP20_89_00 = class(TSeIP20_89)
  public
    class function Bloco: string; override;
  end;

  TSeIP20_89_00_00 = class(TSeIP20_89_00)
  private
    FCNPJ: string;
    FUserId: string;
    FDataHora: TDateTime;
    FTrans: string;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property CNPJ: string read FCNPJ;
    property UserId: string read FUserId;
    property DataHora: TDateTime read FDataHora;
    property Trans: string read FTrans;
  end;

  TSeIP20_89_01 = class(TSeIP20_89)
  public
    class function Bloco: string; override;
  end;

  TSeIP20_89_01_01 = class(TSeIP20_89_01)
  private
    FDesPer: string;
    FValVencCli: Double;
    FValVencOut: Double;
    FQtdVencFact: integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property DesPer: string read FDesPer;
    property ValVencCli: Double read FValVencCli;
    property ValVencOut: Double read FValVencOut;
    property QtdVencFact: integer read FQtdVencFact;
  end;

  TSeIP20_89_01_02 = class(TSeIP20_89_01)
  private
    FDesPer: string;
    FValAVencCli: Double;
    FValAVencOut: Double;
    FQtdAVencFact: integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property DesPer: string read FDesPer;
    property ValAVencCli: Double read FValAVencCli;
    property ValAVencOut: Double read FValAVencOut;
    property QtdAVencFact: integer read FQtdAVencFact;
  end;

  TSeIP20_89_01_03 = class(TSeIP20_89_01)
  private
    FAno1Prf: integer;
    FMes1Prf: integer;
    FMesDesp: string;
    FValVencCli: Double;
    FValVencOut: Double;
    FQtdVencFact: integer;
    FValAVencCli: Double;
    FValAVencOut: Double;
    FQtdAVencFact: integer;
    FTotValAbr: Double;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Ano1Prf: integer read FAno1Prf;
    property Mes1Prf: integer read FMes1Prf;
    property MesDesp: string read FMesDesp;
    property ValVencCli: Double read FValVencCli;
    property ValVencOut: Double read FValVencOut;
    property QtdVencFact: integer read FQtdVencFact;
    property ValAVencCli: Double read FValAVencCli;
    property ValAVencOut: Double read FValAVencOut;
    property QtdAVencFact: integer read FQtdAVencFact;
    property TotValAbr: Double read FTotValAbr;
  end;

  TSeIP20_89_02 = class(TSeIP20_89)
  public
    class function Bloco: string; override;
  end;

  TSeIP20_89_02_01 = class(TSeIP20_89_02)
  private
    FAno1Prf: integer;
    FMes1Prf: integer;
    FMesDesp: string;
    FQtdCliPont: integer;
    FQtdCli815: integer;
    FQtdCli1630: integer;
    FQtdCli3160: integer;
    FQtdCliM60: integer;
    FQtdCliVist: integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Ano1Prf: integer read FAno1Prf;
    property Mes1Prf: integer read FMes1Prf;
    property MesDesp: string read FMesDesp;
    property QtdCliPont: integer read FQtdCliPont;
    property QtdCli815: integer read FQtdCli815;
    property QtdCli1630: integer read FQtdCli1630;
    property QtdCli3160: integer read FQtdCli3160;
    property QtdCliM60: integer read FQtdCliM60;
    property QtdCliVist: integer read FQtdCliVist;
  end;

  TSeIP20_89_02_02 = class(TSeIP20_89_02)
  private
    FAno1Prf: integer;
    FMes1Prf: integer;
    FMesDesp: string;
    FValCliPont: Double;
    FValCli815: Double;
    FValCli1630: Double;
    FValCli3160: Double;
    FValCliM60: Double;
    FValCliVist: Double;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Ano1Prf: integer read FAno1Prf;
    property Mes1Prf: integer read FMes1Prf;
    property MesDesp: string read FMesDesp;
    property ValCliPont: Double read FValCliPont;
    property ValCli815: Double read FValCli815;
    property ValCli1630: Double read FValCli1630;
    property ValCli3160: Double read FValCli3160;
    property ValCliM60: Double read FValCliM60;
    property ValCliVist: Double read FValCliVist;
  end;

  TSeIP20_89_02_03 = class(TSeIP20_89_02)
  private
    FAno1Prf: integer;
    FMes1Prf: integer;
    FMesDesp: string;
    FVlmCliPont: Double;
    FVlmCli815: Double;
    FVlmCli1630: Double;
    FVlmCli3160: Double;
    FVlmCliM60: Double;
    FVlmCliVist: Double;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Ano1Prf: integer read FAno1Prf;
    property Mes1Prf: integer read FMes1Prf;
    property MesDesp: string read FMesDesp;
    property VlmCliPont: Double read FVlmCliPont;
    property VlmCli815: Double read FVlmCli815;
    property VlmCli1630: Double read FVlmCli1630;
    property VlmCli3160: Double read FVlmCli3160;
    property VlmCliM60: Double read FVlmCliM60;
    property VlmCliVist: Double read FVlmCliVist;
  end;

  TSeIP20_89_02_04 = class(TSeIP20_89_02)
  private
    FTotCliPont: Double;
    FTotCli815: Double;
    FTotCli1630: Double;
    FTotCli3160: Double;
    FTotCliM60: Double;
    FTotCliVist: Double;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property TotCliPont: Double read FTotCliPont;
    property TotCli815: Double read FTotCli815;
    property TotCli1630: Double read FTotCli1630;
    property TotCli3160: Double read FTotCli3160;
    property TotCliM60: Double read FTotCliM60;
    property TotCliVist: Double read FTotCliVist;
  end;

  TSeIP20_89_02_05 = class(TSeIP20_89_02)
  private
    FAno1Prf: integer;
    FMes1Prf: integer;
    FMesDesp: string;
    FQtdOutPont: integer;
    FQtdOut815: integer;
    FQtdOut1630: integer;
    FQtdOut3160: integer;
    FQtdOutM60: integer;
    FQtdOutVist: integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Ano1Prf: integer read FAno1Prf;
    property Mes1Prf: integer read FMes1Prf;
    property MesDesp: string read FMesDesp;
    property QtdOutPont: integer read FQtdOutPont;
    property QtdOut815: integer read FQtdOut815;
    property QtdOut1630: integer read FQtdOut1630;
    property QtdOut3160: integer read FQtdOut3160;
    property QtdOutM60: integer read FQtdOutM60;
    property QtdOutVist: integer read FQtdOutVist;
  end;

  TSeIP20_89_02_06 = class(TSeIP20_89_02)
  private
    FAno1Prf: integer;
    FMes1Prf: integer;
    FMesDesp: string;
    FValOutPont: Double;
    FValOut815: Double;
    FValOut1630: Double;
    FValOut3160: Double;
    FValOutM60: Double;
    FValOutVist: Double;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Ano1Prf: integer read FAno1Prf;
    property Mes1Prf: integer read FMes1Prf;
    property MesDesp: string read FMesDesp;
    property ValOutPont: Double read FValOutPont;
    property ValOut815: Double read FValOut815;
    property ValOut1630: Double read FValOut1630;
    property ValOut3160: Double read FValOut3160;
    property ValOutM60: Double read FValOutM60;
    property ValOutVist: Double read FValOutVist;
  end;

  TSeIP20_89_02_07 = class(TSeIP20_89_02)
  private
    FAno1Prf: integer;
    FMes1Prf: integer;
    FMesDesp: string;
    FVlmOutPont: Double;
    FVlmOut815: Double;
    FVlmOut1630: Double;
    FVlmOut3160: Double;
    FVlmOutM60: Double;
    FVlmOutVist: Double;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Ano1Prf: integer read FAno1Prf;
    property Mes1Prf: integer read FMes1Prf;
    property MesDesp: string read FMesDesp;
    property VlmOutPont: Double read FVlmOutPont;
    property VlmOut815: Double read FVlmOut815;
    property VlmOut1630: Double read FVlmOut1630;
    property VlmOut3160: Double read FVlmOut3160;
    property VlmOutM60: Double read FVlmOutM60;
    property VlmOutVist: Double read FVlmOutVist;
  end;

  TSeIP20_89_02_08 = class(TSeIP20_89_02)
  private
    FAno1Prf: integer;
    FMes1Prf: integer;
    FMesDesp: string;
    FQtdFacPont: integer;
    FQtdFac815: integer;
    FQtdFac1630: integer;
    FQtdFac3160: integer;
    FQtdFacM60: integer;
    FQtdFacVist: integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Ano1Prf: integer read FAno1Prf;
    property Mes1Prf: integer read FMes1Prf;
    property MesDesp: string read FMesDesp;
    property QtdFacPont: integer read FQtdFacPont;
    property QtdFac815: integer read FQtdFac815;
    property QtdFac1630: integer read FQtdFac1630;
    property QtdFac3160: integer read FQtdFac3160;
    property QtdFacM60: integer read FQtdFacM60;
    property QtdFacVist: integer read FQtdFacVist;
  end;

  TSeIP20_89_02_09 = class(TSeIP20_89_02)
  private
    FTotOutPont: Double;
    FTotOut815: Double;
    FTotOut1630: Double;
    FTotOut3160: Double;
    FTotOutM60: Double;
    FTotOutCedVist: Double;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property TotOutPont: Double read FTotOutPont;
    property TotOut815: Double read FTotOut815;
    property TotOut1630: Double read FTotOut1630;
    property TotOut3160: Double read FTotOut3160;
    property TotOutM60: Double read FTotOutM60;
    property TotOutCedVist: Double read FTotOutCedVist;
  end;

  TSeIP20_89_02_10 = class(TSeIP20_89_02)
  private
    FTotFacPont: Double;
    FTotFac815: Double;
    FTotFac1630: Double;
    FTotFac3160: Double;
    FTotFacM60: Double;
    FTotFacVist: Double;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property TotFacPont: Double read FTotFacPont;
    property TotFac815: Double read FTotFac815;
    property TotFac1630: Double read FTotFac1630;
    property TotFac3160: Double read FTotFac3160;
    property TotFacM60: Double read FTotFacM60;
    property TotFacVist: Double read FTotFacVist;
  end;

  TSeIP20_89_02_11 = class(TSeIP20_89_02)
  private
    FAno1Prf: integer;
    FMes1Prf: integer;
    FMesDesp: string;
    FPercCliQtde: Double;
    FPercCliVal: Double;
    FPercOutQtde: Double;
    FPercOutVal: Double;
    FQtdOutFact: integer;
  protected
    procedure SetText(const Value: string); override;
  public
    class function Tipo: string; override;
    property Ano1Prf: integer read FAno1Prf;
    property Mes1Prf: integer read FMes1Prf;
    property MesDesp: string read FMesDesp;
    property PercCliQtde: Double read FPercCliQtde;
    property PercCliVal: Double read FPercCliVal;
    property PercOutQtde: Double read FPercOutQtde;
    property PercOutVal: Double read FPercOutVal;
    property QtdOutFact: integer read FQtdOutFact;
  end;

  TRelatoSegmento = class(TObject)
  private
    FFormatadoControle: TSeIP20_99_00_00;
    FFormatadoLinhas: TObjectList;
    FPosicionalDadosControle: TSeIP20_01_00_00;
    FPosicionalFraseStatus: TSeIP20_01_01_00;
    FPosicionalContabilizacao: TSeIP20_01_01_01;
    FPosicionalIdentificacao: TSeIP20_01_01_02;
    FPosicionalEndereco: TSeIP20_01_01_03;
    FPosicionalLocalizacao: TSeIP20_01_01_04;
    FPosicionalAtividade: TSeIP20_01_01_05;
    FPosicionalFiliais: TObjectList;
    FPosicionalPrincipaisProdutos: TSeIP20_01_01_07;
    FPosicionalControleSocietario: TSeIP20_01_01_08;
    FPosicionalControleSocietarioDetalhe: TObjectList;
    FPosicionalControleAdministrativo: TObjectList;
    FPosicionalParticipacoesDetalhe: TObjectList;
    FPosicionalAntecessora: TSeIP20_01_01_16;
    FPosicionalPrincipaisFontes: TObjectList;
    FPosicionalRelacionamentoFornecedores: TObjectList;
    FPosicionalRelacionamentoFornecedoresPeriodo: TObjectList;
    FPosicionalRelacionamentoFornecedoresAntigos: TObjectList;
    FPosicionalHistoricoPagamento: TObjectList;
    FPosicionalEvolucaoCompromissos: TObjectList;
    FPosicionalReferenciaisNegocios: TObjectList;
    FPosicionalHistoricoPagamentoQuantidadeTitulos: TObjectList;
    FPosicionalReferenciaisNegociosAnalitico: TObjectList;
    FPosicionalCompromissosAnaliticos: TObjectList;
    FPosicionalPrincipaisFontesDataAtualizacao: TSeIP20_02_01_11;
    FPosicionalPrincipaisFontesSegmentoConsolidado: TObjectList;
    FPosicionalRelacionamentoFornecedoresSegmento: TObjectList;
    FPosicionalRelacionamentoFornecedoresPeriodoSegmento: TObjectList;
    FPosicionalHistoricoPagamentoSegmento: TObjectList;
    FPosicionalEvolucaoCompromissosSegmento: TObjectList;
    FPosicionalReferenciaisNegociosSegmento: TObjectList;
    FPosicionalHistoricoPagamentoIndividual: TObjectList;
    FPosicionalRelacionamentoFornecedoresIndividual: TObjectList;
    FPosicionalEvolucaoCompromissosVencidos: TObjectList;
    FPosicionalEvolucaoCompromissosAVencer: TObjectList;
    FPosicionalHistoricoPagamentosCedente: TObjectList;
    FPosicionalEvolucaoCompromissosCedente: TObjectList;
    FPosicionaReferenciaisNegociosCedente: TObjectList;
    FPosicionalRegistroConsultas: TObjectList;
    FPosicionalUltimasConsultas: TObjectList;
    FPosicionalAlerta: TObjectList;
    FPosicionalPefin: TObjectList;
    FPosicionalRefin: TObjectList;
    FPosicionalConcentre: TObjectList;
    FPosicionalConcentreResumo: TObjectList;
    FPosicionalConcentreInapto: TObjectList;
    FPosicionalConcentreProtesto: TObjectList;
    FPosicionalConcentreAcaoJudicial: TObjectList;
    FPosicionalConcentreFalencia: TObjectList;
    FPosicionalConcentreFalenciaConcordata: TObjectList;
    FPosicionalConcentreDividasVencidas: TObjectList;
    FPosicionalInformacoesRecheque: TObjectList;
    FPosicionalInformacoesRechequeCCF: TObjectList;
    FPosicionalInformacoesRechequeUltimaOcorrencia: TSeIP20_04_10_00;
    FPosicionalInformacoesRechequeDetalhe: TObjectList;
    FPosicionalInformacoesRiskscoring: TObjectList;
    FPosicionalInformacoesRiskscoringPrinad: TObjectList;
    FPosicionalRiskscoringMeses: TObjectList;
    FPosicionalRiskscoringPrinadMeses: TObjectList;
    FPosicionalFatoresAutorizadores: TObjectList;
    FPosicionalFatoresAutorizadoresPQ: TObjectList;
    FPosicionalInformacoesAutorizadoresH: TObjectList;
    FPosicionalInformacoesAutorizadoresE: TObjectList;
    FPosicionalInformacoesMonitore: TSeIP20_08_01_02;
    FCentralTitulosSegmentoRegistroControleContabilNRCT: TObjectList;
    FCentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT: TObjectList;
    FCentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT: TObjectList;
    FCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT: TObjectList;
    FCentralTitulosSegmentoRegistroControleContabil: TObjectList;
    FCentralTitulosSegmentoEvolucaoCompromissosVencidosCedente: TObjectList;
    FCentralTitulosSegmentoEvolucaoCompromissosAVencerCedente: TObjectList;
    FCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulos: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValor: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedio: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotal: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulos: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValor: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedio: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactorings: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotal: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactorings: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatistica: TObjectList;
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteSubGrupo: TObjectList;
    FNumero: Integer;
    FEstaCompleto: Boolean;
    function GetFormatadoLinhas(
      Index: Integer): TSeIP20_99_01_01;
    function GetPosicionalFiliais(Index: Integer): TSeIP20_01_01_06;
    function GetPosicionalControleSocietarioDetalhe(
      Index: Integer): TSeIP20_01_01_09;
    function GetPosicionalAdministrativo(
      Index: Integer): TSeIP20_01_01_11;
    function GetPosicionalParticipacoesDetalhe(
      Index: Integer): TSeIP20_01_01_14;
    function GetPosicionalRelacionamentoFornecedores(
      Index: Integer): TSeIP20_02_01_02;
    function GetPosicionalRelacionamentoFornecedoresPeriodo(
      Index: Integer): TSeIP20_02_01_03;
    function GetPosicionalRelacionamentoFornecedoresAntigos(
      Index: Integer): TSeIP20_02_01_04;
    function GetPosicionalHistoricoPagamento(
      Index: Integer): TSeIP20_02_01_05;
    function GetPosicionalEvolucaoCompromissos(
      Index: Integer): TSeIP20_02_01_06;
    function GetPosicionalReferenciaisNegocios(
      Index: Integer): TSeIP20_02_01_07;
    function GetPosicionalHistoricoPagamentoQuantidadeTitulos(
      Index: Integer): TSeIP20_02_01_08;
    function GetPosicionalReferenciaisNegociosAnalitico(
      Index: Integer): TSeIP20_02_01_09;
    function GetPosicionalCompromissosAnaliticos(
      Index: Integer): TSeIP20_02_01_10;
    function GetPosicionalPrincipaisFontesSegmentoConsolidado(Index: Integer): TSeIP20_02_01_12;
    function GetPosicionalRelacionamentoFornecedoresPeriodoSegmento(Index: Integer): TSeIP20_02_01_14;
    function GetPosicionalHistoricoPagamentoSegmento(Index: Integer): TSeIP20_02_01_15;
    function GetPosicionalEvolucaoCompromissosSegmento(
      Index: Integer): TSeIP20_02_01_16;
    function GetPosicionalReferenciaisNegociosSegmento(
      Index: Integer): TSeIP20_02_01_17;
    function GetPosicionalHistoricoPagamentoIndividual(
      Index: Integer): TSeIP20_02_01_18;
    function GetPosicionalRelacionamentoFornecedoresIndividual(
      Index: Integer): TSeIP20_02_01_19;
    function GetPosicionalEvolucaoCompromissosVencidos(
      Index: Integer): TSeIP20_02_01_20;
    function GetPosicionalAlerta(Index: Integer): TSeIP20_03_01_03;
    function GetPosicionalEvolucaoCompromissosCedente(
      Index: Integer): TSeIP20_02_01_26;
    function GetPosicionalFatoresAutorizadores(
      Index: Integer): TSeIP20_07_01_02;
    function GetPosicionalHistoricoPagamentosCedente(
      Index: Integer): TSeIP20_02_01_25;
    function GetPosicionalInformacoesAutorizadoresE(
      Index: Integer): TSeIP20_07_01_05;
    function GetPosicionalInformacoesAutorizadoresH(
      Index: Integer): TSeIP20_07_01_04;
    function GetPosicionalConcentreAcaoJudicial(
      Index: Integer): TSeIP20_04_04_01;
    function GetPosicionalConcentreDividasVencidas(
      Index: Integer): TSeIP20_04_07_01;
    function GetPosicionalConcentreFalencia(
      Index: Integer): TSeIP20_04_05_01;
    function GetPosicionalConcentreFalenciaConcordata(
      Index: Integer): TSeIP20_04_06_01;
    function GetPosicionalConcentreInapto(
      Index: Integer): TSeIP20_04_02_03;
    function GetPosicionalConcentreProtesto(
      Index: Integer): TSeIP20_04_03_01;
    function GetPosicionalConcentreResumo(
      Index: Integer): TSeIP20_04_02_02;
    function GetPosicionalInformacoesRecheque(
      Index: Integer): TSeIP20_04_08_01;
    function GetPosicionalInformacoesRechequeCCF(
      Index: Integer): TSeIP20_04_09_01;
    function GetPosicionalInformacoesRechequeDetalhe(
      Index: Integer): TSeIP20_04_10_01;
    function GetPosicionalInformacoesRiskscoring(
      Index: Integer): TSeIP20_07_01_99;
    function GetPosicionalPefin(Index: Integer): TSeIP20_04_01_01;
    function GetPosicionalRefin(Index: Integer): TSeIP20_04_01_02;
    function GetPosicionalRegistroConsultas(
      Index: Integer): TSeIP20_03_01_01;
    function GetPosicionalRiskscoringMeses(
      Index: Integer): TSeIP20_07_01_01;
    function GetPosicionalUltimasConsultas(
      Index: Integer): TSeIP20_03_01_02;
    function GetPosicionaReferenciaisNegociosCedente(
      Index: Integer): TSeIP20_02_01_27;
    function GetPosicionalEvolucaoCompromissosAVencer(
      Index: Integer): TSeIP20_02_01_21;
    function GetPosicionalPrincipaisFontes(
      Index: Integer): TSeIP20_02_01_01;
    function GetPosicionalFatoresAutorizadoresPQ(
      Index: Integer): TSeIP20_07_01_03;
    function GetPosicionalInformacoesRiskscoringPrinad(
      Index: Integer): TSeIP20_07_01_06;
    function GetPosicionalRiskscoringPrinadMeses(
      Index: Integer): TSeIP20_07_01_09;
    function GetPosicionalConcentre(
      Index: Integer): TSeIP20_04_02_01;
    function GetPosicionalRelacionamentoFornecedoresSegmento(
      Index: Integer): TSeIP20_02_01_13;
    function GetCentralTitulosSegmentoRegistroControleContabilNRCT(
      Index: Integer): TSeIP20_89_00_00;
    function GetCentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT(
      Index: Integer): TSeIP20_89_01_01;
    function GetCentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT(
      Index: Integer): TSeIP20_89_01_02;
    function GetCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT(
      Index: Integer): TSeIP20_89_01_03;
    function GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT(
      Index: Integer): TSeIP20_89_02_01;
    function GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT(
      Index: Integer): TSeIP20_89_02_02;
    function GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT(
      Index: Integer): TSeIP20_89_02_03;
    function GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT(
      Index: Integer): TSeIP20_89_02_04;
    function GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT(
      Index: Integer): TSeIP20_89_02_05;
    function GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT(
      Index: Integer): TSeIP20_89_02_06;
    function GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT(
      Index: Integer): TSeIP20_89_02_07;
    function GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT(
      Index: Integer): TSeIP20_89_02_08;
    function GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT(
      Index: Integer): TSeIP20_89_02_09;
    function GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT(
      Index: Integer): TSeIP20_89_02_10;
    function GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT(
      Index: Integer): TSeIP20_89_02_11;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AdicionaFormatadoLinhas(Se: TSeIP20_99_01_01);
    procedure AdicionaPosicionalFiliais(Se: TSeIP20_01_01_06);
    procedure AdicionaPosicionalControleSocietarioDetalhe(
      Se: TSeIP20_01_01_09);
    procedure AdicionaPosicionalControleAdministrativo(
      Se: TSeIP20_01_01_11);
    procedure AdicionaPosicionalParticipacoesDetalhe(
      Se: TSeIP20_01_01_14);
    procedure AdicionaPosicionalRelacionamentoFornecedores(
      Se: TSeIP20_02_01_02);
    procedure AdicionaPosicionalRelacionamentoFornecedoresPeriodo(
      Se: TSeIP20_02_01_03);
    procedure AdicionaPosicionalRelacionamentoFornecedoresAntigos(
      Se: TSeIP20_02_01_04);
    procedure AdicionaPosicionalHistoricoPagamento(
      Se: TSeIP20_02_01_05);
    procedure AdicionaPosicionalEvolucaoCompromissos(
      Se: TSeIP20_02_01_06);
    procedure AdicionaPosicionalReferenciaisNegocios(
      Se: TSeIP20_02_01_07);
    procedure AdicionaPosicionalHistoricoPagamentoQuantidadeTitulos(
      Se: TSeIP20_02_01_08);
    procedure AdicionaPosicionalReferenciaisNegociosAnalitico(
      Se: TSeIP20_02_01_09);
    procedure AdicionaPosicionalCompromissosAnaliticos(
      Se: TSeIP20_02_01_10);
    procedure AdicionaPosicionalPrincipaisFontesSegmentoConsolidado(
      Se: TSeIP20_02_01_12);
    procedure AdicionaPosicionalRelacionamentoFornecedoresPeriodoSegmento(
      Se: TSeIP20_02_01_14);
    procedure AdicionaPosicionalHistoricoPagamentoSegmento(
      Se: TSeIP20_02_01_15);
    procedure AdicionaPosicionalEvolucaoCompromissosSegmento(
      Se: TSeIP20_02_01_16);
    procedure AdicionaPosicionalReferenciaisNegociosSegmento(
      Se: TSeIP20_02_01_17);
    procedure AdicionaPosicionalHistoricoPagamentoIndividual(
      Se: TSeIP20_02_01_18);
    procedure AdicionaPosicionalRelacionamentoFornecedoresIndividual(
      Se: TSeIP20_02_01_19);
    procedure AdicionaPosicionalEvolucaoCompromissosVencidos(
      Se: TSeIP20_02_01_20);
    procedure AdicionaPosicionalPrincipaisFontes(Se: TSeIP20_02_01_01);
    procedure AdicionaPosicionalEvolucaoCompromissosAVencer(Se: TSeIP20_02_01_21);
    procedure AdicionaPosicionalHistoricoPagamentosCedente(Se: TSeIP20_02_01_25);
    procedure AdicionaPosicionalEvolucaoCompromissosCedente(Se: TSeIP20_02_01_26);
    procedure AdicionaPosicionaReferenciaisNegociosCedente(Se: TSeIP20_02_01_27);
    procedure AdicionaPosicionalRegistroConsultas(Se: TSeIP20_03_01_01);
    procedure AdicionaPosicionalUltimasConsultas(Se: TSeIP20_03_01_02);
    procedure AdicionaPosicionalAlerta(Se: TSeIP20_03_01_03);
    procedure AdicionaPosicionalPefin(Se: TSeIP20_04_01_01);
    procedure AdicionaPosicionalRefin(Se: TSeIP20_04_01_02);
    procedure AdicionaPosicionalConcentre(Se: TSeIP20_04_02_01);
    procedure AdicionaPosicionalConcentreResumo(Se: TSeIP20_04_02_02);
    procedure AdicionaPosicionalConcentreInapto(Se: TSeIP20_04_02_03);
    procedure AdicionaPosicionalConcentreProtesto(Se: TSeIP20_04_03_01);
    procedure AdicionaPosicionalConcentreAcaoJudicial(Se: TSeIP20_04_04_01);
    procedure AdicionaPosicionalConcentreFalencia(Se: TSeIP20_04_05_01);
    procedure AdicionaPosicionalConcentreFalenciaConcordata(Se: TSeIP20_04_06_01);
    procedure AdicionaPosicionalConcentreDividasVencidas(Se: TSeIP20_04_07_01);
    procedure AdicionaPosicionalInformacoesRecheque(Se: TSeIP20_04_08_01);
    procedure AdicionaPosicionalInformacoesRechequeCCF(Se: TSeIP20_04_09_01);
    procedure AdicionaPosicionalInformacoesRechequeDetalhe(Se: TSeIP20_04_10_01);
    procedure AdicionaPosicionalInformacoesRiskscoring(Se: TSeIP20_07_01_99);
    procedure AdicionaPosicionalRiskscoringMeses(Se: TSeIP20_07_01_01);
    procedure AdicionaPosicionalFatoresAutorizadores(Se: TSeIP20_07_01_02);
    procedure AdicionaPosicionalInformacoesAutorizadoresH(Se: TSeIP20_07_01_04);
    procedure AdicionaPosicionalInformacoesAutorizadoresE(Se: TSeIP20_07_01_05);
    procedure AdicionaPosicionalFatoresAutorizadoresPQ(Se: TSeIP20_07_01_03);
    procedure AdicionaPosicionalInformacoesRiskscoringPrinad(Se: TSeIP20_07_01_06);
    procedure AdicionaPosicionalRiskscoringPrinadMeses(Se: TSeIP20_07_01_09);
    procedure AdicionaPosicionalRelacionamentoFornecedoresSegmento(Se: TSeIP20_02_01_13);
    procedure AdicionaCentralTitulosSegmentoRegistroControleContabilNRCT(Se: TSeIP20_89_00_00);
    procedure AdicionaCentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT(Se: TSeIP20_89_01_01);
    procedure AdicionaCentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT(Se: TSeIP20_89_01_02);
    procedure AdicionaCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT(Se: TSeIP20_89_01_03);
    procedure AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT(Se: TSeIP20_89_02_01);
    procedure AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT(Se: TSeIP20_89_02_02);
    procedure AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT(Se: TSeIP20_89_02_03);
    procedure AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT(Se: TSeIP20_89_02_04);
    procedure AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT(Se: TSeIP20_89_02_05);
    procedure AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT(Se: TSeIP20_89_02_06);
    procedure AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT(Se: TSeIP20_89_02_07);
    procedure AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT(Se: TSeIP20_89_02_08);
    procedure AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT(Se: TSeIP20_89_02_09);
    procedure AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT(Se: TSeIP20_89_02_10);
    procedure AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT(Se: TSeIP20_89_02_11);
    function FormatadoLinhasQuantidade: Integer;
    function PosicionalFiliaisQuantidade: Integer;
    function PosicionalControleSocietarioDetalheQuantidade: Integer;
    function PosicionalControleAdministrativoQuantidade: Integer;
    function PosicionalParticipacoesDetalheQuantidade: Integer;
    function PosicionalRelacionamentoFornecedoresQuantidade: Integer;
    function PosicionalRelacionamentoFornecedoresPeriodoQuantidade: Integer;
    function PosicionalRelacionamentoFornecedoresAntigosQuantidade: Integer;
    function PosicionalHistoricoPagamentoQuantidade: Integer;
    function PosicionalEvolucaoCompromissosQuantidade: Integer;
    function PosicionalReferenciaisNegociosQuantidade: Integer;
    function PosicionalHistoricoPagamentoQuantidadeTitulosQuantidade: Integer;
    function PosicionalReferenciaisNegociosAnaliticoQuantidade: Integer;
    function PosicionalCompromissosAnaliticosQuantidade: Integer;
    function PosicionalPrincipaisFontesSegmentoConsolidadoQuantidade: Integer;
    function PosicionalRelacionamentoFornecedoresPeriodoSegmentoQuantidade:
      Integer;
    function PosicionalEvolucaoCompromissosSegmentoQuantidade: Integer;
    function PosicionalReferenciaisNegociosSegmentoQuantidade: Integer;
    function PosicionalHistoricoPagamentoIndividualQuantidade: Integer;
    function PosicionalRelacionamentoFornecedoresIndividualQuantidade: Integer;
    function PosicionalEvolucaoCompromissosVencidosQuantidade: Integer;
    function PosicionalEvolucaoCompromissosAVencerQuantidade: Integer;
    function PosicionalHistoricoPagamentosCedenteQuantidade: Integer;
    function PosicionalEvolucaoCompromissosCedenteQuantidade: Integer;
    function PosicionaReferenciaisNegociosCedenteQuantidade: Integer;
    function PosicionalRegistroConsultasQuantidade: Integer;
    function PosicionalUltimasConsultasQuantidade: Integer;
    function PosicionalAlertaQuantidade: Integer;
    function PosicionalPefinQuantidade: Integer;
    function PosicionalRefinQuantidade: Integer;
    function PosicionalConcentreQuantidade: Integer;
    function PosicionalConcentreResumoQuantidade: Integer;
    function PosicionalConcentreInaptoQuantidade: Integer;
    function PosicionalConcentreProtestoQuantidade: Integer;
    function PosicionalConcentreAcaoJudicialQuantidade: Integer;
    function PosicionalConcentreFalenciaQuantidade: Integer;
    function PosicionalConcentreFalenciaConcordataQuantidade: Integer;
    function PosicionalConcentreDividasVencidasQuantidade: Integer;
    function PosicionalInformacoesRechequeQuantidade: Integer;
    function PosicionalInformacoesRechequeCCFQuantidade: Integer;
    function PosicionalInformacoesRechequeDetalheQuantidade: Integer;
    function PosicionalInformacoesRiskscoringQuantidade: Integer;
    function PosicionalRiskscoringMesesQuantidade: Integer;
    function PosicionalFatoresAutorizadoresQuantidade: Integer;
    function PosicionalInformacoesAutorizadoresHQuantidade: Integer;
    function PosicionalInformacoesAutorizadoresEQuantidade: Integer;
    function PosicionalPrincipaisFontesQuantidade: Integer;
    function PosicionalHistoricoPagamentoSegmentoQuantidade: Integer;
    function PosicionalFatoresAutorizadoresPQQuantidade: Integer;
    function PosicionalInformacoesRiskscoringPrinadQuantidade: Integer;
    function PosicionalRiskscoringPrinadMesesQuantidade: Integer;
    function PosicionalRelacionamentoFornecedoresSegmentoQuantidade: Integer;
    function CentralTitulosSegmentoRegistroControleContabilQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaQuantidadeNRCT: Integer;
    function CentralTitulosSegmentoRegistroControleContabilQuantidade: Integer;
    function CentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteQuantidade: Integer;
    function CentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteQuantidade: Integer;
    function CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalQuantidade: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosQuantidade: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorQuantidade: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioQuantidade: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalQuantidade: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosQuantidade: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorQuantidade: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioQuantidade: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsQuantidade: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalQuantidade: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsQuantidade: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaQuantidade: Integer;
    function CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteSubGrupoQuantidade: Integer;
    property FormatadoControle: TSeIP20_99_00_00 read FFormatadoControle
      write FFormatadoControle;
    property FormatadoLinhas[Index: Integer]: TSeIP20_99_01_01
      read GetFormatadoLinhas;
    property Numero: Integer read FNumero write FNumero;
    property PosicionalDadosControle: TSeIP20_01_00_00
      read FPosicionalDadosControle write FPosicionalDadosControle;
    property PosicionalFraseStatus: TSeIP20_01_01_00
      read FPosicionalFraseStatus write FPosicionalFraseStatus;
    property PosicionalContabilizacao: TSeIP20_01_01_01
      read FPosicionalContabilizacao write FPosicionalContabilizacao;
    property PosicionalIdentificacao: TSeIP20_01_01_02
      read FPosicionalIdentificacao write FPosicionalIdentificacao;
    property PosicionalEndereco: TSeIP20_01_01_03
      read FPosicionalEndereco write FPosicionalEndereco;
    property PosicionalLocalizacao: TSeIP20_01_01_04
      read FPosicionalLocalizacao write FPosicionalLocalizacao;
    property PosicionalAtividade: TSeIP20_01_01_05
      read FPosicionalAtividade write FPosicionalAtividade;
    property PosicionalFiliais[Index: Integer]: TSeIP20_01_01_06
      read GetPosicionalFiliais;
    property PosicionalPrincipaisProdutos: TSeIP20_01_01_07
      read FPosicionalPrincipaisProdutos write FPosicionalPrincipaisProdutos;
    property  PosicionalControleSocietario: TSeIP20_01_01_08
      read FPosicionalControleSocietario write FPosicionalControleSocietario;
    property PosicionalControleSocietarioDetalhe[Index: Integer]: TSeIP20_01_01_09
      read GetPosicionalControleSocietarioDetalhe;
    property PosicionalControleAdministrativo[Index: Integer]: TSeIP20_01_01_11
      read GetPosicionalAdministrativo;
    property PosicionalParticipacoesDetalhe[Index: Integer]: TSeIP20_01_01_14
      read GetPosicionalParticipacoesDetalhe;
    property PosicionalAntecessora: TSeIP20_01_01_16
      read FPosicionalAntecessora write FPosicionalAntecessora;
    property PosicionalPrincipaisFontes[Index: Integer]: TSeIP20_02_01_01
      read GetPosicionalPrincipaisFontes;
    property PosicionalRelacionamentoFornecedores[Index: Integer]:
      TSeIP20_02_01_02 read GetPosicionalRelacionamentoFornecedores;
    property PosicionalRelacionamentoFornecedoresPeriodo[Index: Integer]:
      TSeIP20_02_01_03 read GetPosicionalRelacionamentoFornecedoresPeriodo;
    property PosicionalRelacionamentoFornecedoresAntigos[Index: Integer]:
      TSeIP20_02_01_04 read GetPosicionalRelacionamentoFornecedoresAntigos;
    property PosicionalHistoricoPagamento[Index: Integer]:
      TSeIP20_02_01_05 read GetPosicionalHistoricoPagamento;
    property PosicionalEvolucaoCompromissos[Index: Integer]:
      TSeIP20_02_01_06 read GetPosicionalEvolucaoCompromissos;
    property PosicionalReferenciaisNegocios[Index: Integer]:
      TSeIP20_02_01_07 read GetPosicionalReferenciaisNegocios;
    property PosicionalHistoricoPagamentoQuantidadeTitulos[Index: Integer]:
      TSeIP20_02_01_08 read GetPosicionalHistoricoPagamentoQuantidadeTitulos;
    property PosicionalReferenciaisNegociosAnalitico[Index: Integer]:
      TSeIP20_02_01_09 read GetPosicionalReferenciaisNegociosAnalitico;
    property PosicionalCompromissosAnaliticos[Index: Integer]:
      TSeIP20_02_01_10 read GetPosicionalCompromissosAnaliticos;
    property PosicionalPrincipaisFontesDataAtualizacao: TSeIP20_02_01_11
      read FPosicionalPrincipaisFontesDataAtualizacao
      write FPosicionalPrincipaisFontesDataAtualizacao;
    property PosicionalPrincipaisFontesSegmentoConsolidado[Index: Integer]:
      TSeIP20_02_01_12 read GetPosicionalPrincipaisFontesSegmentoConsolidado;
    property  PosicionalRelacionamentoFornecedoresSegmento[Index: Integer]:
      TSeIP20_02_01_13
      read GetPosicionalRelacionamentoFornecedoresSegmento;
    property PosicionalRelacionamentoFornecedoresPeriodoSegmento[Index:
       Integer]: TSeIP20_02_01_14
       read GetPosicionalRelacionamentoFornecedoresPeriodoSegmento;
    property  PosicionalHistoricoPagamentoSegmento[Index: Integer]:
      TSeIP20_02_01_15 read GetPosicionalHistoricoPagamentoSegmento;
    property  PosicionalEvolucaoCompromissosSegmento[Index: Integer]:
      TSeIP20_02_01_16 read GetPosicionalEvolucaoCompromissosSegmento;
    property  PosicionalReferenciaisNegociosSegmento[Index: Integer]:
      TSeIP20_02_01_17 read GetPosicionalReferenciaisNegociosSegmento;
    property  PosicionalHistoricoPagamentoIndividual[Index: Integer]:
      TSeIP20_02_01_18 read GetPosicionalHistoricoPagamentoIndividual;
    property  PosicionalRelacionamentoFornecedoresIndividual[Index: Integer]:
      TSeIP20_02_01_19 read GetPosicionalRelacionamentoFornecedoresIndividual;
    property  PosicionalEvolucaoCompromissosVencidos[Index: Integer]:
      TSeIP20_02_01_20 read GetPosicionalEvolucaoCompromissosVencidos;
    property PosicionalEvolucaoCompromissosAVencer[Index: Integer]:
      TSeIP20_02_01_21 read GetPosicionalEvolucaoCompromissosAVencer;
    property PosicionalHistoricoPagamentosCedente[Index: Integer]:
      TSeIP20_02_01_25 read GetPosicionalHistoricoPagamentosCedente;
    property PosicionalEvolucaoCompromissosCedente[Index: Integer]:
      TSeIP20_02_01_26 read GetPosicionalEvolucaoCompromissosCedente;
    property PosicionaReferenciaisNegociosCedente[Index: Integer]:
      TSeIP20_02_01_27 read GetPosicionaReferenciaisNegociosCedente;
    property PosicionalRegistroConsultas[Index: Integer]:
      TSeIP20_03_01_01 read GetPosicionalRegistroConsultas;
    property PosicionalUltimasConsultas[Index: Integer]:
      TSeIP20_03_01_02 read GetPosicionalUltimasConsultas;
    property PosicionalAlerta[Index: Integer]:
      TSeIP20_03_01_03 read GetPosicionalAlerta;
    property PosicionalPefin[Index: Integer]:
      TSeIP20_04_01_01 read GetPosicionalPefin;
    property PosicionalRefin[Index: Integer]:
      TSeIP20_04_01_02 read GetPosicionalRefin;
    property PosicionalConcentre[Index: Integer]:
      TSeIP20_04_02_01
      read GetPosicionalConcentre;
    property PosicionalConcentreResumo[Index: Integer]:
      TSeIP20_04_02_02 read GetPosicionalConcentreResumo;
    property PosicionalConcentreInapto[Index: Integer]:
      TSeIP20_04_02_03 read GetPosicionalConcentreInapto;
    property PosicionalConcentreProtesto[Index: Integer]:
      TSeIP20_04_03_01 read GetPosicionalConcentreProtesto;
    property PosicionalConcentreAcaoJudicial[Index: Integer]:
      TSeIP20_04_04_01 read GetPosicionalConcentreAcaoJudicial;
    property PosicionalConcentreFalencia[Index: Integer]:
      TSeIP20_04_05_01 read GetPosicionalConcentreFalencia;
    property PosicionalConcentreFalenciaConcordata[Index: Integer]:
      TSeIP20_04_06_01 read GetPosicionalConcentreFalenciaConcordata;
    property PosicionalConcentreDividasVencidas[Index: Integer]:
      TSeIP20_04_07_01 read GetPosicionalConcentreDividasVencidas;
    property PosicionalInformacoesRecheque[Index: Integer]:
      TSeIP20_04_08_01 read GetPosicionalInformacoesRecheque;
    property PosicionalInformacoesRechequeCCF[Index: Integer]:
      TSeIP20_04_09_01 read GetPosicionalInformacoesRechequeCCF;
    property PosicionalInformacoesRechequeUltimaOcorrencia:
      TSeIP20_04_10_00
      read FPosicionalInformacoesRechequeUltimaOcorrencia
      write FPosicionalInformacoesRechequeUltimaOcorrencia;
    property PosicionalInformacoesRechequeDetalhe[Index: Integer]:
      TSeIP20_04_10_01 read GetPosicionalInformacoesRechequeDetalhe;
    property PosicionalInformacoesRiskscoring[Index: Integer]:
      TSeIP20_07_01_99 read GetPosicionalInformacoesRiskscoring;
    property PosicionalInformacoesRiskscoringPrinad[Index: Integer]:
      TSeIP20_07_01_06 read GetPosicionalInformacoesRiskscoringPrinad;
    property PosicionalRiskscoringMeses[Index: Integer]:
      TSeIP20_07_01_01 read GetPosicionalRiskscoringMeses;
    property PosicionalRiskscoringPrinadMeses[Index: Integer]:
      TSeIP20_07_01_09 read GetPosicionalRiskscoringPrinadMeses;
    property PosicionalFatoresAutorizadores[Index: Integer]:
      TSeIP20_07_01_02 read GetPosicionalFatoresAutorizadores;
    property PosicionalInformacoesAutorizadoresH[Index: Integer]:
      TSeIP20_07_01_04 read GetPosicionalInformacoesAutorizadoresH;
    property PosicionalInformacoesAutorizadoresE[Index: Integer]:
      TSeIP20_07_01_05 read GetPosicionalInformacoesAutorizadoresE;
    property PosicionalFatoresAutorizadoresPQ[Index: Integer]:
      TSeIP20_07_01_03 read GetPosicionalFatoresAutorizadoresPQ;
    property PosicionalInformacoesMonitore: TSeIP20_08_01_02
      read FPosicionalInformacoesMonitore
      write FPosicionalInformacoesMonitore;
    //Este flag determina se recebeu o trailler da string
    property EstaCompleto: Boolean read FEstaCompleto write FEstaCompleto;
    property CentralTitulosSegmentoRegistroControleContabilNRCT[Index: Integer]:
      TSeIP20_89_00_00
      read GetCentralTitulosSegmentoRegistroControleContabilNRCT;
    property CentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT[Index: Integer]:
      TSeIP20_89_01_01
      read GetCentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT;
    property CentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT[Index: Integer]:
      TSeIP20_89_01_02
      read GetCentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT;
    property CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT[Index: Integer]:
      TSeIP20_89_01_03
      read GetCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT;
    property CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT[Index: Integer]:
      TSeIP20_89_02_01
      read GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT;
    property CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT[Index: Integer]:
      TSeIP20_89_02_02
      read GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT;
    property CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT[Index: Integer]:
      TSeIP20_89_02_03
      read GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT;
    property CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT[Index: Integer]:
      TSeIP20_89_02_04
      read GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT;
    property CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT[Index: Integer]:
      TSeIP20_89_02_05
      read GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT;
    property CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT[Index: Integer]:
      TSeIP20_89_02_06
      read GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT;
    property CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT[Index: Integer]:
      TSeIP20_89_02_07
      read GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT;
    property CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT[Index: Integer]:
      TSeIP20_89_02_08
      read GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT;
    property CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT[Index: Integer]:
      TSeIP20_89_02_09
      read GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT;
    property CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT[Index: Integer]:
      TSeIP20_89_02_10
      read GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT;
    property CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT[Index: Integer]:
      TSeIP20_89_02_11
      read GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT;
  end;

  TSeIP20 = class(TSeDetalhes)
  private
    FEstaCompleto: Boolean;
  public
    //Este flag determina se recebeu o trailler da string
    property EstaCompleto: Boolean read FEstaCompleto write FEstaCompleto;
  end;

  TArquivoIP20 = class(TSeIP20)
  protected
    procedure SetText(const Value: string); override;
  end;

  TComunicacaoIP20 = class(TSeIP20)
  private
    FConfiguracao: TDadosConfiguracaoRelatoSegmento;
    FTextOut: string;
  protected
    function EnviaTransacao: Boolean; override;
    function GetText: string; override;
    function PosicaoTransacaoRetorno: Integer; override;
    procedure SetText(const Value: string); override;
  public
    constructor Create(ASerasa: TSerasa); override;
    destructor Destroy; override;
    class function Transacao: TTipoTransacao; override;
    property Configuracao: TDadosConfiguracaoRelatoSegmento read FConfiguracao;
    property TextOut: string read FTextOut;
  end;

  TClassificacao = class(TObject)
  public
    class procedure SeIP20ParaRelatoSegmento(SeString: TSeString;
      RelatoSegmento: TRelatoSegmento);
  end;

implementation

uses
  SysUtils;

type
  TDetalhe = class(TString)
  private
    FClasse: TClasseSeIP20_Detalhe;
  public
    property Classe: TClasseSeIP20_Detalhe read FClasse write FClasse;
  end;

  TDetalhes = class(TCacheString)
  private
    function GetDetalhe: TDetalhe;
  public
    constructor Create;
    procedure Adiciona(ADetalhe: TClasseSeIP20_Detalhe);
    property Detalhe: TDetalhe read GetDetalhe;
  end;

var
  FCacheDetalhes: TDetalhes;

const
  Situacoes: array [0..7] of string = ('00INAPTA', '02ATIVA', '03INATIVA',
    '04NÃO LOCALIZADA', '05EM LIQUIDAÇÃO', '06SUSPENSO', '07NÃO CADASTRADA',
    '09CANCELADA');
  DescricoesMes: array [0..11] of string = ('JAN', 'FEV', 'MAR', 'ABR', 'MAI',
    'JUN', 'JUL', 'AGO', 'SET', 'OUT', 'NOV', 'DEZ');

{ TDetalhes }

procedure TDetalhes.Adiciona(ADetalhe: TClasseSeIP20_Detalhe);
begin
  Codigo := ADetalhe.Registro;
  Detalhe.Classe := TClasseSeIP20_Detalhe(ADetalhe);
end;

constructor TDetalhes.Create;
begin
  inherited;
  FClasse := TDetalhe;
end;

function TDetalhes.GetDetalhe: TDetalhe;
begin
  Result := FObjeto as TDetalhe;
end;

{ TSeIP20_Detalhe }

constructor TSeIP20_Detalhe.Create(ASeIP20: TSeIP20);
begin
  inherited Create;
  FSeIP20 := ASeIP20;
end;

class function TSeIP20_Detalhe.Registro: string;
begin
  Result := ID + Bloco + Tipo;
end;

procedure TSeIP20_Detalhe.SetText(const Value: string);
begin
  if Copy(Value, 1, 6) <> Registro then
    raise ESerasa.CreateFmt('Detalhe %s não corresponde a registro %s.',
      [Copy(Value, 1, 6), Registro]);
end;

{ TSeIP20_01 }

class function TSeIP20_01.ID: string;
begin
  Result := '01';
end;

{ TSeIP20_01_00 }

class function TSeIP20_01_00.Bloco: string;
begin
  Result := '00';
end;

{ TSeIP20_01_00_99 }

procedure TSeIP20_01_00_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79);
end;

class function TSeIP20_01_00_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_01_00_00 }

function TSeIP20_01_00_00.GetMensagemReciprocidade: string;
const
  MensagensReciprocidade: array [0..3] of string = (
    'A' + 'ATENCAO!!!#13#10' +
    'VOCE NAO ESTA VISUALIZANDO O BLOCO “EVOLUCAO DE COMPROMISSOS”#13#10' +
    'SUA EMPRESA ENCONTRA-SE EM ATRASO COM O ENVIO DOS DADOS DESDE %s#13#10' +
    'AO REGULARIZAR O ENVIO, O REFERIDO BLOCO VOLTARA A SER EXIBIDO AUTOMATICAMENTE',
    'B' + 'ATENCAO!!!#13#10' +
    'VOCE NAO ESTA VISUALIZANDO O BLOCO “HISTORICO DE PAGAMENTOS (VALORES EM R$)”#13#10' +
    'SUA EMPRESA ENCONTRA-SE EM ATRASO COM O ENVIO DOS DADOS DESDE %s#13#10' +
    'AO REGULARIZAR O ENVIO, O REFERIDO BLOCO VOLTARA A SER EXIBIDO AUTOMATICAMENTE',
    'C' + 'ATENCAO!!!#13#10' +
    'VOCE NAO ESTA VISUALIZANDO O RELATO ANALITICO#13#10' +
    'SUA EMPRESA ENCONTRA-SE EM ATRASO COM O ENVIO DOS DADOS DESDE %s#13#10' +
    'AO REGULARIZAR O ENVIO, O RELATO ANALITICO SERA VISUALIZADO AUTOMATICAMENTE',
    'D' + 'ATENCAO!!!#13#10' +
    'VOCE NAO ESTA VISUALIZANDO OS BLOCOS “HISTORICO DE PAGAMENTOS (VALORES EM R$)” E “EVOLUCAO DE COMPROMISSOS” EM VIRTUDE DE ATRASO COM OS DADOS DESDE %s#13#10' +
    'AO REGULARIZAR O ENVIO, OS BLOCOS VOLTARAO A SER EXIBIDOS AUTOMATICAMENTE');

begin
  Result := Format(TSeMetodos.StringPorCodigo(FCodigoMensagemReciprocidade,
    MensagensReciprocidade, 1), [DateToStr(FUltimaRemessaReciprocidade)]);
end;

function TSeIP20_01_00_00.GetSituacao: string;
begin
  Result := TSeMetodos.StringPorCodigo(FCodigoSituacao, Situacoes, 2);
end;

function TSeIP20_01_00_00.GetTransacoesContabilizadasDesmembradas(
  Index: Integer): string;
begin
  Result := FTransacoesDesmembradas[Index - 2];
end;

procedure TSeIP20_01_00_00.SetText(const Value: string);
begin
  inherited;
  FCodigoSituacao := StrToIntDef(Copy(Value, 7, 2), -1);
  FDescricaoSituacao := Copy(Value, 9, 79);
  FCNPJ := Copy(Value, 88, 9);
  FTemFicha := Copy(Value, 97, 1) = 'S';
  FTransacaoContabilizada := Copy(Value, 98, 4);
  FCodigoMensagemReciprocidade := Value[102];
  FUltimaRemessaReciprocidade :=
    TSeMetodos.DDPMMPAAAAToDate(Copy(Value, 103, 10));
  FTransacoesDesmembradas[0] := Copy(Value, 113, 4);
  FTransacoesDesmembradas[1] := Copy(Value, 117, 4);
  FTransacoesDesmembradas[2] := Copy(Value, 121, 4);
  FTransacoesDesmembradas[3] := Copy(Value, 125, 4);
  FTransacoesDesmembradas[4] := Copy(Value, 129, 4);
  FTransacoesDesmembradas[5] := Copy(Value, 133, 4);
  FTransacoesDesmembradas[6] := Copy(Value, 137, 4);
  FTransacoesDesmembradas[7] := Copy(Value, 141, 4);
  FTransacoesDesmembradas[8] := Copy(Value, 145, 4);
  FTipoRelato := Value[149];
end;

class function TSeIP20_01_00_00.Tipo: string;
begin
  Result := '00';
end;

{ TSeIP20_01_01 }

class function TSeIP20_01_01.Bloco: string;
begin
  Result := '01';
end;

{ TSeIP20_01_01_99 }

procedure TSeIP20_01_01_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79);
end;

class function TSeIP20_01_01_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_01_01_00 }

procedure TSeIP20_01_01_00.SetText(const Value: string);
begin
  inherited;
  FMensagemStatusEmpresa := Copy(Value, 7, 79);
end;

class function TSeIP20_01_01_00.Tipo: string;
begin
  Result := '00';
end;

{ TSeIP20_01_01_01 }

procedure TSeIP20_01_01_01.SetText(const Value: string);
begin
  inherited;
  FConfidencialPara := Copy(Value, 7, 60);
  FDataHoraContabilizacaoConsulta :=
    TSeMetodos.AAAAMMDDToDate(Copy(Value, 67, 8)) +
    TSeMetodos.HHPMMPSSToTime(Copy(Value, 75, 8));
  FCNPJEditado := Copy(Value, 85, 24);
  FDataAtualizacaoBloco := TSeMetodos.AAAAMMDDToDate(Copy(Value, 109, 8));
  FNumeroUltimoRegistroOrgaosOficiais := Copy(Value, 118, 11);
  FDataUltimoRegistroOrgaosOficiais :=
    TSeMetodos.AAAAMMDDToDate(Copy(Value, 129, 8));
end;

class function TSeIP20_01_01_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_01_01_02 }

procedure TSeIP20_01_01_02.SetText(const Value: string);
begin
  inherited;
  FNome := Copy(Value, 7, 70);
  FCNPJ := Copy(Value, 77, 9);
  FNomeFantasia := Copy(Value, 86, 60);
end;

class function TSeIP20_01_01_02.Tipo: string;
begin
  Result := '02';
end;

{ TSeIP20_01_01_03 }

procedure TSeIP20_01_01_03.SetText(const Value: string);
begin
  inherited;
  FEndereco := Copy(Value, 7, 70);
end;

class function TSeIP20_01_01_03.Tipo: string;
begin
  Result := '03';
end;

{ TSeIP20_01_01_04 }

procedure TSeIP20_01_01_04.SetText(const Value: string);
begin
  inherited;
  FCidade := Copy(Value, 7, 30);
  FUF := Copy(Value, 37, 2);
  FCEP := Copy(Value, 39, 2);
  FDDD := Copy(Value, 41, 4);
  FTelefone := Copy(Value, 45, 9);
  FFAX := Copy(Value, 54, 9);
  FCodigoEmbratel := Copy(Value, 63, 4);
  FPaginaInternet := Copy(Value, 67, 70);
end;

class function TSeIP20_01_01_04.Tipo: string;
begin
  Result := '04';
end;

{ TSeIP20_01_01_05 }

procedure TSeIP20_01_01_05.SetText(const Value: string);
begin
  inherited;
  FDataFundacao := TSeMetodos.AAAAMMDDToDate(Copy(Value, 7, 8));
  FDataInscricaoCNPJ := TSeMetodos.AAAAMMDDToDate(Copy(Value, 15, 8));
  FRamoAtividade := Copy(Value, 23, 54);
  FCodigoSerasaCompleto := Copy(Value, 77, 7);
  FQuantidadeEmpregados := StrToIntDef(Copy(Value, 84, 5), -1);
  FPercentualCompra := StrToFloat(Copy(Value, 89, 3));
  FPercentualVendas := StrToFloat(Copy(Value, 92, 3));
  FQuantidadeFiliais := StrToIntDef(Copy(Value, 95, 3), -1);
end;

class function TSeIP20_01_01_05.Tipo: string;
begin
  Result := '05';
end;

{ TSeIP20_01_01_06 }

procedure TSeIP20_01_01_06.SetText(const Value: string);
begin
  inherited;
  FNomeFilial := Copy(Value, 7, 30);
  FCodigoEmbratel := Copy(Value, 37, 4);
end;

class function TSeIP20_01_01_06.Tipo: string;
begin
  Result := '06';
end;

{ TSeIP20_01_01_07 }

procedure TSeIP20_01_01_07.SetText(const Value: string);
begin
  inherited;
  FPrincipaisProdutos := Copy(Value, 7, 60);
end;

class function TSeIP20_01_01_07.Tipo: string;
begin
  Result := '07';
end;

{ TSeIP20_01_01_08 }

procedure TSeIP20_01_01_08.SetText(const Value: string);
begin
  inherited;
  FDataAtualizacao := TSeMetodos.AAAAMMDDToDate(Copy(Value, 7, 8));
  FCapitalSocial := StrtoFloat(Copy(Value, 15, 13));
  FCapitalRealizado := StrtoFloat(Copy(Value, 28, 13));
  FCapitalAutorizado := StrtoFloat(Copy(Value, 41, 13));
  FNacionalidade := Copy(Value, 54, 12);
  FOrigem := Copy(Value, 66, 12);
  FNatureza := Copy(Value, 78, 12);
  FBaseJuntaComercial := Value[90] = '4';
end;

class function TSeIP20_01_01_08.Tipo: string;
begin
  Result := '08';
end;

{ TSeIP20_01_01_Pessoa }

function TSeIP20_01_01_Pessoa.GetSituacao: string;
begin
  Result := TSeMetodos.StringPorCodigo(FCodigoSituacao, Situacoes, 2);
end;

function TSeIP20_01_01_Pessoa.GetTipoDocumento: string;
const
  TiposDocumento: array [0..2] of string = ('0000DOCUMENTO OFICIAL',
    '0050ATRIBUÍDO PELA SERASA', '0099DOCUMENTO NÃO CONFIRMADO OFICIAL');
begin
  Result := TSeMetodos.StringPorCodigo(CodigoTipoDocumento, TiposDocumento, 4);
end;

{ TSeIP20_01_01_09 }

procedure TSeIP20_01_01_09.SetText(const Value: string);
begin
  inherited;
  FCGC := Copy(Value, 8, 9);
  if Value[7] = 'F' then
    FCGC := FCGC + Copy(Value, 21, 2);
  FCodigoTipoDocumento := StrToIntDef(Copy(Value, 17, 4), -1);
  FNome := Copy(Value, 23, 65);
  FPais := Copy(Value, 88, 12);
  FPercentualCapital := StrToFloat(Copy(Value, 100, 4)) /10;
  FDataEntrada := TSeMetodos.AAAAMMDDToDate(Copy(Value, 104, 8));
  FRestrito := Value[112] = 'S';
  FPercentualCapitalVotante := StrToFloat(Copy(Value, 113, 4)) /10;
  FCodigoSituacao := StrToIntDef(Copy(Value, 117, 2), -1);
  FCodigoSerasa := Copy(Value, 119, 7);
end;

class function TSeIP20_01_01_09.Tipo: string;
begin
  Result := '09';
end;

{ TSeIP20_01_01_10 }

procedure TSeIP20_01_01_10.SetText(const Value: string);
begin
  inherited;
  FDataAtualizacao := TSeMetodos.AAAAMMDDToDate(Copy(Value, 7, 8));
  FBaseJuntaComercial := Value[15] = '4';
end;

class function TSeIP20_01_01_10.Tipo: string;
begin
  Result := '10';
end;

{ TSeIP20_01_01_11 }

procedure TSeIP20_01_01_11.SetText(const Value: string);
begin
  inherited;
  FCGC := Copy(Value, 8, 9);
  if Value[7] = 'F' then
    FCGC := FCGC + Copy(Value, 21, 2);
  FCodigoTipoDocumento := StrToIntDef(Copy(Value, 17, 4), -1);
  FNome := Copy(Value, 23, 58);
  FCargo := Copy(Value, 81, 12);
  FPais := Copy(Value, 93, 12);
  FEstadoCivil := Copy(Value, 105, 9);
  FDataEntrada := TSeMetodos.AAAAMMDDToDate(Copy(Value, 114, 8));
  FDataFinalMandato := TSeMetodos.AAAAMMDDToDate(Copy(Value, 122, 8));
  FRestrito := Value[130] = 'S';
  FCodigoCargo := Copy(Value, 131, 3);
  FCodigoSituacao := StrToIntDef(Copy(Value, 134, 2), -1);
end;

class function TSeIP20_01_01_11.Tipo: string;
begin
  Result := '11';
end;

{ TSeIP20_01_01_12 }

procedure TSeIP20_01_01_12.SetText(const Value: string);
begin
  inherited;
  FDataAtualizacao := TSeMetodos.AAAAMMDDToDate(Copy(Value, 7, 8));
  FBaseJuntaComercial := Value[15] = '4';
end;

class function TSeIP20_01_01_12.Tipo: string;
begin
  Result := '12';
end;

{ TSeIP20_01_01_13 }

procedure TSeIP20_01_01_13.SetText(const Value: string);
begin
  inherited;
  FCGC := Copy(Value, 7, 9);
  if Value[90] = 'F' then
    FCGC := FCGC + Copy(Value, 16, 2);
  FNome := Copy(Value, 18, 67);
  FRestrito := Value[85] = 'S';
  FCodigoTipoDocumento := StrToIntDef(Copy(Value, 86, 4), -1);
  FCodigoSituacao := StrToIntDef(Copy(Value, 91, 2), -1);
end;

class function TSeIP20_01_01_13.Tipo: string;
begin
  Result := '13';
end;

{ TSeIP20_01_01_14 }

procedure TSeIP20_01_01_14.SetText(const Value: string);
begin
  inherited;
  FNome := Copy(Value, 7, 67);
  FVinculoParticipante := Copy(Value, 74, 9);
  FCodigoEmbratel :=  Copy(Value, 83, 4);
  FMunicipioEmbratel := Copy(Value, 87, 30);
  FUFEmbratel := Copy(Value, 117, 2);
  FPercentualParticipacao := StrToFloat(Copy(Value, 119, 5)) /100;
  FRestrito := Value[124] = 'S';
  FCGC := Copy(Value, 125, 9);
  if Value[139] = 'F' then
    FCGC := FCGC + Copy(Value, 138, 2);
  FCodigoTipoDocumento := StrToIntDef(Copy(Value, 134, 4), -1);
  FCodigoSituacao := StrToIntDef(Copy(Value, 140, 2), -1);
end;

class function TSeIP20_01_01_14.Tipo: string;
begin
  Result := '14';
end;

{ TSeIP20_01_01_16 }

procedure TSeIP20_01_01_16.SetText(const Value: string);
begin
  inherited;
  FNome := Copy(Value, 7, 70);
  FDataMotivo := TSeMetodos.AAAAMMDDToDate(Copy(Value, 78, 8));
end;

class function TSeIP20_01_01_16.Tipo: string;
begin
  Result := '16';
end;

{ TSeIP20_01_01_98 }

procedure TSeIP20_01_01_98.SetText(const Value: string);
begin
  inherited;
  FMensagemBloco := Copy(Value, 7, 79);
end;

class function TSeIP20_01_01_98.Tipo: string;
begin
  Result := '98';
end;

{ TSeIP20_01_02 }

class function TSeIP20_01_02.Bloco: string;
begin
  Result := '02';
end;

{ TSeIP20_01_02_99 }

procedure TSeIP20_01_02_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79);
end;

class function TSeIP20_01_02_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_02 }

class function TSeIP20_02.ID: string;
begin
  Result := '02';
end;

{ TSeIP20_02_01 }

class function TSeIP20_02_01.Bloco: string;
begin
  Result := '01';
end;

{ TSeIP20_02_01_99 }

procedure TSeIP20_02_01_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79);
end;

class function TSeIP20_02_01_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_02_01_00 }

procedure TSeIP20_02_01_00.SetText(const Value: string);
begin
  inherited;
  FDataAtualizacaoBloco := TSeMetodos.AAAAMMDDToDate(Copy(Value, 7, 8));
  FSegmentoOrigemInformacao := StrToIntDef(Copy(Value, 15, 3), -1);
end;

class function TSeIP20_02_01_00.Tipo: string;
begin
  Result := '00';
end;

{ TSeIP20_02_01_PrincipaisFontes }

procedure TSeIP20_02_01_PrincipaisFontes.SetText(const Value: string);
begin
  inherited;
  FNome := Copy(Value, 7, 70);
  FCNPJ := TSeMetodos.SeCNPJ(Copy(Value, 77, 15));
end;


{ TSeIP20_02_01_01 }

class function TSeIP20_02_01_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_02_01_02 }

procedure TSeIP20_02_01_02.SetText(const Value: string);
begin
  inherited;
  FQuantidadeFontes := StrToIntDef(Copy(Value, 7, 4), -1);
  FQuantidadeFontesPefilHistoricoPagamentos :=
    StrToIntDef(Copy(Value, 11, 4), -1);
  FQuantidadeFontesEvolucaoCompromisso := StrToIntDef(Copy(Value, 15, 4), -1);
  FQuantidadeFontesReferenciaisNegocios := StrToIntDef(Copy(Value, 19, 4), -1);
  FQuantidadeFontesReferenciaisNegociosPagamentoAVista :=
    StrToIntDef(Copy(Value, 23, 4), -1);
  FQuantidadeFontesHistoricoPagamentos := StrToIntDef(Copy(Value, 30, 4), -1);
end;

class function TSeIP20_02_01_02.Tipo: string;
begin
  Result := '02';
end;

{ TSeIP20_02_01_03 }

procedure TSeIP20_02_01_03.SetText(const Value: string);
begin
  inherited;
  FDescricao := Copy(Value, 7, 14);
  FQuantidade := StrToIntDef(Copy(Value, 21, 4), -1);
end;

class function TSeIP20_02_01_03.Tipo: string;
begin
  Result := '03'
end;

{ TSeIP20_02_01_Ocorrencias }

function TSeIP20_02_01_Ocorrencias.GetDescricaoMes: string;
begin
  Result := DescricoesMes[FAnoMes.Mes - 1];
end;


{ TSeIP20_02_01_04 }

procedure TSeIP20_02_01_04.SetText(const Value: string);
begin
  inherited;
  FAnoMes.Ano := StrToIntDef(Copy(Value, 10, 2), -1);
  FAnoMes.Mes := StrToIntDef(Copy(Value, 12, 2), -1);
end;

class function TSeIP20_02_01_04.Tipo: string;
begin
  Result := '04';
end;

{ TSeIP20_02_01_Ocorrencias_HistoricoEvolucao }

procedure TSeIP20_02_01_Ocorrencias_HistoricoEvolucao.SetText(
  const Value: string);
begin
  inherited;
  FDescricao := Copy(Value, 7, 14);
  FAnoMes.Ano := StrToIntDef(Copy(Value, 21, 2), -1);
  FAnoMes.Mes := StrToIntDef(Copy(Value, 23, 2), -1);
  FValor := StrToFloat(Copy(Value, 28, 13));
  FPercentual := StrToFloat(Copy(Value, 41, 4)) / 10;
end;

{ TSeIP20_02_01_05 }

class function TSeIP20_02_01_05.Tipo: string;
begin
  Result := '05';
end;

{ TSeIP20_02_01_Ocorrencias_VencidosAVencer }

procedure TSeIP20_02_01_Ocorrencias_VencidosAVencer.SetText(
  const Value: string);
begin
  inherited;
  FAnoMes.Ano := StrToIntDef(Copy(Value, 7, 2), -1);
  FAnoMes.Mes := StrToIntDef(Copy(Value, 9, 2), -1);
  FVenvidos := StrToFloat(Copy(Value, 14, 13));
  FAVencer := StrToFloat(Copy(Value, 27, 13));
end;

{ TSeIP20_02_01_06 }

class function TSeIP20_02_01_06.Tipo: string;
begin
  Result := '06';
end;

{ TSeIP20_02_01_PotencialCompra }

procedure TSeIP20_02_01_PotencialCompra.SetText(const Value: string);
begin
  inherited;
  FDescricao := Copy(Value, 7, 14);
  FData := TSeMetodos.AAAAMMDDToDate(Copy(Value, 21, 8));
  FValor := StrToFloat(Copy(Value, 29, 13));
  FMedia := StrToFloat(Copy(Value, 42, 13));
end;

{ TSeIP20_02_01_07 }

class function TSeIP20_02_01_07.Tipo: string;
begin
  Result := '07';
end;

{ TSeIP20_02_01_08 }

procedure TSeIP20_02_01_08.SetText(const Value: string);
begin
  inherited;
  FDescricao := Copy(Value, 7, 14);
  FQuantidade := StrToIntDef(Copy(Value, 21, 6), -1);
  FPercentual := StrToFloat(Copy(Value, 27, 4));
end;

class function TSeIP20_02_01_08.Tipo: string;
begin
  Result := '08';
end;

{ TSeIP20_02_01_09 }

procedure TSeIP20_02_01_09.SetText(const Value: string);
begin
  inherited;
  FMnemonico := Copy(Value, 7, 10);
  FDataAtualizacao := TSeMetodos.AAAAMMDDToDate(Copy(Value, 17, 8));
  FDataUltimaCompra := TSeMetodos.AAAAMMDDToDate(Copy(Value, 25, 8));
  FValorUltimaCompra := StrToFloat(Copy(Value, 33, 13));
  FDataMaiorFatura := TSeMetodos.AAAAMMDDToDate(Copy(Value, 46, 8));
  FValorMaiorFatura := StrToFloat(Copy(Value, 54, 13));
  FDataMaiorAcumulo := TSeMetodos.AAAAMMDDToDate(Copy(Value, 67, 8));
  FValorMaiorAcumulo := StrToFloat(Copy(Value, 75, 13));
  FSegmentoOrigemInformacao := StrToIntDef(Copy(Value, 88, 3), -1);
  FAVista := Value[91] = 'V';
end;

class function TSeIP20_02_01_09.Tipo: string;
begin
  Result := '09';
end;

{ TSeIP20_02_01_10 }

procedure TSeIP20_02_01_10.SetText(const Value: string);
begin
  inherited;
  FMnemonico := Copy(Value, 7, 10);
  FDataAtualizacao := TSeMetodos.AAAAMMDDToDate(Copy(Value, 17, 8));
  FVencidos := StrToFloat(Copy(Value, 25, 13));
  FAVencer := StrToFloat(Copy(Value, 38, 13));
  FSegmentoOrigemInformacao := StrToIntDef(Copy(Value, 51, 3), -1);
end;

class function TSeIP20_02_01_10.Tipo: string;
begin
  Result := '10';
end;

{ TSeIP20_02_01_11 }

procedure TSeIP20_02_01_11.SetText(const Value: string);
begin
  inherited;
  FDataAtualizacaoBloco := TSeMetodos.AAAAMMDDToDate(Copy(Value, 7, 8));
end;

class function TSeIP20_02_01_11.Tipo: string;
begin
  Result := '11';
end;

{ TSeIP20_02_01_12 }

class function TSeIP20_02_01_12.Tipo: string;
begin
  Result := '12';
end;

{ TSeIP20_02_01_13 }

procedure TSeIP20_02_01_13.SetText(const Value: string);
begin
  inherited;
  FQuantidadeFontes := StrToIntDef(Copy(Value, 7, 4), -1);
  FQuantidadeFontesPefilHistoricoPagamentos :=
    StrToIntDef(Copy(Value, 11, 4), -1);
  FQuantidadeFontesEvolucaoCompromisso := StrToIntDef(Copy(Value, 15, 4), -1);
  FQuantidadeFontesReferenciaisNegocios := StrToIntDef(Copy(Value, 19, 4), -1);
  FQuantidadeFontesReferenciaisNegociosPagamentoAVista :=
    StrToIntDef(Copy(Value, 23, 4), -1);
  FSegmentoOrigemInformacao := StrToIntDef(Copy(Value, 30, 3), -1);
  FQuantidadeFontesHistoricoPagamentos := StrToIntDef(Copy(Value, 33, 4), -1);
end;

class function TSeIP20_02_01_13.Tipo: string;
begin
  Result := '13';
end;

{ TSeIP20_02_01_14 }

procedure TSeIP20_02_01_14.SetText(const Value: string);
begin
  inherited;
  FDescricao := Copy(Value, 7, 14);
  FQuantidade := StrToIntDef(Copy(Value, 21, 4), -1);
  FSegmentoOrigemInformacao := StrToIntDef(Copy(Value, 25, 3), -1);
end;

class function TSeIP20_02_01_14.Tipo: string;
begin
  Result := '14';
end;

{ TSeIP20_02_01_15 }

procedure TSeIP20_02_01_15.SetText(const Value: string);
begin
  inherited;
  FSegmentoOrigemInformacao := StrToIntDef(Copy(Value, 45, 3), -1);
end;

class function TSeIP20_02_01_15.Tipo: string;
begin
  Result := '15';
end;

{ TSeIP20_02_01_16 }

procedure TSeIP20_02_01_16.SetText(const Value: string);
begin
  inherited;
  FSegmentoOrigemInformacao := StrToIntDef(Copy(Value, 40, 3), -1);
end;

class function TSeIP20_02_01_16.Tipo: string;
begin
  Result := '16';
end;

{ TSeIP20_02_01_17 }

procedure TSeIP20_02_01_17.SetText(const Value: string);
begin
  inherited;
  FSegmentoOrigemInformacao := StrToIntDef(Copy(Value, 40, 3), -1);
end;

class function TSeIP20_02_01_17.Tipo: string;
begin
  Result := '17';
end;

{ TSeIP20_02_01_18 }

procedure TSeIP20_02_01_18.SetText(const Value: string);
begin
  inherited;
  FMnemonico := Copy(Value, 7, 10);
  FDataAtualizacao := TSeMetodos.AAAAMMDDToDate(Copy(Value, 17, 8));
  FDataMaiorValor := TSeMetodos.AAAAMMDDToDate(Copy(Value, 25, 8));
  FMaiorValor := StrToFloat(Copy(Value, 33, 13));
  FDataAtraso := TSeMetodos.AAAAMMDDToDate(Copy(Value, 46, 8));
  FDiasAtraso := StrToIntDef(Copy(Value, 54, 4), -1);
  FDiasPositivo := Value[58] = '0';
  FPagamentos := StrToFloat(Copy(Value, 59, 7));
  FPagamentosAtrasados := StrToFloat(Copy(Value, 66, 7));
  FMediaDiasAtraso := StrToIntDef(Copy(Value, 73, 4), -1);
  FSegmentoOrigemInformacao := StrToIntDef(Copy(Value, 77, 3), -1);
end;

class function TSeIP20_02_01_18.Tipo: string;
begin
  Result := '18';
end;

{ TSeIP20_02_01_19 }

procedure TSeIP20_02_01_19.SetText(const Value: string);
begin
  inherited;
  FMnemonico := Copy(Value, 7, 10);
  FDataAtualizacao := TSeMetodos.AAAAMMDDToDate(Copy(Value, 17, 8));
  FClienteDesde := TSeMetodos.AAAAMMDDToDate(Copy(Value, 25, 8));
  FSegmentoOrigemInformacao := StrToIntDef(Copy(Value, 33, 3), -1);
end;

class function TSeIP20_02_01_19.Tipo: string;
begin
  Result := '19';
end;

{ TSeIP20_02_01_20 }

procedure TSeIP20_02_01_20.SetText(const Value: string);
begin
  inherited;
  FSegmentoOrigemInformacao := StrToIntDef(Copy(Value, 45, 3), -1);
end;

class function TSeIP20_02_01_20.Tipo: string;
begin
  Result := '20';
end;

{ TSeIP20_02_01_21 }

class function TSeIP20_02_01_21.Tipo: string;
begin
  Result := '21';
end;

{ TSeIP20_02_01_25 }

class function TSeIP20_02_01_25.Tipo: string;
begin
  Result := '25';
end;


{ TSeIP20_02_01_26 }

class function TSeIP20_02_01_26.Tipo: string;
begin
  Result := '26';
end;

{ TSeIP20_02_01_27 }

class function TSeIP20_02_01_27.Tipo: string;
begin
  Result := '27';
end;

{ TSeIP20_02_01_28 }

class function TSeIP20_02_01_28.Tipo: string;
begin
  Result := '28';
end;

{ TSeIP20_03 }

class function TSeIP20_03.ID: string;
begin
  Result := '03';
end;

{ TSeIP20_03_01 }

class function TSeIP20_03_01.Bloco: string;
begin
  Result := '01';
end;

{ TSeIP20_03_01_99 }

procedure TSeIP20_03_01_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79);
end;

class function TSeIP20_03_01_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_03_01_01 }

function TSeIP20_03_01_01.GetDescricaoMes: string;
begin
  Result := DescricoesMes[FAnoMes.Mes - 1];
end;

procedure TSeIP20_03_01_01.SetText(const Value: string);
begin
  inherited;
  FAnoMes.Ano := StrToIntDef(Copy(Value, 7, 2), -1);
  FAnoMes.Mes := StrToIntDef(Copy(Value, 9, 2), -1);
  FConsultasEmpresa := StrToIntDef(Copy(Value, 14, 3), -1);
  FConsultasBanco := StrToIntDef(Copy(Value, 17, 3), -1);
end;

class function TSeIP20_03_01_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_03_01_02 }

procedure TSeIP20_03_01_02.SetText(const Value: string);
begin
  inherited;
  FData := TSeMetodos.AAAAMMDDToDate(Copy(Value, 7, 8));
  FNome := Copy(Value, 15, 35);
  FConsultasNoDiaPorCliente := StrToIntDef(Copy(Value, 50, 4), -1);
end;

class function TSeIP20_03_01_02.Tipo: string;
begin
  Result := '02';
end;

{ TSeIP20_03_01_03 }

procedure TSeIP20_03_01_03.SetText(const Value: string);
begin
  inherited;
  FAlerta := Copy(Value, 7, 124);
end;

class function TSeIP20_03_01_03.Tipo: string;
begin
  Result := '03';
end;

{ TSeIP20_04 }

class function TSeIP20_04.ID: string;
begin
  Result := '04';
end;

{ TSeIP20_04_01 }

class function TSeIP20_04_01.Bloco: string;
begin
  Result := '01';
end;

{ TSeIP20_04_01_99 }

procedure TSeIP20_04_01_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79);
end;

class function TSeIP20_04_01_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_04_01_ValoresFinanceiros }

procedure TSeIP20_04_01_ValoresFinanceiros.SetText(const Value: string);
begin
  inherited;
  FQuantidade := StrToIntDef(Copy(Value, 7, 9), -1);
  FQuantidadeUltimaOcorrencia := StrToIntDef(Copy(Value, 16, 9), -1);
  FData := TSeMetodos.AAAAMMDDToDate(Copy(Value, 25, 8));
  FTituloOcorrencia := Copy(Value, 33, 12);
  FAvalista := Value[45] = 'S';
  FValor := StrToFloat(Copy(Value, 46, 13));
  FContrato := Copy(Value, 59, 16);
  FOrigem := Copy(Value, 75, 20);
  FFilial := Copy(Value, 95, 4);
  with FSubJudice do
  begin
    Praca := Copy(Value, 99, 4);
    Distrito := Copy(Value, 103, 2);
    Vara := Copy(Value, 105, 2);
    Data := TSeMetodos.AAAAMMDDToDate(Copy(Value, 107, 8));
    Processo := Copy(Value, 115, 16);
  end;
  FCodigoNatureza := Copy(Value, 131, 3);
end;

{ TSeIP20_04_01_01 }

function TSeIP20_04_01_01.GetNatureza: string;
const
  NaturezaPefin: array [0..18] of string = (
    'AD adiantamentos a depositantes - c/c devedora',
    'AG empréstimos agrícolas e industriais',
    'AR arrendamentos, inclusive leasing',
    'CA operações de câmbio',
    'CD crédito direto',
    'CO consórcio contemplado',
    'CP crédito pessoal',
    'CR impedidos de crédito rural pelo Bacen',
    'CT operações com cartão de crédito',
    'DC dívidas originárias de cheques',
    'DE dividas originarias de cheques eletronicos',
    'DP Duplicata',
    'EC empréstimos  em conta, c/c garant, cap. giro, progr. Especial',
    'FI créditos e financiamentos',
    'OJ operações ajuizadas',
    'OO outras operações',
    'RE operações de repasse, finame, 63, recon, etc',
    'SR seguro de risco decorrido',
    'TD títulos descontados, duplicatas, promissórias, etc');
begin
  Result := TSeMetodos.StringPorCodigo(FCodigoNatureza, NaturezaPefin, 3);
end;

class function TSeIP20_04_01_01.Tipo: string;

begin
  Result := '01';
end;

{ TSeIP20_04_01_02 }

function TSeIP20_04_01_02.GetNatureza: string;
const
  NaturezaPefin: array [0..13] of string = (
    'AD adiantamento a depositantes - c/c devedores em geral',
    'AG empréstimos agrícolas e industriais - financiamentos de custeio de investimentos agrícolas e industriais',
    'AR arrendamentos, inclusive leasing',
    'CA operações de câmbio - operações e financiamentos de câmbio em geral',
    'CH adiantamento a depositantes - cheques sem fundos acolhidos',
    'CR impedidos pelo Banco Central de obtenção de crédito rural',
    'CT cartão de crédito',
    'EC empréstimos em contas - c/c garantidas, financiamentos de capital de giro, programas especiais, etc',
    'FI créditos e financiamentos - empréstimos a pessoas físicas, financiamentos ao consumidor final, etc',
    'OJ operações ajuizadas',
    'OO outras operações - diversas operações que não se enquadram nas demais',
    'RE operações de repasse - operações 63, FINAME, REINVEST, RECON, PROALCOOL, etc',
    'SJ débito sub judice',
    'TD títulos descontados - descontos de duplicatas, promissórias e outros títulos');
begin
  Result := TSeMetodos.StringPorCodigo(FCodigoNatureza, NaturezaPefin, 3);
end;

class function TSeIP20_04_01_02.Tipo: string;
begin
  Result := '02';
end;

{ TSeIP20_04_02 }

class function TSeIP20_04_02.Bloco: string;
begin
  Result := '02';
end;

{ TSeIP20_04_02_99 }

procedure TSeIP20_04_02_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79);
end;

class function TSeIP20_04_02_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_04_02_01 }

procedure TSeIP20_04_02_01.SetText(const Value: string);
begin
  inherited;
  FGrafias := Copy(Value, 7, 70);
end;

class function TSeIP20_04_02_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_04_02_02 }

function TSeIP20_04_02_02.GetDescricaoMesFinal: string;
begin
  Result := DescricoesMes[FAnoMesFinal.Mes - 1];
end;

function TSeIP20_04_02_02.GetDescricaoMesInicial: string;
begin
  Result := DescricoesMes[FAnoMesInicial.Mes - 1];
end;

procedure TSeIP20_04_02_02.SetText(const Value: string);
begin
  inherited;
  FQuantidade := StrToIntDef(Copy(Value, 7, 9), -1);
  FGrupo := Copy(Value, 16, 27);
  FAnoMesInicial.Mes := StrToIntDef(Copy(Value, 46, 2), -1);
  FAnoMesInicial.Ano := StrToIntDef(Copy(Value, 48, 2), -1);
  FAnoMesFinal.Mes := StrToIntDef(Copy(Value, 53, 2), -1);
  FAnoMesFinal.Ano := StrToIntDef(Copy(Value, 55, 2), -1);
  FMoeda := Copy(Value, 57, 3);
  FValor := StrToFloat(Copy(Value, 60, 13));
  FOrigem := Copy(Value, 73, 20);
  FAgencia := Copy(Value, 93, 4);
  try
    FTotalProtesto := StrToFloat(Copy(Value, 97, 13));
  except
    FTotalProtesto := 0;
  end;
  FCodigoNatureza := Copy(Value, 110, 3);
end;

class function TSeIP20_04_02_02.Tipo: string;
begin
  Result := '02';
end;

{ TSeIP20_04_02_03 }

procedure TSeIP20_04_02_03.SetText(const Value: string);
begin
  inherited;
  FQuantidade := StrToIntDef(Copy(Value, 7, 9), -1);
  FDescricao := Copy(Value, 16, 81);
end;

class function TSeIP20_04_02_03.Tipo: string;
begin
  Result := '03';
end;

{ TSeIP20_04_03 }

class function TSeIP20_04_03.Bloco: string;
begin
  Result := '03';
end;

{ TSeIP20_04_03_99 }

procedure TSeIP20_04_03_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79);
end;

class function TSeIP20_04_03_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_04_03_01 }

function TSeIP20_04_03_01.GetTipoCartaAnuencia: string;
const
  TiposCartaAnuencia: array [0..2] of string = (
    'Ccarta anuência entregue pelo credor',
    'Ecarta anuência eletrônica entregue pelo credor',
    'Dcarta anuência entregue pelo devedor');
begin
  Result := TSeMetodos.StringPorCodigo(FCodigoTipoCartaAnuencia,
    TiposCartaAnuencia, 1);
end;

procedure TSeIP20_04_03_01.SetText(const Value: string);
begin
  inherited;
  FQuantidade := StrToIntDef(Copy(Value, 7, 9), -1);
  FData := TSeMetodos.AAAAMMDDToDate(Copy(Value, 16, 8));
  FMoeda := Copy(Value, 24, 3);
  FValor := StrToFloat(Copy(Value, 27, 13));
  FCartorio := Copy(Value, 40, 2);
  FCidade := Copy(Value, 42, 30);
  FUF := Copy(Value, 72, 2);
  with FSubJudice do
  begin
    Praca := Copy(Value, 74, 4);
    Distrito := Copy(Value, 78, 2);
    Vara := Copy(Value, 80, 2);
    Data := TSeMetodos.AAAAMMDDToDate(Copy(Value, 82, 8));
    Processo := Copy(Value, 90, 16);
  end;
  FCodigoNatureza := Copy(Value, 106, 3);
  FCodigoTipoCartaAnuencia := Value[133];
  FDataCartaAnuencia := TSeMetodos.AAAAMMDDToDate(Copy(Value, 134, 8));
end;

class function TSeIP20_04_03_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_04_04 }

class function TSeIP20_04_04.Bloco: string;
begin
  Result := '04';
end;

{ TSeIP20_04_04_99 }

procedure TSeIP20_04_04_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79);
end;

class function TSeIP20_04_04_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_04_04_01 }

procedure TSeIP20_04_04_01.SetText(const Value: string);
begin
  inherited;
  FQuantidade := StrToIntDef(Copy(Value, 7, 9), -1);
  FData := TSeMetodos.AAAAMMDDToDate(Copy(Value, 16, 8));
  FNaturezaAcao := Copy(Value, 24, 20);
  FAvalista := Value[44] = 'S';
  FMoeda := Copy(Value, 45, 3);
  FValor := StrToFloat(Copy(Value, 48, 13));
  FDistrito := Copy(Value, 61, 2);
  FVara := Copy(Value, 63, 4);
  FCidade := Copy(Value, 67, 30);
  FUF := Copy(Value, 97, 2);
  with FSubJudice do
  begin
    Praca := Copy(Value, 99, 4);
    Distrito := Copy(Value, 103, 2);
    Vara := Copy(Value, 105, 2);
    Data := TSeMetodos.AAAAMMDDToDate(Copy(Value, 107, 8));
    Processo := Copy(Value, 115, 16);
  end;
  FCodigoNatureza := Copy(Value, 131, 3);
end;

class function TSeIP20_04_04_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_04_05 }

class function TSeIP20_04_05.Bloco: string;
begin
  Result := '05';
end;

{ TSeIP20_04_05_99 }

procedure TSeIP20_04_05_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79);
end;

class function TSeIP20_04_05_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_04_05_01 }

procedure TSeIP20_04_05_01.SetText(const Value: string);
begin
  inherited;
  FQuantidade := StrToIntDef(Copy(Value, 7, 9), -1);
  FData := TSeMetodos.AAAAMMDDToDate(Copy(Value, 16, 8));
  FDescricao := Copy(Value, 24, 20);
  FCNPJ := Copy(Value, 44, 9);
  FNome := Copy(Value, 53, 68);
  FCodigoNatureza := Copy(Value, 121, 3);
end;

class function TSeIP20_04_05_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_04_06 }

class function TSeIP20_04_06.Bloco: string;
begin
  Result := '06';
end;

{ TSeIP20_04_06_99 }

procedure TSeIP20_04_06_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79);
end;

class function TSeIP20_04_06_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_04_06_01 }

procedure TSeIP20_04_06_01.SetText(const Value: string);
begin
  inherited;
  FQuantidade := StrToIntDef(Copy(Value, 7, 9), -1);
  FData := TSeMetodos.AAAAMMDDToDate(Copy(Value, 16, 8));
  FDescricao := Copy(Value, 24, 20);
  FOrigem := Copy(Value, 44, 5);
  FVara := Copy(Value, 49, 4);
  FCidade := Copy(Value, 53, 30);
  FUF := Copy(Value, 83, 2);
  FCodigoNatureza := Copy(Value, 85, 3);
end;

class function TSeIP20_04_06_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_04_07 }

class function TSeIP20_04_07.Bloco: string;
begin
  Result := '07';
end;

{ TSeIP20_04_07_99 }

procedure TSeIP20_04_07_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79);
end;

class function TSeIP20_04_07_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_04_07_01 }

procedure TSeIP20_04_07_01.SetText(const Value: string);
begin
  inherited;
  FQuantidade := StrToIntDef(Copy(Value, 7, 9), -1);
  FData := TSeMetodos.AAAAMMDDToDate(Copy(Value, 16, 8));
  FDescricao := Copy(Value, 24, 15);
  FMoeda := Copy(Value, 39, 3);
  FValor := StrToFloat(Copy(Value, 42, 13));
  FTituloOcorrencia := Copy(Value, 55, 15);
  FInstituicaoFinanceira := Copy(Value, 70, 15);
  FLocal := Copy(Value, 85, 3);
  FCodigoNatureza := Copy(Value, 88, 3);
end;

class function TSeIP20_04_07_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_04_08 }

class function TSeIP20_04_08.Bloco: string;
begin
  Result := '08';
end;

{ TSeIP20_04_08_99 }

procedure TSeIP20_04_08_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79); 
end;

class function TSeIP20_04_08_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_04_08_01 }

procedure TSeIP20_04_08_01.SetText(const Value: string);
begin
  inherited;
  FQuantidade := StrToIntDef(Copy(Value, 7, 9), -1);
  FData := TSeMetodos.AAAAMMDDToDate(Copy(Value, 16, 8));
  FNumeroCheque := Copy(Value, 24, 6);
  FAlinea := StrToIntDef(Copy(Value, 30, 2), -1);
  FQuantidadeNoBanco := StrToIntDef(Copy(Value, 32, 5), -1);
  FMoeda := Copy(Value, 37, 3);
  FValor := StrToFloat(Copy(Value, 40, 13));
  FBanco := Copy(Value, 53, 12);
  FAgencia := Copy(Value, 65, 4);
  FCidade := Copy(Value, 69, 30);
  FUF := Copy(Value, 99, 2);
  FCodigoNatureza := Copy(Value, 101, 3);
end;

class function TSeIP20_04_08_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_04_09 }

class function TSeIP20_04_09.Bloco: string;
begin
  Result := '09';
end;

{ TSeIP20_04_09_99 }

procedure TSeIP20_04_09_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79);
end;

class function TSeIP20_04_09_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_04_09_01 }

procedure TSeIP20_04_09_01.SetText(const Value: string);
begin
  inherited;
  FQuantidade := StrToIntDef(Copy(Value, 7, 9), -1);
  FData := TSeMetodos.AAAAMMDDToDate(Copy(Value, 16, 8));
  FNumeroCheque := Copy(Value, 24, 6);
  FQuantidadeNoBanco := StrToIntDef(Copy(Value, 30, 5), -1);
  FBanco := Copy(Value, 35, 16);
  FAgencia := Copy(Value, 51, 4);
  FCidade := Copy(Value, 55, 30);
  FUF := Copy(Value, 85, 2);
  FCodigoNatureza := Copy(Value, 87, 3);
end;

class function TSeIP20_04_09_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_04_10 }

class function TSeIP20_04_10.Bloco: string;
begin
  Result := '10';
end;

{ TSeIP20_04_10_99 }

procedure TSeIP20_04_10_99.SetText(const Value: string);
begin
  inherited;
  FMensagem := Copy(Value, 7, 79);
end;

class function TSeIP20_04_10_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_04_10_00}

procedure TSeIP20_04_10_00.SetText(const Value: string);
begin
  inherited;
  FQuantidade := StrToIntDef(Copy(Value, 7, 9), -1);
  FQuantidadeUltimaOcorrencia := StrToIntDef(Copy(Value, 16, 9), -1);
end;

class function TSeIP20_04_10_00.Tipo: string;
begin
  Result := '00';
end;

{ TSeIP20_04_10_01 }

procedure TSeIP20_04_10_01.SetText(const Value: string);
begin
  inherited;
  FData := TSeMetodos.AAAAMMDDToDate(Copy(Value, 7, 8));
  FBanco := Copy(Value, 15, 16);
  FAgencia := Copy(Value, 31, 4);
  FConta := Copy(Value, 35, 6);
  FDigitoConta := Value[41];
  FChequeInicial := Copy(Value, 42, 6);
  FChequeFinal := Copy(Value, 42, 6);
  FMotivo := Copy(Value, 48, 10);
end;

class function TSeIP20_04_10_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_07 }

class function TSeIP20_07.ID: string;
begin
  Result := '07';
end;

{ TSeIP20_07_01 }

class function TSeIP20_07_01.Bloco: string;
begin
  Result := '01';
end;

{ TSeIP20_07_01_99 }

procedure TSeIP20_07_01_99.SetText(const Value: string);
begin
  inherited;
  FDataHora := TSeMetodos.AAAAMMDDToDate(Copy(Value, 7, 8)) +
    TSeMetodos.HHPMMPSSToTime(Copy(Value, 15, 8));
  FMensagem := Copy(Value, 23, 78);
end;

class function TSeIP20_07_01_99.Tipo: string;
begin
  Result := '99';
end;

{ TSeIP20_07_01_01 }

procedure TSeIP20_07_01_01.SetText(const Value: string);
begin
  inherited;
  FDataHora := TSeMetodos.DDMMAAAAToDate(Copy(Value, 7, 8)) +
    TseMetodos.HHPMMPSSToTime(Copy(Value, 15, 8));
  FFatorRiskscoring := StrToFloat(Copy(Value, 23, 4));
  FFatorPrinad := StrToFloat(Copy(Value, 27, 4)) / 10;
end;

class function TSeIP20_07_01_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_07_01_FatoresAutorizadores }

procedure TSeIP20_07_01_FatoresAutorizadores.SetText(const Value: string);
begin
  inherited;
  FDataHora := TSeMetodos.DDMMAAAAToDate(Copy(Value, 7, 8)) +
    TseMetodos.HHPMMPSSToTime(Copy(Value, 15, 8));
  FFatorAutorizador := Copy(Value, 23, 60);
  FCodigoCNAE := Copy(Value, 83, 9);
end;

{ TSeIP20_07_01_02 }

class function TSeIP20_07_01_02.Tipo: string;
begin
  Result := '02';
end;

{ TSeIP20_07_01_03 }

class function TSeIP20_07_01_03.Tipo: string;
begin
  Result := '03';
end;

{ TSeIP20_07_01_04 }

procedure TSeIP20_07_01_04.SetText(const Value: string);
begin
  inherited;
  FDataHora := TSeMetodos.DDMMAAAAToDate(Copy(Value, 7, 8)) +
    TseMetodos.HHPMMPSSToTime(Copy(Value, 15, 8));
  FMensagem := Copy(Value, 23, 78);
end;

class function TSeIP20_07_01_04.Tipo: string;
begin
  Result := '04';
end;

{ TSeIP20_07_01_05 }

procedure TSeIP20_07_01_05.SetText(const Value: string);
begin
  inherited;
  FDataHora := TSeMetodos.DDMMAAAAToDate(Copy(Value, 7, 8)) +
    TseMetodos.HHPMMPSSToTime(Copy(Value, 15, 8));
  FFatorAutorizador := Copy(Value, 23, 80);
end;

class function TSeIP20_07_01_05.Tipo: string;
begin
  Result := '05';
end;

{ TSeIP20_07_01_06 }

procedure TSeIP20_07_01_06.SetText(const Value: string);
begin
  inherited;
  FDataHora := TSeMetodos.DDMMAAAAToDate(Copy(Value, 7, 8)) +
    TseMetodos.HHPMMPSSToTime(Copy(Value, 15, 8));
  FMensagem := Copy(Value, 23, 80);
end;

class function TSeIP20_07_01_06.Tipo: string;
begin
  Result := '06';
end;

{ TSeIP20_07_01_09 }

procedure TSeIP20_07_01_09.SetText(const Value: string);
begin
  inherited;
  FDataHora := TSeMetodos.DDMMAAAAToDate(Copy(Value, 7, 8)) +
    TseMetodos.HHPMMPSSToTime(Copy(Value, 15, 8));
  FFatorRiskscoring := StrToFloat(Copy(Value, 23, 4));
  FFatorPrinad := StrToFloat(Copy(Value, 27, 5)) / 100;
end;

class function TSeIP20_07_01_09.Tipo: string;
begin
  Result := '09';
end;

{ TSeIP20_08 }

class function TSeIP20_08.ID: string;
begin
  Result := '08';
end;

{ TSeIP20_08_01 }

class function TSeIP20_08_01.Bloco: string;
begin
  Result := '01';
end;

{ TSeIP20_08_01_02 }

function TSeIP20_08_01_02.GetInclusaoEfetuada: Boolean;
begin
  Result := FCodigoRetorno = '00';
end;

procedure TSeIP20_08_01_02.SetText(const Value: string);
begin
  inherited;
  FCodigoRetorno := Copy(Value, 7, 2);
  FMensagem := Copy(Value, 9, 80);
end;

class function TSeIP20_08_01_02.Tipo: string;
begin
  Result := '02';
end;

{ TSeIP20_99 }

class function TSeIP20_99.ID: string;
begin
  Result := '99';
end;

{ TSeIP20_99_00 }

class function TSeIP20_99_00.Bloco: string;
begin
  Result := '00';
end;

{ TSeIP20_99_00_00 }

procedure TSeIP20_99_00_00.SetText(const Value: string);
begin
  inherited;
  FCNPJ := Copy(Value, 7, 9);
  FNome := Copy(Value, 16, 70);
end;

class function TSeIP20_99_00_00.Tipo: string;
begin
  Result := '00';
end;

{ TSeIP20_99_01 }

class function TSeIP20_99_01.Bloco: string;
begin
  Result := '01';
end;

{ TSeIP20_99_01_01 }

procedure TSeIP20_99_01_01.SetText(const Value: string);
begin
  inherited;
  FLinhaEditada := Copy(Value, 7, 79);
  FTipoRegistro := Value[97];
  FTipoLinha := Value[98];
  FAtributo := Value[99];
  FConjunto := StrToIntDef(Copy(Value, 100, 2), -1);
  FNomeBloco := Copy(Value, 108, 30);
end;

class function TSeIP20_99_01_01.Tipo: string;
begin
  Result := '01';
end;

{ TRelatoSegmento }

procedure TRelatoSegmento.AdicionaFormatadoLinhas(Se: TSeIP20_99_01_01);
begin
  Se.Linha := FFormatadoLinhas.Add(Se) + 1;
end;

procedure TRelatoSegmento.AdicionaPosicionalCompromissosAnaliticos(
  Se: TSeIP20_02_01_10);
begin
  FPosicionalCompromissosAnaliticos.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalControleAdministrativo(
  Se: TSeIP20_01_01_11);
begin
  FPosicionalControleAdministrativo.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalControleSocietarioDetalhe(
  Se: TSeIP20_01_01_09);
begin
  FPosicionalControleSocietarioDetalhe.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalEvolucaoCompromissos(
  Se: TSeIP20_02_01_06);
begin
  FPosicionalEvolucaoCompromissos.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalFiliais(
  Se: TSeIP20_01_01_06);
begin
  FPosicionalFiliais.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalHistoricoPagamento(
  Se: TSeIP20_02_01_05);
begin
  FPosicionalHistoricoPagamento.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalHistoricoPagamentoQuantidadeTitulos(
  Se: TSeIP20_02_01_08);
begin
  FPosicionalHistoricoPagamentoQuantidadeTitulos.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalParticipacoesDetalhe(
  Se: TSeIP20_01_01_14);
begin
  FPosicionalParticipacoesDetalhe.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalReferenciaisNegocios(
  Se: TSeIP20_02_01_07);
begin
  FPosicionalReferenciaisNegocios.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalReferenciaisNegociosAnalitico(
  Se: TSeIP20_02_01_09);
begin
  FPosicionalReferenciaisNegociosAnalitico.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalRelacionamentoFornecedores(
  Se: TSeIP20_02_01_02);
begin
  FPosicionalRelacionamentoFornecedores.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalRelacionamentoFornecedoresAntigos(
  Se: TSeIP20_02_01_04);
begin
  FPosicionalRelacionamentoFornecedoresAntigos.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalRelacionamentoFornecedoresPeriodo(
  Se: TSeIP20_02_01_03);
begin
  FPosicionalRelacionamentoFornecedoresPeriodo.Add(Se);
end;

constructor TRelatoSegmento.Create;
begin
  inherited;
  FFormatadoLinhas := TObjectList.Create;
  FPosicionalFiliais := TObjectList.Create;
  FPosicionalControleSocietarioDetalhe := TObjectList.Create;
  FPosicionalControleAdministrativo := TObjectList.Create;
  FPosicionalParticipacoesDetalhe := TObjectList.Create;
  FPosicionalRelacionamentoFornecedores := TObjectList.Create;
  FPosicionalRelacionamentoFornecedoresPeriodo := TObjectList.Create;
  FPosicionalRelacionamentoFornecedoresAntigos := TObjectList.Create;
  FPosicionalHistoricoPagamento := TObjectList.Create;
  FPosicionalEvolucaoCompromissos := TObjectList.Create;
  FPosicionalReferenciaisNegocios := TObjectList.Create;
  FPosicionalHistoricoPagamentoQuantidadeTitulos := TObjectList.Create;
  FPosicionalReferenciaisNegociosAnalitico := TObjectList.Create;
  FPosicionalCompromissosAnaliticos := TObjectList.Create;
  FPosicionalPrincipaisFontesSegmentoConsolidado := TObjectList.Create;
  FPosicionalRelacionamentoFornecedoresSegmento := TObjectList.Create;
  FPosicionalRelacionamentoFornecedoresPeriodoSegmento := TObjectList.Create;
  FPosicionalHistoricoPagamentoSegmento := TObjectList.Create;
  FPosicionalEvolucaoCompromissosSegmento := TObjectList.Create;
  FPosicionalReferenciaisNegociosSegmento := TObjectList.Create;
  FPosicionalHistoricoPagamentoIndividual := TObjectList.Create;
  FPosicionalRelacionamentoFornecedoresIndividual := TObjectList.Create;
  FPosicionalEvolucaoCompromissosVencidos := TObjectList.Create;
  FPosicionalEvolucaoCompromissosAVencer := TObjectList.Create;
  FPosicionalHistoricoPagamentosCedente := TObjectList.Create;
  FPosicionalEvolucaoCompromissosCedente := TObjectList.Create;
  FPosicionaReferenciaisNegociosCedente := TObjectList.Create;
  FPosicionalRegistroConsultas := TObjectList.Create;
  FPosicionalUltimasConsultas := TObjectList.Create;
  FPosicionalAlerta := TObjectList.Create;
  FPosicionalPefin := TObjectList.Create;
  FPosicionalRefin := TObjectList.Create;
  FPosicionalConcentre := TObjectList.Create;
  FPosicionalConcentreResumo := TObjectList.Create;
  FPosicionalConcentreInapto := TObjectList.Create;
  FPosicionalConcentreProtesto := TObjectList.Create;
  FPosicionalConcentreAcaoJudicial := TObjectList.Create;
  FPosicionalConcentreFalencia := TObjectList.Create;
  FPosicionalConcentreFalenciaConcordata := TObjectList.Create;
  FPosicionalConcentreDividasVencidas := TObjectList.Create;
  FPosicionalInformacoesRecheque := TObjectList.Create;
  FPosicionalInformacoesRechequeCCF := TObjectList.Create;
  FPosicionalInformacoesRechequeDetalhe := TObjectList.Create;
  FPosicionalInformacoesRiskscoring := TObjectList.Create;
  FPosicionalRiskscoringMeses := TObjectList.Create;
  FPosicionalFatoresAutorizadores := TObjectList.Create;
  FPosicionalInformacoesAutorizadoresH := TObjectList.Create;
  FPosicionalInformacoesAutorizadoresE := TObjectList.Create;
  FPosicionalPrincipaisFontes := TObjectList.Create;
  FPosicionalFatoresAutorizadoresPQ := TObjectList.Create;
  FPosicionalInformacoesRiskscoringPrinad := TObjectList.Create;
  FPosicionalRiskscoringPrinadMeses := TObjectList.Create;
  FCentralTitulosSegmentoRegistroControleContabilNRCT := TObjectList.Create;
  FCentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT := TObjectList.Create;
  FCentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT := TObjectList.Create;
  FCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT := TObjectList.Create;
  FCentralTitulosSegmentoRegistroControleContabil := TObjectList.Create;
  FCentralTitulosSegmentoEvolucaoCompromissosVencidosCedente := TObjectList.Create;
  FCentralTitulosSegmentoEvolucaoCompromissosAVencerCedente := TObjectList.Create;
  FCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulos := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValor := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedio := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotal := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulos := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValor := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedio := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactorings := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotal := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactorings := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatistica := TObjectList.Create;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteSubGrupo := TObjectList.Create;
end;

destructor TRelatoSegmento.Destroy;
begin
  FFormatadoControle.Free;
  FFormatadoLinhas.Free;
  FPosicionalDadosControle.Free;
  FPosicionalFraseStatus.Free;
  FPosicionalContabilizacao.Free;
  FPosicionalIdentificacao.Free;
  FPosicionalEndereco.Free;
  FPosicionalLocalizacao.Free;
  FPosicionalAtividade.Free;
  FPosicionalFiliais.Free;
  FPosicionalPrincipaisProdutos.Free;
  FPosicionalControleSocietario.Free;
  FPosicionalControleSocietarioDetalhe.Free;
  FPosicionalControleAdministrativo.Free;
  FPosicionalParticipacoesDetalhe.Free;
  FPosicionalAntecessora.Free;
  FPosicionalPrincipaisFontes.Free;
  FPosicionalRelacionamentoFornecedores.Free;
  FPosicionalRelacionamentoFornecedoresPeriodo.Free;
  FPosicionalRelacionamentoFornecedoresAntigos.Free;
  FPosicionalHistoricoPagamento.Free;
  FPosicionalEvolucaoCompromissos.Free;
  FPosicionalReferenciaisNegocios.Free;
  FPosicionalHistoricoPagamentoQuantidadeTitulos.Free;
  FPosicionalReferenciaisNegociosAnalitico.Free;
  FPosicionalCompromissosAnaliticos.Free;
  FPosicionalPrincipaisFontesDataAtualizacao.Free;
  FPosicionalPrincipaisFontesSegmentoConsolidado.Free;
  FPosicionalRelacionamentoFornecedoresSegmento.Free;
  FPosicionalRelacionamentoFornecedoresPeriodoSegmento.Free;
  FPosicionalHistoricoPagamentoSegmento.Free;
  FPosicionalEvolucaoCompromissosSegmento.Free;
  FPosicionalReferenciaisNegociosSegmento.Free;
  FPosicionalHistoricoPagamentoIndividual.Free;
  FPosicionalRelacionamentoFornecedoresIndividual.Free;
  FPosicionalEvolucaoCompromissosVencidos.Free;
  FPosicionalEvolucaoCompromissosAVencer.Free;
  FPosicionalHistoricoPagamentosCedente.Free;
  FPosicionalEvolucaoCompromissosCedente.Free;
  FPosicionaReferenciaisNegociosCedente.Free;
  FPosicionalRegistroConsultas.Free;
  FPosicionalUltimasConsultas.Free;
  FPosicionalAlerta.Free;
  FPosicionalPefin.Free;
  FPosicionalRefin.Free;
  FPosicionalConcentre.Free;
  FPosicionalConcentreResumo.Free;
  FPosicionalConcentreInapto.Free;
  FPosicionalConcentreProtesto.Free;
  FPosicionalConcentreAcaoJudicial.Free;
  FPosicionalConcentreFalencia.Free;
  FPosicionalConcentreFalenciaConcordata.Free;
  FPosicionalConcentreDividasVencidas.Free;
  FPosicionalInformacoesRecheque.Free;
  FPosicionalInformacoesRechequeCCF.Free;
  FPosicionalInformacoesRechequeUltimaOcorrencia.Free;
  FPosicionalInformacoesRechequeDetalhe.Free;
  FPosicionalInformacoesRiskscoring.Free;
  FPosicionalInformacoesRiskscoringPrinad.Free;
  FPosicionalRiskscoringMeses.Free;
  FPosicionalRiskscoringPrinadMeses.Free;
  FPosicionalFatoresAutorizadores.Free;
  FPosicionalFatoresAutorizadoresPQ.Free;
  FPosicionalInformacoesAutorizadoresH.Free;
  FPosicionalInformacoesAutorizadoresE.Free;
  FCentralTitulosSegmentoRegistroControleContabilNRCT.Free;
  FCentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT.Free;
  FCentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT.Free;
  FCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT.Free;
  FCentralTitulosSegmentoRegistroControleContabil.Free;
  FCentralTitulosSegmentoEvolucaoCompromissosVencidosCedente.Free;
  FCentralTitulosSegmentoEvolucaoCompromissosAVencerCedente.Free;
  FCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulos.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValor.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedio.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotal.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulos.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValor.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedio.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactorings.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotal.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactorings.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatistica.Free;
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteSubGrupo.Free;
  inherited;
end;

function TRelatoSegmento.PosicionalReferenciaisNegociosAnaliticoQuantidade: Integer;
begin
  Result := FPosicionalReferenciaisNegociosAnalitico.Count;
end;

function TRelatoSegmento.GetFormatadoLinhas(
  Index: Integer): TSeIP20_99_01_01;
begin
  Result := FFormatadoLinhas[Index] as TSeIP20_99_01_01;
end;

function TRelatoSegmento.GetPosicionalAdministrativo(
  Index: Integer): TSeIP20_01_01_11;
begin
  Result := FPosicionalControleAdministrativo[Index] as TSeIP20_01_01_11;
end;

function TRelatoSegmento.GetPosicionalCompromissosAnaliticos(
  Index: Integer): TSeIP20_02_01_10;
begin
  Result := FPosicionalCompromissosAnaliticos[Index] as
    TSeIP20_02_01_10;
end;

function TRelatoSegmento.GetPosicionalControleSocietarioDetalhe(
  Index: Integer): TSeIP20_01_01_09;
begin
  Result := FPosicionalControleSocietarioDetalhe[Index] as TSeIP20_01_01_09
end;

function TRelatoSegmento.GetPosicionalEvolucaoCompromissos(
  Index: Integer): TSeIP20_02_01_06;
begin
  Result := FPosicionalEvolucaoCompromissos[Index] as
    TSeIP20_02_01_06;
end;

function TRelatoSegmento.GetPosicionalFiliais(
  Index: Integer): TSeIP20_01_01_06;
begin
  Result := FPosicionalFiliais[Index] as TSeIP20_01_01_06;
end;

function TRelatoSegmento.GetPosicionalHistoricoPagamento(
  Index: Integer): TSeIP20_02_01_05;
begin
  Result := FPosicionalHistoricoPagamento[Index] as
    TSeIP20_02_01_05;
end;

function TRelatoSegmento.GetPosicionalHistoricoPagamentoQuantidadeTitulos(
  Index: Integer): TSeIP20_02_01_08;
begin
  Result := FPosicionalHistoricoPagamentoQuantidadeTitulos[Index] as
    TSeIP20_02_01_08;
end;

function TRelatoSegmento.GetPosicionalParticipacoesDetalhe(
  Index: Integer): TSeIP20_01_01_14;
begin
  Result := FPosicionalParticipacoesDetalhe[Index] as
    TSeIP20_01_01_14
end;

function TRelatoSegmento.GetPosicionalReferenciaisNegocios(
  Index: Integer): TSeIP20_02_01_07;
begin
  Result := FPosicionalReferenciaisNegocios[Index] as
    TSeIP20_02_01_07;
end;

function TRelatoSegmento.GetPosicionalReferenciaisNegociosAnalitico(
  Index: Integer): TSeIP20_02_01_09;
begin
  Result := FPosicionalReferenciaisNegociosAnalitico[Index] as
    TSeIP20_02_01_09;
end;

function TRelatoSegmento.GetPosicionalRelacionamentoFornecedores(
  Index: Integer): TSeIP20_02_01_02;
begin
  Result := FPosicionalRelacionamentoFornecedores[Index] as
    TSeIP20_02_01_02;
end;

function TRelatoSegmento.GetPosicionalRelacionamentoFornecedoresAntigos(
  Index: Integer): TSeIP20_02_01_04;
begin
  Result := FPosicionalRelacionamentoFornecedoresAntigos[Index] as
    TSeIP20_02_01_04;
end;

function TRelatoSegmento.GetPosicionalRelacionamentoFornecedoresPeriodo(
  Index: Integer): TSeIP20_02_01_03;
begin
  Result := FPosicionalRelacionamentoFornecedoresPeriodo[Index] as
    TSeIP20_02_01_03;
end;

function TRelatoSegmento.FormatadoLinhasQuantidade: Integer;
begin
  Result := FFormatadoLinhas.Count;
end;

function TRelatoSegmento.PosicionalControleAdministrativoQuantidade: Integer;
begin
  Result := FPosicionalControleAdministrativo.Count;
end;

function TRelatoSegmento.PosicionalControleSocietarioDetalheQuantidade: Integer;
begin
  Result := FPosicionalControleSocietarioDetalhe.Count;
end;

function TRelatoSegmento.PosicionalEvolucaoCompromissosQuantidade: Integer;
begin
  Result := FPosicionalEvolucaoCompromissos.Count;
end;

function TRelatoSegmento.PosicionalFiliaisQuantidade: Integer;
begin
  Result := FPosicionalFiliais.Count
end;

function TRelatoSegmento.PosicionalHistoricoPagamentoQuantidadeTitulosQuantidade: Integer;
begin
  Result := FPosicionalHistoricoPagamentoQuantidadeTitulos.Count;
end;

function TRelatoSegmento.PosicionalHistoricoPagamentoQuantidade: Integer;
begin
  Result := FPosicionalHistoricoPagamento.Count;
end;

function TRelatoSegmento.PosicionalParticipacoesDetalheQuantidade: Integer;
begin
  Result := FPosicionalParticipacoesDetalhe.Count;
end;

function TRelatoSegmento.PosicionalReferenciaisNegociosQuantidade: Integer;
begin
  Result := FPosicionalReferenciaisNegocios.Count;
end;

function TRelatoSegmento.PosicionalRelacionamentoFornecedoresAntigosQuantidade: Integer;
begin
  Result := FPosicionalRelacionamentoFornecedoresAntigos.Count;
end;

function TRelatoSegmento.PosicionalRelacionamentoFornecedoresPeriodoQuantidade: Integer;
begin
  Result := FPosicionalRelacionamentoFornecedoresPeriodo.Count;
end;

function TRelatoSegmento.PosicionalRelacionamentoFornecedoresQuantidade: Integer;
begin
  Result := FPosicionalRelacionamentoFornecedores.Count;
end;

function TRelatoSegmento.PosicionalCompromissosAnaliticosQuantidade: Integer;
begin
  Result := FPosicionalCompromissosAnaliticos.Count;
end;

function TRelatoSegmento.GetPosicionalPrincipaisFontesSegmentoConsolidado(
  Index: Integer): TSeIP20_02_01_12;
begin
  Result := FPosicionalPrincipaisFontesSegmentoConsolidado[Index] as
    TSeIP20_02_01_12;
end;

procedure TRelatoSegmento.AdicionaPosicionalPrincipaisFontesSegmentoConsolidado(
  Se: TSeIP20_02_01_12);
begin
  FPosicionalPrincipaisFontesSegmentoConsolidado.Add(Se);
end;

function TRelatoSegmento.PosicionalPrincipaisFontesSegmentoConsolidadoQuantidade: Integer;
begin
  Result := FPosicionalPrincipaisFontesSegmentoConsolidado.Count;
end;

function TRelatoSegmento.GetPosicionalRelacionamentoFornecedoresPeriodoSegmento(
  Index: Integer): TSeIP20_02_01_14;
begin
  Result :=
    FPosicionalRelacionamentoFornecedoresPeriodoSegmento[Index] as
    TSeIP20_02_01_14;
end;

procedure TRelatoSegmento.AdicionaPosicionalRelacionamentoFornecedoresPeriodoSegmento(
  Se: TSeIP20_02_01_14);
begin
  FPosicionalRelacionamentoFornecedoresPeriodoSegmento.Add(Se);
end;

function TRelatoSegmento.PosicionalRelacionamentoFornecedoresPeriodoSegmentoQuantidade: Integer;
begin
  Result :=
    FPosicionalRelacionamentoFornecedoresPeriodoSegmento.Count;
end;

function TRelatoSegmento.GetPosicionalHistoricoPagamentoSegmento(Index: Integer): TSeIP20_02_01_15;
begin
  Result := FPosicionalHistoricoPagamentoSegmento[Index] as
    TSeIP20_02_01_15;
end;

procedure TRelatoSegmento.AdicionaPosicionalHistoricoPagamentoSegmento(
  Se: TSeIP20_02_01_15);
begin
  FPosicionalHistoricoPagamentoSegmento.Add(Se);
end;

function TRelatoSegmento.GetPosicionalEvolucaoCompromissosSegmento(
  Index: Integer): TSeIP20_02_01_16;
begin
  Result := FPosicionalEvolucaoCompromissosSegmento[Index] as
    TSeIP20_02_01_16;
end;

procedure TRelatoSegmento.AdicionaPosicionalEvolucaoCompromissosSegmento(
  Se: TSeIP20_02_01_16);
begin
  FPosicionalEvolucaoCompromissosSegmento.Add(Se);
end;

function TRelatoSegmento.PosicionalEvolucaoCompromissosSegmentoQuantidade: Integer;
begin
  Result := FPosicionalEvolucaoCompromissosSegmento.Count;
end;

function TRelatoSegmento.GetPosicionalReferenciaisNegociosSegmento(
  Index: Integer): TSeIP20_02_01_17;
begin
  Result := FPosicionalReferenciaisNegociosSegmento[Index] as
    TSeIP20_02_01_17;
end;

procedure TRelatoSegmento.AdicionaPosicionalReferenciaisNegociosSegmento(
  Se: TSeIP20_02_01_17);
begin
  FPosicionalReferenciaisNegociosSegmento.Add(Se);
end;

function TRelatoSegmento.PosicionalReferenciaisNegociosSegmentoQuantidade: Integer;
begin
  Result := FPosicionalReferenciaisNegociosSegmento.Count;
end;

function TRelatoSegmento.GetPosicionalHistoricoPagamentoIndividual(
  Index: Integer): TSeIP20_02_01_18;
begin
  Result := FPosicionalHistoricoPagamentoIndividual[Index] as
    TSeIP20_02_01_18;
end;

procedure TRelatoSegmento.AdicionaPosicionalHistoricoPagamentoIndividual(
  Se: TSeIP20_02_01_18);
begin
  FPosicionalHistoricoPagamentoIndividual.Add(Se);
end;

function TRelatoSegmento.PosicionalHistoricoPagamentoIndividualQuantidade: Integer;
begin
  Result := FPosicionalHistoricoPagamentoIndividual.Count;
end;

function TRelatoSegmento.GetPosicionalRelacionamentoFornecedoresIndividual(
  Index: Integer): TSeIP20_02_01_19;
begin
  Result := FPosicionalRelacionamentoFornecedoresIndividual[Index] as
    TSeIP20_02_01_19;
end;

procedure TRelatoSegmento.AdicionaPosicionalRelacionamentoFornecedoresIndividual(
  Se: TSeIP20_02_01_19);
begin
  FPosicionalRelacionamentoFornecedoresIndividual.Add(Se);
end;

function TRelatoSegmento.PosicionalRelacionamentoFornecedoresIndividualQuantidade: Integer;
begin
  Result := FPosicionalRelacionamentoFornecedoresIndividual.Count;
end;

function TRelatoSegmento.GetPosicionalEvolucaoCompromissosVencidos(
  Index: Integer): TSeIP20_02_01_20;
begin
  Result := FPosicionalEvolucaoCompromissosVencidos[Index] as
    TSeIP20_02_01_20
end;

procedure TRelatoSegmento.AdicionaPosicionalEvolucaoCompromissosVencidos(
  Se: TSeIP20_02_01_20);
begin
  FPosicionalEvolucaoCompromissosVencidos.Add(Se);
end;

function TRelatoSegmento.PosicionalEvolucaoCompromissosVencidosQuantidade: Integer;
begin
  Result :=
    FPosicionalEvolucaoCompromissosVencidos.Count;
end;

function TRelatoSegmento.GetPosicionalAlerta(
  Index: Integer): TSeIP20_03_01_03;
begin
  Result := FPosicionalAlerta[Index] as TSeIP20_03_01_03;
end;

function TRelatoSegmento.GetPosicionalEvolucaoCompromissosAVencer(
  Index: Integer): TSeIP20_02_01_21;
begin
  Result := FPosicionalEvolucaoCompromissosAVencer[Index] as TSeIP20_02_01_21;
end;

function TRelatoSegmento.GetPosicionalEvolucaoCompromissosCedente(
  Index: Integer): TSeIP20_02_01_26;
begin
  Result := FPosicionalEvolucaoCompromissosCedente[Index] as TSeIP20_02_01_26;
end;

function TRelatoSegmento.GetPosicionalFatoresAutorizadores(
  Index: Integer): TSeIP20_07_01_02;
begin
  Result := FPosicionalFatoresAutorizadores[Index] as TSeIP20_07_01_02;
end;

function TRelatoSegmento.GetPosicionalHistoricoPagamentosCedente(
  Index: Integer): TSeIP20_02_01_25;
begin
  Result := FPosicionalHistoricoPagamentosCedente[Index] as TSeIP20_02_01_25;
end;

function TRelatoSegmento.GetPosicionalInformacoesAutorizadoresE(
  Index: Integer): TSeIP20_07_01_05;
begin
  Result := FPosicionalInformacoesAutorizadoresE[Index] as TSeIP20_07_01_05;
end;

function TRelatoSegmento.GetPosicionalInformacoesAutorizadoresH(
  Index: Integer): TSeIP20_07_01_04;
begin
  Result := FPosicionalInformacoesAutorizadoresH[Index] as TSeIP20_07_01_04;
end;

function TRelatoSegmento.GetPosicionalConcentreAcaoJudicial(
  Index: Integer): TSeIP20_04_04_01;
begin
  Result := FPosicionalConcentreAcaoJudicial[Index] as TSeIP20_04_04_01;
end;

function TRelatoSegmento.GetPosicionalConcentreDividasVencidas(
  Index: Integer): TSeIP20_04_07_01;
begin
  Result := FPosicionalConcentreDividasVencidas[Index] as TSeIP20_04_07_01;
end;

function TRelatoSegmento.GetPosicionalConcentreFalencia(
  Index: Integer): TSeIP20_04_05_01;
begin
  Result := FPosicionalConcentreFalencia[Index] as TSeIP20_04_05_01;
end;

function TRelatoSegmento.GetPosicionalConcentreFalenciaConcordata(
  Index: Integer): TSeIP20_04_06_01;
begin
  Result := FPosicionalConcentreFalenciaConcordata[Index] as TSeIP20_04_06_01;
end;

function TRelatoSegmento.GetPosicionalConcentreInapto(
  Index: Integer): TSeIP20_04_02_03;
begin
  Result := FPosicionalConcentreInapto[Index] as TSeIP20_04_02_03;
end;

function TRelatoSegmento.GetPosicionalConcentreProtesto(
  Index: Integer): TSeIP20_04_03_01;
begin
  Result := FPosicionalConcentreProtesto[Index] as TSeIP20_04_03_01;
end;

function TRelatoSegmento.GetPosicionalConcentreResumo(
  Index: Integer): TSeIP20_04_02_02;
begin
  Result := FPosicionalConcentreResumo[Index] as TSeIP20_04_02_02;
end;

function TRelatoSegmento.GetPosicionalInformacoesRecheque(
  Index: Integer): TSeIP20_04_08_01;
begin
  Result := FPosicionalInformacoesRecheque[Index] as TSeIP20_04_08_01;
end;

function TRelatoSegmento.GetPosicionalInformacoesRechequeCCF(
  Index: Integer): TSeIP20_04_09_01;
begin
  Result := FPosicionalInformacoesRechequeCCF[Index] as TSeIP20_04_09_01;
end;

function TRelatoSegmento.GetPosicionalInformacoesRechequeDetalhe(
  Index: Integer): TSeIP20_04_10_01;
begin
  Result := FPosicionalInformacoesRechequeDetalhe[Index] as TSeIP20_04_10_01;
end;

function TRelatoSegmento.GetPosicionalInformacoesRiskscoring(
  Index: Integer): TSeIP20_07_01_99;
begin
  Result := FPosicionalInformacoesRiskscoring[Index] as TSeIP20_07_01_99;
end;

function TRelatoSegmento.GetPosicionalPefin(
  Index: Integer): TSeIP20_04_01_01;
begin
  Result := FPosicionalPefin[Index] as TSeIP20_04_01_01;
end;

function TRelatoSegmento.GetPosicionalRefin(
  Index: Integer): TSeIP20_04_01_02;
begin
  Result := FPosicionalRefin[Index] as TSeIP20_04_01_02;
end;

function TRelatoSegmento.GetPosicionalRegistroConsultas(
  Index: Integer): TSeIP20_03_01_01;
begin
  Result := FPosicionalRegistroConsultas[Index] as TSeIP20_03_01_01;
end;

function TRelatoSegmento.GetPosicionalRiskscoringMeses(
  Index: Integer): TSeIP20_07_01_01;
begin
  Result := FPosicionalRiskscoringMeses[Index] as TSeIP20_07_01_01;
end;

function TRelatoSegmento.GetPosicionalUltimasConsultas(
  Index: Integer): TSeIP20_03_01_02;
begin
  Result := FPosicionalUltimasConsultas[Index] as TSeIP20_03_01_02;
end;

function TRelatoSegmento.GetPosicionaReferenciaisNegociosCedente(
  Index: Integer): TSeIP20_02_01_27;
begin
  Result := FPosicionaReferenciaisNegociosCedente[Index] as TSeIP20_02_01_27;
end;

procedure TRelatoSegmento.AdicionaPosicionalAlerta(Se: TSeIP20_03_01_03);
begin
  FPosicionalAlerta.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalEvolucaoCompromissosAVencer(
  Se: TSeIP20_02_01_21);
begin
  FPosicionalEvolucaoCompromissosAVencer.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalEvolucaoCompromissosCedente(
  Se: TSeIP20_02_01_26);
begin
  FPosicionalEvolucaoCompromissosCedente.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalFatoresAutorizadores(
  Se: TSeIP20_07_01_02);
begin
  FPosicionalFatoresAutorizadores.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalHistoricoPagamentosCedente(
  Se: TSeIP20_02_01_25);
begin
  FPosicionalHistoricoPagamentosCedente.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalInformacoesAutorizadoresE(
  Se: TSeIP20_07_01_05);
begin
  FPosicionalInformacoesAutorizadoresE.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalInformacoesAutorizadoresH(
  Se: TSeIP20_07_01_04);
begin
  FPosicionalInformacoesAutorizadoresH.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalConcentreAcaoJudicial(
  Se: TSeIP20_04_04_01);
begin
  FPosicionalConcentreAcaoJudicial.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalConcentreDividasVencidas(
  Se: TSeIP20_04_07_01);
begin
  FPosicionalConcentreDividasVencidas.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalConcentreFalencia(
  Se: TSeIP20_04_05_01);
begin
  FPosicionalConcentreFalencia.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalConcentreFalenciaConcordata(
  Se: TSeIP20_04_06_01);
begin
  FPosicionalConcentreFalenciaConcordata.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalConcentreInapto(
  Se: TSeIP20_04_02_03);
begin
  FPosicionalConcentreInapto.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalConcentreProtesto(
  Se: TSeIP20_04_03_01);
begin
  FPosicionalConcentreProtesto.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalConcentreResumo(
  Se: TSeIP20_04_02_02);
begin
  FPosicionalConcentreResumo.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalInformacoesRecheque(
  Se: TSeIP20_04_08_01);
begin
  FPosicionalInformacoesRecheque.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalInformacoesRechequeCCF(
  Se: TSeIP20_04_09_01);
begin
  FPosicionalInformacoesRechequeCCF.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalInformacoesRechequeDetalhe(
  Se: TSeIP20_04_10_01);
begin
  FPosicionalInformacoesRechequeDetalhe.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalInformacoesRiskscoring(
  Se: TSeIP20_07_01_99);
begin
  FPosicionalInformacoesRiskscoring.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalPefin(Se: TSeIP20_04_01_01);
begin
  FPosicionalPefin.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalRefin(Se: TSeIP20_04_01_02);
begin
  FPosicionalRefin.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalRegistroConsultas(
  Se: TSeIP20_03_01_01);
begin
  FPosicionalRegistroConsultas.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalRiskscoringMeses(
  Se: TSeIP20_07_01_01);
begin
  FPosicionalRiskscoringMeses.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionalUltimasConsultas(
  Se: TSeIP20_03_01_02);
begin
  FPosicionalUltimasConsultas.Add(Se);
end;

procedure TRelatoSegmento.AdicionaPosicionaReferenciaisNegociosCedente(
  Se: TSeIP20_02_01_27);
begin
  FPosicionaReferenciaisNegociosCedente.Add(Se);
end;

function TRelatoSegmento.PosicionalAlertaQuantidade: Integer;
begin
  Result := FPosicionalAlerta.Count;
end;

function TRelatoSegmento.PosicionalEvolucaoCompromissosAVencerQuantidade: Integer;
begin
  Result := FPosicionalEvolucaoCompromissosAVencer.Count;
end;

function TRelatoSegmento.PosicionalEvolucaoCompromissosCedenteQuantidade: Integer;
begin
  Result := FPosicionalEvolucaoCompromissosCedente.Count;
end;

function TRelatoSegmento.PosicionalFatoresAutorizadoresQuantidade: Integer;
begin
  Result := FPosicionalFatoresAutorizadores.Count;
end;

function TRelatoSegmento.PosicionalHistoricoPagamentosCedenteQuantidade: Integer;
begin
  Result := FPosicionalHistoricoPagamentosCedente.Count;
end;

function TRelatoSegmento.PosicionalInformacoesAutorizadoresEQuantidade: Integer;
begin
  Result := FPosicionalInformacoesAutorizadoresE.Count;
end;

function TRelatoSegmento.PosicionalInformacoesAutorizadoresHQuantidade: Integer;
begin
  Result := FPosicionalInformacoesAutorizadoresH.Count;
end;

function TRelatoSegmento.PosicionalConcentreAcaoJudicialQuantidade: Integer;
begin
  Result := FPosicionalConcentreAcaoJudicial.Count;
end;

function TRelatoSegmento.PosicionalConcentreDividasVencidasQuantidade: Integer;
begin
  Result := FPosicionalConcentreDividasVencidas.Count;
end;

function TRelatoSegmento.PosicionalConcentreFalenciaConcordataQuantidade: Integer;
begin
  Result := FPosicionalConcentreFalenciaConcordata.Count;
end;

function TRelatoSegmento.PosicionalConcentreFalenciaQuantidade: Integer;
begin
  Result := FPosicionalConcentreFalencia.Count;
end;

function TRelatoSegmento.PosicionalConcentreInaptoQuantidade: Integer;
begin
  Result := FPosicionalConcentreInapto.Count;
end;

function TRelatoSegmento.PosicionalConcentreProtestoQuantidade: Integer;
begin
  Result := FPosicionalConcentreProtesto.Count;
end;

function TRelatoSegmento.PosicionalConcentreResumoQuantidade: Integer;
begin
  Result := FPosicionalConcentreResumo.Count;
end;

function TRelatoSegmento.PosicionalInformacoesRechequeCCFQuantidade: Integer;
begin
  Result := FPosicionalInformacoesRechequeCCF.Count;
end;

function TRelatoSegmento.PosicionalInformacoesRechequeDetalheQuantidade: Integer;
begin
  Result := FPosicionalInformacoesRechequeDetalhe.Count;
end;

function TRelatoSegmento.PosicionalInformacoesRechequeQuantidade: Integer;
begin
  Result := FPosicionalInformacoesRecheque.Count;
end;

function TRelatoSegmento.PosicionalInformacoesRiskscoringQuantidade: Integer;
begin
  Result := FPosicionalInformacoesRiskscoring.Count;
end;

function TRelatoSegmento.PosicionalPefinQuantidade: Integer;
begin
  Result := FPosicionalPefin.Count;
end;

function TRelatoSegmento.PosicionalRefinQuantidade: Integer;
begin
  Result := FPosicionalRefin.Count;
end;

function TRelatoSegmento.PosicionalRegistroConsultasQuantidade: Integer;
begin
  Result := FPosicionalRegistroConsultas.Count;
end;

function TRelatoSegmento.PosicionalRiskscoringMesesQuantidade: Integer;
begin
  Result := FPosicionalRiskscoringMeses.Count;
end;

function TRelatoSegmento.PosicionalUltimasConsultasQuantidade: Integer;
begin
  Result := FPosicionalUltimasConsultas.Count;
end;

function TRelatoSegmento.PosicionaReferenciaisNegociosCedenteQuantidade: Integer;
begin
  Result := FPosicionaReferenciaisNegociosCedente.Count;
end;

function TRelatoSegmento.GetPosicionalPrincipaisFontes(
  Index: Integer): TSeIP20_02_01_01;
begin
  Result := FPosicionalPrincipaisFontes[Index] as TSeIP20_02_01_01;
end;

procedure TRelatoSegmento.AdicionaPosicionalPrincipaisFontes(
  Se: TSeIP20_02_01_01);
begin
  FPosicionalPrincipaisFontes.Add(Se);
end;

function TRelatoSegmento.PosicionalPrincipaisFontesQuantidade: Integer;
begin
  Result := FPosicionalPrincipaisFontes.Count;
end;

function TRelatoSegmento.PosicionalHistoricoPagamentoSegmentoQuantidade: Integer;
begin
  Result := FPosicionalHistoricoPagamentoSegmento.Count;
end;

function TRelatoSegmento.GetPosicionalFatoresAutorizadoresPQ(
  Index: Integer): TSeIP20_07_01_03;
begin
  Result := PosicionalFatoresAutorizadoresPQ[Index] as TSeIP20_07_01_03;
end;

procedure TRelatoSegmento.AdicionaPosicionalFatoresAutorizadoresPQ(
  Se: TSeIP20_07_01_03);
begin
  FPosicionalFatoresAutorizadoresPQ.Add(Se);
end;

function TRelatoSegmento.PosicionalFatoresAutorizadoresPQQuantidade: Integer;
begin
  Result := FPosicionalFatoresAutorizadoresPQ.Count;
end;

function TRelatoSegmento.GetPosicionalInformacoesRiskscoringPrinad(
  Index: Integer): TSeIP20_07_01_06;
begin
  Result := FPosicionalInformacoesRiskscoringPrinad[Index] as TSeIP20_07_01_06;
end;

procedure TRelatoSegmento.AdicionaPosicionalInformacoesRiskscoringPrinad(
  Se: TSeIP20_07_01_06);
begin
  FPosicionalInformacoesRiskscoringPrinad.Add(Se);
end;

function TRelatoSegmento.PosicionalInformacoesRiskscoringPrinadQuantidade: Integer;
begin
  Result := FPosicionalInformacoesRiskscoringPrinad.Count;
end;

function TRelatoSegmento.GetPosicionalRiskscoringPrinadMeses(
  Index: Integer): TSeIP20_07_01_09;
begin
  Result := FPosicionalRiskscoringPrinadMeses[Index] as TSeIP20_07_01_09;
end;

procedure TRelatoSegmento.AdicionaPosicionalRiskscoringPrinadMeses(
  Se: TSeIP20_07_01_09);
begin
  FPosicionalRiskscoringPrinadMeses.Add(Se);
end;

function TRelatoSegmento.PosicionalRiskscoringPrinadMesesQuantidade: Integer;
begin
  Result := FPosicionalRiskscoringPrinadMeses.Count;
end;

function TRelatoSegmento.GetPosicionalConcentre(
  Index: Integer): TSeIP20_04_02_01;
begin
  Result := FPosicionalConcentre[Index] as TSeIP20_04_02_01;
end;

procedure TRelatoSegmento.AdicionaPosicionalConcentre(
  Se: TSeIP20_04_02_01);
begin
  FPosicionalConcentre.Add(Se);
end;

function TRelatoSegmento.PosicionalConcentreQuantidade: Integer;
begin
  Result := FPosicionalConcentre.Count;
end;

function TRelatoSegmento.GetPosicionalRelacionamentoFornecedoresSegmento(
  Index: Integer): TSeIP20_02_01_13;
begin
  Result := FPosicionalRelacionamentoFornecedoresSegmento[Index] as TSeIP20_02_01_13;
end;

procedure TRelatoSegmento.AdicionaPosicionalRelacionamentoFornecedoresSegmento(
  Se: TSeIP20_02_01_13);
begin
  FPosicionalRelacionamentoFornecedoresSegmento.Add(Se);
end;

function TRelatoSegmento.PosicionalRelacionamentoFornecedoresSegmentoQuantidade: Integer;
begin
  Result := FPosicionalRelacionamentoFornecedoresSegmento.Count;
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoRegistroControleContabilNRCT(
  Se: TSeIP20_89_00_00);
begin
  FCentralTitulosSegmentoRegistroControleContabilNRCT.Add(Se);
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT(
  Se: TSeIP20_89_01_01);
begin
  FCentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT.Add(Se);
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT(
  Se: TSeIP20_89_01_02);
begin
  FCentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT.Add(Se);
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT(
  Se: TSeIP20_89_01_03);
begin
  FCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT.Add(Se);
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT(
  Se: TSeIP20_89_02_01);
begin
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT.Add(Se);
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT(
  Se: TSeIP20_89_02_02);
begin
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT.Add(Se);
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT(
  Se: TSeIP20_89_02_03);
begin
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT.Add(Se);
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT(
  Se: TSeIP20_89_02_04);
begin
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT.Add(Se);
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT(
  Se: TSeIP20_89_02_05);
begin
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT.Add(Se);
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT(
  Se: TSeIP20_89_02_06);
begin
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT.Add(Se);
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT(
  Se: TSeIP20_89_02_07);
begin
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT.Add(Se);
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT(
  Se: TSeIP20_89_02_08);
begin
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT.Add(Se);
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT(
  Se: TSeIP20_89_02_09);
begin
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT.Add(Se);
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT(
  Se: TSeIP20_89_02_10);
begin
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT.Add(Se);
end;

procedure TRelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT(
  Se: TSeIP20_89_02_11);
begin
  FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT.Add(Se);
end;

function TRelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoRegistroControleContabilQuantidadeNRCT: Integer;
begin
  Result :=
    FCentralTitulosSegmentoRegistroControleContabilNRCT.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoEvolucaoCompromissosAVencerCedente.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotal.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoEvolucaoCompromissosVencidosCedente.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulos.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedio.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValor.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotal.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactorings.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulos.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactorings.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedio.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValor.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotal.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatistica.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoHistoricoPagamentosVisaoCedenteSubGrupoQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteSubGrupo.Count;
end;

function TRelatoSegmento.CentralTitulosSegmentoRegistroControleContabilQuantidade: Integer;
begin
  Result :=
    FCentralTitulosSegmentoRegistroControleContabil.Count;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoRegistroControleContabilNRCT(
  Index: Integer): TSeIP20_89_00_00;
begin
  Result :=
    FCentralTitulosSegmentoRegistroControleContabilNRCT[Index] as
    TSeIP20_89_00_00;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT(
  Index: Integer): TSeIP20_89_01_01;
begin
  Result :=
    FCentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT[Index] as
    TSeIP20_89_01_01;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT(
  Index: Integer): TSeIP20_89_01_02;
begin
  Result :=
    FCentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT[Index] as
    TSeIP20_89_01_02;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT(
  Index: Integer): TSeIP20_89_01_03;
begin
  Result :=
    FCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT[Index] as
    TSeIP20_89_01_03;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT(
  Index: Integer): TSeIP20_89_02_01;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT[Index] as
    TSeIP20_89_02_01;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT(
  Index: Integer): TSeIP20_89_02_02;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT[Index] as
    TSeIP20_89_02_02;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT(
  Index: Integer): TSeIP20_89_02_03;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT[Index] as
    TSeIP20_89_02_03;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT(
  Index: Integer): TSeIP20_89_02_04;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT[Index] as
    TSeIP20_89_02_04;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT(
  Index: Integer): TSeIP20_89_02_05;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT[Index] as
    TSeIP20_89_02_05;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT(
  Index: Integer): TSeIP20_89_02_06;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT[Index] as
    TSeIP20_89_02_06;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT(
  Index: Integer): TSeIP20_89_02_07;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT[Index] as
    TSeIP20_89_02_07;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT(
  Index: Integer): TSeIP20_89_02_08;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT[Index] as
    TSeIP20_89_02_08;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT(
  Index: Integer): TSeIP20_89_02_09;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT[Index] as
    TSeIP20_89_02_09;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT(
  Index: Integer): TSeIP20_89_02_10;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT[Index] as
    TSeIP20_89_02_10;
end;

function TRelatoSegmento.GetCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT(
  Index: Integer): TSeIP20_89_02_11;
begin
  Result :=
    FCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT[Index] as
    TSeIP20_89_02_11;
end;

{ TArquivoIP20 }

procedure TArquivoIP20.SetText(const Value: string);
begin
end;

{ TComunicacaoIP20 }

constructor TComunicacaoIP20.Create(ASerasa: TSerasa);
begin
  inherited;
  FConfiguracao := TDadosConfiguracaoRelatoSegmento.Create;
end;

destructor TComunicacaoIP20.Destroy;
begin
  FConfiguracao.Free;
  inherited;
end;

function TComunicacaoIP20.EnviaTransacao: Boolean;
begin
  Result := False;
end;

function TComunicacaoIP20.GetText: string;

  procedure M(const S: string);
  begin
    Result := Result + S;
  end;

const
  RiskScoring: array [0..2] of Char = (' ', 'K', 'S');
  MonitoreDiasIndefinidos = 999;
  IndicadorRiskAtacadista: array [0..1] of Char = ('N', 'S');
var
  {o primeiro parâmetro é o "quadro social" e o segundo é
    "participações".}
  QuadroSocialParticipacoes: array [Boolean, Boolean] of Char;
  Monitore: array [Boolean] of string;
  DiasMonitore: array [Boolean] of string;
  CentralDeTitulos: array [Boolean] of string;
  ConsultaCentralDeTitulos: array [Boolean] of string;
begin
  QuadroSocialParticipacoes[False, False] := '0';
  QuadroSocialParticipacoes[False, True] := '3';
  QuadroSocialParticipacoes[True, False] := '1';
  QuadroSocialParticipacoes[True, True] := '2';
  DiasMonitore[False] := TSeMetodos.PoeLetraEsq(
    IntToStr(Serasa.DiasMonitore), 3, '0');
  DiasMonitore[True] := 'IND';
  Monitore[False] := StringOfChar(' ', 54);
  Monitore[True] := 'S' +
    DiasMonitore[Serasa.DiasMonitore = MonitoreDiasIndefinidos] +
    'MONITORE' + StringOfChar(' ', 12) +
    TSeMetodos.PoeLetra(Serasa.MonitoreGrupoEMail, 15) +
    StringOfChar(' ', 15);
  CentralDeTitulos[False] := StringOfChar(' ', 3);
  CentralDeTitulos[True] := '028';

  ConsultaCentralDeTitulos[False] := StringOfChar(' ', 1);
  ConsultaCentralDeTitulos[True] := 'S';

  M(inherited GetText);
  //CÓDIGO DA TRANSAÇÃO SERASA LITERAL IP20 0-4
  M('IP20');
  //CÓDIGO DA OPÇÃO DE CONSULTA 5-8
  M('RELA');
  //INDICADOR DA FORMA DE DISPONIBILIZAÇÃO DO RESULTADO DA CONSULTA 9-9
  M('M');
  //TIPO DE TS A SER GERADA 10-10
  M('2');
  //NOME DA TS A SER GRAVADA 11-18
  M(StringOfChar(' ', 8));
  //NÚMERO DO CNPJ PARA CONSULTA 19-27
  M(TSeMetodos.PoeLetraEsq(TSeMetodos.SoNumero(Copy(
    CNPJ, 1, Pos('/', CNPJ))), 9, '0'));
  //TIPO DE MOEDA 28-28
  M('2');
  //TIPO DE STRING DESEJADO NA CONSULTA, VALORES VÁLIDOS 29-29
  M('3');
  //INDICADOR (“S” ou “N”) PARA REGISTRAR A CONSULTA POR CENTRO DE CUSTO DO CLIENTE 30-30
  M('N');
  //CÓDIGO DO CENTRO DE CUSTO PARA EFEITO DE FATURAMENTO 31-42
  M(StringOfChar(' ', 12));
  //TIPO DE COBRANÇA DIFERENCIADA 43-43
  M(QuadroSocialParticipacoes[FConfiguracao.ConsultaQuadroSocial,
    FConfiguracao.ConsultaParticipacoes]);
  //IDIOMA 44-44
  M('3');
  //TIPO DE CONCENTRE POR SOLICITACAO 45-45
  M('1');
  //SOLICITACAO DE RISKSCORING 46-46
  M(RiskScoring[FConfiguracao.CalculoRiskScoring]);
  //SOLICITACAO DE AUTORIZADOR 47-47
  M(' ');
  //SOLICITACAO DE PRODUTO PARA SEGMENTO 48-50
  M(CentralDeTitulos[FConfiguracao.ConsultaCentralDeTitulos]);
  //SOLICITACAO DE PRODUTO PARA SEGMENTO(PARA DOIS SEGM) 51-53
  M(StringOfChar(' ', 3));
  //SOLICITACAO DE PRODUTO PARA SEGMENTO(PARA TRES SEGM) 54-56
  M(StringOfChar(' ', 3));
  //SOLICITACAO DE PRODUTO PARA SEGMENTO(PARA QUATRO SE) 57-59
  M(StringOfChar(' ', 3));
  //SOLICITACAO DE PRODUTO PARA SEGMENTO(PARA CINCO SEG) 60-62
  M(StringOfChar(' ', 3));
  //ÁREA RESERVADA  64-131
  M(StringOfChar(' ', 68));
  //MODELOS DO CALCULO DE RISKSCORING
  {TODO -cSerasa -oAlex:
Obs: Informação é obrigatória quando o campo Riskscoring for igual a ‘E’

CREDIT RISKSCORING – 22 CLASSES
CK30 = Horizonte de 6 meses
CK50 = Horizonte de 12 meses

CREDIT RISKSCORING 3.0 – 22 CLASSES
RK6M = Horizonte de 6 meses
RK12 = Horizonte de 12 meses 132-135}
  M(StringOfChar(' ', 4));
  //SOLICITAÇÃO DE MONITORAMENTO DO CNPJ CONSULTADO NO PRODUTO GERENCIE CARTEIRA
  //QUANTIDADE DE DIAS DE MONITORAMENTO
  //PERFIL DO CLIENTE
  //GRUPO DE E-MAIL (OPCIONAL)
  //REFERÊNCIA (OPCIONAL) 136-136
  M(Monitore[FConfiguracao.ConsultaMonitore]);
  //USO INTERNO DA SERASA - DEIXAR EM BRANCO
  M(StringOfChar(' ', 12));
  //USO INTERNO DA SERASA - DEIXAR EM BRANCO
  M(StringOfChar(' ', 9));
  //INDICATIVO DE SOLICITAÇÃO DO MÓDULO DE VERIFICAÇÃO DE TÍTULOS.
  {TODO -cSerasa -oAlex:
"S" - FAZ PESQUISA DA DUPLICATA INFORMADA
(Alex) pelo que eu entendi, esse é um recurso interessante do ponto de vista da Factoring,
pois permite que se faça pesquisa com relação a duplicata do borderô, os próximos campos
se referem a isso}
  M(StringOfChar(' ', 1));
  //FILIAL DO CNPJ DO SACADO (CNPJ DA CONSULTA) - OBS: SE NÃO INFORMADO SERÁ ASSUMIDO A FILIAL 0001–MATRIZ
  M(StringOfChar(' ', 4));
  //NÚMERO DO CNPJ DO CEDENTE
  M(StringOfChar(' ', 9));
  //FILIAL DO CNPJ DO CEDENTE - OBS: SE NÃO INFORMADO SERÁ ASSUMIDO A FILIAL 0001–MATRIZ
  M(StringOfChar(' ', 4));
  //NÚMERO DA DUPLICATA
  M(StringOfChar(' ', 32));
  //DATA DE VENCIMENTO DA DUPLICATA (AAAAMMDD)
  M(StringOfChar(' ', 8));
  //USO INTERNO DA SERASA
  M(StringOfChar(' ', 100));
  //RESERVADO
  M(StringOfChar(' ', 1));
  //INDICADOR SE FEATURE ESTA SENDO MONITORADO NO GERENCIE
  {TODO -cSerasa -oAlex:
Para opção IP7Y
OBS: PARTICIPAÇÕES NÃO TEM MONITORAMENTO
0-NÃO MONITORA QS E NÃO MONITORA RS
1-MONITORA QS E MONITORA RS
2-MONITORA QS
3-MONITORA RS}
  M(StringOfChar(' ', 1));
  //NOME DA CONFIGURAÇÃO PERSONALIZADA UTILIZADA NA CONSULTA
  M(StringOfChar(' ', 20));
  //INDICADOR DE FATURAMENTO PRESUMIDO
  {TODO -cSerasa -oAlex:
N=NÃO QUER FATURAM. PRESUMIDO
S=QUER FATURAM. PRESUMIDO E COBRA NO RELATO}
  M(StringOfChar(' ', 1));
  //INDICADOR SE VAI FATURAR A FEATURE RISKSCORING NO GESTOR (IP38/IP7Y)
  {TODO -cSerasa -oAlex:
N=NÃO FATURA    S=FATURA}
  M(StringOfChar(' ', 1));
  //INDICADOR DE FEATURE LIMITE PJ
  {TODO -cSerasa -oAlex:
N=NÃO QUER LIMITE PJ    S=QUER LIMITE PJ}
  M(StringOfChar(' ', 1));
  //AREA RESERVADA SERASA
  M(StringOfChar(' ', 26));
  //AREA RESERVADA SERASA
  M(StringOfChar(' ', 6));
  //INDICADOR DE SOFTWAREHOUSE = ‘1’
  M('1');
  //NUMERO DO CNPJ DA SOFTWAREHOUSE (9 posições)
  M(CodigoWBAnaSerasaRaizCNPJ);
  //INDICADOR DE FEATURE DE REGISTRO DE CONSULTA (= 'H')
  M(' ');
  //INDICADOR DE RISK ATACADISTA  (="S")
  M(IndicadorRiskAtacadista[FConfiguracao.IndicadorRiskAtacadista]);
  //AREA RESERVADA
  M(StringOfChar(' ', 4));
  //SOLICITAÇÃO DE INFORMAÇÕES DA CENTRAL DE TÍTULOS
  M(ConsultaCentralDeTitulos[FConfiguracao.ConsultaCentralDeTitulos]);
  //AREA RESERVADA
  M(StringOfChar(' ', 59));
end;

function TComunicacaoIP20.PosicaoTransacaoRetorno: Integer;
begin
  Result := 9;
end;

procedure TComunicacaoIP20.SetText(const Value: string);
var
  funcao, resto, codigo, mensagem: string;
  posicao: Integer;
  D: TSeIP20_Detalhe;
  EE: ESerasaReturn;
begin
  FTextOut := Value;
  EstaCompleto := False;
  funcao := Copy(Value, 2, 3);
  if SameText(funcao, 'INI') then
  begin
    inherited;
    posicao := Pos('#L', Value);
    resto := Copy(Value, posicao + 2, Length(Value));
    while (posicao > 0) and (resto <> '') do
    begin
      if FCacheDetalhes.TemCodigo(Copy(resto, 1, 6)) then
      begin
        FCacheDetalhes.Codigo := Copy(resto, 1, 6);
        D := FCacheDetalhes.Detalhe.Classe.Create(Self);
        D.Text := resto;
        Adiciona(D);
      end;
      posicao := Pos('#L', resto);
      resto := Copy(resto, posicao + 2, Length(resto));
    end;
    EstaCompleto := (Pos('#FIM', resto) > 0);
  end
  else if SameText(funcao, 'ERR') then
  begin
    codigo := Copy(Value, 13, 4);
    mensagem := Copy(Value, 17, 79);
    EE := ESerasaReturn.CreateFmt('%s. Erro (%s): %s',
      [Transacao, codigo, mensagem]);
    EE.ReturnStringCode := codigo;
    EE.Mensagem := mensagem;
    EE.Transacao := Transacao;
    raise EE;
  end;
end;

class function TComunicacaoIP20.Transacao: TTipoTransacao;
begin
  Result := 'IP20';
end;

{ TClassificacao }

class procedure TClassificacao.SeIP20ParaRelatoSegmento(SeString: TSeString;
  RelatoSegmento: TRelatoSegmento);
var
  SeIP20: TSeIP20;
  laco: Integer;
begin
  if Assigned(SeString) then
  begin
    if not (SeString is TSeIP20) then
      raise ESerasa.Create('String de Detalhe inválida.');
    SeIP20 := SeString as TSeIP20;
    try
      RelatoSegmento.EstaCompleto := SeIP20.EstaCompleto;
      for laco := 0 to SeIP20.Quantidade - 1 do
      begin
        {neste momento, o SeIP20 recebido é classificado segundo
        o negócio para o RelatoSegmento. Notem que o RelatoSegmento recebe a
        referência dos objetos do SeIP20, e passará a ser o dono daqueles
        objetos.}
        if SeIP20[laco] is TSeIP20_99_00_00 then
          RelatoSegmento.FormatadoControle := SeIP20[laco] as
            TSeIP20_99_00_00
        else if SeIP20[laco] is TSeIP20_99_01_01 then
          RelatoSegmento.AdicionaFormatadoLinhas(SeIP20[laco] as
            TSeIP20_99_01_01)
        else if SeIP20[laco] is TSeIP20_01_00_00 then
          RelatoSegmento.PosicionalDadosControle := SeIP20[laco] as
            TSeIP20_01_00_00
        else if SeIP20[laco] is TSeIP20_01_01_00 then
          RelatoSegmento.PosicionalFraseStatus := SeIP20[laco] as
            TSeIP20_01_01_00
        else if SeIP20[laco] is TSeIP20_01_01_01 then
          RelatoSegmento.PosicionalContabilizacao := SeIP20[laco] as
            TSeIP20_01_01_01
        else if SeIP20[laco] is TSeIP20_01_01_02 then
          RelatoSegmento.PosicionalIdentificacao := SeIP20[laco] as
            TSeIP20_01_01_02
        else if SeIP20[laco] is TSeIP20_01_01_03 then
          RelatoSegmento.PosicionalEndereco := SeIP20[laco] as
            TSeIP20_01_01_03
        else if SeIP20[laco] is TSeIP20_01_01_04 then
          RelatoSegmento.PosicionalLocalizacao := SeIP20[laco] as
            TSeIP20_01_01_04
        else if SeIP20[laco] is TSeIP20_01_01_05 then
          RelatoSegmento.PosicionalAtividade := SeIP20[laco] as
            TSeIP20_01_01_05
        else if SeIP20[laco] is TSeIP20_01_01_07 then
          RelatoSegmento.PosicionalPrincipaisProdutos := SeIP20[laco] as
            TSeIP20_01_01_07
        else if SeIP20[laco] is TSeIP20_01_01_08 then
          RelatoSegmento.PosicionalControleSocietario := SeIP20[laco] as
            TSeIP20_01_01_08
        else if SeIP20[laco] is TSeIP20_01_01_09 then
          RelatoSegmento.AdicionaPosicionalControleSocietarioDetalhe(
            SeIP20[laco] as TSeIP20_01_01_09)
        else if SeIP20[laco] is TSeIP20_01_01_11 then
          RelatoSegmento.AdicionaPosicionalControleAdministrativo(
            SeIP20[laco] as TSeIP20_01_01_11)
        else if SeIP20[laco] is TSeIP20_01_01_14 then
          RelatoSegmento.AdicionaPosicionalParticipacoesDetalhe(
            SeIP20[laco] as TSeIP20_01_01_14)
        else if SeIP20[laco] is TSeIP20_01_01_16 then
          RelatoSegmento.PosicionalAntecessora := SeIP20[laco] as
            TSeIP20_01_01_16
        else if SeIP20[laco] is TSeIP20_02_01_01 then
          RelatoSegmento.AdicionaPosicionalPrincipaisFontes(SeIP20[laco] as
            TSeIP20_02_01_01)
        else if SeIP20[laco] is TSeIP20_02_01_02 then
          RelatoSegmento.AdicionaPosicionalRelacionamentoFornecedores(
            SeIP20[laco] as TSeIP20_02_01_02)
        else if SeIP20[laco] is TSeIP20_02_01_03 then
          RelatoSegmento.AdicionaPosicionalRelacionamentoFornecedoresPeriodo(
            SeIP20[laco] as TSeIP20_02_01_03)
        else if SeIP20[laco] is TSeIP20_02_01_04 then
          RelatoSegmento.AdicionaPosicionalRelacionamentoFornecedoresAntigos(
            SeIP20[laco] as TSeIP20_02_01_04)
        else if SeIP20[laco] is TSeIP20_02_01_05 then
          RelatoSegmento.AdicionaPosicionalHistoricoPagamento(
            SeIP20[laco] as TSeIP20_02_01_05)
        else if SeIP20[laco] is TSeIP20_02_01_06 then
          RelatoSegmento.AdicionaPosicionalEvolucaoCompromissos(
            SeIP20[laco] as TSeIP20_02_01_06)
        else if SeIP20[laco] is TSeIP20_02_01_07 then
          RelatoSegmento.AdicionaPosicionalReferenciaisNegocios(
            SeIP20[laco] as TSeIP20_02_01_07)
        else if SeIP20[laco] is TSeIP20_02_01_08 then
          RelatoSegmento.AdicionaPosicionalHistoricoPagamentoQuantidadeTitulos(
            SeIP20[laco] as TSeIP20_02_01_08)
        else if SeIP20[laco] is TSeIP20_02_01_09 then
          RelatoSegmento.AdicionaPosicionalReferenciaisNegociosAnalitico(
            SeIP20[laco] as TSeIP20_02_01_09)
        else if SeIP20[laco] is TSeIP20_02_01_10 then
          RelatoSegmento.AdicionaPosicionalCompromissosAnaliticos(
            SeIP20[laco] as TSeIP20_02_01_10)
        else if SeIP20[laco] is TSeIP20_02_01_11 then
          RelatoSegmento.PosicionalPrincipaisFontesDataAtualizacao :=
            SeIP20[laco] as TSeIP20_02_01_11
        else if SeIP20[laco] is TSeIP20_02_01_12 then
          RelatoSegmento.AdicionaPosicionalPrincipaisFontesSegmentoConsolidado(
            SeIP20[laco] as TSeIP20_02_01_12)
        else if SeIP20[laco] is TSeIP20_02_01_13 then
          RelatoSegmento.AdicionaPosicionalRelacionamentoFornecedoresSegmento(
            SeIP20[laco] as TSeIP20_02_01_13)
        else if SeIP20[laco] is TSeIP20_02_01_14 then
          RelatoSegmento.AdicionaPosicionalRelacionamentoFornecedoresPeriodoSegmento(
            SeIP20[laco] as TSeIP20_02_01_14)
        else if SeIP20[laco] is TSeIP20_02_01_15 then
          RelatoSegmento.AdicionaPosicionalHistoricoPagamentoSegmento(
            SeIP20[laco] as TSeIP20_02_01_15)
        else if SeIP20[laco] is TSeIP20_02_01_16 then
          RelatoSegmento.AdicionaPosicionalEvolucaoCompromissosSegmento(
            SeIP20[laco] as TSeIP20_02_01_16)
        else if SeIP20[laco] is TSeIP20_02_01_17 then
          RelatoSegmento.AdicionaPosicionalReferenciaisNegociosSegmento(
            SeIP20[laco] as TSeIP20_02_01_17)
        else if SeIP20[laco] is TSeIP20_02_01_18 then
          RelatoSegmento.AdicionaPosicionalHistoricoPagamentoIndividual(
            SeIP20[laco] as TSeIP20_02_01_18)
        else if SeIP20[laco] is TSeIP20_02_01_19 then
          RelatoSegmento.AdicionaPosicionalRelacionamentoFornecedoresIndividual(
            SeIP20[laco] as TSeIP20_02_01_19)
        else if SeIP20[laco] is TSeIP20_02_01_20 then
          RelatoSegmento.AdicionaPosicionalEvolucaoCompromissosVencidos(
            SeIP20[laco] as TSeIP20_02_01_20)
        else if SeIP20[laco] is TSeIP20_02_01_21 then
          RelatoSegmento.AdicionaPosicionalEvolucaoCompromissosAVencer(
            SeIP20[laco] as TSeIP20_02_01_21)
        else if SeIP20[laco] is TSeIP20_02_01_25 then
          RelatoSegmento.AdicionaPosicionalHistoricoPagamentosCedente(
            SeIP20[laco] as TSeIP20_02_01_25)
        else if SeIP20[laco] is TSeIP20_02_01_26 then
          RelatoSegmento.AdicionaPosicionalEvolucaoCompromissosCedente(
            SeIP20[laco] as TSeIP20_02_01_26)
        else if SeIP20[laco] is TSeIP20_02_01_27 then
          RelatoSegmento.AdicionaPosicionaReferenciaisNegociosCedente(
            SeIP20[laco] as TSeIP20_02_01_27)
        else if SeIP20[laco] is TSeIP20_03_01_01 then
          RelatoSegmento.AdicionaPosicionalRegistroConsultas(
            SeIP20[laco] as TSeIP20_03_01_01)
        else if SeIP20[laco] is TSeIP20_03_01_02 then
          RelatoSegmento.AdicionaPosicionalUltimasConsultas(
            SeIP20[laco] as TSeIP20_03_01_02)
        else if SeIP20[laco] is TSeIP20_03_01_03 then
          RelatoSegmento.AdicionaPosicionalAlerta(
            SeIP20[laco] as TSeIP20_03_01_03)
        else if SeIP20[laco] is TSeIP20_04_01_01 then
          RelatoSegmento.AdicionaPosicionalPefin(
            SeIP20[laco] as TSeIP20_04_01_01)
        else if SeIP20[laco] is TSeIP20_04_01_02 then
          RelatoSegmento.AdicionaPosicionalRefin(
            SeIP20[laco] as TSeIP20_04_01_02)
        else if SeIP20[laco] is TSeIP20_04_02_01 then
          RelatoSegmento.AdicionaPosicionalConcentre(
            SeIP20[laco] as TSeIP20_04_02_01)
        else if SeIP20[laco] is TSeIP20_04_02_02 then
          RelatoSegmento.AdicionaPosicionalConcentreResumo(
            SeIP20[laco] as TSeIP20_04_02_02)
        else if SeIP20[laco] is TSeIP20_04_02_03 then
          RelatoSegmento.AdicionaPosicionalConcentreInapto(
            SeIP20[laco] as TSeIP20_04_02_03)
        else if SeIP20[laco] is TSeIP20_04_03_01 then
          RelatoSegmento.AdicionaPosicionalConcentreProtesto(
            SeIP20[laco] as TSeIP20_04_03_01)
        else if SeIP20[laco] is TSeIP20_04_04_01 then
          RelatoSegmento.AdicionaPosicionalConcentreAcaoJudicial(
            SeIP20[laco] as TSeIP20_04_04_01)
        else if SeIP20[laco] is TSeIP20_04_05_01 then
          RelatoSegmento.AdicionaPosicionalConcentreFalencia(
            SeIP20[laco] as TSeIP20_04_05_01)
        else if SeIP20[laco] is TSeIP20_04_06_01 then
          RelatoSegmento.AdicionaPosicionalConcentreFalenciaConcordata(
            SeIP20[laco] as TSeIP20_04_06_01)
        else if SeIP20[laco] is TSeIP20_04_07_01 then
          RelatoSegmento.AdicionaPosicionalConcentreDividasVencidas(
            SeIP20[laco] as TSeIP20_04_07_01)
        else if SeIP20[laco] is TSeIP20_04_08_01 then
          RelatoSegmento.AdicionaPosicionalInformacoesRecheque(
            SeIP20[laco] as TSeIP20_04_08_01)
        else if SeIP20[laco] is TSeIP20_04_09_01 then
          RelatoSegmento.AdicionaPosicionalInformacoesRechequeCCF(
            SeIP20[laco] as TSeIP20_04_09_01)
        else if SeIP20[laco] is TSeIP20_04_10_00 then
          RelatoSegmento.PosicionalInformacoesRechequeUltimaOcorrencia :=
            SeIP20[laco] as TSeIP20_04_10_00
        else if SeIP20[laco] is TSeIP20_04_10_01 then
          RelatoSegmento.AdicionaPosicionalInformacoesRechequeDetalhe(
            SeIP20[laco] as TSeIP20_04_10_01)
        else if SeIP20[laco] is TSeIP20_07_01_99 then
          RelatoSegmento.AdicionaPosicionalInformacoesRiskscoring(
            SeIP20[laco] as TSeIP20_07_01_99)
        else if SeIP20[laco] is TSeIP20_07_01_01 then
          RelatoSegmento.AdicionaPosicionalRiskscoringMeses(
            SeIP20[laco] as TSeIP20_07_01_01)
        else if SeIP20[laco] is TSeIP20_07_01_02 then
          RelatoSegmento.AdicionaPosicionalFatoresAutorizadores(
            SeIP20[laco] as TSeIP20_07_01_02)
        else if SeIP20[laco] is TSeIP20_07_01_03 then
          RelatoSegmento.AdicionaPosicionalFatoresAutorizadoresPQ(
            SeIP20[laco] as TSeIP20_07_01_03)
        else if SeIP20[laco] is TSeIP20_07_01_04 then
          RelatoSegmento.AdicionaPosicionalInformacoesAutorizadoresH(
            SeIP20[laco] as TSeIP20_07_01_04)
        else if SeIP20[laco] is TSeIP20_07_01_05 then
          RelatoSegmento.AdicionaPosicionalInformacoesAutorizadoresE(
            SeIP20[laco] as TSeIP20_07_01_05)
        else if SeIP20[laco] is TSeIP20_07_01_06 then
          RelatoSegmento.AdicionaPosicionalInformacoesRiskscoringPrinad(
            SeIP20[laco] as TSeIP20_07_01_06)
        else if SeIP20[laco] is TSeIP20_07_01_09 then
          RelatoSegmento.AdicionaPosicionalRiskscoringPrinadMeses(
            SeIP20[laco] as TSeIP20_07_01_09)
        else if SeIP20[laco] is TSeIP20_08_01_02 then
          RelatoSegmento.PosicionalInformacoesMonitore := SeIP20[laco] as
            TSeIP20_08_01_02
        else if SeIP20[laco] is TSeIP20_89_00_00 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoRegistroControleContabilNRCT(SeIP20[laco] as TSeIP20_89_00_00)
        else if SeIP20[laco] is TSeIP20_89_01_01 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoEvolucaoCompromissosVencidosCedenteNRCT(SeIP20[laco] as TSeIP20_89_01_01)
        else if SeIP20[laco] is TSeIP20_89_01_02 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoEvolucaoCompromissosAVencerCedenteNRCT(SeIP20[laco] as TSeIP20_89_01_02)
        else if SeIP20[laco] is TSeIP20_89_01_03 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoEvolucaoCompromissosVencidosAVencerCedenteTotalNRCT(SeIP20[laco] as TSeIP20_89_01_03)
        else if SeIP20[laco] is TSeIP20_89_02_01 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteQtdeTitulosNRCT(SeIP20[laco] as TSeIP20_89_02_01)
        else if SeIP20[laco] is TSeIP20_89_02_02 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorNRCT(SeIP20[laco] as TSeIP20_89_02_02)
        else if SeIP20[laco] is TSeIP20_89_02_03 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorMedioNRCT(SeIP20[laco] as TSeIP20_89_02_03)
        else if SeIP20[laco] is TSeIP20_89_02_04 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteClienteValorTotalNRCT(SeIP20[laco] as TSeIP20_89_02_04)
        else if SeIP20[laco] is TSeIP20_89_02_05 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeTitulosNRCT(SeIP20[laco] as TSeIP20_89_02_05)
        else if SeIP20[laco] is TSeIP20_89_02_06 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorNRCT(SeIP20[laco] as TSeIP20_89_02_06)
        else if SeIP20[laco] is TSeIP20_89_02_07 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorMedioNRCT(SeIP20[laco] as TSeIP20_89_02_07)
        else if SeIP20[laco] is TSeIP20_89_02_08 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsQtdeFactoringsNRCT(SeIP20[laco] as TSeIP20_89_02_08)
        else if SeIP20[laco] is TSeIP20_89_02_09 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsValorTotalNRCT(SeIP20[laco] as TSeIP20_89_02_09)
        else if SeIP20[laco] is TSeIP20_89_02_10 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteDemaisFactoringsTotalFactoringsNRCT(SeIP20[laco] as TSeIP20_89_02_10)
        else if SeIP20[laco] is TSeIP20_89_02_11 then
          RelatoSegmento.AdicionaCentralTitulosSegmentoHistoricoPagamentosVisaoCedenteEstatisticaNRCT(SeIP20[laco] as TSeIP20_89_02_11)
        {objetos não classificados são liberados.}
        else
          SeIP20[laco].Free;
      end;
    finally
      {o dono original limpa a referência dos objetos para que
      possa ser liberado sem destruir os objetos.}
      SeIP20.Limpa;
    end;
  end;
end;

{ TSeIP20_89 }

class function TSeIP20_89.ID: string;
begin
  Result := '89';
end;

{ TSeIP20_89_00 }

class function TSeIP20_89_00.Bloco: string;
begin
  Result := '00';
end;

{ TSeIP20_89_00_00 }

procedure TSeIP20_89_00_00.SetText(const Value: string);
begin
  inherited;
  FCNPJ := Copy(Value, 7, 9);
  FUserId := Copy(Value, 16, 8);
  FDataHora := StrToDateTime(Copy(Value, 24, 10)) +
    TSeMetodos.HHPMMPSSToTime(Copy(Value, 34, 8));
  FTrans := Copy(Value, 42, 4);
end;

class function TSeIP20_89_00_00.Tipo: string;
begin
  Result := '00';
end;

{ TSeIP20_89_01 }

class function TSeIP20_89_01.Bloco: string;
begin
  Result := '01';
end;

{ TSeIP20_89_01_01 }

procedure TSeIP20_89_01_01.SetText(const Value: string);
begin
  inherited;
  FDesPer := Copy(Value, 7, 14);
  FValVencCli := StrToFloat(Copy(Value, 21, 15));
  FValVencOut := StrToFloat(Copy(Value, 36, 15));
  FQtdVencFact := StrToIntDef(Copy(Value, 51, 9), -1);
end;

class function TSeIP20_89_01_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_89_01_02 }

procedure TSeIP20_89_01_02.SetText(const Value: string);
begin
  inherited;
  FDesPer := Copy(Value, 7, 14);
  FValAVencCli := StrToFloat(Copy(Value, 21, 15));
  FValAVencOut := StrToFloat(Copy(Value, 36, 15));
  FQtdAVencFact := StrToIntDef(Copy(Value, 51, 9), -1);
end;

class function TSeIP20_89_01_02.Tipo: string;
begin
  Result := '02';
end;

{ TSeIP20_89_01_03 }

procedure TSeIP20_89_01_03.SetText(const Value: string);
begin
  inherited;
  FAno1Prf := StrToIntDef(Copy(Value, 7, 2), -1);
  FMes1Prf := StrToIntDef(Copy(Value, 9, 2), -1);
  FMesDesp := Copy(Value, 11, 3);
  FValVencCli := StrToFloat(Copy(Value, 14, 15));
  FValVencOut := StrToFloat(Copy(Value, 29, 15));
  FQtdVencFact := StrToIntDef(Copy(Value, 44, 9), -1);
  FValAVencCli := StrToFloat(Copy(Value, 53, 15));
  FValAVencOut := StrToFloat(Copy(Value, 68, 15));
  FQtdAVencFact := StrToIntDef(Copy(Value, 83, 9), -1);
  FTotValAbr := StrToFloat(Copy(Value, 92, 15));
end;

class function TSeIP20_89_01_03.Tipo: string;
begin
 Result := '03';
end;

{ TSeIP20_89_02 }

class function TSeIP20_89_02.Bloco: string;
begin
  Result := '02';
end;

{ TSeIP20_89_02_01 }

procedure TSeIP20_89_02_01.SetText(const Value: string);
begin
  inherited;
  FAno1Prf := StrToIntDef(Copy(Value, 7, 2), -1);
  FMes1Prf := StrToIntDef(Copy(Value, 9, 2), -1);
  FMesDesp := Copy(Value, 11, 3);
  FQtdCliPont := StrToIntDef(Copy(Value, 14, 9), -1);
  FQtdCli815 := StrToIntDef(Copy(Value, 23, 9), -1);
  FQtdCli1630 := StrToIntDef(Copy(Value, 32, 9), -1);
  FQtdCli3160 := StrToIntDef(Copy(Value, 41, 9), -1);
  FQtdCliM60 := StrToIntDef(Copy(Value, 50, 9), -1);
  FQtdCliVist := StrToIntDef(Copy(Value, 59, 9), -1);
end;


class function TSeIP20_89_02_01.Tipo: string;
begin
  Result := '01';
end;

{ TSeIP20_89_02_02 }

procedure TSeIP20_89_02_02.SetText(const Value: string);
begin
  inherited;
  FAno1Prf := StrToIntDef(Copy(Value, 7, 2), -1);
  FMes1Prf := StrToIntDef(Copy(Value, 9, 2), -1);
  FMesDesp := Copy(Value, 11, 3);
  FValCliPont := StrToFloat(Copy(Value, 14, 15));
  FValCli815 := StrToFloat(Copy(Value, 29, 15));
  FValCli1630 := StrToFloat(Copy(Value, 44, 15));
  FValCli3160 := StrToFloat(Copy(Value, 59, 15));
  FValCliM60 := StrToFloat(Copy(Value, 74, 15));
  FValCliVist := StrToFloat(Copy(Value, 89, 15));
end;

class function TSeIP20_89_02_02.Tipo: string;
begin
  Result := '02';
end;

{ TSeIP20_89_02_03 }

procedure TSeIP20_89_02_03.SetText(const Value: string);
begin
  inherited;
  FAno1Prf := StrToIntDef(Copy(Value, 7, 2), -1);
  FMes1Prf := StrToIntDef(Copy(Value, 9, 2), -1);
  FMesDesp := Copy(Value, 11, 3);
  FVlmCliPont := StrToFloat(Copy(Value, 14, 15));
  FVlmCli815 := StrToFloat(Copy(Value, 29, 15));
  FVlmCli1630 := StrToFloat(Copy(Value, 44, 15));
  FVlmCli3160 := StrToFloat(Copy(Value, 59, 15));
  FVlmCliM60 := StrToFloat(Copy(Value, 74, 15));
  FVlmCliVist := StrToFloat(Copy(Value, 89, 15));
end;

class function TSeIP20_89_02_03.Tipo: string;
begin
  Result := '03';
end;

{ TSeIP20_89_02_04 }

procedure TSeIP20_89_02_04.SetText(const Value: string);
begin
  inherited;
  FTotCliPont := StrToFloat(Copy(Value, 7, 15));
  FTotCli815 := StrToFloat(Copy(Value, 22, 15));
  FTotCli1630 := StrToFloat(Copy(Value, 37, 15));
  FTotCli3160 := StrToFloat(Copy(Value, 52, 15));
  FTotCliM60 := StrToFloat(Copy(Value, 67, 15));
  FTotCliVist := StrToFloat(Copy(Value, 82, 15));
end;

class function TSeIP20_89_02_04.Tipo: string;
begin
  Result := '04';
end;

{ TSeIP20_89_02_05 }

procedure TSeIP20_89_02_05.SetText(const Value: string);
begin
  inherited;
  FAno1Prf := StrToIntDef(Copy(Value, 7, 2), -1);
  FMes1Prf := StrToIntDef(Copy(Value, 9, 2), -1);
  FMesDesp := Copy(Value, 11, 3);
  FQtdOutPont := StrToIntDef(Copy(Value, 14, 9), -1);
  FQtdOut815 := StrToIntDef(Copy(Value, 23, 9), -1);
  FQtdOut1630 := StrToIntDef(Copy(Value, 32, 9), -1);
  FQtdOut3160 := StrToIntDef(Copy(Value, 41, 9), -1);
  FQtdOutM60 := StrToIntDef(Copy(Value, 50, 9), -1);
  FQtdOutVist := StrToIntDef(Copy(Value, 59, 9), -1);
end;

class function TSeIP20_89_02_05.Tipo: string;
begin
  Result := '05';
end;

{ TSeIP20_89_02_06 }

procedure TSeIP20_89_02_06.SetText(const Value: string);
begin
  inherited;
  FAno1Prf := StrToIntDef(Copy(Value, 7, 2), -1);
  FMes1Prf := StrToIntDef(Copy(Value, 9, 2), -1);
  FMesDesp := Copy(Value, 11, 3);
  FValOutPont := StrToFloat(Copy(Value, 14, 15));
  FValOut815 := StrToFloat(Copy(Value, 29, 15));
  FValOut1630 := StrToFloat(Copy(Value, 44, 15));
  FValOut3160 := StrToFloat(Copy(Value, 59, 15));
  FValOutM60 := StrToFloat(Copy(Value, 74, 15));
  FValOutVist := StrToFloat(Copy(Value, 89, 15));
end;

class function TSeIP20_89_02_06.Tipo: string;
begin
  Result := '06';
end;

{ TSeIP20_89_02_07 }

procedure TSeIP20_89_02_07.SetText(const Value: string);
begin
  inherited;
  FAno1Prf := StrToIntDef(Copy(Value, 7, 2), -1);
  FMes1Prf := StrToIntDef(Copy(Value, 9, 2), -1);
  FMesDesp := Copy(Value, 11, 3);
  FVlmOutPont := StrToFloat(Copy(Value, 14, 15));
  FVlmOut815 := StrToFloat(Copy(Value, 29, 15));
  FVlmOut1630 := StrToFloat(Copy(Value, 44, 15));
  FVlmOut3160 := StrToFloat(Copy(Value, 59, 15));
  FVlmOutM60 := StrToFloat(Copy(Value, 74, 15));
  FVlmOutVist := StrToFloat(Copy(Value, 89, 15));
end;

class function TSeIP20_89_02_07.Tipo: string;
begin
  Result := '07';
end;

{ TSeIP20_89_02_08 }

procedure TSeIP20_89_02_08.SetText(const Value: string);
begin
  inherited;
  FAno1Prf := StrToIntDef(Copy(Value, 7, 2), -1);
  FMes1Prf := StrToIntDef(Copy(Value, 9, 2), -1);
  FMesDesp := Copy(Value, 11, 3);
  FQtdFacPont := StrToIntDef(Copy(Value, 14, 9), -1);
  FQtdFac815 := StrToIntDef(Copy(Value, 23, 9), -1);
  FQtdFac1630 := StrToIntDef(Copy(Value, 32, 9), -1);
  FQtdFac3160 := StrToIntDef(Copy(Value, 41, 9), -1);
  FQtdFacM60 := StrToIntDef(Copy(Value, 50, 9), -1);
  FQtdFacVist := StrToIntDef(Copy(Value, 59, 9), -1);
end;

class function TSeIP20_89_02_08.Tipo: string;
begin
  Result := '08';
end;

{ TSeIP20_89_02_09 }

procedure TSeIP20_89_02_09.SetText(const Value: string);
begin
  inherited;
  FTotOutPont := StrToFloat(Copy(Value, 7, 15));
  FTotOut815 := StrToFloat(Copy(Value, 22, 15));
  FTotOut1630 := StrToFloat(Copy(Value, 37, 15));
  FTotOut3160 := StrToFloat(Copy(Value, 52, 15));
  FTotOutM60 := StrToFloat(Copy(Value, 67, 15));
  FTotOutCedVist := StrToFloat(Copy(Value, 82, 15));
end;

class function TSeIP20_89_02_09.Tipo: string;
begin
  Result := '09';
end;

{ TSeIP20_89_02_10 }

procedure TSeIP20_89_02_10.SetText(const Value: string);
begin
  inherited;
  FTotFacPont := StrToFloat(Copy(Value, 7, 9));
  FTotFac815 := StrToFloat(Copy(Value, 16, 9));
  FTotFac1630 := StrToFloat(Copy(Value, 25, 9));
  FTotFac3160 := StrToFloat(Copy(Value, 34, 9));
  FTotFacM60 := StrToFloat(Copy(Value, 43, 9));
  FTotFacVist := StrToFloat(Copy(Value, 52, 9));
end;

class function TSeIP20_89_02_10.Tipo: string;
begin
  Result := '10';
end;

{ TSeIP20_89_02_11 }

procedure TSeIP20_89_02_11.SetText(const Value: string);
begin
  inherited;
  FAno1Prf := StrToIntDef(Copy(Value, 7, 2), -1);
  FMes1Prf := StrToIntDef(Copy(Value, 9, 2), -1);
  FMesDesp := Copy(Value, 11, 3);
  FPercCliQtde := StrToFloat(Copy(Value, 14, 5));
  FPercCliVal := StrToFloat(Copy(Value, 19, 5));
  FPercOutQtde := StrToFloat(Copy(Value, 24, 5));
  FPercOutVal := StrToFloat(Copy(Value, 29, 5));
  FQtdOutFact := StrToIntDef(Copy(Value, 34, 2), -1);
end;

class function TSeIP20_89_02_11.Tipo: string;
begin
  Result := '11';
end;


initialization

  AddSeClasseString(TComunicacaoIP20);

  FCacheDetalhes := TDetalhes.Create;

  FCacheDetalhes.Adiciona(TSeIP20_01_00_99);
  FCacheDetalhes.Adiciona(TSeIP20_01_00_00);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_99);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_00);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_01);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_02);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_03);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_04);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_05);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_06);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_07);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_08);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_09);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_10);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_11);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_12);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_13);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_14);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_16);
  FCacheDetalhes.Adiciona(TSeIP20_01_01_98);
  FCacheDetalhes.Adiciona(TSeIP20_01_02_99);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_99);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_00);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_01);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_02);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_03);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_04);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_05);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_06);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_07);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_08);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_09);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_10);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_11);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_12);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_13);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_14);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_15);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_16);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_17);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_18);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_19);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_20);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_21);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_25);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_26);
  FCacheDetalhes.Adiciona(TSeIP20_02_01_27);
  FCacheDetalhes.Adiciona(TSeIP20_03_01_99);
  FCacheDetalhes.Adiciona(TSeIP20_03_01_01);
  FCacheDetalhes.Adiciona(TSeIP20_03_01_02);
  FCacheDetalhes.Adiciona(TSeIP20_03_01_03);
  FCacheDetalhes.Adiciona(TSeIP20_04_01_99);
  FCacheDetalhes.Adiciona(TSeIP20_04_01_01);
  FCacheDetalhes.Adiciona(TSeIP20_04_01_02);
  FCacheDetalhes.Adiciona(TSeIP20_04_02_99);
  FCacheDetalhes.Adiciona(TSeIP20_04_02_01);
  FCacheDetalhes.Adiciona(TSeIP20_04_02_02);
  FCacheDetalhes.Adiciona(TSeIP20_04_02_03);
  FCacheDetalhes.Adiciona(TSeIP20_04_03_99);
  FCacheDetalhes.Adiciona(TSeIP20_04_03_01);
  FCacheDetalhes.Adiciona(TSeIP20_04_04_99);
  FCacheDetalhes.Adiciona(TSeIP20_04_04_01);
  FCacheDetalhes.Adiciona(TSeIP20_04_05_99);
  FCacheDetalhes.Adiciona(TSeIP20_04_05_01);
  FCacheDetalhes.Adiciona(TSeIP20_04_06_99);
  FCacheDetalhes.Adiciona(TSeIP20_04_06_01);
  FCacheDetalhes.Adiciona(TSeIP20_04_07_99);
  FCacheDetalhes.Adiciona(TSeIP20_04_07_01);
  FCacheDetalhes.Adiciona(TSeIP20_04_08_99);
  FCacheDetalhes.Adiciona(TSeIP20_04_08_01);
  FCacheDetalhes.Adiciona(TSeIP20_04_09_99);
  FCacheDetalhes.Adiciona(TSeIP20_04_09_01);
  FCacheDetalhes.Adiciona(TSeIP20_04_10_99);
  FCacheDetalhes.Adiciona(TSeIP20_04_10_00);
  FCacheDetalhes.Adiciona(TSeIP20_04_10_01);
  FCacheDetalhes.Adiciona(TSeIP20_07_01_99);
  FCacheDetalhes.Adiciona(TSeIP20_07_01_01);
  FCacheDetalhes.Adiciona(TSeIP20_07_01_02);
  FCacheDetalhes.Adiciona(TSeIP20_07_01_03);
  FCacheDetalhes.Adiciona(TSeIP20_07_01_04);
  FCacheDetalhes.Adiciona(TSeIP20_07_01_05);
  FCacheDetalhes.Adiciona(TSeIP20_07_01_06);
  FCacheDetalhes.Adiciona(TSeIP20_07_01_09);
  FCacheDetalhes.Adiciona(TSeIP20_08_01_02);
  FCacheDetalhes.Adiciona(TSeIP20_99_00_00);
  FCacheDetalhes.Adiciona(TSeIP20_99_01_01);
  FCacheDetalhes.Adiciona(TSeIP20_89_00_00);
  FCacheDetalhes.Adiciona(TSeIP20_89_01_01);
  FCacheDetalhes.Adiciona(TSeIP20_89_01_02);
  FCacheDetalhes.Adiciona(TSeIP20_89_01_03);
  FCacheDetalhes.Adiciona(TSeIP20_89_02_01);
  FCacheDetalhes.Adiciona(TSeIP20_89_02_02);
  FCacheDetalhes.Adiciona(TSeIP20_89_02_03);
  FCacheDetalhes.Adiciona(TSeIP20_89_02_04);
  FCacheDetalhes.Adiciona(TSeIP20_89_02_05);
  FCacheDetalhes.Adiciona(TSeIP20_89_02_06);
  FCacheDetalhes.Adiciona(TSeIP20_89_02_07);
  FCacheDetalhes.Adiciona(TSeIP20_89_02_08);
  FCacheDetalhes.Adiciona(TSeIP20_89_02_09);
  FCacheDetalhes.Adiciona(TSeIP20_89_02_10);
  FCacheDetalhes.Adiciona(TSeIP20_89_02_11);
finalization

  FCacheDetalhes.Free;

end.
