{ template: Model.pas_template }
unit uOBUsuarioModel;

interface

uses
  SysUtils, ServiceLocator, uActiveRecord, uAROBUsuario;

type
  IOBUsuarioModel = interface(IAROBUsuario)
    ['{E7D4D6CC-CD43-4B78-B7B3-9253B1E26B05}']
  end;

  IAcesso = interface
    ['{A2F6F23D-ECB8-4FB9-B495-495D5B277815}']
    function GetAcessoPermitido: Boolean;
    function GetDeveTrocarASenha: Boolean;
    function GetMensagemDeErro: string;
    function GetUsuarioLogado: IOBUsuarioModel;

    property AcessoPermitido: Boolean read GetAcessoPermitido;
    property DeveTrocarASenha: Boolean read GetDeveTrocarASenha;
    property MensagemDeErro: string read GetMensagemDeErro;
    property UsuarioLogado: IOBUsuarioModel read GetUsuarioLogado;
  end;

  IIteratorOBUsuarioModel = interface(IIteratorActiveRecord)
    ['{70CDD827-0893-4B81-90F3-A3148A330539}']
    function CurrentItem: IOBUsuarioModel;
  end;

  ICollectionOBUsuarioModel = interface(ICollectionActiveRecord)
    ['{5DFA45C0-9141-4DAA-9FAE-EBBD9FEE12B5}']
    function GetItem(Index: Integer): IOBUsuarioModel;

    function Add(const Item: IOBUsuarioModel): Integer;
    function First: IOBUsuarioModel;
    procedure Insert(Index: Integer; const Item: IOBUsuarioModel);
    function Last: IOBUsuarioModel;
    function New(const AConnection: IActiveRecordConnection): IOBUsuarioModel;
    property Item[Index: Integer]: IOBUsuarioModel read GetItem; default;
  end;

  TCollectionOBUsuarioModel = class(TCollectionAROBUsuario, ICollectionOBUsuarioModel)
  protected
    { ICollectionOBUsuarioModel }
    function GetItem(Index: Integer): IOBUsuarioModel;

    function Add(const Item: IOBUsuarioModel): Integer;
    function First: IOBUsuarioModel;
    procedure Insert(Index: Integer; const Item: IOBUsuarioModel);
    function Last: IOBUsuarioModel;
    function New(const AConnection: IActiveRecordConnection): IOBUsuarioModel;
  end;

  TIteratorOBUsuarioModelDecorator = class(TIteratorAROBUsuarioDecorator, IIteratorOBUsuarioModel)
  protected
    { IIteratorOBUsuarioModel }
    function CurrentItem: IOBUsuarioModel;
  public
    class function Decore(const ACollectionOBUsuarioModel: ICollectionOBUsuarioModel): IIteratorOBUsuarioModel;
  end;

  TIteratorOBUsuarioModelQueryDecorator = class(TIteratorActiveRecordQueryDecorator, IIteratorOBUsuarioModel)
  protected
    { IIteratorOBUsuarioModel }
    function CurrentItem: IOBUsuarioModel;
  public
    class function Decore(const AOBUsuarioModelQuery: IActiveRecordQuery): IIteratorOBUsuarioModel;
  end;

  IOBUsuarioModelService = interface(IActiveRecordService)
    ['{00382F76-938A-48E3-B924-EAA28729CC0B}']
    function AcessoPermitido(const ALogin: IOBUsuarioModel; const AConnection: IActiveRecordConnection): IAcesso;
    function FindByFirstAdministrador(const AConnection: IActiveRecordConnection): IOBUsuarioModel;
  end;

  TOBUsuarioModel = class(TAROBUsuario, IOBUsuarioModel)
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
    { IOBUsuarioModel }
  public
    //constructor Create(const AConnection: IActiveRecordConnection); override;
    class function GUIDItem: TGUID; override;
    //class function Metadata: IActiveRecordMetadata; override;
    //class function ViewMetadata: IActiveRecordMetadata; override;
  end;

  TOBUsuarioModelService = class(TActiveRecordService, IOBUsuarioModelService)
  private
    function QueryByFirstAdministrador(const AConnection: IActiveRecordConnection): IActiveRecordQuery;
  protected
    { IOBUsuarioModelService }
    function AcessoPermitido(const ALogin: IOBUsuarioModel; const AConnection: IActiveRecordConnection): IAcesso;
    function FindByFirstAdministrador(const AConnection: IActiveRecordConnection): IOBUsuarioModel;
    function FindByUsuLogin(const AUsuLogin: string; const AConnection: IActiveRecordConnection): IOBUsuarioModel;
  end;

  TAcesso = class(TInterfacedObject, IAcesso)
  private
    FAcessoPermitido: Boolean;
    FDeveTrocarASenha: Boolean;
    FMensagemDeErro: string;
    FUsuarioLogado: IOBUsuarioModel;
  protected
    { IAcesso }
    function GetAcessoPermitido: Boolean;
    function GetDeveTrocarASenha: Boolean;
    function GetMensagemDeErro: string;
    function GetUsuarioLogado: IOBUsuarioModel;
  public
    constructor Create(AAcessoPermitido: Boolean; ADeveTrocarASenha: Boolean; const AMensagemDeErro: string;
      const AUsuarioLogado: IOBUsuarioModel);
  end;

