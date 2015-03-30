unit CreditBr_Controlador_Autenticacao;

interface

uses
  SysUtils, HTTPApp, ServiceLocator, MVC_Controlador_Conectado, CreditBr_Conexao, uActiveRecord, CreditBr_Interfaces,
  uAROBUsuario, uOBUsuarioModel;

type
  TControladorAutenticacao = class(TControladorConectado)
  private
    FOBUsuarioModelService: IOBUsuarioModelService;
    {class procedure DescobrePapeis(const ASessao: ISessao_WBA; const AACGrupoModelService: IACGrupoModelService;
      const AConnection: IActiveRecordConnection);}
  protected
    procedure DespachaAcao(const ANomeAcao: string); override;
    procedure Entrar(const AURLRedirecionamento: string; ASaiu: Boolean); overload;
    procedure Entrar(const ACodigo, ASenha, AURLRedirecionamento: string); overload;
    //procedure EscolheAcesso(const AURLRedirecionamento: string; const ACd_TpUsr: string);
    procedure Sair;
    procedure Vai(const ASessao: string; ACodigoChecagem: Integer; const AURLRedirecionamento: string);
  public
    constructor Create(const AConnection: IActiveRecordConnection;
      const AOBUsuarioModelService: IOBUsuarioModelService);
    class function Acesso(const AOBUsuario: IOBUsuarioModel; const ASessao: ISessao_CreditBr;
      const AOBUsuarioModelService: IOBUsuarioModelService; const AConnection: IActiveRecordConnection): IAcesso;
    //class function Cd_TpUsrParaTipoAcessoCliente(const ACd_TpUsr: string): TTipoAcessoCliente;
  end;

implementation

{ Fabrica }

function FabricaControladorAutenticacao: IUnknown;
begin
  Result := TControladorAutenticacao.Create(CriaConexao_WBA, SL as IOBUsuarioModelService);
end;

{ TControladorAutenticacao }

class function TControladorAutenticacao.Acesso(const AOBUsuario: IOBUsuarioModel; const ASessao: ISessao_CreditBr;
      const AOBUsuarioModelService: IOBUsuarioModelService; const AConnection: IActiveRecordConnection): IAcesso;
begin
  Result := AOBUsuarioModelService.AcessoPermitido(AOBUsuario, AConnection);
  if Result.AcessoPermitido then
  begin
    ASessao.Autenticado := True;
    ASessao.UsuarioCodigo := Result.UsuarioLogado.UsuLogin;
    ASessao.UsuarioNome := Result.UsuarioLogado.UsuNome.Value;
    {ASessao.TipoAcessoCliente := tacNaoDefinido;
    ASessao.IdGrupoAcesso := AAcGruposModelService
      .FindByNomeOrDefault(Result.UsuarioLogado.Grupo.Value, AConnection).Id;
    ASessao.SomentePainelDeGerente := Result.UsuarioLogado.Gerente.Value;
    ASessao.CodigoGerente := CodigoGerente(Result.UsuarioLogado.CodGerente.Value,
      (not Result.UsuarioLogado.CodGerente.Null) and (Result.UsuarioLogado.CodGerente.Value <> ''));
    if ASessao.CodigoGerente.TemCodigo and (Result.UsuarioLogado.GerenteModel <> nil) then
      ASessao.PodeAcessarCodigosDeGerentes.Assign(Result.UsuarioLogado.GerenteModel.PodeAcessarCodigosDeGerentes)
    else
      ASessao.PodeAcessarCodigosDeGerentes.Clear;
    DescobrePapeis(ASessao, AAcGrupoModelService, AConnection);}
  end;
end;

(*class function TControladorAutenticacao.Cd_TpUsrParaTipoAcessoCliente(const ACd_TpUsr: string): TTipoAcessoCliente;
begin
  Result := tacNaoDefinido;
  if SameText(ACd_TpUsr, '002'{Cliente}) then
    Result := tacCliente
{$IFDEF WBASh}
  else if SameText(ACd_TpUsr, '006'{Representante}) then
    Result := tacParceiros
{$ENDIF}
end;*)

constructor TControladorAutenticacao.Create(const AConnection: IActiveRecordConnection;
  const AOBUsuarioModelService: IOBUsuarioModelService);
begin
  inherited Create(AConnection);
  FOBUsuarioModelService := AOBUsuarioModelService;
end;

