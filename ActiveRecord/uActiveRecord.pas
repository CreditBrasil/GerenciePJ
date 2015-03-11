unit uActiveRecord;

interface

uses
  SysUtils, Classes, Contnrs, Graphics, uSingleton, Variants, ServiceLocator, db, ADOInt, Math;

type
  EActiveRecord = class(Exception);

  IActiveRecordTransaction = interface
    ['{AA3B494E-73A8-44A6-8DC2-740373EF8B9F}']
    procedure Commit;
    procedure RollBack;
  end;

  IActiveRecordConnection = interface
    ['{84DB451F-D820-45AC-8846-B70D94A7F88C}']
    function GetUserCode: string;
    function GetUserName: string;
    procedure SetUserCode(const AValue: string);
    procedure SetUserName(const AValue: string);

    function StartTransaction: IActiveRecordTransaction;
    property UserCode: string read GetUserCode write SetUserCode;
    property UserName: string read GetUserName write SetUserName;
  end;

  IActiveRecordDependenciaProjeto = interface
    ['{296ED48B-01D6-4DE0-B255-158396F28263}']
    function DatabaseDate(const AConnection: IActiveRecordConnection): TDateTime;
    function DatabaseNow(const AConnection: IActiveRecordConnection): TDateTime;
    function GetNewCtrl_Id(const ACtrlIDName: string; const AConnection: IActiveRecordConnection): Integer;
    function LimitadorCondicionalQuantidadeRegistros(AQuantidade: Integer; AIncluiAnd: Boolean): string;
    function LimitadorSeletivoQuantidadeRegistros(AQuantidade: Integer): string;
    function SQLData(const AData: TDateTime): string;
    function SQLNow: string;
  end;

  TFieldTypeMetadata = (arftDateTime, arftFloat, arftInteger, arftMoney, arftNS, arftVarchar, arftMemo, arftB01,
    arftColor, arftBinary);

  TTableMetadata = record
    Name: string;
    PrimaryKeyFields: string;
    DeletedField: string;
  end;

  TFieldMetadata = record
    Index: Integer;
    Name: string;
    FieldType: TFieldTypeMetadata;
    Length: Integer;
    Nullable: Boolean;
    Caption: string;
    Visible: Boolean;
    ReadOnly: Boolean;
    Commented: Boolean;
    Title: string;
    ColumnCharWidth: Integer;
  end;

  TFieldIndexes = array of Integer;

  TRelationshipType = (arrtManyToOne, arrtOneToMany, arrtOneToOne);

  TClassActiveRecord = class of TActiveRecord;

  IActiveRecordMetadata = interface; //foward

  TAdditionalConditions = array of string;

  TRelationshipMetadata = record
    Index: Integer;
    Name: string;
    Commented: Boolean;
    RelationshipType: TRelationshipType;
    ClassActiveRecord: TClassActiveRecord;
    Metadata: IActiveRecordMetadata;
    FromFields: string;
    ToFields: string;
    AdditionalToConditions: string;
  end;

  EActiveRecordConstraintField = class(EActiveRecord)
  private
    FTableMetadata: TTableMetadata;
    FFieldMetadata: TFieldMetadata;
  public
    constructor CreateMetadata(const Msg: string; ATableMetadata: TTableMetadata; AFieldMetadata: TFieldMetadata);
    property TableMetadata: TTableMetadata read FTableMetadata;
    property FieldMetadata: TFieldMetadata read FFieldMetadata;
  end;

  IActiveRecordMetadata = interface
    ['{4B7F0E1E-2F88-42EA-93FD-0C20E42CE7CD}']
    function FieldCount: Integer;
    function IndexOfName(const AName: string): Integer;
    function FieldMetadata(Index: Integer): TFieldMetadata;
    function FieldMetadataByName(const AName: string): TFieldMetadata;
    function RelationshipCount: Integer;
    function RelationshipMetadata(Index: Integer): TRelationshipMetadata;
    function TableMetadata: TTableMetadata;
  end;

  TBinary = array of Byte;

  //Tipos Nullable, Servem para armazenar campos do tipo null
  TNullableBoolean = record
    Value: Boolean;
    Null: Boolean;
  end;

  TNullableCurrency = record
    Value: Currency;
    Null: Boolean;
  end;

  TNullableDateTime = record
    Value: TDateTime;
    Null: Boolean;
  end;

  TNullableExtended = record
    Value: Extended;
    Null: Boolean;
  end;

  TNullableInteger = record
    Value: Integer;
    Null: Boolean;
  end;

  TNullableString = record
    Value: string;
    Null: Boolean;
  end;

  TNullableColor = record
    Value: TColor;
    Null: Boolean;
  end;

  TNullableBinary = record
    Value: TBinary;
    Null: Boolean;
  end;

  IActiveRecord = interface; //foward

  IActiveRecordAccess = interface
    ['{8C3D15D3-C4B5-4ADF-8CC1-2C35A4A0A605}']
    function GetActiveRecord: IActiveRecord;
    function GetAsString(Index: Integer): string;
    function GetValue(Index: Integer): Variant;
    procedure SetAsString(Index: Integer; const Value: string);
    procedure SetValue(Index: Integer; const Value: Variant);

    procedure Clear(Index: Integer);
    function DisplayText(Index: Integer): string;
    function IsNull(Index: Integer): Boolean;
    property ActiveRecord: IActiveRecord read GetActiveRecord;
    property AsString[Index: Integer]: string read GetAsString write SetAsString;
    property Value[Index: Integer]: Variant read GetValue write SetValue;
  end;

  IGetClassActiveRecord = interface
    ['{78D1D0C7-00CE-45B8-B50D-701B1D500A1B}']
    function ClassActiveRecord: TClassActiveRecord;
  end;

  IActiveRecordCallBackValidate = interface
    ['{D5CF141F-7AD6-404C-9F42-52852DF93D26}']
    procedure FieldInvalid(const ATableMetadata: TTableMetadata; const AFieldMetadata: TFieldMetadata;
      const AMessage: string);
  end;

  IActiveRecord = interface(IGetClassActiveRecord)
    ['{E916A2AD-953A-4076-8EDF-C35C99081AEB}']
    function GetConnection: IActiveRecordConnection;
    function GetDeleted: Boolean;
    function GetNovo: Boolean;

    function Access: IActiveRecordAccess;
    procedure CancelSavePoint;
    procedure MarkDeleted;
    procedure RollBack;
    procedure Save;
    function SavedPoint: Boolean;
    procedure SavePoint;
    procedure UndoMarkDeleted;
    procedure Validate(const AActiveRecordCallBackValidate: IActiveRecordCallBackValidate);
    property Connection: IActiveRecordConnection read GetConnection;
    property Deleted: Boolean read GetDeleted;
    property Novo: Boolean read GetNovo;
  end;

  IResultadoSQL = interface(IActiveRecord)
    ['{67D25056-60AD-4D90-BCF8-C1C556898CB1}']
    function GetMetadata: IActiveRecordMetadata;
    procedure SetMetadata(const AValue: IActiveRecordMetadata);

    property Metadata: IActiveRecordMetadata read GetMetadata write SetMetadata;
  end;

  IIteratorActiveRecord = interface(IGetClassActiveRecord)
    ['{D08ED476-5652-4000-AB1C-A47EBECD5A6E}']
    function Next: Boolean;
    function CurrentItemActiveRecord: IActiveRecord;
  end;

  ICollectionActiveRecord = interface(IGetClassActiveRecord)
    ['{712610D7-2C6F-4A57-BC7B-5191E55E7B00}']
    function GetAccess(Index: Integer): IActiveRecordAccess;
    function GetCapacity: Integer;
    function GetItemActiveRecord(Index: Integer): IActiveRecord;
    procedure SetCapacity(NewCapacity: Integer);

    function AddActiveRecord(const AActiveRecord: IActiveRecord): Integer;
    procedure Assign(const ACollectionActiveRecord: ICollectionActiveRecord); overload;
    procedure Assign(const AIteratorActiveRecord: IIteratorActiveRecord); overload;
    procedure CleanDeleted;
    procedure Clear;
    function Count: Integer;
    function CreateActiveRecord(const AConnection: IActiveRecordConnection): IActiveRecord;
    procedure Delete(Index: Integer);
    procedure DeleteIfNotContain(const AText: string; const AMetadata: IActiveRecordMetadata);
    procedure Exchange(Index1, Index2: Integer);
    function IndexContainString(const AFieldMetadata: TFieldMetadata; const AContainString: string;
      AAnsi: Boolean = False): Integer;
    procedure InsertActiveRecord(Index: Integer; const AActiveRecord: IActiveRecord);
    procedure RemoveActiveRecord(const AActiveRecord: IActiveRecord);
    procedure Sort(const AFieldMetadata: TFieldMetadata; AAnsi: Boolean = False);
    property Access[Index: Integer]: IActiveRecordAccess read GetAccess;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property ItemActiveRecord[Index: Integer]: IActiveRecord read GetItemActiveRecord;
  end;

  TClassCollectionActiveRecord = class of TCollectionActiveRecord;

  TCollectionActiveRecord = class(TInterfacedObject, IGetClassActiveRecord, ICollectionActiveRecord)
  private
    FList: IInterfaceList;
    FClassActiveRecord: TClassActiveRecord;
    procedure InternalSort(const AFieldMetadata: TFieldMetadata);
    procedure InternalSortAnsi(const AFieldMetadata: TFieldMetadata);
  protected
    property List: IInterfaceList read FList;
  protected
    { IGetClassActiveRecord }
    function ClassActiveRecord: TClassActiveRecord;
    { ICollectionActiveRecord }
    function AddActiveRecord(const AActiveRecord: IActiveRecord): Integer;
    procedure Assign(const ACollectionActiveRecord: ICollectionActiveRecord); overload;
    procedure Assign(const AIteratorActiveRecord: IIteratorActiveRecord); overload;
    procedure CleanDeleted;
    procedure Clear;
    function Count: Integer;
    function CreateActiveRecord(const AConnection: IActiveRecordConnection): IActiveRecord;
    procedure Delete(Index: Integer);
    procedure DeleteIfNotContain(const AText: string; const AMetadata: IActiveRecordMetadata);
    procedure Exchange(Index1, Index2: Integer);
    function GetAccess(Index: Integer): IActiveRecordAccess;
    function GetItemActiveRecord(Index: Integer): IActiveRecord;
    function GetCapacity: Integer;
    function IndexContainString(const AFieldMetadata: TFieldMetadata; const AContainString: string;
      AAnsi: Boolean = False): Integer;
    procedure InsertActiveRecord(Index: Integer; const AActiveRecord: IActiveRecord);
    procedure RemoveActiveRecord(const AActiveRecord: IActiveRecord);
    procedure SetCapacity(NewCapacity: Integer);
    procedure Sort(const AFieldMetadata: TFieldMetadata; AAnsi: Boolean = False);
  public
    constructor Create(AClassActiveRecord: TClassActiveRecord); virtual;
    constructor CreateFromCollection(const ACollectionActiveRecord: ICollectionActiveRecord);
    constructor CreateFromIterator(const AIteratorActiveRecord: IIteratorActiveRecord);
  end;

  TIteratorCollectionActiveRecordDecorator = class(TInterfacedObject, IGetClassActiveRecord, IIteratorActiveRecord)
  private
    FCollectionActiveRecord: ICollectionActiveRecord;
    FCurrent: Integer;
  protected
    constructor Create(const ACollectionActiveRecord: ICollectionActiveRecord);
  protected
    { IGetClassActiveRecord }
    function ClassActiveRecord: TClassActiveRecord;
    { IIteratorActiveRecord }
    function Next: Boolean;
    function CurrentItemActiveRecord: IActiveRecord;
  public
    class function Decore(const ACollectionActiveRecord: ICollectionActiveRecord): IIteratorActiveRecord;
  end;

  IActiveRecordQuery = interface(IIteratorActiveRecord)
    ['{FAAF0491-DAD0-4B53-99A1-DC17A20D57CE}']
    function FirstActiveRecord: IActiveRecord;
    procedure SetNextParameter(const Value: Integer); overload;
    procedure SetNextParameter(const Value: string); overload;
    procedure SetNextParameter(const Value: TNullableCurrency); overload;
    procedure SetNextParameter(const Value: TNullableDateTime); overload;
    procedure SetNextParameter(const Value: TNullableExtended); overload;
    procedure SetNextParameter(const Value: TNullableInteger); overload;
    procedure SetNextParameter(const Value: TNullableString); overload;
    procedure SetNextParameterB01(const Value: Boolean); overload;
    procedure SetNextParameterB01(const Value: TNullableBoolean); overload;
    procedure SetNextParameterCurrency(const Value: Currency);
    procedure SetNextParameterDateTime(const Value: TDateTime);
    procedure SetNextParameterExtended(const Value: Extended);
    procedure SetNextParameterMemo(const Value: string); overload;
    procedure SetNextParameterMemo(const Value: TNullableString); overload;
    procedure SetNextParameterNS(const Value: Boolean); overload;
    procedure SetNextParameterNS(const Value: TNullableBoolean); overload;
  end;

  IActiveRecordQueryFactory = interface
    ['{4ECED550-D207-443C-A67E-37822D45FFF7}']
    function CreateQuery(const AConnection: IActiveRecordConnection;
      AClassActiveRecord: TClassActiveRecord = nil): IActiveRecordQuery;
    function OrderBy(const AClause: string): IActiveRecordQueryFactory;
    function Top(ACount: Integer): IActiveRecordQueryFactory;
    function Where(const AClause: string): IActiveRecordQueryFactory;
  end;

  TIteratorActiveRecordQueryDecorator = class(TInterfacedObject, IGetClassActiveRecord, IIteratorActiveRecord)
  private
    FActiveRecordQuery: IActiveRecordQuery;
  protected
    constructor Create(const AActiveRecordQuery: IActiveRecordQuery);
  protected
    { IGetClassActiveRecord }
    function ClassActiveRecord: TClassActiveRecord;
    { IIteratorActiveRecord }
    function Next: Boolean;
    function CurrentItemActiveRecord: IActiveRecord;
  public
    class function Decore(const AActiveRecordQuery: IActiveRecordQuery): IIteratorActiveRecord;
  end;

  TActiveRecord = class(TInterfacedObject, IGetClassActiveRecord, IActiveRecord, IActiveRecordAccess)
  private
    FConnection: IActiveRecordConnection;
    FDeleted: Boolean;
    FNovo: Boolean;
    FSavePoint: TObjectList;
  protected
    procedure AfterLoad; virtual;
    procedure AfterSave; virtual;
    function AjustaVarchar(const Value: string; ATamanho: Integer): string; overload;
    function AjustaVarchar(const Value: TNullableString; ATamanho: Integer): TNullableString; overload;
    procedure BeforeSave; virtual;
    procedure CopyFrom(AActiveRecord: TActiveRecord); overload; virtual;
    function CreateItemRelationship(Index: Integer): TActiveRecord; virtual; abstract;
    procedure Persist; virtual; abstract;
    procedure SetRecordSet(const ARecordSet: _RecordSet; AOffset: Integer); virtual; abstract;
    function UserCode: string;
    function UserName: string;
    { IActiveRecordAccess }
    function GetActiveRecord: IActiveRecord;
    function GetAsString(Index: Integer): string; virtual;
    function GetValue(Index: Integer): Variant; virtual;
    procedure SetAsString(Index: Integer; const Value: string); virtual;
    procedure SetValue(Index: Integer; const Value: Variant); virtual;

    procedure Clear(Index: Integer); virtual;
    function DisplayText(Index: Integer): string; virtual;
    function IsNull(Index: Integer): Boolean; virtual;
    { IGetClassActiveRecord }
    function ClassActiveRecord: TClassActiveRecord;
    { IActiveRecord }
    function GetConnection: IActiveRecordConnection;
    function GetDeleted: Boolean;
    function GetNovo: Boolean;

    function Access: IActiveRecordAccess;
    procedure CancelSavePoint; virtual;
    procedure MarkDeleted;
    procedure RollBack; virtual;
    procedure Save;
    function SavedPoint: Boolean;
    procedure SavePoint;  virtual;
    procedure UndoMarkDeleted;
    procedure Validate(const AActiveRecordCallBackValidate: IActiveRecordCallBackValidate); virtual;
  public
    constructor Create(const AConnection: IActiveRecordConnection); virtual;
    destructor Destroy; override;
    class function BinaryToVariant(const AValue: TBinary): OleVariant;
    class function CheckVariant(const AValue: OleVariant): OleVariant;
    class function DatabaseDate(const AConnection: IActiveRecordConnection): TDateTime;
    class function DatabaseNow(const AConnection: IActiveRecordConnection): TDateTime;
    class function DefaultConnection: IActiveRecordConnection;
    class function EqualValues(const AValue1, AValue2: TNullableBoolean): Boolean; overload;
    class function EqualValues(const AValue1, AValue2: TNullableColor): Boolean; overload;
    class function EqualValues(const AValue1, AValue2: TNullableCurrency): Boolean; overload;
    class function EqualValues(const AValue1, AValue2: TNullableDateTime): Boolean; overload;
    class function EqualValues(const AValue1, AValue2: TNullableExtended): Boolean; overload;
    class function EqualValues(const AValue1, AValue2: TNullableInteger): Boolean; overload;
    class function EqualValues(const AValue1, AValue2: TNullableString): Boolean; overload;
    class function From: IActiveRecordQueryFactory;
    class function FromWithJoin(const ARelationshipIndexs: array of Integer): IActiveRecordQueryFactory;
    class function GUIDItem: TGUID; virtual; abstract;
    class function Metadata: IActiveRecordMetadata; virtual; abstract;
    class function NSToNullableBoolean(AValue: string): TNullableBoolean;
    class function Nullable(const AValue: Boolean; ANull: Boolean = False): TNullableBoolean; overload;
    class function Nullable(const AValue: Integer; ANull: Boolean = False): TNullableInteger; overload;
    class function Nullable(const AValue: string; ANull: Boolean = False): TNullableString; overload;
    class function NullableB01(const AValue: Integer; ANull: Boolean = False): TNullableBoolean;
    class function NullableColor(const AValue: TColor; ANull: Boolean = False): TNullableColor; overload;
    class function NullableCurrency(const AValue: Currency; ANull: Boolean = False): TNullableCurrency;
    class function NullableDateTime(const AValue: TDateTime; ANull: Boolean = False): TNullableDateTime;
    class function NullableExtended(const AValue: Extended; ANull: Boolean = False): TNullableExtended;
    class function NullableNS(const AValue: string; ANull: Boolean = False): TNullableBoolean;
    class function NullOrString(ANull: Boolean; const AString: string): string;
    class procedure SetFieldNullable(AField: TField; const AValue: TNullableColor); overload;
    class procedure SetFieldNullable(AField: TField; const AValue: TNullableCurrency); overload;
    class procedure SetFieldNullable(AField: TField; const AValue: TNullableDateTime); overload;
    class procedure SetFieldNullable(AField: TField; const AValue: TNullableExtended); overload;
    class procedure SetFieldNullable(AField: TField; const AValue: TNullableInteger); overload;
    class procedure SetFieldNullable(AField: TField; const AValue: TNullableString); overload;
    class procedure SetFieldNullableB01(AField: TField; const AValue: TNullableBoolean);
    class procedure SetFieldNullableMemo(AField: TField; const AValue: TNullableString);
    class procedure SetFieldNullableNS(AField: TField; const AValue: TNullableBoolean);
    class function StringToNullableColor(const AValue: string): TNullableColor;
    class function StringToNullableCurrency(const AValue: string): TNullableCurrency;
    class function StringToNullableDateTime(const AValue: string): TNullableDateTime;
    class function StringToNullableExtended(const AValue: string): TNullableExtended;
    class function StringToNullableInteger(const AValue: string): TNullableInteger;
    class function ToString(const AValue: TNullableColor): string; overload;
    class function ToString(const AValue: TNullableCurrency): string; overload;
    class function ToString(const AValue: TNullableDateTime): string; overload;
    class function ToString(const AValue: TNullableExtended): string; overload;
    class function ToString(const AValue: TNullableInteger): string; overload;
    class function ToString(const AValue: TNullableString): string; overload;
    class function ToStringNS(const AValue: TNullableBoolean): string; overload;
    class function ToVariant(const AValue: TNullableBoolean): Variant; overload;
    class function ToVariant(const AValue: TNullableColor): Variant; overload;
    class function ToVariant(const AValue: TNullableCurrency): Variant; overload;
    class function ToVariant(const AValue: TNullableDateTime): Variant; overload;
    class function ToVariant(const AValue: TNullableExtended): Variant; overload;
    class function ToVariant(const AValue: TNullableInteger): Variant; overload;
    class function ToVariant(const AValue: TNullableString): Variant; overload;
    class function ToVariantB01(const AValue: TNullableBoolean): Variant;
    class function ToVariantNS(const AValue: TNullableBoolean): Variant;
    class function ValidateString(const AValue: string; const AFieldMetadata: TFieldMetadata; out AMensagem: string): Boolean;
    class function VariantToBinary(const AValue: OleVariant): TBinary;
    class function VariantToNullableB01(const AValue: Variant): TNullableBoolean;
    class function VariantToNullableBoolean(const AValue: Variant): TNullableBoolean;
    class function VariantToNullableColor(const AValue: Variant): TNullableColor;
    class function VariantToNullableCurrency(const AValue: Variant): TNullableCurrency;
    class function VariantToNullableDateTime(const AValue: Variant): TNullableDateTime;
    class function VariantToNullableExtended(const AValue: Variant): TNullableExtended;
    class function VariantToNullableInteger(const AValue: Variant): TNullableInteger;
    class function VariantToNullableNS(const AValue: Variant): TNullableBoolean;
    class function VariantToNullableString(const AValue: Variant): TNullableString;
    class function ViewMetadata: IActiveRecordMetadata; virtual; abstract;
  end;

  TClassResultadoSQL = class of TResultadoSQL;

  IFieldMetadataWritable = interface
    ['{B3259A53-F81E-4E22-A412-EED8EF516891}']
    function SetCaption(const Value: string): IFieldMetadataWritable;
    function SetColumnCharWidth(Value: Integer): IFieldMetadataWritable;
    function SetCommented(Value: Boolean): IFieldMetadataWritable;
    function SetFieldMetadata(const Value: TFieldMetadata): IFieldMetadataWritable;
    function SetFieldType(Value: TFieldTypeMetadata): IFieldMetadataWritable;
    function SetLength(Value: Integer): IFieldMetadataWritable;
    function SetName(const Value: string): IFieldMetadataWritable;
    function SetNullable(Value: Boolean): IFieldMetadataWritable;
    function SetReadOnly(Value: Boolean): IFieldMetadataWritable;
    function SetTitle(Value: string): IFieldMetadataWritable;
    function SetVisible(Value: Boolean): IFieldMetadataWritable;
    procedure Write;
  end;

  IRelationshipMetadataWritable = interface
    ['{C68A232A-2657-447B-882E-935C94B279E2}']
    function SetName(const AValue: string): IRelationshipMetadataWritable;
    function SetCommented(AValue: Boolean): IRelationshipMetadataWritable;
    function SetRelationshipType(AValue: TRelationshipType): IRelationshipMetadataWritable;
    function SetClassActiveRecord(AValue: TClassActiveRecord): IRelationshipMetadataWritable;
    function SetMetadata(const AValue: IActiveRecordMetadata): IRelationshipMetadataWritable;
    function SetFromFields(const AValue: string): IRelationshipMetadataWritable;
    function SetToFields(const AValue: string): IRelationshipMetadataWritable;
    function SetAdditionalToConditions(const AValue: string): IRelationshipMetadataWritable;
    function WriteAndReturnIndex: Integer;
  end;

  IActiveRecordMetadataWritable = interface; //foward

  IFromMetadataDo = interface
    ['{FDEAA0FF-891D-40BD-80D5-EAEEE547224A}']
    function CopyFromTo_ResultadoSQL(AFieldIndexFrom, AFieldIndexTo: Integer): IFromMetadataDo;
    function CopyFromTo_ResultadoSQL_MantemNome(AFieldIndexFrom, AFieldIndexTo: Integer): IFromMetadataDo;
    function End_: IActiveRecordMetadataWritable;
  end;

  IActiveRecordMetadataWritable = interface(IActiveRecordMetadata)
    ['{E316A301-AEFA-43C0-8E34-27DE7FC6D736}']
    procedure AddFieldsMetadata(const AFieldsMetadata: array of TFieldMetadata);
    function ConfigFieldMetadata(AIndex: Integer): IFieldMetadataWritable; overload;
    function ConfigFieldMetadata(const AFieldName: string): IFieldMetadataWritable; overload;
    function ConfigNewFieldMetadata: IFieldMetadataWritable;
    function ConfigNewRelationshipMetadata: IRelationshipMetadataWritable;
    procedure CopyFieldFromTo_ResultadoSQL(const AFieldMetadata: TFieldMetadata; AIndexTo: Integer);
    procedure CopyFieldFromTo_ResultadoSQL_MantemNome(const AFieldMetadata: TFieldMetadata; AIndexTo: Integer);
    procedure CopyFrom(const AActiveRecordMetadata: IActiveRecordMetadata);
    function FromMetadataDo(const AActiveRecordMetadata: IActiveRecordMetadata): IFromMetadataDo;
    procedure SetFieldMetadata(Index: Integer; const Value: TFieldMetadata);
    procedure SetRelationshipMetadata(Index: Integer; const Value: TRelationshipMetadata);
    procedure SetTableMetadata(const Value: TTableMetadata);
    procedure SetVisibleFields(const AFieldIndexes: TFieldIndexes);
  end;

  TResultadoSQL = class(TActiveRecord, IResultadoSQL)
  private
    FMetadata: IActiveRecordMetadata;
    FCampos: array of Variant;
  protected
    class procedure AjustaMetadata(const AMetadata: IActiveRecordMetadataWritable); virtual;
    procedure Clear(Index: Integer); override;
    procedure CopyFrom(AActiveRecord: TActiveRecord); override;
    function CreateItemRelationship(Index: Integer): TActiveRecord; override;
    function DisplayText(Index: Integer): string; override;
    function GetAsString(Index: Integer): string; override;
    function GetValue(Index: Integer): Variant; override;
    function IsNull(Index: Integer): Boolean; override;
    procedure Persist; override;
    procedure SetAsString(Index: Integer; const Value: string); override;
    procedure SetRecordSet(const ARecordSet: _RecordSet; AOffset: Integer); override;
    procedure SetValue(Index: Integer; const Value: Variant); override;
    { IResultadoSQL }
    function GetMetadata: IActiveRecordMetadata;
    procedure SetMetadata(const AValue: IActiveRecordMetadata);
  public
    class function From: IActiveRecordQueryFactory;
    class function FromWithJoin(const ARelationshipIndexs: array of Integer): IActiveRecordQueryFactory;
    class function GUIDItem: TGUID; override;
    class function Metadata: IActiveRecordMetadata; override;
    class function Execute(const ACommandSQL: string; const AConnection: IActiveRecordConnection): IActiveRecordQuery;
    class function ViewMetadata: IActiveRecordMetadata; override;
  end;

  TActiveRecordMetadataWritable = class(TInterfacedObject, IActiveRecordMetadata, IActiveRecordMetadataWritable)
  private
    FFieldsMetadata: array of TFieldMetadata;
    FRelationshipMetadata: array of TRelationshipMetadata;
    FTableMetadata: TTableMetadata;
  protected
    { IActiveRecordMetadata }
    function FieldCount: Integer;
    function IndexOfName(const AName: string): Integer;
    function FieldMetadata(Index: Integer): TFieldMetadata;
    function FieldMetadataByName(const AName: string): TFieldMetadata;
    function RelationshipCount: Integer;
    function RelationshipMetadata(Index: Integer): TRelationshipMetadata;
    function TableMetadata: TTableMetadata;
    { IActiveRecordMetadataWritable }
    procedure AddFieldsMetadata(const AFieldsMetadata: array of TFieldMetadata);
    function ConfigFieldMetadata(AIndex: Integer): IFieldMetadataWritable; overload;
    function ConfigFieldMetadata(const AFieldName: string): IFieldMetadataWritable; overload;
    function ConfigNewFieldMetadata: IFieldMetadataWritable;
    function ConfigNewRelationshipMetadata: IRelationshipMetadataWritable;
    procedure CopyFieldFromTo_ResultadoSQL(const AFieldMetadata: TFieldMetadata; AIndexTo: Integer);
    procedure CopyFieldFromTo_ResultadoSQL_MantemNome(const AFieldMetadata: TFieldMetadata; AIndexTo: Integer);
    procedure CopyFrom(const AActiveRecordMetadata: IActiveRecordMetadata);
    function FromMetadataDo(const AActiveRecordMetadata: IActiveRecordMetadata): IFromMetadataDo;
    procedure SetFieldMetadata(Index: Integer; const Value: TFieldMetadata);
    procedure SetRelationshipMetadata(Index: Integer; const Value: TRelationshipMetadata);
    procedure SetTableMetadata(const Value: TTableMetadata);
    procedure SetVisibleFields(const AFieldIndexes: TFieldIndexes);
  end;

  TFieldMetadataWritable = class(TInterfacedObject, IFieldMetadataWritable)
  private
    FFieldMetadata: TFieldMetadata;
    FActiveRecordMetadataWritable: IActiveRecordMetadataWritable;
  protected
    { IFieldMetadataWritable }
    function SetCaption(const Value: string): IFieldMetadataWritable;
    function SetColumnCharWidth(Value: Integer): IFieldMetadataWritable;
    function SetCommented(Value: Boolean): IFieldMetadataWritable;
    function SetFieldMetadata(const Value: TFieldMetadata): IFieldMetadataWritable;
    function SetFieldType(Value: TFieldTypeMetadata): IFieldMetadataWritable;
    function SetLength(Value: Integer): IFieldMetadataWritable;
    function SetName(const Value: string): IFieldMetadataWritable;
    function SetNullable(Value: Boolean): IFieldMetadataWritable;
    function SetReadOnly(Value: Boolean): IFieldMetadataWritable;
    function SetTitle(Value: string): IFieldMetadataWritable;
    function SetVisible(Value: Boolean): IFieldMetadataWritable;
    procedure Write;
  public
    constructor Create(const AActiveRecordMetadataWritable: IActiveRecordMetadataWritable;
      const AFieldMetadata: TFieldMetadata);
    constructor New(const AActiveRecordMetadataWritable: IActiveRecordMetadataWritable);
  end;

  TRelationshipMetadataWritable = class(TInterfacedObject, IRelationshipMetadataWritable)
  private
    FRelationshipMetadata: TRelationshipMetadata;
    FActiveRecordMetadataWritable: IActiveRecordMetadataWritable;
  protected
    { IRelationshipMetadataWritable }
    function SetName(const AValue: string): IRelationshipMetadataWritable;
    function SetCommented(AValue: Boolean): IRelationshipMetadataWritable;
    function SetRelationshipType(AValue: TRelationshipType): IRelationshipMetadataWritable;
    function SetClassActiveRecord(AValue: TClassActiveRecord): IRelationshipMetadataWritable;
    function SetMetadata(const AValue: IActiveRecordMetadata): IRelationshipMetadataWritable;
    function SetFromFields(const AValue: string): IRelationshipMetadataWritable;
    function SetToFields(const AValue: string): IRelationshipMetadataWritable;
    function SetAdditionalToConditions(const AValue: string): IRelationshipMetadataWritable;
    function WriteAndReturnIndex: Integer;
  public
    constructor Create(const AActiveRecordMetadataWritable: IActiveRecordMetadataWritable;
      const ARelationshipMetadata: TRelationshipMetadata);
    constructor New(const AActiveRecordMetadataWritable: IActiveRecordMetadataWritable);
  end;

  TFromMetadataDo = class(TInterfacedObject, IFromMetadataDo)
  private
    FMetadataFrom: IActiveRecordMetadata;
    FMetadataTo: IActiveRecordMetadataWritable;
  protected
    { IFromMetadataDo }
    function CopyFromTo_ResultadoSQL(AFieldIndexFrom, AFieldIndexTo: Integer): IFromMetadataDo;
    function CopyFromTo_ResultadoSQL_MantemNome(AFieldIndexFrom, AFieldIndexTo: Integer): IFromMetadataDo;
    function End_: IActiveRecordMetadataWritable;
  public
    constructor Create(const AMetadataFrom: IActiveRecordMetadata; const AMetadataTo: IActiveRecordMetadataWritable);
  end;

  IValidatorField = interface
    ['{28446AB5-5077-42E2-AFD9-FAC5ABBCA5B6}']
    function ForField(AFieldIndex: Integer): IValidatorField;
    function IsInvalid: Boolean;
    function IsValid: Boolean;
    function RaiseInvalid(const AMessage: string = ''): IValidatorField;
    function Required(AIsRequired: Boolean): IValidatorField;
    function VerifiedFalse(ACondition: Boolean; const AMessage: string = ''): IValidatorField;
    function VerifiedTrue(ACondition: Boolean; const AMessage: string = ''): IValidatorField;
  end;

  TValidatorField = class(TInterfacedObject, IValidatorField)
  private
    FActiveRecordMetadata: IActiveRecordMetadata;
    FActiveRecordCallBackValidate: IActiveRecordCallBackValidate;
    FIndex: Integer;
    FIsInvalid: Boolean;
  protected
    { IValidatorField }
    function ForField(AFieldIndex: Integer): IValidatorField;
    function IsInvalid: Boolean;
    function IsValid: Boolean;
    function RaiseInvalid(const AMessage: string = ''): IValidatorField;
    function Required(AIsRequired: Boolean): IValidatorField;
    function VerifiedFalse(ACondition: Boolean; const AMessage: string = ''): IValidatorField;
    function VerifiedTrue(ACondition: Boolean; const AMessage: string = ''): IValidatorField;
  public
    constructor Create(const AActiveRecordMetadata: IActiveRecordMetadata;
      const AActiveRecordCallBackValidate: IActiveRecordCallBackValidate);
  end;

  IActiveRecordTotalizador = interface
    ['{466F63CC-6868-4F2A-86CE-AF1D81B4FADF}']
    function GetFieldIndex: Integer;
    function GetFormatDisplayText: string;
    procedure SetFieldIndex(AValue: Integer);
    procedure SetFormatDisplayText(const AValue: string);

    function DisplayText: string;
    procedure Limpa;
    procedure Processa(const AAccess: IActiveRecordAccess);
    function Total: Extended;
    property FieldIndex: Integer read GetFieldIndex write SetFieldIndex;
    property FormatDisplayText: string read GetFormatDisplayText write SetFormatDisplayText;
  end;

  IActiveRecordTotalizacao = interface
    ['{93136E3A-D281-445C-892D-DB87BCBC637C}']
    function GetTotalizador(AFieldIndex: Integer): IActiveRecordTotalizador;

    function Somar(AFieldIndex: Integer; const AFormatDisplayText: string = ',0.00'): IActiveRecordTotalizacao;
    function MediaPonderada(AFieldIndex, AFieldIndexDePonderacao: Integer; const AFormatDisplayText: string = ',0.00'): IActiveRecordTotalizacao;

    function AdicionaTotalizador(const ATotalizador: IActiveRecordTotalizador): IActiveRecordTotalizacao;
    function DisplayText(AFieldIndex: Integer): string;
    procedure Limpa;
    procedure Processa(const AAccess: IActiveRecordAccess);
    function Tem(AFieldIndex: Integer): Boolean;
    function Total(AFieldIndex: Integer): Extended;
    property Totalizador[AFieldIndex: Integer]: IActiveRecordTotalizador read GetTotalizador; default;
  end;

  TActiveRecordTotalizadorBase = class(TInterfacedObject, IActiveRecordTotalizador)
  private
    FFieldIndex: Integer;
    FFormatDisplayText: string;
  protected
    { IActiveRecordTotalizador }
    function GetFieldIndex: Integer;
    function GetFormatDisplayText: string;
    procedure SetFieldIndex(AValue: Integer);
    procedure SetFormatDisplayText(const AValue: string);

    function DisplayText: string; virtual; abstract;
    procedure Limpa; virtual; abstract;
    procedure Processa(const AAccess: IActiveRecordAccess); virtual; abstract;
    function Total: Extended; virtual; abstract;
  public
    constructor Create(AFieldIndex: Integer; const AFormatDisplayText: string);
  end;

  TActiveRecordTotalizadorSoma = class(TActiveRecordTotalizadorBase)
  private
    FSoma: Extended;
  protected
    function DisplayText: string; override;
    procedure Limpa; override;
    procedure Processa(const AAccess: IActiveRecordAccess); override;
    function Total: Extended; override;
  end;

  TActiveRecordTotalizadorMediaPonderada = class(TActiveRecordTotalizadorBase)
  private
    FSomaXPonderada: Extended;
    FPonderada: Extended;
    FFieldIndexDePonderacao: Integer;
  protected
    function DisplayText: string; override;
    procedure Limpa; override;
    procedure Processa(const AAccess: IActiveRecordAccess); override;
    function Total: Extended; override;
  public
    constructor Create(AFieldIndex, AFieldIndexDePonderacao: Integer; const AFormatDisplayText: string);
  end;

  TActiveRecordTotalizacao = class(TSLObject, IActiveRecordTotalizacao)
  private
    FTotalizadores: IInterfaceList;
  protected
    { IActiveRecordTotalizacao }
    function GetTotalizador(AFieldIndex: Integer): IActiveRecordTotalizador;

    function Somar(AFieldIndex: Integer; const AFormatDisplayText: string = ',0.00'): IActiveRecordTotalizacao;
    function MediaPonderada(AFieldIndex, AFieldIndexDePonderacao: Integer; const AFormatDisplayText: string = ',0.00'): IActiveRecordTotalizacao;

    function AdicionaTotalizador(const ATotalizador: IActiveRecordTotalizador): IActiveRecordTotalizacao;
    function DisplayText(AFieldIndex: Integer): string;
    procedure Limpa;
    procedure Processa(const AAccess: IActiveRecordAccess);
    function Tem(AFieldIndex: Integer): Boolean;
    function Total(AFieldIndex: Integer): Extended;
  public
    constructor Create; override;
  end;

  IActiveRecordService = interface
    ['{C4E2AF5F-FC84-4276-B8E2-EAF4AD04AD10}']
    procedure Delete(const AActiveRecord: IActiveRecord);
    procedure Save(const AActiveRecord: IActiveRecord);
  end;

  TActiveRecordService = class(TSLObject, IActiveRecordService)
  protected
    { IActiveRecordService }
    procedure Delete(const AActiveRecord: IActiveRecord); virtual;
    procedure Save(const AActiveRecord: IActiveRecord); virtual;
  end;

  TBinaryUtil = class(TObject)
  public
    class function LoadFromFile(const AFileName: TFileName): TBinary;
    class function LoadFromStream(AStream: TStream): TBinary;
    class procedure SaveToFile(const AValue: TBinary; const AFileName: TFileName);
    class procedure SaveToStream(const AValue: TBinary; AStream: TStream);
  end;

  IActiveRecordConnectionADO = interface(IActiveRecordConnection)
    ['{FC6C78F6-911B-4ED5-9D1F-C253CF4F287D}']
    function GetADOConnection: _Connection;

    property ADOConnection: _Connection read GetADOConnection;
  end;

  TActiveRecordTransactionADO = class(TInterfacedObject, IActiveRecordTransaction)
  private
    FConnection: IActiveRecordConnectionADO;
    FComitado: Boolean;
    procedure StartTransaction;
  protected
    { IActiveRecordTransaction }
    procedure Commit;
    procedure RollBack;
  public
    constructor Create(const AConnectionADO: IActiveRecordConnectionADO);
    destructor Destroy; override;
  end;

  TActiveRecordConnectionADO = class(TInterfacedObject, IActiveRecordConnection, IActiveRecordConnectionADO)
  private
    FADOConnection: _Connection;
    FUserCode, FUserName: string;
  protected
    { IActiveRecordConnection }
    function GetUserCode: string;
    function GetUserName: string;
    procedure SetUserCode(const AValue: string);
    procedure SetUserName(const AValue: string);

    function StartTransaction: IActiveRecordTransaction;
    { IActiveRecordConnectionADO }
    function GetADOConnection: _Connection;
  public
    constructor Create(const AConnectionString: string);
    destructor Destroy; override;
  end;

  TActiveRecordQueryFactoryADOBase = class(TInterfacedObject, IGetClassActiveRecord, IActiveRecordQueryFactory)
  private
    FClassActiveRecord: TClassActiveRecord;
    FCommandSQL: string;
    FOrderBy: string;
    FTop: Integer;
    FWhere: string;
    procedure Reset;
  protected
    { IGetClassActiveRecord }
    function ClassActiveRecord: TClassActiveRecord;
    { IActiveRecordQueryFactory }
    function CreateQuery(const AConnection: IActiveRecordConnection;
      AClassActiveRecord: TClassActiveRecord = nil): IActiveRecordQuery; virtual; abstract;
    function OrderBy(const AClause: string): IActiveRecordQueryFactory;
    function Top(ACount: Integer): IActiveRecordQueryFactory;
    function Where(const AClause: string): IActiveRecordQueryFactory;
  public
    constructor Create(AClassActiveRecord: TClassActiveRecord);
  end;

  TActiveRecordQueryFactoryADO = class(TActiveRecordQueryFactoryADOBase)
  private
    procedure PrepareCommandSQL;
  protected
    function CreateQuery(const AConnection: IActiveRecordConnection;
      AClassActiveRecord: TClassActiveRecord = nil): IActiveRecordQuery; override;
  end;

  TRelationshipsArray = array of TRelationshipMetadata;
  TOffsetsArray = array of Integer;
  TPrimaryKeyLastFieldIndexArray = array of Integer;

  TActiveRecordQueryFactoryADOJoinTable = class(TActiveRecordQueryFactoryADOBase)
  private
    FRelationships: TRelationshipsArray;
    FOffsets: TOffsetsArray;
    FPrimaryKeyLastFieldIndex: TPrimaryKeyLastFieldIndexArray;
    procedure PrepareCommandSQL;
  protected
    function CreateQuery(const AConnection: IActiveRecordConnection;
      AClassActiveRecord: TClassActiveRecord = nil): IActiveRecordQuery; override;
  public
    constructor Create(AClassActiveRecord: TClassActiveRecord; const ARelationshipIndexs: array of Integer);
  end;

  TActiveRecordQueryADOBase = class(TInterfacedObject, IIteratorActiveRecord, IGetClassActiveRecord, IActiveRecordQuery)
  private
    FClassActiveRecord: TClassActiveRecord;
    FConnection: IActiveRecordConnectionADO;
    FCommand: _Command;
    FCurrentItemActiveRecord: IActiveRecord;
    FParameterPosition: Integer;
    FRecordSet: _Recordset;
    function CreateRecordSet: _RecordSet;
    function PrepareParameter: Integer;
    procedure SetParameter(AType: DataTypeEnum; ASize: Integer; AValue: OleVariant);
  protected
    { IGetClassActiveRecord }
    function ClassActiveRecord: TClassActiveRecord;
    { IIteratorActiveRecord }
    function Next: Boolean; virtual; abstract;
    function CurrentItemActiveRecord: IActiveRecord;
    { IActiveRecordQuery }
    function FirstActiveRecord: IActiveRecord;
    procedure SetNextParameter(const Value: Integer); overload;
    procedure SetNextParameter(const Value: string); overload;
    procedure SetNextParameter(const Value: TNullableCurrency); overload;
    procedure SetNextParameter(const Value: TNullableDateTime); overload;
    procedure SetNextParameter(const Value: TNullableExtended); overload;
    procedure SetNextParameter(const Value: TNullableInteger); overload;
    procedure SetNextParameter(const Value: TNullableString); overload;
    procedure SetNextParameterB01(const Value: Boolean); overload;
    procedure SetNextParameterB01(const Value: TNullableBoolean); overload;
    procedure SetNextParameterCurrency(const Value: Currency);
    procedure SetNextParameterDateTime(const Value: TDateTime);
    procedure SetNextParameterExtended(const Value: Extended);
    procedure SetNextParameterMemo(const Value: string); overload;
    procedure SetNextParameterMemo(const Value: TNullableString); overload;
    procedure SetNextParameterNS(const Value: Boolean); overload;
    procedure SetNextParameterNS(const Value: TNullableBoolean); overload;
  public
    constructor Create(AClassActiveRecord: TClassActiveRecord; const ACommandSQL: string;
      const AConnection: IActiveRecordConnection);
  end;

  TActiveRecordQueryADO = class(TActiveRecordQueryADOBase)
  protected
    function Next: Boolean; override;
  end;

  TResultadoSQLQueryADO = class(TActiveRecordQueryADOBase)
  private
    FActiveRecordMetadataWritable: IActiveRecordMetadataWritable;
  protected
    function Next: Boolean; override;
    procedure DescobreMetadata(const LActiveRecordMetadataWritable: IActiveRecordMetadataWritable;
      const AADORecordSet: _RecordSet); virtual;
  public
    constructor Create(AClassActiveRecord: TClassActiveRecord; const ACommandSQL: string;
      const AConnection: IActiveRecordConnection; const LActiveRecordMetadataWritable: IActiveRecordMetadataWritable);
  end;

  TActiveRecordQueryADOJoinTable = class(TActiveRecordQueryADOBase)
  private
    FRelationships: TRelationshipsArray;
    FOffsets: TOffsetsArray;
    FPrimaryKeyLastFieldIndex: TPrimaryKeyLastFieldIndexArray;
  protected
    function Next: Boolean; override;
  public
    constructor Create(AClassActiveRecord: TClassActiveRecord; const ACommandSQL: string;
      const AConnection: IActiveRecordConnection; const ARelationships: TRelationshipsArray;
      const AOffsets: TOffsetsArray; const APrimaryKeyLastFieldIndex: TPrimaryKeyLastFieldIndexArray);
  end;

  TActiveRecordSingletonADO = class(TSingleton)
  private
    FCommand: _Command;
    FConnection: IActiveRecordConnection;
  protected
    procedure DefineParameters; virtual; abstract;
    function Execute: Integer;
    function ExecuteReturnAutoInc: Integer;
    procedure InitializePrivate; override;
    function GetCommandSQL: string; virtual; abstract;
    function GetNewCtrl_ID(const ACtrlIDName: string): Integer;
    procedure Persist(AActiveRecord: TActiveRecord);
    procedure SetConnection(const AConnection: IActiveRecordConnection);
    function SQLNow: string;
    property Command: _Command read FCommand;
  end;

