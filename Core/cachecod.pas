unit cachecod;

interface

uses
  SysUtils, Contnrs, Tipos, Variants;

type
  TItemCache = class
  protected
    procedure Assign(Origem: TItemCache); virtual; abstract;
    procedure Inicializa; virtual;
    procedure Libera; virtual;
  public
    constructor Create; virtual;
    destructor Destroy; override;
  end;

  TClasseItemCache = class of TItemCache;

  //Classe abstrata. Para qualquer tipo.
  TCache = class(TObjetoInterface)
  private
    FAtualizando: Integer;
    FGuardaObjeto: TItemCache;
    FGuardaPosicao: Integer;
    FPosicaoAtual: Integer;
    function GetPosicao: Integer;
    procedure SetPosicao(const Value: Integer);
  protected
    FClasse: TClasseItemCache;
    FLista: TObjectList;
    FObjeto: TItemCache;
    function Compara(AObjeto: TItemCache): Integer; virtual; abstract;
    function DoIncluiu(AObjeto: TItemCache): Boolean; virtual;
    function Inclui(var APosicao: Integer): TItemCache;
    function PosicaoCodigo(out APosicao: Integer): Boolean;
    procedure SetObjetoPosicao(AObjeto: TItemCache; const Posicao: Integer);
    function StringCodigo: string; virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Origem: TCache); virtual;
    procedure BeginUpdate;
    procedure Clear; virtual;
    function Count: Integer;
    procedure EndUpdate;
    function Retira: Boolean;
    function StringCodigos(const Delimitador: string = '';
      const Separador: string = ','): string; overload;
    function StringCodigos(const Delimitador, Separador,
      UltimoSeparador: string): string; overload;
    function TemCodigo: Boolean;
    property Posicao: Integer read GetPosicao write SetPosicao;
  end;

  TInteger = class(TItemCache)
  private
    FCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
  protected
    procedure Assign(Origem: TItemCache); override;
  public
    property Codigo: Integer read FCodigo write SetCodigo;
  end;

  TCacheInteger = class(TCache)
  private
    FNovoCodigo: Integer;
    function GetCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
  protected
    function Compara(AObjeto: TItemCache): Integer; override;
    function DoIncluiu(AObjeto: TItemCache): Boolean; override;
    function StringCodigo: string; override;
  public
    constructor Create;
    function IntegerArray: TIntegerArray;
    function Retira(ACodigo: Integer): Boolean;
    function TemCodigo(ACodigo: Integer): Boolean;
    property Codigo: Integer read GetCodigo write SetCodigo;
  end;

  TIntegerDouble = class(TInteger)
  private
    FValor: Double;
  protected
    procedure Assign(Origem: TItemCache); override;
  public
    constructor Create; override;
    property Valor: Double read FValor write FValor;
  end;

  TCacheIntegerDouble = class(TCacheInteger)
  private
    function GetValor: Double;
    function GetValue(ACodigo: Integer): Double;
    procedure SetValor(const Value: Double);
    procedure SetValue(ACodigo: Integer; const Value: Double);
  public
    constructor Create;
    property Valor: Double read GetValor write SetValor;
    property Value[ACodigo: Integer]: Double read GetValue
      write SetValue; default;
  end;

  TString = class(TItemCache)
  private
    FCodigo: string;
    procedure SetCodigo(const Value: string);
  protected
    procedure Assign(Origem: TItemCache); override;
  public
    property Codigo: string read FCodigo write SetCodigo;
  end;

  TShortString = class(TItemCache)
  private
    FCodigo: ShortString;
    procedure SetCodigo(const Value: ShortString);
  protected
    procedure Assign(Origem: TItemCache); override;
  public
    property Codigo: ShortString read FCodigo write SetCodigo;
  end;

  TCacheString = class(TCache)
  private
    FNovoCodigo: string;
    function GetCodigo: string;
    procedure SetCodigo(const Value: string);
  protected
    function Compara(AObjeto: TItemCache): Integer; override;
    function DoIncluiu(AObjeto: TItemCache): Boolean; override;
    function GetTextoSubstituicao: string; virtual;
    procedure Retirado(ACodigo: string); dynamic;
    function StringCodigo: string; override;
  public
    constructor Create;
    function Retira(ACodigo: string): Boolean;
    function SubstitueTexto(Ent, DelimE, DelimD: string): string;
    function TemCodigo(ACodigo: string): Boolean;
    property Codigo: string read GetCodigo write SetCodigo;
  end;

  //CacheString para 2 Doubles (usado na Contabilidade)
  TString2Double = class(TString)
  private
    FValores: array [0..1] of Double;
    function GetValor1: Double;
    function GetValor2: Double;
    procedure SetValor1(const Value: Double);
    procedure SetValor2(const Value: Double);
  protected
    procedure Assign(Origem: TItemCache); override;
  public
    constructor Create; override;
    property Valor1: Double read GetValor1 write SetValor1;
    property Valor2: Double read GetValor2 write SetValor2;
  end;

  TCacheString2Double = class(TCacheString)
  private
    FFormatoSubstituicao: string;
    function GetValor1: Double;
    function GetValor2: Double;
    procedure SetValor1(const Value: Double);
    procedure SetValor2(const Value: Double);
  protected
    function GetTextoSubstituicao: string; override;
  public
    constructor Create;
    procedure AdicionaValor1(const Value: Double);
    procedure AdicionaValor2(const Value: Double);
    procedure Assign(Origem: TCache); override;
    property FormatoSubstituicao: string read FFormatoSubstituicao
      write FFormatoSubstituicao;
    property Valor1: Double read GetValor1 write SetValor1;
    property Valor2: Double read GetValor2 write SetValor2;
  end;

  TStringVariant = class(TString)
  private
    FValor: Variant;
  protected
    procedure Assign(Origem: TItemCache); override;
  public
    constructor Create; override;
    property Valor: Variant read FValor write FValor;
  end;

  THashTable = class(TCacheString)
  private
    function GetAsBoolean(const ACodigo: string): Boolean;
    function GetAsInterface(const ACodigo: string): IUnknown;
    function GetValor: Variant;
    function GetValorAsInterface: IUnknown;
    function GetValue(const ACodigo: string): Variant;
    procedure SetAsBoolean(const ACodigo: string; const AValue: Boolean);
    procedure SetAsInterface(const ACodigo: string; const AValue: IUnknown);
    procedure SetValor(const Value: Variant);
    procedure SetValorAsInterface(const Value: IUnknown);
    procedure SetValue(const ACodigo: string; const Value: Variant);
  protected
    function GetTextoSubstituicao: string; override;
  public
    constructor Create;
    property AsBoolean[const ACodigo: string]: Boolean read GetAsBoolean write SetAsBoolean;
    property AsInterface[const ACodigo: string]: IUnknown read GetAsInterface write SetAsInterface;
    property Valor: Variant read GetValor write SetValor;
    property ValorAsInterface: IUnknown read GetValorAsInterface write SetValorAsInterface;
    property Value[const ACodigo: string]: Variant read GetValue write SetValue; default;
  end;

  TShortStringShortString = class(TShortString)
  private
    FValor: ShortString;
  protected
    procedure Assign(Origem: TItemCache); override;
  public
    property Valor: ShortString read FValor write FValor;
  end;

  TStringString = class(TString)
  private
    FValor: string;
  protected
    procedure Assign(Origem: TItemCache); override;
  public
    property Valor: string read FValor write FValor;
  end;

  THashString = class(TCacheString)
  private
    function GetValor: string;
    function GetValue(const ACodigo: string): string;
    procedure SetValor(const Value: string);
    procedure SetValue(const ACodigo: string; const Value: string);
  protected
    function GetTextoSubstituicao: string; override;
  public
    constructor Create;
    property Valor: string read GetValor write SetValor;
    property Value[const ACodigo: string]: string read GetValue
      write SetValue; default;
  end;

  //HashInteger, primeiramente usado na importação do borderô
  TStringInteger = class(TString)
  private
    FValor: Integer;
  protected
    procedure Assign(Origem: TItemCache); override;
  public
    property Valor: Integer read FValor write FValor;
  end;

  THashInteger = class(TCacheString)
  private
    function GetValor: Integer;
    function GetValue(ACodigo: string): Integer;
    procedure SetValor(const Value: Integer);
    procedure SetValue(ACodigo: string; const Value: Integer);
  protected
    function GetTextoSubstituicao: string; override;
  public
    constructor Create;
    property Valor: Integer read GetValor write SetValor;
    property Value[ACodigo: string]: Integer read GetValue write SetValue; default;
  end;

  TItemDateTime = class(TItemCache)
  private
    FCodigo: TDateTime;
    procedure SetCodigo(const Value: TDateTime);
  protected
    procedure Assign(Origem: TItemCache); override;
  public
    property Codigo: TDateTime read FCodigo write SetCodigo;
  end;

  TCacheDateTime = class(TCache)
  private
    FNovoCodigo: TDateTime;
    FFormatoData: string;
    function GetCodigo: TDateTime;
    procedure SetCodigo(const Value: TDateTime);
  protected
    function Compara(AObjeto: TItemCache): Integer; override;
    function DoIncluiu(AObjeto: TItemCache): Boolean; override;
    function StringCodigo: string; override;
  public
    constructor Create;
    procedure Assign(Origem: TCache); override;
    function Retira(ACodigo: TDateTime): Boolean;
    function TemCodigo(ACodigo: TDateTime): Boolean;
    property Codigo: TDateTime read GetCodigo write SetCodigo;
    property FormatoData: string read FFormatoData write FFormatoData;
  end;

  TClassItem = class(TItemCache)
  private
    FCodigo: TClass;
    procedure SetCodigo(const Value: TClass);
  protected
    procedure Assign(Origem: TItemCache); override;
  public
    property Codigo: TClass read FCodigo write SetCodigo;
  end;

  TClassCache = class(TCache)
  private
    FNovoCodigo: TClass;
    function GetCodigo: TClass;
    procedure SetCodigo(const Value: TClass);
  protected
    function Compara(AObjeto: TItemCache): Integer; override;
    function DoIncluiu(AObjeto: TItemCache): Boolean; override;
    function StringCodigo: string; override;
  public
    constructor Create;
    function Retira(ACodigo: TClass): Boolean;
    function TemCodigo(ACodigo: TClass): Boolean;
    property Codigo: TClass read GetCodigo write SetCodigo;
  end;

  THashClassObjectItem = class(TClassItem)
  private
    FObject: TObject;
    FOwned: Boolean;
  protected
    procedure Assign(Origem: TItemCache); override;
  public
    destructor Destroy; override;
    property Object_: TObject read FObject write FObject;
    property Owned: Boolean read FOwned write FOwned;
  end;

  THashClassObject = class(TClassCache)
  private
    FOwned: Boolean;
    function GetObject: TObject;
    function GetObjects(ACodigo: TClass): TObject;
    procedure SetChildrenOwned;
    procedure SetObject(const Value: TObject);
    procedure SetObjects(ACodigo: TClass; const Value: TObject);
    procedure SetOwned(const Value: Boolean);
  protected
    function DoIncluiu(AObjeto: TItemCache): Boolean; override;
  public
    constructor Create(AOwned: Boolean = False);
    property Object_: TObject read GetObject write SetObject;
    property Objects[ACodigo: TClass]: TObject read GetObjects
      write SetObjects; default;
    property Owned: Boolean read FOwned write SetOwned;
  end;

  TStringDouble = class(TString)
  private
    FValor: Double;
  protected
    procedure Assign(Origem: TItemCache); override;
  public
    property Valor: Double read FValor write FValor;
  end;

  THashDouble = class(TCacheString)
  private
    function GetValor: Double;
    function GetValue(ACodigo: string): Double;
    procedure SetValor(const Value: Double);
    procedure SetValue(ACodigo: string; const Value: Double);
  protected
    function GetTextoSubstituicao: string; override;
  public
    constructor Create;
    property Valor: Double read GetValor write SetValor;
    property Value[ACodigo: string]: Double read GetValue write SetValue; default;
  end;

