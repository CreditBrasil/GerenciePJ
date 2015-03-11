function geraCampo(campoOrigem) {
  var campo = {};
  campo.Nome = campoOrigem.Nome;
  campo.Descricao = (campoOrigem.Cod?"@" + campoOrigem.Cod + " - ":"") + secao.Secao + " - " + campoOrigem.Descricao + (campoOrigem.Conteudo != ""?" - ":"") + campoOrigem.Conteudo;
  campo.Nullable = true;
  if(campoOrigem.Tipo == "A") {
    if(campoOrigem.Tam > 255) {
        campo.Dominio = "Memo";
        campoOrigem.Retorna = "ConverteParaString";
    } else {
      if(campoOrigem.Tam == 1 && campoOrigem.Conteudo == "NS") {
        campo.Dominio = "NS";
        campoOrigem.Retorna = "ConverteDeNS";
      } else {
        campo.Tipo = "varchar";
        campo.Tamanho = campoOrigem.Tam;
        campoOrigem.Retorna = "ConverteParaString";
      }
    }
  } else {
    if(campoOrigem.Tam == 8 && campoOrigem.Conteudo == "DDMMAAAA" ||
       campoOrigem.Tam == 6 && campoOrigem.Conteudo == "HHMMSS" ||
       campoOrigem.Tam == 6 && campoOrigem.Conteudo == "MMAAAA" ||
       campoOrigem.Tam == 8 && campoOrigem.Conteudo == "AAAAMMDD") {
      campo.Dominio = "Data";
      campoOrigem.Retorna = "ConverteDe" + campoOrigem.Conteudo + "ParaData";
      if(campoOrigem.ConteudoXML)
        campoOrigem.RetornaXML = "ConverteDe" + campoOrigem.ConteudoXML + "ParaData";
      if(campoOrigem.ConteudoXML11)
        campoOrigem.RetornaXML11 = "ConverteDe" + campoOrigem.ConteudoXML11 + "ParaData";
      if(campoOrigem.ConteudoXML12)
        campoOrigem.RetornaXML12 = "ConverteDe" + campoOrigem.ConteudoXML12 + "ParaData";
    } else { 
      if(campoOrigem.Dec == 2) {
        campo.Dominio = "Dinheiro"
        campoOrigem.Retorna = "ConverteParaDinheiro";
      } else { 
        if(campoOrigem.Dec > 0) {
          campo.Dominio = "Taxa"
          campoOrigem.Retorna = "ConverteParaTaxa(" + campoOrigem.Dec + ")";
        } else {
          if(campoOrigem.Tam > 9) {
            campo.Tipo = "varchar";
            campo.Tamanho = campoOrigem.Tam;
            campoOrigem.Retorna = "ConverteParaString";
          } else {
            campo.Dominio = "Identificador";
            campoOrigem.Retorna = "ConverteParaInteiro";
          }
        }
      }
    }
  }
  return campo;
}

function geraCampoParametro(parametro) {
  var campo = {};
  campo.Nome = "Ent" + parametro.parametro;
  campo.Descricao = "Memória do parâmetro " + parametro.parametro + " passado para a consulta";
  switch (parametro.tipo) {
    case "string": 
      campo.Tipo = "varchar";
      campo.Tamanho = parametro.tamanho;
      break;
    case "Char":
      campo.Tipo = "varchar";
      campo.Tamanho = 1;
      break;
    case "Integer":
      campo.Tipo = "int";
      parametro.toXML = "IntToStr({0})";
      break;
    case "Boolean":
      campo.Dominio = "NS";
      parametro.toXML = "NS[{0}]";
      break;
  }
  return campo;
}

function pegaEstrutura(estrutura) {
  var nomeEstrutura = String(estrutura);
  for(var i = 0; i < estruturaEquifax.length; i++) {
    if(estruturaEquifax[i].Layout == nomeEstrutura) {
      return estruturaEquifax[i].Estrutura;
    }
  }
  return estrutura;
}

var strEstruturaEquifax = leArquivo("Configuracao\\equifax.json");
var estruturaEquifax = strEstruturaEquifax.parseJSON();
var layout = {};
var estrut = {};

