//EnumTypes
var typeString = 0;
var typeListaRestrita = 1;
var typeNaoSim = 2;
var typePasta = 3;

var PastaConfiguracao = "Configuracao\\";

function getArquivosPickList(pasta, iniciadoCom, extensao) {
  var arqs = arquivos(pasta, iniciadoCom, extensao);
  var tabelas = [];
  for(var iArq = 0; iArq < arqs.length; iArq++)
    tabelas.push("\"" + arqs[iArq] + "\"");
  return tabelas.join(",");
}

function getTabela(arquivo) {
  var strTabela = leArquivo(arquivo);
  var tabela = strTabela.parseJSON();
  return dominio2Tipo(tabela);
}

function getComponent(campo) {
  if (campo.ReadOnly)
    return "TEdit";
  else if (campo.Dominio == "NS" || campo.Dominio == "B01")
    return "TCheckBox";
  else if (campo.Tipo == "datetime")
    return "TDateTimePicker";
  else if (campo.Tipo == "float"  && (!campo.Nullable || forcaRX == true)) {
    if (campo.Dominio == "Dinheiro")
      return "TCurrencyEdit";
    else
      return "TRxCalcEdit";
  } else
    return "TEdit";
}

var Tabela = null;
var nomeForm = null;
var forcaRX = null;
var pastaOutput = null,
  pastaOutputDelphi7 = null;