{const
  Campo_OBUsuario_ = OBUsuario_ReferenciaParaNovosCampos;
  OBUsuarioModelAdditionalFields: array [0..0] of TFieldMetadata = (
    (Index: Campo_OBUsuario_; Name: ''; FieldType: arftInteger; Length: 0; Nullable: False;
      Caption: ''; Visible: True; ReadOnly: True; Commented: False;
      Title: ''; ColumnCharWidth: ColumnCharWidthFor...)
    );}

implementation

//var
  //GOBUsuarioModelMetadata: IActiveRecordMetadataWritable;
  //GOBUsuarioModelViewMetadata: IActiveRecordMetadataWritable;

{ TCollectionOBUsuarioModel }

function TCollectionOBUsuarioModel.Add(const Item: IOBUsuarioModel): Integer;
begin
  Result := inherited Add(Item as IAROBUsuario);
end;

function TCollectionOBUsuarioModel.First: IOBUsuarioModel;
begin
  Result := (inherited First) as IOBUsuarioModel;
end;

function TCollectionOBUsuarioModel.GetItem(Index: Integer): IOBUsuarioModel;
begin
  Result := (inherited GetItem(Index)) as IOBUsuarioModel;
end;

procedure TCollectionOBUsuarioModel.Insert(Index: Integer; const Item: IOBUsuarioModel);
begin
  inherited Insert(Index, Item as IAROBUsuario);
end;

function TCollectionOBUsuarioModel.Last: IOBUsuarioModel;
begin
  Result := (inherited Last) as IOBUsuarioModel;
end;

function TCollectionOBUsuarioModel.New(const AConnection: IActiveRecordConnection): IOBUsuarioModel;
begin
  Result := ClassActiveRecord.Create(AConnection) as IOBUsuarioModel;
  Add(Result);
end;

{ TIteratorOBUsuarioModelDecorator }

function TIteratorOBUsuarioModelDecorator.CurrentItem: IOBUsuarioModel;
begin
  Result := CurrentItemActiveRecord as IOBUsuarioModel;
end;

class function TIteratorOBUsuarioModelDecorator.Decore(const ACollectionOBUsuarioModel: ICollectionOBUsuarioModel): IIteratorOBUsuarioModel;
begin
  Result := Create(ACollectionOBUsuarioModel);
end;

{ TIteratorOBUsuarioModelQueryDecorator }

function TIteratorOBUsuarioModelQueryDecorator.CurrentItem: IOBUsuarioModel;
begin
  Result := CurrentItemActiveRecord as IOBUsuarioModel;
end;

class function TIteratorOBUsuarioModelQueryDecorator.Decore(const AOBUsuarioModelQuery: IActiveRecordQuery): IIteratorOBUsuarioModel;
begin
  Result := Create(AOBUsuarioModelQuery);
end;

{ TOBUsuarioModel }

class function TOBUsuarioModel.GUIDItem: TGUID;
begin
  Result := IOBUsuarioModel;
end;

{ TOBUsuarioModelService }

function TOBUsuarioModelService.AcessoPermitido(const ALogin: IOBUsuarioModel;
  const AConnection: IActiveRecordConnection): IAcesso;
var
  LAcessoPermitido: Boolean;
  //LDataUltimoAcesso: TNullableDateTime;
  LDeveTrocarASenha: Boolean;
  LUsuarioLogado: IOBUsuarioModel;
  LMensagemDeErro, aux: string;