(*class procedure TControladorAutenticacao.DescobrePapeis(const ASessao: ISessao_WBA;
  const AACGrupoModelService: IACGrupoModelService; const AConnection: IActiveRecordConnection);

  function Liberado(AIdAcesso: Integer): Boolean;
  begin
    Result := AACGrupoModelService.AcessoPermitido(ASessao.IdGrupoAcesso, AIdAcesso, AConnection);
  end;

var
  LPapeis: TPapeis;
begin
  LPapeis := [];
  if Liberado(Acesso_WBAWeb_Administracao) then
    Include(LPapeis, papelAdministrador);
  if Liberado(Acesso_WBAWeb_VisaoFinanceira) then
    Include(LPapeis, papelVisaoFinanceira);
  if Liberado(Acesso_WBAWeb_Gerencial) then
    Include(LPapeis, papelGerencial);
{$IFDEF WBASh}
  if Liberado(Acesso_WBASh_CadastrarMaquinas) then
    Include(LPapeis, papelCadastradorMaquinas);
  if Liberado(Acesso_WBASh_Ativacao) then
    Include(LPapeis, papelAtivador);
{$ENDIF}
  ASessao.Papeis := LPapeis;
end;*)

procedure TControladorAutenticacao.DespachaAcao(const ANomeAcao: string);
begin
  if SameText(ANomeAcao, 'Entrar') then
  begin
    if MetodoPost then
      Entrar(Request.ContentFields.Values['Codigo'], Request.ContentFields.Values['Senha'],
        Request.ContentFields.Values['r'])
    else
      Entrar(Request.QueryFields.Values['r'], SameText(Request.QueryFields.Values['saiu'], 'sim'));
  end
  {else if SameText(ANomeAcao, 'EscolheAcesso') then
    EscolheAcesso(Request.QueryFields.Values['r'], Request.QueryFields.Values['acesso'])}
  else if SameText(ANomeAcao, 'Sair') then
    Sair
  else if SameText(ANomeAcao, 'Vai') then
    Vai(Request.QueryFields.Values['Sessao'], StrToIntDef(Request.QueryFields.Values['CodigoChecagem'], 0),
      Request.QueryFields.Values['r'])
  else
    NaoFoiEncontrado;
end;

procedure TControladorAutenticacao.Entrar(const AURLRedirecionamento: string; ASaiu: Boolean);
var
  LLogin: IOBUsuarioModel;
begin
  LLogin := TOBUsuarioModel.Create(nil);
  Parametros['r'] := AURLRedirecionamento;
  if ASaiu then
    Parametros['Mensagem'] := 'Você acaba de sair da aplicação.';
  Visao(LLogin);
end;

procedure TControladorAutenticacao.Entrar(const ACodigo, ASenha, AURLRedirecionamento: string);
var
  LLogin: IOBUsuarioModel;
  LAcesso: IAcesso;
  //LSigcad: ISigcadModel;
  //LRlcmtSigcadTpUsr: IiWBA_RlcmtSigcadTpUsrModel;
  LSessao: ISessao_CreditBr;
begin
  LSessao := Sessao as ISessao_CreditBr;
  LLogin := TOBUsuarioModel.Create(nil);
  LLogin.UsuLogin := ACodigo;
  LLogin.UsuSenha := TOBUsuarioModel.Nullable(ASenha);
  LAcesso := Acesso(LLogin, LSessao, FOBUsuarioModelService, Connection);
  if LAcesso.AcessoPermitido then
  begin
    if AURLRedirecionamento <> '' then
      RedirecionaURL(AURLRedirecionamento)
    {else if LSessao.SomentePainelDeGerente then
      Redireciona(NovaRota.Nome('Gerente').Outros([LSessao.CodigoGerente.Codigo]))}
    else
      Redireciona(NovaRota.Nome('Padrao'));
    Exit;
  end;
  {if ACodigo <> '' then
  begin
    LSigcad := FSigcadModelService.FindByRapido(TSigcadModel.Nullable(ACodigo), Connection);
    if LSigcad <> nil then
    begin
      if LSigcad.Senha.Value = ASenha then
      begin
        LSessao.ClienteAutenticado := True;
        LSessao.UsuarioCodigo := ACodigo;
        LSessao.UsuarioNome := LSigcad.NomeFantasia.Value;
        LSessao.TipoAcessoCliente := tacNaoDefinido;
        LSessao.IdGrupoAcesso := -1;
        LSessao.Papeis := [];
        LSessao.CodigoGerente := SemCodigoGerente;
        LSessao.PodeAcessarCodigosDeGerentes.Clear;
        if AURLRedirecionamento <> '' then
          RedirecionaURL(AURLRedirecionamento)
        else
          Redireciona(NovaRota.Nome('Cliente'));
        Exit;
      end
      else
      begin
        //Registra a identificação inválida para o primeiro tipo de acesso cadastrado (se tiver)
        LRlcmtSigcadTpUsr := FiWBA_RlcmtSigcadTpUsrModelService.CollectionByCodigo(LSigcad.Codigo, Connection).First;
        if LRlcmtSigcadTpUsr <> nil then
          FiWBA_RlcmtSigcadTpUsrModelService.RegistraOcorrencia(LRlcmtSigcadTpUsr, ocrrIdPositivaInvalida, Connection);
      end;
    end;
  end;}
  Parametros['r'] := AURLRedirecionamento;
  FieldInvalid(TOBUsuarioModel.ViewMetadata.TableMetadata, TOBUsuarioModel.ViewMetadata.FieldMetadata(Campo_OBUsuario_UsuLogin),
    LAcesso.MensagemDeErro);
  Parametros['Codigo'] := ACodigo;
  Visao(LLogin);
