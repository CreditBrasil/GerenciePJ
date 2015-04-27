{
  ***************************************************
  * Este código é gerado automaticamente, não edite *
  ***************************************************

  Template: ActiveRecord.pas_template
  Descrição: Cria classes e interfaces para acessar a tabela NFParametroConfiguracaoEmail
}
unit uARNFParametroConfiguracaoEmail;

interface

uses
  SysUtils, db, ADOInt, Graphics, ServiceLocator, SyncObjs, Variants, 
  uActiveRecord;

type
  //Tabela: NFParametroConfiguracaoEmail - Contém apenas 1 registro que contém a configuração para envio de e-mail
  IARNFParametroConfiguracaoEmail = interface(IActiveRecord)
    ['{B5AAB59F-0525-4BFB-95B3-73E8321C1692}']
    function GetID: Integer;
    function GetCEmSMTP: TNullableString;
    function GetCEmAutenticacao: TNullableBoolean;
    function GetCEmUsuario: TNullableString;
    function GetCEmSenha: TNullableString;
    function GetCEmEmailFactoring: TNullableString;
    function GetCEmEmailMonitoramento: TNullableString;
    function GetCEmEmailTeste: TNullableString;
    function GetCEmTextoCorpoEmail: TNullableString;
    function GetCEmEnvioDiarioAgentePosCed: TNullableBoolean;
    function GetCEmEnvioDiarioConsultaTitulosCedente: TNullableBoolean;
    function GetCEmQtdDiasTitulosVencer: TNullableInteger;
    function GetCEmEnvioDiarioAgenteEmailCopia: TNullableWideString;
    function GetCEmApresentaLogoEmpresa: TNullableBoolean;
    function GetCEmFonteCorpoEmail: TNullableString;
    function GetCEmFonteTamCorpoEmail: TNullableInteger;
    function GetCEmTextoInicialOpe: TNullableString;
    function GetCEmTextoAposDadosOpe: TNullableString;
    function GetCEmTituloEmail: TNullableString;
    function GetCEmEnvioTotalPendenciaAberto: TNullableBoolean;
    function GetCEmEnvioDocumentoPendenteOperacao: TNullableBoolean;
    function GetCEmEnvioSolicitacaoInstrucaoCancelada: TNullableBoolean;
    function GetCEmNroDiasInstCanceladas: TNullableInteger;
    function GetCEmPorta: TNullableInteger;
    function GetCEmSuprimirLimiteCredito: TNullableBoolean;
    procedure SetCEmSMTP(const Value: TNullableString);
    procedure SetCEmAutenticacao(const Value: TNullableBoolean);
    procedure SetCEmUsuario(const Value: TNullableString);
    procedure SetCEmSenha(const Value: TNullableString);
    procedure SetCEmEmailFactoring(const Value: TNullableString);
    procedure SetCEmEmailMonitoramento(const Value: TNullableString);
    procedure SetCEmEmailTeste(const Value: TNullableString);
    procedure SetCEmTextoCorpoEmail(const Value: TNullableString);
    procedure SetCEmEnvioDiarioAgentePosCed(const Value: TNullableBoolean);
    procedure SetCEmEnvioDiarioConsultaTitulosCedente(const Value: TNullableBoolean);
    procedure SetCEmQtdDiasTitulosVencer(const Value: TNullableInteger);
    procedure SetCEmEnvioDiarioAgenteEmailCopia(const Value: TNullableWideString);
    procedure SetCEmApresentaLogoEmpresa(const Value: TNullableBoolean);
    procedure SetCEmFonteCorpoEmail(const Value: TNullableString);
    procedure SetCEmFonteTamCorpoEmail(const Value: TNullableInteger);
    procedure SetCEmTextoInicialOpe(const Value: TNullableString);
    procedure SetCEmTextoAposDadosOpe(const Value: TNullableString);
    procedure SetCEmTituloEmail(const Value: TNullableString);
    procedure SetCEmEnvioTotalPendenciaAberto(const Value: TNullableBoolean);
    procedure SetCEmEnvioDocumentoPendenteOperacao(const Value: TNullableBoolean);
    procedure SetCEmEnvioSolicitacaoInstrucaoCancelada(const Value: TNullableBoolean);
    procedure SetCEmNroDiasInstCanceladas(const Value: TNullableInteger);
    procedure SetCEmPorta(const Value: TNullableInteger);
    procedure SetCEmSuprimirLimiteCredito(const Value: TNullableBoolean);
    //--- Campos ---
    //ID int - ???
    property ID: Integer read GetID;
    //CEmSMTP varchar (150) - ???
    property CEmSMTP: TNullableString read GetCEmSMTP write SetCEmSMTP;
    //CEmAutenticacao bit - ???
    property CEmAutenticacao: TNullableBoolean read GetCEmAutenticacao write SetCEmAutenticacao;
    //CEmUsuario varchar (150) - ???
    property CEmUsuario: TNullableString read GetCEmUsuario write SetCEmUsuario;
    //CEmSenha varchar (150) - ???
    property CEmSenha: TNullableString read GetCEmSenha write SetCEmSenha;
    //CEmEmailFactoring varchar (150) - ???
    property CEmEmailFactoring: TNullableString read GetCEmEmailFactoring write SetCEmEmailFactoring;
    //CEmEmailMonitoramento varchar (150) - ???
    property CEmEmailMonitoramento: TNullableString read GetCEmEmailMonitoramento write SetCEmEmailMonitoramento;
    //CEmEmailTeste varchar (150) - ???
    property CEmEmailTeste: TNullableString read GetCEmEmailTeste write SetCEmEmailTeste;
    //CEmTextoCorpoEmail varchar (600) - ???
    property CEmTextoCorpoEmail: TNullableString read GetCEmTextoCorpoEmail write SetCEmTextoCorpoEmail;
    //CEmEnvioDiarioAgentePosCed bit - ???
    property CEmEnvioDiarioAgentePosCed: TNullableBoolean read GetCEmEnvioDiarioAgentePosCed write SetCEmEnvioDiarioAgentePosCed;
    //CEmEnvioDiarioConsultaTitulosCedente bit - ???
    property CEmEnvioDiarioConsultaTitulosCedente: TNullableBoolean read GetCEmEnvioDiarioConsultaTitulosCedente write SetCEmEnvioDiarioConsultaTitulosCedente;
    //CEmQtdDiasTitulosVencer int - ???
    property CEmQtdDiasTitulosVencer: TNullableInteger read GetCEmQtdDiasTitulosVencer write SetCEmQtdDiasTitulosVencer;
    //CEmEnvioDiarioAgenteEmailCopia nvarchar (4000) - ???
    property CEmEnvioDiarioAgenteEmailCopia: TNullableWideString read GetCEmEnvioDiarioAgenteEmailCopia write SetCEmEnvioDiarioAgenteEmailCopia;
    //CEmApresentaLogoEmpresa bit - ???
    property CEmApresentaLogoEmpresa: TNullableBoolean read GetCEmApresentaLogoEmpresa write SetCEmApresentaLogoEmpresa;
    //CEmFonteCorpoEmail varchar (20) - ???
    property CEmFonteCorpoEmail: TNullableString read GetCEmFonteCorpoEmail write SetCEmFonteCorpoEmail;
    //CEmFonteTamCorpoEmail int - ???
    property CEmFonteTamCorpoEmail: TNullableInteger read GetCEmFonteTamCorpoEmail write SetCEmFonteTamCorpoEmail;
    //CEmTextoInicialOpe varchar (60) - ???
    property CEmTextoInicialOpe: TNullableString read GetCEmTextoInicialOpe write SetCEmTextoInicialOpe;
    //CEmTextoAposDadosOpe varchar (60) - ???
    property CEmTextoAposDadosOpe: TNullableString read GetCEmTextoAposDadosOpe write SetCEmTextoAposDadosOpe;
    //CEmTituloEmail varchar (200) - ???
    property CEmTituloEmail: TNullableString read GetCEmTituloEmail write SetCEmTituloEmail;
    //CEmEnvioTotalPendenciaAberto bit - ???
    property CEmEnvioTotalPendenciaAberto: TNullableBoolean read GetCEmEnvioTotalPendenciaAberto write SetCEmEnvioTotalPendenciaAberto;
    //CEmEnvioDocumentoPendenteOperacao bit - ???
    property CEmEnvioDocumentoPendenteOperacao: TNullableBoolean read GetCEmEnvioDocumentoPendenteOperacao write SetCEmEnvioDocumentoPendenteOperacao;
    //CEmEnvioSolicitacaoInstrucaoCancelada bit - ???
    property CEmEnvioSolicitacaoInstrucaoCancelada: TNullableBoolean read GetCEmEnvioSolicitacaoInstrucaoCancelada write SetCEmEnvioSolicitacaoInstrucaoCancelada;
    //CEmNroDiasInstCanceladas int - ???
    property CEmNroDiasInstCanceladas: TNullableInteger read GetCEmNroDiasInstCanceladas write SetCEmNroDiasInstCanceladas;
    //CEmPorta int - ???
    property CEmPorta: TNullableInteger read GetCEmPorta write SetCEmPorta;
    //CEmSuprimirLimiteCredito bit - ???
    property CEmSuprimirLimiteCredito: TNullableBoolean read GetCEmSuprimirLimiteCredito write SetCEmSuprimirLimiteCredito;
  end;

  IIteratorARNFParametroConfiguracaoEmail = interface(IIteratorActiveRecord)
    function CurrentItem: IARNFParametroConfiguracaoEmail;
  end;

  ICollectionARNFParametroConfiguracaoEmail = interface(ICollectionActiveRecord)
    function GetItem(Index: Integer): IARNFParametroConfiguracaoEmail;

    function Add(const Item: IARNFParametroConfiguracaoEmail): Integer;
    function First: IARNFParametroConfiguracaoEmail;
    procedure Insert(Index: Integer; const Item: IARNFParametroConfiguracaoEmail);
    function Last: IARNFParametroConfiguracaoEmail;
    function New(const AConnection: IActiveRecordConnection): IARNFParametroConfiguracaoEmail;
    property Item[Index: Integer]: IARNFParametroConfiguracaoEmail read GetItem; default;
  end;

  TCollectionARNFParametroConfiguracaoEmail = class(TCollectionActiveRecord, ICollectionARNFParametroConfiguracaoEmail)
  protected
    { ICollectionARNFParametroConfiguracaoEmail }
    function GetItem(Index: Integer): IARNFParametroConfiguracaoEmail;

    function Add(const Item: IARNFParametroConfiguracaoEmail): Integer;
    function First: IARNFParametroConfiguracaoEmail;
    procedure Insert(Index: Integer; const Item: IARNFParametroConfiguracaoEmail);
    function Last: IARNFParametroConfiguracaoEmail;
    function New(const AConnection: IActiveRecordConnection): IARNFParametroConfiguracaoEmail;
  end;

  TIteratorARNFParametroConfiguracaoEmailDecorator = class(TIteratorCollectionActiveRecordDecorator, IIteratorARNFParametroConfiguracaoEmail)
  protected
    { IIteratorARNFParametroConfiguracaoEmail }
    function CurrentItem: IARNFParametroConfiguracaoEmail;
  public
    class function Decore(const ACollectionARNFParametroConfiguracaoEmail: ICollectionARNFParametroConfiguracaoEmail): IIteratorARNFParametroConfiguracaoEmail;
  end;

  TIteratorARNFParametroConfiguracaoEmailQueryDecorator = class(TIteratorActiveRecordQueryDecorator, IIteratorARNFParametroConfiguracaoEmail)
  protected
    { IIteratorARNFParametroConfiguracaoEmail }
    function CurrentItem: IARNFParametroConfiguracaoEmail;
  public
    class function Decore(const AARNFParametroConfiguracaoEmailQuery: IActiveRecordQuery): IIteratorARNFParametroConfiguracaoEmail;
  end;

  TARNFParametroConfiguracaoEmail = class(TActiveRecord, IARNFParametroConfiguracaoEmail)
  private
    FPrimaryKeyID: Integer;
    FID: Integer;
    FCEmSMTP: TNullableString;
    FCEmAutenticacao: TNullableBoolean;
    FCEmUsuario: TNullableString;
    FCEmSenha: TNullableString;
    FCEmEmailFactoring: TNullableString;
    FCEmEmailMonitoramento: TNullableString;
    FCEmEmailTeste: TNullableString;
    FCEmTextoCorpoEmail: TNullableString;
    FCEmEnvioDiarioAgentePosCed: TNullableBoolean;
    FCEmEnvioDiarioConsultaTitulosCedente: TNullableBoolean;
    FCEmQtdDiasTitulosVencer: TNullableInteger;
    FCEmEnvioDiarioAgenteEmailCopia: TNullableWideString;
    FCEmApresentaLogoEmpresa: TNullableBoolean;
    FCEmFonteCorpoEmail: TNullableString;
    FCEmFonteTamCorpoEmail: TNullableInteger;
    FCEmTextoInicialOpe: TNullableString;
    FCEmTextoAposDadosOpe: TNullableString;
    FCEmTituloEmail: TNullableString;
    FCEmEnvioTotalPendenciaAberto: TNullableBoolean;
    FCEmEnvioDocumentoPendenteOperacao: TNullableBoolean;
    FCEmEnvioSolicitacaoInstrucaoCancelada: TNullableBoolean;
    FCEmNroDiasInstCanceladas: TNullableInteger;
    FCEmPorta: TNullableInteger;
    FCEmSuprimirLimiteCredito: TNullableBoolean;
  protected
    { IActiveRecordAccess }
    procedure Clear(Index: Integer); override;
    function DisplayText(Index: Integer): string; override;
    function GetAsString(Index: Integer): string; override;
    function GetValue(Index: Integer): Variant; override;
    function IsNull(Index: Integer): Boolean; override;
    procedure SetAsString(Index: Integer; const Value: string); override;
    procedure SetValue(Index: Integer; const Value: Variant); override;
    { IARNFParametroConfiguracaoEmail }
    function GetID: Integer;
    function GetCEmSMTP: TNullableString;
    function GetCEmAutenticacao: TNullableBoolean;
    function GetCEmUsuario: TNullableString;
    function GetCEmSenha: TNullableString;
    function GetCEmEmailFactoring: TNullableString;
    function GetCEmEmailMonitoramento: TNullableString;
    function GetCEmEmailTeste: TNullableString;
    function GetCEmTextoCorpoEmail: TNullableString;
    function GetCEmEnvioDiarioAgentePosCed: TNullableBoolean;
    function GetCEmEnvioDiarioConsultaTitulosCedente: TNullableBoolean;
    function GetCEmQtdDiasTitulosVencer: TNullableInteger;
    function GetCEmEnvioDiarioAgenteEmailCopia: TNullableWideString;
    function GetCEmApresentaLogoEmpresa: TNullableBoolean;
    function GetCEmFonteCorpoEmail: TNullableString;
    function GetCEmFonteTamCorpoEmail: TNullableInteger;
    function GetCEmTextoInicialOpe: TNullableString;
    function GetCEmTextoAposDadosOpe: TNullableString;
    function GetCEmTituloEmail: TNullableString;
    function GetCEmEnvioTotalPendenciaAberto: TNullableBoolean;
    function GetCEmEnvioDocumentoPendenteOperacao: TNullableBoolean;
    function GetCEmEnvioSolicitacaoInstrucaoCancelada: TNullableBoolean;
    function GetCEmNroDiasInstCanceladas: TNullableInteger;
    function GetCEmPorta: TNullableInteger;
    function GetCEmSuprimirLimiteCredito: TNullableBoolean;
    procedure SetCEmSMTP(const Value: TNullableString);
    procedure SetCEmAutenticacao(const Value: TNullableBoolean);
    procedure SetCEmUsuario(const Value: TNullableString);
    procedure SetCEmSenha(const Value: TNullableString);
    procedure SetCEmEmailFactoring(const Value: TNullableString);
    procedure SetCEmEmailMonitoramento(const Value: TNullableString);
    procedure SetCEmEmailTeste(const Value: TNullableString);
    procedure SetCEmTextoCorpoEmail(const Value: TNullableString);
    procedure SetCEmEnvioDiarioAgentePosCed(const Value: TNullableBoolean);
    procedure SetCEmEnvioDiarioConsultaTitulosCedente(const Value: TNullableBoolean);
    procedure SetCEmQtdDiasTitulosVencer(const Value: TNullableInteger);
    procedure SetCEmEnvioDiarioAgenteEmailCopia(const Value: TNullableWideString);
    procedure SetCEmApresentaLogoEmpresa(const Value: TNullableBoolean);
    procedure SetCEmFonteCorpoEmail(const Value: TNullableString);
    procedure SetCEmFonteTamCorpoEmail(const Value: TNullableInteger);
    procedure SetCEmTextoInicialOpe(const Value: TNullableString);
    procedure SetCEmTextoAposDadosOpe(const Value: TNullableString);
    procedure SetCEmTituloEmail(const Value: TNullableString);
    procedure SetCEmEnvioTotalPendenciaAberto(const Value: TNullableBoolean);
    procedure SetCEmEnvioDocumentoPendenteOperacao(const Value: TNullableBoolean);
    procedure SetCEmEnvioSolicitacaoInstrucaoCancelada(const Value: TNullableBoolean);
    procedure SetCEmNroDiasInstCanceladas(const Value: TNullableInteger);
    procedure SetCEmPorta(const Value: TNullableInteger);
    procedure SetCEmSuprimirLimiteCredito(const Value: TNullableBoolean);
    procedure CopyFrom(AActiveRecord: TActiveRecord); overload; override;
    function CreateItemRelationship(Index: Integer): TActiveRecord; override;
    procedure Persist; override;
    procedure PersistSQL;
    procedure SetRecordSet(const ARecordSet: _RecordSet; AOffset: Integer); override;
  public
    constructor Create(const AConnection: IActiveRecordConnection); override;
    class function QueryAll(const AConnection: IActiveRecordConnection): IActiveRecordQuery;
    class function FindAll(const AConnection: IActiveRecordConnection): IARNFParametroConfiguracaoEmail;
    class function GUIDItem: TGUID; override;
    class function Metadata: IActiveRecordMetadata; override;
    class function ViewMetadata: IActiveRecordMetadata; override;
  end;

  TARNFParametroConfiguracaoEmailMetadata = record
    Table: TTableMetadata;
    Fields: array [0..24] of TFieldMetadata;
  end;

