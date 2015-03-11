function leArquivo(arquivo) {
  var fso = WScript.CreateObject("Scripting.FileSystemObject");
  var f = fso.OpenTextFile(arquivo, 1);
  return f.ReadAll();
}

function gravaArquivo(arquivo, conteudo) {
  var fso = WScript.CreateObject("Scripting.FileSystemObject");
  var f = fso.OpenTextFile(arquivo, 2, true);
  f.Write(conteudo);
}

function arquivos(pasta, iniciadoCom, extensao) {
  var saida = [];
  var fso = WScript.CreateObject("Scripting.FileSystemObject");
  var f = fso.GetFolder(pasta);
  var fc = new Enumerator(f.files);
  for (; !fc.atEnd(); fc.moveNext())
  {
    var n = fc.item().Name;
    if(n.indexOf(iniciadoCom) == 0) {
	  if(extensao == "") {
	    saida.push(n);
	  } else {
	   var e = n.split("."); 
	   if(e.length > 0 && e[e.length - 1].toUpperCase() == extensao.toUpperCase())
	    saida.push(n);
	  }
	}
  }
  return(saida);
}