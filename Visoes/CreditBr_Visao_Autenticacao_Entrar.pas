{
  ***************************************************
  * Este código é gerado automaticamente, não edite *
  ***************************************************

  Template: VisaoHTML.pas_template
  Descrição: Cria uma visão (geração de HTML) a partir do arquivo CreditBr_Visao_Autenticacao_Entrar.html
}

unit CreditBr_Visao_Autenticacao_Entrar;

interface

uses
  SysUtils, Classes, Variants, ServiceLocator, HTTPApp, MVC_Interfaces, MVC_Visao_HTML, 
  MVC_Visao_HTML_ActiveRecord, uAROBUsuario, uOBUsuarioModel;

type
  TVisaoAutenticacaoEntrar = class(TVisaoHTMLActiveRecord)
  private
    FModelo: IOBUsuarioModel;
  protected
    function GetTituloPagina: string; override;
    procedure HTML; override;
    function GetModeloInterface: IInterface; override;
    procedure SetModeloInterface(const AValue: IInterface); override;
    property Modelo: IOBUsuarioModel read FModelo;
  end;

implementation

{ TVisaoAutenticacaoEntrar }

function TVisaoAutenticacaoEntrar.GetTituloPagina: string;
begin
  Result := 'Autenticação';
end;

procedure TVisaoAutenticacaoEntrar.HTML;
begin  
	Response.SetCustomHeader('X-UA-Compatible', 'IE=edge,chrome=1');