const
  Campo_NFParametroConfiguracaoEmail_ID = 0;
  Campo_NFParametroConfiguracaoEmail_CEmSMTP = 1;
  Campo_NFParametroConfiguracaoEmail_CEmAutenticacao = 2;
  Campo_NFParametroConfiguracaoEmail_CEmUsuario = 3;
  Campo_NFParametroConfiguracaoEmail_CEmSenha = 4;
  Campo_NFParametroConfiguracaoEmail_CEmEmailFactoring = 5;
  Campo_NFParametroConfiguracaoEmail_CEmEmailMonitoramento = 6;
  Campo_NFParametroConfiguracaoEmail_CEmEmailTeste = 7;
  Campo_NFParametroConfiguracaoEmail_CEmTextoCorpoEmail = 8;
  Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgentePosCed = 9;
  Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioConsultaTitulosCedente = 10;
  Campo_NFParametroConfiguracaoEmail_CEmQtdDiasTitulosVencer = 11;
  Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgenteEmailCopia = 12;
  Campo_NFParametroConfiguracaoEmail_CEmApresentaLogoEmpresa = 13;
  Campo_NFParametroConfiguracaoEmail_CEmFonteCorpoEmail = 14;
  Campo_NFParametroConfiguracaoEmail_CEmFonteTamCorpoEmail = 15;
  Campo_NFParametroConfiguracaoEmail_CEmTextoInicialOpe = 16;
  Campo_NFParametroConfiguracaoEmail_CEmTextoAposDadosOpe = 17;
  Campo_NFParametroConfiguracaoEmail_CEmTituloEmail = 18;
  Campo_NFParametroConfiguracaoEmail_CEmEnvioTotalPendenciaAberto = 19;
  Campo_NFParametroConfiguracaoEmail_CEmEnvioDocumentoPendenteOperacao = 20;
  Campo_NFParametroConfiguracaoEmail_CEmEnvioSolicitacaoInstrucaoCancelada = 21;
  Campo_NFParametroConfiguracaoEmail_CEmNroDiasInstCanceladas = 22;
  Campo_NFParametroConfiguracaoEmail_CEmPorta = 23;
  Campo_NFParametroConfiguracaoEmail_CEmSuprimirLimiteCredito = 24;
  NFParametroConfiguracaoEmail_ReferenciaParaNovosCampos = Campo_NFParametroConfiguracaoEmail_CEmSuprimirLimiteCredito + 1;
  ARNFParametroConfiguracaoEmailMetadata: TARNFParametroConfiguracaoEmailMetadata = (
    Table: (Name: 'NFParametroConfiguracaoEmail'; PrimaryKeyFields: 'ID'; DeletedField: '');
    Fields: (
      (Index: Campo_NFParametroConfiguracaoEmail_ID; Name: 'ID'; FieldType: arftInteger; Length: 0; Nullable: False;
        Caption: 'ID'; Visible: True; ReadOnly: True; Commented: False; 
        Title: 'ID'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmSMTP; Name: 'CEmSMTP'; FieldType: arftVarchar; Length: 150; Nullable: True;
        Caption: 'CEmSMTP'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmSMTP'; ColumnCharWidth: 150),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmAutenticacao; Name: 'CEmAutenticacao'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CEmAutenticacao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmAutenticacao'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmUsuario; Name: 'CEmUsuario'; FieldType: arftVarchar; Length: 150; Nullable: True;
        Caption: 'CEmUsuario'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmUsuario'; ColumnCharWidth: 150),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmSenha; Name: 'CEmSenha'; FieldType: arftVarchar; Length: 150; Nullable: True;
        Caption: 'CEmSenha'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmSenha'; ColumnCharWidth: 150),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmEmailFactoring; Name: 'CEmEmailFactoring'; FieldType: arftVarchar; Length: 150; Nullable: True;
        Caption: 'CEmEmailFactoring'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmEmailFactoring'; ColumnCharWidth: 150),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmEmailMonitoramento; Name: 'CEmEmailMonitoramento'; FieldType: arftVarchar; Length: 150; Nullable: True;
        Caption: 'CEmEmailMonitoramento'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmEmailMonitoramento'; ColumnCharWidth: 150),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmEmailTeste; Name: 'CEmEmailTeste'; FieldType: arftVarchar; Length: 150; Nullable: True;
        Caption: 'CEmEmailTeste'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmEmailTeste'; ColumnCharWidth: 150),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmTextoCorpoEmail; Name: 'CEmTextoCorpoEmail'; FieldType: arftVarchar; Length: 600; Nullable: True;
        Caption: 'CEmTextoCorpoEmail'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmTextoCorpoEmail'; ColumnCharWidth: 600),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgentePosCed; Name: 'CEmEnvioDiarioAgentePosCed'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CEmEnvioDiarioAgentePosCed'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmEnvioDiarioAgentePosCed'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioConsultaTitulosCedente; Name: 'CEmEnvioDiarioConsultaTitulosCedente'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CEmEnvioDiarioConsultaTitulosCedente'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmEnvioDiarioConsultaTitulosCedente'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmQtdDiasTitulosVencer; Name: 'CEmQtdDiasTitulosVencer'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'CEmQtdDiasTitulosVencer'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmQtdDiasTitulosVencer'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgenteEmailCopia; Name: 'CEmEnvioDiarioAgenteEmailCopia'; FieldType: arftNVarchar; Length: 4000; Nullable: True;
        Caption: 'CEmEnvioDiarioAgenteEmailCopia'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmEnvioDiarioAgenteEmailCopia'; ColumnCharWidth: 4000),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmApresentaLogoEmpresa; Name: 'CEmApresentaLogoEmpresa'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CEmApresentaLogoEmpresa'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmApresentaLogoEmpresa'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmFonteCorpoEmail; Name: 'CEmFonteCorpoEmail'; FieldType: arftVarchar; Length: 20; Nullable: True;
        Caption: 'CEmFonteCorpoEmail'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmFonteCorpoEmail'; ColumnCharWidth: 20),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmFonteTamCorpoEmail; Name: 'CEmFonteTamCorpoEmail'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'CEmFonteTamCorpoEmail'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmFonteTamCorpoEmail'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmTextoInicialOpe; Name: 'CEmTextoInicialOpe'; FieldType: arftVarchar; Length: 60; Nullable: True;
        Caption: 'CEmTextoInicialOpe'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmTextoInicialOpe'; ColumnCharWidth: 60),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmTextoAposDadosOpe; Name: 'CEmTextoAposDadosOpe'; FieldType: arftVarchar; Length: 60; Nullable: True;
        Caption: 'CEmTextoAposDadosOpe'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmTextoAposDadosOpe'; ColumnCharWidth: 60),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmTituloEmail; Name: 'CEmTituloEmail'; FieldType: arftVarchar; Length: 200; Nullable: True;
        Caption: 'CEmTituloEmail'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmTituloEmail'; ColumnCharWidth: 200),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmEnvioTotalPendenciaAberto; Name: 'CEmEnvioTotalPendenciaAberto'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CEmEnvioTotalPendenciaAberto'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmEnvioTotalPendenciaAberto'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmEnvioDocumentoPendenteOperacao; Name: 'CEmEnvioDocumentoPendenteOperacao'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CEmEnvioDocumentoPendenteOperacao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmEnvioDocumentoPendenteOperacao'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmEnvioSolicitacaoInstrucaoCancelada; Name: 'CEmEnvioSolicitacaoInstrucaoCancelada'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CEmEnvioSolicitacaoInstrucaoCancelada'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmEnvioSolicitacaoInstrucaoCancelada'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmNroDiasInstCanceladas; Name: 'CEmNroDiasInstCanceladas'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'CEmNroDiasInstCanceladas'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmNroDiasInstCanceladas'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmPorta; Name: 'CEmPorta'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'CEmPorta'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmPorta'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFParametroConfiguracaoEmail_CEmSuprimirLimiteCredito; Name: 'CEmSuprimirLimiteCredito'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'CEmSuprimirLimiteCredito'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'CEmSuprimirLimiteCredito'; ColumnCharWidth: ColumnCharWidthForB01)
    ));

