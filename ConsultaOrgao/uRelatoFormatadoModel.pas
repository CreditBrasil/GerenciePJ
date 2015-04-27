unit uRelatoFormatadoModel;

interface

uses
  SysUtils, Classes;

type
  TRelatoFormatadoTipoSecao = (rfsPefin, rfsRefin, rfsResumo, rfsFalenRecupConc, rfsDividaVencida, rfsAcaoJudicial,
    rfsProtesto, rfsCheque, rfsConcentre, rfsRecheque);

  TRelatoFormatadoSecao = class(TObject)
  private
    FUltimas: TStrings;
    FTipoSecao: TRelatoFormatadoTipoSecao;
    FTotalOcorrencias: Integer;
    FValorTotal: Currency;
  public
    constructor Create(ATipoSecao: TRelatoFormatadoTipoSecao);
    destructor Destroy; override;
    procedure Clear;
    property TotalOcorrencias: Integer read FTotalOcorrencias write FTotalOcorrencias;
    property ValorTotal: Currency read FValorTotal write FValorTotal;
    property Ultimas: TStrings read FUltimas;
  end;

  TRelatoFormatadoModel = class(TObject)
  private
    FCNPJ: string;
    FEmitidoEm: TDateTime;
    FRazaoSocial: string;
    FRelatoFormatadoSecoes: array [TRelatoFormatadoTipoSecao] of TRelatoFormatadoSecao;
    function GetSecoes(AIndex: TRelatoFormatadoTipoSecao): TRelatoFormatadoSecao;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    property CNPJ: string read FCNPJ write FCNPJ;
    property EmitidoEm: TDateTime read FEmitidoEm write FEmitidoEm;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property Secoes[AIndex: TRelatoFormatadoTipoSecao]: TRelatoFormatadoSecao read GetSecoes; default;
  end;

implementation

{ TRelatoFormatadoSecao }

procedure TRelatoFormatadoSecao.Clear;
begin
  FUltimas.Clear;
  FTotalOcorrencias := 0;
  FValorTotal := 0;
end;

constructor TRelatoFormatadoSecao.Create(ATipoSecao: TRelatoFormatadoTipoSecao);
begin
  FTipoSecao := ATipoSecao;
  FUltimas := TStringList.Create;
end;

destructor TRelatoFormatadoSecao.Destroy;
begin
  FUltimas.Free;
  inherited;
end;

{ TRelatoFormatadoModel }

procedure TRelatoFormatadoModel.Clear;
var
  laco: TRelatoFormatadoTipoSecao;
begin
  FCNPJ := '';
  FEmitidoEm := Now;
  FRazaoSocial := '';
  for laco := Low(TRelatoFormatadoTipoSecao) to High(TRelatoFormatadoTipoSecao) do
    FRelatoFormatadoSecoes[laco].Clear;
end;

constructor TRelatoFormatadoModel.Create;
var
  laco: TRelatoFormatadoTipoSecao;
begin
  for laco := Low(TRelatoFormatadoTipoSecao) to High(TRelatoFormatadoTipoSecao) do
    FRelatoFormatadoSecoes[laco] := TRelatoFormatadoSecao.Create(laco);
end;

destructor TRelatoFormatadoModel.Destroy;
var
  laco: TRelatoFormatadoTipoSecao;
begin
  for laco := Low(TRelatoFormatadoTipoSecao) to High(TRelatoFormatadoTipoSecao) do
    FRelatoFormatadoSecoes[laco].Free;
  inherited;
end;

function TRelatoFormatadoModel.GetSecoes(AIndex: TRelatoFormatadoTipoSecao): TRelatoFormatadoSecao;
begin
  Result := FRelatoFormatadoSecoes[AIndex];
end;

end.
