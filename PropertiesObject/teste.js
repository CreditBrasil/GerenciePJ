//EnumTypes
var typeString = 0;
var typeListaRestrita = 1;
var typeNaoSim = 2;
var typePasta = 3;

var properties = WScript.CreateObject("Helper.Properties");
properties.NewProperty("String", "texto simples", typeString);
properties.NewProperty("ListaRestrita", "", typeListaRestrita).PickList = '"Opção 1","Opção 2"';
properties.NewProperty("Boolean", true, typeNaoSim);
properties.NewProperty("Pasta", "..\\", typePasta);

var ok = properties.Show("Teste de propriedades");
if(ok) {
  WScript.Echo("Ok pressionado\n" +
    "String = " + properties("String") + "\n" +
    "ListaRestrita = " + properties("ListaRestrita") + "\n" +
    "Boolean = " + properties("Boolean"));
}