implementation

type
  TARNFParametroConfiguracaoEmailDelete = class(TActiveRecordSingletonADO)
  protected
    procedure DefineParameters; override;
    function GetCommandSQL: string; override;
  public
    procedure Persist(AARNFParametroConfiguracaoEmail: TARNFParametroConfiguracaoEmail);
  end;

  TARNFParametroConfiguracaoEmailInsert = class(TActiveRecordSingletonADO)
  protected
    procedure DefineParameters; override;
    function GetCommandSQL: string; override;
  public
    procedure Persist(AARNFParametroConfiguracaoEmail: TARNFParametroConfiguracaoEmail);
  end;

  TARNFParametroConfiguracaoEmailUpdate = class(TActiveRecordSingletonADO)
  protected
    procedure DefineParameters; override;
    function GetCommandSQL: string; override;
  public
    procedure Persist(AARNFParametroConfiguracaoEmail: TARNFParametroConfiguracaoEmail);
  end;

  TARNFParametroConfiguracaoEmailMetadataObject = class(TInterfacedObject, IActiveRecordMetadata)
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
  GQueryFactoryAll: IActiveRecordQueryFactory;
  GARNFParametroConfiguracaoEmailDeleteCriticalSection: TCriticalSection;
  GARNFParametroConfiguracaoEmailInsertCriticalSection: TCriticalSection;
  GARNFParametroConfiguracaoEmailUpdateCriticalSection: TCriticalSection;

{ TCollectionARNFParametroConfiguracaoEmail }

function TCollectionARNFParametroConfiguracaoEmail.Add(const Item: IARNFParametroConfiguracaoEmail): Integer;
begin
  Result := AddActiveRecord(Item);
end;

function TCollectionARNFParametroConfiguracaoEmail.First: IARNFParametroConfiguracaoEmail;
begin
  Result := nil;
  if Count > 0 then
    Result := GetItem(0);
end;

function TCollectionARNFParametroConfiguracaoEmail.GetItem(Index: Integer): IARNFParametroConfiguracaoEmail;
begin
  Result := List[Index] as IARNFParametroConfiguracaoEmail;
end;

procedure TCollectionARNFParametroConfiguracaoEmail.Insert(Index: Integer; const Item: IARNFParametroConfiguracaoEmail);
begin
  List.Insert(Index, Item);
end;

function TCollectionARNFParametroConfiguracaoEmail.Last: IARNFParametroConfiguracaoEmail;
begin
  Result := nil;
  if Count > 0 then
    Result := GetItem(Count - 1);
end;

function TCollectionARNFParametroConfiguracaoEmail.New(const AConnection: IActiveRecordConnection): IARNFParametroConfiguracaoEmail;
begin
  Result := ClassActiveRecord.Create(AConnection) as IARNFParametroConfiguracaoEmail;
  Add(Result);
end;

{ TIteratorARNFParametroConfiguracaoEmailDecorator }

function TIteratorARNFParametroConfiguracaoEmailDecorator.CurrentItem: IARNFParametroConfiguracaoEmail;
begin
  Result := CurrentItemActiveRecord as IARNFParametroConfiguracaoEmail;
end;

class function TIteratorARNFParametroConfiguracaoEmailDecorator.Decore(const ACollectionARNFParametroConfiguracaoEmail: ICollectionARNFParametroConfiguracaoEmail): IIteratorARNFParametroConfiguracaoEmail;
begin
  Result := Create(ACollectionARNFParametroConfiguracaoEmail);
end;

{ TIteratorARNFParametroConfiguracaoEmailQueryDecorator }

function TIteratorARNFParametroConfiguracaoEmailQueryDecorator.CurrentItem: IARNFParametroConfiguracaoEmail;
begin
  Result := CurrentItemActiveRecord as IARNFParametroConfiguracaoEmail;
end;

class function TIteratorARNFParametroConfiguracaoEmailQueryDecorator.Decore(const AARNFParametroConfiguracaoEmailQuery: IActiveRecordQuery): IIteratorARNFParametroConfiguracaoEmail;
begin
  Result := Create(AARNFParametroConfiguracaoEmailQuery);
end;

{ TARNFParametroConfiguracaoEmail }