implementation

{ TItemCache }

constructor TItemCache.Create;
begin
  inherited;
end;


destructor TItemCache.Destroy;
begin
  Libera;
  inherited;
end;

procedure TItemCache.Inicializa;
begin
  //Toda vez que um código é setado o sistema chama o Inicializa
  //após setá-lo
end;

procedure TItemCache.Libera;
begin
  //Toda vez que um código é setado o sistema chama o Libera
  //antes de setá-lo
end;

{ TCache }

procedure TCache.Assign(Origem: TCache);
var
  laco: Integer;
  I: TItemCache;
begin
  if not Origem.InheritsFrom(ClassType) then
    raise Exception.CreateFmt('%s não é descendente de %s',
      [Origem.ClassName, ClassName]);
  if not Origem.FClasse.InheritsFrom(FClasse) then
    raise Exception.CreateFmt('%s não é descendente de %s',
      [Origem.FClasse.ClassName, FClasse.ClassName]);
  Clear;
  for laco := 0 to Origem.FLista.Count - 1 do
  begin
    I := FClasse.Create;
    I.Assign(Origem.FLista[laco] as TItemCache);
    FLista.Add(I);
  end;
  Posicao := Origem.Posicao;
end;

procedure TCache.BeginUpdate;
begin
  if FAtualizando = 0 then
  begin
    FGuardaPosicao := FPosicaoAtual;
    FGuardaObjeto := FObjeto;
  end;
  Inc(FAtualizando);
