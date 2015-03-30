var Secoes = {
  Itens: [],
  SecaoAtual: {}
};

Secoes.WriteSecao = function (ent) {
    Secoes.SecaoAtual.Saida += ent;
};

Secoes.WriteLnSecao = function (ent) {
    Secoes.SecaoAtual.Saida += ent + "\r\n";
};

Secoes.NovaSecao = function (assinatura, diretrizes) {
  var Secao = {
    Saida: "",
    Assinatura: assinatura,
    Diretrizes: diretrizes,
    DeclaracoesLocais: "",
    TipoRetorno: "",
    DeclaracoesLocaisConst: [],
    DeclaracoesLocaisVar: []
  };
  Secao.GetNome = function () {
    var p = this.Assinatura.indexOf("(");
    if (p == -1)
      return this.Assinatura;
    else
      return this.Assinatura.slice(0, p - 1);
  };
  Secao.GetSaida = function () {
    if (this.Saida.slice(-2) == "\r\n")
      return this.Saida.slice(0, -2);
    else
      return this.Saida;
  };
  Secao.AddConst = function (Declaracao) {
    this.DeclaracoesLocaisConst.push(Declaracao);
  }
  Secao.AddVar = function (Declaracao) {
    this.DeclaracoesLocaisVar.push(Declaracao);
  }
  Secao.GetDeclaracoesLocais = function () {
    if (this.DeclaracoesLocais == "") {
      if (this.DeclaracoesLocaisConst.length > 0) {
        this.DeclaracoesLocais += "const\r\n";
        for (laco = 0; laco < this.DeclaracoesLocaisConst.length; laco++)
          this.DeclaracoesLocais += "  " + this.DeclaracoesLocaisConst[laco] + ";\r\n";
      }
      if (this.DeclaracoesLocaisVar.length > 0) {
        this.DeclaracoesLocais += "var\r\n";
        for (laco = 0; laco < this.DeclaracoesLocaisVar.length; laco++)
          this.DeclaracoesLocais += "  " + this.DeclaracoesLocaisVar[laco] + ";\r\n";
      }
      if (this.DeclaracoesLocais != "")
        this.DeclaracoesLocais = this.DeclaracoesLocais.substring(0, this.DeclaracoesLocais.length-2);
    }
    return this.DeclaracoesLocais;
  }
  this.SecaoAtual = Secao;
  this.Itens.push(Secao);
  return Secao;
}

Secoes.NovaSecaoTypeCast = function (Nome, TypeCast) {
  this.NovaSecao(Nome);
  this.SecaoAtual.TipoRetorno = TypeCast;
  WriteLn("  Result := Parametros.AsInterface['" + Nome + "'] as " + TypeCast + ";");
}

function IniciaSecoes() {
  Secoes.Itens = [];
  Secoes.NovaSecao("HTML", "override");
  Write = Secoes.WriteSecao;
  WriteVl = Secoes.WriteSecao;
  WriteLn = Secoes.WriteLnSecao;
}

function FinalizaSecoes() {
  Write = WriteSaida;
  WriteVl = WriteSaida;
  WriteLn = WriteLnSaida;
}

var TiposDeRetornoParaModelo = {
  "Interface": {"type": "IInterface", "TypeCast": "AValue as {0}"},
  "Object": {"type": "TObject", "TypeCast": "AValue as {0}", "Liberacao": "FModelo.Free; FModelo := nil"},
  "Valor": {"type": "Variant", "TypeCast": "AValue"}
};

function ExecutaGeraHTML (GeraHTML) {
  var Configuracao = {};

  var arqs = arquivos(GeraHTML.CaminhoHTML, GeraHTML.Projeto + "_", "html");
  for(var iArq = 0; iArq < arqs.length; iArq++) {
    var strHTML = leArquivo(GeraHTML.CaminhoHTML + "\\" + arqs[iArq]);
  
    Configuracao.NomeArquivoDesmembrado = arqs[iArq].split(".")[0].split("_");
    Configuracao.NomeDoArquivo = arqs[iArq]; 
    Configuracao.NomeProjeto = Configuracao.NomeArquivoDesmembrado[0];
    Configuracao.NomeControlador = Configuracao.NomeArquivoDesmembrado[2];
    Configuracao.NomeVisao = Configuracao.NomeArquivoDesmembrado[3];
    Configuracao.NomeUnit = Configuracao.NomeProjeto + "_Visao_" + Configuracao.NomeControlador + "_" + Configuracao.NomeVisao;
    Configuracao.Usa = GeraHTML.UsaPadrao;
    Configuracao.NomeClasse = "TVisao" + Configuracao.NomeControlador + Configuracao.NomeVisao;
    Configuracao.NomeClasseHeranca = GeraHTML.NomeClasseHerancaPadrao;
    Configuracao.Registra = true;
    Configuracao.TituloHTMLPagina = "";
    Configuracao.TituloPainel = "";
    Configuracao.TituloPagina = "";
    Configuracao.Modelo = "";
    Configuracao.TipoModelo = "Interface";
  
    var debug = compilaHTML2JavaScript(strHTML);
    IniciaSecoes();
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\" + arqs[iArq] + ".js", debug);
    eval(debug);
    FinalizaSecoes();  
    if (GravaArquivoDebug)
      for (var iSecoes = 0; iSecoes < Secoes.Itens.length; iSecoes++)
        gravaArquivo("Debug\\" + Configuracao.NomeUnit + "_" + Secoes.Itens[iSecoes].GetNome() + "_pas.js", Secoes.Itens[iSecoes].Saida);
    saida = "";
    var debug = compila(leArquivo("Templates\\VisaoHTML.pas_template"));
    if (GravaArquivoDebug)
      gravaArquivo("Debug\\" + Configuracao.NomeUnit + "_pas.js", debug);
    eval(debug);
    gravaArquivo(GeraHTML.CaminhoProjeto + "Visoes\\" + Configuracao.NomeUnit + ".pas", saida);
  }
};