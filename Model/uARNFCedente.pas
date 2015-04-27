{
  ***************************************************
  * Este código é gerado automaticamente, não edite *
  ***************************************************

  Template: ActiveRecord.pas_template
  Descrição: Cria classes e interfaces para acessar a tabela NFCedente
}
unit uARNFCedente;

interface

uses
  SysUtils, db, ADOInt, Graphics, ServiceLocator, SyncObjs, Variants, 
  uActiveRecord;

type
  //Tabela: NFCedente - Informações da pessoa como cedente
  IARNFCedente = interface(IActiveRecord)
    ['{45D87BCA-EE0B-4A55-ADB4-35E787FF3BF5}']
    function GetID: Integer;
    function GetCedCodigo: Integer;
    function GetPesCNPJCPF: string;
    function GetIDGCodigo: TNullableString;
    function GetCedContratoNumero: TNullableInteger;
    function GetCedContratoData: TNullableDateTime;
    function GetCedFomentoSaldoDevedor: TNullableCurrency;
    function GetEmpCodigo: Integer;
    function GetCedObservacao: TNullableString;
    function GetFilFiltro: TNullableString;
    function GetCedSimples: TNullableBoolean;
    function GetHisCodigo: TNullableInteger;
    function GetCedRubricaOperacaoAtivo: TNullableString;
    function GetCedRubricaOperacaoCobranca: TNullableString;
    function GetCedRubricaOperacaoCaucao: TNullableString;
    function GetCedRubricaPassivo: TNullableString;
    function GetCedRubricaDespesa: TNullableString;
    function GetCedAbaterIRRF: TNullableBoolean;
    function GetCedIRRFAcumulado: TNullableCurrency;
    function GetCedAbaterRetidos: TNullableBoolean;
    function GetAgeCodigo: TNullableInteger;
    function GetCedMsgDocControle: TNullableString;
    function GetCedValorLimiteCreditoCheque: TNullableCurrency;
    function GetCedValorLimiteCreditoDuplicata: TNullableCurrency;
    function GetCedValorLimiteCreditoSacadoCheque: TNullableCurrency;
    function GetCedValorLimiteCreditoSacadoDuplicata: TNullableCurrency;
    function GetCedSacadorPadrao: TNullableString;
    function GetCCCCodigo: TNullableInteger;
    function GetCedTotalPendencias: TNullableCurrency;
    function GetCedInstrucaoCobranca: TNullableString;
    function GetCedEmiteBoleto: TNullableBoolean;
    function GetCedDataConnstEmpresa: TNullableDateTime;
    function GetCedValorDoc: TNullableCurrency;
    function GetCedValorTed: TNullableCurrency;
    function GetCedIncentIssqn: TNullableBoolean;
    function GetCedNaoCobraCpmf: TNullableBoolean;
    function GetCedGerarTarifaAuto: TNullableBoolean;
    function GetSCoCodigo: TNullableInteger;
    function GetCedprazoAtrasoPonderado: TNullableExtended;
    function GetCedRubricaContaGrafica: TNullableString;
    function GetCGLHisCodigo: TNullableInteger;
    function GetCedEmailEnvioDocumento: TNullableString;
    function GetCedContadorNome: TNullableString;
    function GetCedContadorCRC: TNullableString;
    function GetCedContadorCPF: TNullableString;
    function GetCedSacadorPadraoCNPJCPF: TNullableString;
    function GetCedEmailEnvioEfetivacao: TNullableString;
    function GetCedEnviarConsultaTitulosIntegracao: TNullableBoolean;
    function GetDesconsideraCedOuvidoria: TNullableBoolean;
    function GetCedContato: TNullableString;
    function GetCedPercComissao: TNullableExtended;
    function GetCedClassificacao: TNullableString;
    function GetCedDataInclusao: TNullableDateTime;
    function GetCedUsuarioInclusao: TNullableString;
    function GetCedCodime: TNullableBoolean;
    function GetCedLimiteControleSecuritizacaoValor: TNullableCurrency;
    function GetCedLimiteControleSecuritizacaoPeriodo: TNullableString;
    function GetCedRecompraTaxaMulta: TNullableExtended;
    function GetCedContabilidadeContaTransferencia: TNullableString;
    function GetUsuarioUltimaAlteracao: string;
    function GetAlteracaoViaCadastro: TNullableBoolean;
    function GetCedSerasaMonitoreValorSaldoDevedorGerenciamento: TNullableCurrency;
    function GetCedSerasaMonitorePrazo: TNullableInteger;
    function GetCedSerasaGru_ID: TNullableInteger;
    function GetCedSerasaPer_ID: TNullableInteger;
    function GetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ: TNullableCurrency;
    function GetCedSerasaMonitoreValorSaldoDevedorSacadoCPF: TNullableCurrency;
    function GetCedPercentualMulta: TNullableExtended;
    function GetCedConsideraInstrucaoSegundaVia: TNullableBoolean;
    function GetCedNaoProtetar: TNullableBoolean;
    function GetUsuLogin1: TNullableString;
    function GetUsuLogin2: TNullableString;
    function GetUsuLogin3: TNullableString;
    function GetUsuLogin4: TNullableString;
    function GetUsuLogin5: TNullableString;
    function GetUsuAgenteChecagem: TNullableString;
    function GetCedPriorizarPainelChecagem: TNullableBoolean;
    function GetConCodigo: TNullableInteger;
    function GetCedContabilidadeContaClientes: TNullableString;
    function GetCedContabilidadeContaFomento: TNullableString;
    function GetCedContabilidadeContaCtaGrafica: TNullableString;
    function GetCedContabilidadeContaConfissao: TNullableString;
    function GetIncluido: TNullableInteger;
    function GetCedNaoEnviaPefin: TNullableBoolean;
    function GetCedgru_id: TNullableInteger;
    function GetPOCCan: TNullableBoolean;
    function GetCnaeCodigo: TNullableString;
    function GetCedMensagemBoleto1: TNullableString;
    function GetCedMensagemBoleto2: TNullableString;
    function GetCedMensagemBoleto3: TNullableString;
    function GetCedMensagemBoleto4: TNullableString;
    function GetCedMensagemBoleto5: TNullableString;
    function GetCedEmiteBoletoComoCedenteBoleto: TNullableBoolean;
    procedure SetCedCodigo(const Value: Integer);
    procedure SetPesCNPJCPF(const Value: string);
    procedure SetIDGCodigo(const Value: TNullableString);
    procedure SetCedContratoNumero(const Value: TNullableInteger);
    procedure SetCedContratoData(const Value: TNullableDateTime);
    procedure SetCedFomentoSaldoDevedor(const Value: TNullableCurrency);
    procedure SetEmpCodigo(const Value: Integer);
    procedure SetCedObservacao(const Value: TNullableString);
    procedure SetFilFiltro(const Value: TNullableString);
    procedure SetCedSimples(const Value: TNullableBoolean);
    procedure SetHisCodigo(const Value: TNullableInteger);
    procedure SetCedRubricaOperacaoAtivo(const Value: TNullableString);
    procedure SetCedRubricaOperacaoCobranca(const Value: TNullableString);
    procedure SetCedRubricaOperacaoCaucao(const Value: TNullableString);
    procedure SetCedRubricaPassivo(const Value: TNullableString);
    procedure SetCedRubricaDespesa(const Value: TNullableString);
    procedure SetCedAbaterIRRF(const Value: TNullableBoolean);
    procedure SetCedIRRFAcumulado(const Value: TNullableCurrency);
    procedure SetCedAbaterRetidos(const Value: TNullableBoolean);
    procedure SetAgeCodigo(const Value: TNullableInteger);
    procedure SetCedMsgDocControle(const Value: TNullableString);
    procedure SetCedValorLimiteCreditoCheque(const Value: TNullableCurrency);
    procedure SetCedValorLimiteCreditoDuplicata(const Value: TNullableCurrency);
    procedure SetCedValorLimiteCreditoSacadoCheque(const Value: TNullableCurrency);
    procedure SetCedValorLimiteCreditoSacadoDuplicata(const Value: TNullableCurrency);
    procedure SetCedSacadorPadrao(const Value: TNullableString);
    procedure SetCCCCodigo(const Value: TNullableInteger);
    procedure SetCedTotalPendencias(const Value: TNullableCurrency);
    procedure SetCedInstrucaoCobranca(const Value: TNullableString);
    procedure SetCedEmiteBoleto(const Value: TNullableBoolean);
    procedure SetCedDataConnstEmpresa(const Value: TNullableDateTime);
    procedure SetCedValorDoc(const Value: TNullableCurrency);
    procedure SetCedValorTed(const Value: TNullableCurrency);
    procedure SetCedIncentIssqn(const Value: TNullableBoolean);
    procedure SetCedNaoCobraCpmf(const Value: TNullableBoolean);
    procedure SetCedGerarTarifaAuto(const Value: TNullableBoolean);
    procedure SetSCoCodigo(const Value: TNullableInteger);
    procedure SetCedprazoAtrasoPonderado(const Value: TNullableExtended);
    procedure SetCedRubricaContaGrafica(const Value: TNullableString);
    procedure SetCGLHisCodigo(const Value: TNullableInteger);
    procedure SetCedEmailEnvioDocumento(const Value: TNullableString);
    procedure SetCedContadorNome(const Value: TNullableString);
    procedure SetCedContadorCRC(const Value: TNullableString);
    procedure SetCedContadorCPF(const Value: TNullableString);
    procedure SetCedSacadorPadraoCNPJCPF(const Value: TNullableString);
    procedure SetCedEmailEnvioEfetivacao(const Value: TNullableString);
    procedure SetCedEnviarConsultaTitulosIntegracao(const Value: TNullableBoolean);
    procedure SetDesconsideraCedOuvidoria(const Value: TNullableBoolean);
    procedure SetCedContato(const Value: TNullableString);
    procedure SetCedPercComissao(const Value: TNullableExtended);
    procedure SetCedClassificacao(const Value: TNullableString);
    procedure SetCedDataInclusao(const Value: TNullableDateTime);
    procedure SetCedUsuarioInclusao(const Value: TNullableString);
    procedure SetCedCodime(const Value: TNullableBoolean);
    procedure SetCedLimiteControleSecuritizacaoValor(const Value: TNullableCurrency);
    procedure SetCedLimiteControleSecuritizacaoPeriodo(const Value: TNullableString);
    procedure SetCedRecompraTaxaMulta(const Value: TNullableExtended);
    procedure SetCedContabilidadeContaTransferencia(const Value: TNullableString);
    procedure SetUsuarioUltimaAlteracao(const Value: string);
    procedure SetAlteracaoViaCadastro(const Value: TNullableBoolean);
    procedure SetCedSerasaMonitoreValorSaldoDevedorGerenciamento(const Value: TNullableCurrency);
    procedure SetCedSerasaMonitorePrazo(const Value: TNullableInteger);
    procedure SetCedSerasaGru_ID(const Value: TNullableInteger);
    procedure SetCedSerasaPer_ID(const Value: TNullableInteger);
    procedure SetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ(const Value: TNullableCurrency);
    procedure SetCedSerasaMonitoreValorSaldoDevedorSacadoCPF(const Value: TNullableCurrency);
    procedure SetCedPercentualMulta(const Value: TNullableExtended);
    procedure SetCedConsideraInstrucaoSegundaVia(const Value: TNullableBoolean);
    procedure SetCedNaoProtetar(const Value: TNullableBoolean);
    procedure SetUsuLogin1(const Value: TNullableString);
    procedure SetUsuLogin2(const Value: TNullableString);
    procedure SetUsuLogin3(const Value: TNullableString);
    procedure SetUsuLogin4(const Value: TNullableString);
    procedure SetUsuLogin5(const Value: TNullableString);
    procedure SetUsuAgenteChecagem(const Value: TNullableString);
    procedure SetCedPriorizarPainelChecagem(const Value: TNullableBoolean);
    procedure SetConCodigo(const Value: TNullableInteger);
    procedure SetCedContabilidadeContaClientes(const Value: TNullableString);
    procedure SetCedContabilidadeContaFomento(const Value: TNullableString);
    procedure SetCedContabilidadeContaCtaGrafica(const Value: TNullableString);
    procedure SetCedContabilidadeContaConfissao(const Value: TNullableString);
    procedure SetIncluido(const Value: TNullableInteger);
    procedure SetCedNaoEnviaPefin(const Value: TNullableBoolean);
    procedure SetCedgru_id(const Value: TNullableInteger);
    procedure SetPOCCan(const Value: TNullableBoolean);
    procedure SetCnaeCodigo(const Value: TNullableString);
    procedure SetCedMensagemBoleto1(const Value: TNullableString);
    procedure SetCedMensagemBoleto2(const Value: TNullableString);
    procedure SetCedMensagemBoleto3(const Value: TNullableString);
    procedure SetCedMensagemBoleto4(const Value: TNullableString);
    procedure SetCedMensagemBoleto5(const Value: TNullableString);
    procedure SetCedEmiteBoletoComoCedenteBoleto(const Value: TNullableBoolean);
    //--- Campos ---
    //ID int - ???
    property ID: Integer read GetID;
    //CedCodigo int - ???
    property CedCodigo: Integer read GetCedCodigo write SetCedCodigo;
    //PesCNPJCPF varchar (20) - ???
    property PesCNPJCPF: string read GetPesCNPJCPF write SetPesCNPJCPF;
    //IDGCodigo varchar (8) - ???
    property IDGCodigo: TNullableString read GetIDGCodigo write SetIDGCodigo;
    //CedContratoNumero int - ???
    property CedContratoNumero: TNullableInteger read GetCedContratoNumero write SetCedContratoNumero;
    //CedContratoData datetime - ???
    property CedContratoData: TNullableDateTime read GetCedContratoData write SetCedContratoData;
    //CedFomentoSaldoDevedor float - ???
    property CedFomentoSaldoDevedor: TNullableCurrency read GetCedFomentoSaldoDevedor write SetCedFomentoSaldoDevedor;
    //EmpCodigo int - ???
    property EmpCodigo: Integer read GetEmpCodigo write SetEmpCodigo;
    //CedObservacao varchar (5000) - ???
    property CedObservacao: TNullableString read GetCedObservacao write SetCedObservacao;
    //FilFiltro varchar (30) - ???
    property FilFiltro: TNullableString read GetFilFiltro write SetFilFiltro;
    //CedSimples bit - ???
    property CedSimples: TNullableBoolean read GetCedSimples write SetCedSimples;
    //HisCodigo int - ???
    property HisCodigo: TNullableInteger read GetHisCodigo write SetHisCodigo;
    //CedRubricaOperacaoAtivo varchar (30) - ???
    property CedRubricaOperacaoAtivo: TNullableString read GetCedRubricaOperacaoAtivo write SetCedRubricaOperacaoAtivo;
    //CedRubricaOperacaoCobranca varchar (30) - ???
    property CedRubricaOperacaoCobranca: TNullableString read GetCedRubricaOperacaoCobranca write SetCedRubricaOperacaoCobranca;
    //CedRubricaOperacaoCaucao varchar (30) - ???
    property CedRubricaOperacaoCaucao: TNullableString read GetCedRubricaOperacaoCaucao write SetCedRubricaOperacaoCaucao;
    //CedRubricaPassivo varchar (30) - ???
    property CedRubricaPassivo: TNullableString read GetCedRubricaPassivo write SetCedRubricaPassivo;
    //CedRubricaDespesa varchar (30) - ???
    property CedRubricaDespesa: TNullableString read GetCedRubricaDespesa write SetCedRubricaDespesa;
    //CedAbaterIRRF bit - ???
    property CedAbaterIRRF: TNullableBoolean read GetCedAbaterIRRF write SetCedAbaterIRRF;
    //CedIRRFAcumulado float - ???
    property CedIRRFAcumulado: TNullableCurrency read GetCedIRRFAcumulado write SetCedIRRFAcumulado;
    //CedAbaterRetidos bit - ???
    property CedAbaterRetidos: TNullableBoolean read GetCedAbaterRetidos write SetCedAbaterRetidos;
    //AgeCodigo int - ???
    property AgeCodigo: TNullableInteger read GetAgeCodigo write SetAgeCodigo;
    //CedMsgDocControle varchar (5000) - ???
    property CedMsgDocControle: TNullableString read GetCedMsgDocControle write SetCedMsgDocControle;
    //CedValorLimiteCreditoCheque float - ???
    property CedValorLimiteCreditoCheque: TNullableCurrency read GetCedValorLimiteCreditoCheque write SetCedValorLimiteCreditoCheque;
    //CedValorLimiteCreditoDuplicata float - ???
    property CedValorLimiteCreditoDuplicata: TNullableCurrency read GetCedValorLimiteCreditoDuplicata write SetCedValorLimiteCreditoDuplicata;
    //CedValorLimiteCreditoSacadoCheque float - ???
    property CedValorLimiteCreditoSacadoCheque: TNullableCurrency read GetCedValorLimiteCreditoSacadoCheque write SetCedValorLimiteCreditoSacadoCheque;
    //CedValorLimiteCreditoSacadoDuplicata float - ???
    property CedValorLimiteCreditoSacadoDuplicata: TNullableCurrency read GetCedValorLimiteCreditoSacadoDuplicata write SetCedValorLimiteCreditoSacadoDuplicata;
    //CedSacadorPadrao varchar (100) - ???
    property CedSacadorPadrao: TNullableString read GetCedSacadorPadrao write SetCedSacadorPadrao;
    //CCCCodigo int - ???
    property CCCCodigo: TNullableInteger read GetCCCCodigo write SetCCCCodigo;
    //CedTotalPendencias float - ???
    property CedTotalPendencias: TNullableCurrency read GetCedTotalPendencias write SetCedTotalPendencias;
    //CedInstrucaoCobranca varchar (80) - ???
    property CedInstrucaoCobranca: TNullableString read GetCedInstrucaoCobranca write SetCedInstrucaoCobranca;
    //CedEmiteBoleto bit - ???
    property CedEmiteBoleto: TNullableBoolean read GetCedEmiteBoleto write SetCedEmiteBoleto;
    //CedDataConnstEmpresa datetime - ???
    property CedDataConnstEmpresa: TNullableDateTime read GetCedDataConnstEmpresa write SetCedDataConnstEmpresa;
    //CedValorDoc float - ???
    property CedValorDoc: TNullableCurrency read GetCedValorDoc write SetCedValorDoc;
    //CedValorTed float - ???
    property CedValorTed: TNullableCurrency read GetCedValorTed write SetCedValorTed;
    //CedIncentIssqn bit - ???
    property CedIncentIssqn: TNullableBoolean read GetCedIncentIssqn write SetCedIncentIssqn;
    //CedNaoCobraCpmf bit - ???
    property CedNaoCobraCpmf: TNullableBoolean read GetCedNaoCobraCpmf write SetCedNaoCobraCpmf;
    //CedGerarTarifaAuto bit - ???
    property CedGerarTarifaAuto: TNullableBoolean read GetCedGerarTarifaAuto write SetCedGerarTarifaAuto;
    //SCoCodigo int - ???
    property SCoCodigo: TNullableInteger read GetSCoCodigo write SetSCoCodigo;
    //CedprazoAtrasoPonderado float - ???
    property CedprazoAtrasoPonderado: TNullableExtended read GetCedprazoAtrasoPonderado write SetCedprazoAtrasoPonderado;
    //CedRubricaContaGrafica varchar (30) - ???
    property CedRubricaContaGrafica: TNullableString read GetCedRubricaContaGrafica write SetCedRubricaContaGrafica;
    //CGLHisCodigo int - ???
    property CGLHisCodigo: TNullableInteger read GetCGLHisCodigo write SetCGLHisCodigo;
    //CedEmailEnvioDocumento varchar (150) - ???
    property CedEmailEnvioDocumento: TNullableString read GetCedEmailEnvioDocumento write SetCedEmailEnvioDocumento;
    //CedContadorNome varchar (150) - ???
    property CedContadorNome: TNullableString read GetCedContadorNome write SetCedContadorNome;
    //CedContadorCRC varchar (20) - ???
    property CedContadorCRC: TNullableString read GetCedContadorCRC write SetCedContadorCRC;
    //CedContadorCPF varchar (14) - ???
    property CedContadorCPF: TNullableString read GetCedContadorCPF write SetCedContadorCPF;
    //CedSacadorPadraoCNPJCPF varchar (14) - ???
    property CedSacadorPadraoCNPJCPF: TNullableString read GetCedSacadorPadraoCNPJCPF write SetCedSacadorPadraoCNPJCPF;
    //CedEmailEnvioEfetivacao varchar (300) - ???
    property CedEmailEnvioEfetivacao: TNullableString read GetCedEmailEnvioEfetivacao write SetCedEmailEnvioEfetivacao;
    //CedEnviarConsultaTitulosIntegracao bit - ???
    property CedEnviarConsultaTitulosIntegracao: TNullableBoolean read GetCedEnviarConsultaTitulosIntegracao write SetCedEnviarConsultaTitulosIntegracao;
    //DesconsideraCedOuvidoria bit - ???
    property DesconsideraCedOuvidoria: TNullableBoolean read GetDesconsideraCedOuvidoria write SetDesconsideraCedOuvidoria;
    //CedContato varchar (50) - ???
    property CedContato: TNullableString read GetCedContato write SetCedContato;
    //CedPercComissao float - ???
    property CedPercComissao: TNullableExtended read GetCedPercComissao write SetCedPercComissao;
    //CedClassificacao varchar (30) - ???
    property CedClassificacao: TNullableString read GetCedClassificacao write SetCedClassificacao;
    //CedDataInclusao datetime - ???
    property CedDataInclusao: TNullableDateTime read GetCedDataInclusao write SetCedDataInclusao;
    //CedUsuarioInclusao varchar (250) - ???
    property CedUsuarioInclusao: TNullableString read GetCedUsuarioInclusao write SetCedUsuarioInclusao;
    //CedCodime bit - ???
    property CedCodime: TNullableBoolean read GetCedCodime write SetCedCodime;
    //CedLimiteControleSecuritizacaoValor float - ???
    property CedLimiteControleSecuritizacaoValor: TNullableCurrency read GetCedLimiteControleSecuritizacaoValor write SetCedLimiteControleSecuritizacaoValor;
    //CedLimiteControleSecuritizacaoPeriodo varchar (5) - ???
    property CedLimiteControleSecuritizacaoPeriodo: TNullableString read GetCedLimiteControleSecuritizacaoPeriodo write SetCedLimiteControleSecuritizacaoPeriodo;
    //CedRecompraTaxaMulta float - ???
    property CedRecompraTaxaMulta: TNullableExtended read GetCedRecompraTaxaMulta write SetCedRecompraTaxaMulta;
    //CedContabilidadeContaTransferencia varchar (20) - ???
    property CedContabilidadeContaTransferencia: TNullableString read GetCedContabilidadeContaTransferencia write SetCedContabilidadeContaTransferencia;
    //UsuarioUltimaAlteracao varchar (50) - ???
    property UsuarioUltimaAlteracao: string read GetUsuarioUltimaAlteracao write SetUsuarioUltimaAlteracao;
    //AlteracaoViaCadastro bit - ???
    property AlteracaoViaCadastro: TNullableBoolean read GetAlteracaoViaCadastro write SetAlteracaoViaCadastro;
    //CedSerasaMonitoreValorSaldoDevedorGerenciamento float - ???
    property CedSerasaMonitoreValorSaldoDevedorGerenciamento: TNullableCurrency read GetCedSerasaMonitoreValorSaldoDevedorGerenciamento write SetCedSerasaMonitoreValorSaldoDevedorGerenciamento;
    //CedSerasaMonitorePrazo int - ???
    property CedSerasaMonitorePrazo: TNullableInteger read GetCedSerasaMonitorePrazo write SetCedSerasaMonitorePrazo;
    //CedSerasaGru_ID int - ???
    property CedSerasaGru_ID: TNullableInteger read GetCedSerasaGru_ID write SetCedSerasaGru_ID;
    //CedSerasaPer_ID int - ???
    property CedSerasaPer_ID: TNullableInteger read GetCedSerasaPer_ID write SetCedSerasaPer_ID;
    //CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ float - ???
    property CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ: TNullableCurrency read GetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ write SetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ;
    //CedSerasaMonitoreValorSaldoDevedorSacadoCPF float - ???
    property CedSerasaMonitoreValorSaldoDevedorSacadoCPF: TNullableCurrency read GetCedSerasaMonitoreValorSaldoDevedorSacadoCPF write SetCedSerasaMonitoreValorSaldoDevedorSacadoCPF;
    //CedPercentualMulta float - ???
    property CedPercentualMulta: TNullableExtended read GetCedPercentualMulta write SetCedPercentualMulta;
    //CedConsideraInstrucaoSegundaVia bit - ???
    property CedConsideraInstrucaoSegundaVia: TNullableBoolean read GetCedConsideraInstrucaoSegundaVia write SetCedConsideraInstrucaoSegundaVia;
    //CedNaoProtetar bit - ???
    property CedNaoProtetar: TNullableBoolean read GetCedNaoProtetar write SetCedNaoProtetar;
    //UsuLogin1 varchar (100) - ???
    property UsuLogin1: TNullableString read GetUsuLogin1 write SetUsuLogin1;
    //UsuLogin2 varchar (100) - ???
    property UsuLogin2: TNullableString read GetUsuLogin2 write SetUsuLogin2;
    //UsuLogin3 varchar (100) - ???
    property UsuLogin3: TNullableString read GetUsuLogin3 write SetUsuLogin3;
    //UsuLogin4 varchar (100) - ???
    property UsuLogin4: TNullableString read GetUsuLogin4 write SetUsuLogin4;
    //UsuLogin5 varchar (500) - ???
    property UsuLogin5: TNullableString read GetUsuLogin5 write SetUsuLogin5;
    //UsuAgenteChecagem varchar (300) - ???
    property UsuAgenteChecagem: TNullableString read GetUsuAgenteChecagem write SetUsuAgenteChecagem;
    //CedPriorizarPainelChecagem bit - ???
    property CedPriorizarPainelChecagem: TNullableBoolean read GetCedPriorizarPainelChecagem write SetCedPriorizarPainelChecagem;
    //ConCodigo int - ???
    property ConCodigo: TNullableInteger read GetConCodigo write SetConCodigo;
    //CedContabilidadeContaClientes varchar (20) - ???
    property CedContabilidadeContaClientes: TNullableString read GetCedContabilidadeContaClientes write SetCedContabilidadeContaClientes;
    //CedContabilidadeContaFomento varchar (20) - ???
    property CedContabilidadeContaFomento: TNullableString read GetCedContabilidadeContaFomento write SetCedContabilidadeContaFomento;
    //CedContabilidadeContaCtaGrafica varchar (20) - ???
    property CedContabilidadeContaCtaGrafica: TNullableString read GetCedContabilidadeContaCtaGrafica write SetCedContabilidadeContaCtaGrafica;
    //CedContabilidadeContaConfissao varchar (20) - ???
    property CedContabilidadeContaConfissao: TNullableString read GetCedContabilidadeContaConfissao write SetCedContabilidadeContaConfissao;
    //Incluido int - ???
    property Incluido: TNullableInteger read GetIncluido write SetIncluido;
    //CedNaoEnviaPefin bit - ???
    property CedNaoEnviaPefin: TNullableBoolean read GetCedNaoEnviaPefin write SetCedNaoEnviaPefin;
    //Cedgru_id int - ???
    property Cedgru_id: TNullableInteger read GetCedgru_id write SetCedgru_id;
    //POCCan bit - ???
    property POCCan: TNullableBoolean read GetPOCCan write SetPOCCan;
    //CnaeCodigo varchar (10) - ???
    property CnaeCodigo: TNullableString read GetCnaeCodigo write SetCnaeCodigo;
    //CedMensagemBoleto1 varchar (200) - ???
    property CedMensagemBoleto1: TNullableString read GetCedMensagemBoleto1 write SetCedMensagemBoleto1;
    //CedMensagemBoleto2 varchar (200) - ???
    property CedMensagemBoleto2: TNullableString read GetCedMensagemBoleto2 write SetCedMensagemBoleto2;
    //CedMensagemBoleto3 varchar (200) - ???
    property CedMensagemBoleto3: TNullableString read GetCedMensagemBoleto3 write SetCedMensagemBoleto3;
    //CedMensagemBoleto4 varchar (200) - ???
    property CedMensagemBoleto4: TNullableString read GetCedMensagemBoleto4 write SetCedMensagemBoleto4;
    //CedMensagemBoleto5 varchar (200) - ???
    property CedMensagemBoleto5: TNullableString read GetCedMensagemBoleto5 write SetCedMensagemBoleto5;
    //CedEmiteBoletoComoCedenteBoleto bit - ???
    property CedEmiteBoletoComoCedenteBoleto: TNullableBoolean read GetCedEmiteBoletoComoCedenteBoleto write SetCedEmiteBoletoComoCedenteBoleto;
  end;

  IIteratorARNFCedente = interface(IIteratorActiveRecord)
    function CurrentItem: IARNFCedente;
  end;

  ICollectionARNFCedente = interface(ICollectionActiveRecord)
    function GetItem(Index: Integer): IARNFCedente;

    function Add(const Item: IARNFCedente): Integer;
    function First: IARNFCedente;
    procedure Insert(Index: Integer; const Item: IARNFCedente);
    function Last: IARNFCedente;
    function New(const AConnection: IActiveRecordConnection): IARNFCedente;
    property Item[Index: Integer]: IARNFCedente read GetItem; default;
  end;

  TCollectionARNFCedente = class(TCollectionActiveRecord, ICollectionARNFCedente)
  protected
    { ICollectionARNFCedente }
    function GetItem(Index: Integer): IARNFCedente;

    function Add(const Item: IARNFCedente): Integer;
    function First: IARNFCedente;
    procedure Insert(Index: Integer; const Item: IARNFCedente);
    function Last: IARNFCedente;
    function New(const AConnection: IActiveRecordConnection): IARNFCedente;
  end;

  TIteratorARNFCedenteDecorator = class(TIteratorCollectionActiveRecordDecorator, IIteratorARNFCedente)
  protected
    { IIteratorARNFCedente }
    function CurrentItem: IARNFCedente;
  public
    class function Decore(const ACollectionARNFCedente: ICollectionARNFCedente): IIteratorARNFCedente;
  end;

  TIteratorARNFCedenteQueryDecorator = class(TIteratorActiveRecordQueryDecorator, IIteratorARNFCedente)
  protected
    { IIteratorARNFCedente }
    function CurrentItem: IARNFCedente;
  public
    class function Decore(const AARNFCedenteQuery: IActiveRecordQuery): IIteratorARNFCedente;
  end;

  TARNFCedente = class(TActiveRecord, IARNFCedente)
  private
    FPrimaryKeyID: Integer;
    FID: Integer;
    FCedCodigo: Integer;
    FPesCNPJCPF: string;
    FIDGCodigo: TNullableString;
    FCedContratoNumero: TNullableInteger;
    FCedContratoData: TNullableDateTime;
    FCedFomentoSaldoDevedor: TNullableCurrency;
    FEmpCodigo: Integer;
    FCedObservacao: TNullableString;
    FFilFiltro: TNullableString;
    FCedSimples: TNullableBoolean;
    FHisCodigo: TNullableInteger;
    FCedRubricaOperacaoAtivo: TNullableString;
    FCedRubricaOperacaoCobranca: TNullableString;
    FCedRubricaOperacaoCaucao: TNullableString;
    FCedRubricaPassivo: TNullableString;
    FCedRubricaDespesa: TNullableString;
    FCedAbaterIRRF: TNullableBoolean;
    FCedIRRFAcumulado: TNullableCurrency;
    FCedAbaterRetidos: TNullableBoolean;
    FAgeCodigo: TNullableInteger;
    FCedMsgDocControle: TNullableString;
    FCedValorLimiteCreditoCheque: TNullableCurrency;
    FCedValorLimiteCreditoDuplicata: TNullableCurrency;
    FCedValorLimiteCreditoSacadoCheque: TNullableCurrency;
    FCedValorLimiteCreditoSacadoDuplicata: TNullableCurrency;
    FCedSacadorPadrao: TNullableString;
    FCCCCodigo: TNullableInteger;
    FCedTotalPendencias: TNullableCurrency;
    FCedInstrucaoCobranca: TNullableString;
    FCedEmiteBoleto: TNullableBoolean;
    FCedDataConnstEmpresa: TNullableDateTime;
    FCedValorDoc: TNullableCurrency;
    FCedValorTed: TNullableCurrency;
    FCedIncentIssqn: TNullableBoolean;
    FCedNaoCobraCpmf: TNullableBoolean;
    FCedGerarTarifaAuto: TNullableBoolean;
    FSCoCodigo: TNullableInteger;
    FCedprazoAtrasoPonderado: TNullableExtended;
    FCedRubricaContaGrafica: TNullableString;
    FCGLHisCodigo: TNullableInteger;
    FCedEmailEnvioDocumento: TNullableString;
    FCedContadorNome: TNullableString;
    FCedContadorCRC: TNullableString;
    FCedContadorCPF: TNullableString;
    FCedSacadorPadraoCNPJCPF: TNullableString;
    FCedEmailEnvioEfetivacao: TNullableString;
    FCedEnviarConsultaTitulosIntegracao: TNullableBoolean;
    FDesconsideraCedOuvidoria: TNullableBoolean;
    FCedContato: TNullableString;
    FCedPercComissao: TNullableExtended;
    FCedClassificacao: TNullableString;
    FCedDataInclusao: TNullableDateTime;
    FCedUsuarioInclusao: TNullableString;
    FCedCodime: TNullableBoolean;
    FCedLimiteControleSecuritizacaoValor: TNullableCurrency;
    FCedLimiteControleSecuritizacaoPeriodo: TNullableString;
    FCedRecompraTaxaMulta: TNullableExtended;
    FCedContabilidadeContaTransferencia: TNullableString;
    FUsuarioUltimaAlteracao: string;
    FAlteracaoViaCadastro: TNullableBoolean;
    FCedSerasaMonitoreValorSaldoDevedorGerenciamento: TNullableCurrency;
    FCedSerasaMonitorePrazo: TNullableInteger;
    FCedSerasaGru_ID: TNullableInteger;
    FCedSerasaPer_ID: TNullableInteger;
    FCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ: TNullableCurrency;
    FCedSerasaMonitoreValorSaldoDevedorSacadoCPF: TNullableCurrency;
    FCedPercentualMulta: TNullableExtended;
    FCedConsideraInstrucaoSegundaVia: TNullableBoolean;
    FCedNaoProtetar: TNullableBoolean;
    FUsuLogin1: TNullableString;
    FUsuLogin2: TNullableString;
    FUsuLogin3: TNullableString;
    FUsuLogin4: TNullableString;
    FUsuLogin5: TNullableString;
    FUsuAgenteChecagem: TNullableString;
    FCedPriorizarPainelChecagem: TNullableBoolean;
    FConCodigo: TNullableInteger;
    FCedContabilidadeContaClientes: TNullableString;
    FCedContabilidadeContaFomento: TNullableString;
    FCedContabilidadeContaCtaGrafica: TNullableString;
    FCedContabilidadeContaConfissao: TNullableString;
    FIncluido: TNullableInteger;
    FCedNaoEnviaPefin: TNullableBoolean;
    FCedgru_id: TNullableInteger;
    FPOCCan: TNullableBoolean;
    FCnaeCodigo: TNullableString;
    FCedMensagemBoleto1: TNullableString;
    FCedMensagemBoleto2: TNullableString;
    FCedMensagemBoleto3: TNullableString;
    FCedMensagemBoleto4: TNullableString;
    FCedMensagemBoleto5: TNullableString;
    FCedEmiteBoletoComoCedenteBoleto: TNullableBoolean;
  protected
    { IActiveRecordAccess }
    procedure Clear(Index: Integer); override;
    function DisplayText(Index: Integer): string; override;
    function GetAsString(Index: Integer): string; override;
    function GetValue(Index: Integer): Variant; override;
    function IsNull(Index: Integer): Boolean; override;
    procedure SetAsString(Index: Integer; const Value: string); override;
    procedure SetValue(Index: Integer; const Value: Variant); override;
    { IARNFCedente }
    function GetID: Integer;
    function GetCedCodigo: Integer;
    function GetPesCNPJCPF: string;
    function GetIDGCodigo: TNullableString;
    function GetCedContratoNumero: TNullableInteger;
    function GetCedContratoData: TNullableDateTime;
    function GetCedFomentoSaldoDevedor: TNullableCurrency;
    function GetEmpCodigo: Integer;
    function GetCedObservacao: TNullableString;
    function GetFilFiltro: TNullableString;
    function GetCedSimples: TNullableBoolean;
    function GetHisCodigo: TNullableInteger;
    function GetCedRubricaOperacaoAtivo: TNullableString;
    function GetCedRubricaOperacaoCobranca: TNullableString;
    function GetCedRubricaOperacaoCaucao: TNullableString;
    function GetCedRubricaPassivo: TNullableString;
    function GetCedRubricaDespesa: TNullableString;
    function GetCedAbaterIRRF: TNullableBoolean;
    function GetCedIRRFAcumulado: TNullableCurrency;
    function GetCedAbaterRetidos: TNullableBoolean;
    function GetAgeCodigo: TNullableInteger;
    function GetCedMsgDocControle: TNullableString;
    function GetCedValorLimiteCreditoCheque: TNullableCurrency;
    function GetCedValorLimiteCreditoDuplicata: TNullableCurrency;
    function GetCedValorLimiteCreditoSacadoCheque: TNullableCurrency;
    function GetCedValorLimiteCreditoSacadoDuplicata: TNullableCurrency;
    function GetCedSacadorPadrao: TNullableString;
    function GetCCCCodigo: TNullableInteger;
    function GetCedTotalPendencias: TNullableCurrency;
    function GetCedInstrucaoCobranca: TNullableString;
    function GetCedEmiteBoleto: TNullableBoolean;
    function GetCedDataConnstEmpresa: TNullableDateTime;
    function GetCedValorDoc: TNullableCurrency;
    function GetCedValorTed: TNullableCurrency;
    function GetCedIncentIssqn: TNullableBoolean;
    function GetCedNaoCobraCpmf: TNullableBoolean;
    function GetCedGerarTarifaAuto: TNullableBoolean;
    function GetSCoCodigo: TNullableInteger;
    function GetCedprazoAtrasoPonderado: TNullableExtended;
    function GetCedRubricaContaGrafica: TNullableString;
    function GetCGLHisCodigo: TNullableInteger;
    function GetCedEmailEnvioDocumento: TNullableString;
    function GetCedContadorNome: TNullableString;
    function GetCedContadorCRC: TNullableString;
    function GetCedContadorCPF: TNullableString;
    function GetCedSacadorPadraoCNPJCPF: TNullableString;
    function GetCedEmailEnvioEfetivacao: TNullableString;
    function GetCedEnviarConsultaTitulosIntegracao: TNullableBoolean;
    function GetDesconsideraCedOuvidoria: TNullableBoolean;
    function GetCedContato: TNullableString;
    function GetCedPercComissao: TNullableExtended;
    function GetCedClassificacao: TNullableString;
    function GetCedDataInclusao: TNullableDateTime;
    function GetCedUsuarioInclusao: TNullableString;
    function GetCedCodime: TNullableBoolean;
    function GetCedLimiteControleSecuritizacaoValor: TNullableCurrency;
    function GetCedLimiteControleSecuritizacaoPeriodo: TNullableString;
    function GetCedRecompraTaxaMulta: TNullableExtended;
    function GetCedContabilidadeContaTransferencia: TNullableString;
    function GetUsuarioUltimaAlteracao: string;
    function GetAlteracaoViaCadastro: TNullableBoolean;
    function GetCedSerasaMonitoreValorSaldoDevedorGerenciamento: TNullableCurrency;
    function GetCedSerasaMonitorePrazo: TNullableInteger;
    function GetCedSerasaGru_ID: TNullableInteger;
    function GetCedSerasaPer_ID: TNullableInteger;
    function GetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ: TNullableCurrency;
    function GetCedSerasaMonitoreValorSaldoDevedorSacadoCPF: TNullableCurrency;
    function GetCedPercentualMulta: TNullableExtended;
    function GetCedConsideraInstrucaoSegundaVia: TNullableBoolean;
    function GetCedNaoProtetar: TNullableBoolean;
    function GetUsuLogin1: TNullableString;
    function GetUsuLogin2: TNullableString;
    function GetUsuLogin3: TNullableString;
    function GetUsuLogin4: TNullableString;
    function GetUsuLogin5: TNullableString;
    function GetUsuAgenteChecagem: TNullableString;
    function GetCedPriorizarPainelChecagem: TNullableBoolean;
    function GetConCodigo: TNullableInteger;
    function GetCedContabilidadeContaClientes: TNullableString;
    function GetCedContabilidadeContaFomento: TNullableString;
    function GetCedContabilidadeContaCtaGrafica: TNullableString;
    function GetCedContabilidadeContaConfissao: TNullableString;
    function GetIncluido: TNullableInteger;
    function GetCedNaoEnviaPefin: TNullableBoolean;
    function GetCedgru_id: TNullableInteger;
    function GetPOCCan: TNullableBoolean;
    function GetCnaeCodigo: TNullableString;
    function GetCedMensagemBoleto1: TNullableString;
    function GetCedMensagemBoleto2: TNullableString;
    function GetCedMensagemBoleto3: TNullableString;
    function GetCedMensagemBoleto4: TNullableString;
    function GetCedMensagemBoleto5: TNullableString;
    function GetCedEmiteBoletoComoCedenteBoleto: TNullableBoolean;
    procedure SetCedCodigo(const Value: Integer);
    procedure SetPesCNPJCPF(const Value: string);
    procedure SetIDGCodigo(const Value: TNullableString);
    procedure SetCedContratoNumero(const Value: TNullableInteger);
    procedure SetCedContratoData(const Value: TNullableDateTime);
    procedure SetCedFomentoSaldoDevedor(const Value: TNullableCurrency);
    procedure SetEmpCodigo(const Value: Integer);
    procedure SetCedObservacao(const Value: TNullableString);
    procedure SetFilFiltro(const Value: TNullableString);
    procedure SetCedSimples(const Value: TNullableBoolean);
    procedure SetHisCodigo(const Value: TNullableInteger);
    procedure SetCedRubricaOperacaoAtivo(const Value: TNullableString);
    procedure SetCedRubricaOperacaoCobranca(const Value: TNullableString);
    procedure SetCedRubricaOperacaoCaucao(const Value: TNullableString);
    procedure SetCedRubricaPassivo(const Value: TNullableString);
    procedure SetCedRubricaDespesa(const Value: TNullableString);
    procedure SetCedAbaterIRRF(const Value: TNullableBoolean);
    procedure SetCedIRRFAcumulado(const Value: TNullableCurrency);
    procedure SetCedAbaterRetidos(const Value: TNullableBoolean);
    procedure SetAgeCodigo(const Value: TNullableInteger);
    procedure SetCedMsgDocControle(const Value: TNullableString);
    procedure SetCedValorLimiteCreditoCheque(const Value: TNullableCurrency);
    procedure SetCedValorLimiteCreditoDuplicata(const Value: TNullableCurrency);
    procedure SetCedValorLimiteCreditoSacadoCheque(const Value: TNullableCurrency);
    procedure SetCedValorLimiteCreditoSacadoDuplicata(const Value: TNullableCurrency);
    procedure SetCedSacadorPadrao(const Value: TNullableString);
    procedure SetCCCCodigo(const Value: TNullableInteger);
    procedure SetCedTotalPendencias(const Value: TNullableCurrency);
    procedure SetCedInstrucaoCobranca(const Value: TNullableString);
    procedure SetCedEmiteBoleto(const Value: TNullableBoolean);
    procedure SetCedDataConnstEmpresa(const Value: TNullableDateTime);
    procedure SetCedValorDoc(const Value: TNullableCurrency);
    procedure SetCedValorTed(const Value: TNullableCurrency);
    procedure SetCedIncentIssqn(const Value: TNullableBoolean);
    procedure SetCedNaoCobraCpmf(const Value: TNullableBoolean);
    procedure SetCedGerarTarifaAuto(const Value: TNullableBoolean);
    procedure SetSCoCodigo(const Value: TNullableInteger);
    procedure SetCedprazoAtrasoPonderado(const Value: TNullableExtended);
    procedure SetCedRubricaContaGrafica(const Value: TNullableString);
    procedure SetCGLHisCodigo(const Value: TNullableInteger);
    procedure SetCedEmailEnvioDocumento(const Value: TNullableString);
    procedure SetCedContadorNome(const Value: TNullableString);
    procedure SetCedContadorCRC(const Value: TNullableString);
    procedure SetCedContadorCPF(const Value: TNullableString);
    procedure SetCedSacadorPadraoCNPJCPF(const Value: TNullableString);
    procedure SetCedEmailEnvioEfetivacao(const Value: TNullableString);
    procedure SetCedEnviarConsultaTitulosIntegracao(const Value: TNullableBoolean);
    procedure SetDesconsideraCedOuvidoria(const Value: TNullableBoolean);
    procedure SetCedContato(const Value: TNullableString);
    procedure SetCedPercComissao(const Value: TNullableExtended);
    procedure SetCedClassificacao(const Value: TNullableString);
    procedure SetCedDataInclusao(const Value: TNullableDateTime);
    procedure SetCedUsuarioInclusao(const Value: TNullableString);
    procedure SetCedCodime(const Value: TNullableBoolean);
    procedure SetCedLimiteControleSecuritizacaoValor(const Value: TNullableCurrency);
    procedure SetCedLimiteControleSecuritizacaoPeriodo(const Value: TNullableString);
    procedure SetCedRecompraTaxaMulta(const Value: TNullableExtended);
    procedure SetCedContabilidadeContaTransferencia(const Value: TNullableString);
    procedure SetUsuarioUltimaAlteracao(const Value: string);
    procedure SetAlteracaoViaCadastro(const Value: TNullableBoolean);
    procedure SetCedSerasaMonitoreValorSaldoDevedorGerenciamento(const Value: TNullableCurrency);
    procedure SetCedSerasaMonitorePrazo(const Value: TNullableInteger);
    procedure SetCedSerasaGru_ID(const Value: TNullableInteger);
    procedure SetCedSerasaPer_ID(const Value: TNullableInteger);
    procedure SetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ(const Value: TNullableCurrency);
    procedure SetCedSerasaMonitoreValorSaldoDevedorSacadoCPF(const Value: TNullableCurrency);
    procedure SetCedPercentualMulta(const Value: TNullableExtended);
    procedure SetCedConsideraInstrucaoSegundaVia(const Value: TNullableBoolean);
    procedure SetCedNaoProtetar(const Value: TNullableBoolean);
    procedure SetUsuLogin1(const Value: TNullableString);
    procedure SetUsuLogin2(const Value: TNullableString);
    procedure SetUsuLogin3(const Value: TNullableString);
    procedure SetUsuLogin4(const Value: TNullableString);
    procedure SetUsuLogin5(const Value: TNullableString);
    procedure SetUsuAgenteChecagem(const Value: TNullableString);
    procedure SetCedPriorizarPainelChecagem(const Value: TNullableBoolean);
    procedure SetConCodigo(const Value: TNullableInteger);
    procedure SetCedContabilidadeContaClientes(const Value: TNullableString);
    procedure SetCedContabilidadeContaFomento(const Value: TNullableString);
    procedure SetCedContabilidadeContaCtaGrafica(const Value: TNullableString);
    procedure SetCedContabilidadeContaConfissao(const Value: TNullableString);
    procedure SetIncluido(const Value: TNullableInteger);
    procedure SetCedNaoEnviaPefin(const Value: TNullableBoolean);
    procedure SetCedgru_id(const Value: TNullableInteger);
    procedure SetPOCCan(const Value: TNullableBoolean);
    procedure SetCnaeCodigo(const Value: TNullableString);
    procedure SetCedMensagemBoleto1(const Value: TNullableString);
    procedure SetCedMensagemBoleto2(const Value: TNullableString);
    procedure SetCedMensagemBoleto3(const Value: TNullableString);
    procedure SetCedMensagemBoleto4(const Value: TNullableString);
    procedure SetCedMensagemBoleto5(const Value: TNullableString);
    procedure SetCedEmiteBoletoComoCedenteBoleto(const Value: TNullableBoolean);
    procedure CopyFrom(AActiveRecord: TActiveRecord); overload; override;
    function CreateItemRelationship(Index: Integer): TActiveRecord; override;
    procedure Persist; override;
    procedure PersistSQL;
    procedure SetRecordSet(const ARecordSet: _RecordSet; AOffset: Integer); override;
  public
    constructor Create(const AConnection: IActiveRecordConnection); override;
    class function QueryByID(const AID: Integer; const AConnection: IActiveRecordConnection): IActiveRecordQuery;
    class function FindByID(const AID: Integer; const AConnection: IActiveRecordConnection): IARNFCedente;
    class function GUIDItem: TGUID; override;
    class function Metadata: IActiveRecordMetadata; override;
    class function ViewMetadata: IActiveRecordMetadata; override;
  end;

  TARNFCedenteMetadata = record
    Table: TTableMetadata;
    Fields: array [0..92] of TFieldMetadata;
  end;

