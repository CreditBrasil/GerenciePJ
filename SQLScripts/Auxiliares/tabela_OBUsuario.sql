/* script gerado automaticamente, n„o editar
   Serve como apoio para a criaÁ„o dos arquivos de update e completo 
   
   Template: ActiveRecord.sql_template
   DescriÁ„o: Serve como apoio para a criaÁ„o dos arquivos de update e completo para a tabela OBUsuario */

/* Cont√©m as informa√ß√µes de login do sistema */
create table [dbo].[OBUsuario] (
	/* Login do usu√°rio, PK */
	[UsuLogin] [varchar] (10) NOT NULL,
	/* ??? */
	[GruCodigo] [int] NULL,
	/* ??? */
	[UsuNome] [varchar] (60) NULL,
	/* ??? */
	[UsuSenha] [varchar] (6) NULL,
	/* ??? */
	[EmpCodigo] [int] NULL,
	/* ??? */
	[UsuAutorizaOperacaoRestricao] [bit] NULL,
	/* ??? */
	[AgeCodigo] [int] NULL,
	/* ??? */
	[GalCodigo] [int] NULL,
	/* ??? */
	[UsuMaxValorLimiteCretioParaCedente] [float] NULL,
	/* ??? */
	[UsuDataExpirar] [datetime] NULL,
	/* ??? */
	[UsuAutorizaEfetivacaoSolicitacaoVencimento] [bit] NULL,
	/* ??? */
	[UsuAutorizaEfetivacaoSolicitacaoProtesto] [bit] NULL,
	/* ??? */
	[UsuOperacaoAnalisadaNaoPodeSerEfetivada] [bit] NULL,
	/* ??? */
	[UsuAutorizaTitulosAcordoAlcada] [bit] NULL,
	/* ??? */
	[UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao] [float] NULL,
	/* ??? */
	[UsuValorSuperiorLimiteAutorizar] [float] NULL,
	/* ??? */
	[UsuValorMaximoCadastramentoLimiteCreditoSacado] [float] NULL,
	/* ??? */
	[UsuPossibilitaEfetivacaoBorderoRestricao] [bit] NULL,
	/* ??? */
	[UsuValorLimiteAdicionalOperacao] [float] NULL,
	/* ??? */
	[UsuEmailSaldoContaVinculada] [varchar] (250) NULL,
	/* ??? */
	[Id_TipoObservacao] [int] NULL,
	/* ??? */
	[UsuCodime] [bit] NULL,
	/* ??? */
	[UsuSemConsistencia] [bit] NULL,
	/* ??? */
	[UsuAlteraConfirmacaoTituloOperacao] [bit] NULL,
	/* ??? */
	[UsuAlteraConfirmacaoIngresso] [bit] NULL,
	/* ??? */
	[UsuTipoAcesso] [varchar] (1) NULL,
	/* ??? */
	[UsuInclusaoCNPJCPFGerencieCarteira] [bit] NULL,
	/* ??? */
	[UsuExclusaoCNPJCPFGerencieCarteira] [bit] NULL,
	/* ??? */
	[Pag_Id] [int] NULL,
	/* ??? */
	[Sop_Id] [int] NULL,
	/* ??? */
	[UsuAlteraSenhaProximoAcesso] [bit] NULL,
	/* ??? */
	[UsuVisualizaEventoCaucao] [bit] NULL,
	/* ??? */
	[UsuAutorizaEfetivacaoSolicitacaoBaixa] [bit] NULL,
	/* ??? */
	[UsuAutorizaEfetivacaoSolicitacaoCartorio] [bit] NULL,
	/* ??? */
	[UsuAutorizaEfetivacaoSolicitacaoInsProtesto] [bit] NULL,
	/* ??? */
	[UsuAutorizaEfetivacaoSolicitacaoDesconto] [bit] NULL,
	/* ??? */
	[UsuAutorizaEfetivacaoSolicitacaoAbatimento] [bit] NULL,
	/* ??? */
	[UsuAutorizaEfetivacaoSolicitacaoResgate] [bit] NULL,
	/* ??? */
	[UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia] [bit] NULL,
	/* ??? */
	[UsuAutorizaEfetivacaoCoaf] [bit] NULL,
	/* ??? */
	[UsuLiberaConsultaOrgaoCreditoForaPrazo] [bit] NULL,
	/* ??? */
	[UsuQtdConsultasSerasaMes] [int] NULL,
	/* ??? */
	[UsuAgenteChecagem] [bit] NULL,
	/* ??? */
	[UsuGerenteChecagem] [bit] NULL,
	/* ??? */
	[UsuAlteraChecagemLote] [bit] NULL,
	/* ??? */
	[UsuVeTodasOperacoesMonitor] [bit] NULL,
	/* ??? */
	[UsuRecebeEmailEtapaPoc] [bit] NULL,
	/* ??? */
	[UsuEmailAtribuicaoEtapaPoc] [varchar] (2000) NULL,
	/* ??? */
	[UsuAgenteCobranca] [bit] NULL,
	/* ??? */
	[UsuGerenteCobranca] [bit] NULL,
	/* ??? */
	[UsuAutorizaEfetivacaoPocIndependenteEtapa] [bit] NULL,
	/* ??? */
	[UsuGerentePoc] [bit] NULL,
	/* ??? */
	[UsuAgentePoc] [bit] NULL,
	/* ??? */
	[UsuNomesObservacaoAnalise] [varchar] (1000) NULL,
	/* ??? */
	[UsuAlteraParatroBloqueadoPefin] [bit] NULL,
	/* ??? */
	[UsuPermitePularEtapaPoc] [bit] NULL,
	/* ??? */
	[UsuAnalisePoc] [bit] NULL,
	/* ??? */
	[UsuPocAlteraStatusFormalizacao] [bit] NULL,
	/* ??? */
	[UsuLiberaCondicionanteOperacao] [bit] NULL,
	/* ??? */
	[UsuPocPermiteAnaliseUnica] [bit] NULL,
	/* ??? */
	[UsuPocPermiteAnaliseUnicaValor] [float] NULL,
	/* ??? */
	[UsuDesativado] [bit] NULL,
	/* ??? */
	[UsuPocPermiteAnaliseUnicaValorTranche] [float] NULL,
	/* ??? */
	[UsuPocPermiteAnaliseUnicaValorClean] [float] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OBUsuario] WITH NOCHECK ADD 
        CONSTRAINT [PK_OBUsuario] PRIMARY KEY  NONCLUSTERED 
        (
                [UsuLogin]
        )  ON [PRIMARY]