procedure TARNFParametroConfiguracaoEmail.Clear(Index: Integer);
begin
  case Index of
    Campo_NFParametroConfiguracaoEmail_CEmSMTP: SetCEmSMTP(NullString);
    Campo_NFParametroConfiguracaoEmail_CEmAutenticacao: SetCEmAutenticacao(NullBoolean);
    Campo_NFParametroConfiguracaoEmail_CEmUsuario: SetCEmUsuario(NullString);
    Campo_NFParametroConfiguracaoEmail_CEmSenha: SetCEmSenha(NullString);
    Campo_NFParametroConfiguracaoEmail_CEmEmailFactoring: SetCEmEmailFactoring(NullString);
    Campo_NFParametroConfiguracaoEmail_CEmEmailMonitoramento: SetCEmEmailMonitoramento(NullString);
    Campo_NFParametroConfiguracaoEmail_CEmEmailTeste: SetCEmEmailTeste(NullString);
    Campo_NFParametroConfiguracaoEmail_CEmTextoCorpoEmail: SetCEmTextoCorpoEmail(NullString);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgentePosCed: SetCEmEnvioDiarioAgentePosCed(NullBoolean);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioConsultaTitulosCedente: SetCEmEnvioDiarioConsultaTitulosCedente(NullBoolean);
    Campo_NFParametroConfiguracaoEmail_CEmQtdDiasTitulosVencer: SetCEmQtdDiasTitulosVencer(NullInteger);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgenteEmailCopia: SetCEmEnvioDiarioAgenteEmailCopia(NullWideString);
    Campo_NFParametroConfiguracaoEmail_CEmApresentaLogoEmpresa: SetCEmApresentaLogoEmpresa(NullBoolean);
    Campo_NFParametroConfiguracaoEmail_CEmFonteCorpoEmail: SetCEmFonteCorpoEmail(NullString);
    Campo_NFParametroConfiguracaoEmail_CEmFonteTamCorpoEmail: SetCEmFonteTamCorpoEmail(NullInteger);
    Campo_NFParametroConfiguracaoEmail_CEmTextoInicialOpe: SetCEmTextoInicialOpe(NullString);
    Campo_NFParametroConfiguracaoEmail_CEmTextoAposDadosOpe: SetCEmTextoAposDadosOpe(NullString);
    Campo_NFParametroConfiguracaoEmail_CEmTituloEmail: SetCEmTituloEmail(NullString);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioTotalPendenciaAberto: SetCEmEnvioTotalPendenciaAberto(NullBoolean);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDocumentoPendenteOperacao: SetCEmEnvioDocumentoPendenteOperacao(NullBoolean);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioSolicitacaoInstrucaoCancelada: SetCEmEnvioSolicitacaoInstrucaoCancelada(NullBoolean);
    Campo_NFParametroConfiguracaoEmail_CEmNroDiasInstCanceladas: SetCEmNroDiasInstCanceladas(NullInteger);
    Campo_NFParametroConfiguracaoEmail_CEmPorta: SetCEmPorta(NullInteger);
    Campo_NFParametroConfiguracaoEmail_CEmSuprimirLimiteCredito: SetCEmSuprimirLimiteCredito(NullBoolean);
  else
    inherited;
  end;
end;

procedure TARNFParametroConfiguracaoEmail.CopyFrom(AActiveRecord: TActiveRecord);
var
  LARNFParametroConfiguracaoEmail: TARNFParametroConfiguracaoEmail;
begin
  inherited;
  LARNFParametroConfiguracaoEmail := AActiveRecord as TARNFParametroConfiguracaoEmail;
  FID := LARNFParametroConfiguracaoEmail.FID;
  FCEmSMTP := LARNFParametroConfiguracaoEmail.FCEmSMTP;
  FCEmAutenticacao := LARNFParametroConfiguracaoEmail.FCEmAutenticacao;
  FCEmUsuario := LARNFParametroConfiguracaoEmail.FCEmUsuario;
  FCEmSenha := LARNFParametroConfiguracaoEmail.FCEmSenha;
  FCEmEmailFactoring := LARNFParametroConfiguracaoEmail.FCEmEmailFactoring;
  FCEmEmailMonitoramento := LARNFParametroConfiguracaoEmail.FCEmEmailMonitoramento;
  FCEmEmailTeste := LARNFParametroConfiguracaoEmail.FCEmEmailTeste;
  FCEmTextoCorpoEmail := LARNFParametroConfiguracaoEmail.FCEmTextoCorpoEmail;
  FCEmEnvioDiarioAgentePosCed := LARNFParametroConfiguracaoEmail.FCEmEnvioDiarioAgentePosCed;
  FCEmEnvioDiarioConsultaTitulosCedente := LARNFParametroConfiguracaoEmail.FCEmEnvioDiarioConsultaTitulosCedente;
  FCEmQtdDiasTitulosVencer := LARNFParametroConfiguracaoEmail.FCEmQtdDiasTitulosVencer;
  FCEmEnvioDiarioAgenteEmailCopia := LARNFParametroConfiguracaoEmail.FCEmEnvioDiarioAgenteEmailCopia;
  FCEmApresentaLogoEmpresa := LARNFParametroConfiguracaoEmail.FCEmApresentaLogoEmpresa;
  FCEmFonteCorpoEmail := LARNFParametroConfiguracaoEmail.FCEmFonteCorpoEmail;
  FCEmFonteTamCorpoEmail := LARNFParametroConfiguracaoEmail.FCEmFonteTamCorpoEmail;
  FCEmTextoInicialOpe := LARNFParametroConfiguracaoEmail.FCEmTextoInicialOpe;
  FCEmTextoAposDadosOpe := LARNFParametroConfiguracaoEmail.FCEmTextoAposDadosOpe;
  FCEmTituloEmail := LARNFParametroConfiguracaoEmail.FCEmTituloEmail;
  FCEmEnvioTotalPendenciaAberto := LARNFParametroConfiguracaoEmail.FCEmEnvioTotalPendenciaAberto;
  FCEmEnvioDocumentoPendenteOperacao := LARNFParametroConfiguracaoEmail.FCEmEnvioDocumentoPendenteOperacao;
  FCEmEnvioSolicitacaoInstrucaoCancelada := LARNFParametroConfiguracaoEmail.FCEmEnvioSolicitacaoInstrucaoCancelada;
  FCEmNroDiasInstCanceladas := LARNFParametroConfiguracaoEmail.FCEmNroDiasInstCanceladas;
  FCEmPorta := LARNFParametroConfiguracaoEmail.FCEmPorta;
  FCEmSuprimirLimiteCredito := LARNFParametroConfiguracaoEmail.FCEmSuprimirLimiteCredito;
end;

constructor TARNFParametroConfiguracaoEmail.Create(const AConnection: IActiveRecordConnection);
begin
  inherited;
  FCEmSMTP := NullString;
  FCEmAutenticacao := NullBoolean;
  FCEmUsuario := NullString;
  FCEmSenha := NullString;
  FCEmEmailFactoring := NullString;
  FCEmEmailMonitoramento := NullString;
  FCEmEmailTeste := NullString;
  FCEmTextoCorpoEmail := NullString;
  FCEmEnvioDiarioAgentePosCed := NullBoolean;
  FCEmEnvioDiarioConsultaTitulosCedente := NullBoolean;
  FCEmQtdDiasTitulosVencer := NullInteger;
  FCEmEnvioDiarioAgenteEmailCopia := NullWideString;
  FCEmApresentaLogoEmpresa := NullBoolean;
  FCEmFonteCorpoEmail := NullString;
  FCEmFonteTamCorpoEmail := NullInteger;
  FCEmTextoInicialOpe := NullString;
  FCEmTextoAposDadosOpe := NullString;
  FCEmTituloEmail := NullString;
  FCEmEnvioTotalPendenciaAberto := NullBoolean;
  FCEmEnvioDocumentoPendenteOperacao := NullBoolean;
  FCEmEnvioSolicitacaoInstrucaoCancelada := NullBoolean;
  FCEmNroDiasInstCanceladas := NullInteger;
  FCEmPorta := NullInteger;
  FCEmSuprimirLimiteCredito := NullBoolean;
end;

function TARNFParametroConfiguracaoEmail.CreateItemRelationship(Index: Integer): TActiveRecord;
begin
  Result := nil;
end;

function TARNFParametroConfiguracaoEmail.DisplayText(Index: Integer): string;
begin
  case Index of
    Campo_NFParametroConfiguracaoEmail_CEmAutenticacao: Result := NullOrString(GetCEmAutenticacao.Null, NaoSim[GetCEmAutenticacao.Value]);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgentePosCed: Result := NullOrString(GetCEmEnvioDiarioAgentePosCed.Null, NaoSim[GetCEmEnvioDiarioAgentePosCed.Value]);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioConsultaTitulosCedente: Result := NullOrString(GetCEmEnvioDiarioConsultaTitulosCedente.Null, NaoSim[GetCEmEnvioDiarioConsultaTitulosCedente.Value]);
    Campo_NFParametroConfiguracaoEmail_CEmApresentaLogoEmpresa: Result := NullOrString(GetCEmApresentaLogoEmpresa.Null, NaoSim[GetCEmApresentaLogoEmpresa.Value]);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioTotalPendenciaAberto: Result := NullOrString(GetCEmEnvioTotalPendenciaAberto.Null, NaoSim[GetCEmEnvioTotalPendenciaAberto.Value]);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDocumentoPendenteOperacao: Result := NullOrString(GetCEmEnvioDocumentoPendenteOperacao.Null, NaoSim[GetCEmEnvioDocumentoPendenteOperacao.Value]);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioSolicitacaoInstrucaoCancelada: Result := NullOrString(GetCEmEnvioSolicitacaoInstrucaoCancelada.Null, NaoSim[GetCEmEnvioSolicitacaoInstrucaoCancelada.Value]);
    Campo_NFParametroConfiguracaoEmail_CEmSuprimirLimiteCredito: Result := NullOrString(GetCEmSuprimirLimiteCredito.Null, NaoSim[GetCEmSuprimirLimiteCredito.Value]);
  else
    Result := inherited DisplayText(Index);
  end;
end;

class function TARNFParametroConfiguracaoEmail.QueryAll(const AConnection: IActiveRecordConnection): IActiveRecordQuery;
begin
  Result := GQueryFactoryAll.CreateQuery(AConnection, Self);
end;

class function TARNFParametroConfiguracaoEmail.FindAll(const AConnection: IActiveRecordConnection): IARNFParametroConfiguracaoEmail;
begin
  Result := QueryAll(AConnection).FirstActiveRecord as IARNFParametroConfiguracaoEmail;
end;

function TARNFParametroConfiguracaoEmail.GetID: Integer;
begin
  Result := FID;
end;

function TARNFParametroConfiguracaoEmail.GetCEmSMTP: TNullableString;
begin
  Result := FCEmSMTP;
end;

function TARNFParametroConfiguracaoEmail.GetCEmAutenticacao: TNullableBoolean;
begin
  Result := FCEmAutenticacao;
end;

function TARNFParametroConfiguracaoEmail.GetCEmUsuario: TNullableString;
begin
  Result := FCEmUsuario;
end;

function TARNFParametroConfiguracaoEmail.GetCEmSenha: TNullableString;
begin
  Result := FCEmSenha;
end;

