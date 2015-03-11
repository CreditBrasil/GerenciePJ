{
  ***************************************************
  * Este código é gerado automaticamente, não edite *
  ***************************************************

  Template: ActiveRecord.pas_template
  Descrição: Cria classes e interfaces para acessar a tabela NFConsultaSerasa
}
unit uARNFConsultaSerasa;

interface

uses
  SysUtils, db, ADOInt, Graphics, ServiceLocator, SyncObjs, Variants, 
  uActiveRecord;

type
  //Tabela: NFConsultaSerasa - Registro de consultas feitas no Serasa
  IARNFConsultaSerasa = interface(IActiveRecord)
    ['{80E62973-CB9F-4E4A-AE0D-8DDA2B5365B0}']
    function GetID: Integer;
    function GetSConsCnpjCpf: TNullableString;
    function GetSConsData: TNullableDateTime;
    function GetSConsHora: TNullableString;
    function GetSConsRazao: TNullableString;
    function GetSConsEmpTipo: TNullableString;
    function GetSConsPesTipo: TNullableString;
    function GetUsuLogin: TNullableString;
    function GetSConsCodigo: TNullableInteger;
    function GetSCaminhoArquivo: TNullableString;
    function GetRetLinhaSerasa: TNullableString;
    function GetEmpCodigo: TNullableInteger;
    function GetUserConsulta: TNullableString;
    function GetParNaoMostrarDadosFactoringComplemento: TNullableBoolean;
    function GetSConsAcaoGerencie: TNullableBoolean;
    function GetSConsPrazoGerencie: TNullableInteger;
    function GetGru_ID: TNullableInteger;
    function GetPer_ID: TNullableInteger;
    function GetSConsRetornoMonitore: TNullableBoolean;
    function GetSConsRetornoMonitorePF: TNullableBoolean;
    function GetGerouPendencia: TNullableBoolean;
    function GetSConsPrecisouAutorizacao: TNullableBoolean;
    function GetSConsUsuLoginAutorizou: TNullableString;
    procedure SetSConsCnpjCpf(const Value: TNullableString);
    procedure SetSConsData(const Value: TNullableDateTime);
    procedure SetSConsHora(const Value: TNullableString);
    procedure SetSConsRazao(const Value: TNullableString);
    procedure SetSConsEmpTipo(const Value: TNullableString);
    procedure SetSConsPesTipo(const Value: TNullableString);
    procedure SetUsuLogin(const Value: TNullableString);
    //procedure SetSConsCodigo(const Value: TNullableInteger);
    procedure SetSCaminhoArquivo(const Value: TNullableString);
    procedure SetRetLinhaSerasa(const Value: TNullableString);
    procedure SetEmpCodigo(const Value: TNullableInteger);
    procedure SetUserConsulta(const Value: TNullableString);
    procedure SetParNaoMostrarDadosFactoringComplemento(const Value: TNullableBoolean);
    procedure SetSConsAcaoGerencie(const Value: TNullableBoolean);
    procedure SetSConsPrazoGerencie(const Value: TNullableInteger);
    procedure SetGru_ID(const Value: TNullableInteger);
    procedure SetPer_ID(const Value: TNullableInteger);
    procedure SetSConsRetornoMonitore(const Value: TNullableBoolean);
    procedure SetSConsRetornoMonitorePF(const Value: TNullableBoolean);
    procedure SetGerouPendencia(const Value: TNullableBoolean);
    procedure SetSConsPrecisouAutorizacao(const Value: TNullableBoolean);
    procedure SetSConsUsuLoginAutorizou(const Value: TNullableString);
    //--- Campos ---
    //ID int - ???
    property ID: Integer read GetID;
    //SConsCnpjCpf varchar (50) - ???
    property SConsCnpjCpf: TNullableString read GetSConsCnpjCpf write SetSConsCnpjCpf;
    //SConsData datetime - ???
    property SConsData: TNullableDateTime read GetSConsData write SetSConsData;
    //SConsHora varchar (50) - ???
    property SConsHora: TNullableString read GetSConsHora write SetSConsHora;
    //SConsRazao varchar (50) - ???
    property SConsRazao: TNullableString read GetSConsRazao write SetSConsRazao;
    //SConsEmpTipo varchar (50) - ???
    property SConsEmpTipo: TNullableString read GetSConsEmpTipo write SetSConsEmpTipo;
    //SConsPesTipo varchar (50) - ???
    property SConsPesTipo: TNullableString read GetSConsPesTipo write SetSConsPesTipo;
    //UsuLogin varchar (50) - ???
    property UsuLogin: TNullableString read GetUsuLogin write SetUsuLogin;
    //SConsCodigo int - ???
    property SConsCodigo: TNullableInteger read GetSConsCodigo;
    //SCaminhoArquivo varchar (100) - ???
    property SCaminhoArquivo: TNullableString read GetSCaminhoArquivo write SetSCaminhoArquivo;
    //RetLinhaSerasa text - ???
    property RetLinhaSerasa: TNullableString read GetRetLinhaSerasa write SetRetLinhaSerasa;
    //EmpCodigo int - ???
    property EmpCodigo: TNullableInteger read GetEmpCodigo write SetEmpCodigo;
    //UserConsulta varchar (25) - ???
    property UserConsulta: TNullableString read GetUserConsulta write SetUserConsulta;
    //ParNaoMostrarDadosFactoringComplemento bit - ???
    property ParNaoMostrarDadosFactoringComplemento: TNullableBoolean read GetParNaoMostrarDadosFactoringComplemento write SetParNaoMostrarDadosFactoringComplemento;
    //SConsAcaoGerencie varchar (1) - ???
    property SConsAcaoGerencie: TNullableBoolean read GetSConsAcaoGerencie write SetSConsAcaoGerencie;
    //SConsPrazoGerencie int - ???
    property SConsPrazoGerencie: TNullableInteger read GetSConsPrazoGerencie write SetSConsPrazoGerencie;
    //Gru_ID int - ???
    property Gru_ID: TNullableInteger read GetGru_ID write SetGru_ID;
    //Per_ID int - ???
    property Per_ID: TNullableInteger read GetPer_ID write SetPer_ID;
    //SConsRetornoMonitore bit - ???
    property SConsRetornoMonitore: TNullableBoolean read GetSConsRetornoMonitore write SetSConsRetornoMonitore;
    //SConsRetornoMonitorePF bit - ???
    property SConsRetornoMonitorePF: TNullableBoolean read GetSConsRetornoMonitorePF write SetSConsRetornoMonitorePF;
    //GerouPendencia bit - ???
    property GerouPendencia: TNullableBoolean read GetGerouPendencia write SetGerouPendencia;
    //SConsPrecisouAutorizacao bit - ???
    property SConsPrecisouAutorizacao: TNullableBoolean read GetSConsPrecisouAutorizacao write SetSConsPrecisouAutorizacao;
    //SConsUsuLoginAutorizou varchar (100) - ???
    property SConsUsuLoginAutorizou: TNullableString read GetSConsUsuLoginAutorizou write SetSConsUsuLoginAutorizou;
  end;

  IIteratorARNFConsultaSerasa = interface(IIteratorActiveRecord)
    function CurrentItem: IARNFConsultaSerasa;
  end;

  ICollectionARNFConsultaSerasa = interface(ICollectionActiveRecord)
    function GetItem(Index: Integer): IARNFConsultaSerasa;

    function Add(const Item: IARNFConsultaSerasa): Integer;
    function First: IARNFConsultaSerasa;
    procedure Insert(Index: Integer; const Item: IARNFConsultaSerasa);
    function Last: IARNFConsultaSerasa;
    function New(const AConnection: IActiveRecordConnection): IARNFConsultaSerasa;
    property Item[Index: Integer]: IARNFConsultaSerasa read GetItem; default;
  end;

  TCollectionARNFConsultaSerasa = class(TCollectionActiveRecord, ICollectionARNFConsultaSerasa)
  protected
    { ICollectionARNFConsultaSerasa }
    function GetItem(Index: Integer): IARNFConsultaSerasa;

    function Add(const Item: IARNFConsultaSerasa): Integer;
    function First: IARNFConsultaSerasa;
    procedure Insert(Index: Integer; const Item: IARNFConsultaSerasa);
    function Last: IARNFConsultaSerasa;
    function New(const AConnection: IActiveRecordConnection): IARNFConsultaSerasa;
  end;

  TIteratorARNFConsultaSerasaDecorator = class(TIteratorCollectionActiveRecordDecorator, IIteratorARNFConsultaSerasa)
  protected
    { IIteratorARNFConsultaSerasa }
    function CurrentItem: IARNFConsultaSerasa;
  public
    class function Decore(const ACollectionARNFConsultaSerasa: ICollectionARNFConsultaSerasa): IIteratorARNFConsultaSerasa;
  end;

  TIteratorARNFConsultaSerasaQueryDecorator = class(TIteratorActiveRecordQueryDecorator, IIteratorARNFConsultaSerasa)
  protected
    { IIteratorARNFConsultaSerasa }
    function CurrentItem: IARNFConsultaSerasa;
  public
    class function Decore(const AARNFConsultaSerasaQuery: IActiveRecordQuery): IIteratorARNFConsultaSerasa;
  end;

  TARNFConsultaSerasa = class(TActiveRecord, IARNFConsultaSerasa)
  private
    FPrimaryKeyID: Integer;
    FID: Integer;
    FSConsCnpjCpf: TNullableString;
    FSConsData: TNullableDateTime;
    FSConsHora: TNullableString;
    FSConsRazao: TNullableString;
    FSConsEmpTipo: TNullableString;
    FSConsPesTipo: TNullableString;
    FUsuLogin: TNullableString;
    FSConsCodigo: TNullableInteger;
    FSCaminhoArquivo: TNullableString;
    FRetLinhaSerasa: TNullableString;
    FEmpCodigo: TNullableInteger;
    FUserConsulta: TNullableString;
    FParNaoMostrarDadosFactoringComplemento: TNullableBoolean;
    FSConsAcaoGerencie: TNullableBoolean;
    FSConsPrazoGerencie: TNullableInteger;
    FGru_ID: TNullableInteger;
    FPer_ID: TNullableInteger;
    FSConsRetornoMonitore: TNullableBoolean;
    FSConsRetornoMonitorePF: TNullableBoolean;
    FGerouPendencia: TNullableBoolean;
    FSConsPrecisouAutorizacao: TNullableBoolean;
    FSConsUsuLoginAutorizou: TNullableString;
  protected
    { IActiveRecordAccess }
    procedure Clear(Index: Integer); override;
    function DisplayText(Index: Integer): string; override;
    function GetAsString(Index: Integer): string; override;
    function GetValue(Index: Integer): Variant; override;
    function IsNull(Index: Integer): Boolean; override;
    procedure SetAsString(Index: Integer; const Value: string); override;
    procedure SetValue(Index: Integer; const Value: Variant); override;
    { IARNFConsultaSerasa }
    function GetID: Integer;
    function GetSConsCnpjCpf: TNullableString;
    function GetSConsData: TNullableDateTime;
    function GetSConsHora: TNullableString;
    function GetSConsRazao: TNullableString;
    function GetSConsEmpTipo: TNullableString;
    function GetSConsPesTipo: TNullableString;
    function GetUsuLogin: TNullableString;
    function GetSConsCodigo: TNullableInteger;
    function GetSCaminhoArquivo: TNullableString;
    function GetRetLinhaSerasa: TNullableString;
    function GetEmpCodigo: TNullableInteger;
    function GetUserConsulta: TNullableString;
    function GetParNaoMostrarDadosFactoringComplemento: TNullableBoolean;
    function GetSConsAcaoGerencie: TNullableBoolean;
    function GetSConsPrazoGerencie: TNullableInteger;
    function GetGru_ID: TNullableInteger;
    function GetPer_ID: TNullableInteger;
    function GetSConsRetornoMonitore: TNullableBoolean;
    function GetSConsRetornoMonitorePF: TNullableBoolean;
    function GetGerouPendencia: TNullableBoolean;
    function GetSConsPrecisouAutorizacao: TNullableBoolean;
    function GetSConsUsuLoginAutorizou: TNullableString;
    procedure SetSConsCnpjCpf(const Value: TNullableString);
    procedure SetSConsData(const Value: TNullableDateTime);
    procedure SetSConsHora(const Value: TNullableString);
    procedure SetSConsRazao(const Value: TNullableString);
    procedure SetSConsEmpTipo(const Value: TNullableString);
    procedure SetSConsPesTipo(const Value: TNullableString);
    procedure SetUsuLogin(const Value: TNullableString);
    procedure SetSConsCodigo(const Value: TNullableInteger);
    procedure SetSCaminhoArquivo(const Value: TNullableString);
    procedure SetRetLinhaSerasa(const Value: TNullableString);
    procedure SetEmpCodigo(const Value: TNullableInteger);
    procedure SetUserConsulta(const Value: TNullableString);
    procedure SetParNaoMostrarDadosFactoringComplemento(const Value: TNullableBoolean);
    procedure SetSConsAcaoGerencie(const Value: TNullableBoolean);
    procedure SetSConsPrazoGerencie(const Value: TNullableInteger);
    procedure SetGru_ID(const Value: TNullableInteger);
    procedure SetPer_ID(const Value: TNullableInteger);
    procedure SetSConsRetornoMonitore(const Value: TNullableBoolean);
    procedure SetSConsRetornoMonitorePF(const Value: TNullableBoolean);
    procedure SetGerouPendencia(const Value: TNullableBoolean);
    procedure SetSConsPrecisouAutorizacao(const Value: TNullableBoolean);
    procedure SetSConsUsuLoginAutorizou(const Value: TNullableString);
    procedure CopyFrom(AActiveRecord: TActiveRecord); overload; override;
    function CreateItemRelationship(Index: Integer): TActiveRecord; override;
    procedure Persist; override;
    procedure PersistSQL;
    procedure SetRecordSet(const ARecordSet: _RecordSet; AOffset: Integer); override;
  public
    constructor Create(const AConnection: IActiveRecordConnection); override;
    class function QueryByID(const AID: Integer; const AConnection: IActiveRecordConnection): IActiveRecordQuery;
    class function FindByID(const AID: Integer; const AConnection: IActiveRecordConnection): IARNFConsultaSerasa;
    class function SummaryMaiorSConsCodigo(const AConnection: IActiveRecordConnection): TNullableInteger;
    class function GUIDItem: TGUID; override;
    class function Metadata: IActiveRecordMetadata; override;
    class function ViewMetadata: IActiveRecordMetadata; override;
  end;

  TARNFConsultaSerasaMetadata = record
    Table: TTableMetadata;
    Fields: array [0..22] of TFieldMetadata;
  end;

