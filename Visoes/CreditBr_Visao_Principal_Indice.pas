{
  ***************************************************
  * Este código é gerado automaticamente, não edite *
  ***************************************************

  Template: VisaoHTML.pas_template
  Descrição: Cria uma visão (geração de HTML) a partir do arquivo CreditBr_Visao_Principal_Indice.html
}

unit CreditBr_Visao_Principal_Indice;

interface

uses
  SysUtils, Classes, Variants, ServiceLocator, HTTPApp, MVC_Interfaces, MVC_Visao_HTML, 
  MVC_Visao_HTML_ActiveRecord, CreditBr_Visao_Pagina_Mestra;

type
  TVisaoPrincipalIndice = class(TVisaoPaginaMestra)
  private
  protected
    function GetTituloPagina: string; override;
    procedure HTML; override;
  end;

implementation

{ TVisaoPrincipalIndice }

function TVisaoPrincipalIndice.GetTituloPagina: string;
begin
  Result := 'Principal';
end;

procedure TVisaoPrincipalIndice.HTML;
begin  
Write  ('<h2>Principal</h2>'); 
end;

initialization

  TVisaoPrincipalIndice.RegistreSe;

end.