for(var iEstrutura = 0; iEstrutura < estruturaEquifax.length; iEstrutura++) {
  layout = estruturaEquifax[iEstrutura];
  estrut = pegaEstrutura(layout.Estrutura);
  if(estrut == layout.Estrutura) {
    var Tabela = {};
    Tabela.Nome = layout.Layout;
    estrut.TabelaNome = Tabela.Nome;
    Tabela.Descricao = layout.Descricao;
    Tabela.GUID = estrut.GUID;
    Tabela.Campos = [
      {"Nome": "Ctrl_ID", "Dominio": "Identificador", "ReadOnly": true, "Descricao": "Identificador único, surrogatekey"},
      {"Nome": "Sigcad_ID", "Dominio": "Identificador", "Descricao": "Codigo do cadastro N..1 tabela sigcad.codigo"},
      {"Nome": "Em", "Dominio": "CriadoEm"}
    ];
    for(var j = 0; j < estrut.Entrada.length; j++) {
      var parametro = estrut.Entrada[j];
	  if(parametro["NaoPersiste"] != "True") {
        var campo = geraCampoParametro(parametro);
        Tabela.Campos.push(campo);
	  }
    }
    for(var j = 0; j < estrut.Saida.length; j++) {
      var secao = estrut.Saida[j];
      if(secao.Repete == 1) {
        for(var k = 0; k < secao.Campos.length; k++) {
          var campo = geraCampo(secao.Campos[k]);
          Tabela.Campos.push(campo);
          if (secao.Campos[k].Relacionamento) {
            if (!Tabela.Relacionamentos)
              Tabela.Relacionamentos = [];
            Tabela.Relacionamentos.push({
              Nome: campo.Nome + "_" + secao.Campos[k].Relacionamento,
              Model: "AR" + secao.Campos[k].Relacionamento,
              Tipo: "N:1",
              CamposOrigem: [campo.Nome + ".Value"],
              CamposDestino: ["Codigo"]
            });
          }
        } 
      } else {
        var tabelaAux = {};
        tabelaAux.Nome = Tabela.Nome + secao.Sufixo;
        tabelaAux.Descricao = secao.Secao;
        tabelaAux.GUID = secao.GUID;
        tabelaAux.Campos = [
          {"Nome": "Ctrl_ID", "Dominio": "Identificador", "ReadOnly": true, "Descricao": "Identificador único, surrogatekey"},
          {"Nome": layout.Layout + "_ID", "Dominio": "Identificador", "Descricao": "Chave estrangeira para a tabela " + layout.Layout}
        ];
        for(var k = 0; k < secao.Campos.length; k++) {
          var campo = geraCampo(secao.Campos[k]);
          tabelaAux.Campos.push(campo);
          if (secao.Campos[k].Relacionamento) {
            if (!tabelaAux.Relacionamentos)
              tabelaAux.Relacionamentos = [];
            tabelaAux.Relacionamentos.push({
              Nome: campo.Nome + "_" + secao.Campos[k].Relacionamento,
              Model: "AR" + secao.Campos[k].Relacionamento,
              Tipo: "N:1",
              CamposOrigem: [campo.Nome + ".Value"],
              CamposDestino: ["Codigo"]
            });
          }
        }
        tabelaAux.Acesso = [
          {"Campos": ["Ctrl_ID"], "RetornaVarios": false},
          {"Campos": [layout.Layout + "_ID"], "RetornaVarios": true, "OrderBy": "ctrl_id"}
        ];
        tabelaAux.ChavePrimaria = {"Tipo": "CtrlID", "Campos": ["Ctrl_ID"]};
        gravaArquivo("Configuracao\\tabela_" + tabelaAux.Nome + "_gerado_automatico.json", tabelaAux.toJSONString());
        if(!Tabela.Relacionamentos) Tabela.Relacionamentos = [];
        Tabela.Relacionamentos.push({"Model": "AR" + tabelaAux.Nome, "Tipo": "1:N", "CamposOrigem": ["Ctrl_ID"], "CamposDestino": [layout.Layout + "_ID"]});
      }
    }
    Tabela.Acesso = [
      {"Campos": ["Ctrl_ID"], "RetornaVarios": false},
      {"Campos": ["EntTipoDeConsulta", "Sigcad_ID"], "RetornaVarios": true, "OrderBy": "ctrl_id desc"}
    ];
    Tabela.ChavePrimaria = {"Tipo": "CtrlID", "Campos": ["Ctrl_ID"]};
    Tabela.Totalizacoes = [{"Nome": "Ultimo", "CamposEntrada": ["Sigcad_ID", "EntTipoDeConsulta"], "Funcao": "max(ctrl_id)", "TipoRetorno": "TNullableInteger"}];
    gravaArquivo("Configuracao\\tabela_" + Tabela.Nome + "_gerado_automatico.json", Tabela.toJSONString());
  }

  if(layout.FormatoComunicacao == "@") {
    saida = "";
    var debug = compila(leArquivo("Templates\\equifax.pas_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\u" + Tabela.Nome + "Consulta.js", debug);
    eval(debug);
    gravaArquivo("..\\u" + layout.Layout + "Consulta.pas", saida);
  }
  if(layout.FormatoComunicacao == "XML" || layout.FormatoComunicacao == "UrlXML") {
    saida = "";
    var debug = compila(leArquivo("Templates\\equifaxXML.pas_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\u" + Tabela.Nome + "Consulta.js", debug);
    eval(debug);
    gravaArquivo("..\\u" + layout.Layout + "Consulta.pas", saida);
  }
  if(layout.FormatoComunicacao == "XML@") {
    saida = "";
    var debug = compila(leArquivo("Templates\\equifaxXMLArroba.pas_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\u" + Tabela.Nome + "Consulta.js", debug);
    eval(debug);
    gravaArquivo("..\\u" + layout.Layout + "Consulta.pas", saida);
  }  
}