const
  NullBoolean: TNullableBoolean = (Value: False; Null: True);
  NullCurrency: TNullableCurrency = (Value: 0; Null: True);
  NullDateTime: TNullableDateTime = (Value: 0; Null: True);
  NullExtended: TNullableExtended = (Value: 0; Null: True);
  NullInteger: TNullableInteger = (Value: 0; Null: True);
  NullString: TNullableString = (Value: ''; Null: True);
  NullColor: TNullableColor = (Value: clBtnFace; Null: True);
  NullBinary: TNullableBinary = (Value: nil; Null: True);
  NS: array [Boolean] of Char = 'NS';
  NaoSim: array [Boolean] of string = ('Não', 'Sim');
  ColumnCharWidthForDateTime = 10;
  ColumnCharWidthForFloat = 8;
  ColumnCharWidthForInteger = 6;
  ColumnCharWidthForMoney = 13;
  ColumnCharWidthForNS = 3;
  ColumnCharWidthForMemo = 30;
  ColumnCharWidthForB01 = ColumnCharWidthForNS;
  ColumnCharWidthForColor = ColumnCharWidthForInteger;
  ColumnCharWidthForBinary = 10;
  EquivalenciaFieldTypeEVariant: array [TFieldTypeMetadata] of Integer = (
    varDate, //arftDateTime
    varDouble, //arftFloat
    varInteger, //arftInteger
    varCurrency, //arftMoney
    varBoolean, //arftNS
    varOleStr, //arftVarchar
    varOleStr, //arftMemo
    varBoolean, //arftB01
    varInteger, //arftColor
    varArray + varByte //arftBinary
    );
    
