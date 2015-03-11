var auxDebug = "";
if (GravaArquivoDebug) {
  auxDebug = 
    "function Write(i) {}\r\n" + 
    "function WriteVl(i) {}\r\n" + 
    "function WriteLn(i) {}\r\n";
}

var arqs = arquivos("Configuracao", "tabela_", "json");
var Tabela = null;
var tabelas = [];
var Relacionamentos = [];

function verificaSeGUIDJaFoiUsado(guid) {
  for(var iTab2 = 0; iTab2 < tabelas.length; iTab2++) {
    if (tabelas[iTab2].GUID == guid) 
      return true;
  }
  return false;
}

function retornaCampoTabela(ACampo, ATabela) {
  for(var i = 0; i < ATabela.Campos.length; i++) {
    if(ATabela.Campos[i].Nome.toUpperCase == ACampo.toUpperCase) {
      return ATabela.Campos[i];
    }
  }
}

function retiraDoFim(entrada, palavra) {
  var p = entrada.indexOf(palavra);
  if (p == -1)
    return entrada
  else
    return entrada.substring(0, p);
}

function retiraAdicional(entrada) {
  return retiraDoFim(retiraDoFim(entrada, ".Value"), "Cached");
}

function verificaRelacionamentos(ATabela) {
  if (ATabela.Relacionamentos) {
    for (var i = 0; i < ATabela.Relacionamentos.length; i++) {
      var LCamposOrigem = ATabela.Relacionamentos[i].CamposOrigem;
      if (ATabela.Relacionamentos[i].Model.substring(0, 2) == 'AR')
        var LTabelaDestino = ATabela.Relacionamentos[i].Model.slice(2);
      else
        var LTabelaDestino = ATabela.Relacionamentos[i].Model.substring(0, ATabela.Relacionamentos[i].Model.length - 5);
      for (var j = 0; j < LCamposOrigem.length; j++) {
        var LNomeCampo = retiraAdicional(LCamposOrigem[j]);
        var LCampo = retornaCampoTabela(LNomeCampo, ATabela);
        var LNomeCampoDestino = retiraAdicional(ATabela.Relacionamentos[i].CamposDestino[j]);
        Relacionamentos.push({
          TabelaOrigem: ATabela.Nome,
          CampoOrigem: LNomeCampo,
          Tipo: ATabela.Relacionamentos[i].Tipo,
          TabelaDestino: LTabelaDestino, 
          CampoDestino: LNomeCampoDestino,
          Nome: (ATabela.Relacionamentos[i].Nome?ATabela.Relacionamentos[i].Nome:""),
          Saida: true
        });
        Relacionamentos.push({
          TabelaOrigem: LTabelaDestino,
          CampoOrigem: LNomeCampoDestino,
          Tipo: (ATabela.Relacionamentos[i].Tipo=="N:1"?"1:N":ATabela.Relacionamentos[i].Tipo),
          TabelaDestino: ATabela.Nome, 
          CampoDestino: LNomeCampo,
          Nome: (ATabela.Relacionamentos[i].Nome?ATabela.Relacionamentos[i].Nome:""),
          Saida: false
        });
      }
    }
  }
}

var debugActiveRecordPas = compila(leArquivo("Templates\\ActiveRecord.pas_template"));
var debugActiveRecordSql = compila(leArquivo("Templates\\ActiveRecord.sql_template"));

for(var iArq = 0; iArq < arqs.length; iArq++) {
  var strTabela = leArquivo("Configuracao\\" + arqs[iArq]);
  Tabela = strTabela.parseJSON();
  if (arqs[iArq].substring(7, Tabela.Nome.length + 7) != Tabela.Nome)
    WScript.Echo("Nome do arquivo '" + arqs[iArq] + "' e o nome da tabela '" + Tabela.Nome + "'.");
  Tabela = dominio2Tipo(Tabela);
  saida = "";
  if (GravaArquivoDebug)
    gravaArquivo("Debug\\uAR" + Tabela.Nome + "_pas.js", auxDebug + "Tabela = " + Tabela.toJSONString() + ";\r\n" + debugActiveRecordPas);
  eval(debugActiveRecordPas);
  gravaArquivo("..\\Model\\uAR" + Tabela.Nome + ".pas", saida);
  if (GravaArquivoDebug)
    gravaArquivo("Debug\\tabela_" + Tabela.Nome + "_sql.js", debugActiveRecordSql);
  saida = "";
  eval(debugActiveRecordSql);
  gravaArquivo("..\\SQLScripts\\Auxiliares\\tabela_" + Tabela.Nome + ".sql", saida);
  if (verificaSeGUIDJaFoiUsado(Tabela.GUID)) 
    WScript.Echo("A tabela " + Tabela.Nome + " tem GUID repetido");
  verificaRelacionamentos(Tabela);
  tabelas.push(Tabela);
}
tabelas.sort(function (tabela1, tabela2) {
  if(tabela1.Nome.toUpperCase == tabela2.Nome.toUpperCase)
    return 0;
  if(tabela1.Nome.toUpperCase < tabela2.Nome.toUpperCase)
    return -1;
  else
    return 1;
});

var debugDicionarioDeDados = compila(leArquivo("Templates\\DicionarioDeDados.html_template"));
if (GravaArquivoDebug)
  gravaArquivo("Debug\\tabela_" + Tabela.Nome + "_html.js", debugDicionarioDeDados);

for(var iTab = 0; iTab < tabelas.length; iTab++) {
  Tabela = tabelas[iTab];
  saida = "";
  eval(debugDicionarioDeDados);
  gravaArquivo("..\\DicionarioDeDados\\tabela_" + Tabela.Nome + ".html", saida);
}
saida = "";
var debug = compila(leArquivo("Templates\\DicionarioDeDadosIndex.html_template"));
if (GravaArquivoDebug)
  gravaArquivo("Debug\\index_html.js", debug);
eval(debug);
gravaArquivo("..\\DicionarioDeDados\\index.html", saida);