; WriteLn('<!DOCTYPE html>');
WriteLn('<html lang="pt-BR">');
WriteLn('	<head>');
WriteLn('		<meta charset="Windows-1252">');
WriteLn('		<meta name="viewport" content="width=device-width, initial-scale=1">');
WriteLn('');
WriteLn('		<meta name="description" content="Sistema de apoio da Credit Brasil">');
WriteLn('		<meta name="author" content="Credit Brasil">');
Write  ('		<link rel="apple-touch-icon" sizes="76x76" href="'); WriteVl(NovaRota.Nome('Padrao').Controlador('Tema').Acao('icones').Outros(['apple-icon-76x76.png'])); WriteLn('">');
Write  ('		<link rel="apple-touch-icon" sizes="72x72" href="'); WriteVl(NovaRota.Nome('Padrao').Controlador('Tema').Acao('icones').Outros(['apple-icon-72x72.png'])); WriteLn('">');
Write  ('		<link rel="apple-touch-icon" sizes="60x60" href="'); WriteVl(NovaRota.Nome('Padrao').Controlador('Tema').Acao('icones').Outros(['apple-icon-60x60.png'])); WriteLn('">');
Write  ('		<link rel="apple-touch-icon" sizes="57x57" href="'); WriteVl(NovaRota.Nome('Padrao').Controlador('Tema').Acao('icones').Outros(['apple-icon-57x57.png'])); WriteLn('">');
Write  ('		<link rel="icon" type="image/png" sizes="72x72" href="'); WriteVl(NovaRota.Nome('Padrao').Controlador('Tema').Acao('icones').Outros(['android-icon-72x72.png'])); WriteLn('">');
Write  ('		<link rel="icon" type="image/png" sizes="48x48" href="'); WriteVl(NovaRota.Nome('Padrao').Controlador('Tema').Acao('icones').Outros(['android-icon-48x48.png'])); WriteLn('">');
Write  ('		<link rel="icon" type="image/png" sizes="36x36" href="'); WriteVl(NovaRota.Nome('Padrao').Controlador('Tema').Acao('icones').Outros(['android-icon-36x36.png'])); WriteLn('">');
Write  ('		<link rel="icon" type="image/png" sizes="32x32" href="'); WriteVl(NovaRota.Nome('Padrao').Controlador('Tema').Acao('icones').Outros(['favicon-32x32.png'])); WriteLn('">');
Write  ('		<link rel="icon" type="image/png" sizes="96x96" href="'); WriteVl(NovaRota.Nome('Padrao').Controlador('Tema').Acao('icones').Outros(['favicon-96x96.png'])); WriteLn('">');
Write  ('		<link rel="icon" type="image/png" sizes="16x16" href="'); WriteVl(NovaRota.Nome('Padrao').Controlador('Tema').Acao('icones').Outros(['favicon-16x16.png'])); WriteLn('">');
Write  ('		<link rel="icon" href="'); WriteVl(NovaRota.Nome('Padrao').Controlador('Tema').Acao('icones').Outros(['favicon.ico'])); WriteLn('">');
WriteLn('		<title>Autenticação - Credit Brasil</title>');
WriteLn('');
Write  ('		'); WriteVl(TemaCSS('bootstrap')); WriteLn('');
Write  ('		'); WriteVl(TemaCSS('metisMenu')); WriteLn('');
Write  ('		'); WriteVl(TemaCSS('sb-admin-2')); WriteLn('');
Write  ('		'); WriteVl(TemaCSS('font-awesome')); WriteLn('');
Write  ('		'); WriteVl(TemaCSS('CreditBr')); WriteLn('');
WriteLn('');
WriteLn('		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->');
WriteLn('		<!--[if lt IE 9]>');
WriteLn('			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>');
WriteLn('			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>');
WriteLn('		<![endif]-->');
WriteLn('	</head>');
WriteLn('');
WriteLn('	<body>');
WriteLn('		<div id="bg-overlay" class="bg-img"></div>');
WriteLn('');
WriteLn('		<div class="container">');
WriteLn('			<div class="row">');
WriteLn('				<div class="col-md-4 col-md-offset-4">');
WriteLn('					<div class="login-panel panel panel-default">');
WriteLn('						<div class="panel-heading">');
Write  ('							<h3 class="panel-title"><img src="'); WriteVl(NovaRota.Nome('Padrao').Controlador('Tema').Acao('imagens').Outros(['logo.png'])); WriteLn('"></h3>');
WriteLn('						</div>');
WriteLn('						<div class="panel-body">');
Write  ('							'); WriteVl(FormularioInicio.SetAtributo('role', 'form')); WriteLn('');
Write  ('								'); WriteVl(AvisoValido(Parametros['Mensagem'])); WriteLn('');
Write  ('								'); WriteVl(AvisoPerigo(MensagemPara(Campo_OBUsuario_UsuLogin))); WriteLn('');
WriteLn('								<fieldset>');
WriteLn('									<div class="form-group">');
Write  ('										<input class="form-control" placeholder="Usuário" name="Codigo" id="Codigo" type="text" value="'); WriteVl(Parametros['Codigo'] ); WriteLn('" required autofocus>');
WriteLn('									</div>');
WriteLn('									<div class="form-group">');
WriteLn('										<input class="form-control" placeholder="Senha" name="Senha" id="Senha" type="password" required>');
WriteLn('									</div>');
WriteLn('									<!--div class="checkbox">');
WriteLn('										<label>');
WriteLn('											<input name="remember" type="checkbox" value="Remember Me">Remember Me');
WriteLn('										</label>');
WriteLn('									</div-->');
WriteLn('									<button class="btn btn-lg btn-success btn-block" type="submit">Entrar</button>');
WriteLn('								</fieldset>');
Write  ('								'); WriteVl(Escondido('r', Parametros['r'])); WriteLn('');
Write  ('							'); WriteVl(FormularioFim); WriteLn('');
WriteLn('						</div>');
WriteLn('					</div>');
WriteLn('				</div>');
WriteLn('			</div>');
WriteLn('		</div>');
WriteLn('');
Write  ('		'); WriteVl(RecursoJS('jquery')); WriteLn('');
Write  ('		'); WriteVl(RecursoJS('bootstrap')); WriteLn('');
Write  ('		'); WriteVl(RecursoJS('metisMenu')); WriteLn('');
Write  ('		'); WriteVl(RecursoJS('sb-admin-2')); WriteLn('');
Write  ('		'); WriteVl(RecursoJS('ie10-viewport-bug-workaround')); WriteLn('');
WriteLn('	</body>');
Write  ('</html>'); 
end;

function TVisaoAutenticacaoEntrar.GetModeloInterface: IInterface;
begin
  Result := FModelo;
end;

procedure TVisaoAutenticacaoEntrar.SetModeloInterface(const AValue: IInterface);
begin
  FModelo := AValue as IOBUsuarioModel;
  inherited;
end;

initialization

  TVisaoAutenticacaoEntrar.RegistreSe;

end.