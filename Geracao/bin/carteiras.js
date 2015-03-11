var Tabela = null;
var contrato = leArquivo("Configuracao\\contrato.json").parseJSON();
var contratos = leArquivo("Configuracao\\contratos.json").parseJSON();
var contaCorrente = leArquivo("Configuracao\\ContaCorrente.json").parseJSON();
var tarifaBordero = leArquivo("Configuracao\\TarifaBordero.json").parseJSON();
var contasCorrente = leArquivo("Configuracao\\ContasCorrente.json").parseJSON();
var carteira = leArquivo("Configuracao\\carteira.json").parseJSON();
var carteiras = leArquivo("Configuracao\\carteiras.json").parseJSON();

for (var i = 0; i < contratos.length; i++) {
  Tabela = contrato;
  Tabela.Nome = contratos[i].Nome;
  Tabela.GUID = contratos[i].GUID;
  Tabela.Descricao = contratos[i].Descricao;
  gravaArquivo("Configuracao\\tabela_" + Tabela.Nome + "_gerado_automatico.json", Tabela.toJSONString());
}

for (var i = 0; i < contasCorrente.length; i++) {
  Tabela = contaCorrente;
  Tabela.Nome = contasCorrente[i].Nome;
  Tabela.GUID = contasCorrente[i].GUID;
  Tabela.Descricao = contasCorrente[i].Descricao;
  gravaArquivo("Configuracao\\tabela_" + Tabela.Nome + "_gerado_automatico.json", Tabela.toJSONString());
  Tabela = tarifaBordero;
  Tabela.Nome = contasCorrente[i].TarifaBordero.Nome;  
  Tabela.GUID = contasCorrente[i].TarifaBordero.GUID;
  Tabela.Descricao = contasCorrente[i].TarifaBordero.Descricao;
  gravaArquivo("Configuracao\\tabela_" + Tabela.Nome + "_gerado_automatico.json", Tabela.toJSONString());
}

for (var i = 0; i < carteiras.length; i++) {
  Tabela = carteira;
  Tabela.Nome = carteiras[i].Nome;
  Tabela.GUID = carteiras[i].GUID;
  Tabela.Descricao = carteiras[i].Descricao;
  gravaArquivo("Configuracao\\tabela_" + Tabela.Nome + "_gerado_automatico.json", Tabela.toJSONString());
}

saida = "";
var debug = compila(leArquivo("Templates\\uCarteiraModelInc.pas_template"));
if (GravaArquivoDebug) 
  gravaArquivo("Debug\\uCarteiraModelInc_pas.js", debug);
eval(debug);
gravaArquivo("..\\uCarteiraModelInc.pas", saida);

saida = "";
var debug = compila(leArquivo("Templates\\VisaoCliente.sql_template"));
if (GravaArquivoDebug) 
  gravaArquivo("Debug\\VisaoCliente_sql.js", debug);
eval(debug);
gravaArquivo("..\\SQLScripts\\Auxiliares\\VisaoCliente.sql", saida);