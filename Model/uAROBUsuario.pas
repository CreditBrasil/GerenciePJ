{
  ***************************************************
  * Este código é gerado automaticamente, não edite *
  ***************************************************

  Template: ActiveRecord.pas_template
  Descrição: Cria classes e interfaces para acessar a tabela OBUsuario
}
unit uAROBUsuario;

interface

uses
  SysUtils, db, ADOInt, Graphics, ServiceLocator, SyncObjs, Variants, 
  uActiveRecord;

type
  //Tabela: OBUsuario - ContÃ©m as informaÃ§Ãµes de login do sistema
  IAROBUsuario = interface(IActiveRecord)
    ['{C52E281D-808B-4159-BE88-5132C3BD971C}']
    function GetUsuLogin: string;
    function GetGruCodigo: TNullableInteger;
    function GetUsuNome: TNullableString;
    function GetUsuSenha: TNullableString;
    function GetEmpCodigo: TNullableInteger;
    function GetUsuAutorizaOperacaoRestricao: TNullableBoolean;
    function GetAgeCodigo: TNullableInteger;
    function GetGalCodigo: TNullableInteger;
    function GetUsuMaxValorLimiteCretioParaCedente: TNullableCurrency;
    function GetUsuDataExpirar: TNullableDateTime;
    function GetUsuAutorizaEfetivacaoSolicitacaoVencimento: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoProtesto: TNullableBoolean;
    function GetUsuOperacaoAnalisadaNaoPodeSerEfetivada: TNullableBoolean;
    function GetUsuAutorizaTitulosAcordoAlcada: TNullableBoolean;
    function GetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao: TNullableCurrency;
    function GetUsuValorSuperiorLimiteAutorizar: TNullableCurrency;
    function GetUsuValorMaximoCadastramentoLimiteCreditoSacado: TNullableCurrency;
    function GetUsuPossibilitaEfetivacaoBorderoRestricao: TNullableBoolean;
    function GetUsuValorLimiteAdicionalOperacao: TNullableCurrency;
    function GetUsuEmailSaldoContaVinculada: TNullableString;
    function GetId_TipoObservacao: TNullableInteger;
    function GetUsuCodime: TNullableBoolean;
    function GetUsuSemConsistencia: TNullableBoolean;
    function GetUsuAlteraConfirmacaoTituloOperacao: TNullableBoolean;
    function GetUsuAlteraConfirmacaoIngresso: TNullableBoolean;
    function GetUsuTipoAcesso: TNullableString;
    function GetUsuInclusaoCNPJCPFGerencieCarteira: TNullableBoolean;
    function GetUsuExclusaoCNPJCPFGerencieCarteira: TNullableBoolean;
    function GetPag_Id: TNullableInteger;
    function GetSop_Id: TNullableInteger;
    function GetUsuAlteraSenhaProximoAcesso: TNullableBoolean;
    function GetUsuVisualizaEventoCaucao: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoBaixa: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoCartorio: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoInsProtesto: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoDesconto: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoAbatimento: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoResgate: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoCoaf: TNullableBoolean;
    function GetUsuLiberaConsultaOrgaoCreditoForaPrazo: TNullableBoolean;
    function GetUsuQtdConsultasSerasaMes: TNullableInteger;
    function GetUsuAgenteChecagem: TNullableBoolean;
    function GetUsuGerenteChecagem: TNullableBoolean;
    function GetUsuAlteraChecagemLote: TNullableBoolean;
    function GetUsuVeTodasOperacoesMonitor: TNullableBoolean;
    function GetUsuRecebeEmailEtapaPoc: TNullableBoolean;
    function GetUsuEmailAtribuicaoEtapaPoc: TNullableString;
    function GetUsuAgenteCobranca: TNullableBoolean;
    function GetUsuGerenteCobranca: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoPocIndependenteEtapa: TNullableBoolean;
    function GetUsuGerentePoc: TNullableBoolean;
    function GetUsuAgentePoc: TNullableBoolean;
    function GetUsuNomesObservacaoAnalise: TNullableString;
    function GetUsuAlteraParatroBloqueadoPefin: TNullableBoolean;
    function GetUsuPermitePularEtapaPoc: TNullableBoolean;
    function GetUsuAnalisePoc: TNullableBoolean;
    function GetUsuPocAlteraStatusFormalizacao: TNullableBoolean;
    function GetUsuLiberaCondicionanteOperacao: TNullableBoolean;
    function GetUsuPocPermiteAnaliseUnica: TNullableBoolean;
    function GetUsuPocPermiteAnaliseUnicaValor: TNullableCurrency;
    function GetUsuDesativado: TNullableBoolean;
    function GetUsuPocPermiteAnaliseUnicaValorTranche: TNullableCurrency;
    function GetUsuPocPermiteAnaliseUnicaValorClean: TNullableCurrency;
    procedure SetUsuLogin(const Value: string);
    procedure SetGruCodigo(const Value: TNullableInteger);
    procedure SetUsuNome(const Value: TNullableString);
    procedure SetUsuSenha(const Value: TNullableString);
    procedure SetEmpCodigo(const Value: TNullableInteger);
    procedure SetUsuAutorizaOperacaoRestricao(const Value: TNullableBoolean);
    procedure SetAgeCodigo(const Value: TNullableInteger);
    procedure SetGalCodigo(const Value: TNullableInteger);
    procedure SetUsuMaxValorLimiteCretioParaCedente(const Value: TNullableCurrency);
    procedure SetUsuDataExpirar(const Value: TNullableDateTime);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoVencimento(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoProtesto(const Value: TNullableBoolean);
    procedure SetUsuOperacaoAnalisadaNaoPodeSerEfetivada(const Value: TNullableBoolean);
    procedure SetUsuAutorizaTitulosAcordoAlcada(const Value: TNullableBoolean);
    procedure SetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao(const Value: TNullableCurrency);
    procedure SetUsuValorSuperiorLimiteAutorizar(const Value: TNullableCurrency);
    procedure SetUsuValorMaximoCadastramentoLimiteCreditoSacado(const Value: TNullableCurrency);
    procedure SetUsuPossibilitaEfetivacaoBorderoRestricao(const Value: TNullableBoolean);
    procedure SetUsuValorLimiteAdicionalOperacao(const Value: TNullableCurrency);
    procedure SetUsuEmailSaldoContaVinculada(const Value: TNullableString);
    procedure SetId_TipoObservacao(const Value: TNullableInteger);
    procedure SetUsuCodime(const Value: TNullableBoolean);
    procedure SetUsuSemConsistencia(const Value: TNullableBoolean);
    procedure SetUsuAlteraConfirmacaoTituloOperacao(const Value: TNullableBoolean);
    procedure SetUsuAlteraConfirmacaoIngresso(const Value: TNullableBoolean);
    procedure SetUsuTipoAcesso(const Value: TNullableString);
    procedure SetUsuInclusaoCNPJCPFGerencieCarteira(const Value: TNullableBoolean);
    procedure SetUsuExclusaoCNPJCPFGerencieCarteira(const Value: TNullableBoolean);
    procedure SetPag_Id(const Value: TNullableInteger);
    procedure SetSop_Id(const Value: TNullableInteger);
    procedure SetUsuAlteraSenhaProximoAcesso(const Value: TNullableBoolean);
    procedure SetUsuVisualizaEventoCaucao(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoBaixa(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoCartorio(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoInsProtesto(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoDesconto(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoAbatimento(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoResgate(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoCoaf(const Value: TNullableBoolean);
    procedure SetUsuLiberaConsultaOrgaoCreditoForaPrazo(const Value: TNullableBoolean);
    procedure SetUsuQtdConsultasSerasaMes(const Value: TNullableInteger);
    procedure SetUsuAgenteChecagem(const Value: TNullableBoolean);
    procedure SetUsuGerenteChecagem(const Value: TNullableBoolean);
    procedure SetUsuAlteraChecagemLote(const Value: TNullableBoolean);
    procedure SetUsuVeTodasOperacoesMonitor(const Value: TNullableBoolean);
    procedure SetUsuRecebeEmailEtapaPoc(const Value: TNullableBoolean);
    procedure SetUsuEmailAtribuicaoEtapaPoc(const Value: TNullableString);
    procedure SetUsuAgenteCobranca(const Value: TNullableBoolean);
    procedure SetUsuGerenteCobranca(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoPocIndependenteEtapa(const Value: TNullableBoolean);
    procedure SetUsuGerentePoc(const Value: TNullableBoolean);
    procedure SetUsuAgentePoc(const Value: TNullableBoolean);
    procedure SetUsuNomesObservacaoAnalise(const Value: TNullableString);
    procedure SetUsuAlteraParatroBloqueadoPefin(const Value: TNullableBoolean);
    procedure SetUsuPermitePularEtapaPoc(const Value: TNullableBoolean);
    procedure SetUsuAnalisePoc(const Value: TNullableBoolean);
    procedure SetUsuPocAlteraStatusFormalizacao(const Value: TNullableBoolean);
    procedure SetUsuLiberaCondicionanteOperacao(const Value: TNullableBoolean);
    procedure SetUsuPocPermiteAnaliseUnica(const Value: TNullableBoolean);
    procedure SetUsuPocPermiteAnaliseUnicaValor(const Value: TNullableCurrency);
    procedure SetUsuDesativado(const Value: TNullableBoolean);
    procedure SetUsuPocPermiteAnaliseUnicaValorTranche(const Value: TNullableCurrency);
    procedure SetUsuPocPermiteAnaliseUnicaValorClean(const Value: TNullableCurrency);
    //--- Campos ---
    //UsuLogin varchar (10) - Login do usuÃ¡rio, PK
    property UsuLogin: string read GetUsuLogin write SetUsuLogin;
    //GruCodigo int - ???
    property GruCodigo: TNullableInteger read GetGruCodigo write SetGruCodigo;
    //UsuNome varchar (60) - ???
    property UsuNome: TNullableString read GetUsuNome write SetUsuNome;
    //UsuSenha varchar (6) - ???
    property UsuSenha: TNullableString read GetUsuSenha write SetUsuSenha;
    //EmpCodigo int - ???
    property EmpCodigo: TNullableInteger read GetEmpCodigo write SetEmpCodigo;
    //UsuAutorizaOperacaoRestricao bit - ???
    property UsuAutorizaOperacaoRestricao: TNullableBoolean read GetUsuAutorizaOperacaoRestricao write SetUsuAutorizaOperacaoRestricao;
    //AgeCodigo int - ???
    property AgeCodigo: TNullableInteger read GetAgeCodigo write SetAgeCodigo;
    //GalCodigo int - ???
    property GalCodigo: TNullableInteger read GetGalCodigo write SetGalCodigo;
    //UsuMaxValorLimiteCretioParaCedente float - ???
    property UsuMaxValorLimiteCretioParaCedente: TNullableCurrency read GetUsuMaxValorLimiteCretioParaCedente write SetUsuMaxValorLimiteCretioParaCedente;
    //UsuDataExpirar datetime - ???
    property UsuDataExpirar: TNullableDateTime read GetUsuDataExpirar write SetUsuDataExpirar;
    //UsuAutorizaEfetivacaoSolicitacaoVencimento bit - ???
    property UsuAutorizaEfetivacaoSolicitacaoVencimento: TNullableBoolean read GetUsuAutorizaEfetivacaoSolicitacaoVencimento write SetUsuAutorizaEfetivacaoSolicitacaoVencimento;
    //UsuAutorizaEfetivacaoSolicitacaoProtesto bit - ???
    property UsuAutorizaEfetivacaoSolicitacaoProtesto: TNullableBoolean read GetUsuAutorizaEfetivacaoSolicitacaoProtesto write SetUsuAutorizaEfetivacaoSolicitacaoProtesto;
    //UsuOperacaoAnalisadaNaoPodeSerEfetivada bit - ???
    property UsuOperacaoAnalisadaNaoPodeSerEfetivada: TNullableBoolean read GetUsuOperacaoAnalisadaNaoPodeSerEfetivada write SetUsuOperacaoAnalisadaNaoPodeSerEfetivada;
    //UsuAutorizaTitulosAcordoAlcada bit - ???
    property UsuAutorizaTitulosAcordoAlcada: TNullableBoolean read GetUsuAutorizaTitulosAcordoAlcada write SetUsuAutorizaTitulosAcordoAlcada;
    //UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao float - ???
    property UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao: TNullableCurrency read GetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao write SetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao;
    //UsuValorSuperiorLimiteAutorizar float - ???
    property UsuValorSuperiorLimiteAutorizar: TNullableCurrency read GetUsuValorSuperiorLimiteAutorizar write SetUsuValorSuperiorLimiteAutorizar;
    //UsuValorMaximoCadastramentoLimiteCreditoSacado float - ???
    property UsuValorMaximoCadastramentoLimiteCreditoSacado: TNullableCurrency read GetUsuValorMaximoCadastramentoLimiteCreditoSacado write SetUsuValorMaximoCadastramentoLimiteCreditoSacado;
    //UsuPossibilitaEfetivacaoBorderoRestricao bit - ???
    property UsuPossibilitaEfetivacaoBorderoRestricao: TNullableBoolean read GetUsuPossibilitaEfetivacaoBorderoRestricao write SetUsuPossibilitaEfetivacaoBorderoRestricao;
    //UsuValorLimiteAdicionalOperacao float - ???
    property UsuValorLimiteAdicionalOperacao: TNullableCurrency read GetUsuValorLimiteAdicionalOperacao write SetUsuValorLimiteAdicionalOperacao;
    //UsuEmailSaldoContaVinculada varchar (250) - ???
    property UsuEmailSaldoContaVinculada: TNullableString read GetUsuEmailSaldoContaVinculada write SetUsuEmailSaldoContaVinculada;
    //Id_TipoObservacao int - ???
    property Id_TipoObservacao: TNullableInteger read GetId_TipoObservacao write SetId_TipoObservacao;
    //UsuCodime bit - ???
    property UsuCodime: TNullableBoolean read GetUsuCodime write SetUsuCodime;
    //UsuSemConsistencia bit - ???
    property UsuSemConsistencia: TNullableBoolean read GetUsuSemConsistencia write SetUsuSemConsistencia;
    //UsuAlteraConfirmacaoTituloOperacao bit - ???
    property UsuAlteraConfirmacaoTituloOperacao: TNullableBoolean read GetUsuAlteraConfirmacaoTituloOperacao write SetUsuAlteraConfirmacaoTituloOperacao;
    //UsuAlteraConfirmacaoIngresso bit - ???
    property UsuAlteraConfirmacaoIngresso: TNullableBoolean read GetUsuAlteraConfirmacaoIngresso write SetUsuAlteraConfirmacaoIngresso;
    //UsuTipoAcesso varchar (1) - ???
    property UsuTipoAcesso: TNullableString read GetUsuTipoAcesso write SetUsuTipoAcesso;
    //UsuInclusaoCNPJCPFGerencieCarteira bit - ???
    property UsuInclusaoCNPJCPFGerencieCarteira: TNullableBoolean read GetUsuInclusaoCNPJCPFGerencieCarteira write SetUsuInclusaoCNPJCPFGerencieCarteira;
    //UsuExclusaoCNPJCPFGerencieCarteira bit - ???
    property UsuExclusaoCNPJCPFGerencieCarteira: TNullableBoolean read GetUsuExclusaoCNPJCPFGerencieCarteira write SetUsuExclusaoCNPJCPFGerencieCarteira;
    //Pag_Id int - ???
    property Pag_Id: TNullableInteger read GetPag_Id write SetPag_Id;
    //Sop_Id int - ???
    property Sop_Id: TNullableInteger read GetSop_Id write SetSop_Id;
    //UsuAlteraSenhaProximoAcesso bit - ???
    property UsuAlteraSenhaProximoAcesso: TNullableBoolean read GetUsuAlteraSenhaProximoAcesso write SetUsuAlteraSenhaProximoAcesso;
    //UsuVisualizaEventoCaucao bit - ???
    property UsuVisualizaEventoCaucao: TNullableBoolean read GetUsuVisualizaEventoCaucao write SetUsuVisualizaEventoCaucao;
    //UsuAutorizaEfetivacaoSolicitacaoBaixa bit - ???
    property UsuAutorizaEfetivacaoSolicitacaoBaixa: TNullableBoolean read GetUsuAutorizaEfetivacaoSolicitacaoBaixa write SetUsuAutorizaEfetivacaoSolicitacaoBaixa;
    //UsuAutorizaEfetivacaoSolicitacaoCartorio bit - ???
    property UsuAutorizaEfetivacaoSolicitacaoCartorio: TNullableBoolean read GetUsuAutorizaEfetivacaoSolicitacaoCartorio write SetUsuAutorizaEfetivacaoSolicitacaoCartorio;
    //UsuAutorizaEfetivacaoSolicitacaoInsProtesto bit - ???
    property UsuAutorizaEfetivacaoSolicitacaoInsProtesto: TNullableBoolean read GetUsuAutorizaEfetivacaoSolicitacaoInsProtesto write SetUsuAutorizaEfetivacaoSolicitacaoInsProtesto;
    //UsuAutorizaEfetivacaoSolicitacaoDesconto bit - ???
    property UsuAutorizaEfetivacaoSolicitacaoDesconto: TNullableBoolean read GetUsuAutorizaEfetivacaoSolicitacaoDesconto write SetUsuAutorizaEfetivacaoSolicitacaoDesconto;
    //UsuAutorizaEfetivacaoSolicitacaoAbatimento bit - ???
    property UsuAutorizaEfetivacaoSolicitacaoAbatimento: TNullableBoolean read GetUsuAutorizaEfetivacaoSolicitacaoAbatimento write SetUsuAutorizaEfetivacaoSolicitacaoAbatimento;
    //UsuAutorizaEfetivacaoSolicitacaoResgate bit - ???
    property UsuAutorizaEfetivacaoSolicitacaoResgate: TNullableBoolean read GetUsuAutorizaEfetivacaoSolicitacaoResgate write SetUsuAutorizaEfetivacaoSolicitacaoResgate;
    //UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia bit - ???
    property UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia: TNullableBoolean read GetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia write SetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia;
    //UsuAutorizaEfetivacaoCoaf bit - ???
    property UsuAutorizaEfetivacaoCoaf: TNullableBoolean read GetUsuAutorizaEfetivacaoCoaf write SetUsuAutorizaEfetivacaoCoaf;
    //UsuLiberaConsultaOrgaoCreditoForaPrazo bit - ???
    property UsuLiberaConsultaOrgaoCreditoForaPrazo: TNullableBoolean read GetUsuLiberaConsultaOrgaoCreditoForaPrazo write SetUsuLiberaConsultaOrgaoCreditoForaPrazo;
    //UsuQtdConsultasSerasaMes int - ???
    property UsuQtdConsultasSerasaMes: TNullableInteger read GetUsuQtdConsultasSerasaMes write SetUsuQtdConsultasSerasaMes;
    //UsuAgenteChecagem bit - ???
    property UsuAgenteChecagem: TNullableBoolean read GetUsuAgenteChecagem write SetUsuAgenteChecagem;
    //UsuGerenteChecagem bit - ???
    property UsuGerenteChecagem: TNullableBoolean read GetUsuGerenteChecagem write SetUsuGerenteChecagem;
    //UsuAlteraChecagemLote bit - ???
    property UsuAlteraChecagemLote: TNullableBoolean read GetUsuAlteraChecagemLote write SetUsuAlteraChecagemLote;
    //UsuVeTodasOperacoesMonitor bit - ???
    property UsuVeTodasOperacoesMonitor: TNullableBoolean read GetUsuVeTodasOperacoesMonitor write SetUsuVeTodasOperacoesMonitor;
    //UsuRecebeEmailEtapaPoc bit - ???
    property UsuRecebeEmailEtapaPoc: TNullableBoolean read GetUsuRecebeEmailEtapaPoc write SetUsuRecebeEmailEtapaPoc;
    //UsuEmailAtribuicaoEtapaPoc varchar (2000) - ???
    property UsuEmailAtribuicaoEtapaPoc: TNullableString read GetUsuEmailAtribuicaoEtapaPoc write SetUsuEmailAtribuicaoEtapaPoc;
    //UsuAgenteCobranca bit - ???
    property UsuAgenteCobranca: TNullableBoolean read GetUsuAgenteCobranca write SetUsuAgenteCobranca;
    //UsuGerenteCobranca bit - ???
    property UsuGerenteCobranca: TNullableBoolean read GetUsuGerenteCobranca write SetUsuGerenteCobranca;
    //UsuAutorizaEfetivacaoPocIndependenteEtapa bit - ???
    property UsuAutorizaEfetivacaoPocIndependenteEtapa: TNullableBoolean read GetUsuAutorizaEfetivacaoPocIndependenteEtapa write SetUsuAutorizaEfetivacaoPocIndependenteEtapa;
    //UsuGerentePoc bit - ???
    property UsuGerentePoc: TNullableBoolean read GetUsuGerentePoc write SetUsuGerentePoc;
    //UsuAgentePoc bit - ???
    property UsuAgentePoc: TNullableBoolean read GetUsuAgentePoc write SetUsuAgentePoc;
    //UsuNomesObservacaoAnalise varchar (1000) - ???
    property UsuNomesObservacaoAnalise: TNullableString read GetUsuNomesObservacaoAnalise write SetUsuNomesObservacaoAnalise;
    //UsuAlteraParatroBloqueadoPefin bit - ???
    property UsuAlteraParatroBloqueadoPefin: TNullableBoolean read GetUsuAlteraParatroBloqueadoPefin write SetUsuAlteraParatroBloqueadoPefin;
    //UsuPermitePularEtapaPoc bit - ???
    property UsuPermitePularEtapaPoc: TNullableBoolean read GetUsuPermitePularEtapaPoc write SetUsuPermitePularEtapaPoc;
    //UsuAnalisePoc bit - ???
    property UsuAnalisePoc: TNullableBoolean read GetUsuAnalisePoc write SetUsuAnalisePoc;
    //UsuPocAlteraStatusFormalizacao bit - ???
    property UsuPocAlteraStatusFormalizacao: TNullableBoolean read GetUsuPocAlteraStatusFormalizacao write SetUsuPocAlteraStatusFormalizacao;
    //UsuLiberaCondicionanteOperacao bit - ???
    property UsuLiberaCondicionanteOperacao: TNullableBoolean read GetUsuLiberaCondicionanteOperacao write SetUsuLiberaCondicionanteOperacao;
    //UsuPocPermiteAnaliseUnica bit - ???
    property UsuPocPermiteAnaliseUnica: TNullableBoolean read GetUsuPocPermiteAnaliseUnica write SetUsuPocPermiteAnaliseUnica;
    //UsuPocPermiteAnaliseUnicaValor float - ???
    property UsuPocPermiteAnaliseUnicaValor: TNullableCurrency read GetUsuPocPermiteAnaliseUnicaValor write SetUsuPocPermiteAnaliseUnicaValor;
    //UsuDesativado bit - ???
    property UsuDesativado: TNullableBoolean read GetUsuDesativado write SetUsuDesativado;
    //UsuPocPermiteAnaliseUnicaValorTranche float - ???
    property UsuPocPermiteAnaliseUnicaValorTranche: TNullableCurrency read GetUsuPocPermiteAnaliseUnicaValorTranche write SetUsuPocPermiteAnaliseUnicaValorTranche;
    //UsuPocPermiteAnaliseUnicaValorClean float - ???
    property UsuPocPermiteAnaliseUnicaValorClean: TNullableCurrency read GetUsuPocPermiteAnaliseUnicaValorClean write SetUsuPocPermiteAnaliseUnicaValorClean;
  end;

  IIteratorAROBUsuario = interface(IIteratorActiveRecord)
    function CurrentItem: IAROBUsuario;
  end;

  ICollectionAROBUsuario = interface(ICollectionActiveRecord)
    function GetItem(Index: Integer): IAROBUsuario;

    function Add(const Item: IAROBUsuario): Integer;
    function First: IAROBUsuario;
    procedure Insert(Index: Integer; const Item: IAROBUsuario);
    function Last: IAROBUsuario;
    function New(const AConnection: IActiveRecordConnection): IAROBUsuario;
    property Item[Index: Integer]: IAROBUsuario read GetItem; default;
  end;

  TCollectionAROBUsuario = class(TCollectionActiveRecord, ICollectionAROBUsuario)
  protected
    { ICollectionAROBUsuario }
    function GetItem(Index: Integer): IAROBUsuario;

    function Add(const Item: IAROBUsuario): Integer;
    function First: IAROBUsuario;
    procedure Insert(Index: Integer; const Item: IAROBUsuario);
    function Last: IAROBUsuario;
    function New(const AConnection: IActiveRecordConnection): IAROBUsuario;
  end;

  TIteratorAROBUsuarioDecorator = class(TIteratorCollectionActiveRecordDecorator, IIteratorAROBUsuario)
  protected
    { IIteratorAROBUsuario }
    function CurrentItem: IAROBUsuario;
  public
    class function Decore(const ACollectionAROBUsuario: ICollectionAROBUsuario): IIteratorAROBUsuario;
  end;

  TIteratorAROBUsuarioQueryDecorator = class(TIteratorActiveRecordQueryDecorator, IIteratorAROBUsuario)
  protected
    { IIteratorAROBUsuario }
    function CurrentItem: IAROBUsuario;
  public
    class function Decore(const AAROBUsuarioQuery: IActiveRecordQuery): IIteratorAROBUsuario;
  end;

  TAROBUsuario = class(TActiveRecord, IAROBUsuario)
  private
    FPrimaryKeyUsuLogin: string;
    FUsuLogin: string;
    FGruCodigo: TNullableInteger;
    FUsuNome: TNullableString;
    FUsuSenha: TNullableString;
    FEmpCodigo: TNullableInteger;
    FUsuAutorizaOperacaoRestricao: TNullableBoolean;
    FAgeCodigo: TNullableInteger;
    FGalCodigo: TNullableInteger;
    FUsuMaxValorLimiteCretioParaCedente: TNullableCurrency;
    FUsuDataExpirar: TNullableDateTime;
    FUsuAutorizaEfetivacaoSolicitacaoVencimento: TNullableBoolean;
    FUsuAutorizaEfetivacaoSolicitacaoProtesto: TNullableBoolean;
    FUsuOperacaoAnalisadaNaoPodeSerEfetivada: TNullableBoolean;
    FUsuAutorizaTitulosAcordoAlcada: TNullableBoolean;
    FUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao: TNullableCurrency;
    FUsuValorSuperiorLimiteAutorizar: TNullableCurrency;
    FUsuValorMaximoCadastramentoLimiteCreditoSacado: TNullableCurrency;
    FUsuPossibilitaEfetivacaoBorderoRestricao: TNullableBoolean;
    FUsuValorLimiteAdicionalOperacao: TNullableCurrency;
    FUsuEmailSaldoContaVinculada: TNullableString;
    FId_TipoObservacao: TNullableInteger;
    FUsuCodime: TNullableBoolean;
    FUsuSemConsistencia: TNullableBoolean;
    FUsuAlteraConfirmacaoTituloOperacao: TNullableBoolean;
    FUsuAlteraConfirmacaoIngresso: TNullableBoolean;
    FUsuTipoAcesso: TNullableString;
    FUsuInclusaoCNPJCPFGerencieCarteira: TNullableBoolean;
    FUsuExclusaoCNPJCPFGerencieCarteira: TNullableBoolean;
    FPag_Id: TNullableInteger;
    FSop_Id: TNullableInteger;
    FUsuAlteraSenhaProximoAcesso: TNullableBoolean;
    FUsuVisualizaEventoCaucao: TNullableBoolean;
    FUsuAutorizaEfetivacaoSolicitacaoBaixa: TNullableBoolean;
    FUsuAutorizaEfetivacaoSolicitacaoCartorio: TNullableBoolean;
    FUsuAutorizaEfetivacaoSolicitacaoInsProtesto: TNullableBoolean;
    FUsuAutorizaEfetivacaoSolicitacaoDesconto: TNullableBoolean;
    FUsuAutorizaEfetivacaoSolicitacaoAbatimento: TNullableBoolean;
    FUsuAutorizaEfetivacaoSolicitacaoResgate: TNullableBoolean;
    FUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia: TNullableBoolean;
    FUsuAutorizaEfetivacaoCoaf: TNullableBoolean;
    FUsuLiberaConsultaOrgaoCreditoForaPrazo: TNullableBoolean;
    FUsuQtdConsultasSerasaMes: TNullableInteger;
    FUsuAgenteChecagem: TNullableBoolean;
    FUsuGerenteChecagem: TNullableBoolean;
    FUsuAlteraChecagemLote: TNullableBoolean;
    FUsuVeTodasOperacoesMonitor: TNullableBoolean;
    FUsuRecebeEmailEtapaPoc: TNullableBoolean;
    FUsuEmailAtribuicaoEtapaPoc: TNullableString;
    FUsuAgenteCobranca: TNullableBoolean;
    FUsuGerenteCobranca: TNullableBoolean;
    FUsuAutorizaEfetivacaoPocIndependenteEtapa: TNullableBoolean;
    FUsuGerentePoc: TNullableBoolean;
    FUsuAgentePoc: TNullableBoolean;
    FUsuNomesObservacaoAnalise: TNullableString;
    FUsuAlteraParatroBloqueadoPefin: TNullableBoolean;
    FUsuPermitePularEtapaPoc: TNullableBoolean;
    FUsuAnalisePoc: TNullableBoolean;
    FUsuPocAlteraStatusFormalizacao: TNullableBoolean;
    FUsuLiberaCondicionanteOperacao: TNullableBoolean;
    FUsuPocPermiteAnaliseUnica: TNullableBoolean;
    FUsuPocPermiteAnaliseUnicaValor: TNullableCurrency;
    FUsuDesativado: TNullableBoolean;
    FUsuPocPermiteAnaliseUnicaValorTranche: TNullableCurrency;
    FUsuPocPermiteAnaliseUnicaValorClean: TNullableCurrency;
  protected
    { IActiveRecordAccess }
    procedure Clear(Index: Integer); override;
    function DisplayText(Index: Integer): string; override;
    function GetAsString(Index: Integer): string; override;
    function GetValue(Index: Integer): Variant; override;
    function IsNull(Index: Integer): Boolean; override;
    procedure SetAsString(Index: Integer; const Value: string); override;
    procedure SetValue(Index: Integer; const Value: Variant); override;
    { IAROBUsuario }
    function GetUsuLogin: string;
    function GetGruCodigo: TNullableInteger;
    function GetUsuNome: TNullableString;
    function GetUsuSenha: TNullableString;
    function GetEmpCodigo: TNullableInteger;
    function GetUsuAutorizaOperacaoRestricao: TNullableBoolean;
    function GetAgeCodigo: TNullableInteger;
    function GetGalCodigo: TNullableInteger;
    function GetUsuMaxValorLimiteCretioParaCedente: TNullableCurrency;
    function GetUsuDataExpirar: TNullableDateTime;
    function GetUsuAutorizaEfetivacaoSolicitacaoVencimento: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoProtesto: TNullableBoolean;
    function GetUsuOperacaoAnalisadaNaoPodeSerEfetivada: TNullableBoolean;
    function GetUsuAutorizaTitulosAcordoAlcada: TNullableBoolean;
    function GetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao: TNullableCurrency;
    function GetUsuValorSuperiorLimiteAutorizar: TNullableCurrency;
    function GetUsuValorMaximoCadastramentoLimiteCreditoSacado: TNullableCurrency;
    function GetUsuPossibilitaEfetivacaoBorderoRestricao: TNullableBoolean;
    function GetUsuValorLimiteAdicionalOperacao: TNullableCurrency;
    function GetUsuEmailSaldoContaVinculada: TNullableString;
    function GetId_TipoObservacao: TNullableInteger;
    function GetUsuCodime: TNullableBoolean;
    function GetUsuSemConsistencia: TNullableBoolean;
    function GetUsuAlteraConfirmacaoTituloOperacao: TNullableBoolean;
    function GetUsuAlteraConfirmacaoIngresso: TNullableBoolean;
    function GetUsuTipoAcesso: TNullableString;
    function GetUsuInclusaoCNPJCPFGerencieCarteira: TNullableBoolean;
    function GetUsuExclusaoCNPJCPFGerencieCarteira: TNullableBoolean;
    function GetPag_Id: TNullableInteger;
    function GetSop_Id: TNullableInteger;
    function GetUsuAlteraSenhaProximoAcesso: TNullableBoolean;
    function GetUsuVisualizaEventoCaucao: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoBaixa: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoCartorio: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoInsProtesto: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoDesconto: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoAbatimento: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoResgate: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoCoaf: TNullableBoolean;
    function GetUsuLiberaConsultaOrgaoCreditoForaPrazo: TNullableBoolean;
    function GetUsuQtdConsultasSerasaMes: TNullableInteger;
    function GetUsuAgenteChecagem: TNullableBoolean;
    function GetUsuGerenteChecagem: TNullableBoolean;
    function GetUsuAlteraChecagemLote: TNullableBoolean;
    function GetUsuVeTodasOperacoesMonitor: TNullableBoolean;
    function GetUsuRecebeEmailEtapaPoc: TNullableBoolean;
    function GetUsuEmailAtribuicaoEtapaPoc: TNullableString;
    function GetUsuAgenteCobranca: TNullableBoolean;
    function GetUsuGerenteCobranca: TNullableBoolean;
    function GetUsuAutorizaEfetivacaoPocIndependenteEtapa: TNullableBoolean;
    function GetUsuGerentePoc: TNullableBoolean;
    function GetUsuAgentePoc: TNullableBoolean;
    function GetUsuNomesObservacaoAnalise: TNullableString;
    function GetUsuAlteraParatroBloqueadoPefin: TNullableBoolean;
    function GetUsuPermitePularEtapaPoc: TNullableBoolean;
    function GetUsuAnalisePoc: TNullableBoolean;
    function GetUsuPocAlteraStatusFormalizacao: TNullableBoolean;
    function GetUsuLiberaCondicionanteOperacao: TNullableBoolean;
    function GetUsuPocPermiteAnaliseUnica: TNullableBoolean;
    function GetUsuPocPermiteAnaliseUnicaValor: TNullableCurrency;
    function GetUsuDesativado: TNullableBoolean;
    function GetUsuPocPermiteAnaliseUnicaValorTranche: TNullableCurrency;
    function GetUsuPocPermiteAnaliseUnicaValorClean: TNullableCurrency;
    procedure SetUsuLogin(const Value: string);
    procedure SetGruCodigo(const Value: TNullableInteger);
    procedure SetUsuNome(const Value: TNullableString);
    procedure SetUsuSenha(const Value: TNullableString);
    procedure SetEmpCodigo(const Value: TNullableInteger);
    procedure SetUsuAutorizaOperacaoRestricao(const Value: TNullableBoolean);
    procedure SetAgeCodigo(const Value: TNullableInteger);
    procedure SetGalCodigo(const Value: TNullableInteger);
    procedure SetUsuMaxValorLimiteCretioParaCedente(const Value: TNullableCurrency);
    procedure SetUsuDataExpirar(const Value: TNullableDateTime);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoVencimento(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoProtesto(const Value: TNullableBoolean);
    procedure SetUsuOperacaoAnalisadaNaoPodeSerEfetivada(const Value: TNullableBoolean);
    procedure SetUsuAutorizaTitulosAcordoAlcada(const Value: TNullableBoolean);
    procedure SetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao(const Value: TNullableCurrency);
    procedure SetUsuValorSuperiorLimiteAutorizar(const Value: TNullableCurrency);
    procedure SetUsuValorMaximoCadastramentoLimiteCreditoSacado(const Value: TNullableCurrency);
    procedure SetUsuPossibilitaEfetivacaoBorderoRestricao(const Value: TNullableBoolean);
    procedure SetUsuValorLimiteAdicionalOperacao(const Value: TNullableCurrency);
    procedure SetUsuEmailSaldoContaVinculada(const Value: TNullableString);
    procedure SetId_TipoObservacao(const Value: TNullableInteger);
    procedure SetUsuCodime(const Value: TNullableBoolean);
    procedure SetUsuSemConsistencia(const Value: TNullableBoolean);
    procedure SetUsuAlteraConfirmacaoTituloOperacao(const Value: TNullableBoolean);
    procedure SetUsuAlteraConfirmacaoIngresso(const Value: TNullableBoolean);
    procedure SetUsuTipoAcesso(const Value: TNullableString);
    procedure SetUsuInclusaoCNPJCPFGerencieCarteira(const Value: TNullableBoolean);
    procedure SetUsuExclusaoCNPJCPFGerencieCarteira(const Value: TNullableBoolean);
    procedure SetPag_Id(const Value: TNullableInteger);
    procedure SetSop_Id(const Value: TNullableInteger);
    procedure SetUsuAlteraSenhaProximoAcesso(const Value: TNullableBoolean);
    procedure SetUsuVisualizaEventoCaucao(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoBaixa(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoCartorio(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoInsProtesto(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoDesconto(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoAbatimento(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoResgate(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoCoaf(const Value: TNullableBoolean);
    procedure SetUsuLiberaConsultaOrgaoCreditoForaPrazo(const Value: TNullableBoolean);
    procedure SetUsuQtdConsultasSerasaMes(const Value: TNullableInteger);
    procedure SetUsuAgenteChecagem(const Value: TNullableBoolean);
    procedure SetUsuGerenteChecagem(const Value: TNullableBoolean);
    procedure SetUsuAlteraChecagemLote(const Value: TNullableBoolean);
    procedure SetUsuVeTodasOperacoesMonitor(const Value: TNullableBoolean);
    procedure SetUsuRecebeEmailEtapaPoc(const Value: TNullableBoolean);
    procedure SetUsuEmailAtribuicaoEtapaPoc(const Value: TNullableString);
    procedure SetUsuAgenteCobranca(const Value: TNullableBoolean);
    procedure SetUsuGerenteCobranca(const Value: TNullableBoolean);
    procedure SetUsuAutorizaEfetivacaoPocIndependenteEtapa(const Value: TNullableBoolean);
    procedure SetUsuGerentePoc(const Value: TNullableBoolean);
    procedure SetUsuAgentePoc(const Value: TNullableBoolean);
    procedure SetUsuNomesObservacaoAnalise(const Value: TNullableString);
    procedure SetUsuAlteraParatroBloqueadoPefin(const Value: TNullableBoolean);
    procedure SetUsuPermitePularEtapaPoc(const Value: TNullableBoolean);
    procedure SetUsuAnalisePoc(const Value: TNullableBoolean);
    procedure SetUsuPocAlteraStatusFormalizacao(const Value: TNullableBoolean);
    procedure SetUsuLiberaCondicionanteOperacao(const Value: TNullableBoolean);
    procedure SetUsuPocPermiteAnaliseUnica(const Value: TNullableBoolean);
    procedure SetUsuPocPermiteAnaliseUnicaValor(const Value: TNullableCurrency);
    procedure SetUsuDesativado(const Value: TNullableBoolean);
    procedure SetUsuPocPermiteAnaliseUnicaValorTranche(const Value: TNullableCurrency);
    procedure SetUsuPocPermiteAnaliseUnicaValorClean(const Value: TNullableCurrency);
    procedure CopyFrom(AActiveRecord: TActiveRecord); overload; override;
    function CreateItemRelationship(Index: Integer): TActiveRecord; override;
    procedure Persist; override;
    procedure PersistSQL;
    procedure SetRecordSet(const ARecordSet: _RecordSet; AOffset: Integer); override;
  public
    constructor Create(const AConnection: IActiveRecordConnection); override;
    class function QueryByUsuLogin(const AUsuLogin: string; const AConnection: IActiveRecordConnection): IActiveRecordQuery;
    class function FindByUsuLogin(const AUsuLogin: string; const AConnection: IActiveRecordConnection): IAROBUsuario;
    class function GUIDItem: TGUID; override;
    class function Metadata: IActiveRecordMetadata; override;
    class function ViewMetadata: IActiveRecordMetadata; override;
  end;

  TAROBUsuarioMetadata = record
    Table: TTableMetadata;
    Fields: array [0..63] of TFieldMetadata;
  end;

const
  Campo_OBUsuario_UsuLogin = 0;
  Campo_OBUsuario_GruCodigo = 1;
  Campo_OBUsuario_UsuNome = 2;
  Campo_OBUsuario_UsuSenha = 3;
  Campo_OBUsuario_EmpCodigo = 4;
  Campo_OBUsuario_UsuAutorizaOperacaoRestricao = 5;
  Campo_OBUsuario_AgeCodigo = 6;
  Campo_OBUsuario_GalCodigo = 7;
  Campo_OBUsuario_UsuMaxValorLimiteCretioParaCedente = 8;
  Campo_OBUsuario_UsuDataExpirar = 9;
  Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoVencimento = 10;
  Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoProtesto = 11;
  Campo_OBUsuario_UsuOperacaoAnalisadaNaoPodeSerEfetivada = 12;
  Campo_OBUsuario_UsuAutorizaTitulosAcordoAlcada = 13;
  Campo_OBUsuario_UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao = 14;
  Campo_OBUsuario_UsuValorSuperiorLimiteAutorizar = 15;
  Campo_OBUsuario_UsuValorMaximoCadastramentoLimiteCreditoSacado = 16;
  Campo_OBUsuario_UsuPossibilitaEfetivacaoBorderoRestricao = 17;
  Campo_OBUsuario_UsuValorLimiteAdicionalOperacao = 18;
  Campo_OBUsuario_UsuEmailSaldoContaVinculada = 19;
  Campo_OBUsuario_Id_TipoObservacao = 20;
  Campo_OBUsuario_UsuCodime = 21;
  Campo_OBUsuario_UsuSemConsistencia = 22;
  Campo_OBUsuario_UsuAlteraConfirmacaoTituloOperacao = 23;
  Campo_OBUsuario_UsuAlteraConfirmacaoIngresso = 24;
  Campo_OBUsuario_UsuTipoAcesso = 25;
  Campo_OBUsuario_UsuInclusaoCNPJCPFGerencieCarteira = 26;
  Campo_OBUsuario_UsuExclusaoCNPJCPFGerencieCarteira = 27;
  Campo_OBUsuario_Pag_Id = 28;
  Campo_OBUsuario_Sop_Id = 29;
  Campo_OBUsuario_UsuAlteraSenhaProximoAcesso = 30;
  Campo_OBUsuario_UsuVisualizaEventoCaucao = 31;
  Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoBaixa = 32;
  Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartorio = 33;
  Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoInsProtesto = 34;
  Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoDesconto = 35;
  Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoAbatimento = 36;
  Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoResgate = 37;
  Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia = 38;
  Campo_OBUsuario_UsuAutorizaEfetivacaoCoaf = 39;
  Campo_OBUsuario_UsuLiberaConsultaOrgaoCreditoForaPrazo = 40;
  Campo_OBUsuario_UsuQtdConsultasSerasaMes = 41;
  Campo_OBUsuario_UsuAgenteChecagem = 42;
  Campo_OBUsuario_UsuGerenteChecagem = 43;
  Campo_OBUsuario_UsuAlteraChecagemLote = 44;
  Campo_OBUsuario_UsuVeTodasOperacoesMonitor = 45;
  Campo_OBUsuario_UsuRecebeEmailEtapaPoc = 46;
  Campo_OBUsuario_UsuEmailAtribuicaoEtapaPoc = 47;
  Campo_OBUsuario_UsuAgenteCobranca = 48;
  Campo_OBUsuario_UsuGerenteCobranca = 49;
  Campo_OBUsuario_UsuAutorizaEfetivacaoPocIndependenteEtapa = 50;
  Campo_OBUsuario_UsuGerentePoc = 51;
  Campo_OBUsuario_UsuAgentePoc = 52;
  Campo_OBUsuario_UsuNomesObservacaoAnalise = 53;
  Campo_OBUsuario_UsuAlteraParatroBloqueadoPefin = 54;
  Campo_OBUsuario_UsuPermitePularEtapaPoc = 55;
  Campo_OBUsuario_UsuAnalisePoc = 56;
  Campo_OBUsuario_UsuPocAlteraStatusFormalizacao = 57;
  Campo_OBUsuario_UsuLiberaCondicionanteOperacao = 58;
  Campo_OBUsuario_UsuPocPermiteAnaliseUnica = 59;
  Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValor = 60;
  Campo_OBUsuario_UsuDesativado = 61;
  Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorTranche = 62;
  Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorClean = 63;
  OBUsuario_ReferenciaParaNovosCampos = Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorClean + 1;
  AROBUsuarioMetadata: TAROBUsuarioMetadata = (
    Table: (Name: 'OBUsuario'; PrimaryKeyFields: 'UsuLogin'; DeletedField: '');
    Fields: (
      (Index: Campo_OBUsuario_UsuLogin; Name: 'UsuLogin'; FieldType: arftVarchar; Length: 10; Nullable: False;
        Caption: 'UsuÃ¡rio'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuÃ¡rio'; ColumnCharWidth: 10),
      (Index: Campo_OBUsuario_GruCodigo; Name: 'GruCodigo'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'GruCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'GruCodigo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_OBUsuario_UsuNome; Name: 'UsuNome'; FieldType: arftVarchar; Length: 60; Nullable: True;
        Caption: 'UsuNome'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuNome'; ColumnCharWidth: 60),
      (Index: Campo_OBUsuario_UsuSenha; Name: 'UsuSenha'; FieldType: arftVarchar; Length: 6; Nullable: True;
        Caption: 'Senha'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'Senha'; ColumnCharWidth: 6),
      (Index: Campo_OBUsuario_EmpCodigo; Name: 'EmpCodigo'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'EmpCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'EmpCodigo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_OBUsuario_UsuAutorizaOperacaoRestricao; Name: 'UsuAutorizaOperacaoRestricao'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAutorizaOperacaoRestricao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAutorizaOperacaoRestricao'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_AgeCodigo; Name: 'AgeCodigo'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'AgeCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'AgeCodigo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_OBUsuario_GalCodigo; Name: 'GalCodigo'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'GalCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'GalCodigo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_OBUsuario_UsuMaxValorLimiteCretioParaCedente; Name: 'UsuMaxValorLimiteCretioParaCedente'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'UsuMaxValorLimiteCretioParaCedente'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuMaxValorLimiteCretioParaCedente'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_OBUsuario_UsuDataExpirar; Name: 'UsuDataExpirar'; FieldType: arftDateTime; Length: 0; Nullable: True;
        Caption: 'UsuDataExpirar'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuDataExpirar'; ColumnCharWidth: ColumnCharWidthForDateTime),
      (Index: Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoVencimento; Name: 'UsuAutorizaEfetivacaoSolicitacaoVencimento'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAutorizaEfetivacaoSolicitacaoVencimento'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAutorizaEfetivacaoSolicitacaoVencimento'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoProtesto; Name: 'UsuAutorizaEfetivacaoSolicitacaoProtesto'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAutorizaEfetivacaoSolicitacaoProtesto'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAutorizaEfetivacaoSolicitacaoProtesto'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuOperacaoAnalisadaNaoPodeSerEfetivada; Name: 'UsuOperacaoAnalisadaNaoPodeSerEfetivada'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuOperacaoAnalisadaNaoPodeSerEfetivada'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuOperacaoAnalisadaNaoPodeSerEfetivada'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAutorizaTitulosAcordoAlcada; Name: 'UsuAutorizaTitulosAcordoAlcada'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAutorizaTitulosAcordoAlcada'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAutorizaTitulosAcordoAlcada'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao; Name: 'UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_OBUsuario_UsuValorSuperiorLimiteAutorizar; Name: 'UsuValorSuperiorLimiteAutorizar'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'UsuValorSuperiorLimiteAutorizar'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuValorSuperiorLimiteAutorizar'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_OBUsuario_UsuValorMaximoCadastramentoLimiteCreditoSacado; Name: 'UsuValorMaximoCadastramentoLimiteCreditoSacado'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'UsuValorMaximoCadastramentoLimiteCreditoSacado'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuValorMaximoCadastramentoLimiteCreditoSacado'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_OBUsuario_UsuPossibilitaEfetivacaoBorderoRestricao; Name: 'UsuPossibilitaEfetivacaoBorderoRestricao'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuPossibilitaEfetivacaoBorderoRestricao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuPossibilitaEfetivacaoBorderoRestricao'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuValorLimiteAdicionalOperacao; Name: 'UsuValorLimiteAdicionalOperacao'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'UsuValorLimiteAdicionalOperacao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuValorLimiteAdicionalOperacao'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_OBUsuario_UsuEmailSaldoContaVinculada; Name: 'UsuEmailSaldoContaVinculada'; FieldType: arftVarchar; Length: 250; Nullable: True;
        Caption: 'UsuEmailSaldoContaVinculada'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuEmailSaldoContaVinculada'; ColumnCharWidth: 250),
      (Index: Campo_OBUsuario_Id_TipoObservacao; Name: 'Id_TipoObservacao'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'Id_TipoObservacao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'Id_TipoObservacao'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_OBUsuario_UsuCodime; Name: 'UsuCodime'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuCodime'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuCodime'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuSemConsistencia; Name: 'UsuSemConsistencia'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuSemConsistencia'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuSemConsistencia'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAlteraConfirmacaoTituloOperacao; Name: 'UsuAlteraConfirmacaoTituloOperacao'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAlteraConfirmacaoTituloOperacao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAlteraConfirmacaoTituloOperacao'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAlteraConfirmacaoIngresso; Name: 'UsuAlteraConfirmacaoIngresso'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAlteraConfirmacaoIngresso'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAlteraConfirmacaoIngresso'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuTipoAcesso; Name: 'UsuTipoAcesso'; FieldType: arftVarchar; Length: 1; Nullable: True;
        Caption: 'UsuTipoAcesso'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuTipoAcesso'; ColumnCharWidth: 1),
      (Index: Campo_OBUsuario_UsuInclusaoCNPJCPFGerencieCarteira; Name: 'UsuInclusaoCNPJCPFGerencieCarteira'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuInclusaoCNPJCPFGerencieCarteira'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuInclusaoCNPJCPFGerencieCarteira'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuExclusaoCNPJCPFGerencieCarteira; Name: 'UsuExclusaoCNPJCPFGerencieCarteira'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuExclusaoCNPJCPFGerencieCarteira'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuExclusaoCNPJCPFGerencieCarteira'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_Pag_Id; Name: 'Pag_Id'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'Pag_Id'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'Pag_Id'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_OBUsuario_Sop_Id; Name: 'Sop_Id'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'Sop_Id'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'Sop_Id'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_OBUsuario_UsuAlteraSenhaProximoAcesso; Name: 'UsuAlteraSenhaProximoAcesso'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAlteraSenhaProximoAcesso'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAlteraSenhaProximoAcesso'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuVisualizaEventoCaucao; Name: 'UsuVisualizaEventoCaucao'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuVisualizaEventoCaucao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuVisualizaEventoCaucao'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoBaixa; Name: 'UsuAutorizaEfetivacaoSolicitacaoBaixa'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAutorizaEfetivacaoSolicitacaoBaixa'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAutorizaEfetivacaoSolicitacaoBaixa'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartorio; Name: 'UsuAutorizaEfetivacaoSolicitacaoCartorio'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAutorizaEfetivacaoSolicitacaoCartorio'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAutorizaEfetivacaoSolicitacaoCartorio'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoInsProtesto; Name: 'UsuAutorizaEfetivacaoSolicitacaoInsProtesto'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAutorizaEfetivacaoSolicitacaoInsProtesto'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAutorizaEfetivacaoSolicitacaoInsProtesto'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoDesconto; Name: 'UsuAutorizaEfetivacaoSolicitacaoDesconto'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAutorizaEfetivacaoSolicitacaoDesconto'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAutorizaEfetivacaoSolicitacaoDesconto'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoAbatimento; Name: 'UsuAutorizaEfetivacaoSolicitacaoAbatimento'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAutorizaEfetivacaoSolicitacaoAbatimento'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAutorizaEfetivacaoSolicitacaoAbatimento'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoResgate; Name: 'UsuAutorizaEfetivacaoSolicitacaoResgate'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAutorizaEfetivacaoSolicitacaoResgate'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAutorizaEfetivacaoSolicitacaoResgate'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia; Name: 'UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAutorizaEfetivacaoCoaf; Name: 'UsuAutorizaEfetivacaoCoaf'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAutorizaEfetivacaoCoaf'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAutorizaEfetivacaoCoaf'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuLiberaConsultaOrgaoCreditoForaPrazo; Name: 'UsuLiberaConsultaOrgaoCreditoForaPrazo'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuLiberaConsultaOrgaoCreditoForaPrazo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuLiberaConsultaOrgaoCreditoForaPrazo'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuQtdConsultasSerasaMes; Name: 'UsuQtdConsultasSerasaMes'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'UsuQtdConsultasSerasaMes'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuQtdConsultasSerasaMes'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_OBUsuario_UsuAgenteChecagem; Name: 'UsuAgenteChecagem'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAgenteChecagem'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAgenteChecagem'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuGerenteChecagem; Name: 'UsuGerenteChecagem'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuGerenteChecagem'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuGerenteChecagem'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAlteraChecagemLote; Name: 'UsuAlteraChecagemLote'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAlteraChecagemLote'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAlteraChecagemLote'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuVeTodasOperacoesMonitor; Name: 'UsuVeTodasOperacoesMonitor'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuVeTodasOperacoesMonitor'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuVeTodasOperacoesMonitor'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuRecebeEmailEtapaPoc; Name: 'UsuRecebeEmailEtapaPoc'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuRecebeEmailEtapaPoc'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuRecebeEmailEtapaPoc'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuEmailAtribuicaoEtapaPoc; Name: 'UsuEmailAtribuicaoEtapaPoc'; FieldType: arftVarchar; Length: 2000; Nullable: True;
        Caption: 'UsuEmailAtribuicaoEtapaPoc'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuEmailAtribuicaoEtapaPoc'; ColumnCharWidth: 2000),
      (Index: Campo_OBUsuario_UsuAgenteCobranca; Name: 'UsuAgenteCobranca'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAgenteCobranca'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAgenteCobranca'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuGerenteCobranca; Name: 'UsuGerenteCobranca'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuGerenteCobranca'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuGerenteCobranca'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAutorizaEfetivacaoPocIndependenteEtapa; Name: 'UsuAutorizaEfetivacaoPocIndependenteEtapa'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAutorizaEfetivacaoPocIndependenteEtapa'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAutorizaEfetivacaoPocIndependenteEtapa'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuGerentePoc; Name: 'UsuGerentePoc'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuGerentePoc'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuGerentePoc'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAgentePoc; Name: 'UsuAgentePoc'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAgentePoc'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAgentePoc'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuNomesObservacaoAnalise; Name: 'UsuNomesObservacaoAnalise'; FieldType: arftVarchar; Length: 1000; Nullable: True;
        Caption: 'UsuNomesObservacaoAnalise'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuNomesObservacaoAnalise'; ColumnCharWidth: 1000),
      (Index: Campo_OBUsuario_UsuAlteraParatroBloqueadoPefin; Name: 'UsuAlteraParatroBloqueadoPefin'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAlteraParatroBloqueadoPefin'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAlteraParatroBloqueadoPefin'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuPermitePularEtapaPoc; Name: 'UsuPermitePularEtapaPoc'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuPermitePularEtapaPoc'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuPermitePularEtapaPoc'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuAnalisePoc; Name: 'UsuAnalisePoc'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuAnalisePoc'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAnalisePoc'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuPocAlteraStatusFormalizacao; Name: 'UsuPocAlteraStatusFormalizacao'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuPocAlteraStatusFormalizacao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuPocAlteraStatusFormalizacao'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuLiberaCondicionanteOperacao; Name: 'UsuLiberaCondicionanteOperacao'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuLiberaCondicionanteOperacao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuLiberaCondicionanteOperacao'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuPocPermiteAnaliseUnica; Name: 'UsuPocPermiteAnaliseUnica'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuPocPermiteAnaliseUnica'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuPocPermiteAnaliseUnica'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValor; Name: 'UsuPocPermiteAnaliseUnicaValor'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'UsuPocPermiteAnaliseUnicaValor'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuPocPermiteAnaliseUnicaValor'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_OBUsuario_UsuDesativado; Name: 'UsuDesativado'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'UsuDesativado'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuDesativado'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorTranche; Name: 'UsuPocPermiteAnaliseUnicaValorTranche'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'UsuPocPermiteAnaliseUnicaValorTranche'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuPocPermiteAnaliseUnicaValorTranche'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorClean; Name: 'UsuPocPermiteAnaliseUnicaValorClean'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'UsuPocPermiteAnaliseUnicaValorClean'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuPocPermiteAnaliseUnicaValorClean'; ColumnCharWidth: ColumnCharWidthForMoney)
    ));

implementation

type
  TAROBUsuarioDelete = class(TActiveRecordSingletonADO)
  protected
    procedure DefineParameters; override;
    function GetCommandSQL: string; override;
  public
    procedure Persist(AAROBUsuario: TAROBUsuario);
  end;

  TAROBUsuarioInsert = class(TActiveRecordSingletonADO)
  protected
    procedure DefineParameters; override;
    function GetCommandSQL: string; override;
  public
    procedure Persist(AAROBUsuario: TAROBUsuario);
  end;

  TAROBUsuarioUpdate = class(TActiveRecordSingletonADO)
  protected
    procedure DefineParameters; override;
    function GetCommandSQL: string; override;
  public
    procedure Persist(AAROBUsuario: TAROBUsuario);
  end;

  TAROBUsuarioMetadataObject = class(TInterfacedObject, IActiveRecordMetadata)
  protected
    { IActiveRecordMetadata }
    function FieldCount: Integer;
    function IndexOfName(const AName: string): Integer;
    function FieldMetadata(Index: Integer): TFieldMetadata;
    function FieldMetadataByName(const AName: string): TFieldMetadata;
    function RelationshipCount: Integer;
    function RelationshipMetadata(Index: Integer): TRelationshipMetadata;
    function TableMetadata: TTableMetadata;
  end;

var
  GQueryFactoryByUsuLogin: IActiveRecordQueryFactory;
  GAROBUsuarioDeleteCriticalSection: TCriticalSection;
  GAROBUsuarioInsertCriticalSection: TCriticalSection;
  GAROBUsuarioUpdateCriticalSection: TCriticalSection;

{ TCollectionAROBUsuario }

function TCollectionAROBUsuario.Add(const Item: IAROBUsuario): Integer;
begin
  Result := AddActiveRecord(Item);
end;

function TCollectionAROBUsuario.First: IAROBUsuario;
begin
  Result := nil;
  if Count > 0 then
    Result := GetItem(0);
end;

function TCollectionAROBUsuario.GetItem(Index: Integer): IAROBUsuario;
begin
  Result := List[Index] as IAROBUsuario;
end;

procedure TCollectionAROBUsuario.Insert(Index: Integer; const Item: IAROBUsuario);
begin
  List.Insert(Index, Item);
end;

function TCollectionAROBUsuario.Last: IAROBUsuario;
begin
  Result := nil;
  if Count > 0 then
    Result := GetItem(Count - 1);
end;

function TCollectionAROBUsuario.New(const AConnection: IActiveRecordConnection): IAROBUsuario;
begin
  Result := ClassActiveRecord.Create(AConnection) as IAROBUsuario;
  Add(Result);
end;

{ TIteratorAROBUsuarioDecorator }

function TIteratorAROBUsuarioDecorator.CurrentItem: IAROBUsuario;
begin
  Result := CurrentItemActiveRecord as IAROBUsuario;
end;

class function TIteratorAROBUsuarioDecorator.Decore(const ACollectionAROBUsuario: ICollectionAROBUsuario): IIteratorAROBUsuario;
begin
  Result := Create(ACollectionAROBUsuario);
end;

{ TIteratorAROBUsuarioQueryDecorator }

function TIteratorAROBUsuarioQueryDecorator.CurrentItem: IAROBUsuario;
begin
  Result := CurrentItemActiveRecord as IAROBUsuario;
end;

class function TIteratorAROBUsuarioQueryDecorator.Decore(const AAROBUsuarioQuery: IActiveRecordQuery): IIteratorAROBUsuario;
begin
  Result := Create(AAROBUsuarioQuery);
end;

{ TAROBUsuario }

procedure TAROBUsuario.Clear(Index: Integer);
begin
  case Index of
    Campo_OBUsuario_GruCodigo: SetGruCodigo(NullInteger);
    Campo_OBUsuario_UsuNome: SetUsuNome(NullString);
    Campo_OBUsuario_UsuSenha: SetUsuSenha(NullString);
    Campo_OBUsuario_EmpCodigo: SetEmpCodigo(NullInteger);
    Campo_OBUsuario_UsuAutorizaOperacaoRestricao: SetUsuAutorizaOperacaoRestricao(Nullable(False));
    Campo_OBUsuario_AgeCodigo: SetAgeCodigo(Nullable(0));
    Campo_OBUsuario_GalCodigo: SetGalCodigo(Nullable(0));
    Campo_OBUsuario_UsuMaxValorLimiteCretioParaCedente: SetUsuMaxValorLimiteCretioParaCedente(NullableCurrency(0));
    Campo_OBUsuario_UsuDataExpirar: SetUsuDataExpirar(NullDateTime);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoVencimento: SetUsuAutorizaEfetivacaoSolicitacaoVencimento(Nullable(False));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoProtesto: SetUsuAutorizaEfetivacaoSolicitacaoProtesto(Nullable(False));
    Campo_OBUsuario_UsuOperacaoAnalisadaNaoPodeSerEfetivada: SetUsuOperacaoAnalisadaNaoPodeSerEfetivada(Nullable(False));
    Campo_OBUsuario_UsuAutorizaTitulosAcordoAlcada: SetUsuAutorizaTitulosAcordoAlcada(Nullable(False));
    Campo_OBUsuario_UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao: SetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao(NullableCurrency(0));
    Campo_OBUsuario_UsuValorSuperiorLimiteAutorizar: SetUsuValorSuperiorLimiteAutorizar(NullableCurrency(0));
    Campo_OBUsuario_UsuValorMaximoCadastramentoLimiteCreditoSacado: SetUsuValorMaximoCadastramentoLimiteCreditoSacado(NullableCurrency(0));
    Campo_OBUsuario_UsuPossibilitaEfetivacaoBorderoRestricao: SetUsuPossibilitaEfetivacaoBorderoRestricao(Nullable(False));
    Campo_OBUsuario_UsuValorLimiteAdicionalOperacao: SetUsuValorLimiteAdicionalOperacao(NullableCurrency(0));
    Campo_OBUsuario_UsuEmailSaldoContaVinculada: SetUsuEmailSaldoContaVinculada(Nullable(''));
    Campo_OBUsuario_Id_TipoObservacao: SetId_TipoObservacao(Nullable(0));
    Campo_OBUsuario_UsuCodime: SetUsuCodime(NullBoolean);
    Campo_OBUsuario_UsuSemConsistencia: SetUsuSemConsistencia(Nullable(False));
    Campo_OBUsuario_UsuAlteraConfirmacaoTituloOperacao: SetUsuAlteraConfirmacaoTituloOperacao(Nullable(True));
    Campo_OBUsuario_UsuAlteraConfirmacaoIngresso: SetUsuAlteraConfirmacaoIngresso(Nullable(True));
    Campo_OBUsuario_UsuTipoAcesso: SetUsuTipoAcesso(Nullable('L'));
    Campo_OBUsuario_UsuInclusaoCNPJCPFGerencieCarteira: SetUsuInclusaoCNPJCPFGerencieCarteira(Nullable(False));
    Campo_OBUsuario_UsuExclusaoCNPJCPFGerencieCarteira: SetUsuExclusaoCNPJCPFGerencieCarteira(Nullable(False));
    Campo_OBUsuario_Pag_Id: SetPag_Id(Nullable(0));
    Campo_OBUsuario_Sop_Id: SetSop_Id(Nullable(0));
    Campo_OBUsuario_UsuAlteraSenhaProximoAcesso: SetUsuAlteraSenhaProximoAcesso(Nullable(False));
    Campo_OBUsuario_UsuVisualizaEventoCaucao: SetUsuVisualizaEventoCaucao(Nullable(False));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoBaixa: SetUsuAutorizaEfetivacaoSolicitacaoBaixa(Nullable(False));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartorio: SetUsuAutorizaEfetivacaoSolicitacaoCartorio(Nullable(False));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoInsProtesto: SetUsuAutorizaEfetivacaoSolicitacaoInsProtesto(Nullable(False));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoDesconto: SetUsuAutorizaEfetivacaoSolicitacaoDesconto(Nullable(False));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoAbatimento: SetUsuAutorizaEfetivacaoSolicitacaoAbatimento(Nullable(False));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoResgate: SetUsuAutorizaEfetivacaoSolicitacaoResgate(Nullable(False));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia: SetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia(Nullable(False));
    Campo_OBUsuario_UsuAutorizaEfetivacaoCoaf: SetUsuAutorizaEfetivacaoCoaf(Nullable(False));
    Campo_OBUsuario_UsuLiberaConsultaOrgaoCreditoForaPrazo: SetUsuLiberaConsultaOrgaoCreditoForaPrazo(Nullable(False));
    Campo_OBUsuario_UsuQtdConsultasSerasaMes: SetUsuQtdConsultasSerasaMes(Nullable(0));
    Campo_OBUsuario_UsuAgenteChecagem: SetUsuAgenteChecagem(Nullable(False));
    Campo_OBUsuario_UsuGerenteChecagem: SetUsuGerenteChecagem(Nullable(False));
    Campo_OBUsuario_UsuAlteraChecagemLote: SetUsuAlteraChecagemLote(Nullable(False));
    Campo_OBUsuario_UsuVeTodasOperacoesMonitor: SetUsuVeTodasOperacoesMonitor(Nullable(True));
    Campo_OBUsuario_UsuRecebeEmailEtapaPoc: SetUsuRecebeEmailEtapaPoc(Nullable(False));
    Campo_OBUsuario_UsuEmailAtribuicaoEtapaPoc: SetUsuEmailAtribuicaoEtapaPoc(Nullable(''));
    Campo_OBUsuario_UsuAgenteCobranca: SetUsuAgenteCobranca(Nullable(False));
    Campo_OBUsuario_UsuGerenteCobranca: SetUsuGerenteCobranca(Nullable(False));
    Campo_OBUsuario_UsuAutorizaEfetivacaoPocIndependenteEtapa: SetUsuAutorizaEfetivacaoPocIndependenteEtapa(Nullable(False));
    Campo_OBUsuario_UsuGerentePoc: SetUsuGerentePoc(Nullable(False));
    Campo_OBUsuario_UsuAgentePoc: SetUsuAgentePoc(Nullable(False));
    Campo_OBUsuario_UsuNomesObservacaoAnalise: SetUsuNomesObservacaoAnalise(Nullable(''));
    Campo_OBUsuario_UsuAlteraParatroBloqueadoPefin: SetUsuAlteraParatroBloqueadoPefin(Nullable(False));
    Campo_OBUsuario_UsuPermitePularEtapaPoc: SetUsuPermitePularEtapaPoc(Nullable(False));
    Campo_OBUsuario_UsuAnalisePoc: SetUsuAnalisePoc(Nullable(False));
    Campo_OBUsuario_UsuPocAlteraStatusFormalizacao: SetUsuPocAlteraStatusFormalizacao(Nullable(False));
    Campo_OBUsuario_UsuLiberaCondicionanteOperacao: SetUsuLiberaCondicionanteOperacao(Nullable(False));
    Campo_OBUsuario_UsuPocPermiteAnaliseUnica: SetUsuPocPermiteAnaliseUnica(Nullable(False));
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValor: SetUsuPocPermiteAnaliseUnicaValor(NullableCurrency(0));
    Campo_OBUsuario_UsuDesativado: SetUsuDesativado(Nullable(False));
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorTranche: SetUsuPocPermiteAnaliseUnicaValorTranche(NullableCurrency(0));
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorClean: SetUsuPocPermiteAnaliseUnicaValorClean(NullableCurrency(0));
  else
    inherited;
  end;
end;

procedure TAROBUsuario.CopyFrom(AActiveRecord: TActiveRecord);
var
  LAROBUsuario: TAROBUsuario;
begin
  inherited;
  LAROBUsuario := AActiveRecord as TAROBUsuario;
  FUsuLogin := LAROBUsuario.FUsuLogin;
  FGruCodigo := LAROBUsuario.FGruCodigo;
  FUsuNome := LAROBUsuario.FUsuNome;
  FUsuSenha := LAROBUsuario.FUsuSenha;
  FEmpCodigo := LAROBUsuario.FEmpCodigo;
  FUsuAutorizaOperacaoRestricao := LAROBUsuario.FUsuAutorizaOperacaoRestricao;
  FAgeCodigo := LAROBUsuario.FAgeCodigo;
  FGalCodigo := LAROBUsuario.FGalCodigo;
  FUsuMaxValorLimiteCretioParaCedente := LAROBUsuario.FUsuMaxValorLimiteCretioParaCedente;
  FUsuDataExpirar := LAROBUsuario.FUsuDataExpirar;
  FUsuAutorizaEfetivacaoSolicitacaoVencimento := LAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoVencimento;
  FUsuAutorizaEfetivacaoSolicitacaoProtesto := LAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoProtesto;
  FUsuOperacaoAnalisadaNaoPodeSerEfetivada := LAROBUsuario.FUsuOperacaoAnalisadaNaoPodeSerEfetivada;
  FUsuAutorizaTitulosAcordoAlcada := LAROBUsuario.FUsuAutorizaTitulosAcordoAlcada;
  FUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao := LAROBUsuario.FUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao;
  FUsuValorSuperiorLimiteAutorizar := LAROBUsuario.FUsuValorSuperiorLimiteAutorizar;
  FUsuValorMaximoCadastramentoLimiteCreditoSacado := LAROBUsuario.FUsuValorMaximoCadastramentoLimiteCreditoSacado;
  FUsuPossibilitaEfetivacaoBorderoRestricao := LAROBUsuario.FUsuPossibilitaEfetivacaoBorderoRestricao;
  FUsuValorLimiteAdicionalOperacao := LAROBUsuario.FUsuValorLimiteAdicionalOperacao;
  FUsuEmailSaldoContaVinculada := LAROBUsuario.FUsuEmailSaldoContaVinculada;
  FId_TipoObservacao := LAROBUsuario.FId_TipoObservacao;
  FUsuCodime := LAROBUsuario.FUsuCodime;
  FUsuSemConsistencia := LAROBUsuario.FUsuSemConsistencia;
  FUsuAlteraConfirmacaoTituloOperacao := LAROBUsuario.FUsuAlteraConfirmacaoTituloOperacao;
  FUsuAlteraConfirmacaoIngresso := LAROBUsuario.FUsuAlteraConfirmacaoIngresso;
  FUsuTipoAcesso := LAROBUsuario.FUsuTipoAcesso;
  FUsuInclusaoCNPJCPFGerencieCarteira := LAROBUsuario.FUsuInclusaoCNPJCPFGerencieCarteira;
  FUsuExclusaoCNPJCPFGerencieCarteira := LAROBUsuario.FUsuExclusaoCNPJCPFGerencieCarteira;
  FPag_Id := LAROBUsuario.FPag_Id;
  FSop_Id := LAROBUsuario.FSop_Id;
  FUsuAlteraSenhaProximoAcesso := LAROBUsuario.FUsuAlteraSenhaProximoAcesso;
  FUsuVisualizaEventoCaucao := LAROBUsuario.FUsuVisualizaEventoCaucao;
  FUsuAutorizaEfetivacaoSolicitacaoBaixa := LAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoBaixa;
  FUsuAutorizaEfetivacaoSolicitacaoCartorio := LAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoCartorio;
  FUsuAutorizaEfetivacaoSolicitacaoInsProtesto := LAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoInsProtesto;
  FUsuAutorizaEfetivacaoSolicitacaoDesconto := LAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoDesconto;
  FUsuAutorizaEfetivacaoSolicitacaoAbatimento := LAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoAbatimento;
  FUsuAutorizaEfetivacaoSolicitacaoResgate := LAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoResgate;
  FUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia := LAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia;
  FUsuAutorizaEfetivacaoCoaf := LAROBUsuario.FUsuAutorizaEfetivacaoCoaf;
  FUsuLiberaConsultaOrgaoCreditoForaPrazo := LAROBUsuario.FUsuLiberaConsultaOrgaoCreditoForaPrazo;
  FUsuQtdConsultasSerasaMes := LAROBUsuario.FUsuQtdConsultasSerasaMes;
  FUsuAgenteChecagem := LAROBUsuario.FUsuAgenteChecagem;
  FUsuGerenteChecagem := LAROBUsuario.FUsuGerenteChecagem;
  FUsuAlteraChecagemLote := LAROBUsuario.FUsuAlteraChecagemLote;
  FUsuVeTodasOperacoesMonitor := LAROBUsuario.FUsuVeTodasOperacoesMonitor;
  FUsuRecebeEmailEtapaPoc := LAROBUsuario.FUsuRecebeEmailEtapaPoc;
  FUsuEmailAtribuicaoEtapaPoc := LAROBUsuario.FUsuEmailAtribuicaoEtapaPoc;
  FUsuAgenteCobranca := LAROBUsuario.FUsuAgenteCobranca;
  FUsuGerenteCobranca := LAROBUsuario.FUsuGerenteCobranca;
  FUsuAutorizaEfetivacaoPocIndependenteEtapa := LAROBUsuario.FUsuAutorizaEfetivacaoPocIndependenteEtapa;
  FUsuGerentePoc := LAROBUsuario.FUsuGerentePoc;
  FUsuAgentePoc := LAROBUsuario.FUsuAgentePoc;
  FUsuNomesObservacaoAnalise := LAROBUsuario.FUsuNomesObservacaoAnalise;
  FUsuAlteraParatroBloqueadoPefin := LAROBUsuario.FUsuAlteraParatroBloqueadoPefin;
  FUsuPermitePularEtapaPoc := LAROBUsuario.FUsuPermitePularEtapaPoc;
  FUsuAnalisePoc := LAROBUsuario.FUsuAnalisePoc;
  FUsuPocAlteraStatusFormalizacao := LAROBUsuario.FUsuPocAlteraStatusFormalizacao;
  FUsuLiberaCondicionanteOperacao := LAROBUsuario.FUsuLiberaCondicionanteOperacao;
  FUsuPocPermiteAnaliseUnica := LAROBUsuario.FUsuPocPermiteAnaliseUnica;
  FUsuPocPermiteAnaliseUnicaValor := LAROBUsuario.FUsuPocPermiteAnaliseUnicaValor;
  FUsuDesativado := LAROBUsuario.FUsuDesativado;
  FUsuPocPermiteAnaliseUnicaValorTranche := LAROBUsuario.FUsuPocPermiteAnaliseUnicaValorTranche;
  FUsuPocPermiteAnaliseUnicaValorClean := LAROBUsuario.FUsuPocPermiteAnaliseUnicaValorClean;
end;

constructor TAROBUsuario.Create(const AConnection: IActiveRecordConnection);
begin
  inherited;
  FGruCodigo := NullInteger;
  FUsuNome := NullString;
  FUsuSenha := NullString;
  FEmpCodigo := NullInteger;
  FUsuAutorizaOperacaoRestricao := Nullable(False);
  FAgeCodigo := Nullable(0);
  FGalCodigo := Nullable(0);
  FUsuMaxValorLimiteCretioParaCedente := NullableCurrency(0);
  FUsuDataExpirar := NullDateTime;
  FUsuAutorizaEfetivacaoSolicitacaoVencimento := Nullable(False);
  FUsuAutorizaEfetivacaoSolicitacaoProtesto := Nullable(False);
  FUsuOperacaoAnalisadaNaoPodeSerEfetivada := Nullable(False);
  FUsuAutorizaTitulosAcordoAlcada := Nullable(False);
  FUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao := NullableCurrency(0);
  FUsuValorSuperiorLimiteAutorizar := NullableCurrency(0);
  FUsuValorMaximoCadastramentoLimiteCreditoSacado := NullableCurrency(0);
  FUsuPossibilitaEfetivacaoBorderoRestricao := Nullable(False);
  FUsuValorLimiteAdicionalOperacao := NullableCurrency(0);
  FUsuEmailSaldoContaVinculada := Nullable('');
  FId_TipoObservacao := Nullable(0);
  FUsuCodime := NullBoolean;
  FUsuSemConsistencia := Nullable(False);
  FUsuAlteraConfirmacaoTituloOperacao := Nullable(True);
  FUsuAlteraConfirmacaoIngresso := Nullable(True);
  FUsuTipoAcesso := Nullable('L');
  FUsuInclusaoCNPJCPFGerencieCarteira := Nullable(False);
  FUsuExclusaoCNPJCPFGerencieCarteira := Nullable(False);
  FPag_Id := Nullable(0);
  FSop_Id := Nullable(0);
  FUsuAlteraSenhaProximoAcesso := Nullable(False);
  FUsuVisualizaEventoCaucao := Nullable(False);
  FUsuAutorizaEfetivacaoSolicitacaoBaixa := Nullable(False);
  FUsuAutorizaEfetivacaoSolicitacaoCartorio := Nullable(False);
  FUsuAutorizaEfetivacaoSolicitacaoInsProtesto := Nullable(False);
  FUsuAutorizaEfetivacaoSolicitacaoDesconto := Nullable(False);
  FUsuAutorizaEfetivacaoSolicitacaoAbatimento := Nullable(False);
  FUsuAutorizaEfetivacaoSolicitacaoResgate := Nullable(False);
  FUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia := Nullable(False);
  FUsuAutorizaEfetivacaoCoaf := Nullable(False);
  FUsuLiberaConsultaOrgaoCreditoForaPrazo := Nullable(False);
  FUsuQtdConsultasSerasaMes := Nullable(0);
  FUsuAgenteChecagem := Nullable(False);
  FUsuGerenteChecagem := Nullable(False);
  FUsuAlteraChecagemLote := Nullable(False);
  FUsuVeTodasOperacoesMonitor := Nullable(True);
  FUsuRecebeEmailEtapaPoc := Nullable(False);
  FUsuEmailAtribuicaoEtapaPoc := Nullable('');
  FUsuAgenteCobranca := Nullable(False);
  FUsuGerenteCobranca := Nullable(False);
  FUsuAutorizaEfetivacaoPocIndependenteEtapa := Nullable(False);
  FUsuGerentePoc := Nullable(False);
  FUsuAgentePoc := Nullable(False);
  FUsuNomesObservacaoAnalise := Nullable('');
  FUsuAlteraParatroBloqueadoPefin := Nullable(False);
  FUsuPermitePularEtapaPoc := Nullable(False);
  FUsuAnalisePoc := Nullable(False);
  FUsuPocAlteraStatusFormalizacao := Nullable(False);
  FUsuLiberaCondicionanteOperacao := Nullable(False);
  FUsuPocPermiteAnaliseUnica := Nullable(False);
  FUsuPocPermiteAnaliseUnicaValor := NullableCurrency(0);
  FUsuDesativado := Nullable(False);
  FUsuPocPermiteAnaliseUnicaValorTranche := NullableCurrency(0);
  FUsuPocPermiteAnaliseUnicaValorClean := NullableCurrency(0);
end;

function TAROBUsuario.CreateItemRelationship(Index: Integer): TActiveRecord;
begin
  Result := nil;
end;

function TAROBUsuario.DisplayText(Index: Integer): string;
begin
  case Index of
    Campo_OBUsuario_UsuAutorizaOperacaoRestricao: Result := NullOrString(GetUsuAutorizaOperacaoRestricao.Null, NaoSim[GetUsuAutorizaOperacaoRestricao.Value]);
    Campo_OBUsuario_UsuMaxValorLimiteCretioParaCedente: Result := NullOrString(GetUsuMaxValorLimiteCretioParaCedente.Null, FormatFloat(',0.00', GetUsuMaxValorLimiteCretioParaCedente.Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoVencimento: Result := NullOrString(GetUsuAutorizaEfetivacaoSolicitacaoVencimento.Null, NaoSim[GetUsuAutorizaEfetivacaoSolicitacaoVencimento.Value]);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoProtesto: Result := NullOrString(GetUsuAutorizaEfetivacaoSolicitacaoProtesto.Null, NaoSim[GetUsuAutorizaEfetivacaoSolicitacaoProtesto.Value]);
    Campo_OBUsuario_UsuOperacaoAnalisadaNaoPodeSerEfetivada: Result := NullOrString(GetUsuOperacaoAnalisadaNaoPodeSerEfetivada.Null, NaoSim[GetUsuOperacaoAnalisadaNaoPodeSerEfetivada.Value]);
    Campo_OBUsuario_UsuAutorizaTitulosAcordoAlcada: Result := NullOrString(GetUsuAutorizaTitulosAcordoAlcada.Null, NaoSim[GetUsuAutorizaTitulosAcordoAlcada.Value]);
    Campo_OBUsuario_UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao: Result := NullOrString(GetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao.Null, FormatFloat(',0.00', GetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao.Value));
    Campo_OBUsuario_UsuValorSuperiorLimiteAutorizar: Result := NullOrString(GetUsuValorSuperiorLimiteAutorizar.Null, FormatFloat(',0.00', GetUsuValorSuperiorLimiteAutorizar.Value));
    Campo_OBUsuario_UsuValorMaximoCadastramentoLimiteCreditoSacado: Result := NullOrString(GetUsuValorMaximoCadastramentoLimiteCreditoSacado.Null, FormatFloat(',0.00', GetUsuValorMaximoCadastramentoLimiteCreditoSacado.Value));
    Campo_OBUsuario_UsuPossibilitaEfetivacaoBorderoRestricao: Result := NullOrString(GetUsuPossibilitaEfetivacaoBorderoRestricao.Null, NaoSim[GetUsuPossibilitaEfetivacaoBorderoRestricao.Value]);
    Campo_OBUsuario_UsuValorLimiteAdicionalOperacao: Result := NullOrString(GetUsuValorLimiteAdicionalOperacao.Null, FormatFloat(',0.00', GetUsuValorLimiteAdicionalOperacao.Value));
    Campo_OBUsuario_UsuCodime: Result := NullOrString(GetUsuCodime.Null, NaoSim[GetUsuCodime.Value]);
    Campo_OBUsuario_UsuSemConsistencia: Result := NullOrString(GetUsuSemConsistencia.Null, NaoSim[GetUsuSemConsistencia.Value]);
    Campo_OBUsuario_UsuAlteraConfirmacaoTituloOperacao: Result := NullOrString(GetUsuAlteraConfirmacaoTituloOperacao.Null, NaoSim[GetUsuAlteraConfirmacaoTituloOperacao.Value]);
    Campo_OBUsuario_UsuAlteraConfirmacaoIngresso: Result := NullOrString(GetUsuAlteraConfirmacaoIngresso.Null, NaoSim[GetUsuAlteraConfirmacaoIngresso.Value]);
    Campo_OBUsuario_UsuInclusaoCNPJCPFGerencieCarteira: Result := NullOrString(GetUsuInclusaoCNPJCPFGerencieCarteira.Null, NaoSim[GetUsuInclusaoCNPJCPFGerencieCarteira.Value]);
    Campo_OBUsuario_UsuExclusaoCNPJCPFGerencieCarteira: Result := NullOrString(GetUsuExclusaoCNPJCPFGerencieCarteira.Null, NaoSim[GetUsuExclusaoCNPJCPFGerencieCarteira.Value]);
    Campo_OBUsuario_UsuAlteraSenhaProximoAcesso: Result := NullOrString(GetUsuAlteraSenhaProximoAcesso.Null, NaoSim[GetUsuAlteraSenhaProximoAcesso.Value]);
    Campo_OBUsuario_UsuVisualizaEventoCaucao: Result := NullOrString(GetUsuVisualizaEventoCaucao.Null, NaoSim[GetUsuVisualizaEventoCaucao.Value]);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoBaixa: Result := NullOrString(GetUsuAutorizaEfetivacaoSolicitacaoBaixa.Null, NaoSim[GetUsuAutorizaEfetivacaoSolicitacaoBaixa.Value]);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartorio: Result := NullOrString(GetUsuAutorizaEfetivacaoSolicitacaoCartorio.Null, NaoSim[GetUsuAutorizaEfetivacaoSolicitacaoCartorio.Value]);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoInsProtesto: Result := NullOrString(GetUsuAutorizaEfetivacaoSolicitacaoInsProtesto.Null, NaoSim[GetUsuAutorizaEfetivacaoSolicitacaoInsProtesto.Value]);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoDesconto: Result := NullOrString(GetUsuAutorizaEfetivacaoSolicitacaoDesconto.Null, NaoSim[GetUsuAutorizaEfetivacaoSolicitacaoDesconto.Value]);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoAbatimento: Result := NullOrString(GetUsuAutorizaEfetivacaoSolicitacaoAbatimento.Null, NaoSim[GetUsuAutorizaEfetivacaoSolicitacaoAbatimento.Value]);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoResgate: Result := NullOrString(GetUsuAutorizaEfetivacaoSolicitacaoResgate.Null, NaoSim[GetUsuAutorizaEfetivacaoSolicitacaoResgate.Value]);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia: Result := NullOrString(GetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia.Null, NaoSim[GetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia.Value]);
    Campo_OBUsuario_UsuAutorizaEfetivacaoCoaf: Result := NullOrString(GetUsuAutorizaEfetivacaoCoaf.Null, NaoSim[GetUsuAutorizaEfetivacaoCoaf.Value]);
    Campo_OBUsuario_UsuLiberaConsultaOrgaoCreditoForaPrazo: Result := NullOrString(GetUsuLiberaConsultaOrgaoCreditoForaPrazo.Null, NaoSim[GetUsuLiberaConsultaOrgaoCreditoForaPrazo.Value]);
    Campo_OBUsuario_UsuAgenteChecagem: Result := NullOrString(GetUsuAgenteChecagem.Null, NaoSim[GetUsuAgenteChecagem.Value]);
    Campo_OBUsuario_UsuGerenteChecagem: Result := NullOrString(GetUsuGerenteChecagem.Null, NaoSim[GetUsuGerenteChecagem.Value]);
    Campo_OBUsuario_UsuAlteraChecagemLote: Result := NullOrString(GetUsuAlteraChecagemLote.Null, NaoSim[GetUsuAlteraChecagemLote.Value]);
    Campo_OBUsuario_UsuVeTodasOperacoesMonitor: Result := NullOrString(GetUsuVeTodasOperacoesMonitor.Null, NaoSim[GetUsuVeTodasOperacoesMonitor.Value]);
    Campo_OBUsuario_UsuRecebeEmailEtapaPoc: Result := NullOrString(GetUsuRecebeEmailEtapaPoc.Null, NaoSim[GetUsuRecebeEmailEtapaPoc.Value]);
    Campo_OBUsuario_UsuAgenteCobranca: Result := NullOrString(GetUsuAgenteCobranca.Null, NaoSim[GetUsuAgenteCobranca.Value]);
    Campo_OBUsuario_UsuGerenteCobranca: Result := NullOrString(GetUsuGerenteCobranca.Null, NaoSim[GetUsuGerenteCobranca.Value]);
    Campo_OBUsuario_UsuAutorizaEfetivacaoPocIndependenteEtapa: Result := NullOrString(GetUsuAutorizaEfetivacaoPocIndependenteEtapa.Null, NaoSim[GetUsuAutorizaEfetivacaoPocIndependenteEtapa.Value]);
    Campo_OBUsuario_UsuGerentePoc: Result := NullOrString(GetUsuGerentePoc.Null, NaoSim[GetUsuGerentePoc.Value]);
    Campo_OBUsuario_UsuAgentePoc: Result := NullOrString(GetUsuAgentePoc.Null, NaoSim[GetUsuAgentePoc.Value]);
    Campo_OBUsuario_UsuAlteraParatroBloqueadoPefin: Result := NullOrString(GetUsuAlteraParatroBloqueadoPefin.Null, NaoSim[GetUsuAlteraParatroBloqueadoPefin.Value]);
    Campo_OBUsuario_UsuPermitePularEtapaPoc: Result := NullOrString(GetUsuPermitePularEtapaPoc.Null, NaoSim[GetUsuPermitePularEtapaPoc.Value]);
    Campo_OBUsuario_UsuAnalisePoc: Result := NullOrString(GetUsuAnalisePoc.Null, NaoSim[GetUsuAnalisePoc.Value]);
    Campo_OBUsuario_UsuPocAlteraStatusFormalizacao: Result := NullOrString(GetUsuPocAlteraStatusFormalizacao.Null, NaoSim[GetUsuPocAlteraStatusFormalizacao.Value]);
    Campo_OBUsuario_UsuLiberaCondicionanteOperacao: Result := NullOrString(GetUsuLiberaCondicionanteOperacao.Null, NaoSim[GetUsuLiberaCondicionanteOperacao.Value]);
    Campo_OBUsuario_UsuPocPermiteAnaliseUnica: Result := NullOrString(GetUsuPocPermiteAnaliseUnica.Null, NaoSim[GetUsuPocPermiteAnaliseUnica.Value]);
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValor: Result := NullOrString(GetUsuPocPermiteAnaliseUnicaValor.Null, FormatFloat(',0.00', GetUsuPocPermiteAnaliseUnicaValor.Value));
    Campo_OBUsuario_UsuDesativado: Result := NullOrString(GetUsuDesativado.Null, NaoSim[GetUsuDesativado.Value]);
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorTranche: Result := NullOrString(GetUsuPocPermiteAnaliseUnicaValorTranche.Null, FormatFloat(',0.00', GetUsuPocPermiteAnaliseUnicaValorTranche.Value));
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorClean: Result := NullOrString(GetUsuPocPermiteAnaliseUnicaValorClean.Null, FormatFloat(',0.00', GetUsuPocPermiteAnaliseUnicaValorClean.Value));
  else
    Result := inherited DisplayText(Index);
  end;
end;

class function TAROBUsuario.QueryByUsuLogin(const AUsuLogin: string; const AConnection: IActiveRecordConnection): IActiveRecordQuery;
begin
  Result := GQueryFactoryByUsuLogin.CreateQuery(AConnection, Self);
  Result.SetNextParameter(AUsuLogin);
end;

class function TAROBUsuario.FindByUsuLogin(const AUsuLogin: string; const AConnection: IActiveRecordConnection): IAROBUsuario;
begin
  Result := QueryByUsuLogin(AUsuLogin, AConnection).FirstActiveRecord as IAROBUsuario;
end;

function TAROBUsuario.GetUsuLogin: string;
begin
  Result := FUsuLogin;
end;

function TAROBUsuario.GetGruCodigo: TNullableInteger;
begin
  Result := FGruCodigo;
end;

function TAROBUsuario.GetUsuNome: TNullableString;
begin
  Result := FUsuNome;
end;

function TAROBUsuario.GetUsuSenha: TNullableString;
begin
  Result := FUsuSenha;
end;

function TAROBUsuario.GetEmpCodigo: TNullableInteger;
begin
  Result := FEmpCodigo;
end;

function TAROBUsuario.GetUsuAutorizaOperacaoRestricao: TNullableBoolean;
begin
  Result := FUsuAutorizaOperacaoRestricao;
end;

function TAROBUsuario.GetAgeCodigo: TNullableInteger;
begin
  Result := FAgeCodigo;
end;

function TAROBUsuario.GetGalCodigo: TNullableInteger;
begin
  Result := FGalCodigo;
end;

function TAROBUsuario.GetUsuMaxValorLimiteCretioParaCedente: TNullableCurrency;
begin
  Result := FUsuMaxValorLimiteCretioParaCedente;
end;

function TAROBUsuario.GetUsuDataExpirar: TNullableDateTime;
begin
  Result := FUsuDataExpirar;
end;

function TAROBUsuario.GetUsuAutorizaEfetivacaoSolicitacaoVencimento: TNullableBoolean;
begin
  Result := FUsuAutorizaEfetivacaoSolicitacaoVencimento;
end;

function TAROBUsuario.GetUsuAutorizaEfetivacaoSolicitacaoProtesto: TNullableBoolean;
begin
  Result := FUsuAutorizaEfetivacaoSolicitacaoProtesto;
end;

function TAROBUsuario.GetUsuOperacaoAnalisadaNaoPodeSerEfetivada: TNullableBoolean;
begin
  Result := FUsuOperacaoAnalisadaNaoPodeSerEfetivada;
end;

function TAROBUsuario.GetUsuAutorizaTitulosAcordoAlcada: TNullableBoolean;
begin
  Result := FUsuAutorizaTitulosAcordoAlcada;
end;

function TAROBUsuario.GetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao: TNullableCurrency;
begin
  Result := FUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao;
end;

function TAROBUsuario.GetUsuValorSuperiorLimiteAutorizar: TNullableCurrency;
begin
  Result := FUsuValorSuperiorLimiteAutorizar;
end;

function TAROBUsuario.GetUsuValorMaximoCadastramentoLimiteCreditoSacado: TNullableCurrency;
begin
  Result := FUsuValorMaximoCadastramentoLimiteCreditoSacado;
end;

function TAROBUsuario.GetUsuPossibilitaEfetivacaoBorderoRestricao: TNullableBoolean;
begin
  Result := FUsuPossibilitaEfetivacaoBorderoRestricao;
end;

function TAROBUsuario.GetUsuValorLimiteAdicionalOperacao: TNullableCurrency;
begin
  Result := FUsuValorLimiteAdicionalOperacao;
end;

function TAROBUsuario.GetUsuEmailSaldoContaVinculada: TNullableString;
begin
  Result := FUsuEmailSaldoContaVinculada;
end;

function TAROBUsuario.GetId_TipoObservacao: TNullableInteger;
begin
  Result := FId_TipoObservacao;
end;

function TAROBUsuario.GetUsuCodime: TNullableBoolean;
begin
  Result := FUsuCodime;
end;

function TAROBUsuario.GetUsuSemConsistencia: TNullableBoolean;
begin
  Result := FUsuSemConsistencia;
end;

function TAROBUsuario.GetUsuAlteraConfirmacaoTituloOperacao: TNullableBoolean;
begin
  Result := FUsuAlteraConfirmacaoTituloOperacao;
end;

function TAROBUsuario.GetUsuAlteraConfirmacaoIngresso: TNullableBoolean;
begin
  Result := FUsuAlteraConfirmacaoIngresso;
end;

function TAROBUsuario.GetUsuTipoAcesso: TNullableString;
begin
  Result := FUsuTipoAcesso;
end;

function TAROBUsuario.GetUsuInclusaoCNPJCPFGerencieCarteira: TNullableBoolean;
begin
  Result := FUsuInclusaoCNPJCPFGerencieCarteira;
end;

function TAROBUsuario.GetUsuExclusaoCNPJCPFGerencieCarteira: TNullableBoolean;
begin
  Result := FUsuExclusaoCNPJCPFGerencieCarteira;
end;

function TAROBUsuario.GetPag_Id: TNullableInteger;
begin
  Result := FPag_Id;
end;

function TAROBUsuario.GetSop_Id: TNullableInteger;
begin
  Result := FSop_Id;
end;

function TAROBUsuario.GetUsuAlteraSenhaProximoAcesso: TNullableBoolean;
begin
  Result := FUsuAlteraSenhaProximoAcesso;
end;

function TAROBUsuario.GetUsuVisualizaEventoCaucao: TNullableBoolean;
begin
  Result := FUsuVisualizaEventoCaucao;
end;

function TAROBUsuario.GetUsuAutorizaEfetivacaoSolicitacaoBaixa: TNullableBoolean;
begin
  Result := FUsuAutorizaEfetivacaoSolicitacaoBaixa;
end;

function TAROBUsuario.GetUsuAutorizaEfetivacaoSolicitacaoCartorio: TNullableBoolean;
begin
  Result := FUsuAutorizaEfetivacaoSolicitacaoCartorio;
end;

function TAROBUsuario.GetUsuAutorizaEfetivacaoSolicitacaoInsProtesto: TNullableBoolean;
begin
  Result := FUsuAutorizaEfetivacaoSolicitacaoInsProtesto;
end;

function TAROBUsuario.GetUsuAutorizaEfetivacaoSolicitacaoDesconto: TNullableBoolean;
begin
  Result := FUsuAutorizaEfetivacaoSolicitacaoDesconto;
end;

function TAROBUsuario.GetUsuAutorizaEfetivacaoSolicitacaoAbatimento: TNullableBoolean;
begin
  Result := FUsuAutorizaEfetivacaoSolicitacaoAbatimento;
end;

function TAROBUsuario.GetUsuAutorizaEfetivacaoSolicitacaoResgate: TNullableBoolean;
begin
  Result := FUsuAutorizaEfetivacaoSolicitacaoResgate;
end;

function TAROBUsuario.GetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia: TNullableBoolean;
begin
  Result := FUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia;
end;

function TAROBUsuario.GetUsuAutorizaEfetivacaoCoaf: TNullableBoolean;
begin
  Result := FUsuAutorizaEfetivacaoCoaf;
end;

function TAROBUsuario.GetUsuLiberaConsultaOrgaoCreditoForaPrazo: TNullableBoolean;
begin
  Result := FUsuLiberaConsultaOrgaoCreditoForaPrazo;
end;

function TAROBUsuario.GetUsuQtdConsultasSerasaMes: TNullableInteger;
begin
  Result := FUsuQtdConsultasSerasaMes;
end;

function TAROBUsuario.GetUsuAgenteChecagem: TNullableBoolean;
begin
  Result := FUsuAgenteChecagem;
end;

function TAROBUsuario.GetUsuGerenteChecagem: TNullableBoolean;
begin
  Result := FUsuGerenteChecagem;
end;

function TAROBUsuario.GetUsuAlteraChecagemLote: TNullableBoolean;
begin
  Result := FUsuAlteraChecagemLote;
end;

function TAROBUsuario.GetUsuVeTodasOperacoesMonitor: TNullableBoolean;
begin
  Result := FUsuVeTodasOperacoesMonitor;
end;

function TAROBUsuario.GetUsuRecebeEmailEtapaPoc: TNullableBoolean;
begin
  Result := FUsuRecebeEmailEtapaPoc;
end;

function TAROBUsuario.GetUsuEmailAtribuicaoEtapaPoc: TNullableString;
begin
  Result := FUsuEmailAtribuicaoEtapaPoc;
end;

function TAROBUsuario.GetUsuAgenteCobranca: TNullableBoolean;
begin
  Result := FUsuAgenteCobranca;
end;

function TAROBUsuario.GetUsuGerenteCobranca: TNullableBoolean;
begin
  Result := FUsuGerenteCobranca;
end;

function TAROBUsuario.GetUsuAutorizaEfetivacaoPocIndependenteEtapa: TNullableBoolean;
begin
  Result := FUsuAutorizaEfetivacaoPocIndependenteEtapa;
end;

function TAROBUsuario.GetUsuGerentePoc: TNullableBoolean;
begin
  Result := FUsuGerentePoc;
end;

function TAROBUsuario.GetUsuAgentePoc: TNullableBoolean;
begin
  Result := FUsuAgentePoc;
end;

function TAROBUsuario.GetUsuNomesObservacaoAnalise: TNullableString;
begin
  Result := FUsuNomesObservacaoAnalise;
end;

function TAROBUsuario.GetUsuAlteraParatroBloqueadoPefin: TNullableBoolean;
begin
  Result := FUsuAlteraParatroBloqueadoPefin;
end;

function TAROBUsuario.GetUsuPermitePularEtapaPoc: TNullableBoolean;
begin
  Result := FUsuPermitePularEtapaPoc;
end;

function TAROBUsuario.GetUsuAnalisePoc: TNullableBoolean;
begin
  Result := FUsuAnalisePoc;
end;

function TAROBUsuario.GetUsuPocAlteraStatusFormalizacao: TNullableBoolean;
begin
  Result := FUsuPocAlteraStatusFormalizacao;
end;

function TAROBUsuario.GetUsuLiberaCondicionanteOperacao: TNullableBoolean;
begin
  Result := FUsuLiberaCondicionanteOperacao;
end;

function TAROBUsuario.GetUsuPocPermiteAnaliseUnica: TNullableBoolean;
begin
  Result := FUsuPocPermiteAnaliseUnica;
end;

function TAROBUsuario.GetUsuPocPermiteAnaliseUnicaValor: TNullableCurrency;
begin
  Result := FUsuPocPermiteAnaliseUnicaValor;
end;

function TAROBUsuario.GetUsuDesativado: TNullableBoolean;
begin
  Result := FUsuDesativado;
end;

function TAROBUsuario.GetUsuPocPermiteAnaliseUnicaValorTranche: TNullableCurrency;
begin
  Result := FUsuPocPermiteAnaliseUnicaValorTranche;
end;

function TAROBUsuario.GetUsuPocPermiteAnaliseUnicaValorClean: TNullableCurrency;
begin
  Result := FUsuPocPermiteAnaliseUnicaValorClean;
end;

function TAROBUsuario.GetAsString(Index: Integer): string;
begin
  case Index of
    Campo_OBUsuario_UsuLogin: Result := GetUsuLogin;
    Campo_OBUsuario_GruCodigo: Result := ToString(GetGruCodigo);
    Campo_OBUsuario_UsuNome: Result := ToString(GetUsuNome);
    Campo_OBUsuario_UsuSenha: Result := ToString(GetUsuSenha);
    Campo_OBUsuario_EmpCodigo: Result := ToString(GetEmpCodigo);
    Campo_OBUsuario_UsuAutorizaOperacaoRestricao: Result := ToStringNS(GetUsuAutorizaOperacaoRestricao);
    Campo_OBUsuario_AgeCodigo: Result := ToString(GetAgeCodigo);
    Campo_OBUsuario_GalCodigo: Result := ToString(GetGalCodigo);
    Campo_OBUsuario_UsuMaxValorLimiteCretioParaCedente: Result := ToString(GetUsuMaxValorLimiteCretioParaCedente);
    Campo_OBUsuario_UsuDataExpirar: Result := ToString(GetUsuDataExpirar);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoVencimento: Result := ToStringNS(GetUsuAutorizaEfetivacaoSolicitacaoVencimento);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoProtesto: Result := ToStringNS(GetUsuAutorizaEfetivacaoSolicitacaoProtesto);
    Campo_OBUsuario_UsuOperacaoAnalisadaNaoPodeSerEfetivada: Result := ToStringNS(GetUsuOperacaoAnalisadaNaoPodeSerEfetivada);
    Campo_OBUsuario_UsuAutorizaTitulosAcordoAlcada: Result := ToStringNS(GetUsuAutorizaTitulosAcordoAlcada);
    Campo_OBUsuario_UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao: Result := ToString(GetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao);
    Campo_OBUsuario_UsuValorSuperiorLimiteAutorizar: Result := ToString(GetUsuValorSuperiorLimiteAutorizar);
    Campo_OBUsuario_UsuValorMaximoCadastramentoLimiteCreditoSacado: Result := ToString(GetUsuValorMaximoCadastramentoLimiteCreditoSacado);
    Campo_OBUsuario_UsuPossibilitaEfetivacaoBorderoRestricao: Result := ToStringNS(GetUsuPossibilitaEfetivacaoBorderoRestricao);
    Campo_OBUsuario_UsuValorLimiteAdicionalOperacao: Result := ToString(GetUsuValorLimiteAdicionalOperacao);
    Campo_OBUsuario_UsuEmailSaldoContaVinculada: Result := ToString(GetUsuEmailSaldoContaVinculada);
    Campo_OBUsuario_Id_TipoObservacao: Result := ToString(GetId_TipoObservacao);
    Campo_OBUsuario_UsuCodime: Result := ToStringNS(GetUsuCodime);
    Campo_OBUsuario_UsuSemConsistencia: Result := ToStringNS(GetUsuSemConsistencia);
    Campo_OBUsuario_UsuAlteraConfirmacaoTituloOperacao: Result := ToStringNS(GetUsuAlteraConfirmacaoTituloOperacao);
    Campo_OBUsuario_UsuAlteraConfirmacaoIngresso: Result := ToStringNS(GetUsuAlteraConfirmacaoIngresso);
    Campo_OBUsuario_UsuTipoAcesso: Result := ToString(GetUsuTipoAcesso);
    Campo_OBUsuario_UsuInclusaoCNPJCPFGerencieCarteira: Result := ToStringNS(GetUsuInclusaoCNPJCPFGerencieCarteira);
    Campo_OBUsuario_UsuExclusaoCNPJCPFGerencieCarteira: Result := ToStringNS(GetUsuExclusaoCNPJCPFGerencieCarteira);
    Campo_OBUsuario_Pag_Id: Result := ToString(GetPag_Id);
    Campo_OBUsuario_Sop_Id: Result := ToString(GetSop_Id);
    Campo_OBUsuario_UsuAlteraSenhaProximoAcesso: Result := ToStringNS(GetUsuAlteraSenhaProximoAcesso);
    Campo_OBUsuario_UsuVisualizaEventoCaucao: Result := ToStringNS(GetUsuVisualizaEventoCaucao);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoBaixa: Result := ToStringNS(GetUsuAutorizaEfetivacaoSolicitacaoBaixa);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartorio: Result := ToStringNS(GetUsuAutorizaEfetivacaoSolicitacaoCartorio);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoInsProtesto: Result := ToStringNS(GetUsuAutorizaEfetivacaoSolicitacaoInsProtesto);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoDesconto: Result := ToStringNS(GetUsuAutorizaEfetivacaoSolicitacaoDesconto);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoAbatimento: Result := ToStringNS(GetUsuAutorizaEfetivacaoSolicitacaoAbatimento);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoResgate: Result := ToStringNS(GetUsuAutorizaEfetivacaoSolicitacaoResgate);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia: Result := ToStringNS(GetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia);
    Campo_OBUsuario_UsuAutorizaEfetivacaoCoaf: Result := ToStringNS(GetUsuAutorizaEfetivacaoCoaf);
    Campo_OBUsuario_UsuLiberaConsultaOrgaoCreditoForaPrazo: Result := ToStringNS(GetUsuLiberaConsultaOrgaoCreditoForaPrazo);
    Campo_OBUsuario_UsuQtdConsultasSerasaMes: Result := ToString(GetUsuQtdConsultasSerasaMes);
    Campo_OBUsuario_UsuAgenteChecagem: Result := ToStringNS(GetUsuAgenteChecagem);
    Campo_OBUsuario_UsuGerenteChecagem: Result := ToStringNS(GetUsuGerenteChecagem);
    Campo_OBUsuario_UsuAlteraChecagemLote: Result := ToStringNS(GetUsuAlteraChecagemLote);
    Campo_OBUsuario_UsuVeTodasOperacoesMonitor: Result := ToStringNS(GetUsuVeTodasOperacoesMonitor);
    Campo_OBUsuario_UsuRecebeEmailEtapaPoc: Result := ToStringNS(GetUsuRecebeEmailEtapaPoc);
    Campo_OBUsuario_UsuEmailAtribuicaoEtapaPoc: Result := ToString(GetUsuEmailAtribuicaoEtapaPoc);
    Campo_OBUsuario_UsuAgenteCobranca: Result := ToStringNS(GetUsuAgenteCobranca);
    Campo_OBUsuario_UsuGerenteCobranca: Result := ToStringNS(GetUsuGerenteCobranca);
    Campo_OBUsuario_UsuAutorizaEfetivacaoPocIndependenteEtapa: Result := ToStringNS(GetUsuAutorizaEfetivacaoPocIndependenteEtapa);
    Campo_OBUsuario_UsuGerentePoc: Result := ToStringNS(GetUsuGerentePoc);
    Campo_OBUsuario_UsuAgentePoc: Result := ToStringNS(GetUsuAgentePoc);
    Campo_OBUsuario_UsuNomesObservacaoAnalise: Result := ToString(GetUsuNomesObservacaoAnalise);
    Campo_OBUsuario_UsuAlteraParatroBloqueadoPefin: Result := ToStringNS(GetUsuAlteraParatroBloqueadoPefin);
    Campo_OBUsuario_UsuPermitePularEtapaPoc: Result := ToStringNS(GetUsuPermitePularEtapaPoc);
    Campo_OBUsuario_UsuAnalisePoc: Result := ToStringNS(GetUsuAnalisePoc);
    Campo_OBUsuario_UsuPocAlteraStatusFormalizacao: Result := ToStringNS(GetUsuPocAlteraStatusFormalizacao);
    Campo_OBUsuario_UsuLiberaCondicionanteOperacao: Result := ToStringNS(GetUsuLiberaCondicionanteOperacao);
    Campo_OBUsuario_UsuPocPermiteAnaliseUnica: Result := ToStringNS(GetUsuPocPermiteAnaliseUnica);
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValor: Result := ToString(GetUsuPocPermiteAnaliseUnicaValor);
    Campo_OBUsuario_UsuDesativado: Result := ToStringNS(GetUsuDesativado);
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorTranche: Result := ToString(GetUsuPocPermiteAnaliseUnicaValorTranche);
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorClean: Result := ToString(GetUsuPocPermiteAnaliseUnicaValorClean);
  else
    Result := inherited GetAsString(Index);
  end;
end;

function TAROBUsuario.GetValue(Index: Integer): Variant;
begin
  case Index of
    Campo_OBUsuario_UsuLogin: Result := GetUsuLogin;
    Campo_OBUsuario_GruCodigo: Result := ToVariant(GetGruCodigo);
    Campo_OBUsuario_UsuNome: Result := ToVariant(GetUsuNome);
    Campo_OBUsuario_UsuSenha: Result := ToVariant(GetUsuSenha);
    Campo_OBUsuario_EmpCodigo: Result := ToVariant(GetEmpCodigo);
    Campo_OBUsuario_UsuAutorizaOperacaoRestricao: Result := ToVariant(GetUsuAutorizaOperacaoRestricao);
    Campo_OBUsuario_AgeCodigo: Result := ToVariant(GetAgeCodigo);
    Campo_OBUsuario_GalCodigo: Result := ToVariant(GetGalCodigo);
    Campo_OBUsuario_UsuMaxValorLimiteCretioParaCedente: Result := ToVariant(GetUsuMaxValorLimiteCretioParaCedente);
    Campo_OBUsuario_UsuDataExpirar: Result := ToVariant(GetUsuDataExpirar);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoVencimento: Result := ToVariant(GetUsuAutorizaEfetivacaoSolicitacaoVencimento);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoProtesto: Result := ToVariant(GetUsuAutorizaEfetivacaoSolicitacaoProtesto);
    Campo_OBUsuario_UsuOperacaoAnalisadaNaoPodeSerEfetivada: Result := ToVariant(GetUsuOperacaoAnalisadaNaoPodeSerEfetivada);
    Campo_OBUsuario_UsuAutorizaTitulosAcordoAlcada: Result := ToVariant(GetUsuAutorizaTitulosAcordoAlcada);
    Campo_OBUsuario_UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao: Result := ToVariant(GetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao);
    Campo_OBUsuario_UsuValorSuperiorLimiteAutorizar: Result := ToVariant(GetUsuValorSuperiorLimiteAutorizar);
    Campo_OBUsuario_UsuValorMaximoCadastramentoLimiteCreditoSacado: Result := ToVariant(GetUsuValorMaximoCadastramentoLimiteCreditoSacado);
    Campo_OBUsuario_UsuPossibilitaEfetivacaoBorderoRestricao: Result := ToVariant(GetUsuPossibilitaEfetivacaoBorderoRestricao);
    Campo_OBUsuario_UsuValorLimiteAdicionalOperacao: Result := ToVariant(GetUsuValorLimiteAdicionalOperacao);
    Campo_OBUsuario_UsuEmailSaldoContaVinculada: Result := ToVariant(GetUsuEmailSaldoContaVinculada);
    Campo_OBUsuario_Id_TipoObservacao: Result := ToVariant(GetId_TipoObservacao);
    Campo_OBUsuario_UsuCodime: Result := ToVariant(GetUsuCodime);
    Campo_OBUsuario_UsuSemConsistencia: Result := ToVariant(GetUsuSemConsistencia);
    Campo_OBUsuario_UsuAlteraConfirmacaoTituloOperacao: Result := ToVariant(GetUsuAlteraConfirmacaoTituloOperacao);
    Campo_OBUsuario_UsuAlteraConfirmacaoIngresso: Result := ToVariant(GetUsuAlteraConfirmacaoIngresso);
    Campo_OBUsuario_UsuTipoAcesso: Result := ToVariant(GetUsuTipoAcesso);
    Campo_OBUsuario_UsuInclusaoCNPJCPFGerencieCarteira: Result := ToVariant(GetUsuInclusaoCNPJCPFGerencieCarteira);
    Campo_OBUsuario_UsuExclusaoCNPJCPFGerencieCarteira: Result := ToVariant(GetUsuExclusaoCNPJCPFGerencieCarteira);
    Campo_OBUsuario_Pag_Id: Result := ToVariant(GetPag_Id);
    Campo_OBUsuario_Sop_Id: Result := ToVariant(GetSop_Id);
    Campo_OBUsuario_UsuAlteraSenhaProximoAcesso: Result := ToVariant(GetUsuAlteraSenhaProximoAcesso);
    Campo_OBUsuario_UsuVisualizaEventoCaucao: Result := ToVariant(GetUsuVisualizaEventoCaucao);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoBaixa: Result := ToVariant(GetUsuAutorizaEfetivacaoSolicitacaoBaixa);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartorio: Result := ToVariant(GetUsuAutorizaEfetivacaoSolicitacaoCartorio);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoInsProtesto: Result := ToVariant(GetUsuAutorizaEfetivacaoSolicitacaoInsProtesto);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoDesconto: Result := ToVariant(GetUsuAutorizaEfetivacaoSolicitacaoDesconto);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoAbatimento: Result := ToVariant(GetUsuAutorizaEfetivacaoSolicitacaoAbatimento);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoResgate: Result := ToVariant(GetUsuAutorizaEfetivacaoSolicitacaoResgate);
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia: Result := ToVariant(GetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia);
    Campo_OBUsuario_UsuAutorizaEfetivacaoCoaf: Result := ToVariant(GetUsuAutorizaEfetivacaoCoaf);
    Campo_OBUsuario_UsuLiberaConsultaOrgaoCreditoForaPrazo: Result := ToVariant(GetUsuLiberaConsultaOrgaoCreditoForaPrazo);
    Campo_OBUsuario_UsuQtdConsultasSerasaMes: Result := ToVariant(GetUsuQtdConsultasSerasaMes);
    Campo_OBUsuario_UsuAgenteChecagem: Result := ToVariant(GetUsuAgenteChecagem);
    Campo_OBUsuario_UsuGerenteChecagem: Result := ToVariant(GetUsuGerenteChecagem);
    Campo_OBUsuario_UsuAlteraChecagemLote: Result := ToVariant(GetUsuAlteraChecagemLote);
    Campo_OBUsuario_UsuVeTodasOperacoesMonitor: Result := ToVariant(GetUsuVeTodasOperacoesMonitor);
    Campo_OBUsuario_UsuRecebeEmailEtapaPoc: Result := ToVariant(GetUsuRecebeEmailEtapaPoc);
    Campo_OBUsuario_UsuEmailAtribuicaoEtapaPoc: Result := ToVariant(GetUsuEmailAtribuicaoEtapaPoc);
    Campo_OBUsuario_UsuAgenteCobranca: Result := ToVariant(GetUsuAgenteCobranca);
    Campo_OBUsuario_UsuGerenteCobranca: Result := ToVariant(GetUsuGerenteCobranca);
    Campo_OBUsuario_UsuAutorizaEfetivacaoPocIndependenteEtapa: Result := ToVariant(GetUsuAutorizaEfetivacaoPocIndependenteEtapa);
    Campo_OBUsuario_UsuGerentePoc: Result := ToVariant(GetUsuGerentePoc);
    Campo_OBUsuario_UsuAgentePoc: Result := ToVariant(GetUsuAgentePoc);
    Campo_OBUsuario_UsuNomesObservacaoAnalise: Result := ToVariant(GetUsuNomesObservacaoAnalise);
    Campo_OBUsuario_UsuAlteraParatroBloqueadoPefin: Result := ToVariant(GetUsuAlteraParatroBloqueadoPefin);
    Campo_OBUsuario_UsuPermitePularEtapaPoc: Result := ToVariant(GetUsuPermitePularEtapaPoc);
    Campo_OBUsuario_UsuAnalisePoc: Result := ToVariant(GetUsuAnalisePoc);
    Campo_OBUsuario_UsuPocAlteraStatusFormalizacao: Result := ToVariant(GetUsuPocAlteraStatusFormalizacao);
    Campo_OBUsuario_UsuLiberaCondicionanteOperacao: Result := ToVariant(GetUsuLiberaCondicionanteOperacao);
    Campo_OBUsuario_UsuPocPermiteAnaliseUnica: Result := ToVariant(GetUsuPocPermiteAnaliseUnica);
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValor: Result := ToVariant(GetUsuPocPermiteAnaliseUnicaValor);
    Campo_OBUsuario_UsuDesativado: Result := ToVariant(GetUsuDesativado);
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorTranche: Result := ToVariant(GetUsuPocPermiteAnaliseUnicaValorTranche);
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorClean: Result := ToVariant(GetUsuPocPermiteAnaliseUnicaValorClean);
  else
    Result := inherited GetValue(Index);
  end;
end;

class function TAROBUsuario.GUIDItem: TGUID;
begin
  Result := IAROBUsuario;
end;

function TAROBUsuario.IsNull(Index: Integer): Boolean;
begin
  case Index of
    Campo_OBUsuario_UsuLogin: Result := False;
    Campo_OBUsuario_GruCodigo: Result := GetGruCodigo.Null;
    Campo_OBUsuario_UsuNome: Result := GetUsuNome.Null;
    Campo_OBUsuario_UsuSenha: Result := GetUsuSenha.Null;
    Campo_OBUsuario_EmpCodigo: Result := GetEmpCodigo.Null;
    Campo_OBUsuario_UsuAutorizaOperacaoRestricao: Result := GetUsuAutorizaOperacaoRestricao.Null;
    Campo_OBUsuario_AgeCodigo: Result := GetAgeCodigo.Null;
    Campo_OBUsuario_GalCodigo: Result := GetGalCodigo.Null;
    Campo_OBUsuario_UsuMaxValorLimiteCretioParaCedente: Result := GetUsuMaxValorLimiteCretioParaCedente.Null;
    Campo_OBUsuario_UsuDataExpirar: Result := GetUsuDataExpirar.Null;
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoVencimento: Result := GetUsuAutorizaEfetivacaoSolicitacaoVencimento.Null;
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoProtesto: Result := GetUsuAutorizaEfetivacaoSolicitacaoProtesto.Null;
    Campo_OBUsuario_UsuOperacaoAnalisadaNaoPodeSerEfetivada: Result := GetUsuOperacaoAnalisadaNaoPodeSerEfetivada.Null;
    Campo_OBUsuario_UsuAutorizaTitulosAcordoAlcada: Result := GetUsuAutorizaTitulosAcordoAlcada.Null;
    Campo_OBUsuario_UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao: Result := GetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao.Null;
    Campo_OBUsuario_UsuValorSuperiorLimiteAutorizar: Result := GetUsuValorSuperiorLimiteAutorizar.Null;
    Campo_OBUsuario_UsuValorMaximoCadastramentoLimiteCreditoSacado: Result := GetUsuValorMaximoCadastramentoLimiteCreditoSacado.Null;
    Campo_OBUsuario_UsuPossibilitaEfetivacaoBorderoRestricao: Result := GetUsuPossibilitaEfetivacaoBorderoRestricao.Null;
    Campo_OBUsuario_UsuValorLimiteAdicionalOperacao: Result := GetUsuValorLimiteAdicionalOperacao.Null;
    Campo_OBUsuario_UsuEmailSaldoContaVinculada: Result := GetUsuEmailSaldoContaVinculada.Null;
    Campo_OBUsuario_Id_TipoObservacao: Result := GetId_TipoObservacao.Null;
    Campo_OBUsuario_UsuCodime: Result := GetUsuCodime.Null;
    Campo_OBUsuario_UsuSemConsistencia: Result := GetUsuSemConsistencia.Null;
    Campo_OBUsuario_UsuAlteraConfirmacaoTituloOperacao: Result := GetUsuAlteraConfirmacaoTituloOperacao.Null;
    Campo_OBUsuario_UsuAlteraConfirmacaoIngresso: Result := GetUsuAlteraConfirmacaoIngresso.Null;
    Campo_OBUsuario_UsuTipoAcesso: Result := GetUsuTipoAcesso.Null;
    Campo_OBUsuario_UsuInclusaoCNPJCPFGerencieCarteira: Result := GetUsuInclusaoCNPJCPFGerencieCarteira.Null;
    Campo_OBUsuario_UsuExclusaoCNPJCPFGerencieCarteira: Result := GetUsuExclusaoCNPJCPFGerencieCarteira.Null;
    Campo_OBUsuario_Pag_Id: Result := GetPag_Id.Null;
    Campo_OBUsuario_Sop_Id: Result := GetSop_Id.Null;
    Campo_OBUsuario_UsuAlteraSenhaProximoAcesso: Result := GetUsuAlteraSenhaProximoAcesso.Null;
    Campo_OBUsuario_UsuVisualizaEventoCaucao: Result := GetUsuVisualizaEventoCaucao.Null;
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoBaixa: Result := GetUsuAutorizaEfetivacaoSolicitacaoBaixa.Null;
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartorio: Result := GetUsuAutorizaEfetivacaoSolicitacaoCartorio.Null;
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoInsProtesto: Result := GetUsuAutorizaEfetivacaoSolicitacaoInsProtesto.Null;
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoDesconto: Result := GetUsuAutorizaEfetivacaoSolicitacaoDesconto.Null;
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoAbatimento: Result := GetUsuAutorizaEfetivacaoSolicitacaoAbatimento.Null;
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoResgate: Result := GetUsuAutorizaEfetivacaoSolicitacaoResgate.Null;
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia: Result := GetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia.Null;
    Campo_OBUsuario_UsuAutorizaEfetivacaoCoaf: Result := GetUsuAutorizaEfetivacaoCoaf.Null;
    Campo_OBUsuario_UsuLiberaConsultaOrgaoCreditoForaPrazo: Result := GetUsuLiberaConsultaOrgaoCreditoForaPrazo.Null;
    Campo_OBUsuario_UsuQtdConsultasSerasaMes: Result := GetUsuQtdConsultasSerasaMes.Null;
    Campo_OBUsuario_UsuAgenteChecagem: Result := GetUsuAgenteChecagem.Null;
    Campo_OBUsuario_UsuGerenteChecagem: Result := GetUsuGerenteChecagem.Null;
    Campo_OBUsuario_UsuAlteraChecagemLote: Result := GetUsuAlteraChecagemLote.Null;
    Campo_OBUsuario_UsuVeTodasOperacoesMonitor: Result := GetUsuVeTodasOperacoesMonitor.Null;
    Campo_OBUsuario_UsuRecebeEmailEtapaPoc: Result := GetUsuRecebeEmailEtapaPoc.Null;
    Campo_OBUsuario_UsuEmailAtribuicaoEtapaPoc: Result := GetUsuEmailAtribuicaoEtapaPoc.Null;
    Campo_OBUsuario_UsuAgenteCobranca: Result := GetUsuAgenteCobranca.Null;
    Campo_OBUsuario_UsuGerenteCobranca: Result := GetUsuGerenteCobranca.Null;
    Campo_OBUsuario_UsuAutorizaEfetivacaoPocIndependenteEtapa: Result := GetUsuAutorizaEfetivacaoPocIndependenteEtapa.Null;
    Campo_OBUsuario_UsuGerentePoc: Result := GetUsuGerentePoc.Null;
    Campo_OBUsuario_UsuAgentePoc: Result := GetUsuAgentePoc.Null;
    Campo_OBUsuario_UsuNomesObservacaoAnalise: Result := GetUsuNomesObservacaoAnalise.Null;
    Campo_OBUsuario_UsuAlteraParatroBloqueadoPefin: Result := GetUsuAlteraParatroBloqueadoPefin.Null;
    Campo_OBUsuario_UsuPermitePularEtapaPoc: Result := GetUsuPermitePularEtapaPoc.Null;
    Campo_OBUsuario_UsuAnalisePoc: Result := GetUsuAnalisePoc.Null;
    Campo_OBUsuario_UsuPocAlteraStatusFormalizacao: Result := GetUsuPocAlteraStatusFormalizacao.Null;
    Campo_OBUsuario_UsuLiberaCondicionanteOperacao: Result := GetUsuLiberaCondicionanteOperacao.Null;
    Campo_OBUsuario_UsuPocPermiteAnaliseUnica: Result := GetUsuPocPermiteAnaliseUnica.Null;
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValor: Result := GetUsuPocPermiteAnaliseUnicaValor.Null;
    Campo_OBUsuario_UsuDesativado: Result := GetUsuDesativado.Null;
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorTranche: Result := GetUsuPocPermiteAnaliseUnicaValorTranche.Null;
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorClean: Result := GetUsuPocPermiteAnaliseUnicaValorClean.Null;
  else
    Result := inherited IsNull(Index);
  end;
end;

procedure TAROBUsuario.SetAsString(Index: Integer; const Value: string);
begin
  case Index of
    Campo_OBUsuario_UsuLogin: SetUsuLogin(Value);
    Campo_OBUsuario_GruCodigo: SetGruCodigo(StringToNullableInteger(Value));
    Campo_OBUsuario_UsuNome: SetUsuNome(Nullable(Value));
    Campo_OBUsuario_UsuSenha: SetUsuSenha(Nullable(Value));
    Campo_OBUsuario_EmpCodigo: SetEmpCodigo(StringToNullableInteger(Value));
    Campo_OBUsuario_UsuAutorizaOperacaoRestricao: SetUsuAutorizaOperacaoRestricao(NSToNullableBoolean(Value));
    Campo_OBUsuario_AgeCodigo: SetAgeCodigo(StringToNullableInteger(Value));
    Campo_OBUsuario_GalCodigo: SetGalCodigo(StringToNullableInteger(Value));
    Campo_OBUsuario_UsuMaxValorLimiteCretioParaCedente: SetUsuMaxValorLimiteCretioParaCedente(StringToNullableCurrency(Value));
    Campo_OBUsuario_UsuDataExpirar: SetUsuDataExpirar(StringToNullableDateTime(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoVencimento: SetUsuAutorizaEfetivacaoSolicitacaoVencimento(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoProtesto: SetUsuAutorizaEfetivacaoSolicitacaoProtesto(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuOperacaoAnalisadaNaoPodeSerEfetivada: SetUsuOperacaoAnalisadaNaoPodeSerEfetivada(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaTitulosAcordoAlcada: SetUsuAutorizaTitulosAcordoAlcada(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao: SetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao(StringToNullableCurrency(Value));
    Campo_OBUsuario_UsuValorSuperiorLimiteAutorizar: SetUsuValorSuperiorLimiteAutorizar(StringToNullableCurrency(Value));
    Campo_OBUsuario_UsuValorMaximoCadastramentoLimiteCreditoSacado: SetUsuValorMaximoCadastramentoLimiteCreditoSacado(StringToNullableCurrency(Value));
    Campo_OBUsuario_UsuPossibilitaEfetivacaoBorderoRestricao: SetUsuPossibilitaEfetivacaoBorderoRestricao(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuValorLimiteAdicionalOperacao: SetUsuValorLimiteAdicionalOperacao(StringToNullableCurrency(Value));
    Campo_OBUsuario_UsuEmailSaldoContaVinculada: SetUsuEmailSaldoContaVinculada(Nullable(Value));
    Campo_OBUsuario_Id_TipoObservacao: SetId_TipoObservacao(StringToNullableInteger(Value));
    Campo_OBUsuario_UsuCodime: SetUsuCodime(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuSemConsistencia: SetUsuSemConsistencia(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAlteraConfirmacaoTituloOperacao: SetUsuAlteraConfirmacaoTituloOperacao(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAlteraConfirmacaoIngresso: SetUsuAlteraConfirmacaoIngresso(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuTipoAcesso: SetUsuTipoAcesso(Nullable(Value));
    Campo_OBUsuario_UsuInclusaoCNPJCPFGerencieCarteira: SetUsuInclusaoCNPJCPFGerencieCarteira(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuExclusaoCNPJCPFGerencieCarteira: SetUsuExclusaoCNPJCPFGerencieCarteira(NSToNullableBoolean(Value));
    Campo_OBUsuario_Pag_Id: SetPag_Id(StringToNullableInteger(Value));
    Campo_OBUsuario_Sop_Id: SetSop_Id(StringToNullableInteger(Value));
    Campo_OBUsuario_UsuAlteraSenhaProximoAcesso: SetUsuAlteraSenhaProximoAcesso(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuVisualizaEventoCaucao: SetUsuVisualizaEventoCaucao(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoBaixa: SetUsuAutorizaEfetivacaoSolicitacaoBaixa(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartorio: SetUsuAutorizaEfetivacaoSolicitacaoCartorio(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoInsProtesto: SetUsuAutorizaEfetivacaoSolicitacaoInsProtesto(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoDesconto: SetUsuAutorizaEfetivacaoSolicitacaoDesconto(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoAbatimento: SetUsuAutorizaEfetivacaoSolicitacaoAbatimento(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoResgate: SetUsuAutorizaEfetivacaoSolicitacaoResgate(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia: SetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoCoaf: SetUsuAutorizaEfetivacaoCoaf(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuLiberaConsultaOrgaoCreditoForaPrazo: SetUsuLiberaConsultaOrgaoCreditoForaPrazo(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuQtdConsultasSerasaMes: SetUsuQtdConsultasSerasaMes(StringToNullableInteger(Value));
    Campo_OBUsuario_UsuAgenteChecagem: SetUsuAgenteChecagem(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuGerenteChecagem: SetUsuGerenteChecagem(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAlteraChecagemLote: SetUsuAlteraChecagemLote(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuVeTodasOperacoesMonitor: SetUsuVeTodasOperacoesMonitor(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuRecebeEmailEtapaPoc: SetUsuRecebeEmailEtapaPoc(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuEmailAtribuicaoEtapaPoc: SetUsuEmailAtribuicaoEtapaPoc(Nullable(Value));
    Campo_OBUsuario_UsuAgenteCobranca: SetUsuAgenteCobranca(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuGerenteCobranca: SetUsuGerenteCobranca(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoPocIndependenteEtapa: SetUsuAutorizaEfetivacaoPocIndependenteEtapa(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuGerentePoc: SetUsuGerentePoc(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAgentePoc: SetUsuAgentePoc(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuNomesObservacaoAnalise: SetUsuNomesObservacaoAnalise(Nullable(Value));
    Campo_OBUsuario_UsuAlteraParatroBloqueadoPefin: SetUsuAlteraParatroBloqueadoPefin(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuPermitePularEtapaPoc: SetUsuPermitePularEtapaPoc(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuAnalisePoc: SetUsuAnalisePoc(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuPocAlteraStatusFormalizacao: SetUsuPocAlteraStatusFormalizacao(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuLiberaCondicionanteOperacao: SetUsuLiberaCondicionanteOperacao(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuPocPermiteAnaliseUnica: SetUsuPocPermiteAnaliseUnica(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValor: SetUsuPocPermiteAnaliseUnicaValor(StringToNullableCurrency(Value));
    Campo_OBUsuario_UsuDesativado: SetUsuDesativado(NSToNullableBoolean(Value));
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorTranche: SetUsuPocPermiteAnaliseUnicaValorTranche(StringToNullableCurrency(Value));
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorClean: SetUsuPocPermiteAnaliseUnicaValorClean(StringToNullableCurrency(Value));
  else
    inherited;
  end;
end;

procedure TAROBUsuario.SetValue(Index: Integer; const Value: Variant);
begin
  case Index of
    Campo_OBUsuario_UsuLogin: SetUsuLogin(Value);
    Campo_OBUsuario_GruCodigo: SetGruCodigo(VariantToNullableInteger(Value));
    Campo_OBUsuario_UsuNome: SetUsuNome(VariantToNullableString(Value));
    Campo_OBUsuario_UsuSenha: SetUsuSenha(VariantToNullableString(Value));
    Campo_OBUsuario_EmpCodigo: SetEmpCodigo(VariantToNullableInteger(Value));
    Campo_OBUsuario_UsuAutorizaOperacaoRestricao: SetUsuAutorizaOperacaoRestricao(VariantToNullableBoolean(Value));
    Campo_OBUsuario_AgeCodigo: SetAgeCodigo(VariantToNullableInteger(Value));
    Campo_OBUsuario_GalCodigo: SetGalCodigo(VariantToNullableInteger(Value));
    Campo_OBUsuario_UsuMaxValorLimiteCretioParaCedente: SetUsuMaxValorLimiteCretioParaCedente(VariantToNullableCurrency(Value));
    Campo_OBUsuario_UsuDataExpirar: SetUsuDataExpirar(VariantToNullableDateTime(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoVencimento: SetUsuAutorizaEfetivacaoSolicitacaoVencimento(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoProtesto: SetUsuAutorizaEfetivacaoSolicitacaoProtesto(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuOperacaoAnalisadaNaoPodeSerEfetivada: SetUsuOperacaoAnalisadaNaoPodeSerEfetivada(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaTitulosAcordoAlcada: SetUsuAutorizaTitulosAcordoAlcada(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao: SetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao(VariantToNullableCurrency(Value));
    Campo_OBUsuario_UsuValorSuperiorLimiteAutorizar: SetUsuValorSuperiorLimiteAutorizar(VariantToNullableCurrency(Value));
    Campo_OBUsuario_UsuValorMaximoCadastramentoLimiteCreditoSacado: SetUsuValorMaximoCadastramentoLimiteCreditoSacado(VariantToNullableCurrency(Value));
    Campo_OBUsuario_UsuPossibilitaEfetivacaoBorderoRestricao: SetUsuPossibilitaEfetivacaoBorderoRestricao(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuValorLimiteAdicionalOperacao: SetUsuValorLimiteAdicionalOperacao(VariantToNullableCurrency(Value));
    Campo_OBUsuario_UsuEmailSaldoContaVinculada: SetUsuEmailSaldoContaVinculada(VariantToNullableString(Value));
    Campo_OBUsuario_Id_TipoObservacao: SetId_TipoObservacao(VariantToNullableInteger(Value));
    Campo_OBUsuario_UsuCodime: SetUsuCodime(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuSemConsistencia: SetUsuSemConsistencia(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAlteraConfirmacaoTituloOperacao: SetUsuAlteraConfirmacaoTituloOperacao(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAlteraConfirmacaoIngresso: SetUsuAlteraConfirmacaoIngresso(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuTipoAcesso: SetUsuTipoAcesso(VariantToNullableString(Value));
    Campo_OBUsuario_UsuInclusaoCNPJCPFGerencieCarteira: SetUsuInclusaoCNPJCPFGerencieCarteira(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuExclusaoCNPJCPFGerencieCarteira: SetUsuExclusaoCNPJCPFGerencieCarteira(VariantToNullableBoolean(Value));
    Campo_OBUsuario_Pag_Id: SetPag_Id(VariantToNullableInteger(Value));
    Campo_OBUsuario_Sop_Id: SetSop_Id(VariantToNullableInteger(Value));
    Campo_OBUsuario_UsuAlteraSenhaProximoAcesso: SetUsuAlteraSenhaProximoAcesso(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuVisualizaEventoCaucao: SetUsuVisualizaEventoCaucao(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoBaixa: SetUsuAutorizaEfetivacaoSolicitacaoBaixa(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartorio: SetUsuAutorizaEfetivacaoSolicitacaoCartorio(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoInsProtesto: SetUsuAutorizaEfetivacaoSolicitacaoInsProtesto(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoDesconto: SetUsuAutorizaEfetivacaoSolicitacaoDesconto(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoAbatimento: SetUsuAutorizaEfetivacaoSolicitacaoAbatimento(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoResgate: SetUsuAutorizaEfetivacaoSolicitacaoResgate(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia: SetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoCoaf: SetUsuAutorizaEfetivacaoCoaf(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuLiberaConsultaOrgaoCreditoForaPrazo: SetUsuLiberaConsultaOrgaoCreditoForaPrazo(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuQtdConsultasSerasaMes: SetUsuQtdConsultasSerasaMes(VariantToNullableInteger(Value));
    Campo_OBUsuario_UsuAgenteChecagem: SetUsuAgenteChecagem(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuGerenteChecagem: SetUsuGerenteChecagem(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAlteraChecagemLote: SetUsuAlteraChecagemLote(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuVeTodasOperacoesMonitor: SetUsuVeTodasOperacoesMonitor(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuRecebeEmailEtapaPoc: SetUsuRecebeEmailEtapaPoc(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuEmailAtribuicaoEtapaPoc: SetUsuEmailAtribuicaoEtapaPoc(VariantToNullableString(Value));
    Campo_OBUsuario_UsuAgenteCobranca: SetUsuAgenteCobranca(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuGerenteCobranca: SetUsuGerenteCobranca(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAutorizaEfetivacaoPocIndependenteEtapa: SetUsuAutorizaEfetivacaoPocIndependenteEtapa(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuGerentePoc: SetUsuGerentePoc(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAgentePoc: SetUsuAgentePoc(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuNomesObservacaoAnalise: SetUsuNomesObservacaoAnalise(VariantToNullableString(Value));
    Campo_OBUsuario_UsuAlteraParatroBloqueadoPefin: SetUsuAlteraParatroBloqueadoPefin(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuPermitePularEtapaPoc: SetUsuPermitePularEtapaPoc(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuAnalisePoc: SetUsuAnalisePoc(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuPocAlteraStatusFormalizacao: SetUsuPocAlteraStatusFormalizacao(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuLiberaCondicionanteOperacao: SetUsuLiberaCondicionanteOperacao(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuPocPermiteAnaliseUnica: SetUsuPocPermiteAnaliseUnica(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValor: SetUsuPocPermiteAnaliseUnicaValor(VariantToNullableCurrency(Value));
    Campo_OBUsuario_UsuDesativado: SetUsuDesativado(VariantToNullableBoolean(Value));
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorTranche: SetUsuPocPermiteAnaliseUnicaValorTranche(VariantToNullableCurrency(Value));
    Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorClean: SetUsuPocPermiteAnaliseUnicaValorClean(VariantToNullableCurrency(Value));
  else
    inherited;
  end;
end;

procedure TAROBUsuario.SetUsuLogin(const Value: string);
begin
  FUsuLogin := AjustaVarchar(Value, 10);
end;

procedure TAROBUsuario.SetGruCodigo(const Value: TNullableInteger);
begin
  FGruCodigo := Value;
end;

procedure TAROBUsuario.SetUsuNome(const Value: TNullableString);
begin
  FUsuNome := AjustaVarchar(Value, 60);
end;

procedure TAROBUsuario.SetUsuSenha(const Value: TNullableString);
begin
  FUsuSenha := AjustaVarchar(Value, 6);
end;

procedure TAROBUsuario.SetEmpCodigo(const Value: TNullableInteger);
begin
  FEmpCodigo := Value;
end;

procedure TAROBUsuario.SetUsuAutorizaOperacaoRestricao(const Value: TNullableBoolean);
begin
  FUsuAutorizaOperacaoRestricao := Value;
end;

procedure TAROBUsuario.SetAgeCodigo(const Value: TNullableInteger);
begin
  FAgeCodigo := Value;
end;

procedure TAROBUsuario.SetGalCodigo(const Value: TNullableInteger);
begin
  FGalCodigo := Value;
end;

procedure TAROBUsuario.SetUsuMaxValorLimiteCretioParaCedente(const Value: TNullableCurrency);
begin
  FUsuMaxValorLimiteCretioParaCedente := Value;
end;

procedure TAROBUsuario.SetUsuDataExpirar(const Value: TNullableDateTime);
begin
  FUsuDataExpirar := Value;
end;

procedure TAROBUsuario.SetUsuAutorizaEfetivacaoSolicitacaoVencimento(const Value: TNullableBoolean);
begin
  FUsuAutorizaEfetivacaoSolicitacaoVencimento := Value;
end;

procedure TAROBUsuario.SetUsuAutorizaEfetivacaoSolicitacaoProtesto(const Value: TNullableBoolean);
begin
  FUsuAutorizaEfetivacaoSolicitacaoProtesto := Value;
end;

procedure TAROBUsuario.SetUsuOperacaoAnalisadaNaoPodeSerEfetivada(const Value: TNullableBoolean);
begin
  FUsuOperacaoAnalisadaNaoPodeSerEfetivada := Value;
end;

procedure TAROBUsuario.SetUsuAutorizaTitulosAcordoAlcada(const Value: TNullableBoolean);
begin
  FUsuAutorizaTitulosAcordoAlcada := Value;
end;

procedure TAROBUsuario.SetUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao(const Value: TNullableCurrency);
begin
  FUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao := Value;
end;

procedure TAROBUsuario.SetUsuValorSuperiorLimiteAutorizar(const Value: TNullableCurrency);
begin
  FUsuValorSuperiorLimiteAutorizar := Value;
end;

procedure TAROBUsuario.SetUsuValorMaximoCadastramentoLimiteCreditoSacado(const Value: TNullableCurrency);
begin
  FUsuValorMaximoCadastramentoLimiteCreditoSacado := Value;
end;

procedure TAROBUsuario.SetUsuPossibilitaEfetivacaoBorderoRestricao(const Value: TNullableBoolean);
begin
  FUsuPossibilitaEfetivacaoBorderoRestricao := Value;
end;

procedure TAROBUsuario.SetUsuValorLimiteAdicionalOperacao(const Value: TNullableCurrency);
begin
  FUsuValorLimiteAdicionalOperacao := Value;
end;

procedure TAROBUsuario.SetUsuEmailSaldoContaVinculada(const Value: TNullableString);
begin
  FUsuEmailSaldoContaVinculada := AjustaVarchar(Value, 250);
end;

procedure TAROBUsuario.SetId_TipoObservacao(const Value: TNullableInteger);
begin
  FId_TipoObservacao := Value;
end;

procedure TAROBUsuario.SetUsuCodime(const Value: TNullableBoolean);
begin
  FUsuCodime := Value;
end;

procedure TAROBUsuario.SetUsuSemConsistencia(const Value: TNullableBoolean);
begin
  FUsuSemConsistencia := Value;
end;

procedure TAROBUsuario.SetUsuAlteraConfirmacaoTituloOperacao(const Value: TNullableBoolean);
begin
  FUsuAlteraConfirmacaoTituloOperacao := Value;
end;

procedure TAROBUsuario.SetUsuAlteraConfirmacaoIngresso(const Value: TNullableBoolean);
begin
  FUsuAlteraConfirmacaoIngresso := Value;
end;

procedure TAROBUsuario.SetUsuTipoAcesso(const Value: TNullableString);
begin
  FUsuTipoAcesso := AjustaVarchar(Value, 1);
end;

procedure TAROBUsuario.SetUsuInclusaoCNPJCPFGerencieCarteira(const Value: TNullableBoolean);
begin
  FUsuInclusaoCNPJCPFGerencieCarteira := Value;
end;

procedure TAROBUsuario.SetUsuExclusaoCNPJCPFGerencieCarteira(const Value: TNullableBoolean);
begin
  FUsuExclusaoCNPJCPFGerencieCarteira := Value;
end;

procedure TAROBUsuario.SetPag_Id(const Value: TNullableInteger);
begin
  FPag_Id := Value;
end;

procedure TAROBUsuario.SetSop_Id(const Value: TNullableInteger);
begin
  FSop_Id := Value;
end;

procedure TAROBUsuario.SetUsuAlteraSenhaProximoAcesso(const Value: TNullableBoolean);
begin
  FUsuAlteraSenhaProximoAcesso := Value;
end;

procedure TAROBUsuario.SetUsuVisualizaEventoCaucao(const Value: TNullableBoolean);
begin
  FUsuVisualizaEventoCaucao := Value;
end;

procedure TAROBUsuario.SetUsuAutorizaEfetivacaoSolicitacaoBaixa(const Value: TNullableBoolean);
begin
  FUsuAutorizaEfetivacaoSolicitacaoBaixa := Value;
end;

procedure TAROBUsuario.SetUsuAutorizaEfetivacaoSolicitacaoCartorio(const Value: TNullableBoolean);
begin
  FUsuAutorizaEfetivacaoSolicitacaoCartorio := Value;
end;

procedure TAROBUsuario.SetUsuAutorizaEfetivacaoSolicitacaoInsProtesto(const Value: TNullableBoolean);
begin
  FUsuAutorizaEfetivacaoSolicitacaoInsProtesto := Value;
end;

procedure TAROBUsuario.SetUsuAutorizaEfetivacaoSolicitacaoDesconto(const Value: TNullableBoolean);
begin
  FUsuAutorizaEfetivacaoSolicitacaoDesconto := Value;
end;

procedure TAROBUsuario.SetUsuAutorizaEfetivacaoSolicitacaoAbatimento(const Value: TNullableBoolean);
begin
  FUsuAutorizaEfetivacaoSolicitacaoAbatimento := Value;
end;

procedure TAROBUsuario.SetUsuAutorizaEfetivacaoSolicitacaoResgate(const Value: TNullableBoolean);
begin
  FUsuAutorizaEfetivacaoSolicitacaoResgate := Value;
end;

procedure TAROBUsuario.SetUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia(const Value: TNullableBoolean);
begin
  FUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia := Value;
end;

procedure TAROBUsuario.SetUsuAutorizaEfetivacaoCoaf(const Value: TNullableBoolean);
begin
  FUsuAutorizaEfetivacaoCoaf := Value;
end;

procedure TAROBUsuario.SetUsuLiberaConsultaOrgaoCreditoForaPrazo(const Value: TNullableBoolean);
begin
  FUsuLiberaConsultaOrgaoCreditoForaPrazo := Value;
end;

procedure TAROBUsuario.SetUsuQtdConsultasSerasaMes(const Value: TNullableInteger);
begin
  FUsuQtdConsultasSerasaMes := Value;
end;

procedure TAROBUsuario.SetUsuAgenteChecagem(const Value: TNullableBoolean);
begin
  FUsuAgenteChecagem := Value;
end;

procedure TAROBUsuario.SetUsuGerenteChecagem(const Value: TNullableBoolean);
begin
  FUsuGerenteChecagem := Value;
end;

procedure TAROBUsuario.SetUsuAlteraChecagemLote(const Value: TNullableBoolean);
begin
  FUsuAlteraChecagemLote := Value;
end;

procedure TAROBUsuario.SetUsuVeTodasOperacoesMonitor(const Value: TNullableBoolean);
begin
  FUsuVeTodasOperacoesMonitor := Value;
end;

procedure TAROBUsuario.SetUsuRecebeEmailEtapaPoc(const Value: TNullableBoolean);
begin
  FUsuRecebeEmailEtapaPoc := Value;
end;

procedure TAROBUsuario.SetUsuEmailAtribuicaoEtapaPoc(const Value: TNullableString);
begin
  FUsuEmailAtribuicaoEtapaPoc := AjustaVarchar(Value, 2000);
end;

procedure TAROBUsuario.SetUsuAgenteCobranca(const Value: TNullableBoolean);
begin
  FUsuAgenteCobranca := Value;
end;

procedure TAROBUsuario.SetUsuGerenteCobranca(const Value: TNullableBoolean);
begin
  FUsuGerenteCobranca := Value;
end;

procedure TAROBUsuario.SetUsuAutorizaEfetivacaoPocIndependenteEtapa(const Value: TNullableBoolean);
begin
  FUsuAutorizaEfetivacaoPocIndependenteEtapa := Value;
end;

procedure TAROBUsuario.SetUsuGerentePoc(const Value: TNullableBoolean);
begin
  FUsuGerentePoc := Value;
end;

procedure TAROBUsuario.SetUsuAgentePoc(const Value: TNullableBoolean);
begin
  FUsuAgentePoc := Value;
end;

procedure TAROBUsuario.SetUsuNomesObservacaoAnalise(const Value: TNullableString);
begin
  FUsuNomesObservacaoAnalise := AjustaVarchar(Value, 1000);
end;

procedure TAROBUsuario.SetUsuAlteraParatroBloqueadoPefin(const Value: TNullableBoolean);
begin
  FUsuAlteraParatroBloqueadoPefin := Value;
end;

procedure TAROBUsuario.SetUsuPermitePularEtapaPoc(const Value: TNullableBoolean);
begin
  FUsuPermitePularEtapaPoc := Value;
end;

procedure TAROBUsuario.SetUsuAnalisePoc(const Value: TNullableBoolean);
begin
  FUsuAnalisePoc := Value;
end;

procedure TAROBUsuario.SetUsuPocAlteraStatusFormalizacao(const Value: TNullableBoolean);
begin
  FUsuPocAlteraStatusFormalizacao := Value;
end;

procedure TAROBUsuario.SetUsuLiberaCondicionanteOperacao(const Value: TNullableBoolean);
begin
  FUsuLiberaCondicionanteOperacao := Value;
end;

procedure TAROBUsuario.SetUsuPocPermiteAnaliseUnica(const Value: TNullableBoolean);
begin
  FUsuPocPermiteAnaliseUnica := Value;
end;

procedure TAROBUsuario.SetUsuPocPermiteAnaliseUnicaValor(const Value: TNullableCurrency);
begin
  FUsuPocPermiteAnaliseUnicaValor := Value;
end;

procedure TAROBUsuario.SetUsuDesativado(const Value: TNullableBoolean);
begin
  FUsuDesativado := Value;
end;

procedure TAROBUsuario.SetUsuPocPermiteAnaliseUnicaValorTranche(const Value: TNullableCurrency);
begin
  FUsuPocPermiteAnaliseUnicaValorTranche := Value;
end;

procedure TAROBUsuario.SetUsuPocPermiteAnaliseUnicaValorClean(const Value: TNullableCurrency);
begin
  FUsuPocPermiteAnaliseUnicaValorClean := Value;
end;

class function TAROBUsuario.Metadata: IActiveRecordMetadata;
begin
  Result := TAROBUsuarioMetadataObject.Create;
end;

procedure TAROBUsuario.Persist;
begin
  PersistSQL;
end;

procedure TAROBUsuario.PersistSQL;
begin
  if GetDeleted then
  begin
    GAROBUsuarioDeleteCriticalSection.Acquire;
    try
      TAROBUsuarioDelete.Create.Persist(Self);
    finally
      GAROBUsuarioDeleteCriticalSection.Release;
    end;
  end
  else
  begin
    if GetNovo then
    begin
      GAROBUsuarioInsertCriticalSection.Acquire;
      try
        TAROBUsuarioInsert.Create.Persist(Self);
      finally
        GAROBUsuarioInsertCriticalSection.Release;
      end;
    end
    else
    begin
      GAROBUsuarioUpdateCriticalSection.Acquire;
      try
        TAROBUsuarioUpdate.Create.Persist(Self);
      finally
        GAROBUsuarioUpdateCriticalSection.Release;
      end;
    end;
  end;
end;

procedure TAROBUsuario.SetRecordSet(const ARecordSet: _RecordSet; AOffset: Integer);
begin
  FPrimaryKeyUsuLogin := ARecordSet.Fields[Campo_OBUsuario_UsuLogin + AOffset].Value;
  FUsuLogin := ARecordSet.Fields[Campo_OBUsuario_UsuLogin + AOffset].Value;
  FGruCodigo := VariantToNullableInteger(ARecordSet.Fields[Campo_OBUsuario_GruCodigo + AOffset].Value);
  FUsuNome := VariantToNullableString(ARecordSet.Fields[Campo_OBUsuario_UsuNome + AOffset].Value);
  FUsuSenha := VariantToNullableString(ARecordSet.Fields[Campo_OBUsuario_UsuSenha + AOffset].Value);
  FEmpCodigo := VariantToNullableInteger(ARecordSet.Fields[Campo_OBUsuario_EmpCodigo + AOffset].Value);
  FUsuAutorizaOperacaoRestricao := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAutorizaOperacaoRestricao + AOffset].Value);
  FAgeCodigo := VariantToNullableInteger(ARecordSet.Fields[Campo_OBUsuario_AgeCodigo + AOffset].Value);
  FGalCodigo := VariantToNullableInteger(ARecordSet.Fields[Campo_OBUsuario_GalCodigo + AOffset].Value);
  FUsuMaxValorLimiteCretioParaCedente := VariantToNullableCurrency(ARecordSet.Fields[Campo_OBUsuario_UsuMaxValorLimiteCretioParaCedente + AOffset].Value);
  FUsuDataExpirar := VariantToNullableDateTime(ARecordSet.Fields[Campo_OBUsuario_UsuDataExpirar + AOffset].Value);
  FUsuAutorizaEfetivacaoSolicitacaoVencimento := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoVencimento + AOffset].Value);
  FUsuAutorizaEfetivacaoSolicitacaoProtesto := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoProtesto + AOffset].Value);
  FUsuOperacaoAnalisadaNaoPodeSerEfetivada := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuOperacaoAnalisadaNaoPodeSerEfetivada + AOffset].Value);
  FUsuAutorizaTitulosAcordoAlcada := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAutorizaTitulosAcordoAlcada + AOffset].Value);
  FUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao := VariantToNullableCurrency(ARecordSet.Fields[Campo_OBUsuario_UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao + AOffset].Value);
  FUsuValorSuperiorLimiteAutorizar := VariantToNullableCurrency(ARecordSet.Fields[Campo_OBUsuario_UsuValorSuperiorLimiteAutorizar + AOffset].Value);
  FUsuValorMaximoCadastramentoLimiteCreditoSacado := VariantToNullableCurrency(ARecordSet.Fields[Campo_OBUsuario_UsuValorMaximoCadastramentoLimiteCreditoSacado + AOffset].Value);
  FUsuPossibilitaEfetivacaoBorderoRestricao := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuPossibilitaEfetivacaoBorderoRestricao + AOffset].Value);
  FUsuValorLimiteAdicionalOperacao := VariantToNullableCurrency(ARecordSet.Fields[Campo_OBUsuario_UsuValorLimiteAdicionalOperacao + AOffset].Value);
  FUsuEmailSaldoContaVinculada := VariantToNullableString(ARecordSet.Fields[Campo_OBUsuario_UsuEmailSaldoContaVinculada + AOffset].Value);
  FId_TipoObservacao := VariantToNullableInteger(ARecordSet.Fields[Campo_OBUsuario_Id_TipoObservacao + AOffset].Value);
  FUsuCodime := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuCodime + AOffset].Value);
  FUsuSemConsistencia := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuSemConsistencia + AOffset].Value);
  FUsuAlteraConfirmacaoTituloOperacao := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAlteraConfirmacaoTituloOperacao + AOffset].Value);
  FUsuAlteraConfirmacaoIngresso := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAlteraConfirmacaoIngresso + AOffset].Value);
  FUsuTipoAcesso := VariantToNullableString(ARecordSet.Fields[Campo_OBUsuario_UsuTipoAcesso + AOffset].Value);
  FUsuInclusaoCNPJCPFGerencieCarteira := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuInclusaoCNPJCPFGerencieCarteira + AOffset].Value);
  FUsuExclusaoCNPJCPFGerencieCarteira := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuExclusaoCNPJCPFGerencieCarteira + AOffset].Value);
  FPag_Id := VariantToNullableInteger(ARecordSet.Fields[Campo_OBUsuario_Pag_Id + AOffset].Value);
  FSop_Id := VariantToNullableInteger(ARecordSet.Fields[Campo_OBUsuario_Sop_Id + AOffset].Value);
  FUsuAlteraSenhaProximoAcesso := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAlteraSenhaProximoAcesso + AOffset].Value);
  FUsuVisualizaEventoCaucao := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuVisualizaEventoCaucao + AOffset].Value);
  FUsuAutorizaEfetivacaoSolicitacaoBaixa := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoBaixa + AOffset].Value);
  FUsuAutorizaEfetivacaoSolicitacaoCartorio := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartorio + AOffset].Value);
  FUsuAutorizaEfetivacaoSolicitacaoInsProtesto := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoInsProtesto + AOffset].Value);
  FUsuAutorizaEfetivacaoSolicitacaoDesconto := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoDesconto + AOffset].Value);
  FUsuAutorizaEfetivacaoSolicitacaoAbatimento := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoAbatimento + AOffset].Value);
  FUsuAutorizaEfetivacaoSolicitacaoResgate := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoResgate + AOffset].Value);
  FUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia + AOffset].Value);
  FUsuAutorizaEfetivacaoCoaf := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAutorizaEfetivacaoCoaf + AOffset].Value);
  FUsuLiberaConsultaOrgaoCreditoForaPrazo := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuLiberaConsultaOrgaoCreditoForaPrazo + AOffset].Value);
  FUsuQtdConsultasSerasaMes := VariantToNullableInteger(ARecordSet.Fields[Campo_OBUsuario_UsuQtdConsultasSerasaMes + AOffset].Value);
  FUsuAgenteChecagem := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAgenteChecagem + AOffset].Value);
  FUsuGerenteChecagem := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuGerenteChecagem + AOffset].Value);
  FUsuAlteraChecagemLote := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAlteraChecagemLote + AOffset].Value);
  FUsuVeTodasOperacoesMonitor := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuVeTodasOperacoesMonitor + AOffset].Value);
  FUsuRecebeEmailEtapaPoc := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuRecebeEmailEtapaPoc + AOffset].Value);
  FUsuEmailAtribuicaoEtapaPoc := VariantToNullableString(ARecordSet.Fields[Campo_OBUsuario_UsuEmailAtribuicaoEtapaPoc + AOffset].Value);
  FUsuAgenteCobranca := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAgenteCobranca + AOffset].Value);
  FUsuGerenteCobranca := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuGerenteCobranca + AOffset].Value);
  FUsuAutorizaEfetivacaoPocIndependenteEtapa := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAutorizaEfetivacaoPocIndependenteEtapa + AOffset].Value);
  FUsuGerentePoc := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuGerentePoc + AOffset].Value);
  FUsuAgentePoc := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAgentePoc + AOffset].Value);
  FUsuNomesObservacaoAnalise := VariantToNullableString(ARecordSet.Fields[Campo_OBUsuario_UsuNomesObservacaoAnalise + AOffset].Value);
  FUsuAlteraParatroBloqueadoPefin := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAlteraParatroBloqueadoPefin + AOffset].Value);
  FUsuPermitePularEtapaPoc := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuPermitePularEtapaPoc + AOffset].Value);
  FUsuAnalisePoc := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuAnalisePoc + AOffset].Value);
  FUsuPocAlteraStatusFormalizacao := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuPocAlteraStatusFormalizacao + AOffset].Value);
  FUsuLiberaCondicionanteOperacao := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuLiberaCondicionanteOperacao + AOffset].Value);
  FUsuPocPermiteAnaliseUnica := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuPocPermiteAnaliseUnica + AOffset].Value);
  FUsuPocPermiteAnaliseUnicaValor := VariantToNullableCurrency(ARecordSet.Fields[Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValor + AOffset].Value);
  FUsuDesativado := VariantToNullableB01(ARecordSet.Fields[Campo_OBUsuario_UsuDesativado + AOffset].Value);
  FUsuPocPermiteAnaliseUnicaValorTranche := VariantToNullableCurrency(ARecordSet.Fields[Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorTranche + AOffset].Value);
  FUsuPocPermiteAnaliseUnicaValorClean := VariantToNullableCurrency(ARecordSet.Fields[Campo_OBUsuario_UsuPocPermiteAnaliseUnicaValorClean + AOffset].Value);
end;

class function TAROBUsuario.ViewMetadata: IActiveRecordMetadata;
begin
  Result := Metadata;
end;

{ TAROBUsuarioDelete }

procedure TAROBUsuarioDelete.DefineParameters;
begin
  Command.Parameters.Append(Command.CreateParameter('UsuLogin', adVarChar, adParamInput, 10, Null));
end;

function TAROBUsuarioDelete.GetCommandSQL: string;
begin
  Result :=
    'delete from obusuario'#13#10 +
    'where'#13#10 +
    '  usulogin = ?';
end;

procedure TAROBUsuarioDelete.Persist(AAROBUsuario: TAROBUsuario);
begin
  inherited Persist(AAROBUsuario);
  //Chaves
  Command.Parameters[0].Value := AAROBUsuario.FUsuLogin;
  if Execute <> 1 then
    raise EActiveRecord.Create('Delete Failed TAROBUsuarioDelete');
end;

{ TAROBUsuarioInsert }

procedure TAROBUsuarioInsert.DefineParameters;
begin
  Command.Parameters.Append(Command.CreateParameter('UsuLogin', adVarChar, adParamInput, 10, Null));
  Command.Parameters.Append(Command.CreateParameter('GruCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuNome', adVarChar, adParamInput, 60, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuSenha', adVarChar, adParamInput, 6, Null));
  Command.Parameters.Append(Command.CreateParameter('EmpCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaOperacaoRestricao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('AgeCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('GalCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuMaxValorLimiteCretioParaCedente', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuDataExpirar', adDBTimeStamp, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoVencimento', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoProtesto', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuOperacaoAnalisadaNaoPodeSerEfetivada', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaTitulosAcordoAlcada', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuValorSuperiorLimiteAutorizar', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuValorMaximoCadastramentoLimiteCreditoSacado', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuPossibilitaEfetivacaoBorderoRestricao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuValorLimiteAdicionalOperacao', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuEmailSaldoContaVinculada', adVarChar, adParamInput, 250, Null));
  Command.Parameters.Append(Command.CreateParameter('Id_TipoObservacao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuCodime', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuSemConsistencia', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAlteraConfirmacaoTituloOperacao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAlteraConfirmacaoIngresso', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuTipoAcesso', adVarChar, adParamInput, 1, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuInclusaoCNPJCPFGerencieCarteira', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuExclusaoCNPJCPFGerencieCarteira', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('Pag_Id', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('Sop_Id', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAlteraSenhaProximoAcesso', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuVisualizaEventoCaucao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoBaixa', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoCartorio', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoInsProtesto', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoDesconto', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoAbatimento', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoResgate', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoCoaf', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLiberaConsultaOrgaoCreditoForaPrazo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuQtdConsultasSerasaMes', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAgenteChecagem', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuGerenteChecagem', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAlteraChecagemLote', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuVeTodasOperacoesMonitor', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuRecebeEmailEtapaPoc', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuEmailAtribuicaoEtapaPoc', adVarChar, adParamInput, 2000, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAgenteCobranca', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuGerenteCobranca', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoPocIndependenteEtapa', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuGerentePoc', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAgentePoc', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuNomesObservacaoAnalise', adVarChar, adParamInput, 1000, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAlteraParatroBloqueadoPefin', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuPermitePularEtapaPoc', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAnalisePoc', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuPocAlteraStatusFormalizacao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLiberaCondicionanteOperacao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuPocPermiteAnaliseUnica', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuPocPermiteAnaliseUnicaValor', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuDesativado', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuPocPermiteAnaliseUnicaValorTranche', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuPocPermiteAnaliseUnicaValorClean', adCurrency, adParamInput, 0, Null));
end;

function TAROBUsuarioInsert.GetCommandSQL: string;
begin
  Result :=
    'insert into obusuario ('#13#10 +
    '  usulogin, grucodigo, usunome, ususenha, empcodigo,'#13#10 +
    '  usuautorizaoperacaorestricao, agecodigo, galcodigo, usumaxvalorlimitecretioparacedente, usudataexpirar,'#13#10 +
    '  usuautorizaefetivacaosolicitacaovencimento, usuautorizaefetivacaosolicitacaoprotesto, usuoperacaoanalisadanaopodeserefetivada, usuautorizatitulosacordoalcada, ususaldodevedormaximosacadoautorizacaooperacao,'#13#10 +
    '  usuvalorsuperiorlimiteautorizar, usuvalormaximocadastramentolimitecreditosacado, usupossibilitaefetivacaoborderorestricao, usuvalorlimiteadicionaloperacao, usuemailsaldocontavinculada,'#13#10 +
    '  id_tipoobservacao, usucodime, ususemconsistencia, usualteraconfirmacaotitulooperacao, usualteraconfirmacaoingresso,'#13#10 +
    '  usutipoacesso, usuinclusaocnpjcpfgerenciecarteira, usuexclusaocnpjcpfgerenciecarteira, pag_id, sop_id,'#13#10 +
    '  usualterasenhaproximoacesso, usuvisualizaeventocaucao, usuautorizaefetivacaosolicitacaobaixa, usuautorizaefetivacaosolicitacaocartorio, usuautorizaefetivacaosolicitacaoinsprotesto,'#13#10 +
    '  usuautorizaefetivacaosolicitacaodesconto, usuautorizaefetivacaosolicitacaoabatimento, usuautorizaefetivacaosolicitacaoresgate, usuautorizaefetivacaosolicitacaocartaanuencia, usuautorizaefetivacaocoaf,'#13#10 +
    '  usuliberaconsultaorgaocreditoforaprazo, usuqtdconsultasserasames, usuagentechecagem, usugerentechecagem, usualterachecagemlote,'#13#10 +
    '  usuvetodasoperacoesmonitor, usurecebeemailetapapoc, usuemailatribuicaoetapapoc, usuagentecobranca, usugerentecobranca,'#13#10 +
    '  usuautorizaefetivacaopocindependenteetapa, usugerentepoc, usuagentepoc, usunomesobservacaoanalise, usualteraparatrobloqueadopefin,'#13#10 +
    '  usupermitepularetapapoc, usuanalisepoc, usupocalterastatusformalizacao, usuliberacondicionanteoperacao, usupocpermiteanaliseunica,'#13#10 +
    '  usupocpermiteanaliseunicavalor, usudesativado, usupocpermiteanaliseunicavalortranche, usupocpermiteanaliseunicavalorclean'#13#10 +
    ') values ('#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?'#13#10 +
    ')';
end;

procedure TAROBUsuarioInsert.Persist(AAROBUsuario: TAROBUsuario);
begin
  inherited Persist(AAROBUsuario);
  Command.Parameters[0].Value := AAROBUsuario.FUsuLogin;
  Command.Parameters[1].Value := TActiveRecord.ToVariant(AAROBUsuario.FGruCodigo);
  Command.Parameters[2].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuNome);
  Command.Parameters[3].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuSenha);
  Command.Parameters[4].Value := TActiveRecord.ToVariant(AAROBUsuario.FEmpCodigo);
  Command.Parameters[5].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaOperacaoRestricao);
  Command.Parameters[6].Value := TActiveRecord.ToVariant(AAROBUsuario.FAgeCodigo);
  Command.Parameters[7].Value := TActiveRecord.ToVariant(AAROBUsuario.FGalCodigo);
  Command.Parameters[8].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuMaxValorLimiteCretioParaCedente);
  Command.Parameters[9].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuDataExpirar);
  Command.Parameters[10].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoVencimento);
  Command.Parameters[11].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoProtesto);
  Command.Parameters[12].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuOperacaoAnalisadaNaoPodeSerEfetivada);
  Command.Parameters[13].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaTitulosAcordoAlcada);
  Command.Parameters[14].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao);
  Command.Parameters[15].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuValorSuperiorLimiteAutorizar);
  Command.Parameters[16].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuValorMaximoCadastramentoLimiteCreditoSacado);
  Command.Parameters[17].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuPossibilitaEfetivacaoBorderoRestricao);
  Command.Parameters[18].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuValorLimiteAdicionalOperacao);
  Command.Parameters[19].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuEmailSaldoContaVinculada);
  Command.Parameters[20].Value := TActiveRecord.ToVariant(AAROBUsuario.FId_TipoObservacao);
  Command.Parameters[21].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuCodime);
  Command.Parameters[22].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuSemConsistencia);
  Command.Parameters[23].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAlteraConfirmacaoTituloOperacao);
  Command.Parameters[24].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAlteraConfirmacaoIngresso);
  Command.Parameters[25].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuTipoAcesso);
  Command.Parameters[26].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuInclusaoCNPJCPFGerencieCarteira);
  Command.Parameters[27].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuExclusaoCNPJCPFGerencieCarteira);
  Command.Parameters[28].Value := TActiveRecord.ToVariant(AAROBUsuario.FPag_Id);
  Command.Parameters[29].Value := TActiveRecord.ToVariant(AAROBUsuario.FSop_Id);
  Command.Parameters[30].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAlteraSenhaProximoAcesso);
  Command.Parameters[31].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuVisualizaEventoCaucao);
  Command.Parameters[32].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoBaixa);
  Command.Parameters[33].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoCartorio);
  Command.Parameters[34].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoInsProtesto);
  Command.Parameters[35].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoDesconto);
  Command.Parameters[36].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoAbatimento);
  Command.Parameters[37].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoResgate);
  Command.Parameters[38].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia);
  Command.Parameters[39].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoCoaf);
  Command.Parameters[40].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuLiberaConsultaOrgaoCreditoForaPrazo);
  Command.Parameters[41].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuQtdConsultasSerasaMes);
  Command.Parameters[42].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAgenteChecagem);
  Command.Parameters[43].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuGerenteChecagem);
  Command.Parameters[44].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAlteraChecagemLote);
  Command.Parameters[45].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuVeTodasOperacoesMonitor);
  Command.Parameters[46].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuRecebeEmailEtapaPoc);
  Command.Parameters[47].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuEmailAtribuicaoEtapaPoc);
  Command.Parameters[48].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAgenteCobranca);
  Command.Parameters[49].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuGerenteCobranca);
  Command.Parameters[50].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoPocIndependenteEtapa);
  Command.Parameters[51].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuGerentePoc);
  Command.Parameters[52].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAgentePoc);
  Command.Parameters[53].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuNomesObservacaoAnalise);
  Command.Parameters[54].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAlteraParatroBloqueadoPefin);
  Command.Parameters[55].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuPermitePularEtapaPoc);
  Command.Parameters[56].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAnalisePoc);
  Command.Parameters[57].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuPocAlteraStatusFormalizacao);
  Command.Parameters[58].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuLiberaCondicionanteOperacao);
  Command.Parameters[59].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuPocPermiteAnaliseUnica);
  Command.Parameters[60].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuPocPermiteAnaliseUnicaValor);
  Command.Parameters[61].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuDesativado);
  Command.Parameters[62].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuPocPermiteAnaliseUnicaValorTranche);
  Command.Parameters[63].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuPocPermiteAnaliseUnicaValorClean);
  Execute;
  //Atribuições das Chaves após o insert
  AAROBUsuario.FPrimaryKeyUsuLogin := AAROBUsuario.FUsuLogin;
