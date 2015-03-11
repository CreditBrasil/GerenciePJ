/* script gerado automaticamente, não editar
   Serve como apoio para a criação dos arquivos de update e completo 
   
   Template: ActiveRecord.sql_template
   Descrição: Serve como apoio para a criação dos arquivos de update e completo para a tabela NFConsultaSerasa */

/* Registro de consultas feitas no Serasa */
create table [dbo].[NFConsultaSerasa] (
	/* ??? */
	[ID] [int] NOT NULL,
	/* ??? */
	[SConsCnpjCpf] [varchar] (50) NULL,
	/* ??? */
	[SConsData] [datetime] NULL,
	/* ??? */
	[SConsHora] [varchar] (50) NULL,
	/* ??? */
	[SConsRazao] [varchar] (50) NULL,
	/* ??? */
	[SConsEmpTipo] [varchar] (50) NULL,
	/* ??? */
	[SConsPesTipo] [varchar] (50) NULL,
	/* ??? */
	[UsuLogin] [varchar] (50) NULL,
	/* ??? */
	[SConsCodigo] [int] NULL,
	/* ??? */
	[SCaminhoArquivo] [varchar] (100) NULL,
	/* ??? */
	[RetLinhaSerasa] [text] NULL,
	/* ??? */
	[EmpCodigo] [int] NULL,
	/* ??? */
	[UserConsulta] [varchar] (25) NULL,
	/* ??? */
	[ParNaoMostrarDadosFactoringComplemento] [bit] NULL,
	/* ??? */
	[SConsAcaoGerencie] [varchar] (1) NULL,
	/* ??? */
	[SConsPrazoGerencie] [int] NULL,
	/* ??? */
	[Gru_ID] [int] NULL,
	/* ??? */
	[Per_ID] [int] NULL,
	/* ??? */
	[SConsRetornoMonitore] [bit] NULL,
	/* ??? */
	[SConsRetornoMonitorePF] [bit] NULL,
	/* ??? */
	[GerouPendencia] [bit] NULL,
	/* ??? */
	[SConsPrecisouAutorizacao] [bit] NULL,
	/* ??? */
	[SConsUsuLoginAutorizou] [varchar] (100) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[NFConsultaSerasa] WITH NOCHECK ADD 
        CONSTRAINT [PK_NFConsultaSerasa] PRIMARY KEY  NONCLUSTERED 
        (
                [ID]
        )  ON [PRIMARY]
GO

GRANT  REFERENCES ,  SELECT ,  INSERT ,  DELETE ,  UPDATE  ON [dbo].[NFConsultaSerasa]  TO [public]
GO

DECLARE @v sql_variant 
SET @v = N'Registro de consultas feitas no Serasa'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', NULL, NULL
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'ID'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'SConsCnpjCpf'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'SConsData'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'SConsHora'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'SConsRazao'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'SConsEmpTipo'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'SConsPesTipo'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'UsuLogin'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'SConsCodigo'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'SCaminhoArquivo'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'RetLinhaSerasa'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'EmpCodigo'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'UserConsulta'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'ParNaoMostrarDadosFactoringComplemento'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'SConsAcaoGerencie'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'SConsPrazoGerencie'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'Gru_ID'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'Per_ID'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'SConsRetornoMonitore'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'SConsRetornoMonitorePF'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'GerouPendencia'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'SConsPrecisouAutorizacao'
GO

DECLARE @v sql_variant 
SET @v = N'???'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'NFConsultaSerasa', N'COLUMN', N'SConsUsuLoginAutorizou'
GO