end;

(*procedure TControladorAutenticacao.EscolheAcesso(const AURLRedirecionamento: string; const ACd_TpUsr: string);
var
  LSigcad: ISigcadModel;

  procedure DefinidoAcesso(const ACd_TpUsr: string);
  var
    LRlcmtSigcadTpUsr: IiWBA_RlcmtSigcadTpUsrModel;
  begin
    LRlcmtSigcadTpUsr := FiWBA_RlcmtSigcadTpUsrModelService.FindByCodigoAndCd_TpUsr(LSigcad.Codigo, ACd_TpUsr,
      Connection);
    if LRlcmtSigcadTpUsr = nil then
      Redireciona(RotaAtual.Acao('Entrar').Query('r', AURLRedirecionamento))
    else
    begin
      (Sessao as ISessao_WBA).TipoAcessoCliente := Cd_TpUsrParaTipoAcessoCliente(ACd_TpUsr);
      FiWBA_RlcmtSigcadTpUsrModelService.RegistraOcorrencia(LRlcmtSigcadTpUsr, ocrrInicioDeNavegacao, Connection);
      if AURLRedirecionamento <> '' then
        RedirecionaURL(AURLRedirecionamento)
      else
        Redireciona(NovaRota.Nome('Cliente'));
    end;
  end;

var
  LCollection: ICollectioniWBA_RlcmtSigcadTpUsrModel;
  laco: Integer;
begin
  LSigcad := FSigcadModelService.FindByRapido(TSigcadModel.Nullable((Sessao as ISessao_WBA).UsuarioCodigo), Connection);
  if (LSigcad = nil) or (not (Sessao as ISessao_WBA).ClienteAutenticado) then
    Redireciona(RotaAtual.Acao('Entrar').Query('r', AURLRedirecionamento))
  else if (ACd_TpUsr <> '') and (Cd_TpUsrParaTipoAcessoCliente(ACd_TpUsr) <> tacNaoDefinido) then
    DefinidoAcesso(ACd_TpUsr)
  else
  begin
    LCollection := FiWBA_RlcmtSigcadTpUsrModelService.CollectionByCodigo(LSigcad.Codigo, Connection);
    for laco := LCollection.Count - 1 downto 0 do
      if Cd_TpUsrParaTipoAcessoCliente(LCollection[laco].Cd_TpUsr) = tacNaoDefinido then
        LCollection.Delete(laco);
    if LCollection.Count = 1 then
      DefinidoAcesso(LCollection[0].Cd_TpUsr)
    else
    begin
      if LCollection.Count = 0 then
        Parametros['Erro'] := 'Não existe tipo de acesso compatível com o sistema cadastrado, verifique com o adiministrador.';
      Visao(TIteratoriWBA_RlcmtSigcadTpUsrModelDecorator.Decore(LCollection));
    end;
  end;
end;*)

procedure TControladorAutenticacao.Sair;
begin
  Sessao.Autenticado := False;
  //(Sessao as ISessao_CreditBr).ClienteAutenticado := False;
  //(Sessao as ISessao_CreditBr).TipoAcessoCliente := tacNaoDefinido;
  Redireciona(RotaAtual.Acao('Entrar').Query('saiu', 'sim'));
end;

procedure TControladorAutenticacao.Vai(const ASessao: string; ACodigoChecagem: Integer;
  const AURLRedirecionamento: string);
begin
  NovaSessao(ASessao);
  if (Sessao as ISessao_CreditBr).CodigoChecagem <> ACodigoChecagem then
    NaoFoiAutorizado('Sessão informada inválida');
  if AURLRedirecionamento <> '' then
    RedirecionaURL(AURLRedirecionamento, True)
  {else if (Sessao as ISessao_CreditBr).SomentePainelDeGerente then
    Redireciona(NovaRota.Nome('Gerente').Outros([(Sessao as ISessao_CreditBr).CodigoGerente.Codigo]), True)}
  else
    Redireciona(NovaRota.Nome('Padrao'), True);
end;

initialization

  TControladorAutenticacao.RegistreSe(FabricaControladorAutenticacao);

end.