resourcestring
  rsEObrigatorioOPreenchimentoDoCampo = 'É obrigatório o preenchimento do campo %s.';
  rsNaoExisteAcessoParaOIndice = 'Não existe acesso para o índice %d.';
  rsAcessoSomenteLeitura = 'Acesso somente leitura.';
  rsNaoImplementado = 'Não implementado.';
  rsTextoBinario = '(Arquivo)';

var
  ActiveRecordDependenciaProjeto: IActiveRecordDependenciaProjeto;

procedure SetDefaultConnection(const Value: IActiveRecordConnection);

implementation

var
  GDefaultConnection: IActiveRecordConnection;

procedure SetDefaultConnection(const Value: IActiveRecordConnection);
begin
  GDefaultConnection := Value;
end;

type
  TExceptionCallBackValidate = class(TInterfacedObject, IActiveRecordCallBackValidate)
  protected
    { IActiveRecordCallBackValidate }
    procedure FieldInvalid(const ATableMetadata: TTableMetadata; const AFieldMetadata: TFieldMetadata;
      const AMessage: string);
  end;

{ TExceptionCallBackValidate }

procedure TExceptionCallBackValidate.FieldInvalid(const ATableMetadata: TTableMetadata;
  const AFieldMetadata: TFieldMetadata; const AMessage: string);
begin
  raise EActiveRecordConstraintField.CreateMetadata(AMessage, ATableMetadata, AFieldMetadata);
end;

{ EActiveRecordConstraintField }

constructor EActiveRecordConstraintField.CreateMetadata(const Msg: string;
  ATableMetadata: TTableMetadata; AFieldMetadata: TFieldMetadata);
begin
  Create(Msg);
  FTableMetadata := ATableMetadata;
  FFieldMetadata := AFieldMetadata;
end;

{ TCollectionActiveRecord }

function TCollectionActiveRecord.AddActiveRecord(const AActiveRecord: IActiveRecord): Integer;
var
  LTemp: IUnknown;
begin
  Assert(Supports(AActiveRecord, FClassActiveRecord.GUIDItem, LTemp), 'Não pode ser esta interface');
  Result := List.Add(AActiveRecord);
end;

procedure TCollectionActiveRecord.Assign(const ACollectionActiveRecord: ICollectionActiveRecord);
begin
  Assign(TIteratorCollectionActiveRecordDecorator.Decore(ACollectionActiveRecord));
end;

procedure TCollectionActiveRecord.Assign(const AIteratorActiveRecord: IIteratorActiveRecord);
begin
  Clear;
  while AIteratorActiveRecord.Next do
    AddActiveRecord(AIteratorActiveRecord.CurrentItemActiveRecord);
end;

function TCollectionActiveRecord.ClassActiveRecord: TClassActiveRecord;
begin
  Result := FClassActiveRecord;
end;

procedure TCollectionActiveRecord.CleanDeleted;
var
  laco: Integer;
begin
  for laco := Count - 1 downto 0 do
    if (FList[laco] as IActiveRecord).Deleted then
      FList.Delete(laco);
end;

procedure TCollectionActiveRecord.Clear;
begin
  FList.Clear;
end;

function TCollectionActiveRecord.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TCollectionActiveRecord.Create(AClassActiveRecord: TClassActiveRecord);
begin
  inherited Create;
  FClassActiveRecord := AClassActiveRecord;
  FList := TInterfaceList.Create;
end;

constructor TCollectionActiveRecord.CreateFromCollection(const ACollectionActiveRecord: ICollectionActiveRecord);
begin
  Create(ACollectionActiveRecord.ClassActiveRecord);
  Assign(ACollectionActiveRecord);
end;

constructor TCollectionActiveRecord.CreateFromIterator(const AIteratorActiveRecord: IIteratorActiveRecord);
begin
  Create(AIteratorActiveRecord.ClassActiveRecord);
  Assign(AIteratorActiveRecord);
end;

function TCollectionActiveRecord.CreateActiveRecord(const AConnection: IActiveRecordConnection): IActiveRecord;
begin
  Result := FClassActiveRecord.Create(AConnection);
end;

procedure TCollectionActiveRecord.Delete(Index: Integer);
begin
  FList.Delete(Index);
end;

procedure TCollectionActiveRecord.DeleteIfNotContain(const AText: string; const AMetadata: IActiveRecordMetadata);
var
  laco, laco2: Integer;
  LEncontrou: Boolean;
  LFieldMetadata: TFieldMetadata;
  LText: string;
begin
  if AText <> '' then
  begin
    LText := AnsiUpperCase(AText);
    for laco := Count - 1 downto 0 do
    begin
      LEncontrou := False;
      for laco2 := 0 to AMetadata.FieldCount - 1 do
      begin
        LFieldMetadata := AMetadata.FieldMetadata(laco2);
        if LFieldMetadata.Visible and (not LFieldMetadata.Commented) and (AnsiPos(LText,
          AnsiUpperCase(GetAccess(laco).DisplayText(LFieldMetadata.Index))) > 0) then
        begin
          LEncontrou := True;
          Break;
        end;
      end;
      if not LEncontrou then
        Delete(laco);
    end;
  end;
