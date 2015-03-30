program CreditBrDebug;

{$APPTYPE GUI}

{%File 'Visoes\HTML\CreditBr_Visao_Autenticacao_Entrar.html'}
{%File 'CreditBr.ini'}
{%File 'Visoes\HTML\CreditBr_Visao_Pagina_Mestra.html'}
{%File 'Visoes\HTML\CreditBr_Visao_Principal_Indice.html'}

uses
  FastMM4 in 'Core\FastMM4.pas',
  FastMM4Messages in 'Core\FastMM4Messages.pas',
  Fastcode in 'FastCode\FastCode.pas',
  Forms,
  SockApp,
  ComObj,
  ActiveX,
  CreditBrDebug_Form in 'CreditBrDebug_Form.pas' {Debug},
  uArrayIntf in 'Core\uArrayIntf.pas',
  uArrayClass in 'Core\uArrayClass.pas',
  ServiceLocator in 'Core\ServiceLocator.pas',
  StringBuilder in 'Core\StringBuilder.pas',
  Utilitario_StringToGUID in 'Core\Utilitario_StringToGUID.pas',
  superobject in 'Core\superobject.pas',
  csvstrings in 'Core\csvstrings.pas',
  Tipos in 'Core\Tipos.pas',
  Metodos in 'Core\Metodos.pas',
  FacMetodos in 'Core\FacMetodos.pas',
  uSingleton in 'Core\uSingleton.pas',
  uActiveRecord in 'ActiveRecord\uActiveRecord.pas',
  cachecod in 'Core\cachecod.pas',
  MVC_Interfaces in 'MVC\MVC_Interfaces.pas',
  MVC_Rotas in 'MVC\MVC_Rotas.pas',
  MVC_ProcessaRequisicoes in 'MVC\MVC_ProcessaRequisicoes.pas',
  MVC_ProcessaRequisicoes_Module in 'MVC\MVC_ProcessaRequisicoes_Module.pas' {ProcessaRequisicoes: TProcessaRequisicoes},
  MVC_Visao in 'MVC\MVC_Visao.pas',
  MVC_Visao_NaoModificado in 'MVC\MVC_Visao_NaoModificado.pas',
  MVC_Visao_Redireciona in 'MVC\MVC_Visao_Redireciona.pas',
  MVC_Visao_HTML in 'MVC\MVC_Visao_HTML.pas',
  MVC_Visao_Redireciona_Javascript in 'MVC\MVC_Visao_Redireciona_Javascript.pas',
  MVC_Visao_JSON in 'MVC\MVC_Visao_JSON.pas',
  MVC_Visao_JSONLiberadoAcesso in 'MVC\MVC_Visao_JSONLiberadoAcesso.pas',
  MVC_Visao_Erro_JSON in 'MVC\MVC_Visao_Erro_JSON.pas',
  MVC_Visao_HTML_ActiveRecord in 'MVC\MVC_Visao_HTML_ActiveRecord.pas',
  MVC_FabricaVisao in 'MVC\MVC_FabricaVisao.pas',
  MVC_Iniciadores in 'MVC\MVC_Iniciadores.pas',
  MVC_IniciadoresConectado in 'MVC\MVC_IniciadoresConectado.pas',
  MVC_Controlador in 'MVC\MVC_Controlador.pas',
  MVC_Controlador_ComSessao in 'MVC\MVC_Controlador_ComSessao.pas',
  MVC_Controlador_Conectado in 'MVC\MVC_Controlador_Conectado.pas',
  MVC_FabricaControlador in 'MVC\MVC_FabricaControlador.pas',
  MVC_SessoesEmMemoria in 'MVC\MVC_SessoesEmMemoria.pas',
  MVC_Parametros in 'MVC\MVC_Parametros.pas',
  MVC_Recurso in 'MVC\MVC_Recurso.pas',
  MVC_Controlador_Recurso in 'MVC\MVC_Controlador_Recurso.pas',
  MVC_Visao_Recurso in 'MVC\MVC_Visao_Recurso.pas',
  uAROBUsuario in 'Model\uAROBUsuario.pas',
  uOBUsuarioModel in 'Model\uOBUsuarioModel.pas',
  CreditBr_Rotas in 'Outros\CreditBr_Rotas.pas',
  CreditBr_Interfaces in 'Outros\CreditBr_Interfaces.pas',
  CreditBr_Configuracao in 'Outros\CreditBr_Configuracao.pas',
  CreditBr_Sessao in 'Outros\CreditBr_Sessao.pas',
  CreditBr_Conexao in 'Outros\CreditBr_Conexao.pas',
  CreditBr_Tema in 'Outros\CreditBr_Tema.pas',
  CreditBr_Controlador_Autenticacao in 'Controladores\CreditBr_Controlador_Autenticacao.pas',
  CreditBr_Controlador_Autenticado in 'Controladores\CreditBr_Controlador_Autenticado.pas',
  CreditBr_Visao_Autenticacao_Entrar in 'Visoes\CreditBr_Visao_Autenticacao_Entrar.pas',
  CreditBr_Controlador_Principal in 'Controladores\CreditBr_Controlador_Principal.pas',
  CreditBr_Visao_Pagina_Mestra in 'Visoes\CreditBr_Visao_Pagina_Mestra.pas',
  CreditBr_Visao_Principal_Indice in 'Visoes\CreditBr_Visao_Principal_Indice.pas';

{$R 'Recursos\Recursos.res' 'Recursos\Recursos.rc'}
{$R *.res}

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.Title := 'CreditBr';
  Application.CreateForm(TDebug, Debug);
  Iniciadores.Iniciar;
  Application.Run;
  Iniciadores.Finalizar;
end.
