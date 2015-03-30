unit MVC_Parametros;

interface

uses
  SysUtils, Classes, MVC_Interfaces, ServiceLocator, CacheCod;

implementation

type
  IGetHashTable = interface
    ['{02759032-00DB-4A18-993C-BCCFF90C1359}']
    function GetHashTable: THashTable;
  end;

  TParametros = class(TSLObject, IGetHashTable, IParametros)
  private
    FHashTable: THashTable;
  protected
    { IGetHashTable }
    function GetHashTable: THashTable;
    { IParametros }
    function GetAsInterface(const AIndex: string): IUnknown;
    function GetAsMVCStrings(const AIndex: string): IMVCStrings;
    function GetItem(const AIndex: string): Variant;
    procedure SetAsInterface(const AIndex: string; const AValue: IUnknown);
    procedure SetAsMVCStrings(const AIndex: string; const AValue: IMVCStrings);
    procedure SetItem(const AIndex: string; const AValue: Variant);

    procedure Assign(const AParametros: IParametros);
    procedure Clear;
    function Iterator: IIteratorParametros;
    function TemCodigo(const AIndex: string): Boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

  TIteratorParametros = class(TInterfacedObject, IIteratorParametros)
  private
    FParametros: TParametros;
    FPosicao: Integer;
  protected
    { IIteratorParametros }
    function GetNome: string;
    function GetValor: Variant;

    function Next: Boolean;
    property Nome: string read GetNome;
    property Valor: Variant read GetValor;
  public
    constructor Create(const AParametros: TParametros);
    destructor Destroy; override;
  end;

{ TParametros }

procedure TParametros.Assign(const AParametros: IParametros);
var
  LGetHashTable: IGetHashTable;
begin
  if Supports(AParametros, IGetHashTable, LGetHashTable) then
    FHashTable.Assign(LGetHashTable.GetHashTable);
end;

procedure TParametros.Clear;
begin
  FHashTable.Clear;
end;

constructor TParametros.Create;
begin
  inherited;
  FHashTable := THashTable.Create;
end;

destructor TParametros.Destroy;
begin
  FHashTable.Free;
  inherited;
end;

function TParametros.GetAsInterface(const AIndex: string): IUnknown;
begin
  Result := FHashTable.AsInterface[AIndex];
end;

function TParametros.GetAsMVCStrings(const AIndex: string): IMVCStrings;
begin
  Result := GetAsInterface(AIndex) as IMVCStrings;
end;

function TParametros.GetHashTable: THashTable;
begin
  Result := FHashTable;
end;

function TParametros.GetItem(const AIndex: string): Variant;
begin
  Result := FHashTable[AIndex];
end;

function TParametros.Iterator: IIteratorParametros;
begin
  Result := TIteratorParametros.Create(Self);
end;

procedure TParametros.SetAsInterface(const AIndex: string; const AValue: IInterface);
begin
  FHashTable.AsInterface[AIndex] := AValue;
end;

procedure TParametros.SetAsMVCStrings(const AIndex: string; const AValue: IMVCStrings);
begin
  SetAsInterface(AIndex, AValue);
end;

procedure TParametros.SetItem(const AIndex: string; const AValue: Variant);
begin
  FHashTable[AIndex] := AValue;
end;

function TParametros.TemCodigo(const AIndex: string): Boolean;
begin
  Result := FHashTable.TemCodigo(AIndex);
end;

{ TIteratorParametros }

constructor TIteratorParametros.Create(const AParametros: TParametros);
begin
  inherited Create;
  FParametros := AParametros;
  FParametros.FHashTable.BeginUpdate;
  FPosicao := -1;
end;

destructor TIteratorParametros.Destroy;
begin
  FParametros.FHashTable.EndUpdate;
  inherited;
end;

function TIteratorParametros.GetNome: string;
begin
  Result := FParametros.FHashTable.Codigo;
end;

function TIteratorParametros.GetValor: Variant;
begin
  Result := FParametros.FHashTable.Valor;
end;

function TIteratorParametros.Next: Boolean;
begin
  Result := FPosicao < (FParametros.FHashTable.Count - 1);
  if Result then
  begin
    Inc(FPosicao);
    FParametros.FHashTable.Posicao := FPosicao;
  end;
end;

initialization

  TParametros.SelfRegister(IParametros);

end.


