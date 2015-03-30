unit MVC_Controlador_ComSessao;

interface

uses
  SysUtils, ServiceLocator, MVC_Interfaces, MVC_Controlador;

type
  TControladorComSessao = class(TControlador)
  private
    FSessao: ISessao;
  protected
    procedure AntesDeDespachar; override;
    procedure DepoisDeDespachar; override;
    procedure SetSessao(const Value: ISessao); virtual;
    procedure NovaSessao(const ASessaoIdStr: string);
    property Sessao: ISessao read FSessao write SetSessao;
  end;

const
  AlxSessionId = 'ALXSESSIONID';

implementation

{ TControladorComSessao }

procedure TControladorComSessao.AntesDeDespachar;
var
  LSessaoIdStr: string;
  LSessaoId: TGUID;
begin
  inherited;
  LSessaoIdStr := Request.CookieFields.Values[AlxSessionId];
  if LSessaoIdStr = '' then
    Assert(CreateGUID(LSessaoId) = 0)
  else
    LSessaoId := StringToGUID(LSessaoIdStr);
  FSessao := (SL as ISessoes).RecuperaSessao(LSessaoId, True);
end;

procedure TControladorComSessao.DepoisDeDespachar;
begin
  inherited;
  (SL as ISessoes).ArmazenaSessao(FSessao);
  with Response.Cookies.Add do
  begin
    Name := AlxSessionId;
    Value := GUIDToString(FSessao.GUID);
    Path := '/';
  end;
end;

procedure TControladorComSessao.NovaSessao(const ASessaoIdStr: string);
var
  LSessao: ISessao;
begin
  LSessao := (SL as ISessoes).RecuperaSessao(StringToGUID(ASessaoIdStr), False);
  if LSessao = nil then
    NaoFoiAutorizado('Sessão informada inválida')
  else
    Sessao := LSessao;
end;

procedure TControladorComSessao.SetSessao(const Value: ISessao);
begin
  FSessao := Value;
end;

end.
