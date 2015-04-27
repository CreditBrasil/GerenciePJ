{ template: Model.pas_template }
unit uNFConsultaSerasaModel;

interface

uses
  SysUtils, Classes, ServiceLocator, uActiveRecord, uARNFConsultaSerasa;

type
  INFConsultaSerasaModel = interface(IARNFConsultaSerasa)
    ['{9BE9DA0B-4608-49A8-B35B-B4EFEDFB4A76}']
    procedure CarregaRelatoFormatado(ALinhas: TStrings);
  end;

  IIteratorNFConsultaSerasaModel = interface(IIteratorActiveRecord)
    ['{EFB4DF05-1B0C-42D4-A1D7-85D80FF61B35}']
    function CurrentItem: INFConsultaSerasaModel;
  end;

  ICollectionNFConsultaSerasaModel = interface(ICollectionActiveRecord)
    ['{116F59B1-E5D6-4577-B2EE-52F3EBD56F80}']
    function GetItem(Index: Integer): INFConsultaSerasaModel;

    function Add(const Item: INFConsultaSerasaModel): Integer;
    function First: INFConsultaSerasaModel;
    procedure Insert(Index: Integer; const Item: INFConsultaSerasaModel);
    function Last: INFConsultaSerasaModel;
    function New(const AConnection: IActiveRecordConnection): INFConsultaSerasaModel;
    property Item[Index: Integer]: INFConsultaSerasaModel read GetItem; default;
  end;

  TCollectionNFConsultaSerasaModel = class(TCollectionARNFConsultaSerasa, ICollectionNFConsultaSerasaModel)
  protected
    { ICollectionNFConsultaSerasaModel }
    function GetItem(Index: Integer): INFConsultaSerasaModel;

    function Add(const Item: INFConsultaSerasaModel): Integer;
    function First: INFConsultaSerasaModel;
    procedure Insert(Index: Integer; const Item: INFConsultaSerasaModel);
    function Last: INFConsultaSerasaModel;
    function New(const AConnection: IActiveRecordConnection): INFConsultaSerasaModel;
  end;

  TIteratorNFConsultaSerasaModelDecorator = class(TIteratorARNFConsultaSerasaDecorator, IIteratorNFConsultaSerasaModel)
  protected
    { IIteratorNFConsultaSerasaModel }
    function CurrentItem: INFConsultaSerasaModel;
  public
    class function Decore(const ACollectionNFConsultaSerasaModel: ICollectionNFConsultaSerasaModel): IIteratorNFConsultaSerasaModel;
  end;

  TIteratorNFConsultaSerasaModelQueryDecorator = class(TIteratorActiveRecordQueryDecorator, IIteratorNFConsultaSerasaModel)
  protected
    { IIteratorNFConsultaSerasaModel }
    function CurrentItem: INFConsultaSerasaModel;
  public
    class function Decore(const ANFConsultaSerasaModelQuery: IActiveRecordQuery): IIteratorNFConsultaSerasaModel;
  end;

  INFConsultaSerasaModelService = interface(IActiveRecordService)
    ['{41E7DC64-0072-4A9D-8E6A-16B08B4D5A94}']
    function FindBySConsCnpjCpfAndAntesDeSConsData(ASConsCnpjCpf: string; AAntesDeSConsData: TDateTime;
      const AConnection: IActiveRecordConnection): INFConsultaSerasaModel;
  end;

  TNFConsultaSerasaModel = class(TARNFConsultaSerasa, INFConsultaSerasaModel)
  private
  protected
    //procedure AfterLoad; override;
    //procedure AfterSave; override;
    procedure BeforeSave; override;
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
    { INFConsultaSerasaModel }
    procedure CarregaRelatoFormatado(ALinhas: TStrings);
  public
    //constructor Create(const AConnection: IActiveRecordConnection); override;
    class function GUIDItem: TGUID; override;
    //class function Metadata: IActiveRecordMetadata; override;
    //class function ViewMetadata: IActiveRecordMetadata; override;
  end;

  TNFConsultaSerasaModelService = class(TActiveRecordService, INFConsultaSerasaModelService)
  private
    function QueryBySConsCnpjCpfAndAntesDeSConsData(ASConsCnpjCpf: string; AAntesDeSConsData: TDateTime;
      const AConnection: IActiveRecordConnection): IActiveRecordQuery;
  protected
    { INFConsultaSerasaModelService }
    function FindBySConsCnpjCpfAndAntesDeSConsData(ASConsCnpjCpf: string; AAntesDeSConsData: TDateTime;
      const AConnection: IActiveRecordConnection): INFConsultaSerasaModel;
  end;

