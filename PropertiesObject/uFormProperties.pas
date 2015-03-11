unit uFormProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ValEdit, Helper_TLB, FileCtrl;

type
  TTipos = (tString, tListaRestrita, tNaoSim, tPasta);

  TClassTratamentoTipos = class of TTratamentoTipos;

  TTratamentoTipos = class(TObject)
  private
    FProperty: IAlxProperty;
  protected
    function GetAsString: string; virtual;
    procedure SetAsString(const Value: string); virtual;
    property Property_: IAlxProperty read FProperty;
  public
    constructor Create(const AProperty: IAlxProperty); virtual;
    procedure AjustaItemProp(AItemProp: TItemProp); virtual;
    function ClickEllipsis(var AValue: string): Boolean; virtual;
    class function EnumTypesToTipos(AEnumTypes: EnumTypes): TTipos;
    class function Factory(const AProperty: IAlxProperty): TTratamentoTipos;
    property AsString: string read GetAsString write SetAsString;
  end;

  TTratamentoTiposListaRestrita = class(TTratamentoTipos)
  public
    procedure AjustaItemProp(AItemProp: TItemProp); override;
  end;

  TTratamentoTiposNaoSim = class(TTratamentoTiposListaRestrita)
  protected
    function GetAsString: string; override;
    procedure SetAsString(const Value: string); override;
  public
    constructor Create(const AProperty: IAlxProperty); override;
  end;

  TTratamentoTiposPasta = class(TTratamentoTipos)
  public
    function ClickEllipsis(var AValue: string): Boolean; override;
    procedure AjustaItemProp(AItemProp: TItemProp); override;
  end;

  TFormProperties = class(TForm)
    vleProperties: TValueListEditor;
    cmdCancelar: TBitBtn;
    cmdOk: TBitBtn;
    procedure cmdOkClick(Sender: TObject);
    procedure vlePropertiesEditButtonClick(Sender: TObject);
  private
    FProperties: IProperties;
    procedure CarregaProperties;
    procedure LeProperties;
    procedure SetProperties(const Value: IProperties);
  public
    property Properties: IProperties read FProperties write SetProperties;
  end;

const
  TiposToEnumTypes: array [TTipos] of EnumTypes = (typeString, typeListaRestrita, typeNaoSim, typePasta);
  TratamentoTipos: array [TTipos] of TClassTratamentoTipos = (TTratamentoTipos, TTratamentoTiposListaRestrita,
    TTratamentoTiposNaoSim, TTratamentoTiposPasta);

implementation

{$R *.dfm}

{ TTratamentoTipos }

procedure TTratamentoTipos.AjustaItemProp(AItemProp: TItemProp);
begin
  AItemProp.EditMask := '';
  AItemProp.EditStyle := esSimple;
  //AItemProp.PickList := ;
  AItemProp.MaxLength := 0;
  AItemProp.ReadOnly := False;
end;

function TTratamentoTipos.ClickEllipsis(var AValue: string): Boolean;
begin
  Result := False;
end;

constructor TTratamentoTipos.Create(const AProperty: IAlxProperty);
begin
  FProperty := AProperty;
end;

class function TTratamentoTipos.EnumTypesToTipos(AEnumTypes: EnumTypes): TTipos;
var
  laco: TTipos;
begin
  Result := tString;
  for laco := Low(TTipos) to High(TTipos) do
    if TiposToEnumTypes[laco] = AEnumTypes then
    begin
      Result := laco;
      Break;
    end;
end;

class function TTratamentoTipos.Factory(const AProperty: IAlxProperty): TTratamentoTipos;
begin
  Result := TratamentoTipos[EnumTypesToTipos(AProperty.AlxType)].Create(AProperty);
end;

function TTratamentoTipos.GetAsString: string;
begin
  Result := FProperty.Value;
end;

procedure TTratamentoTipos.SetAsString(const Value: string);
begin
  FProperty.Value := Value;
end;

{ TTratamentoTiposListaRestrita }

procedure TTratamentoTiposListaRestrita.AjustaItemProp(AItemProp: TItemProp);
begin
  inherited;
  AItemProp.PickList.CommaText := Property_.PickList;
  AItemProp.EditStyle := esPickList;
  AItemProp.ReadOnly := True;
end;

{ TTratamentoTiposNaoSim }

constructor TTratamentoTiposNaoSim.Create(const AProperty: IAlxProperty);
begin
  inherited;
  AProperty.PickList := 'Não,Sim';
end;

function TTratamentoTiposNaoSim.GetAsString: string;
const
  NaoSim: array [Boolean] of string = ('Não', 'Sim');
var
  LValue: Boolean;
begin
  LValue := FProperty.Value;
  Result := NaoSim[LValue];
end;

procedure TTratamentoTiposNaoSim.SetAsString(const Value: string);
begin
  FProperty.Value := (UpperCase(Copy(Value, 1, 1)) = 'S');
end;

{ TTratamentoTiposPasta }

procedure TTratamentoTiposPasta.AjustaItemProp(AItemProp: TItemProp);
begin
  AItemProp.EditStyle := esEllipsis;
end;

function TTratamentoTiposPasta.ClickEllipsis(var AValue: string): Boolean;
begin
  Result := SelectDirectory(FProperty.Name, '', AValue);
  if Result then
    AValue := IncludeTrailingPathDelimiter(AValue);
end;


{ TFormProperties }

procedure TFormProperties.CarregaProperties;
var
  laco: Integer;
  LItemProp: TItemProp;
  LTratamentoTipos: TTratamentoTipos;
  LProperty: IAlxProperty;
begin
  vleProperties.Strings.BeginUpdate;
  try
    vleProperties.Strings.Clear;
    for laco := 0 to FProperties.Count - 1 do
    begin
      LProperty := FProperties[laco];
      LTratamentoTipos := TTratamentoTipos.Factory(LProperty);
      try
        LItemProp := vleProperties.ItemProps[vleProperties.Strings.Add(LProperty.Name + '=' + LTratamentoTipos.AsString)];
        LTratamentoTipos.AjustaItemProp(LItemProp);
      finally
        LTratamentoTipos.Free;
      end;
    end;
  finally
    vleProperties.Strings.EndUpdate;
  end;
end;

procedure TFormProperties.SetProperties(const Value: IProperties);
begin
  if FProperties <> Value then
  begin
    FProperties := Value;
    CarregaProperties;
  end;
end;

procedure TFormProperties.cmdOkClick(Sender: TObject);
begin
  LeProperties;
end;

procedure TFormProperties.LeProperties;
var
  laco: Integer;
  LTratamentoTipos: TTratamentoTipos;
  LProperty: IAlxProperty;
begin
  for laco := 0 to FProperties.Count - 1 do
  begin
    LProperty := FProperties[laco];
    LTratamentoTipos := TTratamentoTipos.Factory(LProperty);
    try
      LTratamentoTipos.AsString := vleProperties.Strings.Values[LProperty.Name];
    finally
      LTratamentoTipos.Free;
    end;
  end;
end;

procedure TFormProperties.vlePropertiesEditButtonClick(Sender: TObject);
var
  LProperty: IAlxProperty;
  LTratamentoTipos: TTratamentoTipos;
  LValue: string;
begin
  LProperty := FProperties[vleProperties.Row - 1];
  LTratamentoTipos := TTratamentoTipos.Factory(LProperty);
  try
    LValue := vleProperties.Strings.Values[LProperty.Name];
    if LTratamentoTipos.ClickEllipsis(LValue) then
      vleProperties.Strings.Values[LProperty.Name] := LValue;
  finally
    LTratamentoTipos.Free;
  end;
end;

end.
