var saida = new String();

function WriteSaida(x) {
  saida += x;
}

function WriteLnSaida(x) {
  saida += x + "\r\n";
}

var Write = WriteSaida;

var WriteVl = WriteSaida;

var WriteLn = WriteLnSaida;

function acerta(ent) {
  return ent.replace(/\\/g, "\\\\").replace(/"/g, "\\\"");
}

function acertaPascal(ent) {
  return ent.replace(/'/g, "''");
}

function geraWriteLn(ent) {
  var s = "";
  var a = ent.split("\r\n");
  for(var i = 0; i < a.length - 1; i++)
    s += "WriteLn(\"" + acerta(a[i]) + "\");\r\n";
  if (acerta(a[a.length - 1]) != "")
    s += "Write  (\"" + acerta(a[a.length - 1]) + "\"); ";
  return s;
}

function geraWriteLnPascal(ent) {
  var s = "";
  var a = ent.split("\r\n");
  for(var i = 0; i < a.length - 1; i++)
    s += "WriteLn('" + acertaPascal(a[i]) + "');\r\n";
  if (acerta(a[a.length - 1]) != "")
    s += "Write  ('" + acertaPascal(a[a.length - 1]) + "'); ";
  return s;
}

function compilaTag(fonte, tagCodigoAbrir, tagCodigoFechar, tagResultadoAbrir, tagResultadoFechar, geraComandos) {
  var p1, p2, p3, saida;
  saida = "";
  p1 = fonte.indexOf(tagResultadoAbrir);
  p2 = fonte.indexOf(tagCodigoAbrir);
  while (p1 != -1 || p2 != -1){
    if (p2 == -1 || p1 < p2 && p1 != -1) {
      p3 = fonte.indexOf(tagResultadoFechar);
      if (p3 == 0) p3 = fonte.length - 4;
      saida += geraComandos(fonte.slice(0, p1)) + "WriteVl(" + fonte.slice(p1+tagResultadoAbrir.length, p3) + "); ";
	  fonte = fonte.slice(p3+tagResultadoFechar.length);
    } else {
      p3 = fonte.indexOf(tagCodigoFechar);
      if (p3 == 0) p3 = fonte.length - 1;
      saida += geraComandos(fonte.slice(0, p2)) + fonte.slice(p2+tagCodigoAbrir.length, p3) + "; ";
	  fonte = fonte.slice(p3+tagCodigoFechar.length);
    }
    p1 = fonte.indexOf(tagResultadoAbrir);
    p2 = fonte.indexOf(tagCodigoAbrir);
  } 
  return saida + geraComandos(fonte);
}

function compila(fonte) {
  return compilaTag(fonte, "==>", "<==", "-->", "<--", geraWriteLn);
}

function compilaHTML2Pascal(fonte) {
  return compilaTag(fonte, "<%", "%>", "[[", "]]", geraWriteLnPascal);
}

function compilaHTML2JavaScript(fonte) {
  return compilaTag(fonte, "<#", "#>", "<!--#", "#-->", geraWriteLn);
}