{const
  Campo_NFConsultaSerasa_ = NFConsultaSerasa_ReferenciaParaNovosCampos;
  NFConsultaSerasaModelAdditionalFields: array [0..0] of TFieldMetadata = (
    (Index: Campo_NFConsultaSerasa_; Name: ''; FieldType: arftInteger; Length: 0; Nullable: False;
      Caption: ''; Visible: True; ReadOnly: True; Commented: False;
      Title: ''; ColumnCharWidth: ColumnCharWidthFor...)
    );}
  
implementation

var
  //GNFConsultaSerasaModelMetadata: IActiveRecordMetadataWritable;
  //GNFConsultaSerasaModelViewMetadata: IActiveRecordMetadataWritable;
  GQueryFactoryBySConsCnpjCpfAndAntesDeSConsData: IActiveRecordQueryFactory;

{ TCollectionNFConsultaSerasaModel }

function TCollectionNFConsultaSerasaModel.Add(const Item: INFConsultaSerasaModel): Integer;
begin
  Result := inherited Add(Item as IARNFConsultaSerasa);
end;

function TCollectionNFConsultaSerasaModel.First: INFConsultaSerasaModel;
begin
  Result := (inherited First) as INFConsultaSerasaModel;
end;

function TCollectionNFConsultaSerasaModel.GetItem(Index: Integer): INFConsultaSerasaModel;
begin
  Result := (inherited GetItem(Index)) as INFConsultaSerasaModel;
end;

procedure TCollectionNFConsultaSerasaModel.Insert(Index: Integer; const Item: INFConsultaSerasaModel);
begin
  inherited Insert(Index, Item as IARNFConsultaSerasa);
end;

function TCollectionNFConsultaSerasaModel.Last: INFConsultaSerasaModel;
begin
  Result := (inherited Last) as INFConsultaSerasaModel;
end;

function TCollectionNFConsultaSerasaModel.New(const AConnection: IActiveRecordConnection): INFConsultaSerasaModel;
begin
  Result := ClassActiveRecord.Create(AConnection) as INFConsultaSerasaModel;
  Add(Result);
end;

{ TIteratorNFConsultaSerasaModelDecorator }

function TIteratorNFConsultaSerasaModelDecorator.CurrentItem: INFConsultaSerasaModel;
begin
  Result := CurrentItemActiveRecord as INFConsultaSerasaModel;
end;

class function TIteratorNFConsultaSerasaModelDecorator.Decore(const ACollectionNFConsultaSerasaModel: ICollectionNFConsultaSerasaModel): IIteratorNFConsultaSerasaModel;
begin
  Result := Create(ACollectionNFConsultaSerasaModel);
end;

{ TIteratorNFConsultaSerasaModelQueryDecorator }

function TIteratorNFConsultaSerasaModelQueryDecorator.CurrentItem: INFConsultaSerasaModel;
begin
  Result := CurrentItemActiveRecord as INFConsultaSerasaModel;
end;

class function TIteratorNFConsultaSerasaModelQueryDecorator.Decore(const ANFConsultaSerasaModelQuery: IActiveRecordQuery): IIteratorNFConsultaSerasaModel;
begin
  Result := Create(ANFConsultaSerasaModelQuery);
end;

