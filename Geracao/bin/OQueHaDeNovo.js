var strOQueHaDeNovo = leArquivo("Configuracao\\OQueHaDeNovo.json");
var configuracao = strOQueHaDeNovo.parseJSON();

var produtos = configuracao.Produtos;
var produto = null;
var videointerno;

for (var laco = 0; laco < produtos.length; laco++) {
  produto = produtos[laco];

  saida = "";
  var debug = compila(leArquivo("Templates\\OQueHaDeNovo.html_template"));
  if (GravaArquivoDebug)
    gravaArquivo("Debug\\leiame" + produto + "_html.js", debug);
  videointerno = false;
  eval(debug);
  gravaArquivo("..\\Instalacao\\leiame" + produto + ".html", saida);

  saida = "";
  var debug = compila(leArquivo("Templates\\OQueHaDeNovo.html_template"));
  if (GravaArquivoDebug)
    gravaArquivo("Debug\\leiame" + produto + "_html.js", debug);
  videointerno = true;
  eval(debug);
  gravaArquivo("..\\Instalacao\\leiame" + produto + "Interno.html", saida);
}