end;

procedure TCache.Clear;
begin
  SetObjetoPosicao(nil, -1);
  FLista.Clear;
end;

function TCache.Count: Integer;
begin
  Result := FLista.Count;
end;

constructor TCache.Create;
begin
  FLista := TObjectList.Create(True);
  SetObjetoPosicao(nil, -1);
end;

destructor TCache.Destroy;
begin
  SetObjetoPosicao(nil, -1);
  FLista.Free;
  inherited;
end;

function TCache.DoIncluiu(AObjeto: TItemCache): Boolean;
begin
  //Chamado logo após o Objeto ser criado
  //Se retorna False, destroi o objeto.
  Result := True;
end;

procedure TCache.EndUpdate;
var
  P: Integer;
begin
  Dec(FAtualizando);
  if FAtualizando = 0 then
  begin
    if FGuardaPosicao > -1 then
    begin
      if (FGuardaPosicao < FLista.Count) and
        (FLista[FGuardaPosicao] = FGuardaObjeto) then
          SetObjetoPosicao(FGuardaObjeto, FGuardaPosicao)
      else
      begin
        P := FLista.IndexOf(FGuardaObjeto);
        if P >= 0 then
          SetObjetoPosicao(TItemCache(FLista[P]), P);
      end;
    end;
  end;
