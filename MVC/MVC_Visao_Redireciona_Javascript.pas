unit MVC_Visao_Redireciona_Javascript;

interface

uses
  SysUtils, Classes, MVC_Visao_HTML;

type
  TVisaoRedirecionaJavascript = class(TVisaoHTML)
  protected
    procedure HTML; override;
  end;

implementation

{ TVisaoRedirecionaJavascript }

procedure TVisaoRedirecionaJavascript.HTML;
begin
  WriteLn('<!DOCTYPE html>');
  WriteLn('<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="pt-BR">');
  WriteLn('<head>');
  WriteLn('	<meta charset="Windows-1252">');
  WriteLn('	<title>Redirecionamento</title>');
  WriteLn('	<meta name=''robots'' content=''noindex,nofollow'' />');
  WriteLn('	<script type="text/javascript">');
  WriteLn('	<!--');
  WriteLn('	window.location = "' + CodificaParametro(ModeloValor) + '"');
  WriteLn('	//-->');
  WriteLn('	</script>');
  WriteLn('</head>');
  WriteLn('<body>');
  WriteLn('</body>');
  Write  ('</html>');
end;

initialization

  TVisaoRedirecionaJavascript.RegistreSe;

end.
