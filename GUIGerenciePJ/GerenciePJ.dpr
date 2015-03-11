program GerenciePJ;

uses
  Forms,
  uArrayIntf in '..\Core\uArrayIntf.pas',
  uArrayClass in '..\Core\uArrayClass.pas',
  ServiceLocator in '..\Core\ServiceLocator.pas',
  uSingleton in '..\Core\uSingleton.pas',
  Tipos in '..\Core\Tipos.pas',
  cachecod in '..\Core\cachecod.pas',
  Metodos in '..\Core\Metodos.pas',
  FacMetodos in '..\Core\FacMetodos.pas',
  csvstrings in '..\Core\csvstrings.pas',
  uCMC7 in '..\Core\uCMC7.pas',
  uLogModelIntf in '..\Log\uLogModelIntf.pas',
  uObserverModelIntf in '..\Log\uObserverModelIntf.pas',
  uLogControlIntf in '..\Log\uLogControlIntf.pas',
  uActiveRecord in '..\ActiveRecord\uActiveRecord.pas',
  uARNFConsultaSerasa in '..\Model\uARNFConsultaSerasa.pas',
  uNFConsultaSerasaModel in '..\Model\uNFConsultaSerasaModel.pas',
  uGerenciePJ_Conexao in 'uGerenciePJ_Conexao.pas',
  ConsultaCredito in '..\ConsultaOrgao\ConsultaCredito.pas',
  SerasaIP20 in '..\ConsultaOrgao\SerasaIP20.pas',
  Serasa in '..\ConsultaOrgao\Serasa.pas',
  ConsultaCreditoDefinicoes in '..\ConsultaOrgao\ConsultaCreditoDefinicoes.pas',
  SerasaMonitoreDefinicoes in '..\ConsultaOrgao\SerasaMonitoreDefinicoes.pas',
  ConsultaCreditoConfiguracoes in '..\ConsultaOrgao\ConsultaCreditoConfiguracoes.pas',
  ConfiguracaoRelatoSegmento in '..\ConsultaOrgao\ConfiguracaoRelatoSegmento.pas',
  SerasaComunicacao in '..\ConsultaOrgao\SerasaComunicacao.pas',
  SerasaINI in '..\ConsultaOrgao\SerasaINI.pas',
  SerasaHTTPS in '..\ConsultaOrgao\SerasaHTTPS.pas',
  SerasaNR054 in '..\ConsultaOrgao\SerasaNR054.pas',
  wPrincipal in 'wPrincipal.pas' {Principal},
  SerasaMonitore in '..\ConsultaOrgao\SerasaMonitore.pas',
  uLogViewIntf in '..\Log\uLogViewIntf.pas',
  uDialogos in '..\Core\uDialogos.pas',
  SerasaLocal in '..\ConsultaOrgao\SerasaLocal.pas',
  DBConsultaCredito in '..\ConsultaOrgao\DBConsultaCredito.pas',
  uLogViewFactory in '..\Log\uLogViewFactory.pas',
  uLogViewClasses in '..\Log\uLogViewClasses.pas',
  wFrmLogView in '..\Log\wFrmLogView.pas' {FrmLogView},
  wFraLogViewTree in '..\Log\wFraLogViewTree.pas' {FraLogViewTree: TFrame},
  uImgDataModule in '..\Core\uImgDataModule.pas' {ImgDataModule: TDataModule},
  wFraLogViewText in '..\Log\wFraLogViewText.pas' {FraLogViewText: TFrame},
  uLogControlFactory in '..\Log\uLogControlFactory.pas',
  uLogControlClasses in '..\Log\uLogControlClasses.pas',
  uObserverModelFactory in '..\Log\uObserverModelFactory.pas',
  uObserverModelClasses in '..\Log\uObserverModelClasses.pas',
  uLogModelFactory in '..\Log\uLogModelFactory.pas',
  uLogModelClasses in '..\Log\uLogModelClasses.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TImgDataModule, ImgDataModule);
  Application.Run;
end.