end;

function TCache.GetPosicao: Integer;
begin
  Result := FPosicaoAtual;
end;

function TCache.Inclui(var APosicao: Integer): TItemCache;
begin
  Result := FClasse.Create;
  try
    if DoIncluiu(Result) then
    begin
      if APosicao < 0 then
      begin
        FLista.Add(Result);
        APosicao := 0;
      end
      else
      begin
        if Compara(TItemCache(FLista[APosicao])) < 0 then
          Inc(APosicao);
        FLista.Insert(APosicao, Result);
      end;
    end
    else
      FreeAndNil(Result);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TCache.PosicaoCodigo(out APosicao: Integer): Boolean;
var
  Pini, Pfim, Meio, Comp: Integer;
begin
  //Efetua uma busca binaria para localizar o item
  Result := False;   //False se não encontrar...
  if Assigned(FObjeto) then
  begin
    Comp := Compara(FObjeto);
    if Comp = 0 then
    begin
      Result := True;
      APosicao := FPosicaoAtual;
      Exit;
    end;
    if Comp < 0 then
    begin
      Pini := FPosicaoAtual + 1;
      Pfim := FLista.Count - 1;
    end
    else
    begin
      Pini := 0;
      Pfim := FPosicaoAtual - 1;
    end;
    Meio := FPosicaoAtual;
  end
  else
  begin
    Pini := 0;
    Pfim := FLista.Count - 1;
    Meio := -1;
  end;
  while Pini <= Pfim do
  begin
    Meio := (Pini + Pfim) div 2;
    Comp := Compara(TItemCache(FLista[Meio]));
    if Comp = 0 then
    begin
      Result := True;
      Break;
    end;
    if Comp < 0 then
      Pini := Meio + 1
    else
      Pfim := Meio - 1;
  end;
  APosicao := Meio;
end;

function TCache.Retira: Boolean;
var
  P: Integer;
begin
  //Retorna True se sucesso
  Result := False;
  if PosicaoCodigo(P) then
  begin
    if FLista[P] = FObjeto then
      SetObjetoPosicao(nil, -1);
    FLista.Delete(P);
    if P < FPosicaoAtual then
      Dec(FPosicaoAtual);
    Result := True;
  end;
end;

procedure TCache.SetPosicao(const Value: Integer);
begin
  SetObjetoPosicao(TItemCache(FLista[Value]), Value);
end;

procedure TCache.SetObjetoPosicao(AObjeto: TItemCache;
  const Posicao: Integer);
begin
  FObjeto := AObjeto;
  FPosicaoAtual := Posicao;
end;

function TCache.StringCodigos(const Delimitador: string;
  const Separador: string): string;
var
  laco: Integer;
begin
  Result := '';
  if Count = 0 then
    Exit;
  BeginUpdate;
  try
    for laco := 0 to Count - 1 do
    begin
      Posicao := laco;
      Result := Result + Delimitador + StringCodigo + Delimitador + Separador;
    end;
    Delete(Result, Length(Result) - Length(Separador) + 1, Length(Separador));
  finally
    EndUpdate;
  end;
end;

function TCache.StringCodigos(const Delimitador, Separador,
  UltimoSeparador: string): string;
var
  laco: Integer;
  LUltimoSeparador: array [Boolean] of string;
begin
  Result := '';
  if Count = 0 then
    Exit;
  LUltimoSeparador[False] := Separador;
  LUltimoSeparador[True] := UltimoSeparador;
  BeginUpdate;
  try
    for laco := 0 to Count - 1 do
    begin
      Posicao := laco;
      Result := Result + Delimitador + StringCodigo + Delimitador +
        LUltimoSeparador[(Count >= 2) and (laco = Count - 2)];
    end;
    Delete(Result, Length(Result) - Length(Separador) + 1, Length(Separador));
  finally
    EndUpdate;
  end;
end;

function TCache.TemCodigo: Boolean;
var
  LPosicao: Integer;
begin
  //False se não encontrar...
  Result := PosicaoCodigo(LPosicao);
end;

{ TInteger }

procedure TInteger.Assign(Origem: TItemCache);
begin
  Codigo := (Origem as TInteger).Codigo;
end;

procedure TInteger.SetCodigo(const Value: Integer);
begin
  if FCodigo <> Value then
  begin
    Libera;
    FCodigo := Value;
    Inicializa;
  end;
end;

{ TCacheInteger }

function TCacheInteger.Compara(AObjeto: TItemCache): Integer;
var
  LCodigo: Integer;