function TARNFParametroConfiguracaoEmail.GetCEmEmailFactoring: TNullableString;
begin
  Result := FCEmEmailFactoring;
end;

function TARNFParametroConfiguracaoEmail.GetCEmEmailMonitoramento: TNullableString;
begin
  Result := FCEmEmailMonitoramento;
end;

function TARNFParametroConfiguracaoEmail.GetCEmEmailTeste: TNullableString;
begin
  Result := FCEmEmailTeste;
end;

function TARNFParametroConfiguracaoEmail.GetCEmTextoCorpoEmail: TNullableString;
begin
  Result := FCEmTextoCorpoEmail;
end;

function TARNFParametroConfiguracaoEmail.GetCEmEnvioDiarioAgentePosCed: TNullableBoolean;
begin
  Result := FCEmEnvioDiarioAgentePosCed;
end;

function TARNFParametroConfiguracaoEmail.GetCEmEnvioDiarioConsultaTitulosCedente: TNullableBoolean;
begin
  Result := FCEmEnvioDiarioConsultaTitulosCedente;
end;

function TARNFParametroConfiguracaoEmail.GetCEmQtdDiasTitulosVencer: TNullableInteger;
begin
  Result := FCEmQtdDiasTitulosVencer;
end;

function TARNFParametroConfiguracaoEmail.GetCEmEnvioDiarioAgenteEmailCopia: TNullableWideString;
begin
  Result := FCEmEnvioDiarioAgenteEmailCopia;
end;

function TARNFParametroConfiguracaoEmail.GetCEmApresentaLogoEmpresa: TNullableBoolean;
begin
  Result := FCEmApresentaLogoEmpresa;
end;

function TARNFParametroConfiguracaoEmail.GetCEmFonteCorpoEmail: TNullableString;
begin
  Result := FCEmFonteCorpoEmail;
end;

function TARNFParametroConfiguracaoEmail.GetCEmFonteTamCorpoEmail: TNullableInteger;
begin
  Result := FCEmFonteTamCorpoEmail;
end;

function TARNFParametroConfiguracaoEmail.GetCEmTextoInicialOpe: TNullableString;
begin
  Result := FCEmTextoInicialOpe;
end;

function TARNFParametroConfiguracaoEmail.GetCEmTextoAposDadosOpe: TNullableString;
begin
  Result := FCEmTextoAposDadosOpe;
end;

function TARNFParametroConfiguracaoEmail.GetCEmTituloEmail: TNullableString;
begin
  Result := FCEmTituloEmail;
end;

function TARNFParametroConfiguracaoEmail.GetCEmEnvioTotalPendenciaAberto: TNullableBoolean;
begin
  Result := FCEmEnvioTotalPendenciaAberto;
end;

function TARNFParametroConfiguracaoEmail.GetCEmEnvioDocumentoPendenteOperacao: TNullableBoolean;
begin
  Result := FCEmEnvioDocumentoPendenteOperacao;
end;

function TARNFParametroConfiguracaoEmail.GetCEmEnvioSolicitacaoInstrucaoCancelada: TNullableBoolean;
begin
  Result := FCEmEnvioSolicitacaoInstrucaoCancelada;
end;

function TARNFParametroConfiguracaoEmail.GetCEmNroDiasInstCanceladas: TNullableInteger;
begin
  Result := FCEmNroDiasInstCanceladas;
end;

function TARNFParametroConfiguracaoEmail.GetCEmPorta: TNullableInteger;
begin
  Result := FCEmPorta;
end;

function TARNFParametroConfiguracaoEmail.GetCEmSuprimirLimiteCredito: TNullableBoolean;
begin
  Result := FCEmSuprimirLimiteCredito;
end;

function TARNFParametroConfiguracaoEmail.GetAsString(Index: Integer): string;
begin
  case Index of
    Campo_NFParametroConfiguracaoEmail_ID: Result := IntToStr(GetID);
    Campo_NFParametroConfiguracaoEmail_CEmSMTP: Result := ToString(GetCEmSMTP);
    Campo_NFParametroConfiguracaoEmail_CEmAutenticacao: Result := ToStringNS(GetCEmAutenticacao);
    Campo_NFParametroConfiguracaoEmail_CEmUsuario: Result := ToString(GetCEmUsuario);
    Campo_NFParametroConfiguracaoEmail_CEmSenha: Result := ToString(GetCEmSenha);
    Campo_NFParametroConfiguracaoEmail_CEmEmailFactoring: Result := ToString(GetCEmEmailFactoring);
    Campo_NFParametroConfiguracaoEmail_CEmEmailMonitoramento: Result := ToString(GetCEmEmailMonitoramento);
    Campo_NFParametroConfiguracaoEmail_CEmEmailTeste: Result := ToString(GetCEmEmailTeste);
    Campo_NFParametroConfiguracaoEmail_CEmTextoCorpoEmail: Result := ToString(GetCEmTextoCorpoEmail);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgentePosCed: Result := ToStringNS(GetCEmEnvioDiarioAgentePosCed);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioConsultaTitulosCedente: Result := ToStringNS(GetCEmEnvioDiarioConsultaTitulosCedente);
    Campo_NFParametroConfiguracaoEmail_CEmQtdDiasTitulosVencer: Result := ToString(GetCEmQtdDiasTitulosVencer);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgenteEmailCopia: Result := ToString(GetCEmEnvioDiarioAgenteEmailCopia);
    Campo_NFParametroConfiguracaoEmail_CEmApresentaLogoEmpresa: Result := ToStringNS(GetCEmApresentaLogoEmpresa);
    Campo_NFParametroConfiguracaoEmail_CEmFonteCorpoEmail: Result := ToString(GetCEmFonteCorpoEmail);
    Campo_NFParametroConfiguracaoEmail_CEmFonteTamCorpoEmail: Result := ToString(GetCEmFonteTamCorpoEmail);
    Campo_NFParametroConfiguracaoEmail_CEmTextoInicialOpe: Result := ToString(GetCEmTextoInicialOpe);
    Campo_NFParametroConfiguracaoEmail_CEmTextoAposDadosOpe: Result := ToString(GetCEmTextoAposDadosOpe);
    Campo_NFParametroConfiguracaoEmail_CEmTituloEmail: Result := ToString(GetCEmTituloEmail);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioTotalPendenciaAberto: Result := ToStringNS(GetCEmEnvioTotalPendenciaAberto);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDocumentoPendenteOperacao: Result := ToStringNS(GetCEmEnvioDocumentoPendenteOperacao);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioSolicitacaoInstrucaoCancelada: Result := ToStringNS(GetCEmEnvioSolicitacaoInstrucaoCancelada);
    Campo_NFParametroConfiguracaoEmail_CEmNroDiasInstCanceladas: Result := ToString(GetCEmNroDiasInstCanceladas);
    Campo_NFParametroConfiguracaoEmail_CEmPorta: Result := ToString(GetCEmPorta);
    Campo_NFParametroConfiguracaoEmail_CEmSuprimirLimiteCredito: Result := ToStringNS(GetCEmSuprimirLimiteCredito);
  else
    Result := inherited GetAsString(Index);
  end;
end;

function TARNFParametroConfiguracaoEmail.GetValue(Index: Integer): Variant;
begin
  case Index of
    Campo_NFParametroConfiguracaoEmail_ID: Result := GetID;
    Campo_NFParametroConfiguracaoEmail_CEmSMTP: Result := ToVariant(GetCEmSMTP);
    Campo_NFParametroConfiguracaoEmail_CEmAutenticacao: Result := ToVariant(GetCEmAutenticacao);
    Campo_NFParametroConfiguracaoEmail_CEmUsuario: Result := ToVariant(GetCEmUsuario);
    Campo_NFParametroConfiguracaoEmail_CEmSenha: Result := ToVariant(GetCEmSenha);
    Campo_NFParametroConfiguracaoEmail_CEmEmailFactoring: Result := ToVariant(GetCEmEmailFactoring);
    Campo_NFParametroConfiguracaoEmail_CEmEmailMonitoramento: Result := ToVariant(GetCEmEmailMonitoramento);
    Campo_NFParametroConfiguracaoEmail_CEmEmailTeste: Result := ToVariant(GetCEmEmailTeste);
    Campo_NFParametroConfiguracaoEmail_CEmTextoCorpoEmail: Result := ToVariant(GetCEmTextoCorpoEmail);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgentePosCed: Result := ToVariant(GetCEmEnvioDiarioAgentePosCed);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioConsultaTitulosCedente: Result := ToVariant(GetCEmEnvioDiarioConsultaTitulosCedente);
    Campo_NFParametroConfiguracaoEmail_CEmQtdDiasTitulosVencer: Result := ToVariant(GetCEmQtdDiasTitulosVencer);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgenteEmailCopia: Result := ToVariant(GetCEmEnvioDiarioAgenteEmailCopia);
    Campo_NFParametroConfiguracaoEmail_CEmApresentaLogoEmpresa: Result := ToVariant(GetCEmApresentaLogoEmpresa);
    Campo_NFParametroConfiguracaoEmail_CEmFonteCorpoEmail: Result := ToVariant(GetCEmFonteCorpoEmail);
    Campo_NFParametroConfiguracaoEmail_CEmFonteTamCorpoEmail: Result := ToVariant(GetCEmFonteTamCorpoEmail);
    Campo_NFParametroConfiguracaoEmail_CEmTextoInicialOpe: Result := ToVariant(GetCEmTextoInicialOpe);
    Campo_NFParametroConfiguracaoEmail_CEmTextoAposDadosOpe: Result := ToVariant(GetCEmTextoAposDadosOpe);
    Campo_NFParametroConfiguracaoEmail_CEmTituloEmail: Result := ToVariant(GetCEmTituloEmail);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioTotalPendenciaAberto: Result := ToVariant(GetCEmEnvioTotalPendenciaAberto);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDocumentoPendenteOperacao: Result := ToVariant(GetCEmEnvioDocumentoPendenteOperacao);
    Campo_NFParametroConfiguracaoEmail_CEmEnvioSolicitacaoInstrucaoCancelada: Result := ToVariant(GetCEmEnvioSolicitacaoInstrucaoCancelada);
    Campo_NFParametroConfiguracaoEmail_CEmNroDiasInstCanceladas: Result := ToVariant(GetCEmNroDiasInstCanceladas);
    Campo_NFParametroConfiguracaoEmail_CEmPorta: Result := ToVariant(GetCEmPorta);
    Campo_NFParametroConfiguracaoEmail_CEmSuprimirLimiteCredito: Result := ToVariant(GetCEmSuprimirLimiteCredito);
  else
    Result := inherited GetValue(Index);
  end;