const
  Campo_NFCedente_ID = 0;
  Campo_NFCedente_CedCodigo = 1;
  Campo_NFCedente_PesCNPJCPF = 2;
  Campo_NFCedente_IDGCodigo = 3;
  Campo_NFCedente_CedContratoNumero = 4;
  Campo_NFCedente_CedContratoData = 5;
  Campo_NFCedente_CedFomentoSaldoDevedor = 6;
  Campo_NFCedente_EmpCodigo = 7;
  Campo_NFCedente_CedObservacao = 8;
  Campo_NFCedente_FilFiltro = 9;
  Campo_NFCedente_CedSimples = 10;
  Campo_NFCedente_HisCodigo = 11;
  Campo_NFCedente_CedRubricaOperacaoAtivo = 12;
  Campo_NFCedente_CedRubricaOperacaoCobranca = 13;
  Campo_NFCedente_CedRubricaOperacaoCaucao = 14;
  Campo_NFCedente_CedRubricaPassivo = 15;
  Campo_NFCedente_CedRubricaDespesa = 16;
  Campo_NFCedente_CedAbaterIRRF = 17;
  Campo_NFCedente_CedIRRFAcumulado = 18;
  Campo_NFCedente_CedAbaterRetidos = 19;
  Campo_NFCedente_AgeCodigo = 20;
  Campo_NFCedente_CedMsgDocControle = 21;
  Campo_NFCedente_CedValorLimiteCreditoCheque = 22;
  Campo_NFCedente_CedValorLimiteCreditoDuplicata = 23;
  Campo_NFCedente_CedValorLimiteCreditoSacadoCheque = 24;
  Campo_NFCedente_CedValorLimiteCreditoSacadoDuplicata = 25;
  Campo_NFCedente_CedSacadorPadrao = 26;
  Campo_NFCedente_CCCCodigo = 27;
  Campo_NFCedente_CedTotalPendencias = 28;
  Campo_NFCedente_CedInstrucaoCobranca = 29;
  Campo_NFCedente_CedEmiteBoleto = 30;
  Campo_NFCedente_CedDataConnstEmpresa = 31;
  Campo_NFCedente_CedValorDoc = 32;
  Campo_NFCedente_CedValorTed = 33;
  Campo_NFCedente_CedIncentIssqn = 34;
  Campo_NFCedente_CedNaoCobraCpmf = 35;
  Campo_NFCedente_CedGerarTarifaAuto = 36;
  Campo_NFCedente_SCoCodigo = 37;
  Campo_NFCedente_CedprazoAtrasoPonderado = 38;
  Campo_NFCedente_CedRubricaContaGrafica = 39;
  Campo_NFCedente_CGLHisCodigo = 40;
  Campo_NFCedente_CedEmailEnvioDocumento = 41;
  Campo_NFCedente_CedContadorNome = 42;
  Campo_NFCedente_CedContadorCRC = 43;
  Campo_NFCedente_CedContadorCPF = 44;
  Campo_NFCedente_CedSacadorPadraoCNPJCPF = 45;
  Campo_NFCedente_CedEmailEnvioEfetivacao = 46;
  Campo_NFCedente_CedEnviarConsultaTitulosIntegracao = 47;
  Campo_NFCedente_DesconsideraCedOuvidoria = 48;
  Campo_NFCedente_CedContato = 49;
  Campo_NFCedente_CedPercComissao = 50;
  Campo_NFCedente_CedClassificacao = 51;
  Campo_NFCedente_CedDataInclusao = 52;
  Campo_NFCedente_CedUsuarioInclusao = 53;
  Campo_NFCedente_CedCodime = 54;
  Campo_NFCedente_CedLimiteControleSecuritizacaoValor = 55;
  Campo_NFCedente_CedLimiteControleSecuritizacaoPeriodo = 56;
  Campo_NFCedente_CedRecompraTaxaMulta = 57;
  Campo_NFCedente_CedContabilidadeContaTransferencia = 58;
  Campo_NFCedente_UsuarioUltimaAlteracao = 59;
  Campo_NFCedente_AlteracaoViaCadastro = 60;
  Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorGerenciamento = 61;
  Campo_NFCedente_CedSerasaMonitorePrazo = 62;
  Campo_NFCedente_CedSerasaGru_ID = 63;
  Campo_NFCedente_CedSerasaPer_ID = 64;
  Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ = 65;
  Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCPF = 66;
  Campo_NFCedente_CedPercentualMulta = 67;
  Campo_NFCedente_CedConsideraInstrucaoSegundaVia = 68;
  Campo_NFCedente_CedNaoProtetar = 69;
  Campo_NFCedente_UsuLogin1 = 70;
  Campo_NFCedente_UsuLogin2 = 71;
  Campo_NFCedente_UsuLogin3 = 72;
  Campo_NFCedente_UsuLogin4 = 73;
  Campo_NFCedente_UsuLogin5 = 74;
  Campo_NFCedente_UsuAgenteChecagem = 75;
  Campo_NFCedente_CedPriorizarPainelChecagem = 76;
  Campo_NFCedente_ConCodigo = 77;
  Campo_NFCedente_CedContabilidadeContaClientes = 78;
  Campo_NFCedente_CedContabilidadeContaFomento = 79;
  Campo_NFCedente_CedContabilidadeContaCtaGrafica = 80;
  Campo_NFCedente_CedContabilidadeContaConfissao = 81;
  Campo_NFCedente_Incluido = 82;
  Campo_NFCedente_CedNaoEnviaPefin = 83;
  Campo_NFCedente_Cedgru_id = 84;
  Campo_NFCedente_POCCan = 85;
  Campo_NFCedente_CnaeCodigo = 86;
  Campo_NFCedente_CedMensagemBoleto1 = 87;
  Campo_NFCedente_CedMensagemBoleto2 = 88;
  Campo_NFCedente_CedMensagemBoleto3 = 89;
  Campo_NFCedente_CedMensagemBoleto4 = 90;
  Campo_NFCedente_CedMensagemBoleto5 = 91;
  Campo_NFCedente_CedEmiteBoletoComoCedenteBoleto = 92;
  NFCedente_ReferenciaParaNovosCampos = Campo_NFCedente_CedEmiteBoletoComoCedenteBoleto + 1;
  ARNFCedenteMetadata: TARNFCedenteMetadata = (
    Table: (Name: 'NFCedente'; PrimaryKeyFields: 'ID'; DeletedField: '');
    Fields: (
      (Index: Campo_NFCedente_ID; Name: 'ID'; FieldType: arftInteger; Length: 0; Nullable: False;
        Caption: 'ID'; Visible: True; ReadOnly: True; Commented: False; 
        Title: 'ID'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_CedCodigo; Name: 'CedCodigo'; FieldType: arftInteger; Length: 0; Nullable: False;
        Caption: 'CedCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedCodigo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_PesCNPJCPF; Name: 'PesCNPJCPF'; FieldType: arftVarchar; Length: 20; Nullable: False;
        Caption: 'PesCNPJCPF'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'PesCNPJCPF'; ColumnCharWidth: 20),
      (Index: Campo_NFCedente_IDGCodigo; Name: 'IDGCodigo'; FieldType: arftVarchar; Length: 8; Nullable: True;
        Caption: 'IDGCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'IDGCodigo'; ColumnCharWidth: 8),
      (Index: Campo_NFCedente_CedContratoNumero; Name: 'CedContratoNumero'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'CedContratoNumero'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedContratoNumero'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_CedContratoData; Name: 'CedContratoData'; FieldType: arftDateTime; Length: 0; Nullable: True;
        Caption: 'CedContratoData'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedContratoData'; ColumnCharWidth: ColumnCharWidthForDateTime),
      (Index: Campo_NFCedente_CedFomentoSaldoDevedor; Name: 'CedFomentoSaldoDevedor'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'CedFomentoSaldoDevedor'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedFomentoSaldoDevedor'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_NFCedente_EmpCodigo; Name: 'EmpCodigo'; FieldType: arftInteger; Length: 0; Nullable: False;
        Caption: 'EmpCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'EmpCodigo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_CedObservacao; Name: 'CedObservacao'; FieldType: arftVarchar; Length: 5000; Nullable: True;
        Caption: 'CedObservacao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedObservacao'; ColumnCharWidth: 5000),
      (Index: Campo_NFCedente_FilFiltro; Name: 'FilFiltro'; FieldType: arftVarchar; Length: 30; Nullable: True;
        Caption: 'FilFiltro'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'FilFiltro'; ColumnCharWidth: 30),
      (Index: Campo_NFCedente_CedSimples; Name: 'CedSimples'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CedSimples'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedSimples'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_HisCodigo; Name: 'HisCodigo'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'HisCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'HisCodigo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_CedRubricaOperacaoAtivo; Name: 'CedRubricaOperacaoAtivo'; FieldType: arftVarchar; Length: 30; Nullable: True;
        Caption: 'CedRubricaOperacaoAtivo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedRubricaOperacaoAtivo'; ColumnCharWidth: 30),
      (Index: Campo_NFCedente_CedRubricaOperacaoCobranca; Name: 'CedRubricaOperacaoCobranca'; FieldType: arftVarchar; Length: 30; Nullable: True;
        Caption: 'CedRubricaOperacaoCobranca'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedRubricaOperacaoCobranca'; ColumnCharWidth: 30),
      (Index: Campo_NFCedente_CedRubricaOperacaoCaucao; Name: 'CedRubricaOperacaoCaucao'; FieldType: arftVarchar; Length: 30; Nullable: True;
        Caption: 'CedRubricaOperacaoCaucao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedRubricaOperacaoCaucao'; ColumnCharWidth: 30),
      (Index: Campo_NFCedente_CedRubricaPassivo; Name: 'CedRubricaPassivo'; FieldType: arftVarchar; Length: 30; Nullable: True;
        Caption: 'CedRubricaPassivo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedRubricaPassivo'; ColumnCharWidth: 30),
      (Index: Campo_NFCedente_CedRubricaDespesa; Name: 'CedRubricaDespesa'; FieldType: arftVarchar; Length: 30; Nullable: True;
        Caption: 'CedRubricaDespesa'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedRubricaDespesa'; ColumnCharWidth: 30),
      (Index: Campo_NFCedente_CedAbaterIRRF; Name: 'CedAbaterIRRF'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CedAbaterIRRF'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedAbaterIRRF'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_CedIRRFAcumulado; Name: 'CedIRRFAcumulado'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'CedIRRFAcumulado'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedIRRFAcumulado'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_NFCedente_CedAbaterRetidos; Name: 'CedAbaterRetidos'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CedAbaterRetidos'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedAbaterRetidos'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_AgeCodigo; Name: 'AgeCodigo'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'AgeCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'AgeCodigo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_CedMsgDocControle; Name: 'CedMsgDocControle'; FieldType: arftVarchar; Length: 5000; Nullable: True;
        Caption: 'CedMsgDocControle'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedMsgDocControle'; ColumnCharWidth: 5000),
      (Index: Campo_NFCedente_CedValorLimiteCreditoCheque; Name: 'CedValorLimiteCreditoCheque'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'CedValorLimiteCreditoCheque'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedValorLimiteCreditoCheque'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_NFCedente_CedValorLimiteCreditoDuplicata; Name: 'CedValorLimiteCreditoDuplicata'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'CedValorLimiteCreditoDuplicata'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedValorLimiteCreditoDuplicata'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_NFCedente_CedValorLimiteCreditoSacadoCheque; Name: 'CedValorLimiteCreditoSacadoCheque'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'CedValorLimiteCreditoSacadoCheque'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedValorLimiteCreditoSacadoCheque'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_NFCedente_CedValorLimiteCreditoSacadoDuplicata; Name: 'CedValorLimiteCreditoSacadoDuplicata'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'CedValorLimiteCreditoSacadoDuplicata'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedValorLimiteCreditoSacadoDuplicata'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_NFCedente_CedSacadorPadrao; Name: 'CedSacadorPadrao'; FieldType: arftVarchar; Length: 100; Nullable: True;
        Caption: 'CedSacadorPadrao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedSacadorPadrao'; ColumnCharWidth: 100),
      (Index: Campo_NFCedente_CCCCodigo; Name: 'CCCCodigo'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'CCCCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CCCCodigo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_CedTotalPendencias; Name: 'CedTotalPendencias'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'CedTotalPendencias'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedTotalPendencias'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_NFCedente_CedInstrucaoCobranca; Name: 'CedInstrucaoCobranca'; FieldType: arftVarchar; Length: 80; Nullable: True;
        Caption: 'CedInstrucaoCobranca'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedInstrucaoCobranca'; ColumnCharWidth: 80),
      (Index: Campo_NFCedente_CedEmiteBoleto; Name: 'CedEmiteBoleto'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CedEmiteBoleto'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedEmiteBoleto'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_CedDataConnstEmpresa; Name: 'CedDataConnstEmpresa'; FieldType: arftDateTime; Length: 0; Nullable: True;
        Caption: 'CedDataConnstEmpresa'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedDataConnstEmpresa'; ColumnCharWidth: ColumnCharWidthForDateTime),
      (Index: Campo_NFCedente_CedValorDoc; Name: 'CedValorDoc'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'CedValorDoc'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedValorDoc'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_NFCedente_CedValorTed; Name: 'CedValorTed'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'CedValorTed'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedValorTed'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_NFCedente_CedIncentIssqn; Name: 'CedIncentIssqn'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CedIncentIssqn'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedIncentIssqn'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_CedNaoCobraCpmf; Name: 'CedNaoCobraCpmf'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CedNaoCobraCpmf'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedNaoCobraCpmf'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_CedGerarTarifaAuto; Name: 'CedGerarTarifaAuto'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CedGerarTarifaAuto'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedGerarTarifaAuto'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_SCoCodigo; Name: 'SCoCodigo'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'SCoCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'SCoCodigo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_CedprazoAtrasoPonderado; Name: 'CedprazoAtrasoPonderado'; FieldType: arftFloat; Length: 0; Nullable: True;
        Caption: 'CedprazoAtrasoPonderado'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedprazoAtrasoPonderado'; ColumnCharWidth: ColumnCharWidthForFloat),
      (Index: Campo_NFCedente_CedRubricaContaGrafica; Name: 'CedRubricaContaGrafica'; FieldType: arftVarchar; Length: 30; Nullable: True;
        Caption: 'CedRubricaContaGrafica'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedRubricaContaGrafica'; ColumnCharWidth: 30),
      (Index: Campo_NFCedente_CGLHisCodigo; Name: 'CGLHisCodigo'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'CGLHisCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CGLHisCodigo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_CedEmailEnvioDocumento; Name: 'CedEmailEnvioDocumento'; FieldType: arftVarchar; Length: 150; Nullable: True;
        Caption: 'CedEmailEnvioDocumento'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedEmailEnvioDocumento'; ColumnCharWidth: 150),
      (Index: Campo_NFCedente_CedContadorNome; Name: 'CedContadorNome'; FieldType: arftVarchar; Length: 150; Nullable: True;
        Caption: 'CedContadorNome'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedContadorNome'; ColumnCharWidth: 150),
      (Index: Campo_NFCedente_CedContadorCRC; Name: 'CedContadorCRC'; FieldType: arftVarchar; Length: 20; Nullable: True;
        Caption: 'CedContadorCRC'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedContadorCRC'; ColumnCharWidth: 20),
      (Index: Campo_NFCedente_CedContadorCPF; Name: 'CedContadorCPF'; FieldType: arftVarchar; Length: 14; Nullable: True;
        Caption: 'CedContadorCPF'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedContadorCPF'; ColumnCharWidth: 14),
      (Index: Campo_NFCedente_CedSacadorPadraoCNPJCPF; Name: 'CedSacadorPadraoCNPJCPF'; FieldType: arftVarchar; Length: 14; Nullable: True;
        Caption: 'CedSacadorPadraoCNPJCPF'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedSacadorPadraoCNPJCPF'; ColumnCharWidth: 14),
      (Index: Campo_NFCedente_CedEmailEnvioEfetivacao; Name: 'CedEmailEnvioEfetivacao'; FieldType: arftVarchar; Length: 300; Nullable: True;
        Caption: 'CedEmailEnvioEfetivacao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedEmailEnvioEfetivacao'; ColumnCharWidth: 300),
      (Index: Campo_NFCedente_CedEnviarConsultaTitulosIntegracao; Name: 'CedEnviarConsultaTitulosIntegracao'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CedEnviarConsultaTitulosIntegracao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedEnviarConsultaTitulosIntegracao'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_DesconsideraCedOuvidoria; Name: 'DesconsideraCedOuvidoria'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'DesconsideraCedOuvidoria'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'DesconsideraCedOuvidoria'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_CedContato; Name: 'CedContato'; FieldType: arftVarchar; Length: 50; Nullable: True;
        Caption: 'CedContato'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedContato'; ColumnCharWidth: 50),
      (Index: Campo_NFCedente_CedPercComissao; Name: 'CedPercComissao'; FieldType: arftFloat; Length: 0; Nullable: True;
        Caption: 'CedPercComissao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedPercComissao'; ColumnCharWidth: ColumnCharWidthForFloat),
      (Index: Campo_NFCedente_CedClassificacao; Name: 'CedClassificacao'; FieldType: arftVarchar; Length: 30; Nullable: True;
        Caption: 'CedClassificacao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedClassificacao'; ColumnCharWidth: 30),
      (Index: Campo_NFCedente_CedDataInclusao; Name: 'CedDataInclusao'; FieldType: arftDateTime; Length: 0; Nullable: True;
        Caption: 'CedDataInclusao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedDataInclusao'; ColumnCharWidth: ColumnCharWidthForDateTime),
      (Index: Campo_NFCedente_CedUsuarioInclusao; Name: 'CedUsuarioInclusao'; FieldType: arftVarchar; Length: 250; Nullable: True;
        Caption: 'CedUsuarioInclusao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedUsuarioInclusao'; ColumnCharWidth: 250),
      (Index: Campo_NFCedente_CedCodime; Name: 'CedCodime'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CedCodime'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedCodime'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_CedLimiteControleSecuritizacaoValor; Name: 'CedLimiteControleSecuritizacaoValor'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'CedLimiteControleSecuritizacaoValor'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedLimiteControleSecuritizacaoValor'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_NFCedente_CedLimiteControleSecuritizacaoPeriodo; Name: 'CedLimiteControleSecuritizacaoPeriodo'; FieldType: arftVarchar; Length: 5; Nullable: True;
        Caption: 'CedLimiteControleSecuritizacaoPeriodo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedLimiteControleSecuritizacaoPeriodo'; ColumnCharWidth: 5),
      (Index: Campo_NFCedente_CedRecompraTaxaMulta; Name: 'CedRecompraTaxaMulta'; FieldType: arftFloat; Length: 0; Nullable: True;
        Caption: 'CedRecompraTaxaMulta'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedRecompraTaxaMulta'; ColumnCharWidth: ColumnCharWidthForFloat),
      (Index: Campo_NFCedente_CedContabilidadeContaTransferencia; Name: 'CedContabilidadeContaTransferencia'; FieldType: arftVarchar; Length: 20; Nullable: True;
        Caption: 'CedContabilidadeContaTransferencia'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedContabilidadeContaTransferencia'; ColumnCharWidth: 20),
      (Index: Campo_NFCedente_UsuarioUltimaAlteracao; Name: 'UsuarioUltimaAlteracao'; FieldType: arftVarchar; Length: 50; Nullable: False;
        Caption: 'UsuarioUltimaAlteracao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuarioUltimaAlteracao'; ColumnCharWidth: 50),
      (Index: Campo_NFCedente_AlteracaoViaCadastro; Name: 'AlteracaoViaCadastro'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'AlteracaoViaCadastro'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'AlteracaoViaCadastro'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorGerenciamento; Name: 'CedSerasaMonitoreValorSaldoDevedorGerenciamento'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'CedSerasaMonitoreValorSaldoDevedorGerenciamento'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedSerasaMonitoreValorSaldoDevedorGerenciamento'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_NFCedente_CedSerasaMonitorePrazo; Name: 'CedSerasaMonitorePrazo'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'CedSerasaMonitorePrazo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedSerasaMonitorePrazo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_CedSerasaGru_ID; Name: 'CedSerasaGru_ID'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'CedSerasaGru_ID'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedSerasaGru_ID'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_CedSerasaPer_ID; Name: 'CedSerasaPer_ID'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'CedSerasaPer_ID'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedSerasaPer_ID'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ; Name: 'CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCPF; Name: 'CedSerasaMonitoreValorSaldoDevedorSacadoCPF'; FieldType: arftMoney; Length: 0; Nullable: True;
        Caption: 'CedSerasaMonitoreValorSaldoDevedorSacadoCPF'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedSerasaMonitoreValorSaldoDevedorSacadoCPF'; ColumnCharWidth: ColumnCharWidthForMoney),
      (Index: Campo_NFCedente_CedPercentualMulta; Name: 'CedPercentualMulta'; FieldType: arftFloat; Length: 0; Nullable: True;
        Caption: 'CedPercentualMulta'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedPercentualMulta'; ColumnCharWidth: ColumnCharWidthForFloat),
      (Index: Campo_NFCedente_CedConsideraInstrucaoSegundaVia; Name: 'CedConsideraInstrucaoSegundaVia'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CedConsideraInstrucaoSegundaVia'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedConsideraInstrucaoSegundaVia'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_CedNaoProtetar; Name: 'CedNaoProtetar'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CedNaoProtetar'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedNaoProtetar'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_UsuLogin1; Name: 'UsuLogin1'; FieldType: arftVarchar; Length: 100; Nullable: True;
        Caption: 'UsuLogin1'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuLogin1'; ColumnCharWidth: 100),
      (Index: Campo_NFCedente_UsuLogin2; Name: 'UsuLogin2'; FieldType: arftVarchar; Length: 100; Nullable: True;
        Caption: 'UsuLogin2'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuLogin2'; ColumnCharWidth: 100),
      (Index: Campo_NFCedente_UsuLogin3; Name: 'UsuLogin3'; FieldType: arftVarchar; Length: 100; Nullable: True;
        Caption: 'UsuLogin3'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuLogin3'; ColumnCharWidth: 100),
      (Index: Campo_NFCedente_UsuLogin4; Name: 'UsuLogin4'; FieldType: arftVarchar; Length: 100; Nullable: True;
        Caption: 'UsuLogin4'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuLogin4'; ColumnCharWidth: 100),
      (Index: Campo_NFCedente_UsuLogin5; Name: 'UsuLogin5'; FieldType: arftVarchar; Length: 500; Nullable: True;
        Caption: 'UsuLogin5'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuLogin5'; ColumnCharWidth: 500),
      (Index: Campo_NFCedente_UsuAgenteChecagem; Name: 'UsuAgenteChecagem'; FieldType: arftVarchar; Length: 300; Nullable: True;
        Caption: 'UsuAgenteChecagem'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuAgenteChecagem'; ColumnCharWidth: 300),
      (Index: Campo_NFCedente_CedPriorizarPainelChecagem; Name: 'CedPriorizarPainelChecagem'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CedPriorizarPainelChecagem'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedPriorizarPainelChecagem'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_ConCodigo; Name: 'ConCodigo'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'ConCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'ConCodigo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_CedContabilidadeContaClientes; Name: 'CedContabilidadeContaClientes'; FieldType: arftVarchar; Length: 20; Nullable: True;
        Caption: 'CedContabilidadeContaClientes'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedContabilidadeContaClientes'; ColumnCharWidth: 20),
      (Index: Campo_NFCedente_CedContabilidadeContaFomento; Name: 'CedContabilidadeContaFomento'; FieldType: arftVarchar; Length: 20; Nullable: True;
        Caption: 'CedContabilidadeContaFomento'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedContabilidadeContaFomento'; ColumnCharWidth: 20),
      (Index: Campo_NFCedente_CedContabilidadeContaCtaGrafica; Name: 'CedContabilidadeContaCtaGrafica'; FieldType: arftVarchar; Length: 20; Nullable: True;
        Caption: 'CedContabilidadeContaCtaGrafica'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedContabilidadeContaCtaGrafica'; ColumnCharWidth: 20),
      (Index: Campo_NFCedente_CedContabilidadeContaConfissao; Name: 'CedContabilidadeContaConfissao'; FieldType: arftVarchar; Length: 20; Nullable: True;
        Caption: 'CedContabilidadeContaConfissao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedContabilidadeContaConfissao'; ColumnCharWidth: 20),
      (Index: Campo_NFCedente_Incluido; Name: 'Incluido'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'Incluido'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'Incluido'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_CedNaoEnviaPefin; Name: 'CedNaoEnviaPefin'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CedNaoEnviaPefin'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedNaoEnviaPefin'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_Cedgru_id; Name: 'Cedgru_id'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'Cedgru_id'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'Cedgru_id'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFCedente_POCCan; Name: 'POCCan'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'POCCan'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'POCCan'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFCedente_CnaeCodigo; Name: 'CnaeCodigo'; FieldType: arftVarchar; Length: 10; Nullable: True;
        Caption: 'CnaeCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CnaeCodigo'; ColumnCharWidth: 10),
      (Index: Campo_NFCedente_CedMensagemBoleto1; Name: 'CedMensagemBoleto1'; FieldType: arftVarchar; Length: 200; Nullable: True;
        Caption: 'CedMensagemBoleto1'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedMensagemBoleto1'; ColumnCharWidth: 200),
      (Index: Campo_NFCedente_CedMensagemBoleto2; Name: 'CedMensagemBoleto2'; FieldType: arftVarchar; Length: 200; Nullable: True;
        Caption: 'CedMensagemBoleto2'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedMensagemBoleto2'; ColumnCharWidth: 200),
      (Index: Campo_NFCedente_CedMensagemBoleto3; Name: 'CedMensagemBoleto3'; FieldType: arftVarchar; Length: 200; Nullable: True;
        Caption: 'CedMensagemBoleto3'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedMensagemBoleto3'; ColumnCharWidth: 200),
      (Index: Campo_NFCedente_CedMensagemBoleto4; Name: 'CedMensagemBoleto4'; FieldType: arftVarchar; Length: 200; Nullable: True;
        Caption: 'CedMensagemBoleto4'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedMensagemBoleto4'; ColumnCharWidth: 200),
      (Index: Campo_NFCedente_CedMensagemBoleto5; Name: 'CedMensagemBoleto5'; FieldType: arftVarchar; Length: 200; Nullable: True;
        Caption: 'CedMensagemBoleto5'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedMensagemBoleto5'; ColumnCharWidth: 200),
      (Index: Campo_NFCedente_CedEmiteBoletoComoCedenteBoleto; Name: 'CedEmiteBoletoComoCedenteBoleto'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CedEmiteBoletoComoCedenteBoleto'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CedEmiteBoletoComoCedenteBoleto'; ColumnCharWidth: ColumnCharWidthForB01)
    ));

implementation

type
  TARNFCedenteDelete = class(TActiveRecordSingletonADO)
  protected
    procedure DefineParameters; override;
    function GetCommandSQL: string; override;
  public
    procedure Persist(AARNFCedente: TARNFCedente);
  end;

  TARNFCedenteInsert = class(TActiveRecordSingletonADO)
  protected
    procedure DefineParameters; override;
    function GetCommandSQL: string; override;
  public
    procedure Persist(AARNFCedente: TARNFCedente);
  end;

  TARNFCedenteUpdate = class(TActiveRecordSingletonADO)
  protected
    procedure DefineParameters; override;
    function GetCommandSQL: string; override;
  public
    procedure Persist(AARNFCedente: TARNFCedente);
  end;

  TARNFCedenteMetadataObject = class(TInterfacedObject, IActiveRecordMetadata)
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
  GQueryFactoryByID: IActiveRecordQueryFactory;
  GARNFCedenteDeleteCriticalSection: TCriticalSection;
  GARNFCedenteInsertCriticalSection: TCriticalSection;
  GARNFCedenteUpdateCriticalSection: TCriticalSection;

{ TCollectionARNFCedente }

function TCollectionARNFCedente.Add(const Item: IARNFCedente): Integer;
begin
  Result := AddActiveRecord(Item);
end;

function TCollectionARNFCedente.First: IARNFCedente;
begin
  Result := nil;
  if Count > 0 then
    Result := GetItem(0);
end;

function TCollectionARNFCedente.GetItem(Index: Integer): IARNFCedente;
begin
  Result := List[Index] as IARNFCedente;
end;

procedure TCollectionARNFCedente.Insert(Index: Integer; const Item: IARNFCedente);
begin
  List.Insert(Index, Item);
end;

function TCollectionARNFCedente.Last: IARNFCedente;
begin
  Result := nil;
  if Count > 0 then
    Result := GetItem(Count - 1);
end;

function TCollectionARNFCedente.New(const AConnection: IActiveRecordConnection): IARNFCedente;
begin
  Result := ClassActiveRecord.Create(AConnection) as IARNFCedente;
  Add(Result);
end;

{ TIteratorARNFCedenteDecorator }

function TIteratorARNFCedenteDecorator.CurrentItem: IARNFCedente;
begin
  Result := CurrentItemActiveRecord as IARNFCedente;
end;

class function TIteratorARNFCedenteDecorator.Decore(const ACollectionARNFCedente: ICollectionARNFCedente): IIteratorARNFCedente;
begin
  Result := Create(ACollectionARNFCedente);
end;

{ TIteratorARNFCedenteQueryDecorator }

function TIteratorARNFCedenteQueryDecorator.CurrentItem: IARNFCedente;
begin
  Result := CurrentItemActiveRecord as IARNFCedente;
end;

class function TIteratorARNFCedenteQueryDecorator.Decore(const AARNFCedenteQuery: IActiveRecordQuery): IIteratorARNFCedente;
begin
  Result := Create(AARNFCedenteQuery);
end;

{ TARNFCedente }

procedure TARNFCedente.Clear(Index: Integer);
begin
  case Index of
    Campo_NFCedente_IDGCodigo: SetIDGCodigo(NullString);
    Campo_NFCedente_CedContratoNumero: SetCedContratoNumero(NullInteger);
    Campo_NFCedente_CedContratoData: SetCedContratoData(NullDateTime);
    Campo_NFCedente_CedFomentoSaldoDevedor: SetCedFomentoSaldoDevedor(NullCurrency);
    Campo_NFCedente_CedObservacao: SetCedObservacao(NullString);
    Campo_NFCedente_FilFiltro: SetFilFiltro(NullString);
    Campo_NFCedente_CedSimples: SetCedSimples(NullBoolean);
    Campo_NFCedente_HisCodigo: SetHisCodigo(NullInteger);
    Campo_NFCedente_CedRubricaOperacaoAtivo: SetCedRubricaOperacaoAtivo(NullString);
    Campo_NFCedente_CedRubricaOperacaoCobranca: SetCedRubricaOperacaoCobranca(NullString);
    Campo_NFCedente_CedRubricaOperacaoCaucao: SetCedRubricaOperacaoCaucao(NullString);
    Campo_NFCedente_CedRubricaPassivo: SetCedRubricaPassivo(NullString);
    Campo_NFCedente_CedRubricaDespesa: SetCedRubricaDespesa(NullString);
    Campo_NFCedente_CedAbaterIRRF: SetCedAbaterIRRF(NullBoolean);
    Campo_NFCedente_CedIRRFAcumulado: SetCedIRRFAcumulado(NullCurrency);
    Campo_NFCedente_CedAbaterRetidos: SetCedAbaterRetidos(NullBoolean);
    Campo_NFCedente_AgeCodigo: SetAgeCodigo(NullInteger);
    Campo_NFCedente_CedMsgDocControle: SetCedMsgDocControle(NullString);
    Campo_NFCedente_CedValorLimiteCreditoCheque: SetCedValorLimiteCreditoCheque(NullCurrency);
    Campo_NFCedente_CedValorLimiteCreditoDuplicata: SetCedValorLimiteCreditoDuplicata(NullCurrency);
    Campo_NFCedente_CedValorLimiteCreditoSacadoCheque: SetCedValorLimiteCreditoSacadoCheque(NullCurrency);
    Campo_NFCedente_CedValorLimiteCreditoSacadoDuplicata: SetCedValorLimiteCreditoSacadoDuplicata(NullCurrency);
    Campo_NFCedente_CedSacadorPadrao: SetCedSacadorPadrao(NullString);
    Campo_NFCedente_CCCCodigo: SetCCCCodigo(NullInteger);
    Campo_NFCedente_CedTotalPendencias: SetCedTotalPendencias(NullCurrency);
    Campo_NFCedente_CedInstrucaoCobranca: SetCedInstrucaoCobranca(NullString);
    Campo_NFCedente_CedEmiteBoleto: SetCedEmiteBoleto(NullBoolean);
    Campo_NFCedente_CedDataConnstEmpresa: SetCedDataConnstEmpresa(NullDateTime);
    Campo_NFCedente_CedValorDoc: SetCedValorDoc(NullCurrency);
    Campo_NFCedente_CedValorTed: SetCedValorTed(NullCurrency);
    Campo_NFCedente_CedIncentIssqn: SetCedIncentIssqn(NullBoolean);
    Campo_NFCedente_CedNaoCobraCpmf: SetCedNaoCobraCpmf(NullBoolean);
    Campo_NFCedente_CedGerarTarifaAuto: SetCedGerarTarifaAuto(NullBoolean);
    Campo_NFCedente_SCoCodigo: SetSCoCodigo(NullInteger);
    Campo_NFCedente_CedprazoAtrasoPonderado: SetCedprazoAtrasoPonderado(NullExtended);
    Campo_NFCedente_CedRubricaContaGrafica: SetCedRubricaContaGrafica(NullString);
    Campo_NFCedente_CGLHisCodigo: SetCGLHisCodigo(NullInteger);
    Campo_NFCedente_CedEmailEnvioDocumento: SetCedEmailEnvioDocumento(NullString);
    Campo_NFCedente_CedContadorNome: SetCedContadorNome(NullString);
    Campo_NFCedente_CedContadorCRC: SetCedContadorCRC(NullString);
    Campo_NFCedente_CedContadorCPF: SetCedContadorCPF(NullString);
    Campo_NFCedente_CedSacadorPadraoCNPJCPF: SetCedSacadorPadraoCNPJCPF(NullString);
    Campo_NFCedente_CedEmailEnvioEfetivacao: SetCedEmailEnvioEfetivacao(NullString);
    Campo_NFCedente_CedEnviarConsultaTitulosIntegracao: SetCedEnviarConsultaTitulosIntegracao(NullBoolean);
    Campo_NFCedente_DesconsideraCedOuvidoria: SetDesconsideraCedOuvidoria(NullBoolean);
    Campo_NFCedente_CedContato: SetCedContato(NullString);
    Campo_NFCedente_CedPercComissao: SetCedPercComissao(NullExtended);
    Campo_NFCedente_CedClassificacao: SetCedClassificacao(NullString);
    Campo_NFCedente_CedDataInclusao: SetCedDataInclusao(NullDateTime);
    Campo_NFCedente_CedUsuarioInclusao: SetCedUsuarioInclusao(NullString);
    Campo_NFCedente_CedCodime: SetCedCodime(NullBoolean);
    Campo_NFCedente_CedLimiteControleSecuritizacaoValor: SetCedLimiteControleSecuritizacaoValor(NullCurrency);
    Campo_NFCedente_CedLimiteControleSecuritizacaoPeriodo: SetCedLimiteControleSecuritizacaoPeriodo(NullString);
    Campo_NFCedente_CedRecompraTaxaMulta: SetCedRecompraTaxaMulta(NullExtended);
    Campo_NFCedente_CedContabilidadeContaTransferencia: SetCedContabilidadeContaTransferencia(NullString);
    Campo_NFCedente_AlteracaoViaCadastro: SetAlteracaoViaCadastro(NullBoolean);
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorGerenciamento: SetCedSerasaMonitoreValorSaldoDevedorGerenciamento(NullCurrency);
    Campo_NFCedente_CedSerasaMonitorePrazo: SetCedSerasaMonitorePrazo(NullInteger);
    Campo_NFCedente_CedSerasaGru_ID: SetCedSerasaGru_ID(NullInteger);
    Campo_NFCedente_CedSerasaPer_ID: SetCedSerasaPer_ID(NullInteger);
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ: SetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ(NullCurrency);
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCPF: SetCedSerasaMonitoreValorSaldoDevedorSacadoCPF(NullCurrency);
    Campo_NFCedente_CedPercentualMulta: SetCedPercentualMulta(NullExtended);
    Campo_NFCedente_CedConsideraInstrucaoSegundaVia: SetCedConsideraInstrucaoSegundaVia(NullBoolean);
    Campo_NFCedente_CedNaoProtetar: SetCedNaoProtetar(NullBoolean);
    Campo_NFCedente_UsuLogin1: SetUsuLogin1(NullString);
    Campo_NFCedente_UsuLogin2: SetUsuLogin2(NullString);
    Campo_NFCedente_UsuLogin3: SetUsuLogin3(NullString);
    Campo_NFCedente_UsuLogin4: SetUsuLogin4(NullString);
    Campo_NFCedente_UsuLogin5: SetUsuLogin5(NullString);
    Campo_NFCedente_UsuAgenteChecagem: SetUsuAgenteChecagem(NullString);
    Campo_NFCedente_CedPriorizarPainelChecagem: SetCedPriorizarPainelChecagem(NullBoolean);
    Campo_NFCedente_ConCodigo: SetConCodigo(NullInteger);
    Campo_NFCedente_CedContabilidadeContaClientes: SetCedContabilidadeContaClientes(NullString);
    Campo_NFCedente_CedContabilidadeContaFomento: SetCedContabilidadeContaFomento(NullString);
    Campo_NFCedente_CedContabilidadeContaCtaGrafica: SetCedContabilidadeContaCtaGrafica(NullString);
    Campo_NFCedente_CedContabilidadeContaConfissao: SetCedContabilidadeContaConfissao(NullString);
    Campo_NFCedente_Incluido: SetIncluido(NullInteger);
    Campo_NFCedente_CedNaoEnviaPefin: SetCedNaoEnviaPefin(NullBoolean);
    Campo_NFCedente_Cedgru_id: SetCedgru_id(NullInteger);
    Campo_NFCedente_POCCan: SetPOCCan(NullBoolean);
    Campo_NFCedente_CnaeCodigo: SetCnaeCodigo(NullString);
    Campo_NFCedente_CedMensagemBoleto1: SetCedMensagemBoleto1(NullString);
    Campo_NFCedente_CedMensagemBoleto2: SetCedMensagemBoleto2(NullString);
    Campo_NFCedente_CedMensagemBoleto3: SetCedMensagemBoleto3(NullString);
    Campo_NFCedente_CedMensagemBoleto4: SetCedMensagemBoleto4(NullString);
    Campo_NFCedente_CedMensagemBoleto5: SetCedMensagemBoleto5(NullString);
    Campo_NFCedente_CedEmiteBoletoComoCedenteBoleto: SetCedEmiteBoletoComoCedenteBoleto(NullBoolean);
  else
    inherited;
  end;
end;

procedure TARNFCedente.CopyFrom(AActiveRecord: TActiveRecord);
var
  LARNFCedente: TARNFCedente;
begin
  inherited;
  LARNFCedente := AActiveRecord as TARNFCedente;
  FID := LARNFCedente.FID;
  FCedCodigo := LARNFCedente.FCedCodigo;
  FPesCNPJCPF := LARNFCedente.FPesCNPJCPF;
  FIDGCodigo := LARNFCedente.FIDGCodigo;
  FCedContratoNumero := LARNFCedente.FCedContratoNumero;
  FCedContratoData := LARNFCedente.FCedContratoData;
  FCedFomentoSaldoDevedor := LARNFCedente.FCedFomentoSaldoDevedor;
  FEmpCodigo := LARNFCedente.FEmpCodigo;
  FCedObservacao := LARNFCedente.FCedObservacao;
  FFilFiltro := LARNFCedente.FFilFiltro;
  FCedSimples := LARNFCedente.FCedSimples;
  FHisCodigo := LARNFCedente.FHisCodigo;
  FCedRubricaOperacaoAtivo := LARNFCedente.FCedRubricaOperacaoAtivo;
  FCedRubricaOperacaoCobranca := LARNFCedente.FCedRubricaOperacaoCobranca;
  FCedRubricaOperacaoCaucao := LARNFCedente.FCedRubricaOperacaoCaucao;
  FCedRubricaPassivo := LARNFCedente.FCedRubricaPassivo;
  FCedRubricaDespesa := LARNFCedente.FCedRubricaDespesa;
  FCedAbaterIRRF := LARNFCedente.FCedAbaterIRRF;
  FCedIRRFAcumulado := LARNFCedente.FCedIRRFAcumulado;
  FCedAbaterRetidos := LARNFCedente.FCedAbaterRetidos;
  FAgeCodigo := LARNFCedente.FAgeCodigo;
  FCedMsgDocControle := LARNFCedente.FCedMsgDocControle;
  FCedValorLimiteCreditoCheque := LARNFCedente.FCedValorLimiteCreditoCheque;
  FCedValorLimiteCreditoDuplicata := LARNFCedente.FCedValorLimiteCreditoDuplicata;
  FCedValorLimiteCreditoSacadoCheque := LARNFCedente.FCedValorLimiteCreditoSacadoCheque;
  FCedValorLimiteCreditoSacadoDuplicata := LARNFCedente.FCedValorLimiteCreditoSacadoDuplicata;
  FCedSacadorPadrao := LARNFCedente.FCedSacadorPadrao;
  FCCCCodigo := LARNFCedente.FCCCCodigo;
  FCedTotalPendencias := LARNFCedente.FCedTotalPendencias;
  FCedInstrucaoCobranca := LARNFCedente.FCedInstrucaoCobranca;
  FCedEmiteBoleto := LARNFCedente.FCedEmiteBoleto;
  FCedDataConnstEmpresa := LARNFCedente.FCedDataConnstEmpresa;
  FCedValorDoc := LARNFCedente.FCedValorDoc;
  FCedValorTed := LARNFCedente.FCedValorTed;
  FCedIncentIssqn := LARNFCedente.FCedIncentIssqn;
  FCedNaoCobraCpmf := LARNFCedente.FCedNaoCobraCpmf;
  FCedGerarTarifaAuto := LARNFCedente.FCedGerarTarifaAuto;
  FSCoCodigo := LARNFCedente.FSCoCodigo;
  FCedprazoAtrasoPonderado := LARNFCedente.FCedprazoAtrasoPonderado;
  FCedRubricaContaGrafica := LARNFCedente.FCedRubricaContaGrafica;
  FCGLHisCodigo := LARNFCedente.FCGLHisCodigo;
  FCedEmailEnvioDocumento := LARNFCedente.FCedEmailEnvioDocumento;
  FCedContadorNome := LARNFCedente.FCedContadorNome;
  FCedContadorCRC := LARNFCedente.FCedContadorCRC;
  FCedContadorCPF := LARNFCedente.FCedContadorCPF;
  FCedSacadorPadraoCNPJCPF := LARNFCedente.FCedSacadorPadraoCNPJCPF;
  FCedEmailEnvioEfetivacao := LARNFCedente.FCedEmailEnvioEfetivacao;
  FCedEnviarConsultaTitulosIntegracao := LARNFCedente.FCedEnviarConsultaTitulosIntegracao;
  FDesconsideraCedOuvidoria := LARNFCedente.FDesconsideraCedOuvidoria;
  FCedContato := LARNFCedente.FCedContato;
  FCedPercComissao := LARNFCedente.FCedPercComissao;
  FCedClassificacao := LARNFCedente.FCedClassificacao;
  FCedDataInclusao := LARNFCedente.FCedDataInclusao;
  FCedUsuarioInclusao := LARNFCedente.FCedUsuarioInclusao;
  FCedCodime := LARNFCedente.FCedCodime;
  FCedLimiteControleSecuritizacaoValor := LARNFCedente.FCedLimiteControleSecuritizacaoValor;
  FCedLimiteControleSecuritizacaoPeriodo := LARNFCedente.FCedLimiteControleSecuritizacaoPeriodo;
  FCedRecompraTaxaMulta := LARNFCedente.FCedRecompraTaxaMulta;
  FCedContabilidadeContaTransferencia := LARNFCedente.FCedContabilidadeContaTransferencia;
  FUsuarioUltimaAlteracao := LARNFCedente.FUsuarioUltimaAlteracao;
  FAlteracaoViaCadastro := LARNFCedente.FAlteracaoViaCadastro;
  FCedSerasaMonitoreValorSaldoDevedorGerenciamento := LARNFCedente.FCedSerasaMonitoreValorSaldoDevedorGerenciamento;
  FCedSerasaMonitorePrazo := LARNFCedente.FCedSerasaMonitorePrazo;
  FCedSerasaGru_ID := LARNFCedente.FCedSerasaGru_ID;
  FCedSerasaPer_ID := LARNFCedente.FCedSerasaPer_ID;
  FCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ := LARNFCedente.FCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ;
  FCedSerasaMonitoreValorSaldoDevedorSacadoCPF := LARNFCedente.FCedSerasaMonitoreValorSaldoDevedorSacadoCPF;
  FCedPercentualMulta := LARNFCedente.FCedPercentualMulta;
  FCedConsideraInstrucaoSegundaVia := LARNFCedente.FCedConsideraInstrucaoSegundaVia;
  FCedNaoProtetar := LARNFCedente.FCedNaoProtetar;
  FUsuLogin1 := LARNFCedente.FUsuLogin1;
  FUsuLogin2 := LARNFCedente.FUsuLogin2;
  FUsuLogin3 := LARNFCedente.FUsuLogin3;
  FUsuLogin4 := LARNFCedente.FUsuLogin4;
  FUsuLogin5 := LARNFCedente.FUsuLogin5;
  FUsuAgenteChecagem := LARNFCedente.FUsuAgenteChecagem;
  FCedPriorizarPainelChecagem := LARNFCedente.FCedPriorizarPainelChecagem;
  FConCodigo := LARNFCedente.FConCodigo;
  FCedContabilidadeContaClientes := LARNFCedente.FCedContabilidadeContaClientes;
  FCedContabilidadeContaFomento := LARNFCedente.FCedContabilidadeContaFomento;
  FCedContabilidadeContaCtaGrafica := LARNFCedente.FCedContabilidadeContaCtaGrafica;
  FCedContabilidadeContaConfissao := LARNFCedente.FCedContabilidadeContaConfissao;
  FIncluido := LARNFCedente.FIncluido;
  FCedNaoEnviaPefin := LARNFCedente.FCedNaoEnviaPefin;
  FCedgru_id := LARNFCedente.FCedgru_id;
  FPOCCan := LARNFCedente.FPOCCan;
  FCnaeCodigo := LARNFCedente.FCnaeCodigo;
  FCedMensagemBoleto1 := LARNFCedente.FCedMensagemBoleto1;
  FCedMensagemBoleto2 := LARNFCedente.FCedMensagemBoleto2;
  FCedMensagemBoleto3 := LARNFCedente.FCedMensagemBoleto3;
  FCedMensagemBoleto4 := LARNFCedente.FCedMensagemBoleto4;
  FCedMensagemBoleto5 := LARNFCedente.FCedMensagemBoleto5;
  FCedEmiteBoletoComoCedenteBoleto := LARNFCedente.FCedEmiteBoletoComoCedenteBoleto;
end;

constructor TARNFCedente.Create(const AConnection: IActiveRecordConnection);
begin
  inherited;
  FIDGCodigo := NullString;
  FCedContratoNumero := NullInteger;
  FCedContratoData := NullDateTime;
  FCedFomentoSaldoDevedor := NullCurrency;
  FCedObservacao := NullString;
  FFilFiltro := NullString;
  FCedSimples := NullBoolean;
  FHisCodigo := NullInteger;
  FCedRubricaOperacaoAtivo := NullString;
  FCedRubricaOperacaoCobranca := NullString;
  FCedRubricaOperacaoCaucao := NullString;
  FCedRubricaPassivo := NullString;
  FCedRubricaDespesa := NullString;
  FCedAbaterIRRF := NullBoolean;
  FCedIRRFAcumulado := NullCurrency;
  FCedAbaterRetidos := NullBoolean;
  FAgeCodigo := NullInteger;
  FCedMsgDocControle := NullString;
  FCedValorLimiteCreditoCheque := NullCurrency;
  FCedValorLimiteCreditoDuplicata := NullCurrency;
  FCedValorLimiteCreditoSacadoCheque := NullCurrency;
  FCedValorLimiteCreditoSacadoDuplicata := NullCurrency;
  FCedSacadorPadrao := NullString;
  FCCCCodigo := NullInteger;
  FCedTotalPendencias := NullCurrency;
  FCedInstrucaoCobranca := NullString;
  FCedEmiteBoleto := NullBoolean;
  FCedDataConnstEmpresa := NullDateTime;
  FCedValorDoc := NullCurrency;
  FCedValorTed := NullCurrency;
  FCedIncentIssqn := NullBoolean;
  FCedNaoCobraCpmf := NullBoolean;
  FCedGerarTarifaAuto := NullBoolean;
  FSCoCodigo := NullInteger;
  FCedprazoAtrasoPonderado := NullExtended;
  FCedRubricaContaGrafica := NullString;
  FCGLHisCodigo := NullInteger;
  FCedEmailEnvioDocumento := NullString;
  FCedContadorNome := NullString;
  FCedContadorCRC := NullString;
  FCedContadorCPF := NullString;
  FCedSacadorPadraoCNPJCPF := NullString;
  FCedEmailEnvioEfetivacao := NullString;
  FCedEnviarConsultaTitulosIntegracao := NullBoolean;
  FDesconsideraCedOuvidoria := NullBoolean;
  FCedContato := NullString;
  FCedPercComissao := NullExtended;
  FCedClassificacao := NullString;
  FCedDataInclusao := NullDateTime;
  FCedUsuarioInclusao := NullString;
  FCedCodime := NullBoolean;
  FCedLimiteControleSecuritizacaoValor := NullCurrency;
  FCedLimiteControleSecuritizacaoPeriodo := NullString;
  FCedRecompraTaxaMulta := NullExtended;
  FCedContabilidadeContaTransferencia := NullString;
  FAlteracaoViaCadastro := NullBoolean;
  FCedSerasaMonitoreValorSaldoDevedorGerenciamento := NullCurrency;
  FCedSerasaMonitorePrazo := NullInteger;
  FCedSerasaGru_ID := NullInteger;
  FCedSerasaPer_ID := NullInteger;
  FCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ := NullCurrency;
  FCedSerasaMonitoreValorSaldoDevedorSacadoCPF := NullCurrency;
  FCedPercentualMulta := NullExtended;
  FCedConsideraInstrucaoSegundaVia := NullBoolean;
  FCedNaoProtetar := NullBoolean;
  FUsuLogin1 := NullString;
  FUsuLogin2 := NullString;
  FUsuLogin3 := NullString;
  FUsuLogin4 := NullString;
  FUsuLogin5 := NullString;
  FUsuAgenteChecagem := NullString;
  FCedPriorizarPainelChecagem := NullBoolean;
  FConCodigo := NullInteger;
  FCedContabilidadeContaClientes := NullString;
  FCedContabilidadeContaFomento := NullString;
  FCedContabilidadeContaCtaGrafica := NullString;
  FCedContabilidadeContaConfissao := NullString;
  FIncluido := NullInteger;
  FCedNaoEnviaPefin := NullBoolean;
  FCedgru_id := NullInteger;
  FPOCCan := NullBoolean;
  FCnaeCodigo := NullString;
  FCedMensagemBoleto1 := NullString;
  FCedMensagemBoleto2 := NullString;
  FCedMensagemBoleto3 := NullString;
  FCedMensagemBoleto4 := NullString;
  FCedMensagemBoleto5 := NullString;
  FCedEmiteBoletoComoCedenteBoleto := NullBoolean;
end;

function TARNFCedente.CreateItemRelationship(Index: Integer): TActiveRecord;
begin
  Result := nil;
end;

function TARNFCedente.DisplayText(Index: Integer): string;
begin
  case Index of
    Campo_NFCedente_CedFomentoSaldoDevedor: Result := NullOrString(GetCedFomentoSaldoDevedor.Null, FormatFloat(',0.00', GetCedFomentoSaldoDevedor.Value));
    Campo_NFCedente_CedSimples: Result := NullOrString(GetCedSimples.Null, NaoSim[GetCedSimples.Value]);
    Campo_NFCedente_CedAbaterIRRF: Result := NullOrString(GetCedAbaterIRRF.Null, NaoSim[GetCedAbaterIRRF.Value]);
    Campo_NFCedente_CedIRRFAcumulado: Result := NullOrString(GetCedIRRFAcumulado.Null, FormatFloat(',0.00', GetCedIRRFAcumulado.Value));
    Campo_NFCedente_CedAbaterRetidos: Result := NullOrString(GetCedAbaterRetidos.Null, NaoSim[GetCedAbaterRetidos.Value]);
    Campo_NFCedente_CedValorLimiteCreditoCheque: Result := NullOrString(GetCedValorLimiteCreditoCheque.Null, FormatFloat(',0.00', GetCedValorLimiteCreditoCheque.Value));
    Campo_NFCedente_CedValorLimiteCreditoDuplicata: Result := NullOrString(GetCedValorLimiteCreditoDuplicata.Null, FormatFloat(',0.00', GetCedValorLimiteCreditoDuplicata.Value));
    Campo_NFCedente_CedValorLimiteCreditoSacadoCheque: Result := NullOrString(GetCedValorLimiteCreditoSacadoCheque.Null, FormatFloat(',0.00', GetCedValorLimiteCreditoSacadoCheque.Value));
    Campo_NFCedente_CedValorLimiteCreditoSacadoDuplicata: Result := NullOrString(GetCedValorLimiteCreditoSacadoDuplicata.Null, FormatFloat(',0.00', GetCedValorLimiteCreditoSacadoDuplicata.Value));
    Campo_NFCedente_CedTotalPendencias: Result := NullOrString(GetCedTotalPendencias.Null, FormatFloat(',0.00', GetCedTotalPendencias.Value));
    Campo_NFCedente_CedEmiteBoleto: Result := NullOrString(GetCedEmiteBoleto.Null, NaoSim[GetCedEmiteBoleto.Value]);
    Campo_NFCedente_CedValorDoc: Result := NullOrString(GetCedValorDoc.Null, FormatFloat(',0.00', GetCedValorDoc.Value));
    Campo_NFCedente_CedValorTed: Result := NullOrString(GetCedValorTed.Null, FormatFloat(',0.00', GetCedValorTed.Value));
    Campo_NFCedente_CedIncentIssqn: Result := NullOrString(GetCedIncentIssqn.Null, NaoSim[GetCedIncentIssqn.Value]);
    Campo_NFCedente_CedNaoCobraCpmf: Result := NullOrString(GetCedNaoCobraCpmf.Null, NaoSim[GetCedNaoCobraCpmf.Value]);
    Campo_NFCedente_CedGerarTarifaAuto: Result := NullOrString(GetCedGerarTarifaAuto.Null, NaoSim[GetCedGerarTarifaAuto.Value]);
    Campo_NFCedente_CedEnviarConsultaTitulosIntegracao: Result := NullOrString(GetCedEnviarConsultaTitulosIntegracao.Null, NaoSim[GetCedEnviarConsultaTitulosIntegracao.Value]);
    Campo_NFCedente_DesconsideraCedOuvidoria: Result := NullOrString(GetDesconsideraCedOuvidoria.Null, NaoSim[GetDesconsideraCedOuvidoria.Value]);
    Campo_NFCedente_CedCodime: Result := NullOrString(GetCedCodime.Null, NaoSim[GetCedCodime.Value]);
    Campo_NFCedente_CedLimiteControleSecuritizacaoValor: Result := NullOrString(GetCedLimiteControleSecuritizacaoValor.Null, FormatFloat(',0.00', GetCedLimiteControleSecuritizacaoValor.Value));
    Campo_NFCedente_AlteracaoViaCadastro: Result := NullOrString(GetAlteracaoViaCadastro.Null, NaoSim[GetAlteracaoViaCadastro.Value]);
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorGerenciamento: Result := NullOrString(GetCedSerasaMonitoreValorSaldoDevedorGerenciamento.Null, FormatFloat(',0.00', GetCedSerasaMonitoreValorSaldoDevedorGerenciamento.Value));
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ: Result := NullOrString(GetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ.Null, FormatFloat(',0.00', GetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ.Value));
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCPF: Result := NullOrString(GetCedSerasaMonitoreValorSaldoDevedorSacadoCPF.Null, FormatFloat(',0.00', GetCedSerasaMonitoreValorSaldoDevedorSacadoCPF.Value));
    Campo_NFCedente_CedConsideraInstrucaoSegundaVia: Result := NullOrString(GetCedConsideraInstrucaoSegundaVia.Null, NaoSim[GetCedConsideraInstrucaoSegundaVia.Value]);
    Campo_NFCedente_CedNaoProtetar: Result := NullOrString(GetCedNaoProtetar.Null, NaoSim[GetCedNaoProtetar.Value]);
    Campo_NFCedente_CedPriorizarPainelChecagem: Result := NullOrString(GetCedPriorizarPainelChecagem.Null, NaoSim[GetCedPriorizarPainelChecagem.Value]);
    Campo_NFCedente_CedNaoEnviaPefin: Result := NullOrString(GetCedNaoEnviaPefin.Null, NaoSim[GetCedNaoEnviaPefin.Value]);
    Campo_NFCedente_POCCan: Result := NullOrString(GetPOCCan.Null, NaoSim[GetPOCCan.Value]);
    Campo_NFCedente_CedEmiteBoletoComoCedenteBoleto: Result := NullOrString(GetCedEmiteBoletoComoCedenteBoleto.Null, NaoSim[GetCedEmiteBoletoComoCedenteBoleto.Value]);
  else
    Result := inherited DisplayText(Index);
  end;
end;

class function TARNFCedente.QueryByID(const AID: Integer; const AConnection: IActiveRecordConnection): IActiveRecordQuery;
begin
  Result := GQueryFactoryByID.CreateQuery(AConnection, Self);
  Result.SetNextParameter(AID);
end;

class function TARNFCedente.FindByID(const AID: Integer; const AConnection: IActiveRecordConnection): IARNFCedente;
begin
  Result := QueryByID(AID, AConnection).FirstActiveRecord as IARNFCedente;
end;

function TARNFCedente.GetID: Integer;
begin
  Result := FID;
end;

function TARNFCedente.GetCedCodigo: Integer;
begin
  Result := FCedCodigo;
end;

function TARNFCedente.GetPesCNPJCPF: string;
begin
  Result := FPesCNPJCPF;
end;

function TARNFCedente.GetIDGCodigo: TNullableString;
begin
  Result := FIDGCodigo;
end;

function TARNFCedente.GetCedContratoNumero: TNullableInteger;
begin
  Result := FCedContratoNumero;
end;

function TARNFCedente.GetCedContratoData: TNullableDateTime;
begin
  Result := FCedContratoData;
end;

function TARNFCedente.GetCedFomentoSaldoDevedor: TNullableCurrency;
begin
  Result := FCedFomentoSaldoDevedor;
end;

function TARNFCedente.GetEmpCodigo: Integer;
begin
  Result := FEmpCodigo;
end;

function TARNFCedente.GetCedObservacao: TNullableString;
begin
  Result := FCedObservacao;
end;

function TARNFCedente.GetFilFiltro: TNullableString;
begin
  Result := FFilFiltro;
end;

function TARNFCedente.GetCedSimples: TNullableBoolean;
begin
  Result := FCedSimples;
end;

function TARNFCedente.GetHisCodigo: TNullableInteger;
begin
  Result := FHisCodigo;
end;

function TARNFCedente.GetCedRubricaOperacaoAtivo: TNullableString;
begin
  Result := FCedRubricaOperacaoAtivo;
end;

function TARNFCedente.GetCedRubricaOperacaoCobranca: TNullableString;
begin
  Result := FCedRubricaOperacaoCobranca;
end;

function TARNFCedente.GetCedRubricaOperacaoCaucao: TNullableString;
begin
  Result := FCedRubricaOperacaoCaucao;
end;

function TARNFCedente.GetCedRubricaPassivo: TNullableString;
begin
  Result := FCedRubricaPassivo;
end;

function TARNFCedente.GetCedRubricaDespesa: TNullableString;
begin
  Result := FCedRubricaDespesa;
end;

function TARNFCedente.GetCedAbaterIRRF: TNullableBoolean;
begin
  Result := FCedAbaterIRRF;
end;

function TARNFCedente.GetCedIRRFAcumulado: TNullableCurrency;
begin
  Result := FCedIRRFAcumulado;
end;

function TARNFCedente.GetCedAbaterRetidos: TNullableBoolean;
begin
  Result := FCedAbaterRetidos;
end;

function TARNFCedente.GetAgeCodigo: TNullableInteger;
begin
  Result := FAgeCodigo;
end;

function TARNFCedente.GetCedMsgDocControle: TNullableString;
begin
  Result := FCedMsgDocControle;
end;

function TARNFCedente.GetCedValorLimiteCreditoCheque: TNullableCurrency;
begin
  Result := FCedValorLimiteCreditoCheque;
end;

function TARNFCedente.GetCedValorLimiteCreditoDuplicata: TNullableCurrency;
begin
  Result := FCedValorLimiteCreditoDuplicata;
end;

function TARNFCedente.GetCedValorLimiteCreditoSacadoCheque: TNullableCurrency;
begin
  Result := FCedValorLimiteCreditoSacadoCheque;
end;

function TARNFCedente.GetCedValorLimiteCreditoSacadoDuplicata: TNullableCurrency;
begin
  Result := FCedValorLimiteCreditoSacadoDuplicata;
end;

function TARNFCedente.GetCedSacadorPadrao: TNullableString;
begin
  Result := FCedSacadorPadrao;
end;

function TARNFCedente.GetCCCCodigo: TNullableInteger;
begin
  Result := FCCCCodigo;
end;

function TARNFCedente.GetCedTotalPendencias: TNullableCurrency;
begin
  Result := FCedTotalPendencias;
end;

function TARNFCedente.GetCedInstrucaoCobranca: TNullableString;
begin
  Result := FCedInstrucaoCobranca;
end;

function TARNFCedente.GetCedEmiteBoleto: TNullableBoolean;
begin
  Result := FCedEmiteBoleto;
end;

function TARNFCedente.GetCedDataConnstEmpresa: TNullableDateTime;
begin
  Result := FCedDataConnstEmpresa;
end;

function TARNFCedente.GetCedValorDoc: TNullableCurrency;
begin
  Result := FCedValorDoc;
end;

function TARNFCedente.GetCedValorTed: TNullableCurrency;
begin
  Result := FCedValorTed;
end;

function TARNFCedente.GetCedIncentIssqn: TNullableBoolean;
begin
  Result := FCedIncentIssqn;
end;

function TARNFCedente.GetCedNaoCobraCpmf: TNullableBoolean;
begin
  Result := FCedNaoCobraCpmf;
end;

function TARNFCedente.GetCedGerarTarifaAuto: TNullableBoolean;
begin
  Result := FCedGerarTarifaAuto;
end;

function TARNFCedente.GetSCoCodigo: TNullableInteger;
begin
  Result := FSCoCodigo;
end;

function TARNFCedente.GetCedprazoAtrasoPonderado: TNullableExtended;
begin
  Result := FCedprazoAtrasoPonderado;
end;

function TARNFCedente.GetCedRubricaContaGrafica: TNullableString;
begin
  Result := FCedRubricaContaGrafica;
end;

function TARNFCedente.GetCGLHisCodigo: TNullableInteger;
begin
  Result := FCGLHisCodigo;
end;

function TARNFCedente.GetCedEmailEnvioDocumento: TNullableString;
begin
  Result := FCedEmailEnvioDocumento;
end;

function TARNFCedente.GetCedContadorNome: TNullableString;
begin
  Result := FCedContadorNome;
end;

function TARNFCedente.GetCedContadorCRC: TNullableString;
begin
  Result := FCedContadorCRC;
end;

function TARNFCedente.GetCedContadorCPF: TNullableString;
begin
  Result := FCedContadorCPF;
end;

function TARNFCedente.GetCedSacadorPadraoCNPJCPF: TNullableString;
begin
  Result := FCedSacadorPadraoCNPJCPF;
end;

function TARNFCedente.GetCedEmailEnvioEfetivacao: TNullableString;
begin
  Result := FCedEmailEnvioEfetivacao;
end;

function TARNFCedente.GetCedEnviarConsultaTitulosIntegracao: TNullableBoolean;
begin
  Result := FCedEnviarConsultaTitulosIntegracao;
end;

function TARNFCedente.GetDesconsideraCedOuvidoria: TNullableBoolean;
begin
  Result := FDesconsideraCedOuvidoria;
end;

function TARNFCedente.GetCedContato: TNullableString;
begin
  Result := FCedContato;
end;

function TARNFCedente.GetCedPercComissao: TNullableExtended;
begin
  Result := FCedPercComissao;
end;

function TARNFCedente.GetCedClassificacao: TNullableString;
begin
  Result := FCedClassificacao;
end;

function TARNFCedente.GetCedDataInclusao: TNullableDateTime;
begin
  Result := FCedDataInclusao;
end;

function TARNFCedente.GetCedUsuarioInclusao: TNullableString;
begin
  Result := FCedUsuarioInclusao;
end;

function TARNFCedente.GetCedCodime: TNullableBoolean;
begin
  Result := FCedCodime;
end;

function TARNFCedente.GetCedLimiteControleSecuritizacaoValor: TNullableCurrency;
begin
  Result := FCedLimiteControleSecuritizacaoValor;
end;

function TARNFCedente.GetCedLimiteControleSecuritizacaoPeriodo: TNullableString;
begin
  Result := FCedLimiteControleSecuritizacaoPeriodo;
end;

function TARNFCedente.GetCedRecompraTaxaMulta: TNullableExtended;
begin
  Result := FCedRecompraTaxaMulta;
end;

function TARNFCedente.GetCedContabilidadeContaTransferencia: TNullableString;
begin
  Result := FCedContabilidadeContaTransferencia;
end;

function TARNFCedente.GetUsuarioUltimaAlteracao: string;
begin
  Result := FUsuarioUltimaAlteracao;
end;

function TARNFCedente.GetAlteracaoViaCadastro: TNullableBoolean;
begin
  Result := FAlteracaoViaCadastro;
end;

function TARNFCedente.GetCedSerasaMonitoreValorSaldoDevedorGerenciamento: TNullableCurrency;
begin
  Result := FCedSerasaMonitoreValorSaldoDevedorGerenciamento;
end;

function TARNFCedente.GetCedSerasaMonitorePrazo: TNullableInteger;
begin
  Result := FCedSerasaMonitorePrazo;
end;

function TARNFCedente.GetCedSerasaGru_ID: TNullableInteger;
begin
  Result := FCedSerasaGru_ID;
end;

function TARNFCedente.GetCedSerasaPer_ID: TNullableInteger;
begin
  Result := FCedSerasaPer_ID;
end;

function TARNFCedente.GetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ: TNullableCurrency;
begin
  Result := FCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ;
end;

function TARNFCedente.GetCedSerasaMonitoreValorSaldoDevedorSacadoCPF: TNullableCurrency;
begin
  Result := FCedSerasaMonitoreValorSaldoDevedorSacadoCPF;
end;

function TARNFCedente.GetCedPercentualMulta: TNullableExtended;
begin
  Result := FCedPercentualMulta;
end;

function TARNFCedente.GetCedConsideraInstrucaoSegundaVia: TNullableBoolean;
begin
  Result := FCedConsideraInstrucaoSegundaVia;
end;

function TARNFCedente.GetCedNaoProtetar: TNullableBoolean;
begin
  Result := FCedNaoProtetar;
end;

function TARNFCedente.GetUsuLogin1: TNullableString;
begin
  Result := FUsuLogin1;
end;

function TARNFCedente.GetUsuLogin2: TNullableString;
begin
  Result := FUsuLogin2;
end;

function TARNFCedente.GetUsuLogin3: TNullableString;
begin
  Result := FUsuLogin3;
end;

function TARNFCedente.GetUsuLogin4: TNullableString;
begin
  Result := FUsuLogin4;
end;

function TARNFCedente.GetUsuLogin5: TNullableString;
begin
  Result := FUsuLogin5;
end;

function TARNFCedente.GetUsuAgenteChecagem: TNullableString;
begin
  Result := FUsuAgenteChecagem;
end;

function TARNFCedente.GetCedPriorizarPainelChecagem: TNullableBoolean;
begin
  Result := FCedPriorizarPainelChecagem;
end;

function TARNFCedente.GetConCodigo: TNullableInteger;
begin
  Result := FConCodigo;
end;

function TARNFCedente.GetCedContabilidadeContaClientes: TNullableString;
begin
  Result := FCedContabilidadeContaClientes;
end;

function TARNFCedente.GetCedContabilidadeContaFomento: TNullableString;
begin
  Result := FCedContabilidadeContaFomento;
end;

function TARNFCedente.GetCedContabilidadeContaCtaGrafica: TNullableString;
begin
  Result := FCedContabilidadeContaCtaGrafica;
end;

function TARNFCedente.GetCedContabilidadeContaConfissao: TNullableString;
begin
  Result := FCedContabilidadeContaConfissao;
end;

function TARNFCedente.GetIncluido: TNullableInteger;
begin
  Result := FIncluido;
end;

function TARNFCedente.GetCedNaoEnviaPefin: TNullableBoolean;
begin
  Result := FCedNaoEnviaPefin;
end;

function TARNFCedente.GetCedgru_id: TNullableInteger;
begin
  Result := FCedgru_id;
end;

function TARNFCedente.GetPOCCan: TNullableBoolean;
begin
  Result := FPOCCan;
end;

function TARNFCedente.GetCnaeCodigo: TNullableString;
begin
  Result := FCnaeCodigo;
end;

function TARNFCedente.GetCedMensagemBoleto1: TNullableString;
begin
  Result := FCedMensagemBoleto1;
end;

function TARNFCedente.GetCedMensagemBoleto2: TNullableString;
begin
  Result := FCedMensagemBoleto2;
end;

function TARNFCedente.GetCedMensagemBoleto3: TNullableString;
begin
  Result := FCedMensagemBoleto3;
end;

function TARNFCedente.GetCedMensagemBoleto4: TNullableString;
begin
  Result := FCedMensagemBoleto4;
end;

function TARNFCedente.GetCedMensagemBoleto5: TNullableString;
begin
  Result := FCedMensagemBoleto5;
end;

function TARNFCedente.GetCedEmiteBoletoComoCedenteBoleto: TNullableBoolean;
begin
  Result := FCedEmiteBoletoComoCedenteBoleto;
end;

function TARNFCedente.GetAsString(Index: Integer): string;
begin
  case Index of
    Campo_NFCedente_ID: Result := IntToStr(GetID);
    Campo_NFCedente_CedCodigo: Result := IntToStr(GetCedCodigo);
    Campo_NFCedente_PesCNPJCPF: Result := GetPesCNPJCPF;
    Campo_NFCedente_IDGCodigo: Result := ToString(GetIDGCodigo);
    Campo_NFCedente_CedContratoNumero: Result := ToString(GetCedContratoNumero);
    Campo_NFCedente_CedContratoData: Result := ToString(GetCedContratoData);
    Campo_NFCedente_CedFomentoSaldoDevedor: Result := ToString(GetCedFomentoSaldoDevedor);
    Campo_NFCedente_EmpCodigo: Result := IntToStr(GetEmpCodigo);
    Campo_NFCedente_CedObservacao: Result := ToString(GetCedObservacao);
    Campo_NFCedente_FilFiltro: Result := ToString(GetFilFiltro);
    Campo_NFCedente_CedSimples: Result := ToStringNS(GetCedSimples);
    Campo_NFCedente_HisCodigo: Result := ToString(GetHisCodigo);
    Campo_NFCedente_CedRubricaOperacaoAtivo: Result := ToString(GetCedRubricaOperacaoAtivo);
    Campo_NFCedente_CedRubricaOperacaoCobranca: Result := ToString(GetCedRubricaOperacaoCobranca);
    Campo_NFCedente_CedRubricaOperacaoCaucao: Result := ToString(GetCedRubricaOperacaoCaucao);
    Campo_NFCedente_CedRubricaPassivo: Result := ToString(GetCedRubricaPassivo);
    Campo_NFCedente_CedRubricaDespesa: Result := ToString(GetCedRubricaDespesa);
    Campo_NFCedente_CedAbaterIRRF: Result := ToStringNS(GetCedAbaterIRRF);
    Campo_NFCedente_CedIRRFAcumulado: Result := ToString(GetCedIRRFAcumulado);
    Campo_NFCedente_CedAbaterRetidos: Result := ToStringNS(GetCedAbaterRetidos);
    Campo_NFCedente_AgeCodigo: Result := ToString(GetAgeCodigo);
    Campo_NFCedente_CedMsgDocControle: Result := ToString(GetCedMsgDocControle);
    Campo_NFCedente_CedValorLimiteCreditoCheque: Result := ToString(GetCedValorLimiteCreditoCheque);
    Campo_NFCedente_CedValorLimiteCreditoDuplicata: Result := ToString(GetCedValorLimiteCreditoDuplicata);
    Campo_NFCedente_CedValorLimiteCreditoSacadoCheque: Result := ToString(GetCedValorLimiteCreditoSacadoCheque);
    Campo_NFCedente_CedValorLimiteCreditoSacadoDuplicata: Result := ToString(GetCedValorLimiteCreditoSacadoDuplicata);
    Campo_NFCedente_CedSacadorPadrao: Result := ToString(GetCedSacadorPadrao);
    Campo_NFCedente_CCCCodigo: Result := ToString(GetCCCCodigo);
    Campo_NFCedente_CedTotalPendencias: Result := ToString(GetCedTotalPendencias);
    Campo_NFCedente_CedInstrucaoCobranca: Result := ToString(GetCedInstrucaoCobranca);
    Campo_NFCedente_CedEmiteBoleto: Result := ToStringNS(GetCedEmiteBoleto);
    Campo_NFCedente_CedDataConnstEmpresa: Result := ToString(GetCedDataConnstEmpresa);
    Campo_NFCedente_CedValorDoc: Result := ToString(GetCedValorDoc);
    Campo_NFCedente_CedValorTed: Result := ToString(GetCedValorTed);
    Campo_NFCedente_CedIncentIssqn: Result := ToStringNS(GetCedIncentIssqn);
    Campo_NFCedente_CedNaoCobraCpmf: Result := ToStringNS(GetCedNaoCobraCpmf);
    Campo_NFCedente_CedGerarTarifaAuto: Result := ToStringNS(GetCedGerarTarifaAuto);
    Campo_NFCedente_SCoCodigo: Result := ToString(GetSCoCodigo);
    Campo_NFCedente_CedprazoAtrasoPonderado: Result := ToString(GetCedprazoAtrasoPonderado);
    Campo_NFCedente_CedRubricaContaGrafica: Result := ToString(GetCedRubricaContaGrafica);
    Campo_NFCedente_CGLHisCodigo: Result := ToString(GetCGLHisCodigo);
    Campo_NFCedente_CedEmailEnvioDocumento: Result := ToString(GetCedEmailEnvioDocumento);
    Campo_NFCedente_CedContadorNome: Result := ToString(GetCedContadorNome);
    Campo_NFCedente_CedContadorCRC: Result := ToString(GetCedContadorCRC);
    Campo_NFCedente_CedContadorCPF: Result := ToString(GetCedContadorCPF);
    Campo_NFCedente_CedSacadorPadraoCNPJCPF: Result := ToString(GetCedSacadorPadraoCNPJCPF);
    Campo_NFCedente_CedEmailEnvioEfetivacao: Result := ToString(GetCedEmailEnvioEfetivacao);
    Campo_NFCedente_CedEnviarConsultaTitulosIntegracao: Result := ToStringNS(GetCedEnviarConsultaTitulosIntegracao);
    Campo_NFCedente_DesconsideraCedOuvidoria: Result := ToStringNS(GetDesconsideraCedOuvidoria);
    Campo_NFCedente_CedContato: Result := ToString(GetCedContato);
    Campo_NFCedente_CedPercComissao: Result := ToString(GetCedPercComissao);
    Campo_NFCedente_CedClassificacao: Result := ToString(GetCedClassificacao);
    Campo_NFCedente_CedDataInclusao: Result := ToString(GetCedDataInclusao);
    Campo_NFCedente_CedUsuarioInclusao: Result := ToString(GetCedUsuarioInclusao);
    Campo_NFCedente_CedCodime: Result := ToStringNS(GetCedCodime);
    Campo_NFCedente_CedLimiteControleSecuritizacaoValor: Result := ToString(GetCedLimiteControleSecuritizacaoValor);
    Campo_NFCedente_CedLimiteControleSecuritizacaoPeriodo: Result := ToString(GetCedLimiteControleSecuritizacaoPeriodo);
    Campo_NFCedente_CedRecompraTaxaMulta: Result := ToString(GetCedRecompraTaxaMulta);
    Campo_NFCedente_CedContabilidadeContaTransferencia: Result := ToString(GetCedContabilidadeContaTransferencia);
    Campo_NFCedente_UsuarioUltimaAlteracao: Result := GetUsuarioUltimaAlteracao;
    Campo_NFCedente_AlteracaoViaCadastro: Result := ToStringNS(GetAlteracaoViaCadastro);
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorGerenciamento: Result := ToString(GetCedSerasaMonitoreValorSaldoDevedorGerenciamento);
    Campo_NFCedente_CedSerasaMonitorePrazo: Result := ToString(GetCedSerasaMonitorePrazo);
    Campo_NFCedente_CedSerasaGru_ID: Result := ToString(GetCedSerasaGru_ID);
    Campo_NFCedente_CedSerasaPer_ID: Result := ToString(GetCedSerasaPer_ID);
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ: Result := ToString(GetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ);
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCPF: Result := ToString(GetCedSerasaMonitoreValorSaldoDevedorSacadoCPF);
    Campo_NFCedente_CedPercentualMulta: Result := ToString(GetCedPercentualMulta);
    Campo_NFCedente_CedConsideraInstrucaoSegundaVia: Result := ToStringNS(GetCedConsideraInstrucaoSegundaVia);
    Campo_NFCedente_CedNaoProtetar: Result := ToStringNS(GetCedNaoProtetar);
    Campo_NFCedente_UsuLogin1: Result := ToString(GetUsuLogin1);
    Campo_NFCedente_UsuLogin2: Result := ToString(GetUsuLogin2);
    Campo_NFCedente_UsuLogin3: Result := ToString(GetUsuLogin3);
    Campo_NFCedente_UsuLogin4: Result := ToString(GetUsuLogin4);
    Campo_NFCedente_UsuLogin5: Result := ToString(GetUsuLogin5);
    Campo_NFCedente_UsuAgenteChecagem: Result := ToString(GetUsuAgenteChecagem);
    Campo_NFCedente_CedPriorizarPainelChecagem: Result := ToStringNS(GetCedPriorizarPainelChecagem);
    Campo_NFCedente_ConCodigo: Result := ToString(GetConCodigo);
    Campo_NFCedente_CedContabilidadeContaClientes: Result := ToString(GetCedContabilidadeContaClientes);
    Campo_NFCedente_CedContabilidadeContaFomento: Result := ToString(GetCedContabilidadeContaFomento);
    Campo_NFCedente_CedContabilidadeContaCtaGrafica: Result := ToString(GetCedContabilidadeContaCtaGrafica);
    Campo_NFCedente_CedContabilidadeContaConfissao: Result := ToString(GetCedContabilidadeContaConfissao);
    Campo_NFCedente_Incluido: Result := ToString(GetIncluido);
    Campo_NFCedente_CedNaoEnviaPefin: Result := ToStringNS(GetCedNaoEnviaPefin);
    Campo_NFCedente_Cedgru_id: Result := ToString(GetCedgru_id);
    Campo_NFCedente_POCCan: Result := ToStringNS(GetPOCCan);
    Campo_NFCedente_CnaeCodigo: Result := ToString(GetCnaeCodigo);
    Campo_NFCedente_CedMensagemBoleto1: Result := ToString(GetCedMensagemBoleto1);
    Campo_NFCedente_CedMensagemBoleto2: Result := ToString(GetCedMensagemBoleto2);
    Campo_NFCedente_CedMensagemBoleto3: Result := ToString(GetCedMensagemBoleto3);
    Campo_NFCedente_CedMensagemBoleto4: Result := ToString(GetCedMensagemBoleto4);
    Campo_NFCedente_CedMensagemBoleto5: Result := ToString(GetCedMensagemBoleto5);
    Campo_NFCedente_CedEmiteBoletoComoCedenteBoleto: Result := ToStringNS(GetCedEmiteBoletoComoCedenteBoleto);
  else
    Result := inherited GetAsString(Index);
  end;
end;

function TARNFCedente.GetValue(Index: Integer): Variant;
begin
  case Index of
    Campo_NFCedente_ID: Result := GetID;
    Campo_NFCedente_CedCodigo: Result := GetCedCodigo;
    Campo_NFCedente_PesCNPJCPF: Result := GetPesCNPJCPF;
    Campo_NFCedente_IDGCodigo: Result := ToVariant(GetIDGCodigo);
    Campo_NFCedente_CedContratoNumero: Result := ToVariant(GetCedContratoNumero);
    Campo_NFCedente_CedContratoData: Result := ToVariant(GetCedContratoData);
    Campo_NFCedente_CedFomentoSaldoDevedor: Result := ToVariant(GetCedFomentoSaldoDevedor);
    Campo_NFCedente_EmpCodigo: Result := GetEmpCodigo;
    Campo_NFCedente_CedObservacao: Result := ToVariant(GetCedObservacao);
    Campo_NFCedente_FilFiltro: Result := ToVariant(GetFilFiltro);
    Campo_NFCedente_CedSimples: Result := ToVariant(GetCedSimples);
    Campo_NFCedente_HisCodigo: Result := ToVariant(GetHisCodigo);
    Campo_NFCedente_CedRubricaOperacaoAtivo: Result := ToVariant(GetCedRubricaOperacaoAtivo);
    Campo_NFCedente_CedRubricaOperacaoCobranca: Result := ToVariant(GetCedRubricaOperacaoCobranca);
    Campo_NFCedente_CedRubricaOperacaoCaucao: Result := ToVariant(GetCedRubricaOperacaoCaucao);
    Campo_NFCedente_CedRubricaPassivo: Result := ToVariant(GetCedRubricaPassivo);
    Campo_NFCedente_CedRubricaDespesa: Result := ToVariant(GetCedRubricaDespesa);
    Campo_NFCedente_CedAbaterIRRF: Result := ToVariant(GetCedAbaterIRRF);
    Campo_NFCedente_CedIRRFAcumulado: Result := ToVariant(GetCedIRRFAcumulado);
    Campo_NFCedente_CedAbaterRetidos: Result := ToVariant(GetCedAbaterRetidos);
    Campo_NFCedente_AgeCodigo: Result := ToVariant(GetAgeCodigo);
    Campo_NFCedente_CedMsgDocControle: Result := ToVariant(GetCedMsgDocControle);
    Campo_NFCedente_CedValorLimiteCreditoCheque: Result := ToVariant(GetCedValorLimiteCreditoCheque);
    Campo_NFCedente_CedValorLimiteCreditoDuplicata: Result := ToVariant(GetCedValorLimiteCreditoDuplicata);
    Campo_NFCedente_CedValorLimiteCreditoSacadoCheque: Result := ToVariant(GetCedValorLimiteCreditoSacadoCheque);
    Campo_NFCedente_CedValorLimiteCreditoSacadoDuplicata: Result := ToVariant(GetCedValorLimiteCreditoSacadoDuplicata);
    Campo_NFCedente_CedSacadorPadrao: Result := ToVariant(GetCedSacadorPadrao);
    Campo_NFCedente_CCCCodigo: Result := ToVariant(GetCCCCodigo);
    Campo_NFCedente_CedTotalPendencias: Result := ToVariant(GetCedTotalPendencias);
    Campo_NFCedente_CedInstrucaoCobranca: Result := ToVariant(GetCedInstrucaoCobranca);
    Campo_NFCedente_CedEmiteBoleto: Result := ToVariant(GetCedEmiteBoleto);
    Campo_NFCedente_CedDataConnstEmpresa: Result := ToVariant(GetCedDataConnstEmpresa);
    Campo_NFCedente_CedValorDoc: Result := ToVariant(GetCedValorDoc);
    Campo_NFCedente_CedValorTed: Result := ToVariant(GetCedValorTed);
    Campo_NFCedente_CedIncentIssqn: Result := ToVariant(GetCedIncentIssqn);
    Campo_NFCedente_CedNaoCobraCpmf: Result := ToVariant(GetCedNaoCobraCpmf);
    Campo_NFCedente_CedGerarTarifaAuto: Result := ToVariant(GetCedGerarTarifaAuto);
    Campo_NFCedente_SCoCodigo: Result := ToVariant(GetSCoCodigo);
    Campo_NFCedente_CedprazoAtrasoPonderado: Result := ToVariant(GetCedprazoAtrasoPonderado);
    Campo_NFCedente_CedRubricaContaGrafica: Result := ToVariant(GetCedRubricaContaGrafica);
    Campo_NFCedente_CGLHisCodigo: Result := ToVariant(GetCGLHisCodigo);
    Campo_NFCedente_CedEmailEnvioDocumento: Result := ToVariant(GetCedEmailEnvioDocumento);
    Campo_NFCedente_CedContadorNome: Result := ToVariant(GetCedContadorNome);
    Campo_NFCedente_CedContadorCRC: Result := ToVariant(GetCedContadorCRC);
    Campo_NFCedente_CedContadorCPF: Result := ToVariant(GetCedContadorCPF);
    Campo_NFCedente_CedSacadorPadraoCNPJCPF: Result := ToVariant(GetCedSacadorPadraoCNPJCPF);
    Campo_NFCedente_CedEmailEnvioEfetivacao: Result := ToVariant(GetCedEmailEnvioEfetivacao);
    Campo_NFCedente_CedEnviarConsultaTitulosIntegracao: Result := ToVariant(GetCedEnviarConsultaTitulosIntegracao);
    Campo_NFCedente_DesconsideraCedOuvidoria: Result := ToVariant(GetDesconsideraCedOuvidoria);
    Campo_NFCedente_CedContato: Result := ToVariant(GetCedContato);
    Campo_NFCedente_CedPercComissao: Result := ToVariant(GetCedPercComissao);
    Campo_NFCedente_CedClassificacao: Result := ToVariant(GetCedClassificacao);
    Campo_NFCedente_CedDataInclusao: Result := ToVariant(GetCedDataInclusao);
    Campo_NFCedente_CedUsuarioInclusao: Result := ToVariant(GetCedUsuarioInclusao);
    Campo_NFCedente_CedCodime: Result := ToVariant(GetCedCodime);
    Campo_NFCedente_CedLimiteControleSecuritizacaoValor: Result := ToVariant(GetCedLimiteControleSecuritizacaoValor);
    Campo_NFCedente_CedLimiteControleSecuritizacaoPeriodo: Result := ToVariant(GetCedLimiteControleSecuritizacaoPeriodo);
    Campo_NFCedente_CedRecompraTaxaMulta: Result := ToVariant(GetCedRecompraTaxaMulta);
    Campo_NFCedente_CedContabilidadeContaTransferencia: Result := ToVariant(GetCedContabilidadeContaTransferencia);
    Campo_NFCedente_UsuarioUltimaAlteracao: Result := GetUsuarioUltimaAlteracao;
    Campo_NFCedente_AlteracaoViaCadastro: Result := ToVariant(GetAlteracaoViaCadastro);
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorGerenciamento: Result := ToVariant(GetCedSerasaMonitoreValorSaldoDevedorGerenciamento);
    Campo_NFCedente_CedSerasaMonitorePrazo: Result := ToVariant(GetCedSerasaMonitorePrazo);
    Campo_NFCedente_CedSerasaGru_ID: Result := ToVariant(GetCedSerasaGru_ID);
    Campo_NFCedente_CedSerasaPer_ID: Result := ToVariant(GetCedSerasaPer_ID);
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ: Result := ToVariant(GetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ);
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCPF: Result := ToVariant(GetCedSerasaMonitoreValorSaldoDevedorSacadoCPF);
    Campo_NFCedente_CedPercentualMulta: Result := ToVariant(GetCedPercentualMulta);
    Campo_NFCedente_CedConsideraInstrucaoSegundaVia: Result := ToVariant(GetCedConsideraInstrucaoSegundaVia);
    Campo_NFCedente_CedNaoProtetar: Result := ToVariant(GetCedNaoProtetar);
    Campo_NFCedente_UsuLogin1: Result := ToVariant(GetUsuLogin1);
    Campo_NFCedente_UsuLogin2: Result := ToVariant(GetUsuLogin2);
    Campo_NFCedente_UsuLogin3: Result := ToVariant(GetUsuLogin3);
    Campo_NFCedente_UsuLogin4: Result := ToVariant(GetUsuLogin4);
    Campo_NFCedente_UsuLogin5: Result := ToVariant(GetUsuLogin5);
    Campo_NFCedente_UsuAgenteChecagem: Result := ToVariant(GetUsuAgenteChecagem);
    Campo_NFCedente_CedPriorizarPainelChecagem: Result := ToVariant(GetCedPriorizarPainelChecagem);
    Campo_NFCedente_ConCodigo: Result := ToVariant(GetConCodigo);
    Campo_NFCedente_CedContabilidadeContaClientes: Result := ToVariant(GetCedContabilidadeContaClientes);
    Campo_NFCedente_CedContabilidadeContaFomento: Result := ToVariant(GetCedContabilidadeContaFomento);
    Campo_NFCedente_CedContabilidadeContaCtaGrafica: Result := ToVariant(GetCedContabilidadeContaCtaGrafica);
    Campo_NFCedente_CedContabilidadeContaConfissao: Result := ToVariant(GetCedContabilidadeContaConfissao);
    Campo_NFCedente_Incluido: Result := ToVariant(GetIncluido);
    Campo_NFCedente_CedNaoEnviaPefin: Result := ToVariant(GetCedNaoEnviaPefin);
    Campo_NFCedente_Cedgru_id: Result := ToVariant(GetCedgru_id);
    Campo_NFCedente_POCCan: Result := ToVariant(GetPOCCan);
    Campo_NFCedente_CnaeCodigo: Result := ToVariant(GetCnaeCodigo);
    Campo_NFCedente_CedMensagemBoleto1: Result := ToVariant(GetCedMensagemBoleto1);
    Campo_NFCedente_CedMensagemBoleto2: Result := ToVariant(GetCedMensagemBoleto2);
    Campo_NFCedente_CedMensagemBoleto3: Result := ToVariant(GetCedMensagemBoleto3);
    Campo_NFCedente_CedMensagemBoleto4: Result := ToVariant(GetCedMensagemBoleto4);
    Campo_NFCedente_CedMensagemBoleto5: Result := ToVariant(GetCedMensagemBoleto5);
    Campo_NFCedente_CedEmiteBoletoComoCedenteBoleto: Result := ToVariant(GetCedEmiteBoletoComoCedenteBoleto);
  else
    Result := inherited GetValue(Index);
  end;
end;

class function TARNFCedente.GUIDItem: TGUID;
begin
  Result := IARNFCedente;
end;

function TARNFCedente.IsNull(Index: Integer): Boolean;
begin
  case Index of
    Campo_NFCedente_ID,
    Campo_NFCedente_CedCodigo,
    Campo_NFCedente_PesCNPJCPF,
    Campo_NFCedente_EmpCodigo,
    Campo_NFCedente_UsuarioUltimaAlteracao: Result := False;
    Campo_NFCedente_IDGCodigo: Result := GetIDGCodigo.Null;
    Campo_NFCedente_CedContratoNumero: Result := GetCedContratoNumero.Null;
    Campo_NFCedente_CedContratoData: Result := GetCedContratoData.Null;
    Campo_NFCedente_CedFomentoSaldoDevedor: Result := GetCedFomentoSaldoDevedor.Null;
    Campo_NFCedente_CedObservacao: Result := GetCedObservacao.Null;
    Campo_NFCedente_FilFiltro: Result := GetFilFiltro.Null;
    Campo_NFCedente_CedSimples: Result := GetCedSimples.Null;
    Campo_NFCedente_HisCodigo: Result := GetHisCodigo.Null;
    Campo_NFCedente_CedRubricaOperacaoAtivo: Result := GetCedRubricaOperacaoAtivo.Null;
    Campo_NFCedente_CedRubricaOperacaoCobranca: Result := GetCedRubricaOperacaoCobranca.Null;
    Campo_NFCedente_CedRubricaOperacaoCaucao: Result := GetCedRubricaOperacaoCaucao.Null;
    Campo_NFCedente_CedRubricaPassivo: Result := GetCedRubricaPassivo.Null;
    Campo_NFCedente_CedRubricaDespesa: Result := GetCedRubricaDespesa.Null;
    Campo_NFCedente_CedAbaterIRRF: Result := GetCedAbaterIRRF.Null;
    Campo_NFCedente_CedIRRFAcumulado: Result := GetCedIRRFAcumulado.Null;
    Campo_NFCedente_CedAbaterRetidos: Result := GetCedAbaterRetidos.Null;
    Campo_NFCedente_AgeCodigo: Result := GetAgeCodigo.Null;
    Campo_NFCedente_CedMsgDocControle: Result := GetCedMsgDocControle.Null;
    Campo_NFCedente_CedValorLimiteCreditoCheque: Result := GetCedValorLimiteCreditoCheque.Null;
    Campo_NFCedente_CedValorLimiteCreditoDuplicata: Result := GetCedValorLimiteCreditoDuplicata.Null;
    Campo_NFCedente_CedValorLimiteCreditoSacadoCheque: Result := GetCedValorLimiteCreditoSacadoCheque.Null;
    Campo_NFCedente_CedValorLimiteCreditoSacadoDuplicata: Result := GetCedValorLimiteCreditoSacadoDuplicata.Null;
    Campo_NFCedente_CedSacadorPadrao: Result := GetCedSacadorPadrao.Null;
    Campo_NFCedente_CCCCodigo: Result := GetCCCCodigo.Null;
    Campo_NFCedente_CedTotalPendencias: Result := GetCedTotalPendencias.Null;
    Campo_NFCedente_CedInstrucaoCobranca: Result := GetCedInstrucaoCobranca.Null;
    Campo_NFCedente_CedEmiteBoleto: Result := GetCedEmiteBoleto.Null;
    Campo_NFCedente_CedDataConnstEmpresa: Result := GetCedDataConnstEmpresa.Null;
    Campo_NFCedente_CedValorDoc: Result := GetCedValorDoc.Null;
    Campo_NFCedente_CedValorTed: Result := GetCedValorTed.Null;
    Campo_NFCedente_CedIncentIssqn: Result := GetCedIncentIssqn.Null;
    Campo_NFCedente_CedNaoCobraCpmf: Result := GetCedNaoCobraCpmf.Null;
    Campo_NFCedente_CedGerarTarifaAuto: Result := GetCedGerarTarifaAuto.Null;
    Campo_NFCedente_SCoCodigo: Result := GetSCoCodigo.Null;
    Campo_NFCedente_CedprazoAtrasoPonderado: Result := GetCedprazoAtrasoPonderado.Null;
    Campo_NFCedente_CedRubricaContaGrafica: Result := GetCedRubricaContaGrafica.Null;
    Campo_NFCedente_CGLHisCodigo: Result := GetCGLHisCodigo.Null;
    Campo_NFCedente_CedEmailEnvioDocumento: Result := GetCedEmailEnvioDocumento.Null;
    Campo_NFCedente_CedContadorNome: Result := GetCedContadorNome.Null;
    Campo_NFCedente_CedContadorCRC: Result := GetCedContadorCRC.Null;
    Campo_NFCedente_CedContadorCPF: Result := GetCedContadorCPF.Null;
    Campo_NFCedente_CedSacadorPadraoCNPJCPF: Result := GetCedSacadorPadraoCNPJCPF.Null;
    Campo_NFCedente_CedEmailEnvioEfetivacao: Result := GetCedEmailEnvioEfetivacao.Null;
    Campo_NFCedente_CedEnviarConsultaTitulosIntegracao: Result := GetCedEnviarConsultaTitulosIntegracao.Null;
    Campo_NFCedente_DesconsideraCedOuvidoria: Result := GetDesconsideraCedOuvidoria.Null;
    Campo_NFCedente_CedContato: Result := GetCedContato.Null;
    Campo_NFCedente_CedPercComissao: Result := GetCedPercComissao.Null;
    Campo_NFCedente_CedClassificacao: Result := GetCedClassificacao.Null;
    Campo_NFCedente_CedDataInclusao: Result := GetCedDataInclusao.Null;
    Campo_NFCedente_CedUsuarioInclusao: Result := GetCedUsuarioInclusao.Null;
    Campo_NFCedente_CedCodime: Result := GetCedCodime.Null;
    Campo_NFCedente_CedLimiteControleSecuritizacaoValor: Result := GetCedLimiteControleSecuritizacaoValor.Null;
    Campo_NFCedente_CedLimiteControleSecuritizacaoPeriodo: Result := GetCedLimiteControleSecuritizacaoPeriodo.Null;
    Campo_NFCedente_CedRecompraTaxaMulta: Result := GetCedRecompraTaxaMulta.Null;
    Campo_NFCedente_CedContabilidadeContaTransferencia: Result := GetCedContabilidadeContaTransferencia.Null;
    Campo_NFCedente_AlteracaoViaCadastro: Result := GetAlteracaoViaCadastro.Null;
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorGerenciamento: Result := GetCedSerasaMonitoreValorSaldoDevedorGerenciamento.Null;
    Campo_NFCedente_CedSerasaMonitorePrazo: Result := GetCedSerasaMonitorePrazo.Null;
    Campo_NFCedente_CedSerasaGru_ID: Result := GetCedSerasaGru_ID.Null;
    Campo_NFCedente_CedSerasaPer_ID: Result := GetCedSerasaPer_ID.Null;
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ: Result := GetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ.Null;
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCPF: Result := GetCedSerasaMonitoreValorSaldoDevedorSacadoCPF.Null;
    Campo_NFCedente_CedPercentualMulta: Result := GetCedPercentualMulta.Null;
    Campo_NFCedente_CedConsideraInstrucaoSegundaVia: Result := GetCedConsideraInstrucaoSegundaVia.Null;
    Campo_NFCedente_CedNaoProtetar: Result := GetCedNaoProtetar.Null;
    Campo_NFCedente_UsuLogin1: Result := GetUsuLogin1.Null;
    Campo_NFCedente_UsuLogin2: Result := GetUsuLogin2.Null;
    Campo_NFCedente_UsuLogin3: Result := GetUsuLogin3.Null;
    Campo_NFCedente_UsuLogin4: Result := GetUsuLogin4.Null;
    Campo_NFCedente_UsuLogin5: Result := GetUsuLogin5.Null;
    Campo_NFCedente_UsuAgenteChecagem: Result := GetUsuAgenteChecagem.Null;
    Campo_NFCedente_CedPriorizarPainelChecagem: Result := GetCedPriorizarPainelChecagem.Null;
    Campo_NFCedente_ConCodigo: Result := GetConCodigo.Null;
    Campo_NFCedente_CedContabilidadeContaClientes: Result := GetCedContabilidadeContaClientes.Null;
    Campo_NFCedente_CedContabilidadeContaFomento: Result := GetCedContabilidadeContaFomento.Null;
    Campo_NFCedente_CedContabilidadeContaCtaGrafica: Result := GetCedContabilidadeContaCtaGrafica.Null;
    Campo_NFCedente_CedContabilidadeContaConfissao: Result := GetCedContabilidadeContaConfissao.Null;
    Campo_NFCedente_Incluido: Result := GetIncluido.Null;
    Campo_NFCedente_CedNaoEnviaPefin: Result := GetCedNaoEnviaPefin.Null;
    Campo_NFCedente_Cedgru_id: Result := GetCedgru_id.Null;
    Campo_NFCedente_POCCan: Result := GetPOCCan.Null;
    Campo_NFCedente_CnaeCodigo: Result := GetCnaeCodigo.Null;
    Campo_NFCedente_CedMensagemBoleto1: Result := GetCedMensagemBoleto1.Null;
    Campo_NFCedente_CedMensagemBoleto2: Result := GetCedMensagemBoleto2.Null;
    Campo_NFCedente_CedMensagemBoleto3: Result := GetCedMensagemBoleto3.Null;
    Campo_NFCedente_CedMensagemBoleto4: Result := GetCedMensagemBoleto4.Null;
    Campo_NFCedente_CedMensagemBoleto5: Result := GetCedMensagemBoleto5.Null;
    Campo_NFCedente_CedEmiteBoletoComoCedenteBoleto: Result := GetCedEmiteBoletoComoCedenteBoleto.Null;
  else
    Result := inherited IsNull(Index);
  end;
end;

procedure TARNFCedente.SetAsString(Index: Integer; const Value: string);
begin
  case Index of
    Campo_NFCedente_ID: raise EActiveRecord.Create('Campo ID é somente leitura');
    Campo_NFCedente_CedCodigo: SetCedCodigo(StrToInt(Value));
    Campo_NFCedente_PesCNPJCPF: SetPesCNPJCPF(Value);
    Campo_NFCedente_IDGCodigo: SetIDGCodigo(Nullable(Value));
    Campo_NFCedente_CedContratoNumero: SetCedContratoNumero(StringToNullableInteger(Value));
    Campo_NFCedente_CedContratoData: SetCedContratoData(StringToNullableDateTime(Value));
    Campo_NFCedente_CedFomentoSaldoDevedor: SetCedFomentoSaldoDevedor(StringToNullableCurrency(Value));
    Campo_NFCedente_EmpCodigo: SetEmpCodigo(StrToInt(Value));
    Campo_NFCedente_CedObservacao: SetCedObservacao(Nullable(Value));
    Campo_NFCedente_FilFiltro: SetFilFiltro(Nullable(Value));
    Campo_NFCedente_CedSimples: SetCedSimples(NSToNullableBoolean(Value));
    Campo_NFCedente_HisCodigo: SetHisCodigo(StringToNullableInteger(Value));
    Campo_NFCedente_CedRubricaOperacaoAtivo: SetCedRubricaOperacaoAtivo(Nullable(Value));
    Campo_NFCedente_CedRubricaOperacaoCobranca: SetCedRubricaOperacaoCobranca(Nullable(Value));
    Campo_NFCedente_CedRubricaOperacaoCaucao: SetCedRubricaOperacaoCaucao(Nullable(Value));
    Campo_NFCedente_CedRubricaPassivo: SetCedRubricaPassivo(Nullable(Value));
    Campo_NFCedente_CedRubricaDespesa: SetCedRubricaDespesa(Nullable(Value));
    Campo_NFCedente_CedAbaterIRRF: SetCedAbaterIRRF(NSToNullableBoolean(Value));
    Campo_NFCedente_CedIRRFAcumulado: SetCedIRRFAcumulado(StringToNullableCurrency(Value));
    Campo_NFCedente_CedAbaterRetidos: SetCedAbaterRetidos(NSToNullableBoolean(Value));
    Campo_NFCedente_AgeCodigo: SetAgeCodigo(StringToNullableInteger(Value));
    Campo_NFCedente_CedMsgDocControle: SetCedMsgDocControle(Nullable(Value));
    Campo_NFCedente_CedValorLimiteCreditoCheque: SetCedValorLimiteCreditoCheque(StringToNullableCurrency(Value));
    Campo_NFCedente_CedValorLimiteCreditoDuplicata: SetCedValorLimiteCreditoDuplicata(StringToNullableCurrency(Value));
    Campo_NFCedente_CedValorLimiteCreditoSacadoCheque: SetCedValorLimiteCreditoSacadoCheque(StringToNullableCurrency(Value));
    Campo_NFCedente_CedValorLimiteCreditoSacadoDuplicata: SetCedValorLimiteCreditoSacadoDuplicata(StringToNullableCurrency(Value));
    Campo_NFCedente_CedSacadorPadrao: SetCedSacadorPadrao(Nullable(Value));
    Campo_NFCedente_CCCCodigo: SetCCCCodigo(StringToNullableInteger(Value));
    Campo_NFCedente_CedTotalPendencias: SetCedTotalPendencias(StringToNullableCurrency(Value));
    Campo_NFCedente_CedInstrucaoCobranca: SetCedInstrucaoCobranca(Nullable(Value));
    Campo_NFCedente_CedEmiteBoleto: SetCedEmiteBoleto(NSToNullableBoolean(Value));
    Campo_NFCedente_CedDataConnstEmpresa: SetCedDataConnstEmpresa(StringToNullableDateTime(Value));
    Campo_NFCedente_CedValorDoc: SetCedValorDoc(StringToNullableCurrency(Value));
    Campo_NFCedente_CedValorTed: SetCedValorTed(StringToNullableCurrency(Value));
    Campo_NFCedente_CedIncentIssqn: SetCedIncentIssqn(NSToNullableBoolean(Value));
    Campo_NFCedente_CedNaoCobraCpmf: SetCedNaoCobraCpmf(NSToNullableBoolean(Value));
    Campo_NFCedente_CedGerarTarifaAuto: SetCedGerarTarifaAuto(NSToNullableBoolean(Value));
    Campo_NFCedente_SCoCodigo: SetSCoCodigo(StringToNullableInteger(Value));
    Campo_NFCedente_CedprazoAtrasoPonderado: SetCedprazoAtrasoPonderado(StringToNullableExtended(Value));
    Campo_NFCedente_CedRubricaContaGrafica: SetCedRubricaContaGrafica(Nullable(Value));
    Campo_NFCedente_CGLHisCodigo: SetCGLHisCodigo(StringToNullableInteger(Value));
    Campo_NFCedente_CedEmailEnvioDocumento: SetCedEmailEnvioDocumento(Nullable(Value));
    Campo_NFCedente_CedContadorNome: SetCedContadorNome(Nullable(Value));
    Campo_NFCedente_CedContadorCRC: SetCedContadorCRC(Nullable(Value));
    Campo_NFCedente_CedContadorCPF: SetCedContadorCPF(Nullable(Value));
    Campo_NFCedente_CedSacadorPadraoCNPJCPF: SetCedSacadorPadraoCNPJCPF(Nullable(Value));
    Campo_NFCedente_CedEmailEnvioEfetivacao: SetCedEmailEnvioEfetivacao(Nullable(Value));
    Campo_NFCedente_CedEnviarConsultaTitulosIntegracao: SetCedEnviarConsultaTitulosIntegracao(NSToNullableBoolean(Value));
    Campo_NFCedente_DesconsideraCedOuvidoria: SetDesconsideraCedOuvidoria(NSToNullableBoolean(Value));
    Campo_NFCedente_CedContato: SetCedContato(Nullable(Value));
    Campo_NFCedente_CedPercComissao: SetCedPercComissao(StringToNullableExtended(Value));
    Campo_NFCedente_CedClassificacao: SetCedClassificacao(Nullable(Value));
    Campo_NFCedente_CedDataInclusao: SetCedDataInclusao(StringToNullableDateTime(Value));
    Campo_NFCedente_CedUsuarioInclusao: SetCedUsuarioInclusao(Nullable(Value));
    Campo_NFCedente_CedCodime: SetCedCodime(NSToNullableBoolean(Value));
    Campo_NFCedente_CedLimiteControleSecuritizacaoValor: SetCedLimiteControleSecuritizacaoValor(StringToNullableCurrency(Value));
    Campo_NFCedente_CedLimiteControleSecuritizacaoPeriodo: SetCedLimiteControleSecuritizacaoPeriodo(Nullable(Value));
    Campo_NFCedente_CedRecompraTaxaMulta: SetCedRecompraTaxaMulta(StringToNullableExtended(Value));
    Campo_NFCedente_CedContabilidadeContaTransferencia: SetCedContabilidadeContaTransferencia(Nullable(Value));
    Campo_NFCedente_UsuarioUltimaAlteracao: SetUsuarioUltimaAlteracao(Value);
    Campo_NFCedente_AlteracaoViaCadastro: SetAlteracaoViaCadastro(NSToNullableBoolean(Value));
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorGerenciamento: SetCedSerasaMonitoreValorSaldoDevedorGerenciamento(StringToNullableCurrency(Value));
    Campo_NFCedente_CedSerasaMonitorePrazo: SetCedSerasaMonitorePrazo(StringToNullableInteger(Value));
    Campo_NFCedente_CedSerasaGru_ID: SetCedSerasaGru_ID(StringToNullableInteger(Value));
    Campo_NFCedente_CedSerasaPer_ID: SetCedSerasaPer_ID(StringToNullableInteger(Value));
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ: SetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ(StringToNullableCurrency(Value));
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCPF: SetCedSerasaMonitoreValorSaldoDevedorSacadoCPF(StringToNullableCurrency(Value));
    Campo_NFCedente_CedPercentualMulta: SetCedPercentualMulta(StringToNullableExtended(Value));
    Campo_NFCedente_CedConsideraInstrucaoSegundaVia: SetCedConsideraInstrucaoSegundaVia(NSToNullableBoolean(Value));
    Campo_NFCedente_CedNaoProtetar: SetCedNaoProtetar(NSToNullableBoolean(Value));
    Campo_NFCedente_UsuLogin1: SetUsuLogin1(Nullable(Value));
    Campo_NFCedente_UsuLogin2: SetUsuLogin2(Nullable(Value));
    Campo_NFCedente_UsuLogin3: SetUsuLogin3(Nullable(Value));
    Campo_NFCedente_UsuLogin4: SetUsuLogin4(Nullable(Value));
    Campo_NFCedente_UsuLogin5: SetUsuLogin5(Nullable(Value));
    Campo_NFCedente_UsuAgenteChecagem: SetUsuAgenteChecagem(Nullable(Value));
    Campo_NFCedente_CedPriorizarPainelChecagem: SetCedPriorizarPainelChecagem(NSToNullableBoolean(Value));
    Campo_NFCedente_ConCodigo: SetConCodigo(StringToNullableInteger(Value));
    Campo_NFCedente_CedContabilidadeContaClientes: SetCedContabilidadeContaClientes(Nullable(Value));
    Campo_NFCedente_CedContabilidadeContaFomento: SetCedContabilidadeContaFomento(Nullable(Value));
    Campo_NFCedente_CedContabilidadeContaCtaGrafica: SetCedContabilidadeContaCtaGrafica(Nullable(Value));
    Campo_NFCedente_CedContabilidadeContaConfissao: SetCedContabilidadeContaConfissao(Nullable(Value));
    Campo_NFCedente_Incluido: SetIncluido(StringToNullableInteger(Value));
    Campo_NFCedente_CedNaoEnviaPefin: SetCedNaoEnviaPefin(NSToNullableBoolean(Value));
    Campo_NFCedente_Cedgru_id: SetCedgru_id(StringToNullableInteger(Value));
    Campo_NFCedente_POCCan: SetPOCCan(NSToNullableBoolean(Value));
    Campo_NFCedente_CnaeCodigo: SetCnaeCodigo(Nullable(Value));
    Campo_NFCedente_CedMensagemBoleto1: SetCedMensagemBoleto1(Nullable(Value));
    Campo_NFCedente_CedMensagemBoleto2: SetCedMensagemBoleto2(Nullable(Value));
    Campo_NFCedente_CedMensagemBoleto3: SetCedMensagemBoleto3(Nullable(Value));
    Campo_NFCedente_CedMensagemBoleto4: SetCedMensagemBoleto4(Nullable(Value));
    Campo_NFCedente_CedMensagemBoleto5: SetCedMensagemBoleto5(Nullable(Value));
    Campo_NFCedente_CedEmiteBoletoComoCedenteBoleto: SetCedEmiteBoletoComoCedenteBoleto(NSToNullableBoolean(Value));
  else
    inherited;
  end;
end;

procedure TARNFCedente.SetValue(Index: Integer; const Value: Variant);
begin
  case Index of
    Campo_NFCedente_ID: raise EActiveRecord.Create('Campo ID é somente leitura');
    Campo_NFCedente_CedCodigo: SetCedCodigo(Value);
    Campo_NFCedente_PesCNPJCPF: SetPesCNPJCPF(Value);
    Campo_NFCedente_IDGCodigo: SetIDGCodigo(VariantToNullableString(Value));
    Campo_NFCedente_CedContratoNumero: SetCedContratoNumero(VariantToNullableInteger(Value));
    Campo_NFCedente_CedContratoData: SetCedContratoData(VariantToNullableDateTime(Value));
    Campo_NFCedente_CedFomentoSaldoDevedor: SetCedFomentoSaldoDevedor(VariantToNullableCurrency(Value));
    Campo_NFCedente_EmpCodigo: SetEmpCodigo(Value);
    Campo_NFCedente_CedObservacao: SetCedObservacao(VariantToNullableString(Value));
    Campo_NFCedente_FilFiltro: SetFilFiltro(VariantToNullableString(Value));
    Campo_NFCedente_CedSimples: SetCedSimples(VariantToNullableBoolean(Value));
    Campo_NFCedente_HisCodigo: SetHisCodigo(VariantToNullableInteger(Value));
    Campo_NFCedente_CedRubricaOperacaoAtivo: SetCedRubricaOperacaoAtivo(VariantToNullableString(Value));
    Campo_NFCedente_CedRubricaOperacaoCobranca: SetCedRubricaOperacaoCobranca(VariantToNullableString(Value));
    Campo_NFCedente_CedRubricaOperacaoCaucao: SetCedRubricaOperacaoCaucao(VariantToNullableString(Value));
    Campo_NFCedente_CedRubricaPassivo: SetCedRubricaPassivo(VariantToNullableString(Value));
    Campo_NFCedente_CedRubricaDespesa: SetCedRubricaDespesa(VariantToNullableString(Value));
    Campo_NFCedente_CedAbaterIRRF: SetCedAbaterIRRF(VariantToNullableBoolean(Value));
    Campo_NFCedente_CedIRRFAcumulado: SetCedIRRFAcumulado(VariantToNullableCurrency(Value));
    Campo_NFCedente_CedAbaterRetidos: SetCedAbaterRetidos(VariantToNullableBoolean(Value));
    Campo_NFCedente_AgeCodigo: SetAgeCodigo(VariantToNullableInteger(Value));
    Campo_NFCedente_CedMsgDocControle: SetCedMsgDocControle(VariantToNullableString(Value));
    Campo_NFCedente_CedValorLimiteCreditoCheque: SetCedValorLimiteCreditoCheque(VariantToNullableCurrency(Value));
    Campo_NFCedente_CedValorLimiteCreditoDuplicata: SetCedValorLimiteCreditoDuplicata(VariantToNullableCurrency(Value));
    Campo_NFCedente_CedValorLimiteCreditoSacadoCheque: SetCedValorLimiteCreditoSacadoCheque(VariantToNullableCurrency(Value));
    Campo_NFCedente_CedValorLimiteCreditoSacadoDuplicata: SetCedValorLimiteCreditoSacadoDuplicata(VariantToNullableCurrency(Value));
    Campo_NFCedente_CedSacadorPadrao: SetCedSacadorPadrao(VariantToNullableString(Value));
    Campo_NFCedente_CCCCodigo: SetCCCCodigo(VariantToNullableInteger(Value));
    Campo_NFCedente_CedTotalPendencias: SetCedTotalPendencias(VariantToNullableCurrency(Value));
    Campo_NFCedente_CedInstrucaoCobranca: SetCedInstrucaoCobranca(VariantToNullableString(Value));
    Campo_NFCedente_CedEmiteBoleto: SetCedEmiteBoleto(VariantToNullableBoolean(Value));
    Campo_NFCedente_CedDataConnstEmpresa: SetCedDataConnstEmpresa(VariantToNullableDateTime(Value));
    Campo_NFCedente_CedValorDoc: SetCedValorDoc(VariantToNullableCurrency(Value));
    Campo_NFCedente_CedValorTed: SetCedValorTed(VariantToNullableCurrency(Value));
    Campo_NFCedente_CedIncentIssqn: SetCedIncentIssqn(VariantToNullableBoolean(Value));
    Campo_NFCedente_CedNaoCobraCpmf: SetCedNaoCobraCpmf(VariantToNullableBoolean(Value));
    Campo_NFCedente_CedGerarTarifaAuto: SetCedGerarTarifaAuto(VariantToNullableBoolean(Value));
    Campo_NFCedente_SCoCodigo: SetSCoCodigo(VariantToNullableInteger(Value));
    Campo_NFCedente_CedprazoAtrasoPonderado: SetCedprazoAtrasoPonderado(VariantToNullableExtended(Value));
    Campo_NFCedente_CedRubricaContaGrafica: SetCedRubricaContaGrafica(VariantToNullableString(Value));
    Campo_NFCedente_CGLHisCodigo: SetCGLHisCodigo(VariantToNullableInteger(Value));
    Campo_NFCedente_CedEmailEnvioDocumento: SetCedEmailEnvioDocumento(VariantToNullableString(Value));
    Campo_NFCedente_CedContadorNome: SetCedContadorNome(VariantToNullableString(Value));
    Campo_NFCedente_CedContadorCRC: SetCedContadorCRC(VariantToNullableString(Value));
    Campo_NFCedente_CedContadorCPF: SetCedContadorCPF(VariantToNullableString(Value));
    Campo_NFCedente_CedSacadorPadraoCNPJCPF: SetCedSacadorPadraoCNPJCPF(VariantToNullableString(Value));
    Campo_NFCedente_CedEmailEnvioEfetivacao: SetCedEmailEnvioEfetivacao(VariantToNullableString(Value));
    Campo_NFCedente_CedEnviarConsultaTitulosIntegracao: SetCedEnviarConsultaTitulosIntegracao(VariantToNullableBoolean(Value));
    Campo_NFCedente_DesconsideraCedOuvidoria: SetDesconsideraCedOuvidoria(VariantToNullableBoolean(Value));
    Campo_NFCedente_CedContato: SetCedContato(VariantToNullableString(Value));
    Campo_NFCedente_CedPercComissao: SetCedPercComissao(VariantToNullableExtended(Value));
    Campo_NFCedente_CedClassificacao: SetCedClassificacao(VariantToNullableString(Value));
    Campo_NFCedente_CedDataInclusao: SetCedDataInclusao(VariantToNullableDateTime(Value));
    Campo_NFCedente_CedUsuarioInclusao: SetCedUsuarioInclusao(VariantToNullableString(Value));
    Campo_NFCedente_CedCodime: SetCedCodime(VariantToNullableBoolean(Value));
    Campo_NFCedente_CedLimiteControleSecuritizacaoValor: SetCedLimiteControleSecuritizacaoValor(VariantToNullableCurrency(Value));
    Campo_NFCedente_CedLimiteControleSecuritizacaoPeriodo: SetCedLimiteControleSecuritizacaoPeriodo(VariantToNullableString(Value));
    Campo_NFCedente_CedRecompraTaxaMulta: SetCedRecompraTaxaMulta(VariantToNullableExtended(Value));
    Campo_NFCedente_CedContabilidadeContaTransferencia: SetCedContabilidadeContaTransferencia(VariantToNullableString(Value));
    Campo_NFCedente_UsuarioUltimaAlteracao: SetUsuarioUltimaAlteracao(Value);
    Campo_NFCedente_AlteracaoViaCadastro: SetAlteracaoViaCadastro(VariantToNullableBoolean(Value));
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorGerenciamento: SetCedSerasaMonitoreValorSaldoDevedorGerenciamento(VariantToNullableCurrency(Value));
    Campo_NFCedente_CedSerasaMonitorePrazo: SetCedSerasaMonitorePrazo(VariantToNullableInteger(Value));
    Campo_NFCedente_CedSerasaGru_ID: SetCedSerasaGru_ID(VariantToNullableInteger(Value));
    Campo_NFCedente_CedSerasaPer_ID: SetCedSerasaPer_ID(VariantToNullableInteger(Value));
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ: SetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ(VariantToNullableCurrency(Value));
    Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCPF: SetCedSerasaMonitoreValorSaldoDevedorSacadoCPF(VariantToNullableCurrency(Value));
    Campo_NFCedente_CedPercentualMulta: SetCedPercentualMulta(VariantToNullableExtended(Value));
    Campo_NFCedente_CedConsideraInstrucaoSegundaVia: SetCedConsideraInstrucaoSegundaVia(VariantToNullableBoolean(Value));
    Campo_NFCedente_CedNaoProtetar: SetCedNaoProtetar(VariantToNullableBoolean(Value));
    Campo_NFCedente_UsuLogin1: SetUsuLogin1(VariantToNullableString(Value));
    Campo_NFCedente_UsuLogin2: SetUsuLogin2(VariantToNullableString(Value));
    Campo_NFCedente_UsuLogin3: SetUsuLogin3(VariantToNullableString(Value));
    Campo_NFCedente_UsuLogin4: SetUsuLogin4(VariantToNullableString(Value));
    Campo_NFCedente_UsuLogin5: SetUsuLogin5(VariantToNullableString(Value));
    Campo_NFCedente_UsuAgenteChecagem: SetUsuAgenteChecagem(VariantToNullableString(Value));
    Campo_NFCedente_CedPriorizarPainelChecagem: SetCedPriorizarPainelChecagem(VariantToNullableBoolean(Value));
    Campo_NFCedente_ConCodigo: SetConCodigo(VariantToNullableInteger(Value));
    Campo_NFCedente_CedContabilidadeContaClientes: SetCedContabilidadeContaClientes(VariantToNullableString(Value));
    Campo_NFCedente_CedContabilidadeContaFomento: SetCedContabilidadeContaFomento(VariantToNullableString(Value));
    Campo_NFCedente_CedContabilidadeContaCtaGrafica: SetCedContabilidadeContaCtaGrafica(VariantToNullableString(Value));
    Campo_NFCedente_CedContabilidadeContaConfissao: SetCedContabilidadeContaConfissao(VariantToNullableString(Value));
    Campo_NFCedente_Incluido: SetIncluido(VariantToNullableInteger(Value));
    Campo_NFCedente_CedNaoEnviaPefin: SetCedNaoEnviaPefin(VariantToNullableBoolean(Value));
    Campo_NFCedente_Cedgru_id: SetCedgru_id(VariantToNullableInteger(Value));
    Campo_NFCedente_POCCan: SetPOCCan(VariantToNullableBoolean(Value));
    Campo_NFCedente_CnaeCodigo: SetCnaeCodigo(VariantToNullableString(Value));
    Campo_NFCedente_CedMensagemBoleto1: SetCedMensagemBoleto1(VariantToNullableString(Value));
    Campo_NFCedente_CedMensagemBoleto2: SetCedMensagemBoleto2(VariantToNullableString(Value));
    Campo_NFCedente_CedMensagemBoleto3: SetCedMensagemBoleto3(VariantToNullableString(Value));
    Campo_NFCedente_CedMensagemBoleto4: SetCedMensagemBoleto4(VariantToNullableString(Value));
    Campo_NFCedente_CedMensagemBoleto5: SetCedMensagemBoleto5(VariantToNullableString(Value));
    Campo_NFCedente_CedEmiteBoletoComoCedenteBoleto: SetCedEmiteBoletoComoCedenteBoleto(VariantToNullableBoolean(Value));
  else
    inherited;
  end;
end;

procedure TARNFCedente.SetCedCodigo(const Value: Integer);
begin
  FCedCodigo := Value;
end;

procedure TARNFCedente.SetPesCNPJCPF(const Value: string);
begin
  FPesCNPJCPF := AjustaVarchar(Value, 20);
end;

procedure TARNFCedente.SetIDGCodigo(const Value: TNullableString);
begin
  FIDGCodigo := AjustaVarchar(Value, 8);
end;

procedure TARNFCedente.SetCedContratoNumero(const Value: TNullableInteger);
begin
  FCedContratoNumero := Value;
end;

procedure TARNFCedente.SetCedContratoData(const Value: TNullableDateTime);
begin
  FCedContratoData := Value;
end;

procedure TARNFCedente.SetCedFomentoSaldoDevedor(const Value: TNullableCurrency);
begin
  FCedFomentoSaldoDevedor := Value;
end;

procedure TARNFCedente.SetEmpCodigo(const Value: Integer);
begin
  FEmpCodigo := Value;
end;

procedure TARNFCedente.SetCedObservacao(const Value: TNullableString);
begin
  FCedObservacao := AjustaVarchar(Value, 5000);
end;

procedure TARNFCedente.SetFilFiltro(const Value: TNullableString);
begin
  FFilFiltro := AjustaVarchar(Value, 30);
end;

procedure TARNFCedente.SetCedSimples(const Value: TNullableBoolean);
begin
  FCedSimples := Value;
end;

procedure TARNFCedente.SetHisCodigo(const Value: TNullableInteger);
begin
  FHisCodigo := Value;
end;

procedure TARNFCedente.SetCedRubricaOperacaoAtivo(const Value: TNullableString);
begin
  FCedRubricaOperacaoAtivo := AjustaVarchar(Value, 30);
end;

procedure TARNFCedente.SetCedRubricaOperacaoCobranca(const Value: TNullableString);
begin
  FCedRubricaOperacaoCobranca := AjustaVarchar(Value, 30);
end;

procedure TARNFCedente.SetCedRubricaOperacaoCaucao(const Value: TNullableString);
begin
  FCedRubricaOperacaoCaucao := AjustaVarchar(Value, 30);
end;

procedure TARNFCedente.SetCedRubricaPassivo(const Value: TNullableString);
begin
  FCedRubricaPassivo := AjustaVarchar(Value, 30);
end;

procedure TARNFCedente.SetCedRubricaDespesa(const Value: TNullableString);
begin
  FCedRubricaDespesa := AjustaVarchar(Value, 30);
end;

procedure TARNFCedente.SetCedAbaterIRRF(const Value: TNullableBoolean);
begin
  FCedAbaterIRRF := Value;
end;

procedure TARNFCedente.SetCedIRRFAcumulado(const Value: TNullableCurrency);
begin
  FCedIRRFAcumulado := Value;
end;

procedure TARNFCedente.SetCedAbaterRetidos(const Value: TNullableBoolean);
begin
  FCedAbaterRetidos := Value;
end;

procedure TARNFCedente.SetAgeCodigo(const Value: TNullableInteger);
begin
  FAgeCodigo := Value;
end;

procedure TARNFCedente.SetCedMsgDocControle(const Value: TNullableString);
begin
  FCedMsgDocControle := AjustaVarchar(Value, 5000);
end;

procedure TARNFCedente.SetCedValorLimiteCreditoCheque(const Value: TNullableCurrency);
begin
  FCedValorLimiteCreditoCheque := Value;
end;

procedure TARNFCedente.SetCedValorLimiteCreditoDuplicata(const Value: TNullableCurrency);
begin
  FCedValorLimiteCreditoDuplicata := Value;
end;

procedure TARNFCedente.SetCedValorLimiteCreditoSacadoCheque(const Value: TNullableCurrency);
begin
  FCedValorLimiteCreditoSacadoCheque := Value;
end;

procedure TARNFCedente.SetCedValorLimiteCreditoSacadoDuplicata(const Value: TNullableCurrency);
begin
  FCedValorLimiteCreditoSacadoDuplicata := Value;
end;

procedure TARNFCedente.SetCedSacadorPadrao(const Value: TNullableString);
begin
  FCedSacadorPadrao := AjustaVarchar(Value, 100);
end;

procedure TARNFCedente.SetCCCCodigo(const Value: TNullableInteger);
begin
  FCCCCodigo := Value;
end;

procedure TARNFCedente.SetCedTotalPendencias(const Value: TNullableCurrency);
begin
  FCedTotalPendencias := Value;
end;

procedure TARNFCedente.SetCedInstrucaoCobranca(const Value: TNullableString);
begin
  FCedInstrucaoCobranca := AjustaVarchar(Value, 80);
end;

procedure TARNFCedente.SetCedEmiteBoleto(const Value: TNullableBoolean);
begin
  FCedEmiteBoleto := Value;
end;

procedure TARNFCedente.SetCedDataConnstEmpresa(const Value: TNullableDateTime);
begin
  FCedDataConnstEmpresa := Value;
end;

procedure TARNFCedente.SetCedValorDoc(const Value: TNullableCurrency);
begin
  FCedValorDoc := Value;
end;

procedure TARNFCedente.SetCedValorTed(const Value: TNullableCurrency);
begin
  FCedValorTed := Value;
end;

procedure TARNFCedente.SetCedIncentIssqn(const Value: TNullableBoolean);
begin
  FCedIncentIssqn := Value;
end;

procedure TARNFCedente.SetCedNaoCobraCpmf(const Value: TNullableBoolean);
begin
  FCedNaoCobraCpmf := Value;
end;

procedure TARNFCedente.SetCedGerarTarifaAuto(const Value: TNullableBoolean);
begin
  FCedGerarTarifaAuto := Value;
end;

procedure TARNFCedente.SetSCoCodigo(const Value: TNullableInteger);
begin
  FSCoCodigo := Value;
end;

procedure TARNFCedente.SetCedprazoAtrasoPonderado(const Value: TNullableExtended);
begin
  FCedprazoAtrasoPonderado := Value;
end;

procedure TARNFCedente.SetCedRubricaContaGrafica(const Value: TNullableString);
begin
  FCedRubricaContaGrafica := AjustaVarchar(Value, 30);
end;

procedure TARNFCedente.SetCGLHisCodigo(const Value: TNullableInteger);
begin
  FCGLHisCodigo := Value;
end;

procedure TARNFCedente.SetCedEmailEnvioDocumento(const Value: TNullableString);
begin
  FCedEmailEnvioDocumento := AjustaVarchar(Value, 150);
end;

procedure TARNFCedente.SetCedContadorNome(const Value: TNullableString);
begin
  FCedContadorNome := AjustaVarchar(Value, 150);
end;

procedure TARNFCedente.SetCedContadorCRC(const Value: TNullableString);
begin
  FCedContadorCRC := AjustaVarchar(Value, 20);
end;

procedure TARNFCedente.SetCedContadorCPF(const Value: TNullableString);
begin
  FCedContadorCPF := AjustaVarchar(Value, 14);
end;

procedure TARNFCedente.SetCedSacadorPadraoCNPJCPF(const Value: TNullableString);
begin
  FCedSacadorPadraoCNPJCPF := AjustaVarchar(Value, 14);
end;

procedure TARNFCedente.SetCedEmailEnvioEfetivacao(const Value: TNullableString);
begin
  FCedEmailEnvioEfetivacao := AjustaVarchar(Value, 300);
end;

procedure TARNFCedente.SetCedEnviarConsultaTitulosIntegracao(const Value: TNullableBoolean);
begin
  FCedEnviarConsultaTitulosIntegracao := Value;
end;

procedure TARNFCedente.SetDesconsideraCedOuvidoria(const Value: TNullableBoolean);
begin
  FDesconsideraCedOuvidoria := Value;
end;

procedure TARNFCedente.SetCedContato(const Value: TNullableString);
begin
  FCedContato := AjustaVarchar(Value, 50);
end;

procedure TARNFCedente.SetCedPercComissao(const Value: TNullableExtended);
begin
  FCedPercComissao := Value;
end;

procedure TARNFCedente.SetCedClassificacao(const Value: TNullableString);
begin
  FCedClassificacao := AjustaVarchar(Value, 30);
end;

procedure TARNFCedente.SetCedDataInclusao(const Value: TNullableDateTime);
begin
  FCedDataInclusao := Value;
end;

procedure TARNFCedente.SetCedUsuarioInclusao(const Value: TNullableString);
begin
  FCedUsuarioInclusao := AjustaVarchar(Value, 250);
end;

procedure TARNFCedente.SetCedCodime(const Value: TNullableBoolean);
begin
  FCedCodime := Value;
end;

procedure TARNFCedente.SetCedLimiteControleSecuritizacaoValor(const Value: TNullableCurrency);
begin
  FCedLimiteControleSecuritizacaoValor := Value;
end;

procedure TARNFCedente.SetCedLimiteControleSecuritizacaoPeriodo(const Value: TNullableString);
begin
  FCedLimiteControleSecuritizacaoPeriodo := AjustaVarchar(Value, 5);
end;

procedure TARNFCedente.SetCedRecompraTaxaMulta(const Value: TNullableExtended);
begin
  FCedRecompraTaxaMulta := Value;
end;

procedure TARNFCedente.SetCedContabilidadeContaTransferencia(const Value: TNullableString);
begin
  FCedContabilidadeContaTransferencia := AjustaVarchar(Value, 20);
end;

procedure TARNFCedente.SetUsuarioUltimaAlteracao(const Value: string);
begin
  FUsuarioUltimaAlteracao := AjustaVarchar(Value, 50);
end;

procedure TARNFCedente.SetAlteracaoViaCadastro(const Value: TNullableBoolean);
begin
  FAlteracaoViaCadastro := Value;
end;

procedure TARNFCedente.SetCedSerasaMonitoreValorSaldoDevedorGerenciamento(const Value: TNullableCurrency);
begin
  FCedSerasaMonitoreValorSaldoDevedorGerenciamento := Value;
end;

procedure TARNFCedente.SetCedSerasaMonitorePrazo(const Value: TNullableInteger);
begin
  FCedSerasaMonitorePrazo := Value;
end;

procedure TARNFCedente.SetCedSerasaGru_ID(const Value: TNullableInteger);
begin
  FCedSerasaGru_ID := Value;
end;

procedure TARNFCedente.SetCedSerasaPer_ID(const Value: TNullableInteger);
begin
  FCedSerasaPer_ID := Value;
end;

procedure TARNFCedente.SetCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ(const Value: TNullableCurrency);
begin
  FCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ := Value;
end;

procedure TARNFCedente.SetCedSerasaMonitoreValorSaldoDevedorSacadoCPF(const Value: TNullableCurrency);
begin
  FCedSerasaMonitoreValorSaldoDevedorSacadoCPF := Value;
end;

procedure TARNFCedente.SetCedPercentualMulta(const Value: TNullableExtended);
begin
  FCedPercentualMulta := Value;
end;

procedure TARNFCedente.SetCedConsideraInstrucaoSegundaVia(const Value: TNullableBoolean);
begin
  FCedConsideraInstrucaoSegundaVia := Value;
end;

procedure TARNFCedente.SetCedNaoProtetar(const Value: TNullableBoolean);
begin
  FCedNaoProtetar := Value;
end;

procedure TARNFCedente.SetUsuLogin1(const Value: TNullableString);
begin
  FUsuLogin1 := AjustaVarchar(Value, 100);
end;

procedure TARNFCedente.SetUsuLogin2(const Value: TNullableString);
begin
  FUsuLogin2 := AjustaVarchar(Value, 100);
end;

procedure TARNFCedente.SetUsuLogin3(const Value: TNullableString);
begin
  FUsuLogin3 := AjustaVarchar(Value, 100);
end;

procedure TARNFCedente.SetUsuLogin4(const Value: TNullableString);
begin
  FUsuLogin4 := AjustaVarchar(Value, 100);
end;

procedure TARNFCedente.SetUsuLogin5(const Value: TNullableString);
begin
  FUsuLogin5 := AjustaVarchar(Value, 500);
end;

procedure TARNFCedente.SetUsuAgenteChecagem(const Value: TNullableString);
begin
  FUsuAgenteChecagem := AjustaVarchar(Value, 300);
end;

procedure TARNFCedente.SetCedPriorizarPainelChecagem(const Value: TNullableBoolean);
begin
  FCedPriorizarPainelChecagem := Value;
end;

procedure TARNFCedente.SetConCodigo(const Value: TNullableInteger);
begin
  FConCodigo := Value;
end;

procedure TARNFCedente.SetCedContabilidadeContaClientes(const Value: TNullableString);
begin
  FCedContabilidadeContaClientes := AjustaVarchar(Value, 20);
end;

procedure TARNFCedente.SetCedContabilidadeContaFomento(const Value: TNullableString);
begin
  FCedContabilidadeContaFomento := AjustaVarchar(Value, 20);
end;

procedure TARNFCedente.SetCedContabilidadeContaCtaGrafica(const Value: TNullableString);
begin
  FCedContabilidadeContaCtaGrafica := AjustaVarchar(Value, 20);
end;

procedure TARNFCedente.SetCedContabilidadeContaConfissao(const Value: TNullableString);
begin
  FCedContabilidadeContaConfissao := AjustaVarchar(Value, 20);
end;

procedure TARNFCedente.SetIncluido(const Value: TNullableInteger);
begin
  FIncluido := Value;
end;

procedure TARNFCedente.SetCedNaoEnviaPefin(const Value: TNullableBoolean);
begin
  FCedNaoEnviaPefin := Value;
end;

procedure TARNFCedente.SetCedgru_id(const Value: TNullableInteger);
begin
  FCedgru_id := Value;
end;

procedure TARNFCedente.SetPOCCan(const Value: TNullableBoolean);
begin
  FPOCCan := Value;
end;

procedure TARNFCedente.SetCnaeCodigo(const Value: TNullableString);
begin
  FCnaeCodigo := AjustaVarchar(Value, 10);
end;

procedure TARNFCedente.SetCedMensagemBoleto1(const Value: TNullableString);
begin
  FCedMensagemBoleto1 := AjustaVarchar(Value, 200);
end;

procedure TARNFCedente.SetCedMensagemBoleto2(const Value: TNullableString);
begin
  FCedMensagemBoleto2 := AjustaVarchar(Value, 200);
end;

procedure TARNFCedente.SetCedMensagemBoleto3(const Value: TNullableString);
begin
  FCedMensagemBoleto3 := AjustaVarchar(Value, 200);
end;

procedure TARNFCedente.SetCedMensagemBoleto4(const Value: TNullableString);
begin
  FCedMensagemBoleto4 := AjustaVarchar(Value, 200);
end;

procedure TARNFCedente.SetCedMensagemBoleto5(const Value: TNullableString);
begin
  FCedMensagemBoleto5 := AjustaVarchar(Value, 200);
end;

procedure TARNFCedente.SetCedEmiteBoletoComoCedenteBoleto(const Value: TNullableBoolean);
begin
  FCedEmiteBoletoComoCedenteBoleto := Value;
end;

class function TARNFCedente.Metadata: IActiveRecordMetadata;
begin
  Result := TARNFCedenteMetadataObject.Create;
end;

procedure TARNFCedente.Persist;
begin
  PersistSQL;
end;

procedure TARNFCedente.PersistSQL;
begin
  if GetDeleted then
  begin
    GARNFCedenteDeleteCriticalSection.Acquire;
    try
      TARNFCedenteDelete.Create.Persist(Self);
    finally
      GARNFCedenteDeleteCriticalSection.Release;
    end;
  end
  else
  begin
    if GetNovo then
    begin
      GARNFCedenteInsertCriticalSection.Acquire;
      try
        TARNFCedenteInsert.Create.Persist(Self);
      finally
        GARNFCedenteInsertCriticalSection.Release;
      end;
    end
    else
    begin
      GARNFCedenteUpdateCriticalSection.Acquire;
      try
        TARNFCedenteUpdate.Create.Persist(Self);
      finally
        GARNFCedenteUpdateCriticalSection.Release;
      end;
    end;
  end;
end;

procedure TARNFCedente.SetRecordSet(const ARecordSet: _RecordSet; AOffset: Integer);
begin
  FPrimaryKeyID := ARecordSet.Fields[Campo_NFCedente_ID + AOffset].Value;
  FID := ARecordSet.Fields[Campo_NFCedente_ID + AOffset].Value;
  FCedCodigo := ARecordSet.Fields[Campo_NFCedente_CedCodigo + AOffset].Value;
  FPesCNPJCPF := ARecordSet.Fields[Campo_NFCedente_PesCNPJCPF + AOffset].Value;
  FIDGCodigo := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_IDGCodigo + AOffset].Value);
  FCedContratoNumero := VariantToNullableInteger(ARecordSet.Fields[Campo_NFCedente_CedContratoNumero + AOffset].Value);
  FCedContratoData := VariantToNullableDateTime(ARecordSet.Fields[Campo_NFCedente_CedContratoData + AOffset].Value);
  FCedFomentoSaldoDevedor := VariantToNullableCurrency(ARecordSet.Fields[Campo_NFCedente_CedFomentoSaldoDevedor + AOffset].Value);
  FEmpCodigo := ARecordSet.Fields[Campo_NFCedente_EmpCodigo + AOffset].Value;
  FCedObservacao := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedObservacao + AOffset].Value);
  FFilFiltro := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_FilFiltro + AOffset].Value);
  FCedSimples := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_CedSimples + AOffset].Value);
  FHisCodigo := VariantToNullableInteger(ARecordSet.Fields[Campo_NFCedente_HisCodigo + AOffset].Value);
  FCedRubricaOperacaoAtivo := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedRubricaOperacaoAtivo + AOffset].Value);
  FCedRubricaOperacaoCobranca := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedRubricaOperacaoCobranca + AOffset].Value);
  FCedRubricaOperacaoCaucao := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedRubricaOperacaoCaucao + AOffset].Value);
  FCedRubricaPassivo := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedRubricaPassivo + AOffset].Value);
  FCedRubricaDespesa := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedRubricaDespesa + AOffset].Value);
  FCedAbaterIRRF := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_CedAbaterIRRF + AOffset].Value);
  FCedIRRFAcumulado := VariantToNullableCurrency(ARecordSet.Fields[Campo_NFCedente_CedIRRFAcumulado + AOffset].Value);
  FCedAbaterRetidos := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_CedAbaterRetidos + AOffset].Value);
  FAgeCodigo := VariantToNullableInteger(ARecordSet.Fields[Campo_NFCedente_AgeCodigo + AOffset].Value);
  FCedMsgDocControle := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedMsgDocControle + AOffset].Value);
  FCedValorLimiteCreditoCheque := VariantToNullableCurrency(ARecordSet.Fields[Campo_NFCedente_CedValorLimiteCreditoCheque + AOffset].Value);
  FCedValorLimiteCreditoDuplicata := VariantToNullableCurrency(ARecordSet.Fields[Campo_NFCedente_CedValorLimiteCreditoDuplicata + AOffset].Value);
  FCedValorLimiteCreditoSacadoCheque := VariantToNullableCurrency(ARecordSet.Fields[Campo_NFCedente_CedValorLimiteCreditoSacadoCheque + AOffset].Value);
  FCedValorLimiteCreditoSacadoDuplicata := VariantToNullableCurrency(ARecordSet.Fields[Campo_NFCedente_CedValorLimiteCreditoSacadoDuplicata + AOffset].Value);
  FCedSacadorPadrao := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedSacadorPadrao + AOffset].Value);
  FCCCCodigo := VariantToNullableInteger(ARecordSet.Fields[Campo_NFCedente_CCCCodigo + AOffset].Value);
  FCedTotalPendencias := VariantToNullableCurrency(ARecordSet.Fields[Campo_NFCedente_CedTotalPendencias + AOffset].Value);
  FCedInstrucaoCobranca := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedInstrucaoCobranca + AOffset].Value);
  FCedEmiteBoleto := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_CedEmiteBoleto + AOffset].Value);
  FCedDataConnstEmpresa := VariantToNullableDateTime(ARecordSet.Fields[Campo_NFCedente_CedDataConnstEmpresa + AOffset].Value);
  FCedValorDoc := VariantToNullableCurrency(ARecordSet.Fields[Campo_NFCedente_CedValorDoc + AOffset].Value);
  FCedValorTed := VariantToNullableCurrency(ARecordSet.Fields[Campo_NFCedente_CedValorTed + AOffset].Value);
  FCedIncentIssqn := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_CedIncentIssqn + AOffset].Value);
  FCedNaoCobraCpmf := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_CedNaoCobraCpmf + AOffset].Value);
  FCedGerarTarifaAuto := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_CedGerarTarifaAuto + AOffset].Value);
  FSCoCodigo := VariantToNullableInteger(ARecordSet.Fields[Campo_NFCedente_SCoCodigo + AOffset].Value);
  FCedprazoAtrasoPonderado := VariantToNullableExtended(ARecordSet.Fields[Campo_NFCedente_CedprazoAtrasoPonderado + AOffset].Value);
  FCedRubricaContaGrafica := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedRubricaContaGrafica + AOffset].Value);
  FCGLHisCodigo := VariantToNullableInteger(ARecordSet.Fields[Campo_NFCedente_CGLHisCodigo + AOffset].Value);
  FCedEmailEnvioDocumento := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedEmailEnvioDocumento + AOffset].Value);
  FCedContadorNome := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedContadorNome + AOffset].Value);
  FCedContadorCRC := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedContadorCRC + AOffset].Value);
  FCedContadorCPF := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedContadorCPF + AOffset].Value);
  FCedSacadorPadraoCNPJCPF := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedSacadorPadraoCNPJCPF + AOffset].Value);
  FCedEmailEnvioEfetivacao := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedEmailEnvioEfetivacao + AOffset].Value);
  FCedEnviarConsultaTitulosIntegracao := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_CedEnviarConsultaTitulosIntegracao + AOffset].Value);
  FDesconsideraCedOuvidoria := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_DesconsideraCedOuvidoria + AOffset].Value);
  FCedContato := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedContato + AOffset].Value);
  FCedPercComissao := VariantToNullableExtended(ARecordSet.Fields[Campo_NFCedente_CedPercComissao + AOffset].Value);
  FCedClassificacao := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedClassificacao + AOffset].Value);
  FCedDataInclusao := VariantToNullableDateTime(ARecordSet.Fields[Campo_NFCedente_CedDataInclusao + AOffset].Value);
  FCedUsuarioInclusao := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedUsuarioInclusao + AOffset].Value);
  FCedCodime := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_CedCodime + AOffset].Value);
  FCedLimiteControleSecuritizacaoValor := VariantToNullableCurrency(ARecordSet.Fields[Campo_NFCedente_CedLimiteControleSecuritizacaoValor + AOffset].Value);
  FCedLimiteControleSecuritizacaoPeriodo := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedLimiteControleSecuritizacaoPeriodo + AOffset].Value);
  FCedRecompraTaxaMulta := VariantToNullableExtended(ARecordSet.Fields[Campo_NFCedente_CedRecompraTaxaMulta + AOffset].Value);
  FCedContabilidadeContaTransferencia := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedContabilidadeContaTransferencia + AOffset].Value);
  FUsuarioUltimaAlteracao := ARecordSet.Fields[Campo_NFCedente_UsuarioUltimaAlteracao + AOffset].Value;
  FAlteracaoViaCadastro := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_AlteracaoViaCadastro + AOffset].Value);
  FCedSerasaMonitoreValorSaldoDevedorGerenciamento := VariantToNullableCurrency(ARecordSet.Fields[Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorGerenciamento + AOffset].Value);
  FCedSerasaMonitorePrazo := VariantToNullableInteger(ARecordSet.Fields[Campo_NFCedente_CedSerasaMonitorePrazo + AOffset].Value);
  FCedSerasaGru_ID := VariantToNullableInteger(ARecordSet.Fields[Campo_NFCedente_CedSerasaGru_ID + AOffset].Value);
  FCedSerasaPer_ID := VariantToNullableInteger(ARecordSet.Fields[Campo_NFCedente_CedSerasaPer_ID + AOffset].Value);
  FCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ := VariantToNullableCurrency(ARecordSet.Fields[Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ + AOffset].Value);
  FCedSerasaMonitoreValorSaldoDevedorSacadoCPF := VariantToNullableCurrency(ARecordSet.Fields[Campo_NFCedente_CedSerasaMonitoreValorSaldoDevedorSacadoCPF + AOffset].Value);
  FCedPercentualMulta := VariantToNullableExtended(ARecordSet.Fields[Campo_NFCedente_CedPercentualMulta + AOffset].Value);
  FCedConsideraInstrucaoSegundaVia := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_CedConsideraInstrucaoSegundaVia + AOffset].Value);
  FCedNaoProtetar := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_CedNaoProtetar + AOffset].Value);
  FUsuLogin1 := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_UsuLogin1 + AOffset].Value);
  FUsuLogin2 := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_UsuLogin2 + AOffset].Value);
  FUsuLogin3 := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_UsuLogin3 + AOffset].Value);
  FUsuLogin4 := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_UsuLogin4 + AOffset].Value);
  FUsuLogin5 := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_UsuLogin5 + AOffset].Value);
  FUsuAgenteChecagem := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_UsuAgenteChecagem + AOffset].Value);
  FCedPriorizarPainelChecagem := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_CedPriorizarPainelChecagem + AOffset].Value);
  FConCodigo := VariantToNullableInteger(ARecordSet.Fields[Campo_NFCedente_ConCodigo + AOffset].Value);
  FCedContabilidadeContaClientes := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedContabilidadeContaClientes + AOffset].Value);
  FCedContabilidadeContaFomento := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedContabilidadeContaFomento + AOffset].Value);
  FCedContabilidadeContaCtaGrafica := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedContabilidadeContaCtaGrafica + AOffset].Value);
  FCedContabilidadeContaConfissao := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedContabilidadeContaConfissao + AOffset].Value);
  FIncluido := VariantToNullableInteger(ARecordSet.Fields[Campo_NFCedente_Incluido + AOffset].Value);
  FCedNaoEnviaPefin := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_CedNaoEnviaPefin + AOffset].Value);
  FCedgru_id := VariantToNullableInteger(ARecordSet.Fields[Campo_NFCedente_Cedgru_id + AOffset].Value);
  FPOCCan := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_POCCan + AOffset].Value);
  FCnaeCodigo := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CnaeCodigo + AOffset].Value);
  FCedMensagemBoleto1 := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedMensagemBoleto1 + AOffset].Value);
  FCedMensagemBoleto2 := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedMensagemBoleto2 + AOffset].Value);
  FCedMensagemBoleto3 := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedMensagemBoleto3 + AOffset].Value);
  FCedMensagemBoleto4 := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedMensagemBoleto4 + AOffset].Value);
  FCedMensagemBoleto5 := VariantToNullableString(ARecordSet.Fields[Campo_NFCedente_CedMensagemBoleto5 + AOffset].Value);
  FCedEmiteBoletoComoCedenteBoleto := VariantToNullableB01(ARecordSet.Fields[Campo_NFCedente_CedEmiteBoletoComoCedenteBoleto + AOffset].Value);