GO

GRANT  REFERENCES ,  SELECT ,  INSERT ,  DELETE ,  UPDATE  ON [dbo].[OBUsuario]  TO [public]
GO

DECLARE @v sql_variant 
SET @v = N'Cont√©m as informa√ß√µes de login do sistema'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', NULL, NULL
GO

DECLARE @v sql_variant 
SET @v = N'Login do usu√°rio, PK'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuLogin'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'GruCodigo'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuNome'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuSenha'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'EmpCodigo'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAutorizaOperacaoRestricao'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'AgeCodigo'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'GalCodigo'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuMaxValorLimiteCretioParaCedente'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuDataExpirar'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAutorizaEfetivacaoSolicitacaoVencimento'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAutorizaEfetivacaoSolicitacaoProtesto'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuOperacaoAnalisadaNaoPodeSerEfetivada'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAutorizaTitulosAcordoAlcada'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuSaldoDevedorMaximoSacadoAutorizacaoOperacao'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuValorSuperiorLimiteAutorizar'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuValorMaximoCadastramentoLimiteCreditoSacado'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuPossibilitaEfetivacaoBorderoRestricao'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuValorLimiteAdicionalOperacao'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuEmailSaldoContaVinculada'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'Id_TipoObservacao'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuCodime'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuSemConsistencia'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAlteraConfirmacaoTituloOperacao'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAlteraConfirmacaoIngresso'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuTipoAcesso'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuInclusaoCNPJCPFGerencieCarteira'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuExclusaoCNPJCPFGerencieCarteira'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'Pag_Id'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'Sop_Id'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAlteraSenhaProximoAcesso'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuVisualizaEventoCaucao'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAutorizaEfetivacaoSolicitacaoBaixa'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAutorizaEfetivacaoSolicitacaoCartorio'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAutorizaEfetivacaoSolicitacaoInsProtesto'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAutorizaEfetivacaoSolicitacaoDesconto'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAutorizaEfetivacaoSolicitacaoAbatimento'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAutorizaEfetivacaoSolicitacaoResgate'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAutorizaEfetivacaoSolicitacaoCartaAnuencia'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAutorizaEfetivacaoCoaf'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuLiberaConsultaOrgaoCreditoForaPrazo'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuQtdConsultasSerasaMes'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAgenteChecagem'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuGerenteChecagem'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAlteraChecagemLote'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuVeTodasOperacoesMonitor'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuRecebeEmailEtapaPoc'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuEmailAtribuicaoEtapaPoc'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAgenteCobranca'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuGerenteCobranca'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAutorizaEfetivacaoPocIndependenteEtapa'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuGerentePoc'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAgentePoc'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuNomesObservacaoAnalise'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAlteraParatroBloqueadoPefin'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuPermitePularEtapaPoc'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuAnalisePoc'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuPocAlteraStatusFormalizacao'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuLiberaCondicionanteOperacao'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuPocPermiteAnaliseUnica'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuPocPermiteAnaliseUnicaValor'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuDesativado'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuPocPermiteAnaliseUnicaValorTranche'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'OBUsuario', N'COLUMN', N'UsuPocPermiteAnaliseUnicaValorClean'
GO