end;

class function TARNFParametroConfiguracaoEmail.GUIDItem: TGUID;
begin
  Result := IARNFParametroConfiguracaoEmail;
end;

function TARNFParametroConfiguracaoEmail.IsNull(Index: Integer): Boolean;
begin
  case Index of
    Campo_NFParametroConfiguracaoEmail_ID: Result := False;
    Campo_NFParametroConfiguracaoEmail_CEmSMTP: Result := GetCEmSMTP.Null;
    Campo_NFParametroConfiguracaoEmail_CEmAutenticacao: Result := GetCEmAutenticacao.Null;
    Campo_NFParametroConfiguracaoEmail_CEmUsuario: Result := GetCEmUsuario.Null;
    Campo_NFParametroConfiguracaoEmail_CEmSenha: Result := GetCEmSenha.Null;
    Campo_NFParametroConfiguracaoEmail_CEmEmailFactoring: Result := GetCEmEmailFactoring.Null;
    Campo_NFParametroConfiguracaoEmail_CEmEmailMonitoramento: Result := GetCEmEmailMonitoramento.Null;
    Campo_NFParametroConfiguracaoEmail_CEmEmailTeste: Result := GetCEmEmailTeste.Null;
    Campo_NFParametroConfiguracaoEmail_CEmTextoCorpoEmail: Result := GetCEmTextoCorpoEmail.Null;
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgentePosCed: Result := GetCEmEnvioDiarioAgentePosCed.Null;
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioConsultaTitulosCedente: Result := GetCEmEnvioDiarioConsultaTitulosCedente.Null;
    Campo_NFParametroConfiguracaoEmail_CEmQtdDiasTitulosVencer: Result := GetCEmQtdDiasTitulosVencer.Null;
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgenteEmailCopia: Result := GetCEmEnvioDiarioAgenteEmailCopia.Null;
    Campo_NFParametroConfiguracaoEmail_CEmApresentaLogoEmpresa: Result := GetCEmApresentaLogoEmpresa.Null;
    Campo_NFParametroConfiguracaoEmail_CEmFonteCorpoEmail: Result := GetCEmFonteCorpoEmail.Null;
    Campo_NFParametroConfiguracaoEmail_CEmFonteTamCorpoEmail: Result := GetCEmFonteTamCorpoEmail.Null;
    Campo_NFParametroConfiguracaoEmail_CEmTextoInicialOpe: Result := GetCEmTextoInicialOpe.Null;
    Campo_NFParametroConfiguracaoEmail_CEmTextoAposDadosOpe: Result := GetCEmTextoAposDadosOpe.Null;
    Campo_NFParametroConfiguracaoEmail_CEmTituloEmail: Result := GetCEmTituloEmail.Null;
    Campo_NFParametroConfiguracaoEmail_CEmEnvioTotalPendenciaAberto: Result := GetCEmEnvioTotalPendenciaAberto.Null;
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDocumentoPendenteOperacao: Result := GetCEmEnvioDocumentoPendenteOperacao.Null;
    Campo_NFParametroConfiguracaoEmail_CEmEnvioSolicitacaoInstrucaoCancelada: Result := GetCEmEnvioSolicitacaoInstrucaoCancelada.Null;
    Campo_NFParametroConfiguracaoEmail_CEmNroDiasInstCanceladas: Result := GetCEmNroDiasInstCanceladas.Null;
    Campo_NFParametroConfiguracaoEmail_CEmPorta: Result := GetCEmPorta.Null;
    Campo_NFParametroConfiguracaoEmail_CEmSuprimirLimiteCredito: Result := GetCEmSuprimirLimiteCredito.Null;
  else
    Result := inherited IsNull(Index);
  end;
end;