end;

class function TARNFCedente.ViewMetadata: IActiveRecordMetadata;
begin
  Result := Metadata;
end;

{ TARNFCedenteDelete }

procedure TARNFCedenteDelete.DefineParameters;
begin
  Command.Parameters.Append(Command.CreateParameter('ID', adInteger, adParamInput, 0, Null));
end;

function TARNFCedenteDelete.GetCommandSQL: string;
begin
  Result :=
    'delete from nfcedente'#13#10 +
    'where'#13#10 +
    '  id = ?';
end;

procedure TARNFCedenteDelete.Persist(AARNFCedente: TARNFCedente);
begin
  inherited Persist(AARNFCedente);
  //Chaves
  Command.Parameters[0].Value := AARNFCedente.FID;
  if Execute <> 1 then
    raise EActiveRecord.Create('Delete Failed TARNFCedenteDelete');
end;

{ TARNFCedenteInsert }

procedure TARNFCedenteInsert.DefineParameters;
begin
  Command.Parameters.Append(Command.CreateParameter('CedCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('PesCNPJCPF', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('IDGCodigo', adVarChar, adParamInput, 8, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContratoNumero', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContratoData', adDBTimeStamp, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedFomentoSaldoDevedor', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('EmpCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedObservacao', adVarChar, adParamInput, 5000, Null));
  Command.Parameters.Append(Command.CreateParameter('FilFiltro', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSimples', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('HisCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedRubricaOperacaoAtivo', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CedRubricaOperacaoCobranca', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CedRubricaOperacaoCaucao', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CedRubricaPassivo', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CedRubricaDespesa', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CedAbaterIRRF', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedIRRFAcumulado', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedAbaterRetidos', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('AgeCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedMsgDocControle', adVarChar, adParamInput, 5000, Null));
  Command.Parameters.Append(Command.CreateParameter('CedValorLimiteCreditoCheque', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedValorLimiteCreditoDuplicata', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedValorLimiteCreditoSacadoCheque', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedValorLimiteCreditoSacadoDuplicata', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSacadorPadrao', adVarChar, adParamInput, 100, Null));
  Command.Parameters.Append(Command.CreateParameter('CCCCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedTotalPendencias', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedInstrucaoCobranca', adVarChar, adParamInput, 80, Null));
  Command.Parameters.Append(Command.CreateParameter('CedEmiteBoleto', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedDataConnstEmpresa', adDBTimeStamp, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedValorDoc', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedValorTed', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedIncentIssqn', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedNaoCobraCpmf', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedGerarTarifaAuto', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SCoCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedprazoAtrasoPonderado', adDouble, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedRubricaContaGrafica', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CGLHisCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedEmailEnvioDocumento', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContadorNome', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContadorCRC', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContadorCPF', adVarChar, adParamInput, 14, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSacadorPadraoCNPJCPF', adVarChar, adParamInput, 14, Null));
  Command.Parameters.Append(Command.CreateParameter('CedEmailEnvioEfetivacao', adVarChar, adParamInput, 300, Null));
  Command.Parameters.Append(Command.CreateParameter('CedEnviarConsultaTitulosIntegracao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('DesconsideraCedOuvidoria', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContato', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('CedPercComissao', adDouble, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedClassificacao', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CedDataInclusao', adDBTimeStamp, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedUsuarioInclusao', adVarChar, adParamInput, 250, Null));
  Command.Parameters.Append(Command.CreateParameter('CedCodime', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedLimiteControleSecuritizacaoValor', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedLimiteControleSecuritizacaoPeriodo', adVarChar, adParamInput, 5, Null));
  Command.Parameters.Append(Command.CreateParameter('CedRecompraTaxaMulta', adDouble, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContabilidadeContaTransferencia', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuarioUltimaAlteracao', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('AlteracaoViaCadastro', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSerasaMonitoreValorSaldoDevedorGerenciamento', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSerasaMonitorePrazo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSerasaGru_ID', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSerasaPer_ID', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSerasaMonitoreValorSaldoDevedorSacadoCPF', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedPercentualMulta', adDouble, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedConsideraInstrucaoSegundaVia', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedNaoProtetar', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLogin1', adVarChar, adParamInput, 100, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLogin2', adVarChar, adParamInput, 100, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLogin3', adVarChar, adParamInput, 100, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLogin4', adVarChar, adParamInput, 100, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLogin5', adVarChar, adParamInput, 500, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAgenteChecagem', adVarChar, adParamInput, 300, Null));
  Command.Parameters.Append(Command.CreateParameter('CedPriorizarPainelChecagem', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('ConCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContabilidadeContaClientes', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContabilidadeContaFomento', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContabilidadeContaCtaGrafica', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContabilidadeContaConfissao', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('Incluido', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedNaoEnviaPefin', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('Cedgru_id', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('POCCan', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CnaeCodigo', adVarChar, adParamInput, 10, Null));
  Command.Parameters.Append(Command.CreateParameter('CedMensagemBoleto1', adVarChar, adParamInput, 200, Null));
  Command.Parameters.Append(Command.CreateParameter('CedMensagemBoleto2', adVarChar, adParamInput, 200, Null));
  Command.Parameters.Append(Command.CreateParameter('CedMensagemBoleto3', adVarChar, adParamInput, 200, Null));
  Command.Parameters.Append(Command.CreateParameter('CedMensagemBoleto4', adVarChar, adParamInput, 200, Null));
  Command.Parameters.Append(Command.CreateParameter('CedMensagemBoleto5', adVarChar, adParamInput, 200, Null));
  Command.Parameters.Append(Command.CreateParameter('CedEmiteBoletoComoCedenteBoleto', adInteger, adParamInput, 0, Null));
end;

function TARNFCedenteInsert.GetCommandSQL: string;
begin
  Result :=
    'insert into nfcedente ('#13#10 +
    '  cedcodigo, pescnpjcpf, idgcodigo, cedcontratonumero,'#13#10 +
    '  cedcontratodata, cedfomentosaldodevedor, empcodigo, cedobservacao, filfiltro,'#13#10 +
    '  cedsimples, hiscodigo, cedrubricaoperacaoativo, cedrubricaoperacaocobranca, cedrubricaoperacaocaucao,'#13#10 +
    '  cedrubricapassivo, cedrubricadespesa, cedabaterirrf, cedirrfacumulado, cedabaterretidos,'#13#10 +
    '  agecodigo, cedmsgdoccontrole, cedvalorlimitecreditocheque, cedvalorlimitecreditoduplicata, cedvalorlimitecreditosacadocheque,'#13#10 +
    '  cedvalorlimitecreditosacadoduplicata, cedsacadorpadrao, ccccodigo, cedtotalpendencias, cedinstrucaocobranca,'#13#10 +
    '  cedemiteboleto, ceddataconnstempresa, cedvalordoc, cedvalorted, cedincentissqn,'#13#10 +
    '  cednaocobracpmf, cedgerartarifaauto, scocodigo, cedprazoatrasoponderado, cedrubricacontagrafica,'#13#10 +
    '  cglhiscodigo, cedemailenviodocumento, cedcontadornome, cedcontadorcrc, cedcontadorcpf,'#13#10 +
    '  cedsacadorpadraocnpjcpf, cedemailenvioefetivacao, cedenviarconsultatitulosintegracao, desconsideracedouvidoria, cedcontato,'#13#10 +
    '  cedperccomissao, cedclassificacao, ceddatainclusao, cedusuarioinclusao, cedcodime,'#13#10 +
    '  cedlimitecontrolesecuritizacaovalor, cedlimitecontrolesecuritizacaoperiodo, cedrecomprataxamulta, cedcontabilidadecontatransferencia, usuarioultimaalteracao,'#13#10 +
    '  alteracaoviacadastro, cedserasamonitorevalorsaldodevedorgerenciamento, cedserasamonitoreprazo, cedserasagru_id, cedserasaper_id,'#13#10 +
    '  cedserasamonitorevalorsaldodevedorsacadocnpj, cedserasamonitorevalorsaldodevedorsacadocpf, cedpercentualmulta, cedconsiderainstrucaosegundavia, cednaoprotetar,'#13#10 +
    '  usulogin1, usulogin2, usulogin3, usulogin4, usulogin5,'#13#10 +
    '  usuagentechecagem, cedpriorizarpainelchecagem, concodigo, cedcontabilidadecontaclientes, cedcontabilidadecontafomento,'#13#10 +
    '  cedcontabilidadecontactagrafica, cedcontabilidadecontaconfissao, incluido, cednaoenviapefin, cedgru_id,'#13#10 +
    '  poccan, cnaecodigo, cedmensagemboleto1, cedmensagemboleto2, cedmensagemboleto3,'#13#10 +
    '  cedmensagemboleto4, cedmensagemboleto5, cedemiteboletocomocedenteboleto'#13#10 +
    ') output inserted.id values ('#13#10 +
    '  ?, ?, ?, ?,'#13#10 +
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
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?'#13#10 +
    ')';
end;

procedure TARNFCedenteInsert.Persist(AARNFCedente: TARNFCedente);
begin
  inherited Persist(AARNFCedente);
  Command.Parameters[0].Value := AARNFCedente.FCedCodigo;
  Command.Parameters[1].Value := AARNFCedente.FPesCNPJCPF;
  Command.Parameters[2].Value := TActiveRecord.ToVariant(AARNFCedente.FIDGCodigo);
  Command.Parameters[3].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContratoNumero);
  Command.Parameters[4].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContratoData);
  Command.Parameters[5].Value := TActiveRecord.ToVariant(AARNFCedente.FCedFomentoSaldoDevedor);
  Command.Parameters[6].Value := AARNFCedente.FEmpCodigo;
  Command.Parameters[7].Value := TActiveRecord.ToVariant(AARNFCedente.FCedObservacao);
  Command.Parameters[8].Value := TActiveRecord.ToVariant(AARNFCedente.FFilFiltro);
  Command.Parameters[9].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedSimples);
  Command.Parameters[10].Value := TActiveRecord.ToVariant(AARNFCedente.FHisCodigo);
  Command.Parameters[11].Value := TActiveRecord.ToVariant(AARNFCedente.FCedRubricaOperacaoAtivo);
  Command.Parameters[12].Value := TActiveRecord.ToVariant(AARNFCedente.FCedRubricaOperacaoCobranca);
  Command.Parameters[13].Value := TActiveRecord.ToVariant(AARNFCedente.FCedRubricaOperacaoCaucao);
  Command.Parameters[14].Value := TActiveRecord.ToVariant(AARNFCedente.FCedRubricaPassivo);
  Command.Parameters[15].Value := TActiveRecord.ToVariant(AARNFCedente.FCedRubricaDespesa);
  Command.Parameters[16].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedAbaterIRRF);
  Command.Parameters[17].Value := TActiveRecord.ToVariant(AARNFCedente.FCedIRRFAcumulado);
  Command.Parameters[18].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedAbaterRetidos);
  Command.Parameters[19].Value := TActiveRecord.ToVariant(AARNFCedente.FAgeCodigo);
  Command.Parameters[20].Value := TActiveRecord.ToVariant(AARNFCedente.FCedMsgDocControle);
  Command.Parameters[21].Value := TActiveRecord.ToVariant(AARNFCedente.FCedValorLimiteCreditoCheque);
  Command.Parameters[22].Value := TActiveRecord.ToVariant(AARNFCedente.FCedValorLimiteCreditoDuplicata);
  Command.Parameters[23].Value := TActiveRecord.ToVariant(AARNFCedente.FCedValorLimiteCreditoSacadoCheque);
  Command.Parameters[24].Value := TActiveRecord.ToVariant(AARNFCedente.FCedValorLimiteCreditoSacadoDuplicata);
  Command.Parameters[25].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSacadorPadrao);
  Command.Parameters[26].Value := TActiveRecord.ToVariant(AARNFCedente.FCCCCodigo);
  Command.Parameters[27].Value := TActiveRecord.ToVariant(AARNFCedente.FCedTotalPendencias);
  Command.Parameters[28].Value := TActiveRecord.ToVariant(AARNFCedente.FCedInstrucaoCobranca);
  Command.Parameters[29].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedEmiteBoleto);
  Command.Parameters[30].Value := TActiveRecord.ToVariant(AARNFCedente.FCedDataConnstEmpresa);
  Command.Parameters[31].Value := TActiveRecord.ToVariant(AARNFCedente.FCedValorDoc);
  Command.Parameters[32].Value := TActiveRecord.ToVariant(AARNFCedente.FCedValorTed);
  Command.Parameters[33].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedIncentIssqn);
  Command.Parameters[34].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedNaoCobraCpmf);
  Command.Parameters[35].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedGerarTarifaAuto);
  Command.Parameters[36].Value := TActiveRecord.ToVariant(AARNFCedente.FSCoCodigo);
  Command.Parameters[37].Value := TActiveRecord.ToVariant(AARNFCedente.FCedprazoAtrasoPonderado);
  Command.Parameters[38].Value := TActiveRecord.ToVariant(AARNFCedente.FCedRubricaContaGrafica);
  Command.Parameters[39].Value := TActiveRecord.ToVariant(AARNFCedente.FCGLHisCodigo);
  Command.Parameters[40].Value := TActiveRecord.ToVariant(AARNFCedente.FCedEmailEnvioDocumento);
  Command.Parameters[41].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContadorNome);
  Command.Parameters[42].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContadorCRC);
  Command.Parameters[43].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContadorCPF);
  Command.Parameters[44].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSacadorPadraoCNPJCPF);
  Command.Parameters[45].Value := TActiveRecord.ToVariant(AARNFCedente.FCedEmailEnvioEfetivacao);
  Command.Parameters[46].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedEnviarConsultaTitulosIntegracao);
  Command.Parameters[47].Value := TActiveRecord.ToVariantB01(AARNFCedente.FDesconsideraCedOuvidoria);
  Command.Parameters[48].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContato);
  Command.Parameters[49].Value := TActiveRecord.ToVariant(AARNFCedente.FCedPercComissao);
  Command.Parameters[50].Value := TActiveRecord.ToVariant(AARNFCedente.FCedClassificacao);
  Command.Parameters[51].Value := TActiveRecord.ToVariant(AARNFCedente.FCedDataInclusao);
  Command.Parameters[52].Value := TActiveRecord.ToVariant(AARNFCedente.FCedUsuarioInclusao);
  Command.Parameters[53].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedCodime);
  Command.Parameters[54].Value := TActiveRecord.ToVariant(AARNFCedente.FCedLimiteControleSecuritizacaoValor);
  Command.Parameters[55].Value := TActiveRecord.ToVariant(AARNFCedente.FCedLimiteControleSecuritizacaoPeriodo);
  Command.Parameters[56].Value := TActiveRecord.ToVariant(AARNFCedente.FCedRecompraTaxaMulta);
  Command.Parameters[57].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContabilidadeContaTransferencia);
  Command.Parameters[58].Value := AARNFCedente.FUsuarioUltimaAlteracao;
  Command.Parameters[59].Value := TActiveRecord.ToVariantB01(AARNFCedente.FAlteracaoViaCadastro);
  Command.Parameters[60].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSerasaMonitoreValorSaldoDevedorGerenciamento);
  Command.Parameters[61].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSerasaMonitorePrazo);
  Command.Parameters[62].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSerasaGru_ID);
  Command.Parameters[63].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSerasaPer_ID);
  Command.Parameters[64].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ);
  Command.Parameters[65].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSerasaMonitoreValorSaldoDevedorSacadoCPF);
  Command.Parameters[66].Value := TActiveRecord.ToVariant(AARNFCedente.FCedPercentualMulta);
  Command.Parameters[67].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedConsideraInstrucaoSegundaVia);
  Command.Parameters[68].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedNaoProtetar);
  Command.Parameters[69].Value := TActiveRecord.ToVariant(AARNFCedente.FUsuLogin1);
  Command.Parameters[70].Value := TActiveRecord.ToVariant(AARNFCedente.FUsuLogin2);
  Command.Parameters[71].Value := TActiveRecord.ToVariant(AARNFCedente.FUsuLogin3);
  Command.Parameters[72].Value := TActiveRecord.ToVariant(AARNFCedente.FUsuLogin4);
  Command.Parameters[73].Value := TActiveRecord.ToVariant(AARNFCedente.FUsuLogin5);
  Command.Parameters[74].Value := TActiveRecord.ToVariant(AARNFCedente.FUsuAgenteChecagem);
  Command.Parameters[75].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedPriorizarPainelChecagem);
  Command.Parameters[76].Value := TActiveRecord.ToVariant(AARNFCedente.FConCodigo);
  Command.Parameters[77].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContabilidadeContaClientes);
  Command.Parameters[78].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContabilidadeContaFomento);
  Command.Parameters[79].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContabilidadeContaCtaGrafica);
  Command.Parameters[80].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContabilidadeContaConfissao);
  Command.Parameters[81].Value := TActiveRecord.ToVariant(AARNFCedente.FIncluido);
  Command.Parameters[82].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedNaoEnviaPefin);
  Command.Parameters[83].Value := TActiveRecord.ToVariant(AARNFCedente.FCedgru_id);
  Command.Parameters[84].Value := TActiveRecord.ToVariantB01(AARNFCedente.FPOCCan);
  Command.Parameters[85].Value := TActiveRecord.ToVariant(AARNFCedente.FCnaeCodigo);
  Command.Parameters[86].Value := TActiveRecord.ToVariant(AARNFCedente.FCedMensagemBoleto1);
  Command.Parameters[87].Value := TActiveRecord.ToVariant(AARNFCedente.FCedMensagemBoleto2);
  Command.Parameters[88].Value := TActiveRecord.ToVariant(AARNFCedente.FCedMensagemBoleto3);
  Command.Parameters[89].Value := TActiveRecord.ToVariant(AARNFCedente.FCedMensagemBoleto4);
  Command.Parameters[90].Value := TActiveRecord.ToVariant(AARNFCedente.FCedMensagemBoleto5);
  Command.Parameters[91].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedEmiteBoletoComoCedenteBoleto);
  AARNFCedente.FID := ExecuteReturnAutoInc;
  //Atribuições das Chaves após o insert
  AARNFCedente.FPrimaryKeyID := AARNFCedente.FID;