end;

{ TAROBUsuarioUpdate }

procedure TAROBUsuarioUpdate.DefineParameters;
begin
  Command.Parameters.Append(Command.CreateParameter('UsuLogin', adVarChar, adParamInput, 10, Null));
  Command.Parameters.Append(Command.CreateParameter('GruCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuNome', adVarChar, adParamInput, 60, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuSenha', adVarChar, adParamInput, 6, Null));
  Command.Parameters.Append(Command.CreateParameter('EmpCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaOperacaoRestricao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('AgeCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('GalCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuMaxValorLimiteCretioParaCedente', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuDataExpirar', adDBTimeStamp, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoVencimento', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoProtesto', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuOperacaoAnalisadaNaoPodeSerEfetivada', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaTitulosAcordoAlcada', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuValorSuperiorLimiteAutorizar', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuValorMaximoCadastramentoLimiteCreditoSacado', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuPossibilitaEfetivacaoBorderoRestricao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuValorLimiteAdicionalOperacao', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuEmailSaldoContaVinculada', adVarChar, adParamInput, 250, Null));
  Command.Parameters.Append(Command.CreateParameter('Id_TipoObservacao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuCodime', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuSemConsistencia', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAlteraConfirmacaoTituloOperacao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAlteraConfirmacaoIngresso', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuTipoAcesso', adVarChar, adParamInput, 1, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuInclusaoCNPJCPFGerencieCarteira', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuExclusaoCNPJCPFGerencieCarteira', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('Pag_Id', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('Sop_Id', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAlteraSenhaProximoAcesso', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuVisualizaEventoCaucao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoBaixa', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoCartorio', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoInsProtesto', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoDesconto', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoAbatimento', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoResgate', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoCoaf', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLiberaConsultaOrgaoCreditoForaPrazo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuQtdConsultasSerasaMes', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAgenteChecagem', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuGerenteChecagem', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAlteraChecagemLote', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuVeTodasOperacoesMonitor', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuRecebeEmailEtapaPoc', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuEmailAtribuicaoEtapaPoc', adVarChar, adParamInput, 2000, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAgenteCobranca', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuGerenteCobranca', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAutorizaEfetivacaoPocIndependenteEtapa', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuGerentePoc', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAgentePoc', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuNomesObservacaoAnalise', adVarChar, adParamInput, 1000, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAlteraParatroBloqueadoPefin', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuPermitePularEtapaPoc', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAnalisePoc', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuPocAlteraStatusFormalizacao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLiberaCondicionanteOperacao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuPocPermiteAnaliseUnica', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuPocPermiteAnaliseUnicaValor', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuDesativado', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuPocPermiteAnaliseUnicaValorTranche', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuPocPermiteAnaliseUnicaValorClean', adCurrency, adParamInput, 0, Null));
  //Chaves
  Command.Parameters.Append(Command.CreateParameter('PrimaryKeyUsuLogin', adVarChar, adParamInput, 10, Null));
end;

function TAROBUsuarioUpdate.GetCommandSQL: string;
begin
  Result :=
    'update obusuario set'#13#10 +
    '  usulogin = ?, grucodigo = ?, usunome = ?,'#13#10 +
    '  ususenha = ?, empcodigo = ?, usuautorizaoperacaorestricao = ?,'#13#10 +
    '  agecodigo = ?, galcodigo = ?, usumaxvalorlimitecretioparacedente = ?,'#13#10 +
    '  usudataexpirar = ?, usuautorizaefetivacaosolicitacaovencimento = ?, usuautorizaefetivacaosolicitacaoprotesto = ?,'#13#10 +
    '  usuoperacaoanalisadanaopodeserefetivada = ?, usuautorizatitulosacordoalcada = ?, ususaldodevedormaximosacadoautorizacaooperacao = ?,'#13#10 +
    '  usuvalorsuperiorlimiteautorizar = ?, usuvalormaximocadastramentolimitecreditosacado = ?, usupossibilitaefetivacaoborderorestricao = ?,'#13#10 +
    '  usuvalorlimiteadicionaloperacao = ?, usuemailsaldocontavinculada = ?, id_tipoobservacao = ?,'#13#10 +
    '  usucodime = ?, ususemconsistencia = ?, usualteraconfirmacaotitulooperacao = ?,'#13#10 +
    '  usualteraconfirmacaoingresso = ?, usutipoacesso = ?, usuinclusaocnpjcpfgerenciecarteira = ?,'#13#10 +
    '  usuexclusaocnpjcpfgerenciecarteira = ?, pag_id = ?, sop_id = ?,'#13#10 +
    '  usualterasenhaproximoacesso = ?, usuvisualizaeventocaucao = ?, usuautorizaefetivacaosolicitacaobaixa = ?,'#13#10 +
    '  usuautorizaefetivacaosolicitacaocartorio = ?, usuautorizaefetivacaosolicitacaoinsprotesto = ?, usuautorizaefetivacaosolicitacaodesconto = ?,'#13#10 +
    '  usuautorizaefetivacaosolicitacaoabatimento = ?, usuautorizaefetivacaosolicitacaoresgate = ?, usuautorizaefetivacaosolicitacaocartaanuencia = ?,'#13#10 +
    '  usuautorizaefetivacaocoaf = ?, usuliberaconsultaorgaocreditoforaprazo = ?, usuqtdconsultasserasames = ?,'#13#10 +
    '  usuagentechecagem = ?, usugerentechecagem = ?, usualterachecagemlote = ?,'#13#10 +
    '  usuvetodasoperacoesmonitor = ?, usurecebeemailetapapoc = ?, usuemailatribuicaoetapapoc = ?,'#13#10 +
    '  usuagentecobranca = ?, usugerentecobranca = ?, usuautorizaefetivacaopocindependenteetapa = ?,'#13#10 +
    '  usugerentepoc = ?, usuagentepoc = ?, usunomesobservacaoanalise = ?,'#13#10 +
    '  usualteraparatrobloqueadopefin = ?, usupermitepularetapapoc = ?, usuanalisepoc = ?,'#13#10 +
    '  usupocalterastatusformalizacao = ?, usuliberacondicionanteoperacao = ?, usupocpermiteanaliseunica = ?,'#13#10 +
    '  usupocpermiteanaliseunicavalor = ?, usudesativado = ?, usupocpermiteanaliseunicavalortranche = ?,'#13#10 +
    '  usupocpermiteanaliseunicavalorclean = ?'#13#10 +
    'where'#13#10 +
    '  usulogin = ?';
end;

procedure TAROBUsuarioUpdate.Persist(AAROBUsuario: TAROBUsuario);
begin
  inherited Persist(AAROBUsuario);
  Command.Parameters[0].Value := AAROBUsuario.FUsuLogin;
  Command.Parameters[1].Value := TActiveRecord.ToVariant(AAROBUsuario.FGruCodigo);
  Command.Parameters[2].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuNome);
  Command.Parameters[3].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuSenha);
  Command.Parameters[4].Value := TActiveRecord.ToVariant(AAROBUsuario.FEmpCodigo);
  Command.Parameters[5].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaOperacaoRestricao);
  Command.Parameters[6].Value := TActiveRecord.ToVariant(AAROBUsuario.FAgeCodigo);
  Command.Parameters[7].Value := TActiveRecord.ToVariant(AAROBUsuario.FGalCodigo);
  Command.Parameters[8].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuMaxValorLimiteCretioParaCedente);
  Command.Parameters[9].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuDataExpirar);
  Command.Parameters[10].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoVencimento);
  Command.Parameters[11].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoProtesto);
  Command.Parameters[12].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuOperacaoAnalisadaNaoPodeSerEfetivada);
  Command.Parameters[13].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaTitulosAcordoAlcada);
  Command.Parameters[14].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuSaldoDevedorMaximoSacadoAutorizacaoOperacao);
  Command.Parameters[15].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuValorSuperiorLimiteAutorizar);
  Command.Parameters[16].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuValorMaximoCadastramentoLimiteCreditoSacado);
  Command.Parameters[17].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuPossibilitaEfetivacaoBorderoRestricao);
  Command.Parameters[18].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuValorLimiteAdicionalOperacao);
  Command.Parameters[19].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuEmailSaldoContaVinculada);
  Command.Parameters[20].Value := TActiveRecord.ToVariant(AAROBUsuario.FId_TipoObservacao);
  Command.Parameters[21].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuCodime);
  Command.Parameters[22].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuSemConsistencia);
  Command.Parameters[23].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAlteraConfirmacaoTituloOperacao);
  Command.Parameters[24].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAlteraConfirmacaoIngresso);
  Command.Parameters[25].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuTipoAcesso);
  Command.Parameters[26].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuInclusaoCNPJCPFGerencieCarteira);
  Command.Parameters[27].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuExclusaoCNPJCPFGerencieCarteira);
  Command.Parameters[28].Value := TActiveRecord.ToVariant(AAROBUsuario.FPag_Id);
  Command.Parameters[29].Value := TActiveRecord.ToVariant(AAROBUsuario.FSop_Id);
  Command.Parameters[30].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAlteraSenhaProximoAcesso);
  Command.Parameters[31].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuVisualizaEventoCaucao);
  Command.Parameters[32].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoBaixa);
  Command.Parameters[33].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoCartorio);
  Command.Parameters[34].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoInsProtesto);
  Command.Parameters[35].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoDesconto);
  Command.Parameters[36].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoAbatimento);
  Command.Parameters[37].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoResgate);
  Command.Parameters[38].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoSolicitacaoCartaAnuencia);
  Command.Parameters[39].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoCoaf);
  Command.Parameters[40].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuLiberaConsultaOrgaoCreditoForaPrazo);
  Command.Parameters[41].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuQtdConsultasSerasaMes);
  Command.Parameters[42].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAgenteChecagem);
  Command.Parameters[43].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuGerenteChecagem);
  Command.Parameters[44].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAlteraChecagemLote);
  Command.Parameters[45].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuVeTodasOperacoesMonitor);
  Command.Parameters[46].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuRecebeEmailEtapaPoc);
  Command.Parameters[47].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuEmailAtribuicaoEtapaPoc);
  Command.Parameters[48].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAgenteCobranca);
  Command.Parameters[49].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuGerenteCobranca);
  Command.Parameters[50].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAutorizaEfetivacaoPocIndependenteEtapa);
  Command.Parameters[51].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuGerentePoc);
  Command.Parameters[52].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAgentePoc);
  Command.Parameters[53].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuNomesObservacaoAnalise);
  Command.Parameters[54].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAlteraParatroBloqueadoPefin);
  Command.Parameters[55].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuPermitePularEtapaPoc);
  Command.Parameters[56].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuAnalisePoc);
  Command.Parameters[57].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuPocAlteraStatusFormalizacao);
  Command.Parameters[58].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuLiberaCondicionanteOperacao);
  Command.Parameters[59].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuPocPermiteAnaliseUnica);
  Command.Parameters[60].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuPocPermiteAnaliseUnicaValor);
  Command.Parameters[61].Value := TActiveRecord.ToVariantB01(AAROBUsuario.FUsuDesativado);
  Command.Parameters[62].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuPocPermiteAnaliseUnicaValorTranche);
  Command.Parameters[63].Value := TActiveRecord.ToVariant(AAROBUsuario.FUsuPocPermiteAnaliseUnicaValorClean);
  //Chaves
  Command.Parameters[64].Value := AAROBUsuario.FPrimaryKeyUsuLogin;
  if Execute <> 1 then
    raise EActiveRecord.Create('Update Failed TAROBUsuarioUpdate');