end;

procedure TCollectionActiveRecord.Exchange(Index1, Index2: Integer);
begin
  FList.Exchange(Index1, Index2);
end;

function TCollectionActiveRecord.GetAccess(Index: Integer): IActiveRecordAccess;
begin
  Result := GetItemActiveRecord(Index).Access;
end;

function TCollectionActiveRecord.GetCapacity: Integer;
begin
  Result := FList.Capacity;
end;

function TCollectionActiveRecord.GetItemActiveRecord(Index: Integer): IActiveRecord;
begin
  Result := FList[Index] as IActiveRecord;
end;

function TCollectionActiveRecord.IndexContainString(const AFieldMetadata: TFieldMetadata; const AContainString: string;
  AAnsi: Boolean): Integer;
var
  laco: Integer;
  LContainString: string;
begin
  Result := -1;
  if AAnsi then
  begin
    LContainString := AnsiUpperCase(AContainString);
    for laco := 0 to Count - 1 do
      if Pos(LContainString, AnsiUpperCase(GetAccess(laco).DisplayText(AFieldMetadata.Index))) > 0 then
      begin
        Result := laco;
        Break;
      end;
  end
  else
  begin
    for laco := 0 to Count - 1 do
      if Pos(AContainString, GetAccess(laco).DisplayText(AFieldMetadata.Index)) > 0 then
      begin
        Result := laco;
        Break;
      end;
  end;
end;

procedure TCollectionActiveRecord.InternalSort(const AFieldMetadata: TFieldMetadata);

  procedure QuickSort(iLo, iHi: Integer);
  var
    Lo, Hi: Integer;
    Mid: Variant;
  begin
    Lo := iLo;
    Hi := iHi;
    Mid := GetAccess((Lo + Hi) div 2).Value[AFieldMetadata.Index];
    repeat
      while GetAccess(Lo).Value[AFieldMetadata.Index] < Mid do
        Inc(Lo);
      while GetAccess(Hi).Value[AFieldMetadata.Index] > Mid do
        Dec(Hi);
      if Lo <= Hi then
      begin
        Exchange(Lo, Hi);
        Inc(Lo);
        Dec(Hi);
      end;
    until Lo > Hi;
    if Hi > iLo then
      QuickSort(iLo, Hi);
    if Lo < iHi then
      QuickSort(Lo, iHi);
  end;

begin
  if Count > 0 then
    QuickSort(0, Count - 1);
end;

procedure TCollectionActiveRecord.InternalSortAnsi(const AFieldMetadata: TFieldMetadata);

  procedure QuickSort(iLo, iHi: Integer);
  var
    Lo, Hi: Integer;
    Mid: string;
  begin
    Lo := iLo;
    Hi := iHi;
    Mid := GetAccess((Lo + Hi) div 2).AsString[AFieldMetadata.Index];
    repeat
      while AnsiCompareStr(GetAccess(Lo).AsString[AFieldMetadata.Index], Mid) = -1 do
        Inc(Lo);
      while AnsiCompareStr(GetAccess(Hi).AsString[AFieldMetadata.Index], Mid) = 1 do
        Dec(Hi);
      if Lo <= Hi then
      begin
        Exchange(Lo, Hi);
        Inc(Lo);
        Dec(Hi);
      end;
    until Lo > Hi;
    if Hi > iLo then
      QuickSort(iLo, Hi);
    if Lo < iHi then
      QuickSort(Lo, iHi);
  end;

begin
  if Count > 0 then
    QuickSort(0, Count - 1);
end;

procedure TCollectionActiveRecord.SetCapacity(NewCapacity: Integer);
begin
  FList.Capacity := NewCapacity;
end;

procedure TCollectionActiveRecord.Sort(const AFieldMetadata: TFieldMetadata; AAnsi: Boolean);
begin
  if AAnsi then
    InternalSortAnsi(AFieldMetadata)
  else
    InternalSort(AFieldMetadata);
end;

procedure TCollectionActiveRecord.InsertActiveRecord(Index: Integer; const AActiveRecord: IActiveRecord);
var
  LTemp: IUnknown;
begin
  Assert(Supports(AActiveRecord, FClassActiveRecord.GUIDItem, LTemp), 'Não pode ser esta interface');
  List.Insert(Index, AActiveRecord);
end;

procedure TCollectionActiveRecord.RemoveActiveRecord(const AActiveRecord: IActiveRecord);
begin
  FList.Remove(AActiveRecord);
end;

{ TIteratorCollectionActiveRecordDecorator }

function TIteratorCollectionActiveRecordDecorator.ClassActiveRecord: TClassActiveRecord;
begin
  Result := FCollectionActiveRecord.ClassActiveRecord;
end;

constructor TIteratorCollectionActiveRecordDecorator.Create(const ACollectionActiveRecord: ICollectionActiveRecord);
begin
  inherited Create;
  FCollectionActiveRecord := ACollectionActiveRecord;
  FCurrent := -1;
end;

function TIteratorCollectionActiveRecordDecorator.CurrentItemActiveRecord: IActiveRecord;
begin
  Assert(FCurrent >= 0, 'Next não foi chamado');
  Assert(FCurrent < FCollectionActiveRecord.Count, 'Atingiu fim do iterator');
  Result := FCollectionActiveRecord.ItemActiveRecord[FCurrent];
end;

class function TIteratorCollectionActiveRecordDecorator.Decore(
  const ACollectionActiveRecord: ICollectionActiveRecord): IIteratorActiveRecord;
begin
  Result := Create(ACollectionActiveRecord);
end;

function TIteratorCollectionActiveRecordDecorator.Next: Boolean;
begin
  Inc(FCurrent);
  Result := FCurrent < FCollectionActiveRecord.Count;
end;

{ TIteratorActiveRecordQueryDecorator }

function TIteratorActiveRecordQueryDecorator.ClassActiveRecord: TClassActiveRecord;
begin
  Result := FActiveRecordQuery.ClassActiveRecord;
end;

constructor TIteratorActiveRecordQueryDecorator.Create(const AActiveRecordQuery: IActiveRecordQuery);
begin
  FActiveRecordQuery := AActiveRecordQuery;
end;

function TIteratorActiveRecordQueryDecorator.CurrentItemActiveRecord: IActiveRecord;
begin
  Result := FActiveRecordQuery.CurrentItemActiveRecord;
end;

class function TIteratorActiveRecordQueryDecorator.Decore(
  const AActiveRecordQuery: IActiveRecordQuery): IIteratorActiveRecord;
begin
  Result := Create(AActiveRecordQuery);
end;

function TIteratorActiveRecordQueryDecorator.Next: Boolean;
begin
  Result := FActiveRecordQuery.Next;
end;

{ TActiveRecord }

function TActiveRecord.Access: IActiveRecordAccess;
begin
  Result := Self;
end;

procedure TActiveRecord.AfterLoad;
begin
  FNovo := False;
end;

procedure TActiveRecord.AfterSave;
begin
  FNovo := False;
end;

function TActiveRecord.AjustaVarchar(const Value: TNullableString; ATamanho: Integer): TNullableString;
begin
  Result := Nullable(Copy(Value.Value, 1, ATamanho), Value.Null);
end;

function TActiveRecord.AjustaVarchar(const Value: string; ATamanho: Integer): string;
begin
  Result := Copy(Value, 1, ATamanho);
end;

procedure TActiveRecord.BeforeSave;
var
  LCallBack: IActiveRecordCallBackValidate;
begin
  LCallBack := TExceptionCallBackValidate.Create;
  Validate(LCallBack);
end;

class function TActiveRecord.BinaryToVariant(const AValue: TBinary): OleVariant;
var
  LSize: Integer;
  PResult: Pointer;
begin
  LSize := Length(AValue);
  Result := VarArrayCreate([0, LSize - 1], varByte);
  PResult := VarArrayLock(Result);
  try
    Move(AValue[0], PResult^, LSize);
  finally
    VarArrayUnlock(Result);
  end;
end;

procedure TActiveRecord.CancelSavePoint;
begin
  if Assigned(FSavePoint) and (FSavePoint.Count > 0) then
  begin
    FSavePoint.Delete(FSavePoint.Count - 1);
    if FSavePoint.Count = 0 then
      FreeAndNil(FSavePoint);
  end;
end;

function TActiveRecord.ClassActiveRecord: TClassActiveRecord;
begin
  Result := TClassActiveRecord(ClassType);
end;

procedure TActiveRecord.Clear(Index: Integer);
begin
  raise EActiveRecord.CreateFmt('Não existe acesso ou o campo não tem valor padrão ou é somente leitura para o índice %d.', [Index]);
end;

procedure TActiveRecord.CopyFrom(AActiveRecord: TActiveRecord);
begin
  FDeleted := AActiveRecord.FDeleted;
  FNovo := AActiveRecord.FNovo;
end;

constructor TActiveRecord.Create(const AConnection: IActiveRecordConnection);
begin
  inherited Create;
  FNovo := True;
  FConnection := AConnection;
end;

class function TActiveRecord.DatabaseDate(const AConnection: IActiveRecordConnection): TDateTime;
begin
  Result := ActiveRecordDependenciaProjeto.DatabaseDate(AConnection);
end;

class function TActiveRecord.DatabaseNow(const AConnection: IActiveRecordConnection): TDateTime;
begin
  Result := ActiveRecordDependenciaProjeto.DatabaseNow(AConnection);
end;

destructor TActiveRecord.Destroy;
begin
  FreeAndNil(FSavePoint);
  inherited;
end;

function TActiveRecord.DisplayText(Index: Integer): string;
begin
  Result := GetAsString(Index);
end;

class function TActiveRecord.EqualValues(const AValue1, AValue2: TNullableBoolean): Boolean;
begin
  Result := AValue1.Null and AValue2.Null or
    ((not AValue1.Null) and (not AValue2.Null) and (AValue1.Value = AValue2.Value));
end;

class function TActiveRecord.EqualValues(const AValue1, AValue2: TNullableColor): Boolean;
begin
  Result := AValue1.Null and AValue2.Null or
    ((not AValue1.Null) and (not AValue2.Null) and (AValue1.Value = AValue2.Value));
end;

class function TActiveRecord.EqualValues(const AValue1, AValue2: TNullableCurrency): Boolean;
begin
  Result := AValue1.Null and AValue2.Null or
    ((not AValue1.Null) and (not AValue2.Null) and (AValue1.Value = AValue2.Value));
end;

class function TActiveRecord.EqualValues(const AValue1, AValue2: TNullableDateTime): Boolean;
begin
  Result := AValue1.Null and AValue2.Null or
    ((not AValue1.Null) and (not AValue2.Null) and (AValue1.Value = AValue2.Value));
end;

class function TActiveRecord.EqualValues(const AValue1, AValue2: TNullableExtended): Boolean;
begin
  Result := AValue1.Null and AValue2.Null or
    ((not AValue1.Null) and (not AValue2.Null) and (AValue1.Value = AValue2.Value));
end;

class function TActiveRecord.EqualValues(const AValue1, AValue2: TNullableInteger): Boolean;
begin
  Result := AValue1.Null and AValue2.Null or
    ((not AValue1.Null) and (not AValue2.Null) and (AValue1.Value = AValue2.Value));
end;

class function TActiveRecord.EqualValues(const AValue1, AValue2: TNullableString): Boolean;
begin
  Result := AValue1.Null and AValue2.Null or
    ((not AValue1.Null) and (not AValue2.Null) and (AValue1.Value = AValue2.Value));
end;

class function TActiveRecord.From: IActiveRecordQueryFactory;
begin
  Result := TActiveRecordQueryFactoryADO.Create(Self);
end;

class function TActiveRecord.FromWithJoin(const ARelationshipIndexs: array of Integer): IActiveRecordQueryFactory;
begin
  Result := TActiveRecordQueryFactoryADOJoinTable.Create(Self, ARelationshipIndexs);
end;

function TActiveRecord.GetActiveRecord: IActiveRecord;
begin
  Result := Self;
end;

function TActiveRecord.GetAsString(Index: Integer): string;
begin
  raise EActiveRecord.CreateResFmt(@rsNaoExisteAcessoParaOIndice, [Index]);
end;

function TActiveRecord.GetConnection: IActiveRecordConnection;
begin
  Result := FConnection;
end;

function TActiveRecord.GetDeleted: Boolean;
begin
  Result := FDeleted;
end;

function TActiveRecord.GetNovo: Boolean;
begin
  Result := FNovo;
end;

function TActiveRecord.GetValue(Index: Integer): Variant;
begin
  raise EActiveRecord.CreateResFmt(@rsNaoExisteAcessoParaOIndice, [Index]);
end;

function TActiveRecord.IsNull(Index: Integer): Boolean;
begin
  raise EActiveRecord.CreateResFmt(@rsNaoExisteAcessoParaOIndice, [Index]);
end;

procedure TActiveRecord.MarkDeleted;
begin
  FDeleted := True;
end;

class function TActiveRecord.NSToNullableBoolean(AValue: string): TNullableBoolean;
begin
  if AValue = '' then
    Result := NullBoolean
  else
    Result := NullableNS(AValue);
end;

class function TActiveRecord.Nullable(const AValue: Boolean; ANull: Boolean): TNullableBoolean;
begin
  with Result do
  begin
    if ANull then
      Value := False
    else
      Value := AValue;
    Null := ANull;
  end;
end;

class function TActiveRecord.Nullable(const AValue: Integer; ANull: Boolean): TNullableInteger;
begin
  with Result do
  begin
    if ANull then
      Value := 0
    else
      Value := AValue;
    Null := ANull;
  end;
end;

class function TActiveRecord.Nullable(const AValue: string; ANull: Boolean): TNullableString;
begin
  with Result do
  begin
    if ANull then
      Value := ''
    else
      Value := AValue;
    Null := ANull;
  end;
end;

class function TActiveRecord.NullableB01(const AValue: Integer; ANull: Boolean): TNullableBoolean;
begin
  Result := Nullable(AValue = 1, ANull);
end;

class function TActiveRecord.NullableColor(const AValue: TColor; ANull: Boolean): TNullableColor;
begin
  with Result do
  begin
    if ANull then
      Value := clBtnFace
    else
      Value := AValue;
    Null := ANull;
  end;
end;

class function TActiveRecord.NullableCurrency(const AValue: Currency; ANull: Boolean): TNullableCurrency;
begin
  with Result do
  begin
    if ANull then
      Value := 0
    else
      Value := AValue;
    Null := ANull;
  end;
end;

class function TActiveRecord.NullableDateTime(const AValue: TDateTime; ANull: Boolean): TNullableDateTime;
begin
  with Result do
  begin
    if ANull then
      Value := 0
    else
      Value := AValue;
    Null := ANull;
  end;
end;

class function TActiveRecord.NullableExtended(const AValue: Extended; ANull: Boolean): TNullableExtended;
begin
  with Result do
  begin
    if ANull then
      Value := 0
    else
      Value := AValue;
    Null := ANull;
  end;
end;

class function TActiveRecord.NullableNS(const AValue: string; ANull: Boolean): TNullableBoolean;
begin
  Result := Nullable(UpperCase(Copy(AValue, 1, 1)) = 'S', ANull);
end;

class function TActiveRecord.NullOrString(ANull: Boolean; const AString: string): string;
begin
  if ANull then
    Result := ''
  else
    Result := AString;
end;

procedure TActiveRecord.RollBack;
begin
  Assert(Assigned(FSavePoint) and (FSavePoint.Count > 0), 'Rollback deve ser chamado após SavePoint');
  CopyFrom(FSavePoint[FSavePoint.Count - 1] as TActiveRecord);
  FSavePoint.Delete(FSavePoint.Count - 1);
  if FSavePoint.Count = 0 then
    FreeAndNil(FSavePoint);
end;

procedure TActiveRecord.Save;
begin
  BeforeSave;
  Persist;
  AfterSave;
end;

function TActiveRecord.SavedPoint: Boolean;
begin
  Result := Assigned(FSavePoint) and (FSavePoint.Count > 0);
end;

procedure TActiveRecord.SavePoint;
var
  LActiveRecord: TActiveRecord;
begin
  LActiveRecord := ClassActiveRecord.Create(GetConnection);
  LActiveRecord.CopyFrom(Self);
  if not Assigned(FSavePoint) then
    FSavePoint := TObjectList.Create;
  FSavePoint.Add(LActiveRecord);
end;

procedure TActiveRecord.SetAsString(Index: Integer; const Value: string);
begin
  raise EActiveRecord.CreateResFmt(@rsNaoExisteAcessoParaOIndice, [Index]);
end;

procedure TActiveRecord.SetValue(Index: Integer; const Value: Variant);
begin
  raise EActiveRecord.CreateResFmt(@rsNaoExisteAcessoParaOIndice, [Index]);
end;

class function TActiveRecord.StringToNullableColor(const AValue: string): TNullableColor;
begin
  if AValue = '' then
    Result := NullColor
  else
    Result := NullableColor(StrToInt(AValue));
end;

class function TActiveRecord.StringToNullableCurrency(const AValue: string): TNullableCurrency;
begin
  if AValue = '' then
    Result := NullCurrency
  else
    Result := NullableCurrency(StrToCurr(AValue));
end;

class function TActiveRecord.StringToNullableDateTime(const AValue: string): TNullableDateTime;
begin
  if AValue = '' then
    Result := NullDateTime
  else
    Result := NullableDateTime(StrToDateTime(AValue));
end;

class function TActiveRecord.StringToNullableExtended(const AValue: string): TNullableExtended;
begin
  if AValue = '' then
    Result := NullExtended
  else
    Result := NullableExtended(StrToFloat(AValue));