end;

{ TARNFCedenteUpdate }

procedure TARNFCedenteUpdate.DefineParameters;
begin
  Command.Parameters.Append(Command.CreateParameter('CedCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('PesCNPJCPF', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('IDGCodigo', adVarChar, adParamInput, 8, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContratoNumero', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContratoData', adDBTimeStamp, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedFomentoSaldoDevedor', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('EmpCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedObservacao', adVarChar, adParamInput, 5000, Null));
  Command.Parameters.Append(Command.CreateParameter('FilFiltro', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSimples', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('HisCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedRubricaOperacaoAtivo', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CedRubricaOperacaoCobranca', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CedRubricaOperacaoCaucao', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CedRubricaPassivo', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CedRubricaDespesa', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CedAbaterIRRF', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedIRRFAcumulado', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedAbaterRetidos', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('AgeCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedMsgDocControle', adVarChar, adParamInput, 5000, Null));
  Command.Parameters.Append(Command.CreateParameter('CedValorLimiteCreditoCheque', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedValorLimiteCreditoDuplicata', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedValorLimiteCreditoSacadoCheque', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedValorLimiteCreditoSacadoDuplicata', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSacadorPadrao', adVarChar, adParamInput, 100, Null));
  Command.Parameters.Append(Command.CreateParameter('CCCCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedTotalPendencias', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedInstrucaoCobranca', adVarChar, adParamInput, 80, Null));
  Command.Parameters.Append(Command.CreateParameter('CedEmiteBoleto', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedDataConnstEmpresa', adDBTimeStamp, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedValorDoc', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedValorTed', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedIncentIssqn', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedNaoCobraCpmf', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedGerarTarifaAuto', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SCoCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedprazoAtrasoPonderado', adDouble, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedRubricaContaGrafica', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CGLHisCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedEmailEnvioDocumento', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContadorNome', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContadorCRC', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContadorCPF', adVarChar, adParamInput, 14, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSacadorPadraoCNPJCPF', adVarChar, adParamInput, 14, Null));
  Command.Parameters.Append(Command.CreateParameter('CedEmailEnvioEfetivacao', adVarChar, adParamInput, 300, Null));
  Command.Parameters.Append(Command.CreateParameter('CedEnviarConsultaTitulosIntegracao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('DesconsideraCedOuvidoria', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContato', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('CedPercComissao', adDouble, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedClassificacao', adVarChar, adParamInput, 30, Null));
  Command.Parameters.Append(Command.CreateParameter('CedDataInclusao', adDBTimeStamp, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedUsuarioInclusao', adVarChar, adParamInput, 250, Null));
  Command.Parameters.Append(Command.CreateParameter('CedCodime', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedLimiteControleSecuritizacaoValor', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedLimiteControleSecuritizacaoPeriodo', adVarChar, adParamInput, 5, Null));
  Command.Parameters.Append(Command.CreateParameter('CedRecompraTaxaMulta', adDouble, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContabilidadeContaTransferencia', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuarioUltimaAlteracao', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('AlteracaoViaCadastro', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSerasaMonitoreValorSaldoDevedorGerenciamento', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSerasaMonitorePrazo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSerasaGru_ID', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSerasaPer_ID', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSerasaMonitoreValorSaldoDevedorSacadoCNPJ', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedSerasaMonitoreValorSaldoDevedorSacadoCPF', adCurrency, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedPercentualMulta', adDouble, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedConsideraInstrucaoSegundaVia', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedNaoProtetar', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLogin1', adVarChar, adParamInput, 100, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLogin2', adVarChar, adParamInput, 100, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLogin3', adVarChar, adParamInput, 100, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLogin4', adVarChar, adParamInput, 100, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLogin5', adVarChar, adParamInput, 500, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuAgenteChecagem', adVarChar, adParamInput, 300, Null));
  Command.Parameters.Append(Command.CreateParameter('CedPriorizarPainelChecagem', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('ConCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContabilidadeContaClientes', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContabilidadeContaFomento', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContabilidadeContaCtaGrafica', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('CedContabilidadeContaConfissao', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('Incluido', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CedNaoEnviaPefin', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('Cedgru_id', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('POCCan', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CnaeCodigo', adVarChar, adParamInput, 10, Null));
  Command.Parameters.Append(Command.CreateParameter('CedMensagemBoleto1', adVarChar, adParamInput, 200, Null));
  Command.Parameters.Append(Command.CreateParameter('CedMensagemBoleto2', adVarChar, adParamInput, 200, Null));
  Command.Parameters.Append(Command.CreateParameter('CedMensagemBoleto3', adVarChar, adParamInput, 200, Null));
  Command.Parameters.Append(Command.CreateParameter('CedMensagemBoleto4', adVarChar, adParamInput, 200, Null));
  Command.Parameters.Append(Command.CreateParameter('CedMensagemBoleto5', adVarChar, adParamInput, 200, Null));
  Command.Parameters.Append(Command.CreateParameter('CedEmiteBoletoComoCedenteBoleto', adInteger, adParamInput, 0, Null));
  //Chaves
  Command.Parameters.Append(Command.CreateParameter('PrimaryKeyID', adInteger, adParamInput, 0, Null));
end;

function TARNFCedenteUpdate.GetCommandSQL: string;
begin
  Result :=
    'update nfcedente set'#13#10 +
    '  cedcodigo = ?, pescnpjcpf = ?,'#13#10 +
    '  idgcodigo = ?, cedcontratonumero = ?, cedcontratodata = ?,'#13#10 +
    '  cedfomentosaldodevedor = ?, empcodigo = ?, cedobservacao = ?,'#13#10 +
    '  filfiltro = ?, cedsimples = ?, hiscodigo = ?,'#13#10 +
    '  cedrubricaoperacaoativo = ?, cedrubricaoperacaocobranca = ?, cedrubricaoperacaocaucao = ?,'#13#10 +
    '  cedrubricapassivo = ?, cedrubricadespesa = ?, cedabaterirrf = ?,'#13#10 +
    '  cedirrfacumulado = ?, cedabaterretidos = ?, agecodigo = ?,'#13#10 +
    '  cedmsgdoccontrole = ?, cedvalorlimitecreditocheque = ?, cedvalorlimitecreditoduplicata = ?,'#13#10 +
    '  cedvalorlimitecreditosacadocheque = ?, cedvalorlimitecreditosacadoduplicata = ?, cedsacadorpadrao = ?,'#13#10 +
    '  ccccodigo = ?, cedtotalpendencias = ?, cedinstrucaocobranca = ?,'#13#10 +
    '  cedemiteboleto = ?, ceddataconnstempresa = ?, cedvalordoc = ?,'#13#10 +
    '  cedvalorted = ?, cedincentissqn = ?, cednaocobracpmf = ?,'#13#10 +
    '  cedgerartarifaauto = ?, scocodigo = ?, cedprazoatrasoponderado = ?,'#13#10 +
    '  cedrubricacontagrafica = ?, cglhiscodigo = ?, cedemailenviodocumento = ?,'#13#10 +
    '  cedcontadornome = ?, cedcontadorcrc = ?, cedcontadorcpf = ?,'#13#10 +
    '  cedsacadorpadraocnpjcpf = ?, cedemailenvioefetivacao = ?, cedenviarconsultatitulosintegracao = ?,'#13#10 +
    '  desconsideracedouvidoria = ?, cedcontato = ?, cedperccomissao = ?,'#13#10 +
    '  cedclassificacao = ?, ceddatainclusao = ?, cedusuarioinclusao = ?,'#13#10 +
    '  cedcodime = ?, cedlimitecontrolesecuritizacaovalor = ?, cedlimitecontrolesecuritizacaoperiodo = ?,'#13#10 +
    '  cedrecomprataxamulta = ?, cedcontabilidadecontatransferencia = ?, usuarioultimaalteracao = ?,'#13#10 +
    '  alteracaoviacadastro = ?, cedserasamonitorevalorsaldodevedorgerenciamento = ?, cedserasamonitoreprazo = ?,'#13#10 +
    '  cedserasagru_id = ?, cedserasaper_id = ?, cedserasamonitorevalorsaldodevedorsacadocnpj = ?,'#13#10 +
    '  cedserasamonitorevalorsaldodevedorsacadocpf = ?, cedpercentualmulta = ?, cedconsiderainstrucaosegundavia = ?,'#13#10 +
    '  cednaoprotetar = ?, usulogin1 = ?, usulogin2 = ?,'#13#10 +
    '  usulogin3 = ?, usulogin4 = ?, usulogin5 = ?,'#13#10 +
    '  usuagentechecagem = ?, cedpriorizarpainelchecagem = ?, concodigo = ?,'#13#10 +
    '  cedcontabilidadecontaclientes = ?, cedcontabilidadecontafomento = ?, cedcontabilidadecontactagrafica = ?,'#13#10 +
    '  cedcontabilidadecontaconfissao = ?, incluido = ?, cednaoenviapefin = ?,'#13#10 +
    '  cedgru_id = ?, poccan = ?, cnaecodigo = ?,'#13#10 +
    '  cedmensagemboleto1 = ?, cedmensagemboleto2 = ?, cedmensagemboleto3 = ?,'#13#10 +
    '  cedmensagemboleto4 = ?, cedmensagemboleto5 = ?, cedemiteboletocomocedenteboleto = ?'#13#10 +
    'where'#13#10 +
    '  id = ?';
end;

procedure TARNFCedenteUpdate.Persist(AARNFCedente: TARNFCedente);
begin
  inherited Persist(AARNFCedente);
  Command.Parameters[0].Value := AARNFCedente.FCedCodigo;
  Command.Parameters[1].Value := AARNFCedente.FPesCNPJCPF;
  Command.Parameters[2].Value := TActiveRecord.ToVariant(AARNFCedente.FIDGCodigo);
  Command.Parameters[3].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContratoNumero);
  Command.Parameters[4].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContratoData);
  Command.Parameters[5].Value := TActiveRecord.ToVariant(AARNFCedente.FCedFomentoSaldoDevedor);
  Command.Parameters[6].Value := AARNFCedente.FEmpCodigo;
  Command.Parameters[7].Value := TActiveRecord.ToVariant(AARNFCedente.FCedObservacao);
  Command.Parameters[8].Value := TActiveRecord.ToVariant(AARNFCedente.FFilFiltro);
  Command.Parameters[9].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedSimples);
  Command.Parameters[10].Value := TActiveRecord.ToVariant(AARNFCedente.FHisCodigo);
  Command.Parameters[11].Value := TActiveRecord.ToVariant(AARNFCedente.FCedRubricaOperacaoAtivo);
  Command.Parameters[12].Value := TActiveRecord.ToVariant(AARNFCedente.FCedRubricaOperacaoCobranca);
  Command.Parameters[13].Value := TActiveRecord.ToVariant(AARNFCedente.FCedRubricaOperacaoCaucao);
  Command.Parameters[14].Value := TActiveRecord.ToVariant(AARNFCedente.FCedRubricaPassivo);
  Command.Parameters[15].Value := TActiveRecord.ToVariant(AARNFCedente.FCedRubricaDespesa);
  Command.Parameters[16].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedAbaterIRRF);
  Command.Parameters[17].Value := TActiveRecord.ToVariant(AARNFCedente.FCedIRRFAcumulado);
  Command.Parameters[18].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedAbaterRetidos);
  Command.Parameters[19].Value := TActiveRecord.ToVariant(AARNFCedente.FAgeCodigo);
  Command.Parameters[20].Value := TActiveRecord.ToVariant(AARNFCedente.FCedMsgDocControle);
  Command.Parameters[21].Value := TActiveRecord.ToVariant(AARNFCedente.FCedValorLimiteCreditoCheque);
  Command.Parameters[22].Value := TActiveRecord.ToVariant(AARNFCedente.FCedValorLimiteCreditoDuplicata);
  Command.Parameters[23].Value := TActiveRecord.ToVariant(AARNFCedente.FCedValorLimiteCreditoSacadoCheque);
  Command.Parameters[24].Value := TActiveRecord.ToVariant(AARNFCedente.FCedValorLimiteCreditoSacadoDuplicata);
  Command.Parameters[25].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSacadorPadrao);
  Command.Parameters[26].Value := TActiveRecord.ToVariant(AARNFCedente.FCCCCodigo);
  Command.Parameters[27].Value := TActiveRecord.ToVariant(AARNFCedente.FCedTotalPendencias);
  Command.Parameters[28].Value := TActiveRecord.ToVariant(AARNFCedente.FCedInstrucaoCobranca);
  Command.Parameters[29].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedEmiteBoleto);
  Command.Parameters[30].Value := TActiveRecord.ToVariant(AARNFCedente.FCedDataConnstEmpresa);
  Command.Parameters[31].Value := TActiveRecord.ToVariant(AARNFCedente.FCedValorDoc);
  Command.Parameters[32].Value := TActiveRecord.ToVariant(AARNFCedente.FCedValorTed);
  Command.Parameters[33].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedIncentIssqn);
  Command.Parameters[34].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedNaoCobraCpmf);
  Command.Parameters[35].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedGerarTarifaAuto);
  Command.Parameters[36].Value := TActiveRecord.ToVariant(AARNFCedente.FSCoCodigo);
  Command.Parameters[37].Value := TActiveRecord.ToVariant(AARNFCedente.FCedprazoAtrasoPonderado);
  Command.Parameters[38].Value := TActiveRecord.ToVariant(AARNFCedente.FCedRubricaContaGrafica);
  Command.Parameters[39].Value := TActiveRecord.ToVariant(AARNFCedente.FCGLHisCodigo);
  Command.Parameters[40].Value := TActiveRecord.ToVariant(AARNFCedente.FCedEmailEnvioDocumento);
  Command.Parameters[41].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContadorNome);
  Command.Parameters[42].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContadorCRC);
  Command.Parameters[43].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContadorCPF);
  Command.Parameters[44].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSacadorPadraoCNPJCPF);
  Command.Parameters[45].Value := TActiveRecord.ToVariant(AARNFCedente.FCedEmailEnvioEfetivacao);
  Command.Parameters[46].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedEnviarConsultaTitulosIntegracao);
  Command.Parameters[47].Value := TActiveRecord.ToVariantB01(AARNFCedente.FDesconsideraCedOuvidoria);
  Command.Parameters[48].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContato);
  Command.Parameters[49].Value := TActiveRecord.ToVariant(AARNFCedente.FCedPercComissao);
  Command.Parameters[50].Value := TActiveRecord.ToVariant(AARNFCedente.FCedClassificacao);
  Command.Parameters[51].Value := TActiveRecord.ToVariant(AARNFCedente.FCedDataInclusao);
  Command.Parameters[52].Value := TActiveRecord.ToVariant(AARNFCedente.FCedUsuarioInclusao);
  Command.Parameters[53].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedCodime);
  Command.Parameters[54].Value := TActiveRecord.ToVariant(AARNFCedente.FCedLimiteControleSecuritizacaoValor);
  Command.Parameters[55].Value := TActiveRecord.ToVariant(AARNFCedente.FCedLimiteControleSecuritizacaoPeriodo);
  Command.Parameters[56].Value := TActiveRecord.ToVariant(AARNFCedente.FCedRecompraTaxaMulta);
  Command.Parameters[57].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContabilidadeContaTransferencia);
  Command.Parameters[58].Value := AARNFCedente.FUsuarioUltimaAlteracao;
  Command.Parameters[59].Value := TActiveRecord.ToVariantB01(AARNFCedente.FAlteracaoViaCadastro);
  Command.Parameters[60].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSerasaMonitoreValorSaldoDevedorGerenciamento);
  Command.Parameters[61].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSerasaMonitorePrazo);
  Command.Parameters[62].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSerasaGru_ID);
  Command.Parameters[63].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSerasaPer_ID);
  Command.Parameters[64].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSerasaMonitoreValorSaldoDevedorSacadoCNPJ);
  Command.Parameters[65].Value := TActiveRecord.ToVariant(AARNFCedente.FCedSerasaMonitoreValorSaldoDevedorSacadoCPF);
  Command.Parameters[66].Value := TActiveRecord.ToVariant(AARNFCedente.FCedPercentualMulta);
  Command.Parameters[67].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedConsideraInstrucaoSegundaVia);
  Command.Parameters[68].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedNaoProtetar);
  Command.Parameters[69].Value := TActiveRecord.ToVariant(AARNFCedente.FUsuLogin1);
  Command.Parameters[70].Value := TActiveRecord.ToVariant(AARNFCedente.FUsuLogin2);
  Command.Parameters[71].Value := TActiveRecord.ToVariant(AARNFCedente.FUsuLogin3);
  Command.Parameters[72].Value := TActiveRecord.ToVariant(AARNFCedente.FUsuLogin4);
  Command.Parameters[73].Value := TActiveRecord.ToVariant(AARNFCedente.FUsuLogin5);
  Command.Parameters[74].Value := TActiveRecord.ToVariant(AARNFCedente.FUsuAgenteChecagem);
  Command.Parameters[75].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedPriorizarPainelChecagem);
  Command.Parameters[76].Value := TActiveRecord.ToVariant(AARNFCedente.FConCodigo);
  Command.Parameters[77].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContabilidadeContaClientes);
  Command.Parameters[78].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContabilidadeContaFomento);
  Command.Parameters[79].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContabilidadeContaCtaGrafica);
  Command.Parameters[80].Value := TActiveRecord.ToVariant(AARNFCedente.FCedContabilidadeContaConfissao);
  Command.Parameters[81].Value := TActiveRecord.ToVariant(AARNFCedente.FIncluido);
  Command.Parameters[82].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedNaoEnviaPefin);
  Command.Parameters[83].Value := TActiveRecord.ToVariant(AARNFCedente.FCedgru_id);
  Command.Parameters[84].Value := TActiveRecord.ToVariantB01(AARNFCedente.FPOCCan);
  Command.Parameters[85].Value := TActiveRecord.ToVariant(AARNFCedente.FCnaeCodigo);
  Command.Parameters[86].Value := TActiveRecord.ToVariant(AARNFCedente.FCedMensagemBoleto1);
  Command.Parameters[87].Value := TActiveRecord.ToVariant(AARNFCedente.FCedMensagemBoleto2);
  Command.Parameters[88].Value := TActiveRecord.ToVariant(AARNFCedente.FCedMensagemBoleto3);
  Command.Parameters[89].Value := TActiveRecord.ToVariant(AARNFCedente.FCedMensagemBoleto4);
  Command.Parameters[90].Value := TActiveRecord.ToVariant(AARNFCedente.FCedMensagemBoleto5);
  Command.Parameters[91].Value := TActiveRecord.ToVariantB01(AARNFCedente.FCedEmiteBoletoComoCedenteBoleto);
  //Chaves
  Command.Parameters[92].Value := AARNFCedente.FPrimaryKeyID;
  if Execute <> 1 then
    raise EActiveRecord.Create('Update Failed TARNFCedenteUpdate');
