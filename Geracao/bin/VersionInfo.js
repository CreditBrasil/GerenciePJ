/*
Informações sobre o arquivo VersionInfo.RC em
http://msdn.microsoft.com/en-us/library/windows/desktop/aa381058(v=vs.85).aspx

Informações sobre como obter a Revisão do SVN
http://tortoisesvn.net/docs/release/TortoiseSVN_en/tsvn-subwcrev-com-interface.html
*/

function TrataVersao(versao, build) {
  var resultado = {};
  versaoDesmembrado = versao.split(".");
  resultado.Maior = versaoDesmembrado[0];
  resultado.Menor = versaoDesmembrado[1];
  resultado.Release = versaoDesmembrado[2];
  resultado.Build = build;
  var productVersion = [resultado.Maior];
  productVersion.push(resultado.Menor);
  productVersion.push('0');
  resultado.ProductVersion = productVersion.join(".");
  var fileVersion = [resultado.Maior];
  fileVersion.push(resultado.Menor);
  fileVersion.push(resultado.Release);
  fileVersion.push(resultado.Build);
  resultado.FileVersion = fileVersion.join(".");
  return resultado;
}

//Obtem a pasta do projeto de maneira relativa
/*var fs = WScript.CreateObject("Scripting.FileSystemObject")
var path = fs.GetAbsolutePathName("..\\..");*/

var strVersionInfo = leArquivo("Configuracao\\VersionInfo.json");
var Configuracao = strVersionInfo.parseJSON();

//Obtem a revisão atual do SVN
/*var SubWCRev = WScript.CreateObject("SubWCRev.object");
SubWCRev.GetWCInfo(path, false, false);
Configuracao.Versao = TrataVersao(Configuracao.VersaoPrograma, SubWCRev.Revision); */

var GitRevision = leArquivo("Debug\\UltimaRevisaoGit.txt").split("\n");
Configuracao.Versao = TrataVersao(Configuracao.VersaoPrograma, GitRevision[0]);
Configuracao.GitRevision = GitRevision[1];

Configuracao.FileFlags = [];
if (Configuracao.PrivateBuild && Configuracao.PrivateBuild != "")
  Configuracao.FileFlags.push("VS_FF_PRIVATEBUILD");
if (Configuracao.SpecialBuild && Configuracao.SpecialBuild != "")
  Configuracao.FileFlags.push("VS_FF_SPECIALBUILD");
if (Configuracao.PreRelease)
  Configuracao.FileFlags.push("VS_FF_PRERELEASE");

for (var laco = 0; laco < Configuracao.Produtos.length; laco++) {
  Configuracao.Produto = Configuracao.Produtos[laco];
  var debug = compila(leArquivo("Templates\\VersionInfo.rc_template"));
  if (GravaArquivoDebug)
    gravaArquivo("Debug\\VersionInfo" + Configuracao.Produto.Sufixo + "_rc.js", debug);
  eval(debug);
  gravaArquivo("..\\VersionInfo" + Configuracao.Produto.Sufixo + ".rc", saida);
  saida = "";
}