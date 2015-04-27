unit progrss;

interface

uses
  Classes, Forms, ComCtrls, Controls, StdCtrls, ExtCtrls, Tipos, Buttons, ServiceLocator, progrssInterface;

type
  TfrmProgresso = class(TForm)
    pnlProgresso: TPanel;
    lblMens: TLabel;
    pb: TProgressBar;
    lblTitulo: TLabel;
    cmdCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure cmdCancelarClick(Sender: TObject);
  private
    FCancelado: Boolean;
    FNivel: Integer;
  public
    procedure Posiciona;
    property Nivel: Integer read FNivel write FNivel;
    property Cancelado: Boolean read FCancelado;
  end;

  TProgresso = class(TComponent, IProgresso)
  private
    frm: TfrmProgresso;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { IProgresso }
    procedure Esconde;
    function GetPosition: Integer;
    function MaisUm(const Mens: string): Boolean;
    procedure Mostrar(const Titulo: string; ANivel: Integer = 0; AMostraCancelar: Boolean = False);
    function Posicao(const Mens: string; p, total: Integer): Boolean;
  end;

  TProgressoStub = class(TObjetoInterface, IProgresso)
  private
    { IProgresso }
    procedure Esconde;
    function GetPosition: Integer;
    function MaisUm(const Mens: string): Boolean;
    procedure Mostrar(const Titulo: string; ANivel: Integer = 0; AMostraCancelar: Boolean = False);
    function Posicao(const Mens: string; p, total: Integer): Boolean;
  end;

  TProgressoProxyInterfaced = class(TSLObject, IProgresso)
  private
    FProgresso: TProgresso;
  protected
    { IProgresso }
    procedure Esconde;
    function GetPosition: Integer;
    function MaisUm(const Mens: string): Boolean;
    procedure Mostrar(const Titulo: string; ANivel: Integer = 0; AMostraCancelar: Boolean = False);
    function Posicao(const Mens: string; p, total: Integer): Boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{$R *.DFM}

{ TProgresso }

constructor TProgresso.Create(AOwner: TComponent);
begin
  inherited;
  frm := TfrmProgresso.Create(nil);
end;

destructor TProgresso.Destroy;
begin
  frm.Free;
  Application.ProcessMessages;
  inherited;
end;

procedure TProgresso.Esconde;
begin
  frm.pb.Max := 1;
  frm.pb.Position := 1;
  frm.Refresh;
  frm.Hide;
  Application.ProcessMessages;
end;

function TProgresso.GetPosition: Integer;
begin
  Result := frm.pb.Position;
end;

function TProgresso.MaisUm(const Mens: string): Boolean;
begin
  frm.lblMens.Caption := Mens;
  frm.pb.Position := frm.pb.Position + 1;
  if frm.cmdCancelar.Visible then
    Application.ProcessMessages
  else
    frm.Refresh;
  Result := not frm.Cancelado;
end;

procedure TProgresso.Mostrar(const Titulo: string; ANivel: Integer; AMostraCancelar: Boolean);
const
  Largura: array [Boolean] of Integer = (293, 357);
begin
  frm.ClientWidth := Largura[AMostraCancelar];
  frm.cmdCancelar.Visible := AMostraCancelar;
  frm.lblTitulo.Caption := Titulo;
  frm.pb.Max := 1;
  frm.pb.Position := 0;
  frm.Nivel := ANivel;
  frm.Show;
  Application.ProcessMessages;
end;

function TProgresso.Posicao(const Mens: string; p, total: Integer): Boolean;
begin
  frm.lblMens.Caption := Mens;
  frm.pb.Max := total;
  frm.pb.Position := p - 1;
  if frm.cmdCancelar.Visible then
    Application.ProcessMessages
  else
    frm.Refresh;
  Result := not frm.Cancelado;
end;

{ TProgressoStub }

procedure TProgressoStub.Esconde;
begin
  //Faz Nada
end;

function TProgressoStub.GetPosition: Integer;
begin
  Result := 0;
end;

function TProgressoStub.MaisUm(const Mens: string): Boolean;
begin
  //Faz Nada
  Result := True;
end;

procedure TProgressoStub.Mostrar(const Titulo: string; ANivel: Integer; AMostraCancelar: Boolean);
begin
  //Faz Nada
end;

function TProgressoStub.Posicao(const Mens: string; p, total: Integer): Boolean;
begin
  //Faz Nada
  Result := True;
end;

{ tfrmProgresso }

procedure TfrmProgresso.cmdCancelarClick(Sender: TObject);
begin
  cmdCancelar.Enabled := False;
  FCancelado := True;
end;

procedure TfrmProgresso.FormShow(Sender: TObject);
begin
  Posiciona;
end;

procedure TfrmProgresso.Posiciona;
begin
  SetBounds((Screen.Width - Width) div 2,
    (Screen.Height div 2 - Height) div 2 + (FNivel * Height), Width, Height);
end;

{ TProgressoProxyInterfaced }

constructor TProgressoProxyInterfaced.Create;
begin
  inherited;
  FProgresso := TProgresso.Create(nil);
end;

destructor TProgressoProxyInterfaced.Destroy;
begin
  FProgresso.Free;
  inherited;
end;

procedure TProgressoProxyInterfaced.Esconde;
begin
  FProgresso.Esconde;
end;

function TProgressoProxyInterfaced.GetPosition: Integer;
begin
  Result := FProgresso.GetPosition;
end;

function TProgressoProxyInterfaced.MaisUm(const Mens: string): Boolean;
begin
  Result := FProgresso.MaisUm(Mens);
end;

procedure TProgressoProxyInterfaced.Mostrar(const Titulo: string; ANivel: Integer; AMostraCancelar: Boolean);
begin
  FProgresso.Mostrar(Titulo, ANivel, AMostraCancelar);
end;

function TProgressoProxyInterfaced.Posicao(const Mens: string; p, total: Integer): Boolean;
begin
  Result := FProgresso.Posicao(Mens, p, total);
end;

initialization

  TProgressoProxyInterfaced.SelfRegister(IProgresso);

end.
