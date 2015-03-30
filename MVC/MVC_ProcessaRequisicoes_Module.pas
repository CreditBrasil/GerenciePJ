unit MVC_ProcessaRequisicoes_Module;

interface

uses
  SysUtils, Classes, HTTPApp, WebReq, MVC_ProcessaRequisicoes;

type
  TProcessaRequisicoes = class(TWebModule)
    procedure ProcessaRequisicoesWebActionDefaultAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
  public
  end;

var
  ProcessaRequisicoes: TProcessaRequisicoes;

implementation

{$R *.dfm}

procedure TProcessaRequisicoes.ProcessaRequisicoesWebActionDefaultAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
begin
  ProcessaAcao(Request, Response);
end;

initialization

  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := TProcessaRequisicoes;

end.