function geraSimpleForm(arquivo) {
  var Tabela = getTabela(arquivo);
  var propSimpleForm = WScript.CreateObject("Helper.Properties"); 
  propSimpleForm.NewProperty("NomeForm", Tabela.Nome + "SimpleForm", typeString);
  propSimpleForm.NewProperty("ForcaRX", false, typeNaoSim);
  if (propSimpleForm.Show("Geração de SimpleForm")) {
    nomeForm = propSimpleForm("NomeForm");
	forcaRX = propSimpleForm("ForcaRX");
    saida = "";
    var debug = compila(leArquivo("Templates\\SimpleForm.pas_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\w" + nomeForm + "_pas.js", debug);
    eval(debug);
    gravaArquivo(pastaOutput + "w" + nomeForm + ".pas", saida);
    saida = "";
    var debug = compila(leArquivo("Templates\\SimpleForm.dfm_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\w" + nomeForm + "_dfm.js", debug);
    eval(debug);
    gravaArquivo(pastaOutput + "w" + nomeForm + ".dfm", saida);
  }
}

var nomeModel = null;

function geraModel(arquivo) {
  var Tabela = getTabela(arquivo);
  var propModel = WScript.CreateObject("Helper.Properties"); 
  propModel.NewProperty("NomeModel", Tabela.Nome + "Model", typeString);
  if (propModel.Show("Geração de Model")) {
    nomeModel = propModel("NomeModel");
    saida = "";
    var debug = compila(leArquivo("Templates\\Model.pas_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\u" + nomeModel + "_pas.js", debug);
    eval(debug);
    gravaArquivo(pastaOutput + "\\Model\\u" + nomeModel + ".pas", saida);
  }
}

var nomeVC = null;
var isCollection = null;
var nomeModelInt = null;

function geraVCVazio(arquivo) {
  var Tabela = getTabela(arquivo);
  var propModel = WScript.CreateObject("Helper.Properties"); 
  propModel.NewProperty("NomeModel", Tabela.Nome + "Model", typeString);
  propModel.NewProperty("NomeVC", Tabela.Nome, typeString);
  propModel.NewProperty("NomeForm", Tabela.Nome + "VCForm", typeString);
  propModel.NewProperty("IsCollection", true, typeNaoSim);
  if (propModel.Show("Geração de View/Controller Vazio")) {
    nomeModel = propModel("NomeModel");
    nomeVC = propModel("NomeVC");
    nomeForm = propModel("NomeForm");
    isCollection = propModel("IsCollection");
    nomeModelInt = nomeModel;
    if (isCollection == true) 
      nomeModelInt = "Collection" + nomeModelInt;
    saida = "";
    var debug = compila(leArquivo("Templates\\VCVazioInterface.pas_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\u" + nomeVC + "VCInterface_pas.js", debug);
    eval(debug);
    gravaArquivo(pastaOutput + "u" + nomeVC + "VCInterface.pas", saida);
    saida = "";
    var debug = compila(leArquivo("Templates\\VCVazioClass.pas_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\u" + nomeVC + "VCClass.js", debug);
    eval(debug);
    gravaArquivo(pastaOutput + "u" + nomeVC + "VCClass.pas", saida);
  }
}

var nomeVCSimple = null;
var nomeFormSimple = null;
var usaDrawGrid = null;

function geraVCCollection(arquivo) {
  var Tabela = getTabela(arquivo);
  var propModel = WScript.CreateObject("Helper.Properties"); 
  propModel.NewProperty("NomeModel", Tabela.Nome + "Model", typeString);
  propModel.NewProperty("NomeVC", "Collection" + Tabela.Nome, typeString);
  propModel.NewProperty("NomeVCSimple", Tabela.Nome, typeString);
  propModel.NewProperty("NomeForm", "Collection" + Tabela.Nome + "VCForm", typeString);
  propModel.NewProperty("NomeFormSimple", Tabela.Nome + "SimpleForm", typeString);
  propModel.NewProperty("UsaDrawGrid", false, typeNaoSim); 
  if (propModel.Show("Geração de View/Controller para Collection")) {
    nomeModel = propModel("NomeModel");
    nomeVC = propModel("NomeVC");
    nomeForm = propModel("NomeForm");
    nomeModelInt = "Collection" + nomeModel;
	nomeVCSimple = propModel("NomeVCSimple");
    nomeFormSimple = propModel("NomeFormSimple");
	usaDrawGrid = propModel("UsaDrawGrid");
    saida = "";
    var debug = compila(leArquivo("Templates\\VCCollectionInterface.pas_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\u" + nomeVC + "VCInterface_pas.js", debug);
    eval(debug);
    gravaArquivo(pastaOutput + "u" + nomeVC + "VCInterface.pas", saida);
    saida = "";
    var debug = compila(leArquivo("Templates\\VCCollectionClass.pas_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\u" + nomeVC + "VCClass.js", debug);
    eval(debug);
    gravaArquivo(pastaOutput + "u" + nomeVC + "VCClass.pas", saida);
    saida = "";
    var debug = compila(leArquivo("Templates\\VCCollectionForm.dfm_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\w" + nomeForm + "_dfm.js", debug);
    eval(debug);
    gravaArquivo(pastaOutput + "w" + nomeForm + ".dfm", saida);
    saida = "";
    var debug = compila(leArquivo("Templates\\VCCollectionForm.pas_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\w" + nomeForm + "_pas.js", debug);
    eval(debug);
    gravaArquivo(pastaOutput + "w" + nomeForm + ".pas", saida);
  }
}

function geraFrameCollection(arquivo) {
  var Tabela = getTabela(arquivo);
  var propModel = WScript.CreateObject("Helper.Properties"); 
  propModel.NewProperty("NomeModel", Tabela.Nome + "Model", typeString);
  propModel.NewProperty("NomeVC", "CollectionFrame" + Tabela.Nome, typeString);
  propModel.NewProperty("NomeVCSimple", Tabela.Nome, typeString);
  propModel.NewProperty("NomeFormSimple", Tabela.Nome + "SimpleForm", typeString);
  if (propModel.Show("Geração de Controller/Frame para Collection")) {
    nomeModel = propModel("NomeModel");
    nomeVC = propModel("NomeVC");
    nomeModelInt = "Collection" + nomeModel;
	nomeVCSimple = propModel("NomeVCSimple");
    nomeFormSimple = propModel("NomeFormSimple");
    saida = "";
    var debug = compila(leArquivo("Templates\\VCCollectionFrameInterface.pas_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\u" + nomeVC + "Interface_pas.js", debug);
    eval(debug);
    gravaArquivo(pastaOutput + "u" + nomeVC + "Interface.pas", saida);
    saida = "";
    var debug = compila(leArquivo("Templates\\VCCollectionFrame.pas_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\u" + nomeVC + "Class_pas.js", debug);
    eval(debug);
    gravaArquivo(pastaOutput + "u" + nomeVC + "Class.pas", saida);
    saida = "";
    var debug = compila(leArquivo("Templates\\VCCollectionFrame.dfm_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\u" + nomeVC + "Class_dfm.js", debug);
    eval(debug);
    gravaArquivo(pastaOutput + "u" + nomeVC + "Class.dfm", saida);
  }
}

var 
  nomeControlador = null,
  nomeProjeto = null;
  crud = false;

function geraWEBControlador(arquivo) {
  var Tabela = getTabela(arquivo);
  var propModel = WScript.CreateObject("Helper.Properties");
  propModel.NewProperty("NomeProjeto", "WBA", typeString);
  propModel.NewProperty("NomeModel", Tabela.Nome + "Model", typeString);
  propModel.NewProperty("NomeControlador", Tabela.Nome, typeString);
  propModel.NewProperty("CRUD", false, typeNaoSim);
  if (propModel.Show("Geração do Web Controlador")) {
    nomeModel = propModel("NomeModel");
    nomeProjeto = propModel("NomeProjeto");
    nomeControlador = propModel("NomeControlador");
    crud = propModel("CRUD");
    saida = "";
    var debug = compila(leArquivo("Templates\\Controlador.pas_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\" + nomeProjeto + "_Controlador_" + nomeControlador + "_pas.js", debug);
    eval(debug);
    gravaArquivo(pastaOutputDelphi7 + nomeProjeto + "_Controlador_" + nomeControlador + ".pas", saida);
  }
}

var
  nomeVisao = null,
  usaIterator = null;
  tipoVisao = null;

function geraWEBPagina(arquivo) {
  var Tabela = getTabela(arquivo);
  var propModel = WScript.CreateObject("Helper.Properties");
  propModel.NewProperty("NomeProjeto", "WBA", typeString);
  propModel.NewProperty("NomeModel", Tabela.Nome + "Model", typeString);
  propModel.NewProperty("NomeControlador", Tabela.Nome, typeString);
  propModel.NewProperty("NomeVisao", "Indice", typeString);
  propModel.NewProperty("TipoVisao", "Selecao", typeListaRestrita).PickList = '"Selecao", "Ver", "Tabela", "Criar", "Editar", "Apagar"';
  if (propModel.Show("Geração da Web Página")) {
    nomeModel = propModel("NomeModel");
    nomeProjeto = propModel("NomeProjeto");
    nomeControlador = propModel("NomeControlador");
    nomeVisao = propModel("NomeVisao");
    tipoVisao = propModel("TipoVisao");
    saida = "";
    var debug = compila(leArquivo("Templates\\Visao.html_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\" + nomeProjeto + "_" + nomeControlador + "_" + nomeVisao + "_html.js", debug);
    eval(debug);
    gravaArquivo(pastaOutputDelphi7 + "HTML\\" + nomeProjeto + "_Visao_" + nomeControlador + "_" + nomeVisao + ".html", saida);
  }
}

function geraWEBParcial(arquivo) {
  var Tabela = getTabela(arquivo);
  var propModel = WScript.CreateObject("Helper.Properties");
  propModel.NewProperty("NomeProjeto", "iWBA", typeString);
  propModel.NewProperty("NomeModel", Tabela.Nome + "Model", typeString);
  propModel.NewProperty("NomeControlador", Tabela.Nome, typeString);
  propModel.NewProperty("NomeVisao", "Parcial", typeString);
  if (propModel.Show("Geração da Web Parcial")) {
    nomeModel = propModel("NomeModel");
    nomeProjeto = propModel("NomeProjeto");
    nomeControlador = propModel("NomeControlador");
    nomeVisao = propModel("NomeVisao");
    saida = "";
    var debug = compila(leArquivo("Templates\\VisaoParcial.html_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\" + nomeProjeto + "." + nomeControlador + "." + nomeVisao + "_html.js", debug);
    eval(debug);
    gravaArquivo(pastaOutputDelphi7 + "HTML\\" + nomeProjeto + "." + nomeControlador + "." + nomeVisao + ".html", saida);
  }
}

var pastaOutputCSharp = null;

function geraCSharpModel(arquivo) {
  var Tabela = getTabela(arquivo);
  var propModel = WScript.CreateObject("Helper.Properties");
  propModel.NewProperty("PastaOutputCSharp", "CSharpModel\\", typePasta);
  if (propModel.Show("Geração de Model para CSharp")) {
    pastaOutputCSharp = propModel("PastaOutputCSharp");
    saida = "";
    var debug = compila(leArquivo("Templates\\ModelCSharp.cs_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\" + Tabela.Nome + "_cs.js", debug);
    eval(debug);
    gravaArquivo(pastaOutputCSharp + Tabela.Nome + ".cs", saida);
  }
}

var properties = WScript.CreateObject("Helper.Properties");
properties.NewProperty("Tabela", "", typeListaRestrita).PickList = getArquivosPickList(PastaConfiguracao, "tabela_", "json");
properties.NewProperty("PastaOutput", "..\\", typePasta);
properties.NewProperty("PastaOutputDelphi7", "..\\..\\iWBA_Delphi7\\", typePasta);
properties.NewProperty("GeraSimpleForm", false, typeNaoSim);
properties.NewProperty("GeraModel", false, typeNaoSim);
properties.NewProperty("GeraVCVazio", false, typeNaoSim);
properties.NewProperty("GeraVCCollection", false, typeNaoSim);
properties.NewProperty("GeraWEBControlador", false, typeNaoSim);
properties.NewProperty("GeraWEBPagina", false, typeNaoSim);
properties.NewProperty("GeraWEBParcial", false, typeNaoSim);
properties.NewProperty("GeraFrameCollection", false, typeNaoSim);
properties.NewProperty("GeraCSharpModel", false, typeNaoSim);
if (properties.Show("Criação de fontes") && properties("Tabela") != "") {
  pastaOutput = properties("PastaOutput");
  pastaOutputDelphi7 = properties("PastaOutputDelphi7");
  if (properties("GeraSimpleForm") == true)
    geraSimpleForm(PastaConfiguracao + properties("Tabela"));
  if (properties("GeraModel") == true)
    geraModel(PastaConfiguracao + properties("Tabela"));
  if (properties("GeraVCVazio") == true)
    geraVCVazio(PastaConfiguracao + properties("Tabela"));
  if (properties("GeraVCCollection") == true)
    geraVCCollection(PastaConfiguracao + properties("Tabela"));
  if (properties("GeraWEBControlador") == true)
    geraWEBControlador(PastaConfiguracao + properties("Tabela"));
  if (properties("GeraWEBPagina") == true)
    geraWEBPagina(PastaConfiguracao + properties("Tabela"));
  if (properties("GeraWEBParcial") == true)
    geraWEBParcial(PastaConfiguracao + properties("Tabela"));
  if (properties("GeraFrameCollection") == true)
    geraFrameCollection(PastaConfiguracao + properties("Tabela"));
  if (properties("GeraCSharpModel") == true)
    geraCSharpModel(PastaConfiguracao + properties("Tabela"));
}