{ template: Model.pas_template }
unit uNFCedenteModel;

interface

uses
  SysUtils, ServiceLocator, uActiveRecord, uARNFCedente;

type
  INFCedenteModel = interface(IARNFCedente)
    ['{5EBABA01-1B90-454D-8263-4400934957AB}']
  end;

  IIteratorNFCedenteModel = interface(IIteratorActiveRecord)
    ['{E2AD7DC8-3C54-4B1D-B351-836796FA4742}']
    function CurrentItem: INFCedenteModel;
  end;

  ICollectionNFCedenteModel = interface(ICollectionActiveRecord)
    ['{81D30E71-589C-40EB-8C2E-48768342E5AD}']
    function GetItem(Index: Integer): INFCedenteModel;

    function Add(const Item: INFCedenteModel): Integer;
    function First: INFCedenteModel;
    procedure Insert(Index: Integer; const Item: INFCedenteModel);
    function Last: INFCedenteModel;
    function New(const AConnection: IActiveRecordConnection): INFCedenteModel;
    property Item[Index: Integer]: INFCedenteModel read GetItem; default;
  end;

  TCollectionNFCedenteModel = class(TCollectionARNFCedente, ICollectionNFCedenteModel)
  protected
    { ICollectionNFCedenteModel }
    function GetItem(Index: Integer): INFCedenteModel;

    function Add(const Item: INFCedenteModel): Integer;
    function First: INFCedenteModel;
    procedure Insert(Index: Integer; const Item: INFCedenteModel);
    function Last: INFCedenteModel;
    function New(const AConnection: IActiveRecordConnection): INFCedenteModel;
  end;

  TIteratorNFCedenteModelDecorator = class(TIteratorARNFCedenteDecorator, IIteratorNFCedenteModel)
  protected
    { IIteratorNFCedenteModel }
    function CurrentItem: INFCedenteModel;
  public
    class function Decore(const ACollectionNFCedenteModel: ICollectionNFCedenteModel): IIteratorNFCedenteModel;
  end;

  TIteratorNFCedenteModelQueryDecorator = class(TIteratorActiveRecordQueryDecorator, IIteratorNFCedenteModel)
  protected
    { IIteratorNFCedenteModel }
    function CurrentItem: INFCedenteModel;
  public
    class function Decore(const ANFCedenteModelQuery: IActiveRecordQuery): IIteratorNFCedenteModel;
  end;

  INFCedenteModelService = interface(IActiveRecordService)
    ['{7E4C0237-07BD-400D-BE4B-1AA18C6EFDED}']
  end;

  TNFCedenteModel = class(TARNFCedente, INFCedenteModel)
  private
  protected
    //procedure AfterLoad; override;
    //procedure AfterSave; override;
    //procedure BeforeSave; override;
    //procedure CopyFrom(AActiveRecord: TActiveRecord); override;
    //procedure Validate(const AActiveRecordCallBackValidate: IActiveRecordCallBackValidate); override;
    { IActiveRecordAccess }
    {procedure Clear(Index: Integer); override;
    function DisplayText(Index: Integer): string; override;
    function GetAsString(Index: Integer): string; override;
    function GetValue(Index: Integer): Variant; override;
    function IsNull(Index: Integer): Boolean; override;
    procedure SetAsString(Index: Integer; const Value: string); override;
    procedure SetValue(Index: Integer; const Value: Variant); override;}
    { INFCedenteModel }
  public
    //constructor Create(const AConnection: IActiveRecordConnection); override;
    class function GUIDItem: TGUID; override;
    //class function Metadata: IActiveRecordMetadata; override;
    //class function ViewMetadata: IActiveRecordMetadata; override;
  end;

  TNFCedenteModelService = class(TActiveRecordService, INFCedenteModelService)
  protected
    { INFCedenteModelService }
  end;

{const
  Campo_NFCedente_ = NFCedente_ReferenciaParaNovosCampos;
  NFCedenteModelAdditionalFields: array [0..0] of TFieldMetadata = (
    (Index: Campo_NFCedente_; Name: ''; FieldType: arftInteger; Length: 0; Nullable: False;
      Caption: ''; Visible: True; ReadOnly: True; Commented: False;
      Title: ''; ColumnCharWidth: ColumnCharWidthFor...)
    );}
  
implementation

//var
  //GNFCedenteModelMetadata: IActiveRecordMetadataWritable;
  //GNFCedenteModelViewMetadata: IActiveRecordMetadataWritable;

{ TCollectionNFCedenteModel }

function TCollectionNFCedenteModel.Add(const Item: INFCedenteModel): Integer;
begin
  Result := inherited Add(Item as IARNFCedente);
end;

function TCollectionNFCedenteModel.First: INFCedenteModel;
begin
  Result := (inherited First) as INFCedenteModel;
end;

function TCollectionNFCedenteModel.GetItem(Index: Integer): INFCedenteModel;
begin
  Result := (inherited GetItem(Index)) as INFCedenteModel;
end;

procedure TCollectionNFCedenteModel.Insert(Index: Integer; const Item: INFCedenteModel);
begin
  inherited Insert(Index, Item as IARNFCedente);
end;

function TCollectionNFCedenteModel.Last: INFCedenteModel;
begin
  Result := (inherited Last) as INFCedenteModel;
end;

function TCollectionNFCedenteModel.New(const AConnection: IActiveRecordConnection): INFCedenteModel;
begin
  Result := ClassActiveRecord.Create(AConnection) as INFCedenteModel;
  Add(Result);
end;

{ TIteratorNFCedenteModelDecorator }

function TIteratorNFCedenteModelDecorator.CurrentItem: INFCedenteModel;
begin
  Result := CurrentItemActiveRecord as INFCedenteModel;
end;

class function TIteratorNFCedenteModelDecorator.Decore(const ACollectionNFCedenteModel: ICollectionNFCedenteModel): IIteratorNFCedenteModel;
begin
  Result := Create(ACollectionNFCedenteModel);
end;

{ TIteratorNFCedenteModelQueryDecorator }

function TIteratorNFCedenteModelQueryDecorator.CurrentItem: INFCedenteModel;
begin
  Result := CurrentItemActiveRecord as INFCedenteModel;
end;

class function TIteratorNFCedenteModelQueryDecorator.Decore(const ANFCedenteModelQuery: IActiveRecordQuery): IIteratorNFCedenteModel;
begin
  Result := Create(ANFCedenteModelQuery);
end;

{ TNFCedenteModel }

class function TNFCedenteModel.GUIDItem: TGUID;
begin
  Result := INFCedenteModel;
end;

initialization

  TNFCedenteModelService.SelfRegister(INFCedenteModelService);

  { Definições do Metadata, descomente o "class function Metadata" e Coloque no Result a variavel abaixo }
  //GNFCedenteModelMetadata := TActiveRecordMetadataWritable.Create;
  //GNFCedenteModelMetadata.CopyFrom(TARNFCedente.Metadata);
  //Incluir aqui alterações em relação ao Metadata original

  { Definições do ViewMetadata, descomente o "class function ViewMetadata" e Coloque no Result a variavel abaixo }
  //GNFCedenteModelViewMetadata := TActiveRecordMetadataWritable.Create;
  //GNFCedenteModelViewMetadata.CopyFrom(TNFCedenteModel.Metadata);
  //Incluir aqui informações que apenas aparecem para o usuário (não são gravadas no banco)
  //GNFCedenteModelViewMetadata.AddFieldsMetadata(NFCedenteModelAdditionalFields);

finalization

  //GNFCedenteModelMetadata := nil;
  //GNFCedenteModelViewMetadata := nil;

end.