const
  Campo_NFConsultaSerasa_ID = 0;
  Campo_NFConsultaSerasa_SConsCnpjCpf = 1;
  Campo_NFConsultaSerasa_SConsData = 2;
  Campo_NFConsultaSerasa_SConsHora = 3;
  Campo_NFConsultaSerasa_SConsRazao = 4;
  Campo_NFConsultaSerasa_SConsEmpTipo = 5;
  Campo_NFConsultaSerasa_SConsPesTipo = 6;
  Campo_NFConsultaSerasa_UsuLogin = 7;
  Campo_NFConsultaSerasa_SConsCodigo = 8;
  Campo_NFConsultaSerasa_SCaminhoArquivo = 9;
  Campo_NFConsultaSerasa_RetLinhaSerasa = 10;
  Campo_NFConsultaSerasa_EmpCodigo = 11;
  Campo_NFConsultaSerasa_UserConsulta = 12;
  Campo_NFConsultaSerasa_ParNaoMostrarDadosFactoringComplemento = 13;
  Campo_NFConsultaSerasa_SConsAcaoGerencie = 14;
  Campo_NFConsultaSerasa_SConsPrazoGerencie = 15;
  Campo_NFConsultaSerasa_Gru_ID = 16;
  Campo_NFConsultaSerasa_Per_ID = 17;
  Campo_NFConsultaSerasa_SConsRetornoMonitore = 18;
  Campo_NFConsultaSerasa_SConsRetornoMonitorePF = 19;
  Campo_NFConsultaSerasa_GerouPendencia = 20;
  Campo_NFConsultaSerasa_SConsPrecisouAutorizacao = 21;
  Campo_NFConsultaSerasa_SConsUsuLoginAutorizou = 22;
  NFConsultaSerasa_ReferenciaParaNovosCampos = Campo_NFConsultaSerasa_SConsUsuLoginAutorizou + 1;
  ARNFConsultaSerasaMetadata: TARNFConsultaSerasaMetadata = (
    Table: (Name: 'NFConsultaSerasa'; PrimaryKeyFields: 'ID'; DeletedField: '');
    Fields: (
      (Index: Campo_NFConsultaSerasa_ID; Name: 'ID'; FieldType: arftInteger; Length: 0; Nullable: False;
        Caption: 'ID'; Visible: True; ReadOnly: True; Commented: False; 
        Title: 'ID'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFConsultaSerasa_SConsCnpjCpf; Name: 'SConsCnpjCpf'; FieldType: arftVarchar; Length: 50; Nullable: True;
        Caption: 'SConsCnpjCpf'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'SConsCnpjCpf'; ColumnCharWidth: 50),
      (Index: Campo_NFConsultaSerasa_SConsData; Name: 'SConsData'; FieldType: arftDateTime; Length: 0; Nullable: True;
        Caption: 'SConsData'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'SConsData'; ColumnCharWidth: ColumnCharWidthForDateTime),
      (Index: Campo_NFConsultaSerasa_SConsHora; Name: 'SConsHora'; FieldType: arftVarchar; Length: 50; Nullable: True;
        Caption: 'SConsHora'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'SConsHora'; ColumnCharWidth: 50),
      (Index: Campo_NFConsultaSerasa_SConsRazao; Name: 'SConsRazao'; FieldType: arftVarchar; Length: 50; Nullable: True;
        Caption: 'SConsRazao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'SConsRazao'; ColumnCharWidth: 50),
      (Index: Campo_NFConsultaSerasa_SConsEmpTipo; Name: 'SConsEmpTipo'; FieldType: arftVarchar; Length: 50; Nullable: True;
        Caption: 'SConsEmpTipo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'SConsEmpTipo'; ColumnCharWidth: 50),
      (Index: Campo_NFConsultaSerasa_SConsPesTipo; Name: 'SConsPesTipo'; FieldType: arftVarchar; Length: 50; Nullable: True;
        Caption: 'SConsPesTipo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'SConsPesTipo'; ColumnCharWidth: 50),
      (Index: Campo_NFConsultaSerasa_UsuLogin; Name: 'UsuLogin'; FieldType: arftVarchar; Length: 50; Nullable: True;
        Caption: 'UsuLogin'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UsuLogin'; ColumnCharWidth: 50),
      (Index: Campo_NFConsultaSerasa_SConsCodigo; Name: 'SConsCodigo'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'SConsCodigo'; Visible: True; ReadOnly: True; Commented: False; 
        Title: 'SConsCodigo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFConsultaSerasa_SCaminhoArquivo; Name: 'SCaminhoArquivo'; FieldType: arftVarchar; Length: 100; Nullable: True;
        Caption: 'SCaminhoArquivo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'SCaminhoArquivo'; ColumnCharWidth: 100),
      (Index: Campo_NFConsultaSerasa_RetLinhaSerasa; Name: 'RetLinhaSerasa'; FieldType: arftMemo; Length: 0; Nullable: True;
        Caption: 'RetLinhaSerasa'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'RetLinhaSerasa'; ColumnCharWidth: ColumnCharWidthForMemo),
      (Index: Campo_NFConsultaSerasa_EmpCodigo; Name: 'EmpCodigo'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'EmpCodigo'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'EmpCodigo'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFConsultaSerasa_UserConsulta; Name: 'UserConsulta'; FieldType: arftVarchar; Length: 25; Nullable: True;
        Caption: 'UserConsulta'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'UserConsulta'; ColumnCharWidth: 25),
      (Index: Campo_NFConsultaSerasa_ParNaoMostrarDadosFactoringComplemento; Name: 'ParNaoMostrarDadosFactoringComplemento'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'ParNaoMostrarDadosFactoringComplemento'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'ParNaoMostrarDadosFactoringComplemento'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFConsultaSerasa_SConsAcaoGerencie; Name: 'SConsAcaoGerencie'; FieldType: arftNS; Length: 1; Nullable: True;
        Caption: 'SConsAcaoGerencie'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'SConsAcaoGerencie'; ColumnCharWidth: ColumnCharWidthForNS),
      (Index: Campo_NFConsultaSerasa_SConsPrazoGerencie; Name: 'SConsPrazoGerencie'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'SConsPrazoGerencie'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'SConsPrazoGerencie'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFConsultaSerasa_Gru_ID; Name: 'Gru_ID'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'Gru_ID'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'Gru_ID'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFConsultaSerasa_Per_ID; Name: 'Per_ID'; FieldType: arftInteger; Length: 0; Nullable: True;
        Caption: 'Per_ID'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'Per_ID'; ColumnCharWidth: ColumnCharWidthForInteger),
      (Index: Campo_NFConsultaSerasa_SConsRetornoMonitore; Name: 'SConsRetornoMonitore'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'SConsRetornoMonitore'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'SConsRetornoMonitore'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFConsultaSerasa_SConsRetornoMonitorePF; Name: 'SConsRetornoMonitorePF'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'SConsRetornoMonitorePF'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'SConsRetornoMonitorePF'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFConsultaSerasa_GerouPendencia; Name: 'GerouPendencia'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'GerouPendencia'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'GerouPendencia'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFConsultaSerasa_SConsPrecisouAutorizacao; Name: 'SConsPrecisouAutorizacao'; FieldType: arftB01; Length: 0; Nullable: True;
        Caption: 'SConsPrecisouAutorizacao'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'SConsPrecisouAutorizacao'; ColumnCharWidth: ColumnCharWidthForB01),
      (Index: Campo_NFConsultaSerasa_SConsUsuLoginAutorizou; Name: 'SConsUsuLoginAutorizou'; FieldType: arftVarchar; Length: 100; Nullable: True;
        Caption: 'SConsUsuLoginAutorizou'; Visible: True; ReadOnly: False; Commented: False; 
        Title: 'SConsUsuLoginAutorizou'; ColumnCharWidth: 100)
    ));

implementation

type
  TARNFConsultaSerasaSummaryMaiorSConsCodigo = class(TActiveRecordSingletonADO)
  protected
    procedure DefineParameters; override;
    function GetCommandSQL: string; override;
  public
    function SummaryMaiorSConsCodigo(const AConnection: IActiveRecordConnection): TNullableInteger;
  end;

  TARNFConsultaSerasaDelete = class(TActiveRecordSingletonADO)
  protected
    procedure DefineParameters; override;
    function GetCommandSQL: string; override;
  public
    procedure Persist(AARNFConsultaSerasa: TARNFConsultaSerasa);
  end;

  TARNFConsultaSerasaInsert = class(TActiveRecordSingletonADO)
  protected
    procedure DefineParameters; override;
    function GetCommandSQL: string; override;
  public
    procedure Persist(AARNFConsultaSerasa: TARNFConsultaSerasa);
  end;

  TARNFConsultaSerasaUpdate = class(TActiveRecordSingletonADO)
  protected
    procedure DefineParameters; override;
    function GetCommandSQL: string; override;
  public
    procedure Persist(AARNFConsultaSerasa: TARNFConsultaSerasa);
  end;

  TARNFConsultaSerasaMetadataObject = class(TInterfacedObject, IActiveRecordMetadata)
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
  GARNFConsultaSerasaDeleteCriticalSection: TCriticalSection;
  GARNFConsultaSerasaInsertCriticalSection: TCriticalSection;
  GARNFConsultaSerasaUpdateCriticalSection: TCriticalSection;

{ TCollectionARNFConsultaSerasa }

function TCollectionARNFConsultaSerasa.Add(const Item: IARNFConsultaSerasa): Integer;
begin
  Result := AddActiveRecord(Item);
end;

function TCollectionARNFConsultaSerasa.First: IARNFConsultaSerasa;
begin
  Result := nil;
  if Count > 0 then
    Result := GetItem(0);
end;

function TCollectionARNFConsultaSerasa.GetItem(Index: Integer): IARNFConsultaSerasa;
begin
  Result := List[Index] as IARNFConsultaSerasa;
end;

procedure TCollectionARNFConsultaSerasa.Insert(Index: Integer; const Item: IARNFConsultaSerasa);
begin
  List.Insert(Index, Item);
end;

function TCollectionARNFConsultaSerasa.Last: IARNFConsultaSerasa;
begin
  Result := nil;
  if Count > 0 then
    Result := GetItem(Count - 1);
end;

function TCollectionARNFConsultaSerasa.New(const AConnection: IActiveRecordConnection): IARNFConsultaSerasa;
begin
  Result := ClassActiveRecord.Create(AConnection) as IARNFConsultaSerasa;
  Add(Result);
end;

{ TIteratorARNFConsultaSerasaDecorator }

function TIteratorARNFConsultaSerasaDecorator.CurrentItem: IARNFConsultaSerasa;
begin
  Result := CurrentItemActiveRecord as IARNFConsultaSerasa;
end;

class function TIteratorARNFConsultaSerasaDecorator.Decore(const ACollectionARNFConsultaSerasa: ICollectionARNFConsultaSerasa): IIteratorARNFConsultaSerasa;
begin
  Result := Create(ACollectionARNFConsultaSerasa);
end;

{ TIteratorARNFConsultaSerasaQueryDecorator }

function TIteratorARNFConsultaSerasaQueryDecorator.CurrentItem: IARNFConsultaSerasa;
begin
  Result := CurrentItemActiveRecord as IARNFConsultaSerasa;
end;

class function TIteratorARNFConsultaSerasaQueryDecorator.Decore(const AARNFConsultaSerasaQuery: IActiveRecordQuery): IIteratorARNFConsultaSerasa;
begin
  Result := Create(AARNFConsultaSerasaQuery);
end;

{ TARNFConsultaSerasa }

procedure TARNFConsultaSerasa.Clear(Index: Integer);
begin
  case Index of
    Campo_NFConsultaSerasa_SConsCnpjCpf: SetSConsCnpjCpf(NullString);
    Campo_NFConsultaSerasa_SConsData: SetSConsData(NullDateTime);
    Campo_NFConsultaSerasa_SConsHora: SetSConsHora(NullString);
    Campo_NFConsultaSerasa_SConsRazao: SetSConsRazao(NullString);
    Campo_NFConsultaSerasa_SConsEmpTipo: SetSConsEmpTipo(NullString);
    Campo_NFConsultaSerasa_SConsPesTipo: SetSConsPesTipo(NullString);
    Campo_NFConsultaSerasa_UsuLogin: SetUsuLogin(NullString);
    Campo_NFConsultaSerasa_SCaminhoArquivo: SetSCaminhoArquivo(NullString);
    Campo_NFConsultaSerasa_RetLinhaSerasa: SetRetLinhaSerasa(NullString);
    Campo_NFConsultaSerasa_EmpCodigo: SetEmpCodigo(NullInteger);
    Campo_NFConsultaSerasa_UserConsulta: SetUserConsulta(NullString);
    Campo_NFConsultaSerasa_ParNaoMostrarDadosFactoringComplemento: SetParNaoMostrarDadosFactoringComplemento(NullBoolean);
    Campo_NFConsultaSerasa_SConsAcaoGerencie: SetSConsAcaoGerencie(NullBoolean);
    Campo_NFConsultaSerasa_SConsPrazoGerencie: SetSConsPrazoGerencie(NullInteger);
    Campo_NFConsultaSerasa_Gru_ID: SetGru_ID(NullInteger);
    Campo_NFConsultaSerasa_Per_ID: SetPer_ID(NullInteger);
    Campo_NFConsultaSerasa_SConsRetornoMonitore: SetSConsRetornoMonitore(NullBoolean);
    Campo_NFConsultaSerasa_SConsRetornoMonitorePF: SetSConsRetornoMonitorePF(NullBoolean);
    Campo_NFConsultaSerasa_GerouPendencia: SetGerouPendencia(NullBoolean);
    Campo_NFConsultaSerasa_SConsPrecisouAutorizacao: SetSConsPrecisouAutorizacao(NullBoolean);
    Campo_NFConsultaSerasa_SConsUsuLoginAutorizou: SetSConsUsuLoginAutorizou(NullString);
  else
    inherited;
  end;
end;

procedure TARNFConsultaSerasa.CopyFrom(AActiveRecord: TActiveRecord);
var
  LARNFConsultaSerasa: TARNFConsultaSerasa;
begin
  inherited;
  LARNFConsultaSerasa := AActiveRecord as TARNFConsultaSerasa;
  FID := LARNFConsultaSerasa.FID;
  FSConsCnpjCpf := LARNFConsultaSerasa.FSConsCnpjCpf;
  FSConsData := LARNFConsultaSerasa.FSConsData;
  FSConsHora := LARNFConsultaSerasa.FSConsHora;
  FSConsRazao := LARNFConsultaSerasa.FSConsRazao;
  FSConsEmpTipo := LARNFConsultaSerasa.FSConsEmpTipo;
  FSConsPesTipo := LARNFConsultaSerasa.FSConsPesTipo;
  FUsuLogin := LARNFConsultaSerasa.FUsuLogin;
  FSConsCodigo := LARNFConsultaSerasa.FSConsCodigo;
  FSCaminhoArquivo := LARNFConsultaSerasa.FSCaminhoArquivo;
  FRetLinhaSerasa := LARNFConsultaSerasa.FRetLinhaSerasa;
  FEmpCodigo := LARNFConsultaSerasa.FEmpCodigo;
  FUserConsulta := LARNFConsultaSerasa.FUserConsulta;
  FParNaoMostrarDadosFactoringComplemento := LARNFConsultaSerasa.FParNaoMostrarDadosFactoringComplemento;
  FSConsAcaoGerencie := LARNFConsultaSerasa.FSConsAcaoGerencie;
  FSConsPrazoGerencie := LARNFConsultaSerasa.FSConsPrazoGerencie;
  FGru_ID := LARNFConsultaSerasa.FGru_ID;
  FPer_ID := LARNFConsultaSerasa.FPer_ID;
  FSConsRetornoMonitore := LARNFConsultaSerasa.FSConsRetornoMonitore;
  FSConsRetornoMonitorePF := LARNFConsultaSerasa.FSConsRetornoMonitorePF;
  FGerouPendencia := LARNFConsultaSerasa.FGerouPendencia;
  FSConsPrecisouAutorizacao := LARNFConsultaSerasa.FSConsPrecisouAutorizacao;
  FSConsUsuLoginAutorizou := LARNFConsultaSerasa.FSConsUsuLoginAutorizou;
end;

constructor TARNFConsultaSerasa.Create(const AConnection: IActiveRecordConnection);
begin
  inherited;
  FSConsCnpjCpf := NullString;
  FSConsData := NullDateTime;
  FSConsHora := NullString;
  FSConsRazao := NullString;
  FSConsEmpTipo := NullString;
  FSConsPesTipo := NullString;
  FUsuLogin := NullString;
  FSConsCodigo := NullInteger;
  FSCaminhoArquivo := NullString;
  FRetLinhaSerasa := NullString;
  FEmpCodigo := NullInteger;
  FUserConsulta := NullString;
  FParNaoMostrarDadosFactoringComplemento := NullBoolean;
  FSConsAcaoGerencie := NullBoolean;
  FSConsPrazoGerencie := NullInteger;
  FGru_ID := NullInteger;
  FPer_ID := NullInteger;
  FSConsRetornoMonitore := NullBoolean;
  FSConsRetornoMonitorePF := NullBoolean;
  FGerouPendencia := NullBoolean;
  FSConsPrecisouAutorizacao := NullBoolean;
  FSConsUsuLoginAutorizou := NullString;
end;

function TARNFConsultaSerasa.CreateItemRelationship(Index: Integer): TActiveRecord;
begin
  Result := nil;
end;

function TARNFConsultaSerasa.DisplayText(Index: Integer): string;
begin
  case Index of
    Campo_NFConsultaSerasa_ParNaoMostrarDadosFactoringComplemento: Result := NullOrString(GetParNaoMostrarDadosFactoringComplemento.Null, NaoSim[GetParNaoMostrarDadosFactoringComplemento.Value]);
    Campo_NFConsultaSerasa_SConsAcaoGerencie: Result := NullOrString(GetSConsAcaoGerencie.Null, NaoSim[GetSConsAcaoGerencie.Value]);
    Campo_NFConsultaSerasa_SConsRetornoMonitore: Result := NullOrString(GetSConsRetornoMonitore.Null, NaoSim[GetSConsRetornoMonitore.Value]);
    Campo_NFConsultaSerasa_SConsRetornoMonitorePF: Result := NullOrString(GetSConsRetornoMonitorePF.Null, NaoSim[GetSConsRetornoMonitorePF.Value]);
    Campo_NFConsultaSerasa_GerouPendencia: Result := NullOrString(GetGerouPendencia.Null, NaoSim[GetGerouPendencia.Value]);
    Campo_NFConsultaSerasa_SConsPrecisouAutorizacao: Result := NullOrString(GetSConsPrecisouAutorizacao.Null, NaoSim[GetSConsPrecisouAutorizacao.Value]);
  else
    Result := inherited DisplayText(Index);
  end;
end;

class function TARNFConsultaSerasa.QueryByID(const AID: Integer; const AConnection: IActiveRecordConnection): IActiveRecordQuery;
begin
  Result := GQueryFactoryByID.CreateQuery(AConnection, Self);
  Result.SetNextParameter(AID);
end;

class function TARNFConsultaSerasa.FindByID(const AID: Integer; const AConnection: IActiveRecordConnection): IARNFConsultaSerasa;
begin
  Result := QueryByID(AID, AConnection).FirstActiveRecord as IARNFConsultaSerasa;
end;

class function TARNFConsultaSerasa.SummaryMaiorSConsCodigo(const AConnection: IActiveRecordConnection): TNullableInteger;
begin
  Result := TARNFConsultaSerasaSummaryMaiorSConsCodigo.Create.SummaryMaiorSConsCodigo(AConnection);
end;

function TARNFConsultaSerasa.GetID: Integer;
begin
  Result := FID;
end;

function TARNFConsultaSerasa.GetSConsCnpjCpf: TNullableString;
begin
  Result := FSConsCnpjCpf;
end;

function TARNFConsultaSerasa.GetSConsData: TNullableDateTime;
begin
  Result := FSConsData;
end;

function TARNFConsultaSerasa.GetSConsHora: TNullableString;
begin
  Result := FSConsHora;
end;

function TARNFConsultaSerasa.GetSConsRazao: TNullableString;
begin
  Result := FSConsRazao;
end;

function TARNFConsultaSerasa.GetSConsEmpTipo: TNullableString;
begin
  Result := FSConsEmpTipo;
end;

function TARNFConsultaSerasa.GetSConsPesTipo: TNullableString;
begin
  Result := FSConsPesTipo;
end;

function TARNFConsultaSerasa.GetUsuLogin: TNullableString;
begin
  Result := FUsuLogin;
end;

function TARNFConsultaSerasa.GetSConsCodigo: TNullableInteger;
begin
  Result := FSConsCodigo;
end;

function TARNFConsultaSerasa.GetSCaminhoArquivo: TNullableString;
begin
  Result := FSCaminhoArquivo;
end;

function TARNFConsultaSerasa.GetRetLinhaSerasa: TNullableString;
begin
  Result := FRetLinhaSerasa;
end;

function TARNFConsultaSerasa.GetEmpCodigo: TNullableInteger;
begin
  Result := FEmpCodigo;
end;

function TARNFConsultaSerasa.GetUserConsulta: TNullableString;
begin
  Result := FUserConsulta;
end;

function TARNFConsultaSerasa.GetParNaoMostrarDadosFactoringComplemento: TNullableBoolean;
begin
  Result := FParNaoMostrarDadosFactoringComplemento;
end;

function TARNFConsultaSerasa.GetSConsAcaoGerencie: TNullableBoolean;
begin
  Result := FSConsAcaoGerencie;
end;

function TARNFConsultaSerasa.GetSConsPrazoGerencie: TNullableInteger;
begin
  Result := FSConsPrazoGerencie;
end;

function TARNFConsultaSerasa.GetGru_ID: TNullableInteger;
begin
  Result := FGru_ID;
end;

function TARNFConsultaSerasa.GetPer_ID: TNullableInteger;
begin
  Result := FPer_ID;
end;

function TARNFConsultaSerasa.GetSConsRetornoMonitore: TNullableBoolean;
begin
  Result := FSConsRetornoMonitore;
end;

function TARNFConsultaSerasa.GetSConsRetornoMonitorePF: TNullableBoolean;
begin
  Result := FSConsRetornoMonitorePF;
end;

function TARNFConsultaSerasa.GetGerouPendencia: TNullableBoolean;
begin
  Result := FGerouPendencia;
end;

function TARNFConsultaSerasa.GetSConsPrecisouAutorizacao: TNullableBoolean;
begin
  Result := FSConsPrecisouAutorizacao;
end;

function TARNFConsultaSerasa.GetSConsUsuLoginAutorizou: TNullableString;
begin
  Result := FSConsUsuLoginAutorizou;
end;

function TARNFConsultaSerasa.GetAsString(Index: Integer): string;
begin
  case Index of
    Campo_NFConsultaSerasa_ID: Result := IntToStr(GetID);
    Campo_NFConsultaSerasa_SConsCnpjCpf: Result := ToString(GetSConsCnpjCpf);
    Campo_NFConsultaSerasa_SConsData: Result := ToString(GetSConsData);
    Campo_NFConsultaSerasa_SConsHora: Result := ToString(GetSConsHora);
    Campo_NFConsultaSerasa_SConsRazao: Result := ToString(GetSConsRazao);
    Campo_NFConsultaSerasa_SConsEmpTipo: Result := ToString(GetSConsEmpTipo);
    Campo_NFConsultaSerasa_SConsPesTipo: Result := ToString(GetSConsPesTipo);
    Campo_NFConsultaSerasa_UsuLogin: Result := ToString(GetUsuLogin);
    Campo_NFConsultaSerasa_SConsCodigo: Result := ToString(GetSConsCodigo);
    Campo_NFConsultaSerasa_SCaminhoArquivo: Result := ToString(GetSCaminhoArquivo);
    Campo_NFConsultaSerasa_RetLinhaSerasa: Result := ToString(GetRetLinhaSerasa);
    Campo_NFConsultaSerasa_EmpCodigo: Result := ToString(GetEmpCodigo);
    Campo_NFConsultaSerasa_UserConsulta: Result := ToString(GetUserConsulta);
    Campo_NFConsultaSerasa_ParNaoMostrarDadosFactoringComplemento: Result := ToStringNS(GetParNaoMostrarDadosFactoringComplemento);
    Campo_NFConsultaSerasa_SConsAcaoGerencie: Result := ToStringNS(GetSConsAcaoGerencie);
    Campo_NFConsultaSerasa_SConsPrazoGerencie: Result := ToString(GetSConsPrazoGerencie);
    Campo_NFConsultaSerasa_Gru_ID: Result := ToString(GetGru_ID);
    Campo_NFConsultaSerasa_Per_ID: Result := ToString(GetPer_ID);
    Campo_NFConsultaSerasa_SConsRetornoMonitore: Result := ToStringNS(GetSConsRetornoMonitore);
    Campo_NFConsultaSerasa_SConsRetornoMonitorePF: Result := ToStringNS(GetSConsRetornoMonitorePF);
    Campo_NFConsultaSerasa_GerouPendencia: Result := ToStringNS(GetGerouPendencia);
    Campo_NFConsultaSerasa_SConsPrecisouAutorizacao: Result := ToStringNS(GetSConsPrecisouAutorizacao);
    Campo_NFConsultaSerasa_SConsUsuLoginAutorizou: Result := ToString(GetSConsUsuLoginAutorizou);
  else
    Result := inherited GetAsString(Index);
  end;
end;

function TARNFConsultaSerasa.GetValue(Index: Integer): Variant;
begin
  case Index of
    Campo_NFConsultaSerasa_ID: Result := GetID;
    Campo_NFConsultaSerasa_SConsCnpjCpf: Result := ToVariant(GetSConsCnpjCpf);
    Campo_NFConsultaSerasa_SConsData: Result := ToVariant(GetSConsData);
    Campo_NFConsultaSerasa_SConsHora: Result := ToVariant(GetSConsHora);
    Campo_NFConsultaSerasa_SConsRazao: Result := ToVariant(GetSConsRazao);
    Campo_NFConsultaSerasa_SConsEmpTipo: Result := ToVariant(GetSConsEmpTipo);
    Campo_NFConsultaSerasa_SConsPesTipo: Result := ToVariant(GetSConsPesTipo);
    Campo_NFConsultaSerasa_UsuLogin: Result := ToVariant(GetUsuLogin);
    Campo_NFConsultaSerasa_SConsCodigo: Result := ToVariant(GetSConsCodigo);
    Campo_NFConsultaSerasa_SCaminhoArquivo: Result := ToVariant(GetSCaminhoArquivo);
    Campo_NFConsultaSerasa_RetLinhaSerasa: Result := ToVariant(GetRetLinhaSerasa);
    Campo_NFConsultaSerasa_EmpCodigo: Result := ToVariant(GetEmpCodigo);
    Campo_NFConsultaSerasa_UserConsulta: Result := ToVariant(GetUserConsulta);
    Campo_NFConsultaSerasa_ParNaoMostrarDadosFactoringComplemento: Result := ToVariant(GetParNaoMostrarDadosFactoringComplemento);
    Campo_NFConsultaSerasa_SConsAcaoGerencie: Result := ToVariant(GetSConsAcaoGerencie);
    Campo_NFConsultaSerasa_SConsPrazoGerencie: Result := ToVariant(GetSConsPrazoGerencie);
    Campo_NFConsultaSerasa_Gru_ID: Result := ToVariant(GetGru_ID);
    Campo_NFConsultaSerasa_Per_ID: Result := ToVariant(GetPer_ID);
    Campo_NFConsultaSerasa_SConsRetornoMonitore: Result := ToVariant(GetSConsRetornoMonitore);
    Campo_NFConsultaSerasa_SConsRetornoMonitorePF: Result := ToVariant(GetSConsRetornoMonitorePF);
    Campo_NFConsultaSerasa_GerouPendencia: Result := ToVariant(GetGerouPendencia);
    Campo_NFConsultaSerasa_SConsPrecisouAutorizacao: Result := ToVariant(GetSConsPrecisouAutorizacao);
    Campo_NFConsultaSerasa_SConsUsuLoginAutorizou: Result := ToVariant(GetSConsUsuLoginAutorizou);
  else
    Result := inherited GetValue(Index);
  end;
end;

class function TARNFConsultaSerasa.GUIDItem: TGUID;
begin
  Result := IARNFConsultaSerasa;
end;

function TARNFConsultaSerasa.IsNull(Index: Integer): Boolean;
begin
  case Index of
    Campo_NFConsultaSerasa_ID: Result := False;
    Campo_NFConsultaSerasa_SConsCnpjCpf: Result := GetSConsCnpjCpf.Null;
    Campo_NFConsultaSerasa_SConsData: Result := GetSConsData.Null;
    Campo_NFConsultaSerasa_SConsHora: Result := GetSConsHora.Null;
    Campo_NFConsultaSerasa_SConsRazao: Result := GetSConsRazao.Null;
    Campo_NFConsultaSerasa_SConsEmpTipo: Result := GetSConsEmpTipo.Null;
    Campo_NFConsultaSerasa_SConsPesTipo: Result := GetSConsPesTipo.Null;
    Campo_NFConsultaSerasa_UsuLogin: Result := GetUsuLogin.Null;
    Campo_NFConsultaSerasa_SConsCodigo: Result := GetSConsCodigo.Null;
    Campo_NFConsultaSerasa_SCaminhoArquivo: Result := GetSCaminhoArquivo.Null;
    Campo_NFConsultaSerasa_RetLinhaSerasa: Result := GetRetLinhaSerasa.Null;
    Campo_NFConsultaSerasa_EmpCodigo: Result := GetEmpCodigo.Null;
    Campo_NFConsultaSerasa_UserConsulta: Result := GetUserConsulta.Null;
    Campo_NFConsultaSerasa_ParNaoMostrarDadosFactoringComplemento: Result := GetParNaoMostrarDadosFactoringComplemento.Null;
    Campo_NFConsultaSerasa_SConsAcaoGerencie: Result := GetSConsAcaoGerencie.Null;
    Campo_NFConsultaSerasa_SConsPrazoGerencie: Result := GetSConsPrazoGerencie.Null;
    Campo_NFConsultaSerasa_Gru_ID: Result := GetGru_ID.Null;
    Campo_NFConsultaSerasa_Per_ID: Result := GetPer_ID.Null;
    Campo_NFConsultaSerasa_SConsRetornoMonitore: Result := GetSConsRetornoMonitore.Null;
    Campo_NFConsultaSerasa_SConsRetornoMonitorePF: Result := GetSConsRetornoMonitorePF.Null;
    Campo_NFConsultaSerasa_GerouPendencia: Result := GetGerouPendencia.Null;
    Campo_NFConsultaSerasa_SConsPrecisouAutorizacao: Result := GetSConsPrecisouAutorizacao.Null;
    Campo_NFConsultaSerasa_SConsUsuLoginAutorizou: Result := GetSConsUsuLoginAutorizou.Null;
  else
    Result := inherited IsNull(Index);
  end;
end;

procedure TARNFConsultaSerasa.SetAsString(Index: Integer; const Value: string);
begin
  case Index of
    Campo_NFConsultaSerasa_ID: raise EActiveRecord.Create('Campo ID é somente leitura');
    Campo_NFConsultaSerasa_SConsCnpjCpf: SetSConsCnpjCpf(Nullable(Value));
    Campo_NFConsultaSerasa_SConsData: SetSConsData(StringToNullableDateTime(Value));
    Campo_NFConsultaSerasa_SConsHora: SetSConsHora(Nullable(Value));
    Campo_NFConsultaSerasa_SConsRazao: SetSConsRazao(Nullable(Value));
    Campo_NFConsultaSerasa_SConsEmpTipo: SetSConsEmpTipo(Nullable(Value));
    Campo_NFConsultaSerasa_SConsPesTipo: SetSConsPesTipo(Nullable(Value));
    Campo_NFConsultaSerasa_UsuLogin: SetUsuLogin(Nullable(Value));
    Campo_NFConsultaSerasa_SConsCodigo: raise EActiveRecord.Create('Campo SConsCodigo é somente leitura');
    Campo_NFConsultaSerasa_SCaminhoArquivo: SetSCaminhoArquivo(Nullable(Value));
    Campo_NFConsultaSerasa_RetLinhaSerasa: SetRetLinhaSerasa(Nullable(Value));
    Campo_NFConsultaSerasa_EmpCodigo: SetEmpCodigo(StringToNullableInteger(Value));
    Campo_NFConsultaSerasa_UserConsulta: SetUserConsulta(Nullable(Value));
    Campo_NFConsultaSerasa_ParNaoMostrarDadosFactoringComplemento: SetParNaoMostrarDadosFactoringComplemento(NSToNullableBoolean(Value));
    Campo_NFConsultaSerasa_SConsAcaoGerencie: SetSConsAcaoGerencie(NSToNullableBoolean(Value));
    Campo_NFConsultaSerasa_SConsPrazoGerencie: SetSConsPrazoGerencie(StringToNullableInteger(Value));
    Campo_NFConsultaSerasa_Gru_ID: SetGru_ID(StringToNullableInteger(Value));
    Campo_NFConsultaSerasa_Per_ID: SetPer_ID(StringToNullableInteger(Value));
    Campo_NFConsultaSerasa_SConsRetornoMonitore: SetSConsRetornoMonitore(NSToNullableBoolean(Value));
    Campo_NFConsultaSerasa_SConsRetornoMonitorePF: SetSConsRetornoMonitorePF(NSToNullableBoolean(Value));
    Campo_NFConsultaSerasa_GerouPendencia: SetGerouPendencia(NSToNullableBoolean(Value));
    Campo_NFConsultaSerasa_SConsPrecisouAutorizacao: SetSConsPrecisouAutorizacao(NSToNullableBoolean(Value));
    Campo_NFConsultaSerasa_SConsUsuLoginAutorizou: SetSConsUsuLoginAutorizou(Nullable(Value));
  else
    inherited;
  end;
end;

procedure TARNFConsultaSerasa.SetValue(Index: Integer; const Value: Variant);
begin
  case Index of
    Campo_NFConsultaSerasa_ID: raise EActiveRecord.Create('Campo ID é somente leitura');
    Campo_NFConsultaSerasa_SConsCnpjCpf: SetSConsCnpjCpf(VariantToNullableString(Value));
    Campo_NFConsultaSerasa_SConsData: SetSConsData(VariantToNullableDateTime(Value));
    Campo_NFConsultaSerasa_SConsHora: SetSConsHora(VariantToNullableString(Value));
    Campo_NFConsultaSerasa_SConsRazao: SetSConsRazao(VariantToNullableString(Value));
    Campo_NFConsultaSerasa_SConsEmpTipo: SetSConsEmpTipo(VariantToNullableString(Value));
    Campo_NFConsultaSerasa_SConsPesTipo: SetSConsPesTipo(VariantToNullableString(Value));
    Campo_NFConsultaSerasa_UsuLogin: SetUsuLogin(VariantToNullableString(Value));
    Campo_NFConsultaSerasa_SConsCodigo: raise EActiveRecord.Create('Campo SConsCodigo é somente leitura');
    Campo_NFConsultaSerasa_SCaminhoArquivo: SetSCaminhoArquivo(VariantToNullableString(Value));
    Campo_NFConsultaSerasa_RetLinhaSerasa: SetRetLinhaSerasa(VariantToNullableString(Value));
    Campo_NFConsultaSerasa_EmpCodigo: SetEmpCodigo(VariantToNullableInteger(Value));
    Campo_NFConsultaSerasa_UserConsulta: SetUserConsulta(VariantToNullableString(Value));
    Campo_NFConsultaSerasa_ParNaoMostrarDadosFactoringComplemento: SetParNaoMostrarDadosFactoringComplemento(VariantToNullableBoolean(Value));
    Campo_NFConsultaSerasa_SConsAcaoGerencie: SetSConsAcaoGerencie(VariantToNullableNS(Value));
    Campo_NFConsultaSerasa_SConsPrazoGerencie: SetSConsPrazoGerencie(VariantToNullableInteger(Value));
    Campo_NFConsultaSerasa_Gru_ID: SetGru_ID(VariantToNullableInteger(Value));
    Campo_NFConsultaSerasa_Per_ID: SetPer_ID(VariantToNullableInteger(Value));
    Campo_NFConsultaSerasa_SConsRetornoMonitore: SetSConsRetornoMonitore(VariantToNullableBoolean(Value));
    Campo_NFConsultaSerasa_SConsRetornoMonitorePF: SetSConsRetornoMonitorePF(VariantToNullableBoolean(Value));
    Campo_NFConsultaSerasa_GerouPendencia: SetGerouPendencia(VariantToNullableBoolean(Value));
    Campo_NFConsultaSerasa_SConsPrecisouAutorizacao: SetSConsPrecisouAutorizacao(VariantToNullableBoolean(Value));
    Campo_NFConsultaSerasa_SConsUsuLoginAutorizou: SetSConsUsuLoginAutorizou(VariantToNullableString(Value));
  else
    inherited;
  end;
end;

procedure TARNFConsultaSerasa.SetSConsCnpjCpf(const Value: TNullableString);
begin
  FSConsCnpjCpf := AjustaVarchar(Value, 50);
end;

procedure TARNFConsultaSerasa.SetSConsData(const Value: TNullableDateTime);
begin
  FSConsData := Value;
end;

procedure TARNFConsultaSerasa.SetSConsHora(const Value: TNullableString);
begin
  FSConsHora := AjustaVarchar(Value, 50);
end;

procedure TARNFConsultaSerasa.SetSConsRazao(const Value: TNullableString);
begin
  FSConsRazao := AjustaVarchar(Value, 50);
end;

procedure TARNFConsultaSerasa.SetSConsEmpTipo(const Value: TNullableString);
begin
  FSConsEmpTipo := AjustaVarchar(Value, 50);
end;

procedure TARNFConsultaSerasa.SetSConsPesTipo(const Value: TNullableString);
begin
  FSConsPesTipo := AjustaVarchar(Value, 50);
end;

procedure TARNFConsultaSerasa.SetUsuLogin(const Value: TNullableString);
begin
  FUsuLogin := AjustaVarchar(Value, 50);
end;

procedure TARNFConsultaSerasa.SetSConsCodigo(const Value: TNullableInteger);
begin
  FSConsCodigo := Value;
end;

procedure TARNFConsultaSerasa.SetSCaminhoArquivo(const Value: TNullableString);
begin
  FSCaminhoArquivo := AjustaVarchar(Value, 100);
end;

procedure TARNFConsultaSerasa.SetRetLinhaSerasa(const Value: TNullableString);
begin
  FRetLinhaSerasa := Value;
end;

procedure TARNFConsultaSerasa.SetEmpCodigo(const Value: TNullableInteger);
begin
  FEmpCodigo := Value;
end;

procedure TARNFConsultaSerasa.SetUserConsulta(const Value: TNullableString);
begin
  FUserConsulta := AjustaVarchar(Value, 25);
end;

procedure TARNFConsultaSerasa.SetParNaoMostrarDadosFactoringComplemento(const Value: TNullableBoolean);
begin
  FParNaoMostrarDadosFactoringComplemento := Value;
end;

procedure TARNFConsultaSerasa.SetSConsAcaoGerencie(const Value: TNullableBoolean);
begin
  FSConsAcaoGerencie := Value;
end;

procedure TARNFConsultaSerasa.SetSConsPrazoGerencie(const Value: TNullableInteger);
begin
  FSConsPrazoGerencie := Value;
end;

procedure TARNFConsultaSerasa.SetGru_ID(const Value: TNullableInteger);
begin
  FGru_ID := Value;
end;

procedure TARNFConsultaSerasa.SetPer_ID(const Value: TNullableInteger);
begin
  FPer_ID := Value;
end;

procedure TARNFConsultaSerasa.SetSConsRetornoMonitore(const Value: TNullableBoolean);
begin
  FSConsRetornoMonitore := Value;
end;

procedure TARNFConsultaSerasa.SetSConsRetornoMonitorePF(const Value: TNullableBoolean);
begin
  FSConsRetornoMonitorePF := Value;
end;

procedure TARNFConsultaSerasa.SetGerouPendencia(const Value: TNullableBoolean);
begin
  FGerouPendencia := Value;
end;

procedure TARNFConsultaSerasa.SetSConsPrecisouAutorizacao(const Value: TNullableBoolean);
begin
  FSConsPrecisouAutorizacao := Value;
end;

procedure TARNFConsultaSerasa.SetSConsUsuLoginAutorizou(const Value: TNullableString);
begin
  FSConsUsuLoginAutorizou := AjustaVarchar(Value, 100);
end;

class function TARNFConsultaSerasa.Metadata: IActiveRecordMetadata;
begin
  Result := TARNFConsultaSerasaMetadataObject.Create;
end;

procedure TARNFConsultaSerasa.Persist;
begin
  PersistSQL;
end;

procedure TARNFConsultaSerasa.PersistSQL;
begin
  if GetDeleted then
  begin
    GARNFConsultaSerasaDeleteCriticalSection.Acquire;
    try
      TARNFConsultaSerasaDelete.Create.Persist(Self);
    finally
      GARNFConsultaSerasaDeleteCriticalSection.Release;
    end;
  end
  else
  begin
    if GetNovo then
    begin
      GARNFConsultaSerasaInsertCriticalSection.Acquire;
      try
        TARNFConsultaSerasaInsert.Create.Persist(Self);
      finally
        GARNFConsultaSerasaInsertCriticalSection.Release;
      end;
    end
    else
    begin
      GARNFConsultaSerasaUpdateCriticalSection.Acquire;
      try
        TARNFConsultaSerasaUpdate.Create.Persist(Self);
      finally
        GARNFConsultaSerasaUpdateCriticalSection.Release;
      end;
    end;
  end;
end;

procedure TARNFConsultaSerasa.SetRecordSet(const ARecordSet: _RecordSet; AOffset: Integer);
begin
  FPrimaryKeyID := ARecordSet.Fields[Campo_NFConsultaSerasa_ID + AOffset].Value;
  FID := ARecordSet.Fields[Campo_NFConsultaSerasa_ID + AOffset].Value;
  FSConsCnpjCpf := VariantToNullableString(ARecordSet.Fields[Campo_NFConsultaSerasa_SConsCnpjCpf + AOffset].Value);
  FSConsData := VariantToNullableDateTime(ARecordSet.Fields[Campo_NFConsultaSerasa_SConsData + AOffset].Value);
  FSConsHora := VariantToNullableString(ARecordSet.Fields[Campo_NFConsultaSerasa_SConsHora + AOffset].Value);
  FSConsRazao := VariantToNullableString(ARecordSet.Fields[Campo_NFConsultaSerasa_SConsRazao + AOffset].Value);
  FSConsEmpTipo := VariantToNullableString(ARecordSet.Fields[Campo_NFConsultaSerasa_SConsEmpTipo + AOffset].Value);
  FSConsPesTipo := VariantToNullableString(ARecordSet.Fields[Campo_NFConsultaSerasa_SConsPesTipo + AOffset].Value);
  FUsuLogin := VariantToNullableString(ARecordSet.Fields[Campo_NFConsultaSerasa_UsuLogin + AOffset].Value);
  FSConsCodigo := VariantToNullableInteger(ARecordSet.Fields[Campo_NFConsultaSerasa_SConsCodigo + AOffset].Value);
  FSCaminhoArquivo := VariantToNullableString(ARecordSet.Fields[Campo_NFConsultaSerasa_SCaminhoArquivo + AOffset].Value);
  FRetLinhaSerasa := VariantToNullableString(ARecordSet.Fields[Campo_NFConsultaSerasa_RetLinhaSerasa + AOffset].Value);
  FEmpCodigo := VariantToNullableInteger(ARecordSet.Fields[Campo_NFConsultaSerasa_EmpCodigo + AOffset].Value);
  FUserConsulta := VariantToNullableString(ARecordSet.Fields[Campo_NFConsultaSerasa_UserConsulta + AOffset].Value);
  FParNaoMostrarDadosFactoringComplemento := VariantToNullableB01(ARecordSet.Fields[Campo_NFConsultaSerasa_ParNaoMostrarDadosFactoringComplemento + AOffset].Value);
  FSConsAcaoGerencie := VariantToNullableNS(ARecordSet.Fields[Campo_NFConsultaSerasa_SConsAcaoGerencie + AOffset].Value);
  FSConsPrazoGerencie := VariantToNullableInteger(ARecordSet.Fields[Campo_NFConsultaSerasa_SConsPrazoGerencie + AOffset].Value);
  FGru_ID := VariantToNullableInteger(ARecordSet.Fields[Campo_NFConsultaSerasa_Gru_ID + AOffset].Value);
  FPer_ID := VariantToNullableInteger(ARecordSet.Fields[Campo_NFConsultaSerasa_Per_ID + AOffset].Value);
  FSConsRetornoMonitore := VariantToNullableB01(ARecordSet.Fields[Campo_NFConsultaSerasa_SConsRetornoMonitore + AOffset].Value);
  FSConsRetornoMonitorePF := VariantToNullableB01(ARecordSet.Fields[Campo_NFConsultaSerasa_SConsRetornoMonitorePF + AOffset].Value);
  FGerouPendencia := VariantToNullableB01(ARecordSet.Fields[Campo_NFConsultaSerasa_GerouPendencia + AOffset].Value);
  FSConsPrecisouAutorizacao := VariantToNullableB01(ARecordSet.Fields[Campo_NFConsultaSerasa_SConsPrecisouAutorizacao + AOffset].Value);
  FSConsUsuLoginAutorizou := VariantToNullableString(ARecordSet.Fields[Campo_NFConsultaSerasa_SConsUsuLoginAutorizou + AOffset].Value);
end;

class function TARNFConsultaSerasa.ViewMetadata: IActiveRecordMetadata;
begin
  Result := Metadata;
end;

{ TARNFConsultaSerasaSummaryMaiorSConsCodigo }

procedure TARNFConsultaSerasaSummaryMaiorSConsCodigo.DefineParameters;
begin
end;

function TARNFConsultaSerasaSummaryMaiorSConsCodigo.GetCommandSQL: string;
begin
  Result :=
    'select'#13#10 +
    '  max(SConsCodigo)'#13#10 +
    'from'#13#10 +
    '  nfconsultaserasa'#13#10;
end;

function TARNFConsultaSerasaSummaryMaiorSConsCodigo.SummaryMaiorSConsCodigo(const AConnection: IActiveRecordConnection): TNullableInteger;
var
  LRecordSet: _RecordSet;
  LRecordsAffected: OleVariant;
begin
  SetConnection(AConnection);
  LRecordSet := Command.Execute(LRecordsAffected, EmptyParam, 0);
  try
    Result := TActiveRecord.VariantToNullableInteger(LRecordSet.Fields[0].Value);
  finally
    LRecordSet.Close;
    Command.Set_ActiveConnection(nil);
  end;
end;

{ TARNFConsultaSerasaDelete }

procedure TARNFConsultaSerasaDelete.DefineParameters;
begin
  Command.Parameters.Append(Command.CreateParameter('ID', adInteger, adParamInput, 0, Null));
end;

function TARNFConsultaSerasaDelete.GetCommandSQL: string;
begin
  Result :=
    'delete from nfconsultaserasa'#13#10 +
    'where'#13#10 +
    '  id = ?';
end;

procedure TARNFConsultaSerasaDelete.Persist(AARNFConsultaSerasa: TARNFConsultaSerasa);
begin
  inherited Persist(AARNFConsultaSerasa);
  //Chaves
  Command.Parameters[0].Value := AARNFConsultaSerasa.FID;
  if Execute <> 1 then
    raise EActiveRecord.Create('Delete Failed TARNFConsultaSerasaDelete');
end;

{ TARNFConsultaSerasaInsert }

procedure TARNFConsultaSerasaInsert.DefineParameters;
begin
  Command.Parameters.Append(Command.CreateParameter('SConsCnpjCpf', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsData', adDBTimeStamp, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsHora', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsRazao', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsEmpTipo', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsPesTipo', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLogin', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SCaminhoArquivo', adVarChar, adParamInput, 100, Null));
  Command.Parameters.Append(Command.CreateParameter('RetLinhaSerasa', adLongVarChar, adParamInput, MaxInt, Null));
  Command.Parameters.Append(Command.CreateParameter('EmpCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UserConsulta', adVarChar, adParamInput, 25, Null));
  Command.Parameters.Append(Command.CreateParameter('ParNaoMostrarDadosFactoringComplemento', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsAcaoGerencie', adVarChar, adParamInput, 1, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsPrazoGerencie', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('Gru_ID', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('Per_ID', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsRetornoMonitore', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsRetornoMonitorePF', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('GerouPendencia', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsPrecisouAutorizacao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsUsuLoginAutorizou', adVarChar, adParamInput, 100, Null));
end;

function TARNFConsultaSerasaInsert.GetCommandSQL: string;
begin
  Result :=
    'insert into nfconsultaserasa ('#13#10 +
    '  sconscnpjcpf, sconsdata, sconshora, sconsrazao,'#13#10 +
    '  sconsemptipo, sconspestipo, usulogin, sconscodigo, scaminhoarquivo,'#13#10 +
    '  retlinhaserasa, empcodigo, userconsulta, parnaomostrardadosfactoringcomplemento, sconsacaogerencie,'#13#10 +
    '  sconsprazogerencie, gru_id, per_id, sconsretornomonitore, sconsretornomonitorepf,'#13#10 +
    '  geroupendencia, sconsprecisouautorizacao, sconsusuloginautorizou'#13#10 +
    ') output inserted.id values ('#13#10 +
    '  ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?, ?, ?,'#13#10 +
    '  ?, ?, ?'#13#10 +
    ')';
end;

procedure TARNFConsultaSerasaInsert.Persist(AARNFConsultaSerasa: TARNFConsultaSerasa);
begin
  inherited Persist(AARNFConsultaSerasa);
  Command.Parameters[0].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsCnpjCpf);
  Command.Parameters[1].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsData);
  Command.Parameters[2].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsHora);
  Command.Parameters[3].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsRazao);
  Command.Parameters[4].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsEmpTipo);
  Command.Parameters[5].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsPesTipo);
  Command.Parameters[6].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FUsuLogin);
  Command.Parameters[7].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsCodigo);
  Command.Parameters[8].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSCaminhoArquivo);
  Command.Parameters[9].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FRetLinhaSerasa);
  Command.Parameters[10].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FEmpCodigo);
  Command.Parameters[11].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FUserConsulta);
  Command.Parameters[12].Value := TActiveRecord.ToVariantB01(AARNFConsultaSerasa.FParNaoMostrarDadosFactoringComplemento);
  Command.Parameters[13].Value := TActiveRecord.ToVariantNS(AARNFConsultaSerasa.FSConsAcaoGerencie);
  Command.Parameters[14].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsPrazoGerencie);
  Command.Parameters[15].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FGru_ID);
  Command.Parameters[16].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FPer_ID);
  Command.Parameters[17].Value := TActiveRecord.ToVariantB01(AARNFConsultaSerasa.FSConsRetornoMonitore);
  Command.Parameters[18].Value := TActiveRecord.ToVariantB01(AARNFConsultaSerasa.FSConsRetornoMonitorePF);
  Command.Parameters[19].Value := TActiveRecord.ToVariantB01(AARNFConsultaSerasa.FGerouPendencia);
  Command.Parameters[20].Value := TActiveRecord.ToVariantB01(AARNFConsultaSerasa.FSConsPrecisouAutorizacao);
  Command.Parameters[21].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsUsuLoginAutorizou);
  AARNFConsultaSerasa.FID := ExecuteReturnAutoInc;
  //Atribuições das Chaves após o insert
  AARNFConsultaSerasa.FPrimaryKeyID := AARNFConsultaSerasa.FID;
