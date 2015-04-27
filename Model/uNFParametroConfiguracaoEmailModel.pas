{ template: Model.pas_template }
unit uNFParametroConfiguracaoEmailModel;

interface

uses
  SysUtils, ServiceLocator, uActiveRecord, uARNFParametroConfiguracaoEmail;

type
  INFParametroConfiguracaoEmailModel = interface(IARNFParametroConfiguracaoEmail)
    ['{037918A5-8EB2-471D-A161-9DC04B241AC4}']
  end;

  IIteratorNFParametroConfiguracaoEmailModel = interface(IIteratorActiveRecord)
    ['{1E6530E4-A124-414E-8839-FEA862817FF8}']
    function CurrentItem: INFParametroConfiguracaoEmailModel;
  end;

  ICollectionNFParametroConfiguracaoEmailModel = interface(ICollectionActiveRecord)
    ['{9652027D-107F-401B-BB78-84B0814B9C5D}']
    function GetItem(Index: Integer): INFParametroConfiguracaoEmailModel;

    function Add(const Item: INFParametroConfiguracaoEmailModel): Integer;
    function First: INFParametroConfiguracaoEmailModel;
    procedure Insert(Index: Integer; const Item: INFParametroConfiguracaoEmailModel);
    function Last: INFParametroConfiguracaoEmailModel;
    function New(const AConnection: IActiveRecordConnection): INFParametroConfiguracaoEmailModel;
    property Item[Index: Integer]: INFParametroConfiguracaoEmailModel read GetItem; default;
  end;

  TCollectionNFParametroConfiguracaoEmailModel = class(TCollectionARNFParametroConfiguracaoEmail, ICollectionNFParametroConfiguracaoEmailModel)
  protected
    { ICollectionNFParametroConfiguracaoEmailModel }
    function GetItem(Index: Integer): INFParametroConfiguracaoEmailModel;

    function Add(const Item: INFParametroConfiguracaoEmailModel): Integer;
    function First: INFParametroConfiguracaoEmailModel;
    procedure Insert(Index: Integer; const Item: INFParametroConfiguracaoEmailModel);
    function Last: INFParametroConfiguracaoEmailModel;
    function New(const AConnection: IActiveRecordConnection): INFParametroConfiguracaoEmailModel;
  end;

  TIteratorNFParametroConfiguracaoEmailModelDecorator = class(TIteratorARNFParametroConfiguracaoEmailDecorator, IIteratorNFParametroConfiguracaoEmailModel)
  protected
    { IIteratorNFParametroConfiguracaoEmailModel }
    function CurrentItem: INFParametroConfiguracaoEmailModel;
  public
    class function Decore(const ACollectionNFParametroConfiguracaoEmailModel: ICollectionNFParametroConfiguracaoEmailModel): IIteratorNFParametroConfiguracaoEmailModel;
  end;

  TIteratorNFParametroConfiguracaoEmailModelQueryDecorator = class(TIteratorActiveRecordQueryDecorator, IIteratorNFParametroConfiguracaoEmailModel)
  protected
    { IIteratorNFParametroConfiguracaoEmailModel }
    function CurrentItem: INFParametroConfiguracaoEmailModel;
  public
    class function Decore(const ANFParametroConfiguracaoEmailModelQuery: IActiveRecordQuery): IIteratorNFParametroConfiguracaoEmailModel;
  end;

  INFParametroConfiguracaoEmailModelService = interface(IActiveRecordService)
    ['{74CF0F7D-7B0F-4A04-AB62-8B4BCE984024}']
    function Find(const AConnection: IActiveRecordConnection): INFParametroConfiguracaoEmailModel;
  end;

  TNFParametroConfiguracaoEmailModel = class(TARNFParametroConfiguracaoEmail, INFParametroConfiguracaoEmailModel)
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
    { INFParametroConfiguracaoEmailModel }
  public
    //constructor Create(const AConnection: IActiveRecordConnection); override;
    class function GUIDItem: TGUID; override;
    //class function Metadata: IActiveRecordMetadata; override;
    //class function ViewMetadata: IActiveRecordMetadata; override;
  end;

  TNFParametroConfiguracaoEmailModelService = class(TActiveRecordService, INFParametroConfiguracaoEmailModelService)
  protected
    { INFParametroConfiguracaoEmailModelService }
    function Find(const AConnection: IActiveRecordConnection): INFParametroConfiguracaoEmailModel;
  end;

{const
  Campo_NFParametroConfiguracaoEmail_ = NFParametroConfiguracaoEmail_ReferenciaParaNovosCampos;
  NFParametroConfiguracaoEmailModelAdditionalFields: array [0..0] of TFieldMetadata = (
    (Index: Campo_NFParametroConfiguracaoEmail_; Name: ''; FieldType: arftInteger; Length: 0; Nullable: False;
      Caption: ''; Visible: True; ReadOnly: True; Commented: False;
      Title: ''; ColumnCharWidth: ColumnCharWidthFor...)
    );}
  