end;

class function TActiveRecord.StringToNullableInteger(const AValue: string): TNullableInteger;
begin
  if AValue = '' then
    Result := NullInteger
  else
    Result := Nullable(StrToInt(AValue));
end;

class function TActiveRecord.ToString(const AValue: TNullableColor): string;
begin
  if AValue.Null then
    Result := ''
  else
    Result := IntToStr(AValue.Value);
end;

class function TActiveRecord.ToString(const AValue: TNullableCurrency): string;
begin
  if AValue.Null then
    Result := ''
  else
    Result := CurrToStr(AValue.Value);
end;

class function TActiveRecord.ToString(const AValue: TNullableDateTime): string;
begin
  if AValue.Null then
    Result := ''
  else
    Result := DateTimeToStr(AValue.Value);
end;

class function TActiveRecord.ToString(const AValue: TNullableExtended): string;
begin
  if AValue.Null then
    Result := ''
  else
    Result := FloatToStr(AValue.Value);
end;

class function TActiveRecord.ToString(const AValue: TNullableInteger): string;
begin
  if AValue.Null then
    Result := ''
  else
    Result := IntToStr(AValue.Value);
end;

class function TActiveRecord.ToString(const AValue: TNullableString): string;
begin
  if AValue.Null then
    Result := ''
  else
    Result := AValue.Value;
end;

class function TActiveRecord.ToStringNS(const AValue: TNullableBoolean): string;
begin
  if AValue.Null then
    Result := ''
  else
    Result := NS[AValue.Value];
end;

class function TActiveRecord.ToVariant(const AValue: TNullableBoolean): Variant;
begin
  if AValue.Null then
    Result := Null
  else
    Result := AValue.Value;
end;

class function TActiveRecord.ToVariant(const AValue: TNullableColor): Variant;
begin
  if AValue.Null then
    Result := Null
  else
    Result := AValue.Value;
end;

class function TActiveRecord.ToVariant(const AValue: TNullableCurrency): Variant;
begin
  if AValue.Null then
    Result := Null
  else
    Result := AValue.Value;
end;

class function TActiveRecord.ToVariant(const AValue: TNullableDateTime): Variant;
begin
  if AValue.Null then
    Result := Null
  else
    Result := AValue.Value;
end;

class function TActiveRecord.ToVariant(const AValue: TNullableExtended): Variant;
begin
  if AValue.Null then
    Result := Null
  else
    Result := AValue.Value;
end;

class function TActiveRecord.ToVariant(const AValue: TNullableInteger): Variant;
begin
  if AValue.Null then
    Result := Null
  else
    Result := AValue.Value;
end;

class function TActiveRecord.ToVariant(const AValue: TNullableString): Variant;
begin
  if AValue.Null then
    Result := Null
  else
    Result := AValue.Value;
end;

class function TActiveRecord.ToVariantB01(const AValue: TNullableBoolean): Variant;
begin
  if AValue.Null then
    Result := Null
  else
    Result := Ord(AValue.Value);
end;

class function TActiveRecord.ToVariantNS(const AValue: TNullableBoolean): Variant;
begin
  if AValue.Null then
    Result := Null
  else
    Result := NS[AValue.Value];
end;

procedure TActiveRecord.Validate(const AActiveRecordCallBackValidate: IActiveRecordCallBackValidate);
begin
  //Sobrepor e chamar métodos AActiveRecordCallBackValidate para as inconsistências
end;

class function TActiveRecord.ValidateString(const AValue: string; const AFieldMetadata: TFieldMetadata;
  out AMensagem: string): Boolean;

  function TryCurr: string;
  var
    LValue: Currency;
  begin
    if not TryStrToCurr(AValue, LValue) then
      Result := '"' + AValue + '" não corresponde a um valor monetário válido.'
    else
      Result := '';
  end;

  function TryDateTime: string;
  var
    LValue: TDateTime;
  begin
    if not TryStrToDateTime(AValue, LValue) then
      Result := '"' + AValue + '" não corresponde a uma data válida. Deve ser no formato ' + ShortDateFormat + '.'
    else
      Result := '';
  end;

  function TryFloat: string;
  var
    LValue: Extended;
  begin
    if not TryStrToFloat(AValue, LValue) then
      Result := '"' + AValue + '" não corresponde a um valor válido.'
    else
      Result := '';
  end;

  function TryInt: string;
  var
    LValue: Integer;
  begin
    if not TryStrToInt(AValue, LValue) then
      Result := '"' + AValue + '" não corresponde a um valor inteiro válido.'
    else
      Result := '';
  end;

  function TryNS: string;
  begin
    if not (SameText(AValue, 'N') or SameText(AValue, 'S')) then
      Result := '"' + AValue + '" não corresponde as letras "N" ou "S".'
    else
      Result := '';
  end;

  function TryString: string;
  begin
    if Length(AValue) > AFieldMetadata.Length then
      Result := 'campo tem mais que ' + IntToStr(AFieldMetadata.Length) + ' dígitos.'
    else
      Result := '';
  end;

begin
  AMensagem := '';
  if not (AFieldMetadata.Nullable and (AValue = '')) then
    case AFieldMetadata.FieldType of
      arftDateTime: AMensagem := TryDateTime;
      arftFloat: AMensagem := TryFloat;
      arftInteger: AMensagem := TryInt;
      arftMoney: AMensagem := TryCurr;
      arftNS, arftB01: AMensagem := TryNS;
      arftVarchar: AMensagem := TryString;
      arftMemo: AMensagem := '';
    end;
  Result := AMensagem = '';
end;

class function TActiveRecord.VariantToBinary(const AValue: OleVariant): TBinary;
var
  LSize: Integer;
  PValue: Pointer;
begin
  if VarIsArray(AValue) then
  begin
    PValue := VarArrayLock(AValue);
    try
      LSize := VarArrayHighBound(AValue, 1) + 1;
      SetLength(Result, LSize);
      Move(PValue^, Result[0], LSize);
    finally
      VarArrayUnlock(AValue);
    end;
  end;
end;

class function TActiveRecord.VariantToNullableB01(const AValue: Variant): TNullableBoolean;
var
  LValue: Integer;
begin
  if VarIsNull(AValue) then
    Result := NullBoolean
  else
  begin
    LValue := AValue;
    Result := Nullable(LValue = 1);
  end;
end;

class function TActiveRecord.VariantToNullableBoolean(const AValue: Variant): TNullableBoolean;
var
  LValue: Boolean;
begin
  if VarIsNull(AValue) then
    Result := NullBoolean
  else
  begin
    LValue := AValue;
    Result := Nullable(LValue);
  end;
end;

class function TActiveRecord.VariantToNullableColor(const AValue: Variant): TNullableColor;
var
  LValue: TColor;
begin
  if VarIsNull(AValue) then
    Result := NullColor
  else
  begin
    LValue := AValue;
    Result := NullableColor(LValue);
  end;
end;

class function TActiveRecord.VariantToNullableCurrency(const AValue: Variant): TNullableCurrency;
var
  LValue: Currency;
begin
  if VarIsNull(AValue) then
    Result := NullCurrency
  else
  begin
    LValue := AValue;
    Result := NullableCurrency(LValue);
  end;
end;

class function TActiveRecord.VariantToNullableDateTime(const AValue: Variant): TNullableDateTime;
var
  LValue: TDateTime;
begin
  if VarIsNull(AValue) then
    Result := NullDateTime
  else
  begin
    LValue := AValue;
    Result := NullableDateTime(LValue);
  end;
end;

class function TActiveRecord.VariantToNullableExtended(const AValue: Variant): TNullableExtended;
var
  LValue: Extended;
begin
  if VarIsNull(AValue) then
    Result := NullExtended
  else
  begin
    LValue := AValue;
    Result := NullableExtended(LValue);
  end;
end;

class function TActiveRecord.VariantToNullableInteger(const AValue: Variant): TNullableInteger;
var
  LValue: Integer;
begin
  if VarIsNull(AValue) then
    Result := NullInteger
  else
  begin
    LValue := AValue;
    Result := Nullable(LValue);
  end;
end;

class function TActiveRecord.VariantToNullableNS(const AValue: Variant): TNullableBoolean;
var
  LValueBoolean: Boolean;
  LValueString: string;
begin
  case VarType(AValue) of
    varNull: Result := NullBoolean;
    varBoolean: begin
      LValueBoolean := AValue;
      Result := Nullable(LValueBoolean);
    end;
    varOleStr, varString: begin
      LValueString := AValue;
      Result := Nullable(UpperCase(LValueString) = 'S');
    end;
  else
    raise EActiveRecord.CreateFmt('Não foi possível converter o valor "%s" para Boolean', [AValue]);
  end;
end;

class function TActiveRecord.VariantToNullableString(const AValue: Variant): TNullableString;
var
  LValue: string;
begin
  if VarIsNull(AValue) then
    Result := NullString
  else
  begin
    LValue := AValue;
    Result := Nullable(LValue);
  end;
end;

function TActiveRecord.UserCode: string;
begin
  Assert(FConnection <> nil, 'O Connection não foi atribuído no Create');
  Result := FConnection.UserCode;
end;

function TActiveRecord.UserName: string;
begin
  Assert(FConnection <> nil, 'O Connection não foi atribuído no Create');
  Result := FConnection.UserName;
end;

class function TActiveRecord.DefaultConnection: IActiveRecordConnection;
begin
  Result := GDefaultConnection;
end;

class function TActiveRecord.CheckVariant(const AValue: OleVariant): OleVariant;
var
  LValue: Extended;