end;

{ TARNFConsultaSerasaUpdate }

procedure TARNFConsultaSerasaUpdate.DefineParameters;
begin
  Command.Parameters.Append(Command.CreateParameter('SConsCnpjCpf', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsData', adDBTimeStamp, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsHora', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsRazao', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsEmpTipo', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsPesTipo', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('UsuLogin', adVarChar, adParamInput, 50, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SCaminhoArquivo', adVarChar, adParamInput, 100, Null));
  Command.Parameters.Append(Command.CreateParameter('RetLinhaSerasa', adLongVarChar, adParamInput, MaxInt, Null));
  Command.Parameters.Append(Command.CreateParameter('EmpCodigo', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('UserConsulta', adVarChar, adParamInput, 25, Null));
  Command.Parameters.Append(Command.CreateParameter('ParNaoMostrarDadosFactoringComplemento', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsAcaoGerencie', adVarChar, adParamInput, 1, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsPrazoGerencie', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('Gru_ID', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('Per_ID', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsRetornoMonitore', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsRetornoMonitorePF', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('GerouPendencia', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsPrecisouAutorizacao', adInteger, adParamInput, 0, Null));
  Command.Parameters.Append(Command.CreateParameter('SConsUsuLoginAutorizou', adVarChar, adParamInput, 100, Null));
  //Chaves
  Command.Parameters.Append(Command.CreateParameter('PrimaryKeyID', adInteger, adParamInput, 0, Null));
end;

function TARNFConsultaSerasaUpdate.GetCommandSQL: string;
begin
  Result :=
    'update nfconsultaserasa set'#13#10 +
    '  sconscnpjcpf = ?, sconsdata = ?,'#13#10 +
    '  sconshora = ?, sconsrazao = ?, sconsemptipo = ?,'#13#10 +
    '  sconspestipo = ?, usulogin = ?, sconscodigo = ?,'#13#10 +
    '  scaminhoarquivo = ?, retlinhaserasa = ?, empcodigo = ?,'#13#10 +
    '  userconsulta = ?, parnaomostrardadosfactoringcomplemento = ?, sconsacaogerencie = ?,'#13#10 +
    '  sconsprazogerencie = ?, gru_id = ?, per_id = ?,'#13#10 +
    '  sconsretornomonitore = ?, sconsretornomonitorepf = ?, geroupendencia = ?,'#13#10 +
    '  sconsprecisouautorizacao = ?, sconsusuloginautorizou = ?'#13#10 +
    'where'#13#10 +
    '  id = ?';
end;

procedure TARNFConsultaSerasaUpdate.Persist(AARNFConsultaSerasa: TARNFConsultaSerasa);
begin
  inherited Persist(AARNFConsultaSerasa);
  Command.Parameters[0].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsCnpjCpf);
  Command.Parameters[1].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsData);
  Command.Parameters[2].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsHora);
  Command.Parameters[3].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsRazao);
  Command.Parameters[4].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsEmpTipo);
  Command.Parameters[5].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsPesTipo);
  Command.Parameters[6].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FUsuLogin);
  Command.Parameters[7].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsCodigo);
  Command.Parameters[8].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSCaminhoArquivo);
  Command.Parameters[9].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FRetLinhaSerasa);
  Command.Parameters[10].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FEmpCodigo);
  Command.Parameters[11].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FUserConsulta);
  Command.Parameters[12].Value := TActiveRecord.ToVariantB01(AARNFConsultaSerasa.FParNaoMostrarDadosFactoringComplemento);
  Command.Parameters[13].Value := TActiveRecord.ToVariantNS(AARNFConsultaSerasa.FSConsAcaoGerencie);
  Command.Parameters[14].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsPrazoGerencie);
  Command.Parameters[15].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FGru_ID);
  Command.Parameters[16].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FPer_ID);
  Command.Parameters[17].Value := TActiveRecord.ToVariantB01(AARNFConsultaSerasa.FSConsRetornoMonitore);
  Command.Parameters[18].Value := TActiveRecord.ToVariantB01(AARNFConsultaSerasa.FSConsRetornoMonitorePF);
  Command.Parameters[19].Value := TActiveRecord.ToVariantB01(AARNFConsultaSerasa.FGerouPendencia);
  Command.Parameters[20].Value := TActiveRecord.ToVariantB01(AARNFConsultaSerasa.FSConsPrecisouAutorizacao);
  Command.Parameters[21].Value := TActiveRecord.ToVariant(AARNFConsultaSerasa.FSConsUsuLoginAutorizou);
  //Chaves
  Command.Parameters[22].Value := AARNFConsultaSerasa.FPrimaryKeyID;
  if Execute <> 1 then
    raise EActiveRecord.Create('Update Failed TARNFConsultaSerasaUpdate');