begin
  LCodigo := (AObjeto as TInteger).Codigo;
  Result := Ord(LCodigo > FNovoCodigo) - Ord(LCodigo < FNovoCodigo);
end;

constructor TCacheInteger.Create;
begin
  inherited;
  FClasse := TInteger;
end;

function TCacheInteger.DoIncluiu(AObjeto: TItemCache): Boolean;
begin
  Result := inherited DoIncluiu(AObjeto);
  (AObjeto as TInteger).Codigo := FNovoCodigo;
end;

function TCacheInteger.GetCodigo: Integer;
begin
  if Assigned(FObjeto) then
    Result := (FObjeto as TInteger).Codigo
  else
    Result := -1;
end;

function TCacheInteger.IntegerArray: TIntegerArray;
var
  laco: Integer;
begin
  SetLength(Result, Count);
  BeginUpdate;
  try
    for laco := 0 to Count - 1 do
    begin
      Posicao := laco;
      Result[laco] := Codigo;
    end;
  finally
    EndUpdate;
  end;
end;

function TCacheInteger.Retira(ACodigo: Integer): Boolean;
begin
  FNovoCodigo := ACodigo;
  Result := inherited Retira;
end;

procedure TCacheInteger.SetCodigo(const Value: Integer);
var
  P: Integer;
begin
  if Value <> GetCodigo then
  begin
    FNovoCodigo := Value;
    if PosicaoCodigo(P) then
      SetObjetoPosicao(TItemCache(FLista[P]), P)
    else
      SetObjetoPosicao(TItemCache(Inclui(P)), P);
  end;
end;

function TCacheInteger.StringCodigo: string;
begin
  Result := IntToStr(Codigo);
end;

function TCacheInteger.TemCodigo(ACodigo: Integer): Boolean;
begin
  FNovoCodigo := ACodigo;
  Result := inherited TemCodigo;
end;

{ TString }

procedure TString.Assign(Origem: TItemCache);
begin
  Codigo := (Origem as TString).Codigo;
end;

procedure TString.SetCodigo(const Value: string);
begin
  if FCodigo <> Value then
  begin
    Libera;
    FCodigo := Value;
    Inicializa;
  end;
end;

{ TCacheString }

function TCacheString.Compara(AObjeto: TItemCache): Integer;
begin
  Result := AnsiCompareText((AObjeto as TString).Codigo, FNovoCodigo);
end;

constructor TCacheString.Create;
begin
  inherited;
  FClasse := TString;
end;

function TCacheString.DoIncluiu(AObjeto: TItemCache): Boolean;
begin
  Result := inherited DoIncluiu(AObjeto);
  (AObjeto as TString).Codigo := FNovoCodigo;
end;

function TCacheString.GetCodigo: string;
begin
  if Assigned(FObjeto) then
    Result := (FObjeto as TString).Codigo
  else
    Result := '#VAZIO#';
end;

function TCacheString.GetTextoSubstituicao: string;
begin
  //Retorna o próprio código
  Result := Codigo;
end;

function TCacheString.Retira(ACodigo: string): Boolean;
begin
  FNovoCodigo := ACodigo;
  Result := inherited Retira;
  Retirado(ACodigo);
end;

procedure TCacheString.Retirado(ACodigo: string);
begin
  //Este código é executado logo após um item ser retirado.
end;

procedure TCacheString.SetCodigo(const Value: string);
var
  P: Integer;
begin
  if Value <> GetCodigo then
  begin
    FNovoCodigo := Value;
    if PosicaoCodigo(P) then
      SetObjetoPosicao(TItemCache(FLista[P]), P)
    else
      SetObjetoPosicao(TItemCache(Inclui(P)), P);
  end;
end;

function TCacheString.StringCodigo: string;
begin
  Result := Codigo;
end;

function TCacheString.SubstitueTexto(Ent, DelimE, DelimD: string): string;
var
  P, F: Integer;
  aux: string;
begin
  BeginUpdate;
  try
    Result := Ent;
    P := Pos(DelimE, Ent);
    if P > 0 then
    begin
      aux := Copy(Ent, P + Length(DelimE), Length(Ent));
      F := Pos(DelimD, aux);
      if F > 0 then
      begin
        Codigo := Copy(aux, 1, F - 1);
        aux := GetTextoSubstituicao;
        Result := SubstitueTexto(Copy(ent, 1, P - 1) + aux +
          Copy(ent, P + F + Length(DelimE) + Length(DelimD) - 1, Length(ent)),
          DelimE, DelimD);
      end;
    end;
  finally
    EndUpdate;
  end;
end;

function TCacheString.TemCodigo(ACodigo: string): Boolean;
begin
  FNovoCodigo := ACodigo;
  Result := inherited TemCodigo;
end;

{ TString2Double }

procedure TString2Double.Assign(Origem: TItemCache);
var
  O: TString2Double;
