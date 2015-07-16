{
  ***************************************************
  * Este c�digo � gerado automaticamente, n�o edite *
  ***************************************************

  Template: VisaoHTML.pas_template
  Descri��o: Cria uma vis�o (gera��o de HTML) a partir do arquivo CreditBr_Visao_Erro_Padrao.html
}

unit CreditBr_Visao_Erro_Padrao;

interface

uses
  SysUtils, Classes, Variants, ServiceLocator, HTTPApp, MVC_Interfaces, MVC_Visao_HTML, 
  MVC_Visao_HTML_ActiveRecord;

type
  TVisaoErroPadrao = class(TVisaoHTMLActiveRecord)
  private
    FModelo: TErroModelo;
  protected
    function GetTituloPagina: string; override;
    procedure HTML; override;
    function GetModeloObject: TObject; override;
    procedure SetModeloObject(const AValue: TObject); override;
    property Modelo: TErroModelo read FModelo;
  public
    destructor Destroy; override;
  end;

implementation

{ TVisaoErroPadrao }

destructor TVisaoErroPadrao.Destroy;
begin
  FModelo.Free; FModelo := nil;
  inherited;
end;

function TVisaoErroPadrao.GetTituloPagina: string;
begin
  Result := IntToStr(Modelo.Codigo) + ' - ' + Modelo.Descricao;
end;

procedure TVisaoErroPadrao.HTML;
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
Write  ('		<title>'); WriteVl(GetTitulo); WriteLn('</title>');
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
WriteLn('						<div class="error-template">');
Write  ('							<h1>'); WriteVl(Modelo.Codigo); Write  (' <small>'); WriteVl(Modelo.Descricao); WriteLn('</small></h1>');
WriteLn('							<div class="error-details">');
Write  ('									'); WriteVl(Modelo.Mensagem); WriteLn('');
WriteLn('							</div>');
WriteLn('							<div class="error-actions">');
Write  ('								'); WriteVl(Botao(tbPrimary, NovaRota.Nome('Padrao'), 'Ir para o Principal', glyphicon_home).AddClasse('btn-success')); WriteLn('');
WriteLn('							</div>');
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

function TVisaoErroPadrao.GetModeloObject: TObject;
begin
  Result := FModelo;
end;

procedure TVisaoErroPadrao.SetModeloObject(const AValue: TObject);
begin
  FModelo := AValue as TErroModelo;
  inherited;
end;

initialization

  TVisaoErroPadrao.RegistreSe;

end.