end;

{ TARNFConsultaSerasaMetadataObject }

function TARNFConsultaSerasaMetadataObject.FieldCount: Integer;
begin
  Result := Length(ARNFConsultaSerasaMetadata.Fields);
end;

function TARNFConsultaSerasaMetadataObject.FieldMetadata(Index: Integer): TFieldMetadata;
begin
  Result := ARNFConsultaSerasaMetadata.Fields[Index];
end;

function TARNFConsultaSerasaMetadataObject.FieldMetadataByName(const AName: string): TFieldMetadata;
begin
  Result := FieldMetadata(IndexOfName(AName));
end;

function TARNFConsultaSerasaMetadataObject.IndexOfName(const AName: string): Integer;
var
  laco: Integer;
begin
  Result := -1;
  for laco := 0 to High(ARNFConsultaSerasaMetadata.Fields) do
    if SameText(ARNFConsultaSerasaMetadata.Fields[laco].Name, AName) then
    begin
      Result := laco;
      Break;
    end;
end;

function TARNFConsultaSerasaMetadataObject.RelationshipCount: Integer;
begin
  Result := 0;
end;

function TARNFConsultaSerasaMetadataObject.RelationshipMetadata(Index: Integer): TRelationshipMetadata;
begin
  FillChar(Result, SizeOf(TRelationshipMetadata), #0);
end;

function TARNFConsultaSerasaMetadataObject.TableMetadata: TTableMetadata;
begin
  Result := ARNFConsultaSerasaMetadata.Table;
end;

initialization

  GARNFConsultaSerasaDeleteCriticalSection := TCriticalSection.Create;
  GARNFConsultaSerasaInsertCriticalSection := TCriticalSection.Create;
  GARNFConsultaSerasaUpdateCriticalSection := TCriticalSection.Create;

  GQueryFactoryByID := TARNFConsultaSerasa.From
    .Top(1)
    .Where('id = ?');

finalization

  GQueryFactoryByID := nil;
  FreeAndNil(GARNFConsultaSerasaDeleteCriticalSection);
  FreeAndNil(GARNFConsultaSerasaInsertCriticalSection);
  FreeAndNil(GARNFConsultaSerasaUpdateCriticalSection);

end.