begin
  inherited;
  O := Origem as TString2Double;
  Valor1 := O.Valor1;
  Valor2 := O.Valor2;
end;

constructor TString2Double.Create;
begin
  inherited;
  FillChar(FValores, SizeOf(FValores), 0);
end;

function TString2Double.GetValor1: Double;
begin
  Result := FValores[0];
end;

function TString2Double.GetValor2: Double;
begin
  Result := FValores[1];
end;

procedure TString2Double.SetValor1(const Value: Double);
begin
  FValores[0] := Value;
end;

procedure TString2Double.SetValor2(const Value: Double);
begin
  FValores[1] := Value;
end;

{ TCacheString2Double }

procedure TCacheString2Double.AdicionaValor1(const Value: Double);
begin
  Valor1 := Valor1 + Value;
end;

procedure TCacheString2Double.AdicionaValor2(const Value: Double);
begin
  Valor2 := Valor2 + Value;
end;

procedure TCacheString2Double.Assign(Origem: TCache);
begin
  inherited;
  FormatoSubstituicao := (Origem as TCacheString2Double).FormatoSubstituicao;
end;

constructor TCacheString2Double.Create;
begin
  inherited;
  FClasse := TString2Double;
  FormatoSubstituicao := 'Valor1: %f; Valor2: %f';
end;

function TCacheString2Double.GetTextoSubstituicao: string;
begin
  Result := Format(FFormatoSubstituicao, [Valor1, Valor2]);
end;

function TCacheString2Double.GetValor1: Double;
begin
  Result := (FObjeto as TString2Double).Valor1;
end;

function TCacheString2Double.GetValor2: Double;
begin
  Result := (FObjeto as TString2Double).Valor2;
end;

procedure TCacheString2Double.SetValor1(const Value: Double);
begin
  (FObjeto as TString2Double).Valor1 := Value;
end;

procedure TCacheString2Double.SetValor2(const Value: Double);
begin
  (FObjeto as TString2Double).Valor2 := Value;
end;

{ TStringVariant }

procedure TStringVariant.Assign(Origem: TItemCache);
begin
  inherited;
  Valor := (Origem as TStringVariant).Valor;
end;

constructor TStringVariant.Create;
begin
  inherited;
  FValor := '';
end;

{ THashTable }

constructor THashTable.Create;
begin
  inherited;
  FClasse := TStringVariant;
end;

function THashTable.GetAsBoolean(const ACodigo: string): Boolean;
begin
  if TemCodigo(ACodigo) then
    Result := Value[ACodigo]
  else
    Result := False;
end;

function THashTable.GetAsInterface(const ACodigo: string): IUnknown;
begin
  Result := Value[ACodigo];
end;

function THashTable.GetTextoSubstituicao: string;
begin
  if VarIsNull(Valor) then
    Result := ''
  else
    Result := Valor;
end;

function THashTable.GetValor: Variant;
begin
  Result := (FObjeto as TStringVariant).Valor;
end;

function THashTable.GetValorAsInterface: IUnknown;
begin
  Result := Valor;
end;

function THashTable.GetValue(const ACodigo: string): Variant;
begin
  Codigo := ACodigo;
  Result := Valor;
end;

procedure THashTable.SetAsBoolean(const ACodigo: string;
  const AValue: Boolean);
begin
  Value[ACodigo] := AValue;
end;

procedure THashTable.SetAsInterface(const ACodigo: string; const AValue: IUnknown);
begin
  Value[ACodigo] := AValue;
end;

procedure THashTable.SetValor(const Value: Variant);
begin
  (FObjeto as TStringVariant).Valor := Value;
end;

procedure THashTable.SetValorAsInterface(const Value: IUnknown);
begin
  Valor := Value;
end;

procedure THashTable.SetValue(const ACodigo: string; const Value: Variant);
begin
  Codigo := ACodigo;
  Valor := Value;
end;

{ TStringString }

procedure TStringString.Assign(Origem: TItemCache);
begin
  inherited;
  Valor := (Origem as TStringString).Valor;
end;

{ THashString }

constructor THashString.Create;
begin
  inherited;
  FClasse := TStringString;
end;

function THashString.GetTextoSubstituicao: string;
begin
  Result := Valor;
end;

function THashString.GetValor: string;
begin
  Result := (FObjeto as TStringString).Valor;
end;

function THashString.GetValue(const ACodigo: string): string;
begin
  Codigo := ACodigo;
  Result := Valor;
end;

procedure THashString.SetValor(const Value: string);
begin
  (FObjeto as TStringString).Valor := Value;
end;

procedure THashString.SetValue(const ACodigo: string; const Value: string);
begin
  Codigo := ACodigo;
  Valor := Value;
end;

{ TStringInteger }

procedure TStringInteger.Assign(Origem: TItemCache);
begin
  inherited;
  Valor := (Origem as TStringInteger).Valor;
