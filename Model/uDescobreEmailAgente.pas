unit uDescobreEmailAgente;

interface

uses
  ServiceLocator, uActiveRecord, cachecod;

type
  IResultadoDescobreEmailAgente = interface(IResultadoSQL)
    ['{94C6EA41-1282-42F9-9B4C-8FA7E2D8352A}']
    function GetPesCNPJCPF: string;
    function GetPesEmail: TNullableString;
    function GetPesNomeAgente: TNullableString;
    function GetPesNomeCedente: TNullableString;

    property PesCNPJCPF: string read GetPesCNPJCPF;
    property PesEmail: TNullableString read GetPesEmail;
    property PesNomeAgente: TNullableString read GetPesNomeAgente;
    property PesNomeCedente: TNullableString read GetPesNomeCedente;
  end;

  ICollectionResultadoDescobreEmailAgente = interface(ICollectionActiveRecord)
    ['{C02C6E4F-1AA6-4958-978D-E54C21ABF1C1}']
    function GetItem(Index: Integer): IResultadoDescobreEmailAgente;

    function Add(const Item: IResultadoDescobreEmailAgente): Integer;
    function First: IResultadoDescobreEmailAgente;
    procedure Insert(Index: Integer; const Item: IResultadoDescobreEmailAgente);
    function Last: IResultadoDescobreEmailAgente;
    function New(const AConnection: IActiveRecordConnection): IResultadoDescobreEmailAgente;
    property Item[Index: Integer]: IResultadoDescobreEmailAgente read GetItem; default;
  end;

  TCollectionResultadoDescobreEmailAgente = class(TCollectionActiveRecord, ICollectionResultadoDescobreEmailAgente)
  protected
    { ICollectionResultadoDescobreEmailAgente }
    function GetItem(Index: Integer): IResultadoDescobreEmailAgente;

    function Add(const Item: IResultadoDescobreEmailAgente): Integer;
    function First: IResultadoDescobreEmailAgente;
    procedure Insert(Index: Integer; const Item: IResultadoDescobreEmailAgente);
    function Last: IResultadoDescobreEmailAgente;
    function New(const AConnection: IActiveRecordConnection): IResultadoDescobreEmailAgente;
  end;

  IIteratorResultadoDescobreEmailAgente = interface(IIteratorActiveRecord)
    ['{543CDE9D-D028-4D58-AA1F-5B1A9F489FC2}']
    function CurrentItem: IResultadoDescobreEmailAgente;
  end;

  TIteratorResultadoDescobreEmailAgenteQueryDecorator = class(TIteratorActiveRecordQueryDecorator, IIteratorResultadoDescobreEmailAgente)
  protected
    { IIteratorResultadoDescobreEmailAgente }
    function CurrentItem: IResultadoDescobreEmailAgente;
  public
    class function Decore(const AResultadoDescobreEmailAgenteQuery: IActiveRecordQuery): IIteratorResultadoDescobreEmailAgente;
  end;

  TResultadoDescobreEmailAgente = class(TResultadoSQL, IResultadoDescobreEmailAgente)
  protected
    //class procedure AjustaMetadata(const AMetadata: IActiveRecordMetadataWritable); override;
    { IResultadoSQL }
    function GetPesCNPJCPF: string;
    function GetPesEmail: TNullableString;
    function GetPesNomeAgente: TNullableString;
    function GetPesNomeCedente: TNullableString;
  end;

  IResultadoDescobreEmailAgenteService = interface
    ['{24A09DEB-3F16-475B-A82D-A0F8191B7EA9}']
    function FindByCnpjs(ACnpjs: TCacheString;
      const AConnection: IActiveRecordConnection): IIteratorResultadoDescobreEmailAgente;
  end;

  TResultadoDescobreEmailAgenteService = class(TInterfacedObject, IResultadoDescobreEmailAgenteService)
  private
    function QueryByCnpjs(ACnpjs: TCacheString; const AConnection: IActiveRecordConnection): IActiveRecordQuery;
  protected
    { IResultadoDescobreEmailAgenteService }
    function FindByCnpjs(ACnpjs: TCacheString;
      const AConnection: IActiveRecordConnection): IIteratorResultadoDescobreEmailAgente;
  end;

const
  Resultado_DescobreEmailAgente_PesCNPJCPF = 0;
  Resultado_DescobreEmailAgente_PesNomeCedente = 1;
  Resultado_DescobreEmailAgente_PesNomeAgente = 2;
  Resultado_DescobreEmailAgente_PesEmail = 3;

implementation

function FabricaResultadoDescobreEmailAgenteService: IUnknown;
begin
  Result := TResultadoDescobreEmailAgenteService.Create;
