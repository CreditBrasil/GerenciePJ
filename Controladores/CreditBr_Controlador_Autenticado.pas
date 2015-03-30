unit CreditBr_Controlador_Autenticado;

interface

uses
  HTTPApp, MVC_Interfaces, MVC_Controlador_Conectado, CreditBr_Interfaces;

type
  TControladorAutenticado = class(TControladorConectado)
  private
    procedure AtribuicoesSessao;
    function GetSessao: ISessao_CreditBr;
  protected
    procedure AntesDeDespachar; override;
    procedure SetSessao(const Value: ISessao); override;
    property Sessao: ISessao_CreditBr read GetSessao;
  end;

implementation

{ TControladorAutenticado }

procedure TControladorAutenticado.AntesDeDespachar;

  function QueryString: string;
  begin
    if Request.Query <> '' then
      Result := '?' + Request.Query
    else
      Result := '';
  end;

  function PathInfo: string;
  begin
    if Request.InternalPathInfo = '/' then
      Result := ''
    else
      Result := Request.InternalPathInfo;
  end;

var
  LRedirecionarPara: string;
begin
  inherited;
  if JaTemVisao then
    Exit;
  if not Sessao.Autenticado then
  begin
    (*if Sessao.ClienteAutenticado then
    begin
      if (Request.InternalPathInfo = '/') or (Request.InternalPathInfo = '') then
        Redireciona(NovaRota.Nome('Cliente'))
      else
        NaoFoiAutorizado;
    end
    else*)
    begin
      LRedirecionarPara := Request.InternalScriptName + PathInfo + QueryString;
      Redireciona(
        NovaRota
          .Nome('Padrao')
          .Controlador('Autenticacao')
          .Acao('Entrar')
          .Query('r', LRedirecionarPara));
    end;
  end
  (*else if Sessao.SomentePainelDeGerente then
  begin
    if (Request.InternalPathInfo = '/') or (Request.InternalPathInfo = '') then
      Redireciona(NovaRota.Nome('Gerente').Outros([Sessao.CodigoGerente.Codigo]))
    else
      NaoFoiAutorizado;
  end*)
  else
    AtribuicoesSessao;
end;

procedure TControladorAutenticado.AtribuicoesSessao;
{var
  laco: TPapel;}
begin
  Parametros['Sessao.UsuarioCodigo'] := Sessao.UsuarioCodigo;
  Parametros['Sessao.UsuarioNome'] := Sessao.UsuarioNome;
 (* if Sessao.CodigoGerente.TemCodigo then
    Parametros['Sessao.CodigoGerente'] := Sessao.CodigoGerente.Codigo;
  for laco := Low(TPapel) to High(TPapel) do
    Parametros['Papel.' + NomePapel[laco]] := laco in Sessao.Papeis;*)
  Connection.UserCode := Sessao.UsuarioCodigo;
  Connection.UserName := Sessao.UsuarioNome;
end;

function TControladorAutenticado.GetSessao: ISessao_CreditBr;
begin
  Result := (inherited Sessao) as ISessao_CreditBr;
end;

procedure TControladorAutenticado.SetSessao(const Value: ISessao);
begin
  inherited;
  if Sessao.Autenticado then
    AtribuicoesSessao
  else
    NaoFoiAutorizado;
end;

end.