end;

{ THashInteger }

constructor THashInteger.Create;
begin
  inherited;
  FClasse := TStringInteger;
end;

function THashInteger.GetTextoSubstituicao: string;
begin
  Result := IntToStr(Valor);
end;

function THashInteger.GetValor: Integer;
begin
  Result := (FObjeto as TStringInteger).Valor;
end;

function THashInteger.GetValue(ACodigo: string): Integer;
begin
  Codigo := ACodigo;
  Result := Valor;
end;

procedure THashInteger.SetValor(const Value: Integer);
begin
  (FObjeto as TStringInteger).Valor := Value;
end;

procedure THashInteger.SetValue(ACodigo: string; const Value: Integer);
begin
  Codigo := ACodigo;
  Valor := Value;
end;

{ TItemDateTime }

procedure TItemDateTime.Assign(Origem: TItemCache);
begin
  Codigo := (Origem as TItemDateTime).Codigo;
end;

procedure TItemDateTime.SetCodigo(const Value: TDateTime);
begin
  if FCodigo <> Value then
  begin
    Libera;
    FCodigo := Value;
    Inicializa;
  end;
end;

{ TCacheDateTime }

procedure TCacheDateTime.Assign(Origem: TCache);
begin
  inherited;
  FormatoData := (Origem as TCacheDateTime).FormatoData;
end;

function TCacheDateTime.Compara(AObjeto: TItemCache): Integer;
var
  LCodigo: TDateTime;
begin
  LCodigo := (AObjeto as TItemDateTime).Codigo;
  Result := Ord(LCodigo > FNovoCodigo) - Ord(LCodigo < FNovoCodigo);
end;

constructor TCacheDateTime.Create;
begin
  inherited;
  FClasse := TItemDateTime;
  FFormatoData := 'yyyy-mm-dd hh:nn:ss.zzz';
end;

function TCacheDateTime.DoIncluiu(AObjeto: TItemCache): Boolean;
begin
  Result := inherited DoIncluiu(AObjeto);
  (AObjeto as TItemDateTime).Codigo := FNovoCodigo;
end;

function TCacheDateTime.GetCodigo: TDateTime;
begin
  if Assigned(FObjeto) then
    Result := (FObjeto as TItemDateTime).Codigo
  else
    Result := -1;
end;

function TCacheDateTime.Retira(ACodigo: TDateTime): Boolean;
begin
  FNovoCodigo := ACodigo;
  Result := inherited Retira;
end;

procedure TCacheDateTime.SetCodigo(const Value: TDateTime);
var
  P: Integer;
begin
  if Value <> GetCodigo then
  begin
    FNovoCodigo := Value;
    if PosicaoCodigo(P) then
      SetObjetoPosicao(TItemCache(FLista[P]), P)
    else
      SetObjetoPosicao(TItemCache(Inclui(P)), P);
  end;
end;

function TCacheDateTime.StringCodigo: string;
begin
  {(Edgar 16/09/2005) adotado o "padrão SQL Server" para data e hora.
  A propriedade FormatoData pode ser alterada para o formato desejado.}
  DateTimeToString(Result, FFormatoData, Codigo);
end;

function TCacheDateTime.TemCodigo(ACodigo: TDateTime): Boolean;
begin
  FNovoCodigo := ACodigo;
  Result := inherited TemCodigo;
end;

{ TShortString }

procedure TShortString.Assign(Origem: TItemCache);
begin
  Codigo := (Origem as TShortString).Codigo;
end;

procedure TShortString.SetCodigo(const Value: ShortString);
begin
  if FCodigo <> Value then
  begin
    Libera;
    FCodigo := Value;
    Inicializa;
  end;
end;

{ TShortStringShortString }

procedure TShortStringShortString.Assign(Origem: TItemCache);
begin
  inherited;
  Valor := (Origem as TShortStringShortString).Valor;
end;

{ TIntegerDouble }

procedure TIntegerDouble.Assign(Origem: TItemCache);
begin
  inherited;
  Valor := (Origem as TIntegerDouble).Valor;
end;

constructor TIntegerDouble.Create;
begin
  inherited;
  FValor := 0;
end;

{ TCacheIntegerDouble }

constructor TCacheIntegerDouble.Create;
begin
  inherited;
  FClasse := TIntegerDouble;
end;

function TCacheIntegerDouble.GetValor: Double;
begin
  Result := (FObjeto as TIntegerDouble).Valor;
end;

function TCacheIntegerDouble.GetValue(ACodigo: Integer): Double;
begin
  Codigo := ACodigo;
  Result := Valor;
end;

procedure TCacheIntegerDouble.SetValor(const Value: Double);
begin
  (FObjeto as TIntegerDouble).Valor := Value;
end;

procedure TCacheIntegerDouble.SetValue(ACodigo: Integer; const Value: Double);
begin
  Codigo := ACodigo;
  Valor := Value;