end;

{ TAROBUsuarioMetadataObject }

function TAROBUsuarioMetadataObject.FieldCount: Integer;
begin
  Result := Length(AROBUsuarioMetadata.Fields);
end;

function TAROBUsuarioMetadataObject.FieldMetadata(Index: Integer): TFieldMetadata;
begin
  Result := AROBUsuarioMetadata.Fields[Index];
end;

function TAROBUsuarioMetadataObject.FieldMetadataByName(const AName: string): TFieldMetadata;
begin
  Result := FieldMetadata(IndexOfName(AName));
end;

function TAROBUsuarioMetadataObject.IndexOfName(const AName: string): Integer;
var
  laco: Integer;
begin
  Result := -1;
  for laco := 0 to High(AROBUsuarioMetadata.Fields) do
    if SameText(AROBUsuarioMetadata.Fields[laco].Name, AName) then
    begin
      Result := laco;
      Break;
    end;
end;

function TAROBUsuarioMetadataObject.RelationshipCount: Integer;
begin
  Result := 0;
end;

function TAROBUsuarioMetadataObject.RelationshipMetadata(Index: Integer): TRelationshipMetadata;
begin
  FillChar(Result, SizeOf(TRelationshipMetadata), #0);
end;

function TAROBUsuarioMetadataObject.TableMetadata: TTableMetadata;
begin
  Result := AROBUsuarioMetadata.Table;
end;

initialization

  GAROBUsuarioDeleteCriticalSection := TCriticalSection.Create;
  GAROBUsuarioInsertCriticalSection := TCriticalSection.Create;
  GAROBUsuarioUpdateCriticalSection := TCriticalSection.Create;

  GQueryFactoryByUsuLogin := TAROBUsuario.From
    .Top(1)
    .Where('usulogin = ?');

finalization

  GQueryFactoryByUsuLogin := nil;
  FreeAndNil(GAROBUsuarioDeleteCriticalSection);
  FreeAndNil(GAROBUsuarioInsertCriticalSection);
  FreeAndNil(GAROBUsuarioUpdateCriticalSection);

end.