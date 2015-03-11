var strInterfacesSistema = leArquivo("Configuracao\\InterfacesSistema.json");
var configuracao = strInterfacesSistema.parseJSON();

var produtos = configuracao.Produtos;
var produto = null;

for (var laco = 0; laco < produtos.length; laco++) {
  produto = produtos[laco];
  saida = "";
  var debug = compila(leArquivo("Templates\\InterfacesSistema.html_template"));
  if (GravaArquivoDebug)
    gravaArquivo("Debug\\interfaces" + produto + "_html.js", debug);
  eval(debug);
  gravaArquivo("..\\Instalacao\\interfaces" + produto + ".html", saida);
}