end;

{ TClassItem }

procedure TClassItem.Assign(Origem: TItemCache);
begin
  Codigo := (Origem as TClassItem).Codigo;
end;

procedure TClassItem.SetCodigo(const Value: TClass);
begin
  if FCodigo <> Value then
  begin
    Libera;
    FCodigo := Value;
    Inicializa;
  end;
end;

{ TClassCache }

function TClassCache.Compara(AObjeto: TItemCache): Integer;
var
  LCodigo: TClass;
begin
  LCodigo := (AObjeto as TClassItem).Codigo;
  Result := Ord(Integer(LCodigo) > Integer(FNovoCodigo)) -
    Ord(Integer(LCodigo) < Integer(FNovoCodigo));
end;

constructor TClassCache.Create;
begin
  inherited;
  FClasse := TClassItem;
end;

function TClassCache.DoIncluiu(AObjeto: TItemCache): Boolean;
begin
  Result := inherited DoIncluiu(AObjeto);
  (AObjeto as TClassItem).Codigo := FNovoCodigo;
end;

function TClassCache.GetCodigo: TClass;
begin
  if Assigned(FObjeto) then
    Result := (FObjeto as TClassItem).Codigo
  else
    Result := nil;
end;

function TClassCache.Retira(ACodigo: TClass): Boolean;
begin
  FNovoCodigo := ACodigo;
  Result := inherited Retira;
end;

procedure TClassCache.SetCodigo(const Value: TClass);
var
  P: Integer;
begin
  if Value <> GetCodigo then
  begin
    FNovoCodigo := Value;
    if PosicaoCodigo(P) then
      SetObjetoPosicao(TItemCache(FLista[P]), P)
    else
      SetObjetoPosicao(TItemCache(Inclui(P)), P);
  end;
end;

function TClassCache.StringCodigo: string;
begin
  Result := Codigo.ClassName;
end;

function TClassCache.TemCodigo(ACodigo: TClass): Boolean;
begin
  FNovoCodigo := ACodigo;
  Result := inherited TemCodigo;
end;

{ THashClassObjectItem }

procedure THashClassObjectItem.Assign(Origem: TItemCache);
begin
  inherited;
  Object_ := (Origem as THashClassObjectItem).Object_;
end;

destructor THashClassObjectItem.Destroy;
begin
  if FOwned then
    FObject.Free;
  inherited;
end;

{ THashClassObject }

constructor THashClassObject.Create(AOwned: Boolean);
begin
  inherited Create;
  FOwned := AOwned;
  FClasse := THashClassObjectItem;
end;

function THashClassObject.DoIncluiu(AObjeto: TItemCache): Boolean;
begin
  Result := inherited DoIncluiu(AObjeto);
  (AObjeto as THashClassObjectItem).Owned := FOwned;
end;

function THashClassObject.GetObject: TObject;
begin
  Result := (FObjeto as THashClassObjectItem).Object_;
end;

function THashClassObject.GetObjects(ACodigo: TClass): TObject;
begin
  Codigo := ACodigo;
  Result := Object_;
end;

procedure THashClassObject.SetChildrenOwned;
var
  laco: Integer;
begin
  BeginUpdate;
  try
    for laco := 0 to Count - 1 do
    begin
      Posicao := laco;
      (FObjeto as THashClassObjectItem).Owned := FOwned;
    end;
  finally
    EndUpdate;
  end;
end;

procedure THashClassObject.SetObject(const Value: TObject);
begin
  (FObjeto as THashClassObjectItem).Object_ := Value;
end;

procedure THashClassObject.SetObjects(ACodigo: TClass;
  const Value: TObject);
begin
  Codigo := ACodigo;
  Object_ := Value;
end;

procedure THashClassObject.SetOwned(const Value: Boolean);
begin
  if FOwned <> Value then
  begin
    FOwned := Value;
    SetChildrenOwned;
  end;
end;

{ TStringDouble }

procedure TStringDouble.Assign(Origem: TItemCache);
begin
  inherited;
  Valor := (Origem as TStringDouble).Valor;
end;

{ THashDouble }

constructor THashDouble.Create;
begin
  inherited;
  FClasse := TStringDouble;
end;

function THashDouble.GetTextoSubstituicao: string;
begin
  Result := FloatToStr(Valor);
end;

function THashDouble.GetValor: Double;
begin
  Result := (FObjeto as TStringDouble).Valor;
end;

function THashDouble.GetValue(ACodigo: string): Double;
begin
  Codigo := ACodigo;
  Result := Valor;
end;

procedure THashDouble.SetValor(const Value: Double);
begin
  (FObjeto as TStringDouble).Valor := Value;
end;

procedure THashDouble.SetValue(ACodigo: string; const Value: Double);
begin
  Codigo := ACodigo;
  Valor := Value;
end;

end.