end;

{ TIteratorResultadoDescobreEmailAgenteQueryDecorator }

function TIteratorResultadoDescobreEmailAgenteQueryDecorator.CurrentItem: IResultadoDescobreEmailAgente;
begin
  Result := CurrentItemActiveRecord as IResultadoDescobreEmailAgente;
end;

class function TIteratorResultadoDescobreEmailAgenteQueryDecorator.Decore(
  const AResultadoDescobreEmailAgenteQuery: IActiveRecordQuery): IIteratorResultadoDescobreEmailAgente;
begin
  Result := Create(AResultadoDescobreEmailAgenteQuery);
end;

{ TCollectionResultadoDescobreEmailAgente }

function TCollectionResultadoDescobreEmailAgente.Add(const Item: IResultadoDescobreEmailAgente): Integer;
begin
  Result := AddActiveRecord(Item);
end;

function TCollectionResultadoDescobreEmailAgente.First: IResultadoDescobreEmailAgente;
begin
  Result := nil;
  if Count > 0 then
    Result := GetItem(0);
end;

function TCollectionResultadoDescobreEmailAgente.GetItem(Index: Integer): IResultadoDescobreEmailAgente;
begin
  Result := List[Index] as IResultadoDescobreEmailAgente;
end;

procedure TCollectionResultadoDescobreEmailAgente.Insert(Index: Integer; const Item: IResultadoDescobreEmailAgente);
begin
  List.Insert(Index, Item);
end;

function TCollectionResultadoDescobreEmailAgente.Last: IResultadoDescobreEmailAgente;
begin
  Result := nil;
  if Count > 0 then
    Result := GetItem(Count - 1);
end;

function TCollectionResultadoDescobreEmailAgente.New(
  const AConnection: IActiveRecordConnection): IResultadoDescobreEmailAgente;
begin
  Result := ClassActiveRecord.Create(AConnection) as IResultadoDescobreEmailAgente;
  Add(Result);
end;

{ TResultadoDescobreEmailAgente }

function TResultadoDescobreEmailAgente.GetPesCNPJCPF: string;
begin
  Result := GetAsString(Resultado_DescobreEmailAgente_PesCNPJCPF);
end;

function TResultadoDescobreEmailAgente.GetPesEmail: TNullableString;
begin
  Result := VariantToNullableString(GetValue(Resultado_DescobreEmailAgente_PesEmail));
end;

function TResultadoDescobreEmailAgente.GetPesNomeAgente: TNullableString;
begin
  Result := VariantToNullableString(GetValue(Resultado_DescobreEmailAgente_PesNomeAgente));
end;

function TResultadoDescobreEmailAgente.GetPesNomeCedente: TNullableString;
begin
  Result := VariantToNullableString(GetValue(Resultado_DescobreEmailAgente_PesNomeCedente));
end;

{ TResultadoDescobreEmailAgenteService }

function TResultadoDescobreEmailAgenteService.FindByCnpjs(ACnpjs: TCacheString;
  const AConnection: IActiveRecordConnection): IIteratorResultadoDescobreEmailAgente;
begin
  Result := TIteratorResultadoDescobreEmailAgenteQueryDecorator.Decore(QueryByCnpjs(ACnpjs, AConnection));
end;

function TResultadoDescobreEmailAgenteService.QueryByCnpjs(ACnpjs: TCacheString;
  const AConnection: IActiveRecordConnection): IActiveRecordQuery;
begin
  Result := TResultadoDescobreEmailAgente.Execute(
    'select'#13#10 +
    '  c.pesCNPJCPF, p.pesNome pesNomeCedente, max(ap.pesNome) pesNomeAgente, max(ap.pesEmail) pesEmail'#13#10 +
    'from'#13#10 +
    '  nfCedente c'#13#10 +
    '  join nfPessoa p on c.pesCNPJCPF = p.pesCNPJCPF'#13#10 +
    '  left join nfAgente a on c.ageCodigo = a.ageCodigo and c.empCodigo = a.empCodigo'#13#10 +
    '  left join nfPessoa ap on a.pesCNPJCPF = ap.pesCNPJCPF'#13#10 +
    'where'#13#10 +
    '  c.pesCNPJCPF in (' + ACnpjs.StringCodigos('''', ',') + ')'#13#10 +
    'group by'#13#10 +
    '  c.pesCNPJCPF'#13#10 +
    '  , p.pesNome'#13#10 +
    'order by'#13#10 +
    '  3, 2', AConnection);
end;

initialization

  SL.Add(IResultadoDescobreEmailAgenteService, FabricaResultadoDescobreEmailAgenteService);

end.