procedure TARNFParametroConfiguracaoEmail.SetAsString(Index: Integer; const Value: string);
begin
  case Index of
    Campo_NFParametroConfiguracaoEmail_ID: raise EActiveRecord.Create('Campo ID é somente leitura');
    Campo_NFParametroConfiguracaoEmail_CEmSMTP: SetCEmSMTP(Nullable(Value));
    Campo_NFParametroConfiguracaoEmail_CEmAutenticacao: SetCEmAutenticacao(NSToNullableBoolean(Value));
    Campo_NFParametroConfiguracaoEmail_CEmUsuario: SetCEmUsuario(Nullable(Value));
    Campo_NFParametroConfiguracaoEmail_CEmSenha: SetCEmSenha(Nullable(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEmailFactoring: SetCEmEmailFactoring(Nullable(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEmailMonitoramento: SetCEmEmailMonitoramento(Nullable(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEmailTeste: SetCEmEmailTeste(Nullable(Value));
    Campo_NFParametroConfiguracaoEmail_CEmTextoCorpoEmail: SetCEmTextoCorpoEmail(Nullable(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgentePosCed: SetCEmEnvioDiarioAgentePosCed(NSToNullableBoolean(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioConsultaTitulosCedente: SetCEmEnvioDiarioConsultaTitulosCedente(NSToNullableBoolean(Value));
    Campo_NFParametroConfiguracaoEmail_CEmQtdDiasTitulosVencer: SetCEmQtdDiasTitulosVencer(StringToNullableInteger(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgenteEmailCopia: SetCEmEnvioDiarioAgenteEmailCopia(NullableWideString(Value));
    Campo_NFParametroConfiguracaoEmail_CEmApresentaLogoEmpresa: SetCEmApresentaLogoEmpresa(NSToNullableBoolean(Value));
    Campo_NFParametroConfiguracaoEmail_CEmFonteCorpoEmail: SetCEmFonteCorpoEmail(Nullable(Value));
    Campo_NFParametroConfiguracaoEmail_CEmFonteTamCorpoEmail: SetCEmFonteTamCorpoEmail(StringToNullableInteger(Value));
    Campo_NFParametroConfiguracaoEmail_CEmTextoInicialOpe: SetCEmTextoInicialOpe(Nullable(Value));
    Campo_NFParametroConfiguracaoEmail_CEmTextoAposDadosOpe: SetCEmTextoAposDadosOpe(Nullable(Value));
    Campo_NFParametroConfiguracaoEmail_CEmTituloEmail: SetCEmTituloEmail(Nullable(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEnvioTotalPendenciaAberto: SetCEmEnvioTotalPendenciaAberto(NSToNullableBoolean(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDocumentoPendenteOperacao: SetCEmEnvioDocumentoPendenteOperacao(NSToNullableBoolean(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEnvioSolicitacaoInstrucaoCancelada: SetCEmEnvioSolicitacaoInstrucaoCancelada(NSToNullableBoolean(Value));
    Campo_NFParametroConfiguracaoEmail_CEmNroDiasInstCanceladas: SetCEmNroDiasInstCanceladas(StringToNullableInteger(Value));
    Campo_NFParametroConfiguracaoEmail_CEmPorta: SetCEmPorta(StringToNullableInteger(Value));
    Campo_NFParametroConfiguracaoEmail_CEmSuprimirLimiteCredito: SetCEmSuprimirLimiteCredito(NSToNullableBoolean(Value));
  else
    inherited;
  end;
end;

procedure TARNFParametroConfiguracaoEmail.SetValue(Index: Integer; const Value: Variant);
begin
  case Index of
    Campo_NFParametroConfiguracaoEmail_ID: raise EActiveRecord.Create('Campo ID é somente leitura');
    Campo_NFParametroConfiguracaoEmail_CEmSMTP: SetCEmSMTP(VariantToNullableString(Value));
    Campo_NFParametroConfiguracaoEmail_CEmAutenticacao: SetCEmAutenticacao(VariantToNullableBoolean(Value));
    Campo_NFParametroConfiguracaoEmail_CEmUsuario: SetCEmUsuario(VariantToNullableString(Value));
    Campo_NFParametroConfiguracaoEmail_CEmSenha: SetCEmSenha(VariantToNullableString(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEmailFactoring: SetCEmEmailFactoring(VariantToNullableString(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEmailMonitoramento: SetCEmEmailMonitoramento(VariantToNullableString(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEmailTeste: SetCEmEmailTeste(VariantToNullableString(Value));
    Campo_NFParametroConfiguracaoEmail_CEmTextoCorpoEmail: SetCEmTextoCorpoEmail(VariantToNullableString(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgentePosCed: SetCEmEnvioDiarioAgentePosCed(VariantToNullableBoolean(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioConsultaTitulosCedente: SetCEmEnvioDiarioConsultaTitulosCedente(VariantToNullableBoolean(Value));
    Campo_NFParametroConfiguracaoEmail_CEmQtdDiasTitulosVencer: SetCEmQtdDiasTitulosVencer(VariantToNullableInteger(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgenteEmailCopia: SetCEmEnvioDiarioAgenteEmailCopia(VariantToNullableWideString(Value));
    Campo_NFParametroConfiguracaoEmail_CEmApresentaLogoEmpresa: SetCEmApresentaLogoEmpresa(VariantToNullableBoolean(Value));
    Campo_NFParametroConfiguracaoEmail_CEmFonteCorpoEmail: SetCEmFonteCorpoEmail(VariantToNullableString(Value));
    Campo_NFParametroConfiguracaoEmail_CEmFonteTamCorpoEmail: SetCEmFonteTamCorpoEmail(VariantToNullableInteger(Value));
    Campo_NFParametroConfiguracaoEmail_CEmTextoInicialOpe: SetCEmTextoInicialOpe(VariantToNullableString(Value));
    Campo_NFParametroConfiguracaoEmail_CEmTextoAposDadosOpe: SetCEmTextoAposDadosOpe(VariantToNullableString(Value));
    Campo_NFParametroConfiguracaoEmail_CEmTituloEmail: SetCEmTituloEmail(VariantToNullableString(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEnvioTotalPendenciaAberto: SetCEmEnvioTotalPendenciaAberto(VariantToNullableBoolean(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEnvioDocumentoPendenteOperacao: SetCEmEnvioDocumentoPendenteOperacao(VariantToNullableBoolean(Value));
    Campo_NFParametroConfiguracaoEmail_CEmEnvioSolicitacaoInstrucaoCancelada: SetCEmEnvioSolicitacaoInstrucaoCancelada(VariantToNullableBoolean(Value));
    Campo_NFParametroConfiguracaoEmail_CEmNroDiasInstCanceladas: SetCEmNroDiasInstCanceladas(VariantToNullableInteger(Value));
    Campo_NFParametroConfiguracaoEmail_CEmPorta: SetCEmPorta(VariantToNullableInteger(Value));
    Campo_NFParametroConfiguracaoEmail_CEmSuprimirLimiteCredito: SetCEmSuprimirLimiteCredito(VariantToNullableBoolean(Value));
  else
    inherited;
  end;
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmSMTP(const Value: TNullableString);
begin
  FCEmSMTP := AjustaVarchar(Value, 150);
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmAutenticacao(const Value: TNullableBoolean);
begin
  FCEmAutenticacao := Value;
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmUsuario(const Value: TNullableString);
begin
  FCEmUsuario := AjustaVarchar(Value, 150);
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmSenha(const Value: TNullableString);
begin
  FCEmSenha := AjustaVarchar(Value, 150);
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmEmailFactoring(const Value: TNullableString);
begin
  FCEmEmailFactoring := AjustaVarchar(Value, 150);
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmEmailMonitoramento(const Value: TNullableString);
begin
  FCEmEmailMonitoramento := AjustaVarchar(Value, 150);
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmEmailTeste(const Value: TNullableString);
begin
  FCEmEmailTeste := AjustaVarchar(Value, 150);
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmTextoCorpoEmail(const Value: TNullableString);
begin
  FCEmTextoCorpoEmail := AjustaVarchar(Value, 600);
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmEnvioDiarioAgentePosCed(const Value: TNullableBoolean);
begin
  FCEmEnvioDiarioAgentePosCed := Value;
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmEnvioDiarioConsultaTitulosCedente(const Value: TNullableBoolean);
begin
  FCEmEnvioDiarioConsultaTitulosCedente := Value;
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmQtdDiasTitulosVencer(const Value: TNullableInteger);
begin
  FCEmQtdDiasTitulosVencer := Value;
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmEnvioDiarioAgenteEmailCopia(const Value: TNullableWideString);
begin
  FCEmEnvioDiarioAgenteEmailCopia := AjustaVarchar(Value, 4000);
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmApresentaLogoEmpresa(const Value: TNullableBoolean);
begin
  FCEmApresentaLogoEmpresa := Value;
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmFonteCorpoEmail(const Value: TNullableString);
begin
  FCEmFonteCorpoEmail := AjustaVarchar(Value, 20);
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmFonteTamCorpoEmail(const Value: TNullableInteger);
begin
  FCEmFonteTamCorpoEmail := Value;
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmTextoInicialOpe(const Value: TNullableString);
begin
  FCEmTextoInicialOpe := AjustaVarchar(Value, 60);
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmTextoAposDadosOpe(const Value: TNullableString);
begin
  FCEmTextoAposDadosOpe := AjustaVarchar(Value, 60);
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmTituloEmail(const Value: TNullableString);
begin
  FCEmTituloEmail := AjustaVarchar(Value, 200);
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmEnvioTotalPendenciaAberto(const Value: TNullableBoolean);
begin
  FCEmEnvioTotalPendenciaAberto := Value;
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmEnvioDocumentoPendenteOperacao(const Value: TNullableBoolean);
begin
  FCEmEnvioDocumentoPendenteOperacao := Value;
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmEnvioSolicitacaoInstrucaoCancelada(const Value: TNullableBoolean);
begin
  FCEmEnvioSolicitacaoInstrucaoCancelada := Value;
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmNroDiasInstCanceladas(const Value: TNullableInteger);
begin
  FCEmNroDiasInstCanceladas := Value;
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmPorta(const Value: TNullableInteger);
begin
  FCEmPorta := Value;
end;

procedure TARNFParametroConfiguracaoEmail.SetCEmSuprimirLimiteCredito(const Value: TNullableBoolean);
begin
  FCEmSuprimirLimiteCredito := Value;
end;

class function TARNFParametroConfiguracaoEmail.Metadata: IActiveRecordMetadata;
begin
  Result := TARNFParametroConfiguracaoEmailMetadataObject.Create;
end;

procedure TARNFParametroConfiguracaoEmail.Persist;
begin
  PersistSQL;
end;

procedure TARNFParametroConfiguracaoEmail.PersistSQL;
begin
  if GetDeleted then
  begin
    GARNFParametroConfiguracaoEmailDeleteCriticalSection.Acquire;
    try
      TARNFParametroConfiguracaoEmailDelete.Create.Persist(Self);
    finally
      GARNFParametroConfiguracaoEmailDeleteCriticalSection.Release;
    end;
  end
  else
  begin
    if GetNovo then
    begin
      GARNFParametroConfiguracaoEmailInsertCriticalSection.Acquire;
      try
        TARNFParametroConfiguracaoEmailInsert.Create.Persist(Self);
      finally
        GARNFParametroConfiguracaoEmailInsertCriticalSection.Release;
      end;
    end
    else
    begin
      GARNFParametroConfiguracaoEmailUpdateCriticalSection.Acquire;
      try
        TARNFParametroConfiguracaoEmailUpdate.Create.Persist(Self);
      finally
        GARNFParametroConfiguracaoEmailUpdateCriticalSection.Release;
      end;
    end;
  end;
end;

procedure TARNFParametroConfiguracaoEmail.SetRecordSet(const ARecordSet: _RecordSet; AOffset: Integer);
begin
  FPrimaryKeyID := ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_ID + AOffset].Value;
  FID := ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_ID + AOffset].Value;
  FCEmSMTP := VariantToNullableString(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmSMTP + AOffset].Value);
  FCEmAutenticacao := VariantToNullableB01(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmAutenticacao + AOffset].Value);
  FCEmUsuario := VariantToNullableString(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmUsuario + AOffset].Value);
  FCEmSenha := VariantToNullableString(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmSenha + AOffset].Value);
  FCEmEmailFactoring := VariantToNullableString(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmEmailFactoring + AOffset].Value);
  FCEmEmailMonitoramento := VariantToNullableString(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmEmailMonitoramento + AOffset].Value);
  FCEmEmailTeste := VariantToNullableString(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmEmailTeste + AOffset].Value);
  FCEmTextoCorpoEmail := VariantToNullableString(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmTextoCorpoEmail + AOffset].Value);
  FCEmEnvioDiarioAgentePosCed := VariantToNullableB01(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgentePosCed + AOffset].Value);
  FCEmEnvioDiarioConsultaTitulosCedente := VariantToNullableB01(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioConsultaTitulosCedente + AOffset].Value);
  FCEmQtdDiasTitulosVencer := VariantToNullableInteger(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmQtdDiasTitulosVencer + AOffset].Value);
  FCEmEnvioDiarioAgenteEmailCopia := VariantToNullableWideString(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmEnvioDiarioAgenteEmailCopia + AOffset].Value);
  FCEmApresentaLogoEmpresa := VariantToNullableB01(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmApresentaLogoEmpresa + AOffset].Value);
  FCEmFonteCorpoEmail := VariantToNullableString(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmFonteCorpoEmail + AOffset].Value);
  FCEmFonteTamCorpoEmail := VariantToNullableInteger(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmFonteTamCorpoEmail + AOffset].Value);
  FCEmTextoInicialOpe := VariantToNullableString(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmTextoInicialOpe + AOffset].Value);
  FCEmTextoAposDadosOpe := VariantToNullableString(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmTextoAposDadosOpe + AOffset].Value);
  FCEmTituloEmail := VariantToNullableString(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmTituloEmail + AOffset].Value);
  FCEmEnvioTotalPendenciaAberto := VariantToNullableB01(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmEnvioTotalPendenciaAberto + AOffset].Value);
  FCEmEnvioDocumentoPendenteOperacao := VariantToNullableB01(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmEnvioDocumentoPendenteOperacao + AOffset].Value);
  FCEmEnvioSolicitacaoInstrucaoCancelada := VariantToNullableB01(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmEnvioSolicitacaoInstrucaoCancelada + AOffset].Value);
  FCEmNroDiasInstCanceladas := VariantToNullableInteger(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmNroDiasInstCanceladas + AOffset].Value);
  FCEmPorta := VariantToNullableInteger(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmPorta + AOffset].Value);
  FCEmSuprimirLimiteCredito := VariantToNullableB01(ARecordSet.Fields[Campo_NFParametroConfiguracaoEmail_CEmSuprimirLimiteCredito + AOffset].Value);
end;

class function TARNFParametroConfiguracaoEmail.ViewMetadata: IActiveRecordMetadata;
begin
  Result := Metadata;
end;

{ TARNFParametroConfiguracaoEmailDelete }

procedure TARNFParametroConfiguracaoEmailDelete.DefineParameters;
begin
  Command.Parameters.Append(Command.CreateParameter('ID', adInteger, adParamInput, 0, Null));
end;

function TARNFParametroConfiguracaoEmailDelete.GetCommandSQL: string;
begin
  Result :=
    'delete from nfparametroconfiguracaoemail'#13#10 +
    'where'#13#10 +
    '  id = ?';
end;

procedure TARNFParametroConfiguracaoEmailDelete.Persist(AARNFParametroConfiguracaoEmail: TARNFParametroConfiguracaoEmail);
begin
  inherited Persist(AARNFParametroConfiguracaoEmail);
  //Chaves
  Command.Parameters[0].Value := AARNFParametroConfiguracaoEmail.FID;
  if Execute <> 1 then
    raise EActiveRecord.Create('Delete Failed TARNFParametroConfiguracaoEmailDelete');
end;

{ TARNFParametroConfiguracaoEmailInsert }

procedure TARNFParametroConfiguracaoEmailInsert.DefineParameters;
begin
  Command.Parameters.Append(Command.CreateParameter('CEmSMTP', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmAutenticacao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmUsuario', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmSenha', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEmailFactoring', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEmailMonitoramento', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEmailTeste', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmTextoCorpoEmail', adVarChar, adParamInput, 600, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEnvioDiarioAgentePosCed', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEnvioDiarioConsultaTitulosCedente', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmQtdDiasTitulosVencer', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEnvioDiarioAgenteEmailCopia', adVarWChar, adParamInput, 4000, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmApresentaLogoEmpresa', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmFonteCorpoEmail', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmFonteTamCorpoEmail', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmTextoInicialOpe', adVarChar, adParamInput, 60, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmTextoAposDadosOpe', adVarChar, adParamInput, 60, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmTituloEmail', adVarChar, adParamInput, 200, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEnvioTotalPendenciaAberto', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEnvioDocumentoPendenteOperacao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEnvioSolicitacaoInstrucaoCancelada', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmNroDiasInstCanceladas', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmPorta', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmSuprimirLimiteCredito', adInteger, adParamInput, 0, Null));
end;

function TARNFParametroConfiguracaoEmailInsert.GetCommandSQL: string;
begin
  Result :=
    'insert into nfparametroconfiguracaoemail ('#13#10 +
    '  cemsmtp, cemautenticacao, cemusuario, cemsenha,'#13#10 +
    '  cememailfactoring, cememailmonitoramento, cememailteste, cemtextocorpoemail, cemenviodiarioagenteposced,'#13#10 +
    '  cemenviodiarioconsultatituloscedente, cemqtddiastitulosvencer, cemenviodiarioagenteemailcopia, cemapresentalogoempresa, cemfontecorpoemail,'#13#10 +
    '  cemfontetamcorpoemail, cemtextoinicialope, cemtextoaposdadosope, cemtituloemail, cemenviototalpendenciaaberto,'#13#10 +
    '  cemenviodocumentopendenteoperacao, cemenviosolicitacaoinstrucaocancelada, cemnrodiasinstcanceladas, cemporta, cemsuprimirlimitecredito'#13#10 +
    ') output inserted.id values ('#13#10 +
    '  ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?'#13#10 +
    ')';
end;

procedure TARNFParametroConfiguracaoEmailInsert.Persist(AARNFParametroConfiguracaoEmail: TARNFParametroConfiguracaoEmail);
begin
  inherited Persist(AARNFParametroConfiguracaoEmail);
  Command.Parameters[0].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmSMTP);
  Command.Parameters[1].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmAutenticacao);
  Command.Parameters[2].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmUsuario);
  Command.Parameters[3].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmSenha);
  Command.Parameters[4].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmEmailFactoring);
  Command.Parameters[5].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmEmailMonitoramento);
  Command.Parameters[6].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmEmailTeste);
  Command.Parameters[7].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmTextoCorpoEmail);
  Command.Parameters[8].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmEnvioDiarioAgentePosCed);
  Command.Parameters[9].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmEnvioDiarioConsultaTitulosCedente);
  Command.Parameters[10].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmQtdDiasTitulosVencer);
  Command.Parameters[11].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmEnvioDiarioAgenteEmailCopia);
  Command.Parameters[12].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmApresentaLogoEmpresa);
  Command.Parameters[13].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmFonteCorpoEmail);
  Command.Parameters[14].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmFonteTamCorpoEmail);
  Command.Parameters[15].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmTextoInicialOpe);
  Command.Parameters[16].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmTextoAposDadosOpe);
  Command.Parameters[17].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmTituloEmail);
  Command.Parameters[18].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmEnvioTotalPendenciaAberto);
  Command.Parameters[19].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmEnvioDocumentoPendenteOperacao);
  Command.Parameters[20].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmEnvioSolicitacaoInstrucaoCancelada);
  Command.Parameters[21].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmNroDiasInstCanceladas);
  Command.Parameters[22].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmPorta);
  Command.Parameters[23].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmSuprimirLimiteCredito);
  AARNFParametroConfiguracaoEmail.FID := ExecuteReturnAutoInc;
  //Atribuições das Chaves após o insert
  AARNFParametroConfiguracaoEmail.FPrimaryKeyID := AARNFParametroConfiguracaoEmail.FID;