{ TNFConsultaSerasaModel }

procedure TNFConsultaSerasaModel.BeforeSave;
begin
  inherited;
  SetSConsCodigo(Nullable((SummaryMaiorSConsCodigo(GetConnection).Value + 1)));
end;

procedure TNFConsultaSerasaModel.CarregaRelatoFormatado(ALinhas: TStrings);
var
  LLinhaSerasa: string;
begin
  ALinhas.BeginUpdate;
  try
    ALinhas.Clear;
    LLinhaSerasa := GetRetLinhaSerasa.Value;
    if Copy(LLinhaSerasa, 1, 4) = 'B49C' then
    begin
      Delete(LLinhaSerasa, 1, 400);
      while LLinhaSerasa <> '' do
      begin
        if Copy(LLinhaSerasa, 1, 4) = 'R451' then
          ALinhas.Append(Copy(LLinhaSerasa, 5, 86));
        if Copy(LLinhaSerasa, 1, 4) = 'B49C' then
          Delete(LLinhaSerasa, 1, 400)
        else
          Delete(LLinhaSerasa, 1, 115);
      end;
    end;
  finally
    ALinhas.EndUpdate;
  end;
end;

class function TNFConsultaSerasaModel.GUIDItem: TGUID;
begin
  Result := INFConsultaSerasaModel;
end;

{ TNFConsultaSerasaModelService }

function TNFConsultaSerasaModelService.FindBySConsCnpjCpfAndAntesDeSConsData(ASConsCnpjCpf: string;
  AAntesDeSConsData: TDateTime; const AConnection: IActiveRecordConnection): INFConsultaSerasaModel;
begin
  Result := QueryBySConsCnpjCpfAndAntesDeSConsData(ASConsCnpjCpf, AAntesDeSConsData, AConnection)
    .FirstActiveRecord as INFConsultaSerasaModel;
end;

function TNFConsultaSerasaModelService.QueryBySConsCnpjCpfAndAntesDeSConsData(ASConsCnpjCpf: string;
  AAntesDeSConsData: TDateTime; const AConnection: IActiveRecordConnection): IActiveRecordQuery;
begin
  Result := GQueryFactoryBySConsCnpjCpfAndAntesDeSConsData.CreateQuery(AConnection);
  Result.SetNextParameter(ASConsCnpjCpf);
  Result.SetNextParameterDateTime(AAntesDeSConsData);
end;

initialization

  TNFConsultaSerasaModelService.SelfRegister(INFConsultaSerasaModelService);

  { Definições do Metadata, descomente o "class function Metadata" e Coloque no Result a variavel abaixo }
  //GNFConsultaSerasaModelMetadata := TActiveRecordMetadataWritable.Create;
  //GNFConsultaSerasaModelMetadata.CopyFrom(TARNFConsultaSerasa.Metadata);
  //Incluir aqui alterações em relação ao Metadata original

  { Definições do ViewMetadata, descomente o "class function ViewMetadata" e Coloque no Result a variavel abaixo }
  //GNFConsultaSerasaModelViewMetadata := TActiveRecordMetadataWritable.Create;
  //GNFConsultaSerasaModelViewMetadata.CopyFrom(TNFConsultaSerasaModel.Metadata);
  //Incluir aqui informações que apenas aparecem para o usuário (não são gravadas no banco)
  //GNFConsultaSerasaModelViewMetadata.AddFieldsMetadata(NFConsultaSerasaModelAdditionalFields);

  GQueryFactoryBySConsCnpjCpfAndAntesDeSConsData := TNFConsultaSerasaModel.From
    .Top(1)
    .Where('SConsCnpjCpf = ? and SConsData < ?')
    .OrderBy('SConsData desc, SConsHora desc');

finalization

  //GNFConsultaSerasaModelMetadata := nil;
  //GNFConsultaSerasaModelViewMetadata := nil;
  GQueryFactoryBySConsCnpjCpfAndAntesDeSConsData := nil;

end.