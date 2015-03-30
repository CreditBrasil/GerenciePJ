function dominio2Tipo(tab) {
  for(var i = 0; i < tab.Campos.length; i++) {
    switch (tab.Campos[i].Dominio) {
      case "Data":
        tab.Campos[i].Tipo = "datetime";
        break;
      case "Taxa":
      case "Dinheiro":
        tab.Campos[i].Tipo = "float";
        break;
      case "Identificador":
      case "Quantidade":
      case "Cor":
        tab.Campos[i].Tipo = "int";
        break;
      case "Descricao":
        tab.Campos[i].Tipo = "varchar";
        tab.Campos[i].Tamanho = 50;
        break;
      case "NS":
        tab.Campos[i].Tipo = "varchar";
        tab.Campos[i].Tamanho = 1;
        break;
      case "AtualizadoEm":
        tab.Campos[i].Tipo = "datetime";
        tab.Campos[i].Nullable = false;
        tab.Campos[i].Descricao = "Contém a data e hora da última atualização no registro";
        tab.Campos[i].ReadOnly = true;
        tab.Campos[i].FormulaInsert = "' + SQLNow + '";
        tab.Campos[i].FormulaUpdate = "' + SQLNow + '";
		tab.Campos[i].Hidden = true;
        break;
      /* case "AtualizadoPorQuem":
        tab.Campos[i].Tipo = "varchar";
        tab.Campos[i].Tamanho = 3;
        tab.Campos[i].Nullable = false;
        tab.Campos[i].Descricao = "Contém o código do usuário que fez a última atualização no registro";
        tab.Campos[i].ReadOnly = true;
        tab.Campos[i].Padrao = "UserCode";
        tab.Campos[i].BeforeSave = "UserCode";
		tab.Campos[i].Hidden = true;
		break; */
      case "CriadoEm":
        tab.Campos[i].Tipo = "datetime";
        tab.Campos[i].Nullable = false;
        tab.Campos[i].Descricao = "Contém a data e hora da criação do registro";
        tab.Campos[i].ReadOnly = true;
        tab.Campos[i].FormulaInsert = "' + SQLNow + '";
        tab.Campos[i].NotUpdate = true;
		tab.Campos[i].Hidden = true;
        break;
	  /* case "CriadoPorQuem":
        tab.Campos[i].Tipo = "varchar";
        tab.Campos[i].Tamanho = 3;
        tab.Campos[i].Nullable = false;
        tab.Campos[i].Descricao = "Contém o código do usuário que criou o registro";
        tab.Campos[i].ReadOnly = true;
        tab.Campos[i].Padrao = "UserCode";
		tab.Campos[i].Hidden = true;
		break; */
      case "ApagadoEm":
        tab.Campos[i].Tipo = "datetime";
        tab.Campos[i].Nullable = true;
        tab.Campos[i].Descricao = "Contém a data e hora de quando o registro foi apagado, não nulo significa que não se deve considerar o registro";
        tab.Campos[i].ReadOnly = true;
		tab.Campos[i].Hidden = true;
        break;
	  /* case "ApagadoPorQuem":
        tab.Campos[i].Tipo = "varchar";
        tab.Campos[i].Tamanho = 3;
        tab.Campos[i].Nullable = true;
        tab.Campos[i].Descricao = "Contém o código do usuário que apagou o registro";
        tab.Campos[i].ReadOnly = true;
		tab.Campos[i].Hidden = true;
		break; */
	  case "Memo":
	    tab.Campos[i].Tipo = "text";
		break;
	  case "B01":
	    tab.Campos[i].Tipo = "bit";
		break;
      case "Binario":
	    tab.Campos[i].Tipo = "image";
        break;
	  case "UsuLogin":
	    tab.Campos[i].Tipo = "varchar";
        tab.Campos[i].Tamanho = 10;
		break;
	}
    if (!tab.Campos[i].Tipo) 
      WScript.Echo("Tipo para o domínio " + tab.Campos[i].Dominio + " não foi definido, tabela " + tab.Nome);
  }
  return tab;
}