end;

{ TARNFCedenteMetadataObject }

function TARNFCedenteMetadataObject.FieldCount: Integer;
begin
  Result := Length(ARNFCedenteMetadata.Fields);
end;

function TARNFCedenteMetadataObject.FieldMetadata(Index: Integer): TFieldMetadata;
begin
  Result := ARNFCedenteMetadata.Fields[Index];
end;

function TARNFCedenteMetadataObject.FieldMetadataByName(const AName: string): TFieldMetadata;
begin
  Result := FieldMetadata(IndexOfName(AName));
end;

function TARNFCedenteMetadataObject.IndexOfName(const AName: string): Integer;
var
  laco: Integer;
begin
  Result := -1;
  for laco := 0 to High(ARNFCedenteMetadata.Fields) do
    if SameText(ARNFCedenteMetadata.Fields[laco].Name, AName) then
    begin
      Result := laco;
      Break;
    end;
end;

function TARNFCedenteMetadataObject.RelationshipCount: Integer;
begin
  Result := 0;
end;

function TARNFCedenteMetadataObject.RelationshipMetadata(Index: Integer): TRelationshipMetadata;
begin
  FillChar(Result, SizeOf(TRelationshipMetadata), #0);
end;

function TARNFCedenteMetadataObject.TableMetadata: TTableMetadata;
begin
  Result := ARNFCedenteMetadata.Table;
end;

initialization

  GARNFCedenteDeleteCriticalSection := TCriticalSection.Create;
  GARNFCedenteInsertCriticalSection := TCriticalSection.Create;
  GARNFCedenteUpdateCriticalSection := TCriticalSection.Create;

  GQueryFactoryByID := TARNFCedente.From
    .Top(1)
    .Where('id = ?');

finalization

  GQueryFactoryByID := nil;
  FreeAndNil(GARNFCedenteDeleteCriticalSection);
  FreeAndNil(GARNFCedenteInsertCriticalSection);
  FreeAndNil(GARNFCedenteUpdateCriticalSection);

end.