implementation

//var
  //GNFParametroConfiguracaoEmailModelMetadata: IActiveRecordMetadataWritable;
  //GNFParametroConfiguracaoEmailModelViewMetadata: IActiveRecordMetadataWritable;

{ TCollectionNFParametroConfiguracaoEmailModel }

function TCollectionNFParametroConfiguracaoEmailModel.Add(const Item: INFParametroConfiguracaoEmailModel): Integer;
begin
  Result := inherited Add(Item as IARNFParametroConfiguracaoEmail);
end;

function TCollectionNFParametroConfiguracaoEmailModel.First: INFParametroConfiguracaoEmailModel;
begin
  Result := (inherited First) as INFParametroConfiguracaoEmailModel;
end;

function TCollectionNFParametroConfiguracaoEmailModel.GetItem(Index: Integer): INFParametroConfiguracaoEmailModel;
begin
  Result := (inherited GetItem(Index)) as INFParametroConfiguracaoEmailModel;
end;

procedure TCollectionNFParametroConfiguracaoEmailModel.Insert(Index: Integer; const Item: INFParametroConfiguracaoEmailModel);
begin
  inherited Insert(Index, Item as IARNFParametroConfiguracaoEmail);
end;

function TCollectionNFParametroConfiguracaoEmailModel.Last: INFParametroConfiguracaoEmailModel;
begin
  Result := (inherited Last) as INFParametroConfiguracaoEmailModel;
end;

function TCollectionNFParametroConfiguracaoEmailModel.New(const AConnection: IActiveRecordConnection): INFParametroConfiguracaoEmailModel;
begin
  Result := ClassActiveRecord.Create(AConnection) as INFParametroConfiguracaoEmailModel;
  Add(Result);
end;

{ TIteratorNFParametroConfiguracaoEmailModelDecorator }

function TIteratorNFParametroConfiguracaoEmailModelDecorator.CurrentItem: INFParametroConfiguracaoEmailModel;
begin
  Result := CurrentItemActiveRecord as INFParametroConfiguracaoEmailModel;
end;

class function TIteratorNFParametroConfiguracaoEmailModelDecorator.Decore(const ACollectionNFParametroConfiguracaoEmailModel: ICollectionNFParametroConfiguracaoEmailModel): IIteratorNFParametroConfiguracaoEmailModel;
begin
  Result := Create(ACollectionNFParametroConfiguracaoEmailModel);
end;

{ TIteratorNFParametroConfiguracaoEmailModelQueryDecorator }

function TIteratorNFParametroConfiguracaoEmailModelQueryDecorator.CurrentItem: INFParametroConfiguracaoEmailModel;
begin
  Result := CurrentItemActiveRecord as INFParametroConfiguracaoEmailModel;
end;

class function TIteratorNFParametroConfiguracaoEmailModelQueryDecorator.Decore(const ANFParametroConfiguracaoEmailModelQuery: IActiveRecordQuery): IIteratorNFParametroConfiguracaoEmailModel;
begin
  Result := Create(ANFParametroConfiguracaoEmailModelQuery);
end;

{ TNFParametroConfiguracaoEmailModel }

class function TNFParametroConfiguracaoEmailModel.GUIDItem: TGUID;
begin
  Result := INFParametroConfiguracaoEmailModel;
end;

{ TNFParametroConfiguracaoEmailModelService }

function TNFParametroConfiguracaoEmailModelService.Find(
  const AConnection: IActiveRecordConnection): INFParametroConfiguracaoEmailModel;
begin
  Result := TNFParametroConfiguracaoEmailModel.FindAll(AConnection) as INFParametroConfiguracaoEmailModel;
end;

initialization

  TNFParametroConfiguracaoEmailModelService.SelfRegister(INFParametroConfiguracaoEmailModelService);

  { Definições do Metadata, descomente o "class function Metadata" e Coloque no Result a variavel abaixo }
  //GNFParametroConfiguracaoEmailModelMetadata := TActiveRecordMetadataWritable.Create;
  //GNFParametroConfiguracaoEmailModelMetadata.CopyFrom(TARNFParametroConfiguracaoEmail.Metadata);
  //Incluir aqui alterações em relação ao Metadata original

  { Definições do ViewMetadata, descomente o "class function ViewMetadata" e Coloque no Result a variavel abaixo }
  //GNFParametroConfiguracaoEmailModelViewMetadata := TActiveRecordMetadataWritable.Create;
  //GNFParametroConfiguracaoEmailModelViewMetadata.CopyFrom(TNFParametroConfiguracaoEmailModel.Metadata);
  //Incluir aqui informações que apenas aparecem para o usuário (não são gravadas no banco)
  //GNFParametroConfiguracaoEmailModelViewMetadata.AddFieldsMetadata(NFParametroConfiguracaoEmailModelAdditionalFields);

finalization

  //GNFParametroConfiguracaoEmailModelMetadata := nil;
  //GNFParametroConfiguracaoEmailModelViewMetadata := nil;

end.