end;

{ TARNFParametroConfiguracaoEmailUpdate }

procedure TARNFParametroConfiguracaoEmailUpdate.DefineParameters;
begin
  Command.Parameters.Append(Command.CreateParameter('CEmSMTP', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmAutenticacao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmUsuario', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmSenha', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEmailFactoring', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEmailMonitoramento', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEmailTeste', adVarChar, adParamInput, 150, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmTextoCorpoEmail', adVarChar, adParamInput, 600, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEnvioDiarioAgentePosCed', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEnvioDiarioConsultaTitulosCedente', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmQtdDiasTitulosVencer', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEnvioDiarioAgenteEmailCopia', adVarWChar, adParamInput, 4000, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmApresentaLogoEmpresa', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmFonteCorpoEmail', adVarChar, adParamInput, 20, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmFonteTamCorpoEmail', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmTextoInicialOpe', adVarChar, adParamInput, 60, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmTextoAposDadosOpe', adVarChar, adParamInput, 60, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmTituloEmail', adVarChar, adParamInput, 200, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEnvioTotalPendenciaAberto', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEnvioDocumentoPendenteOperacao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmEnvioSolicitacaoInstrucaoCancelada', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmNroDiasInstCanceladas', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmPorta', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('CEmSuprimirLimiteCredito', adInteger, adParamInput, 0, Null));
  //Chaves
  Command.Parameters.Append(Command.CreateParameter('PrimaryKeyID', adInteger, adParamInput, 0, Null));
end;

function TARNFParametroConfiguracaoEmailUpdate.GetCommandSQL: string;
begin
  Result :=
    'update nfparametroconfiguracaoemail set'#13#10 +
    '  cemsmtp = ?, cemautenticacao = ?,'#13#10 +
    '  cemusuario = ?, cemsenha = ?, cememailfactoring = ?,'#13#10 +
    '  cememailmonitoramento = ?, cememailteste = ?, cemtextocorpoemail = ?,'#13#10 +
    '  cemenviodiarioagenteposced = ?, cemenviodiarioconsultatituloscedente = ?, cemqtddiastitulosvencer = ?,'#13#10 +
    '  cemenviodiarioagenteemailcopia = ?, cemapresentalogoempresa = ?, cemfontecorpoemail = ?,'#13#10 +
    '  cemfontetamcorpoemail = ?, cemtextoinicialope = ?, cemtextoaposdadosope = ?,'#13#10 +
    '  cemtituloemail = ?, cemenviototalpendenciaaberto = ?, cemenviodocumentopendenteoperacao = ?,'#13#10 +
    '  cemenviosolicitacaoinstrucaocancelada = ?, cemnrodiasinstcanceladas = ?, cemporta = ?,'#13#10 +
    '  cemsuprimirlimitecredito = ?'#13#10 +
    'where'#13#10 +
    '  id = ?';
end;

procedure TARNFParametroConfiguracaoEmailUpdate.Persist(AARNFParametroConfiguracaoEmail: TARNFParametroConfiguracaoEmail);
begin
  inherited Persist(AARNFParametroConfiguracaoEmail);
  Command.Parameters[0].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmSMTP);
  Command.Parameters[1].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmAutenticacao);
  Command.Parameters[2].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmUsuario);
  Command.Parameters[3].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmSenha);
  Command.Parameters[4].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmEmailFactoring);
  Command.Parameters[5].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmEmailMonitoramento);
  Command.Parameters[6].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmEmailTeste);
  Command.Parameters[7].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmTextoCorpoEmail);
  Command.Parameters[8].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmEnvioDiarioAgentePosCed);
  Command.Parameters[9].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmEnvioDiarioConsultaTitulosCedente);
  Command.Parameters[10].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmQtdDiasTitulosVencer);
  Command.Parameters[11].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmEnvioDiarioAgenteEmailCopia);
  Command.Parameters[12].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmApresentaLogoEmpresa);
  Command.Parameters[13].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmFonteCorpoEmail);
  Command.Parameters[14].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmFonteTamCorpoEmail);
  Command.Parameters[15].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmTextoInicialOpe);
  Command.Parameters[16].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmTextoAposDadosOpe);
  Command.Parameters[17].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmTituloEmail);
  Command.Parameters[18].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmEnvioTotalPendenciaAberto);
  Command.Parameters[19].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmEnvioDocumentoPendenteOperacao);
  Command.Parameters[20].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmEnvioSolicitacaoInstrucaoCancelada);
  Command.Parameters[21].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmNroDiasInstCanceladas);
  Command.Parameters[22].Value := TActiveRecord.ToVariant(AARNFParametroConfiguracaoEmail.FCEmPorta);
  Command.Parameters[23].Value := TActiveRecord.ToVariantB01(AARNFParametroConfiguracaoEmail.FCEmSuprimirLimiteCredito);
  //Chaves
  Command.Parameters[24].Value := AARNFParametroConfiguracaoEmail.FPrimaryKeyID;
  if Execute <> 1 then
    raise EActiveRecord.Create('Update Failed TARNFParametroConfiguracaoEmailUpdate');
end;

{ TARNFParametroConfiguracaoEmailMetadataObject }

function TARNFParametroConfiguracaoEmailMetadataObject.FieldCount: Integer;
begin
  Result := Length(ARNFParametroConfiguracaoEmailMetadata.Fields);
end;

function TARNFParametroConfiguracaoEmailMetadataObject.FieldMetadata(Index: Integer): TFieldMetadata;
begin
  Result := ARNFParametroConfiguracaoEmailMetadata.Fields[Index];
end;

function TARNFParametroConfiguracaoEmailMetadataObject.FieldMetadataByName(const AName: string): TFieldMetadata;
begin
  Result := FieldMetadata(IndexOfName(AName));
end;

function TARNFParametroConfiguracaoEmailMetadataObject.IndexOfName(const AName: string): Integer;
var
  laco: Integer;
begin
  Result := -1;
  for laco := 0 to High(ARNFParametroConfiguracaoEmailMetadata.Fields) do
    if SameText(ARNFParametroConfiguracaoEmailMetadata.Fields[laco].Name, AName) then
    begin
      Result := laco;
      Break;
    end;
end;

function TARNFParametroConfiguracaoEmailMetadataObject.RelationshipCount: Integer;
begin
  Result := 0;
end;

function TARNFParametroConfiguracaoEmailMetadataObject.RelationshipMetadata(Index: Integer): TRelationshipMetadata;
begin
  FillChar(Result, SizeOf(TRelationshipMetadata), #0);
end;

function TARNFParametroConfiguracaoEmailMetadataObject.TableMetadata: TTableMetadata;
begin
  Result := ARNFParametroConfiguracaoEmailMetadata.Table;
end;

initialization

  GARNFParametroConfiguracaoEmailDeleteCriticalSection := TCriticalSection.Create;
  GARNFParametroConfiguracaoEmailInsertCriticalSection := TCriticalSection.Create;
  GARNFParametroConfiguracaoEmailUpdateCriticalSection := TCriticalSection.Create;

  GQueryFactoryAll := TARNFParametroConfiguracaoEmail.From
    .Top(1)
    .OrderBy('ID');

finalization

  GQueryFactoryAll := nil;
  FreeAndNil(GARNFParametroConfiguracaoEmailDeleteCriticalSection);
  FreeAndNil(GARNFParametroConfiguracaoEmailInsertCriticalSection);
  FreeAndNil(GARNFParametroConfiguracaoEmailUpdateCriticalSection);

end.