begin
  {Alex - 17/02/2012 - O Oracle, retorna um tipo de Variant, de numero 14,
  que o Delphi desconhece... trata-se do vt_decimal, e deve ser retornado para
  os campos de 10 dígitos e precisão 0,
  Aparentemente o Reserved1 retorna a precisão do número e o valor é retornado no
  VInt64, informações retiradas de
  http://www.mofeel.net/1285-borland-public-delphi-database-sqlservers/714.aspx}
  if TVarData(AValue).VType = 14 {vt_decimal $e} then
  begin
    LValue := Int64(TVarData(AValue).VPointer);
    if TVarData(AValue).Reserved1 = 0 then
      Result := LValue
    else
      Result := LValue / IntPower(10, TVarData(AValue).Reserved1);
  end
  else
    Result := AValue;
end;

class procedure TActiveRecord.SetFieldNullable(AField: TField; const AValue: TNullableColor);
begin
  if AValue.Null then
    AField.Clear
  else
    AField.AsInteger := AValue.Value;
end;

class procedure TActiveRecord.SetFieldNullable(AField: TField; const AValue: TNullableCurrency);
begin
  if AValue.Null then
    AField.Clear
  else
    AField.AsCurrency := AValue.Value;
end;

class procedure TActiveRecord.SetFieldNullable(AField: TField; const AValue: TNullableDateTime);
begin
  if AValue.Null then
    AField.Clear
  else
    AField.AsDateTime := AValue.Value;
end;

class procedure TActiveRecord.SetFieldNullable(AField: TField; const AValue: TNullableExtended);
begin
  if AValue.Null then
    AField.Clear
  else
    AField.AsFloat := AValue.Value;
end;

class procedure TActiveRecord.SetFieldNullable(AField: TField; const AValue: TNullableInteger);
begin
  if AValue.Null then
    AField.Clear
  else
    AField.AsInteger := AValue.Value;
end;

class procedure TActiveRecord.SetFieldNullable(AField: TField; const AValue: TNullableString);
begin
  if AValue.Null then
    AField.Clear
  else
    AField.AsString := AValue.Value;
end;

class procedure TActiveRecord.SetFieldNullableB01(AField: TField; const AValue: TNullableBoolean);
begin
  if AValue.Null then
    AField.Clear
  else
    AField.AsInteger := Ord(AValue.Value);
end;

class procedure TActiveRecord.SetFieldNullableMemo(AField: TField; const AValue: TNullableString);
begin
  if AValue.Null then
    AField.Clear
  else
    AField.AsString := AValue.Value;
end;

class procedure TActiveRecord.SetFieldNullableNS(AField: TField; const AValue: TNullableBoolean);
begin
  if AValue.Null then
    AField.Clear
  else
    AField.AsString := NS[AValue.Value];
end;

procedure TActiveRecord.UndoMarkDeleted;
begin
  FDeleted := False;
end;

{ TResultadoSQL }

class procedure TResultadoSQL.AjustaMetadata(const AMetadata: IActiveRecordMetadataWritable);
begin
  //Sobreponha nos filhos para alterar o Metadata gerado automaticamente
end;

procedure TResultadoSQL.Clear(Index: Integer);
begin
  if (Index >= 0) and (Index < FMetadata.FieldCount) and FMetadata.FieldMetadata(Index).Nullable then
    FCampos[Index] := Null
  else
    inherited Clear(Index);
end;

procedure TResultadoSQL.CopyFrom(AActiveRecord: TActiveRecord);
var
  laco: Integer;
begin
  inherited;
  if AActiveRecord is TResultadoSQL then
  begin
    FMetadata := TResultadoSQL(AActiveRecord).FMetadata;
    SetLength(FCampos, Length(TResultadoSQL(AActiveRecord).FCampos));
    for laco := Low(FCampos) to High(FCampos) do
      FCampos[laco] := TResultadoSQL(AActiveRecord).FCampos[laco];
  end;
end;

function TResultadoSQL.CreateItemRelationship(Index: Integer): TActiveRecord;
begin
  Result := nil;
  Assert(False, rsNaoImplementado);
end;

function TResultadoSQL.DisplayText(Index: Integer): string;
begin
  if (Index >= 0) and (Index < FMetadata.FieldCount) then
    Result := GetAsString(Index)
  else
    Result := inherited DisplayText(Index);
end;

class function TResultadoSQL.Execute(const ACommandSQL: string;
  const AConnection: IActiveRecordConnection): IActiveRecordQuery;
begin
  Result := TResultadoSQLQueryADO.Create(Self, ACommandSQL, AConnection, TActiveRecordMetadataWritable.Create);
end;

class function TResultadoSQL.From: IActiveRecordQueryFactory;
begin
  Result := nil;
  Assert(False, rsNaoImplementado);
end;

class function TResultadoSQL.FromWithJoin(const ARelationshipIndexs: array of Integer): IActiveRecordQueryFactory;
begin
  Result := nil;
  Assert(False, rsNaoImplementado);
end;

function TResultadoSQL.GetAsString(Index: Integer): string;
begin
  if (Index >= 0) and (Index < FMetadata.FieldCount) then
  begin
    if VarIsNull(FCampos[Index]) then
      Result := ''
    else
      Result := FCampos[Index];
  end
  else
    Result := inherited GetAsString(Index);
end;

function TResultadoSQL.GetMetadata: IActiveRecordMetadata;
begin
  Result := FMetadata;
end;

function TResultadoSQL.GetValue(Index: Integer): Variant;
begin
  if (Index >= 0) and (Index < FMetadata.FieldCount) then
    Result := FCampos[Index]
  else
    Result := inherited GetValue(Index);
end;

class function TResultadoSQL.GUIDItem: TGUID;
begin
  Result := IResultadoSQL;
end;

function TResultadoSQL.IsNull(Index: Integer): Boolean;
begin
  if (Index >= 0) and (Index < FMetadata.FieldCount) then
    Result := FMetadata.FieldMetadata(Index).Nullable and VarIsNull(FCampos[Index])
  else
    Result := inherited IsNull(Index);
end;

class function TResultadoSQL.Metadata: IActiveRecordMetadata;
begin
  Result := nil;
  Assert(False, rsNaoImplementado);
end;

procedure TResultadoSQL.Persist;
begin
  Assert(False, rsNaoImplementado);
end;

procedure TResultadoSQL.SetAsString(Index: Integer; const Value: string);
begin
  if (Index >= 0) and (Index < FMetadata.FieldCount) then
    SetValue(Index, Value)
  else
    inherited;
end;

procedure TResultadoSQL.SetMetadata(const AValue: IActiveRecordMetadata);
begin
  FMetadata := AValue;
  SetLength(FCampos, FMetadata.FieldCount);
end;

procedure TResultadoSQL.SetRecordSet(const ARecordSet: _RecordSet; AOffset: Integer);
var
  laco: Integer;
  LFieldMetadata: TFieldMetadata;
  LValue: OleVariant;
begin
  for laco := 0 to FMetadata.FieldCount - 1 do
  begin
    LFieldMetadata := FMetadata.FieldMetadata(laco);
    LValue := ARecordSet.Fields[laco + AOffset].Value;
    if (not LFieldMetadata.Nullable) and VarIsNull(LValue) then
      FCampos[laco] := VarAsType(Unassigned, EquivalenciaFieldTypeEVariant[LFieldMetadata.FieldType])
    else
      FCampos[laco] := LValue;
  end;
end;

procedure TResultadoSQL.SetValue(Index: Integer; const Value: Variant);
var
  LFieldMetadata: TFieldMetadata;
begin
  if (Index >= 0) and (Index < FMetadata.FieldCount) then
  begin
    LFieldMetadata := FMetadata.FieldMetadata(Index);
    if (not LFieldMetadata.Commented) and (not LFieldMetadata.ReadOnly) then
    begin
      if (not LFieldMetadata.Nullable) and VarIsNull(Value) then
        FCampos[Index] := VarAsType(Unassigned, EquivalenciaFieldTypeEVariant[LFieldMetadata.FieldType])
      else
        FCampos[Index] := Value;
    end
    else
      inherited;
  end
  else
    inherited;
end;

class function TResultadoSQL.ViewMetadata: IActiveRecordMetadata;
begin
  Result := nil;
  Assert(False, rsNaoImplementado);
end;

{ TActiveRecordMetadataWritable }

procedure TActiveRecordMetadataWritable.AddFieldsMetadata(const AFieldsMetadata: array of TFieldMetadata);
var
  laco: Integer;
begin
  for laco := Low(AFieldsMetadata) to High(AFieldsMetadata) do
    ConfigNewFieldMetadata.SetFieldMetadata(AFieldsMetadata[laco]).Write;
end;

function TActiveRecordMetadataWritable.ConfigFieldMetadata(AIndex: Integer): IFieldMetadataWritable;
begin
  Result := TFieldMetadataWritable.Create(Self, FieldMetadata(AIndex));
end;

function TActiveRecordMetadataWritable.ConfigFieldMetadata(const AFieldName: string): IFieldMetadataWritable;
begin
  Result := TFieldMetadataWritable.Create(Self, FieldMetadataByName(AFieldName));
end;

function TActiveRecordMetadataWritable.ConfigNewFieldMetadata: IFieldMetadataWritable;
begin
  Result := TFieldMetadataWritable.New(Self);
end;

function TActiveRecordMetadataWritable.ConfigNewRelationshipMetadata: IRelationshipMetadataWritable;
begin
  Result := TRelationshipMetadataWritable.New(Self);
end;

procedure TActiveRecordMetadataWritable.CopyFieldFromTo_ResultadoSQL(const AFieldMetadata: TFieldMetadata;
  AIndexTo: Integer);
begin
  //Como é para ResultadoSQL, mantemos as informações de ReadOnly (True) e Commented (False) originais.
  ConfigFieldMetadata(AIndexTo)
    .SetName(AFieldMetadata.Name)
    .SetLength(AFieldMetadata.Length)
    .SetNullable(AFieldMetadata.Nullable)
    .SetCaption(AFieldMetadata.Caption)
    .SetVisible(AFieldMetadata.Visible)
    //.SetReadOnly(AFieldMetadata.ReadOnly)
    //.SetCommented(AFieldMetadata.Commented)
    .SetTitle(AFieldMetadata.Title)
    .SetColumnCharWidth(AFieldMetadata.ColumnCharWidth)
    .Write;
end;

procedure TActiveRecordMetadataWritable.CopyFieldFromTo_ResultadoSQL_MantemNome(const AFieldMetadata: TFieldMetadata;
  AIndexTo: Integer);
begin
  //Como é para ResultadoSQL, mantemos as informações de ReadOnly (True) e Commented (False) originais.
  ConfigFieldMetadata(AIndexTo)
    //.SetName(AFieldMetadata.Name)
    .SetLength(AFieldMetadata.Length)
    .SetNullable(AFieldMetadata.Nullable)
    .SetCaption(AFieldMetadata.Caption)
    .SetVisible(AFieldMetadata.Visible)
    //.SetReadOnly(AFieldMetadata.ReadOnly)
    //.SetCommented(AFieldMetadata.Commented)
    .SetTitle(AFieldMetadata.Title)
    .SetColumnCharWidth(AFieldMetadata.ColumnCharWidth)
    .Write;
end;

procedure TActiveRecordMetadataWritable.CopyFrom(const AActiveRecordMetadata: IActiveRecordMetadata);
var
  laco: Integer;
begin
  SetTableMetadata(AActiveRecordMetadata.TableMetadata);
  SetLength(FFieldsMetadata, AActiveRecordMetadata.FieldCount);
  for laco := 0 to AActiveRecordMetadata.FieldCount - 1 do
    FFieldsMetadata[laco] := AActiveRecordMetadata.FieldMetadata(laco);
  SetLength(FRelationshipMetadata, AActiveRecordMetadata.RelationshipCount);
  for laco := 0 to AActiveRecordMetadata.RelationshipCount - 1 do
    FRelationshipMetadata[laco] := AActiveRecordMetadata.RelationshipMetadata(laco);
end;

function TActiveRecordMetadataWritable.FieldCount: Integer;
begin
  Result := Length(FFieldsMetadata);
end;

function TActiveRecordMetadataWritable.FieldMetadata(Index: Integer): TFieldMetadata;
begin
  Result := FFieldsMetadata[Index];
end;

function TActiveRecordMetadataWritable.FieldMetadataByName(const AName: string): TFieldMetadata;
begin
  Result := FieldMetadata(IndexOfName(AName));
end;

function TActiveRecordMetadataWritable.FromMetadataDo(
  const AActiveRecordMetadata: IActiveRecordMetadata): IFromMetadataDo;
begin
  Result := TFromMetadataDo.Create(AActiveRecordMetadata, Self);
end;

function TActiveRecordMetadataWritable.IndexOfName(const AName: string): Integer;
var
  laco: Integer;
begin
  Result := -1;
  for laco := 0 to High(FFieldsMetadata) do
    if SameText(FFieldsMetadata[laco].Name, AName) then
    begin
      Result := laco;
      Break;
    end;
end;

function TActiveRecordMetadataWritable.RelationshipCount: Integer;
begin
  Result := Length(FRelationshipMetadata);
end;

function TActiveRecordMetadataWritable.RelationshipMetadata(Index: Integer): TRelationshipMetadata;
begin
  Result := FRelationshipMetadata[Index];
end;

procedure TActiveRecordMetadataWritable.SetFieldMetadata(Index: Integer; const Value: TFieldMetadata);
var
  LTamanhoAnterior: Integer;
begin
  LTamanhoAnterior := FieldCount;
  if Index >= LTamanhoAnterior then
    SetLength(FFieldsMetadata, Index + 1);
  FFieldsMetadata[Index] := Value;
end;

procedure TActiveRecordMetadataWritable.SetRelationshipMetadata(Index: Integer; const Value: TRelationshipMetadata);
var
  LTamanhoAnterior: Integer;
begin
  LTamanhoAnterior := RelationshipCount;
  if Index >= LTamanhoAnterior then
    SetLength(FRelationshipMetadata, Index + 1);
  FRelationshipMetadata[Index] := Value;
end;

procedure TActiveRecordMetadataWritable.SetTableMetadata(const Value: TTableMetadata);
begin
  FTableMetadata := Value;
end;

procedure TActiveRecordMetadataWritable.SetVisibleFields(const AFieldIndexes: TFieldIndexes);
var
  laco: Integer;
  lacoFields: Integer;
begin
  for laco := 0 to FieldCount - 1 do
    with ConfigFieldMetadata(laco) do
    begin
      SetVisible(False);
      for lacoFields := Low(AFieldIndexes) to High(AFieldIndexes) do
        if FieldMetadata(laco).Index = AFieldIndexes[lacoFields] then
        begin
          SetVisible(True);
          Break;
        end;
      Write;
    end;
end;

function TActiveRecordMetadataWritable.TableMetadata: TTableMetadata;
begin
  Result := FTableMetadata;
end;

{ TFieldMetadataWritable }

constructor TFieldMetadataWritable.Create(const AActiveRecordMetadataWritable: IActiveRecordMetadataWritable;
  const AFieldMetadata: TFieldMetadata);
begin
  FActiveRecordMetadataWritable := AActiveRecordMetadataWritable;
  FFieldMetadata := AFieldMetadata;
end;

constructor TFieldMetadataWritable.New(const AActiveRecordMetadataWritable: IActiveRecordMetadataWritable);
begin
  FActiveRecordMetadataWritable := AActiveRecordMetadataWritable;
  FFieldMetadata.Index := FActiveRecordMetadataWritable.FieldCount;
end;

function TFieldMetadataWritable.SetCaption(const Value: string): IFieldMetadataWritable;
begin
  Result := Self;
  FFieldMetadata.Caption := Value;
end;

function TFieldMetadataWritable.SetColumnCharWidth(Value: Integer): IFieldMetadataWritable;
begin
  Result := Self;
  FFieldMetadata.ColumnCharWidth := Value;
end;

function TFieldMetadataWritable.SetCommented(Value: Boolean): IFieldMetadataWritable;
begin
  Result := Self;
  FFieldMetadata.Commented := Value;
end;

function TFieldMetadataWritable.SetFieldMetadata(const Value: TFieldMetadata): IFieldMetadataWritable;
var
  LOldIndex: Integer;
begin
  Result := Self;
  LOldIndex := FFieldMetadata.Index;
  FFieldMetadata := Value;
  FFieldMetadata.Index := LOldIndex;
end;

function TFieldMetadataWritable.SetFieldType(Value: TFieldTypeMetadata): IFieldMetadataWritable;
begin
  Result := Self;
  FFieldMetadata.FieldType := Value;
end;

function TFieldMetadataWritable.SetLength(Value: Integer): IFieldMetadataWritable;
begin
  Result := Self;
  FFieldMetadata.Length := Value;
end;

function TFieldMetadataWritable.SetName(const Value: string): IFieldMetadataWritable;
begin
  Result := Self;
  FFieldMetadata.Name := Value;
end;

function TFieldMetadataWritable.SetNullable(Value: Boolean): IFieldMetadataWritable;
begin
  Result := Self;
  FFieldMetadata.Nullable := Value;
end;

function TFieldMetadataWritable.SetReadOnly(Value: Boolean): IFieldMetadataWritable;
begin
  Result := Self;
  FFieldMetadata.ReadOnly := Value;
end;

function TFieldMetadataWritable.SetTitle(Value: string): IFieldMetadataWritable;
begin
  Result := Self;
  FFieldMetadata.Title := Value;
end;

function TFieldMetadataWritable.SetVisible(Value: Boolean): IFieldMetadataWritable;
begin
  Result := Self;
  FFieldMetadata.Visible := Value;
end;

procedure TFieldMetadataWritable.Write;
begin
  FActiveRecordMetadataWritable.SetFieldMetadata(FFieldMetadata.Index, FFieldMetadata);
end;

{ TRelationshipMetadataWritable }

constructor TRelationshipMetadataWritable.Create(const AActiveRecordMetadataWritable: IActiveRecordMetadataWritable;
  const ARelationshipMetadata: TRelationshipMetadata);
begin
  FActiveRecordMetadataWritable := AActiveRecordMetadataWritable;
  FRelationshipMetadata := ARelationshipMetadata;
end;

constructor TRelationshipMetadataWritable.New(const AActiveRecordMetadataWritable: IActiveRecordMetadataWritable);
begin
  FActiveRecordMetadataWritable := AActiveRecordMetadataWritable;
  FillChar(FRelationshipMetadata, SizeOf(TRelationshipMetadata), 0);
  FRelationshipMetadata.Index := FActiveRecordMetadataWritable.RelationshipCount;
end;

function TRelationshipMetadataWritable.SetAdditionalToConditions(const AValue: string): IRelationshipMetadataWritable;
begin
  Result := Self;
  FRelationshipMetadata.AdditionalToConditions := AValue;
end;

function TRelationshipMetadataWritable.SetClassActiveRecord(AValue: TClassActiveRecord): IRelationshipMetadataWritable;
begin
  Result := Self;
  FRelationshipMetadata.ClassActiveRecord := AValue;
end;

function TRelationshipMetadataWritable.SetCommented(AValue: Boolean): IRelationshipMetadataWritable;
begin
  Result := Self;
  FRelationshipMetadata.Commented := AValue;
end;

function TRelationshipMetadataWritable.SetFromFields(const AValue: string): IRelationshipMetadataWritable;
begin
  Result := Self;
  FRelationshipMetadata.FromFields := AValue;
end;

function TRelationshipMetadataWritable.SetMetadata(const AValue: IActiveRecordMetadata): IRelationshipMetadataWritable;
begin
  Result := Self;
  FRelationshipMetadata.Metadata := AValue;
end;

function TRelationshipMetadataWritable.SetName(const AValue: string): IRelationshipMetadataWritable;
begin
  Result := Self;
  FRelationshipMetadata.Name := AValue;
end;

function TRelationshipMetadataWritable.SetRelationshipType(AValue: TRelationshipType): IRelationshipMetadataWritable;
begin
  Result := Self;
  FRelationshipMetadata.RelationshipType := AValue;
end;

function TRelationshipMetadataWritable.SetToFields(const AValue: string): IRelationshipMetadataWritable;
begin
  Result := Self;
  FRelationshipMetadata.ToFields := AValue;
end;

function TRelationshipMetadataWritable.WriteAndReturnIndex: Integer;
begin
  Result := FRelationshipMetadata.Index;
  FActiveRecordMetadataWritable.SetRelationshipMetadata(FRelationshipMetadata.Index, FRelationshipMetadata);
end;

{ TFromMetadataDo }

function TFromMetadataDo.CopyFromTo_ResultadoSQL(AFieldIndexFrom, AFieldIndexTo: Integer): IFromMetadataDo;
begin
  Result := Self;
  FMetadataTo.CopyFieldFromTo_ResultadoSQL(FMetadataFrom.FieldMetadata(AFieldIndexFrom), AFieldIndexTo);
end;

function TFromMetadataDo.CopyFromTo_ResultadoSQL_MantemNome(AFieldIndexFrom, AFieldIndexTo: Integer): IFromMetadataDo;
begin
  Result := Self;
  FMetadataTo.CopyFieldFromTo_ResultadoSQL_MantemNome(FMetadataFrom.FieldMetadata(AFieldIndexFrom), AFieldIndexTo);
end;

constructor TFromMetadataDo.Create(const AMetadataFrom: IActiveRecordMetadata;
  const AMetadataTo: IActiveRecordMetadataWritable);
begin
  FMetadataFrom := AMetadataFrom;
  FMetadataTo := AMetadataTo;
end;

function TFromMetadataDo.End_: IActiveRecordMetadataWritable;
begin
  Result := FMetadataTo;
end;

{ TValidatorField }

constructor TValidatorField.Create(const AActiveRecordMetadata: IActiveRecordMetadata;
  const AActiveRecordCallBackValidate: IActiveRecordCallBackValidate);
begin
  FActiveRecordMetadata := AActiveRecordMetadata;
  FActiveRecordCallBackValidate := AActiveRecordCallBackValidate;
  FIndex := -1;
end;

function TValidatorField.ForField(AFieldIndex: Integer): IValidatorField;
begin
  Result := Self;
  FIndex := AFieldIndex;
  FIsInvalid := False;
end;

function TValidatorField.IsInvalid: Boolean;
begin
  Result := FIsInvalid;
end;

function TValidatorField.IsValid: Boolean;
begin
  Result := not FIsInvalid;
end;

function TValidatorField.RaiseInvalid(const AMessage: string): IValidatorField;
begin
  Result := VerifiedFalse(True, AMessage);
end;

function TValidatorField.Required(AIsRequired: Boolean): IValidatorField;
begin
  Result := VerifiedFalse(AIsRequired, Format(rsEObrigatorioOPreenchimentoDoCampo, [
    FActiveRecordMetadata.FieldMetadata(FIndex).Caption]));
end;

function TValidatorField.VerifiedFalse(ACondition: Boolean; const AMessage: string): IValidatorField;
begin
  Result := Self;
  Assert(FIndex >= 0, 'Chame primeiro ForField');
  if ACondition then
  begin
    FActiveRecordCallBackValidate.FieldInvalid(FActiveRecordMetadata.TableMetadata,
      FActiveRecordMetadata.FieldMetadata(FIndex), AMessage);
    FIsInvalid := True;
  end;
end;

function TValidatorField.VerifiedTrue(ACondition: Boolean; const AMessage: string): IValidatorField;
begin
  Result := VerifiedFalse(not ACondition, AMessage);
end;

{ TActiveRecordTotalizadorBase }

constructor TActiveRecordTotalizadorBase.Create(AFieldIndex: Integer; const AFormatDisplayText: string);
begin
  inherited Create;
  FFieldIndex := AFieldIndex;
  FFormatDisplayText := AFormatDisplayText;
end;

function TActiveRecordTotalizadorBase.GetFieldIndex: Integer;
begin
  Result := FFieldIndex;
end;

function TActiveRecordTotalizadorBase.GetFormatDisplayText: string;
begin
  Result := FFormatDisplayText;
end;

procedure TActiveRecordTotalizadorBase.SetFieldIndex(AValue: Integer);
begin
  FFieldIndex := AValue;
end;

procedure TActiveRecordTotalizadorBase.SetFormatDisplayText(const AValue: string);
begin
  FFormatDisplayText := AValue;
end;

{ TActiveRecordTotalizadorSoma }

function TActiveRecordTotalizadorSoma.DisplayText: string;
begin
  Result := FormatFloat(GetFormatDisplayText, Total);
end;

procedure TActiveRecordTotalizadorSoma.Limpa;
begin
  FSoma := 0;
end;

procedure TActiveRecordTotalizadorSoma.Processa(const AAccess: IActiveRecordAccess);
begin
  FSoma := FSoma + AAccess.Value[GetFieldIndex];
end;

function TActiveRecordTotalizadorSoma.Total: Extended;
begin
  Result := FSoma;
end;

{ TActiveRecordTotalizadorMediaPonderada }

constructor TActiveRecordTotalizadorMediaPonderada.Create(AFieldIndex, AFieldIndexDePonderacao: Integer;
  const AFormatDisplayText: string);
begin
  inherited Create(AFieldIndex, AFormatDisplayText);
  FFieldIndexDePonderacao := AFieldIndexDePonderacao;
end;

function TActiveRecordTotalizadorMediaPonderada.DisplayText: string;
begin
  Result := FormatFloat(GetFormatDisplayText, Total);
end;

procedure TActiveRecordTotalizadorMediaPonderada.Limpa;
begin
  FSomaXPonderada := 0;
  FPonderada := 0;
end;

procedure TActiveRecordTotalizadorMediaPonderada.Processa(const AAccess: IActiveRecordAccess);
begin
  inherited;
  FSomaXPonderada := FSomaXPonderada + AAccess.Value[GetFieldIndex] * AAccess.Value[FFieldIndexDePonderacao];
  FPonderada := FPonderada + AAccess.Value[FFieldIndexDePonderacao];
end;

function TActiveRecordTotalizadorMediaPonderada.Total: Extended;
begin
  Result := FSomaXPonderada / FPonderada;
end;

{ TActiveRecordTotalizacao }

function TActiveRecordTotalizacao.AdicionaTotalizador(
  const ATotalizador: IActiveRecordTotalizador): IActiveRecordTotalizacao;
begin
  Result := Self;
  FTotalizadores.Add(ATotalizador);
end;

constructor TActiveRecordTotalizacao.Create;
begin
  inherited;
  FTotalizadores := TInterfaceList.Create;
end;

function TActiveRecordTotalizacao.DisplayText(AFieldIndex: Integer): string;
begin
  Result := GetTotalizador(AFieldIndex).DisplayText;
end;

function TActiveRecordTotalizacao.GetTotalizador(AFieldIndex: Integer): IActiveRecordTotalizador;
var
  laco: Integer;
begin
  Result := nil;
  for laco := 0 to FTotalizadores.Count - 1 do
    if (FTotalizadores[laco] as IActiveRecordTotalizador).FieldIndex = AFieldIndex then
    begin
      Result := FTotalizadores[laco] as IActiveRecordTotalizador;
      Break;
    end;
end;

procedure TActiveRecordTotalizacao.Limpa;
var
  laco: Integer;
begin
  for laco := 0 to FTotalizadores.Count - 1 do
    (FTotalizadores[laco] as IActiveRecordTotalizador).Limpa;
end;

function TActiveRecordTotalizacao.MediaPonderada(AFieldIndex, AFieldIndexDePonderacao: Integer;
  const AFormatDisplayText: string): IActiveRecordTotalizacao;
begin
  Result := AdicionaTotalizador(TActiveRecordTotalizadorMediaPonderada.Create(AFieldIndex, AFieldIndexDePonderacao,
    AFormatDisplayText));
end;

procedure TActiveRecordTotalizacao.Processa(const AAccess: IActiveRecordAccess);
var
  laco: Integer;
begin
  for laco := 0 to FTotalizadores.Count - 1 do
    (FTotalizadores[laco] as IActiveRecordTotalizador).Processa(AAccess);
end;

function TActiveRecordTotalizacao.Somar(AFieldIndex: Integer;
  const AFormatDisplayText: string): IActiveRecordTotalizacao;
begin
  Result := AdicionaTotalizador(TActiveRecordTotalizadorSoma.Create(AFieldIndex, AFormatDisplayText));
end;

function TActiveRecordTotalizacao.Tem(AFieldIndex: Integer): Boolean;
begin
  Result := GetTotalizador(AFieldIndex) <> nil;
end;

function TActiveRecordTotalizacao.Total(AFieldIndex: Integer): Extended;
begin
  Result := GetTotalizador(AFieldIndex).Total;
end;

{ TActiveRecordService }

procedure TActiveRecordService.Delete(const AActiveRecord: IActiveRecord);
begin
  AActiveRecord.MarkDeleted;
  Save(AActiveRecord);
end;

procedure TActiveRecordService.Save(const AActiveRecord: IActiveRecord);
begin
  AActiveRecord.Save;
end;

{ TBinaryUtil }

class function TBinaryUtil.LoadFromFile(const AFileName: TFileName): TBinary;
var
  LFileStream: TFileStream;
begin
  LFileStream := TFileStream.Create(AFileName, fmOpenRead);
  try
    Result := LoadFromStream(LFileStream);
  finally
    LFileStream.Free;
  end;
end;

class function TBinaryUtil.LoadFromStream(AStream: TStream): TBinary;
var
  LSize: Integer;
begin
  AStream.Position := 0;
  LSize := AStream.Size;
  SetLength(Result, LSize);
  AStream.ReadBuffer(Result[0], LSize);
end;

class procedure TBinaryUtil.SaveToFile(const AValue: TBinary; const AFileName: TFileName);
var
  LFileStream: TFileStream;
begin
  LFileStream := TFileStream.Create(AFileName, fmCreate);
  try
    SaveToStream(AValue, LFileStream);
  finally
    LFileStream.Free;
  end;
end;

class procedure TBinaryUtil.SaveToStream(const AValue: TBinary; AStream: TStream);
begin
  AStream.WriteBuffer(AValue[0], Length(AValue));
end;

{ TActiveRecordTransactionADO }

procedure TActiveRecordTransactionADO.Commit;
begin
  FConnection.ADOConnection.CommitTrans;
  FComitado := True;
end;

constructor TActiveRecordTransactionADO.Create(const AConnectionADO: IActiveRecordConnectionADO);
begin
  FConnection := AConnectionADO;
  StartTransaction;
end;

destructor TActiveRecordTransactionADO.Destroy;
begin
  if not FComitado then
    Rollback;
  inherited;
end;

procedure TActiveRecordTransactionADO.RollBack;
begin
  FConnection.ADOConnection.RollbackTrans;
end;

procedure TActiveRecordTransactionADO.StartTransaction;
begin
  FConnection.ADOConnection.BeginTrans;
end;

{ TActiveRecordConnectionADO }

constructor TActiveRecordConnectionADO.Create(const AConnectionString: string);
begin
  FADOConnection := CoConnection.Create;
  FADOConnection.ConnectionTimeout := 30; //Tempo máximo que gasta para conectar no banco (30 segundos)
  FADOConnection.CommandTimeout := 90; //Tempo máximo de resposta de uma consulta ou comando (3 minutos)
  FADOConnection.CursorLocation := adUseClient; //Força a não usar cursores no banco.
  FADOConnection.Open(AConnectionString, '', '', 0);
end;

destructor TActiveRecordConnectionADO.Destroy;
begin
  FADOConnection := nil;
  inherited;
end;

function TActiveRecordConnectionADO.GetADOConnection: _Connection;
begin
  Result := FADOConnection;
end;

function TActiveRecordConnectionADO.GetUserCode: string;
begin
  Result := FUserCode;
end;

function TActiveRecordConnectionADO.GetUserName: string;
begin
  Result := FUserName;
end;

procedure TActiveRecordConnectionADO.SetUserCode(const AValue: string);
begin
  FUserCode := AValue;
end;

procedure TActiveRecordConnectionADO.SetUserName(const AValue: string);
begin
  FUserName := AValue;
end;

function TActiveRecordConnectionADO.StartTransaction: IActiveRecordTransaction;
begin
  Result := TActiveRecordTransactionADO.Create(Self);
end;

{ TActiveRecordQueryFactoryADOBase }

function TActiveRecordQueryFactoryADOBase.ClassActiveRecord: TClassActiveRecord;
begin
  Result := FClassActiveRecord;
end;

constructor TActiveRecordQueryFactoryADOBase.Create(AClassActiveRecord: TClassActiveRecord);
begin
  FClassActiveRecord := AClassActiveRecord;
  FTop := 0;
end;

function TActiveRecordQueryFactoryADOBase.OrderBy(const AClause: string): IActiveRecordQueryFactory;
begin
  Result := Self;
  Reset;
  FOrderBy := AClause;
end;

procedure TActiveRecordQueryFactoryADOBase.Reset;
begin
  FCommandSQL := '';
end;

function TActiveRecordQueryFactoryADOBase.Top(ACount: Integer): IActiveRecordQueryFactory;
begin
  Result := Self;
  Reset;
  FTop := ACount;
end;

function TActiveRecordQueryFactoryADOBase.Where(const AClause: string): IActiveRecordQueryFactory;
begin
  Result := Self;
  Reset;
  FWhere := AClause;
end;

{ TActiveRecordQueryFactoryADO }

function TActiveRecordQueryFactoryADO.CreateQuery(const AConnection: IActiveRecordConnection;
  AClassActiveRecord: TClassActiveRecord): IActiveRecordQuery;
begin
  if FCommandSQL = '' then
    PrepareCommandSQL;
  if AClassActiveRecord = nil then
    AClassActiveRecord := ClassActiveRecord;
  Result := TActiveRecordQueryADO.Create(AClassActiveRecord, FCommandSQL, AConnection);
end;

procedure TActiveRecordQueryFactoryADO.PrepareCommandSQL;

  procedure Add(const ACommandSQL: string);
  begin
    FCommandSQL := FCommandSQL + ACommandSQL + #13#10;
  end;

var
  LMetadata: IActiveRecordMetadata;
  laco: Integer;
  LLimitadorSeletivoQuantidadeRegistros, LLimitadorCondicionalQuantidadeRegistros: string;
begin
  LMetadata := FClassActiveRecord.Metadata;
  if FTop > 0 then
  begin
    LLimitadorSeletivoQuantidadeRegistros := ActiveRecordDependenciaProjeto.LimitadorSeletivoQuantidadeRegistros(FTop);
    LLimitadorCondicionalQuantidadeRegistros := ActiveRecordDependenciaProjeto.LimitadorCondicionalQuantidadeRegistros(FTop, False);
  end;
  if LLimitadorCondicionalQuantidadeRegistros <> '' then
    FCommandSQL := 'select * from (select'
  else
    FCommandSQL := 'select';
  if LLimitadorSeletivoQuantidadeRegistros <> '' then
    Add('  ' + LLimitadorSeletivoQuantidadeRegistros);
  for laco := 0 to LMetadata.FieldCount - 2 do
    Add('  ' + LowerCase(LMetadata.FieldMetadata(laco).Name) + ',');
  Add('  ' + LowerCase(LMetadata.FieldMetadata(LMetadata.FieldCount - 1).Name));
  Add('from');
  Add('  ' + LowerCase(LMetadata.TableMetadata.Name));
  if FWhere <> '' then
  begin
    Add('where');
    Add('  ' + FWhere);
  end;
  if FOrderBy <> '' then
  begin
    Add('order by');
    Add('  ' + FOrderBy);
  end;
  if LLimitadorCondicionalQuantidadeRegistros <> '' then
  begin
    Add(')');
    Add('where');
    Add('  ' + LLimitadorCondicionalQuantidadeRegistros);
  end;
end;

{ TActiveRecordQueryFactoryADOJoinTable }

constructor TActiveRecordQueryFactoryADOJoinTable.Create(AClassActiveRecord: TClassActiveRecord;
  const ARelationshipIndexs: array of Integer);
var
  laco, acumulado: Integer;
  LMetadata, LRelMetadata: IActiveRecordMetadata;
  LFields: TStringList;
begin
  inherited Create(AClassActiveRecord);
  SetLength(FRelationships, Length(ARelationshipIndexs));
  SetLength(FOffsets, Length(ARelationshipIndexs));
  SetLength(FPrimaryKeyLastFieldIndex, Length(ARelationshipIndexs) + 1);
  LMetadata := AClassActiveRecord.Metadata;
  acumulado := LMetadata.FieldCount;
  LFields := TStringList.Create;
  try
    LFields.CommaText := LMetadata.TableMetadata.PrimaryKeyFields;
    FPrimaryKeyLastFieldIndex[0] := LMetadata.IndexOfName(LFields[LFields.Count - 1]);
    for laco := 0 to High(ARelationshipIndexs) do
    begin
      FOffsets[laco] := acumulado;
      FRelationships[laco] := LMetadata.RelationshipMetadata(ARelationshipIndexs[laco]);
      LRelMetadata := FRelationships[laco].ClassActiveRecord.Metadata;
      LFields.CommaText := LRelMetadata.TableMetadata.PrimaryKeyFields;
      FPrimaryKeyLastFieldIndex[laco + 1] := LRelMetadata.IndexOfName(LFields[LFields.Count - 1]) + acumulado;
      acumulado := acumulado + LRelMetadata.FieldCount;
    end;
  finally
    LFields.Free;
  end;
end;

function TActiveRecordQueryFactoryADOJoinTable.CreateQuery(const AConnection: IActiveRecordConnection;
  AClassActiveRecord: TClassActiveRecord): IActiveRecordQuery;
begin
  if FCommandSQL = '' then
    PrepareCommandSQL;
  if AClassActiveRecord = nil then
    AClassActiveRecord := ClassActiveRecord;
  Result := TActiveRecordQueryADOJoinTable.Create(AClassActiveRecord, FCommandSQL, AConnection, FRelationships,
    FOffsets, FPrimaryKeyLastFieldIndex);
end;

procedure TActiveRecordQueryFactoryADOJoinTable.PrepareCommandSQL;
var
  LMetadata: IActiveRecordMetadata;
  LMetadataJoin: IActiveRecordMetadata;
  LRelationshipMetadata: TRelationshipMetadata;
  LListaFrom, LListaTo, LListaAdditionalToConditions: TStringList;

  function OnClause(AAlias: Char): string;
  var
    laco: Integer;
  begin
    LListaFrom.CommaText := LRelationshipMetadata.FromFields;
    LListaTo.CommaText := LRelationshipMetadata.ToFields;
    LListaAdditionalToConditions.CommaText := LRelationshipMetadata.AdditionalToConditions;
    Result := '';
    for laco := 0 to LListaFrom.Count - 1 do
    begin
      if laco <> 0 then
        Result := Result + ' and ';
      Result := Result + 'a.' + LowerCase(LListaFrom[laco]) + ' = ' + AAlias + '.' + LowerCase(LListaTo[laco]);
    end;
    for laco := 0 to LListaAdditionalToConditions.Count - 1 do
    begin
      if (LListaFrom.Count > 0) or (laco <> 0) then
        Result := Result + ' and ';
      Result := Result + AAlias + '.' + LowerCase(LListaAdditionalToConditions[laco]);
    end;
  end;

  function WhereClause: string;
  var
    laco: Integer;
    LRelationshipMetadata: IActiveRecordMetadata;
    LAlias: Char;
  begin
    Result := '';
    if LMetadata.TableMetadata.DeletedField <> '' then
      Result := 'a.' + LowerCase(LMetadata.TableMetadata.DeletedField) +
        ' is null';
    for laco := 0 to High(FRelationships) do
    begin
      LRelationshipMetadata := FRelationships[laco].ClassActiveRecord.Metadata;
      if (FRelationships[laco].RelationshipType = arrtOneToMany) and
        (LRelationshipMetadata.TableMetadata.DeletedField <> '') then
      begin
        LAlias := Chr(Ord('b') + laco);
        if Result <> '' then
          Result := Result + ' and ';
        Result := Result + LAlias + '.' + LowerCase(LRelationshipMetadata.TableMetadata.DeletedField) + ' is null';
      end;
    end;
  end;

  function OrderByClause: string;
  var
    laco, laco2: Integer;
    LAlias: Char;
  begin
    LListaFrom.CommaText := LMetadata.TableMetadata.PrimaryKeyFields;
    Result := '';
    for laco := 0 to LListaFrom.Count - 1 do
    begin
      if laco <> 0 then
        Result := Result + ', ';
      Result := Result + 'a.' + LowerCase(LListaFrom[laco]);
    end;
    for laco := 0 to High(FRelationships) do
      if FRelationships[laco].RelationshipType = arrtOneToMany then
      begin
        LAlias := Chr(Ord('b') + laco);
        LListaFrom.CommaText := FRelationships[laco].ClassActiveRecord.Metadata.TableMetadata.PrimaryKeyFields;
        for laco2 := 0 to LListaTo.Count - 1 do
          Result := Result + ', ' + LAlias + '.' + LowerCase(LListaFrom[laco2]);
      end;
  end;

  function AllowTop: Boolean;
  var
    laco: Integer;
  begin
    Result := True;
    for laco := 0 to High(FRelationships) do
      if FRelationships[laco].RelationshipType = arrtOneToMany then
      begin
        Result := False;
        Break;
      end;
  end;

  procedure Add(const ACommandSQL: string);
  begin
    FCommandSQL := FCommandSQL + ACommandSQL + #13#10;
  end;

var
  laco, laco2: Integer;
  LAlias: Char;
  LWhereClause: string;
  LLimitadorSeletivoQuantidadeRegistros, LLimitadorCondicionalQuantidadeRegistros: string;
begin
  LMetadata := FClassActiveRecord.Metadata;
  if (FTop > 0) and AllowTop then
  begin
    LLimitadorSeletivoQuantidadeRegistros := ActiveRecordDependenciaProjeto.LimitadorSeletivoQuantidadeRegistros(FTop);
    LLimitadorCondicionalQuantidadeRegistros := ActiveRecordDependenciaProjeto.LimitadorCondicionalQuantidadeRegistros(FTop, False);
  end;
  LListaFrom := TStringList.Create;
  LListaTo := TStringList.Create;
  LListaAdditionalToConditions := TStringList.Create;
  try
    if LLimitadorCondicionalQuantidadeRegistros <> '' then
      FCommandSQL := 'select * from (select'
    else
      FCommandSQL := 'select';
    if LLimitadorSeletivoQuantidadeRegistros <> '' then
      Add('  ' + LLimitadorSeletivoQuantidadeRegistros);
    for laco := 0 to LMetadata.FieldCount - 2 do
      Add('  a.' + LowerCase(LMetadata.FieldMetadata(laco).Name) + ' a_' +
        LowerCase(LMetadata.FieldMetadata(laco).Name) + ',');
    Add('  a.' + LowerCase(LMetadata.FieldMetadata(LMetadata.FieldCount - 1).Name) + ' a_' +
      LowerCase(LMetadata.FieldMetadata(LMetadata.FieldCount - 1).Name));
    for laco := 0 to High(FRelationships) do
    begin
      LRelationshipMetadata := FRelationships[laco];
      if LRelationshipMetadata.Metadata <> nil then
        LMetadataJoin := LRelationshipMetadata.Metadata
      else
        LMetadataJoin := LRelationshipMetadata.ClassActiveRecord.Metadata;
      LAlias := Chr(Ord('b') + laco);
      for laco2 := 0 to LMetadataJoin.FieldCount - 1 do
        Add('  , ' + LAlias + '.' + LowerCase(LMetadataJoin.FieldMetadata(laco2).Name) + ' ' + LAlias + '_' +
          LowerCase(LMetadataJoin.FieldMetadata(laco2).Name));
    end;
    Add('from');
    Add('  ' + LowerCase(LMetadata.TableMetadata.Name) + ' a');
    for laco := 0 to High(FRelationships) do
    begin
      LRelationshipMetadata := FRelationships[laco];
      if LRelationshipMetadata.Metadata <> nil then
        LMetadataJoin := LRelationshipMetadata.Metadata
      else
        LMetadataJoin := LRelationshipMetadata.ClassActiveRecord.Metadata;
      LAlias := Chr(Ord('b') + laco);
      Add('  left join ' + LowerCase(LMetadataJoin.TableMetadata.Name) + ' ' + LAlias + ' on (' + OnClause(LAlias) +
        ')');
    end;
    LWhereClause := WhereClause;
    if (FWhere <> '') or (LWhereClause <> '') then
    begin
      Add('where');
      Add('  ' + FWhere);
      if (FWhere <> '') and (LWhereClause <> '') then
        Add('  and');
      Add('  ' + LWhereClause);
    end;
    Add('order by');
    if FOrderBy <> '' then
      Add('  ' + FOrderBy)
    else
      Add('  ' + OrderByClause);
    if LLimitadorCondicionalQuantidadeRegistros <> '' then
    begin
      Add(')');
      Add('where');
      Add('  ' + LLimitadorCondicionalQuantidadeRegistros);
    end;
  finally
    LListaAdditionalToConditions.Free;
    LListaTo.Free;
    LListaFrom.Free;
  end;
end;

{ TActiveRecordQueryADOBase }

function TActiveRecordQueryADOBase.ClassActiveRecord: TClassActiveRecord;
begin
  Result := FClassActiveRecord;
end;

constructor TActiveRecordQueryADOBase.Create(AClassActiveRecord: TClassActiveRecord; const ACommandSQL: string;
  const AConnection: IActiveRecordConnection);
begin
  Assert(AConnection <> nil, 'Falta definir a conexão');
  inherited Create;
  FClassActiveRecord := AClassActiveRecord;
  FConnection := AConnection as IActiveRecordConnectionADO;
  FParameterPosition := -1;
  FCommand := CoCommand.Create;
  FCommand.CommandType := adCmdText;
  FCommand.CommandText := ACommandSQL;
end;

function TActiveRecordQueryADOBase.CreateRecordSet: _RecordSet;
var
  LRecordsAffected: OleVariant;
begin
  FCommand.Set_ActiveConnection(FConnection.ADOConnection);
  Result := FCommand.Execute(LRecordsAffected, EmptyParam, 0);
end;

function TActiveRecordQueryADOBase.CurrentItemActiveRecord: IActiveRecord;
begin
  Result := FCurrentItemActiveRecord;
end;

function TActiveRecordQueryADOBase.FirstActiveRecord: IActiveRecord;
begin
  Result := nil;
  if Next then
    Result := FCurrentItemActiveRecord;
  if Assigned(FRecordSet) then
  begin
    FRecordSet.Close;
    FRecordSet := nil;
    FCommand.Set_ActiveConnection(nil);
  end;
  FParameterPosition := -1;
end;

function TActiveRecordQueryADOBase.PrepareParameter: Integer;
begin
  if Assigned(FRecordSet) then
  begin                         
    FRecordSet.Close;
    FRecordSet := nil;
    FCommand.Set_ActiveConnection(nil);
    FParameterPosition := -1;
  end;
  Inc(FParameterPosition);
  Result := FParameterPosition;
end;

procedure TActiveRecordQueryADOBase.SetNextParameter(const Value: Integer);
begin
  SetParameter(adInteger, 0, Value);
end;

procedure TActiveRecordQueryADOBase.SetNextParameter(const Value: string);
begin
  SetParameter(adVarChar, 255, Value);
end;

procedure TActiveRecordQueryADOBase.SetNextParameter(const Value: TNullableCurrency);
begin
  SetParameter(adCurrency, 0, TActiveRecord.ToVariant(Value));
end;

procedure TActiveRecordQueryADOBase.SetNextParameter(const Value: TNullableDateTime);
begin
  SetParameter(adDBTimeStamp, 0, TActiveRecord.ToVariant(Value));
end;

procedure TActiveRecordQueryADOBase.SetNextParameter(const Value: TNullableExtended);
begin
  SetParameter(adDouble, 0, TActiveRecord.ToVariant(Value));
end;

procedure TActiveRecordQueryADOBase.SetNextParameter(const Value: TNullableInteger);
begin
  SetParameter(adInteger, 0, TActiveRecord.ToVariant(Value));
end;

procedure TActiveRecordQueryADOBase.SetNextParameter(const Value: TNullableString);
begin
  SetParameter(adVarChar, 255, TActiveRecord.ToVariant(Value));
end;

procedure TActiveRecordQueryADOBase.SetNextParameterB01(const Value: Boolean);
begin
  SetParameter(adInteger, 0, Ord(Value));
end;

procedure TActiveRecordQueryADOBase.SetNextParameterB01(const Value: TNullableBoolean);
begin
  SetParameter(adInteger, 0, TActiveRecord.ToVariantB01(Value));
end;

procedure TActiveRecordQueryADOBase.SetNextParameterCurrency(const Value: Currency);
begin
  SetParameter(adCurrency, 0, Value);
end;

procedure TActiveRecordQueryADOBase.SetNextParameterDateTime(const Value: TDateTime);
begin
  SetParameter(adDBTimeStamp, 0, Value);
end;

procedure TActiveRecordQueryADOBase.SetNextParameterExtended(const Value: Extended);
begin
  SetParameter(adDouble, 0, Value);
end;

procedure TActiveRecordQueryADOBase.SetNextParameterMemo(const Value: string);
begin
  SetParameter(adLongVarChar, MaxInt, Value);
end;

procedure TActiveRecordQueryADOBase.SetNextParameterMemo(const Value: TNullableString);
begin
  SetParameter(adLongVarChar, MaxInt, TActiveRecord.ToVariant(Value));
end;

procedure TActiveRecordQueryADOBase.SetNextParameterNS(const Value: Boolean);
begin
  SetParameter(adVarChar, 1, NS[Value]);
end;

procedure TActiveRecordQueryADOBase.SetNextParameterNS(const Value: TNullableBoolean);
begin
  SetParameter(adVarChar, 1, TActiveRecord.ToVariantNS(Value));
end;

procedure TActiveRecordQueryADOBase.SetParameter(AType: DataTypeEnum; ASize: Integer; AValue: OleVariant);
var
  LPosition: Integer;
begin
  LPosition := PrepareParameter;
  if LPosition = FCommand.Parameters.Count then
    FCommand.Parameters.Append(FCommand.CreateParameter('', AType, adParamInput, ASize, AValue))
  else
    FCommand.Parameters.Item[LPosition].Value := AValue;
end;

{ TActiveRecordQueryADO }

function TActiveRecordQueryADO.Next: Boolean;
var
  LActiveRecord: TActiveRecord;
begin
  FCurrentItemActiveRecord := nil;
  if Assigned(FRecordSet) then
    FRecordSet.MoveNext
  else
    FRecordSet := CreateRecordSet;
  Result := not FRecordSet.Eof;
  if Result then
  begin
    LActiveRecord := FClassActiveRecord.Create(FConnection);
    try
      LActiveRecord.SetRecordSet(FRecordSet, 0);
      LActiveRecord.AfterLoad;
    except
      LActiveRecord.Free;
      raise;
    end;
    FCurrentItemActiveRecord := LActiveRecord;
  end
  else
  begin
    FRecordSet.Close;
    FRecordSet := nil;
    FCommand.Set_ActiveConnection(nil);
    FParameterPosition := -1;
  end;
end;

{ TResultadoSQLQueryADO }

constructor TResultadoSQLQueryADO.Create(AClassActiveRecord: TClassActiveRecord; const ACommandSQL: string;
  const AConnection: IActiveRecordConnection; const LActiveRecordMetadataWritable: IActiveRecordMetadataWritable);
begin
  inherited Create(AClassActiveRecord, ACommandSQL, AConnection);
  FActiveRecordMetadataWritable := LActiveRecordMetadataWritable;
end;

procedure TResultadoSQLQueryADO.DescobreMetadata(const LActiveRecordMetadataWritable: IActiveRecordMetadataWritable;
  const AADORecordSet: _RecordSet);

  function DataType2FieldType(ADataType: DataTypeEnum): TFieldTypeMetadata;
  begin
    case ADataType of
      adTinyInt, adSmallInt, adInteger, adBigInt, adUnsignedTinyInt, adUnsignedSmallInt, adUnsignedInt,
        adUnsignedBigInt: Result := arftInteger;
      adSingle, adDouble: Result := arftFloat;
      adCurrency, adDecimal, adNumeric: Result := arftMoney;
      adBoolean: Result := arftB01;
      adDate, adDBDate, adDBTime, adDBTimeStamp: Result := arftDateTime;
      adBSTR, adChar, adVarChar, adLongVarChar, adWChar, adVarWChar, adLongVarWChar: Result := arftVarchar;
    else
      Result := TFieldTypeMetadata(-1);
    end;
  end;

  function GetColumnCharWidth(AFieldType: TFieldTypeMetadata; ASize: Integer): Integer;
  begin
    Result := 0;
    case AFieldType of
      arftDateTime: Result := ColumnCharWidthForDateTime;
      arftFloat: Result := ColumnCharWidthForFloat;
      arftInteger: Result := ColumnCharWidthForInteger;
      arftMoney: Result := ColumnCharWidthForMoney;
      arftNS: Result := ColumnCharWidthForNS;
      arftVarchar: Result := ASize;
      arftMemo: Result := ColumnCharWidthForMemo;
      arftB01: Result := ColumnCharWidthForB01;
      arftColor: Result := ColumnCharWidthForColor;
    else
      Assert(False, 'Falta definir GetColumnCharWidth');
    end;
  end;

var
  LTableMetadata: TTableMetadata;
  laco: Integer;
  LFieldType: TFieldTypeMetadata;
begin
  LTableMetadata.Name := ClassActiveRecord.ClassName;
  LTableMetadata.PrimaryKeyFields := '';
  LTableMetadata.DeletedField := '';
  LActiveRecordMetadataWritable.SetTableMetadata(LTableMetadata);
  for laco := 0 to AADORecordSet.Fields.Count - 1 do
  begin
    LFieldType := DataType2FieldType(AADORecordSet.Fields[laco].Type_);
    LActiveRecordMetadataWritable.ConfigNewFieldMetadata
      .SetName(AADORecordSet.Fields[laco].Name)
      .SetFieldType(LFieldType)
      .SetLength(AADORecordSet.Fields[laco].DefinedSize)
      .SetNullable(True)
      .SetCaption(AADORecordSet.Fields[laco].Name)
      .SetVisible(True)
      .SetReadOnly(True)
      .SetCommented(False)
      .SetTitle(AADORecordSet.Fields[laco].Name)
      .SetColumnCharWidth(GetColumnCharWidth(LFieldType, AADORecordSet.Fields[laco].DefinedSize))
      .Write;
  end;
  if ClassActiveRecord.InheritsFrom(TResultadoSQL) then
    TClassResultadoSQL(ClassActiveRecord).AjustaMetadata(LActiveRecordMetadataWritable);
end;

function TResultadoSQLQueryADO.Next: Boolean;
var
  LActiveRecord: TActiveRecord;
begin
  FCurrentItemActiveRecord := nil;
  if Assigned(FRecordSet) then
    FRecordSet.MoveNext
  else
  begin
    FRecordSet := CreateRecordSet;
    DescobreMetadata(FActiveRecordMetadataWritable, FRecordSet);
  end;
  Result := not FRecordSet.Eof;
  if Result then
  begin
    LActiveRecord := FClassActiveRecord.Create(FConnection);
    try
      if LActiveRecord is TResultadoSQL then
        TResultadoSQL(LActiveRecord).SetMetadata(FActiveRecordMetadataWritable);
      LActiveRecord.SetRecordSet(FRecordSet, 0);
      LActiveRecord.AfterLoad;
    except
      LActiveRecord.Free;
      raise;
    end;
    FCurrentItemActiveRecord := LActiveRecord;
  end
  else
  begin
    FRecordSet.Close;
    FRecordSet := nil;
    FCommand.Set_ActiveConnection(nil);
    FParameterPosition := -1;
  end;
end;

{ TActiveRecordQueryADOJoinTable }

constructor TActiveRecordQueryADOJoinTable.Create(AClassActiveRecord: TClassActiveRecord; const ACommandSQL: string;
  const AConnection: IActiveRecordConnection; const ARelationships: TRelationshipsArray; const AOffsets: TOffsetsArray;
  const APrimaryKeyLastFieldIndex: TPrimaryKeyLastFieldIndexArray);
begin
  inherited Create(AClassActiveRecord, ACommandSQL, AConnection);
  FRelationships := ARelationships;
  FOffsets := AOffsets;
  FPrimaryKeyLastFieldIndex := APrimaryKeyLastFieldIndex;
end;

function TActiveRecordQueryADOJoinTable.Next: Boolean;
var
  LActiveRecord, LActiveRecordChild: TActiveRecord;
  LValorPrimaryKey: Variant;
  laco: Integer;
begin
  FCurrentItemActiveRecord := nil;
  if not Assigned(FRecordSet) then
    FRecordSet := CreateRecordSet;
  Result := not FRecordSet.Eof;
  if Result then
  begin
    LActiveRecord := FClassActiveRecord.Create(FConnection);
    try
      LActiveRecord.SetRecordSet(FRecordSet, 0);
      LActiveRecord.AfterLoad;
    except
      LActiveRecord.Free;
      raise;
    end;
    FCurrentItemActiveRecord := LActiveRecord;
    for laco := 0 to High(FRelationships) do
      if (FRelationships[laco].RelationshipType in [arrtManyToOne, arrtOneToOne]) and
        (not VarIsNull(FRecordSet.Fields[FPrimaryKeyLastFieldIndex[laco + 1]].Value)) then
      begin
        LActiveRecordChild := LActiveRecord.CreateItemRelationship(FRelationships[laco].Index);
        LActiveRecordChild.SetRecordSet(FRecordSet, FOffsets[laco]);
        LActiveRecordChild.AfterLoad;
      end;
    LValorPrimaryKey := TActiveRecord.CheckVariant(FRecordSet.Fields[FPrimaryKeyLastFieldIndex[0]].Value);
    while (not FRecordSet.Eof) and
      (TActiveRecord.CheckVariant(FRecordSet.Fields[FPrimaryKeyLastFieldIndex[0]].Value) = LValorPrimaryKey) do
    begin
      for laco := 0 to High(FRelationships) do
        if (FRelationships[laco].RelationshipType = arrtOneToMany) and
          (not VarIsNull(FRecordSet.Fields[FPrimaryKeyLastFieldIndex[laco + 1]].Value)) then
        begin
          LActiveRecordChild := LActiveRecord.CreateItemRelationship(FRelationships[laco].Index);
          LActiveRecordChild.SetRecordSet(FRecordSet, FOffsets[laco]);
          LActiveRecordChild.AfterLoad;
        end;
      FRecordSet.MoveNext;
    end;
  end
  else
  begin
    FRecordSet.Close;
    FRecordSet := nil;
    FCommand.Set_ActiveConnection(nil);
    FParameterPosition := -1;
  end;
end;

{ TActiveRecordSingletonADO }

function TActiveRecordSingletonADO.Execute: Integer;
var
  LRecordsAffected: OleVariant;
begin
  {http://msdn.microsoft.com/en-us/library/aa496013(v=sql.80).aspx
  Whenever possible, execute action queries (INSERT, UPDATE, and DELETE statements or stored procedures that perform
  these operations) instead of using updateable Recordset cursors. In this case, make sure you use the Execute method
  and its adExecuteNoRecords option to ensure that ADO knows that it doesn't need to construct a Recordset.}
  Command.Execute(LRecordsAffected, EmptyParam, adExecuteNoRecords);
  Result := LRecordsAffected;
  Command.Set_ActiveConnection(nil);
  FConnection := nil;
end;

function TActiveRecordSingletonADO.ExecuteReturnAutoInc: Integer;
var
  LRecordsAffected: OleVariant;
  LRecordSet: _RecordSet;
begin
  LRecordSet := Command.Execute(LRecordsAffected, EmptyParam, 0);
  try
    Result := LRecordSet.Fields[0].Value;
  finally
    LRecordSet.Close;
    Command.Set_ActiveConnection(nil);
    FConnection := nil;
  end;
end;

function TActiveRecordSingletonADO.GetNewCtrl_ID(const ACtrlIDName: string): Integer;
begin
  Result := ActiveRecordDependenciaProjeto.GetNewCtrl_Id(ACtrlIDName, FConnection);
end;

procedure TActiveRecordSingletonADO.InitializePrivate;
begin
  inherited;
  FCommand := CoCommand.Create;
  FCommand.CommandType := adCmdText;
  FCommand.CommandText := GetCommandSQL;
  DefineParameters;
end;

procedure TActiveRecordSingletonADO.Persist(AActiveRecord: TActiveRecord);
begin
  SetConnection(AActiveRecord.FConnection);
end;

procedure TActiveRecordSingletonADO.SetConnection(const AConnection: IActiveRecordConnection);
begin
  FConnection := AConnection;
  FCommand.Set_ActiveConnection((AConnection as IActiveRecordConnectionADO).ADOConnection);
end;

function TActiveRecordSingletonADO.SQLNow: string;
begin
  Result := ActiveRecordDependenciaProjeto.SQLNow;
end;

initialization

  TActiveRecordTotalizacao.SelfRegister(IActiveRecordTotalizacao);

finalization

  GDefaultConnection := nil;

end.