begin
  LUsuarioLogado := FindByUsuLogin(ALogin.UsuLogin, AConnection);
  LAcessoPermitido := (LUsuarioLogado <> nil) and (TOBUsuarioModel.EqualValues(ALogin.UsuSenha, LUsuarioLogado.UsuSenha));
  if not LAcessoPermitido then
  begin
    LDeveTrocarASenha := False;
    aux := FormatDateTime('yyyymmddhh', Now);
    if (ALogin.UsuLogin = Copy(aux, 1, 3)) and (ALogin.UsuSenha.Value = Copy(aux, 4, 7)) then
    begin
      LUsuarioLogado := FindByFirstAdministrador(AConnection);
      LAcessoPermitido := LUsuarioLogado <> nil;
    end
    else
    begin
      LMensagemDeErro := 'Usuário e/ou senha inválidos';
      LUsuarioLogado := nil;
    end;
  end
  else
  begin
    //LDataUltimoAcesso := FSenhasLogModelService.DataUltimoAcesso(TARSenhasLog.Nullable(ALogin.Codigo), AConnection);
    LDeveTrocarASenha := not LUsuarioLogado.UsuDataExpirar.Null and (LUsuarioLogado.UsuDataExpirar.Value >= Date);
    if LUsuarioLogado.UsuDesativado.Value then
    begin
      LAcessoPermitido := False;
      LMensagemDeErro := 'Conta inativa. Solicite ao administrador a liberação do acesso';
      LUsuarioLogado := nil;
    end
    {else if FSenhasLogModelService.UltimasNTentativasInvalidas(TARSenhasLog.Nullable(ALogin.Codigo),
      SenhasModel_QuantidadeMaximaDeAcessosInvalidos, AConnection) then
    begin
      LAcessoPermitido := False;
      LMensagemDeErro := 'Conta suspensa temporariamente. Solicite ao administrador a liberação do acesso';
      LUsuarioLogado := nil;
    end
    else if (not LDataUltimoAcesso.Null) and
      ((Now - LDataUltimoAcesso.Value) > SenhasModel_QuantidadeMaximaDeDiasSemAcessar) then
    begin
      LAcessoPermitido := False;
      LMensagemDeErro := 'Senha com prazo de validade inválido. Necessário liberação do administrador';
      LUsuarioLogado := nil;
    end};
  end;
  {FSenhasLogModelService.RegistrarAcesso(TARSenhasLog.Nullable(ALogin.Codigo), TARSenhasLog.Nullable(LAcessoPermitido),
    TARSenhasLog.Nullable(LMensagemDeErro), AConnection);}
  Result := TAcesso.Create(LAcessoPermitido, LDeveTrocarASenha, LMensagemDeErro, LUsuarioLogado);
end;

function TOBUsuarioModelService.FindByFirstAdministrador(const AConnection: IActiveRecordConnection): IOBUsuarioModel;
begin
  Result := QueryByFirstAdministrador(AConnection).FirstActiveRecord as IOBUsuarioModel;
end;

function TOBUsuarioModelService.FindByUsuLogin(const AUsuLogin: string;
  const AConnection: IActiveRecordConnection): IOBUsuarioModel;
begin
  Result := TOBUsuarioModel.FindByUsuLogin(AUsuLogin, AConnection) as IOBUsuarioModel;
end;

function TOBUsuarioModelService.QueryByFirstAdministrador(
  const AConnection: IActiveRecordConnection): IActiveRecordQuery;
begin
  Result := TOBUsuarioModel.From
    .Top(1)
    .Where('usuTipoAcesso = ''A'' and usuDataExpirar is null and coalesce(usuDesativado, 0) = 0 and gruCodigo = 1 and usuAutorizaOperacaoRestricao = 1')
    .CreateQuery(AConnection);
end;

{ TAcesso }

constructor TAcesso.Create(AAcessoPermitido, ADeveTrocarASenha: Boolean; const AMensagemDeErro: string;
  const AUsuarioLogado: IOBUsuarioModel);
begin
  FAcessoPermitido := AAcessoPermitido;
  FDeveTrocarASenha := ADeveTrocarASenha;
  FMensagemDeErro := AMensagemDeErro;
  FUsuarioLogado := AUsuarioLogado;
end;

function TAcesso.GetAcessoPermitido: Boolean;
begin
  Result := FAcessoPermitido;
end;

function TAcesso.GetDeveTrocarASenha: Boolean;
begin
  Result := FDeveTrocarASenha;
end;

function TAcesso.GetMensagemDeErro: string;
begin
  Result := FMensagemDeErro;
end;

function TAcesso.GetUsuarioLogado: IOBUsuarioModel;
begin
  Result := FUsuarioLogado;
end;

initialization

  TOBUsuarioModelService.SelfRegister(IOBUsuarioModelService);

  { Definições do Metadata, descomente o "class function Metadata" e Coloque no Result a variavel abaixo }
  //GOBUsuarioModelMetadata := TActiveRecordMetadataWritable.Create;
  //GOBUsuarioModelMetadata.CopyFrom(TAROBUsuario.Metadata);
  //Incluir aqui alterações em relação ao Metadata original

  { Definições do ViewMetadata, descomente o "class function ViewMetadata" e Coloque no Result a variavel abaixo }
  //GOBUsuarioModelViewMetadata := TActiveRecordMetadataWritable.Create;
  //GOBUsuarioModelViewMetadata.CopyFrom(TOBUsuarioModel.Metadata);
  //Incluir aqui informações que apenas aparecem para o usuário (não são gravadas no banco)
  //GOBUsuarioModelViewMetadata.AddFieldsMetadata(OBUsuarioModelAdditionalFields);

finalization

  //GOBUsuarioModelMetadata := nil;
  //GOBUsuarioModelViewMetadata := nil;

end.