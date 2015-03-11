unit SerasaINI;

interface

uses
  Serasa, SerasaHTTPS, FacMetodos, ServiceLocator, uActiveRecord{, uIniFilesModel, uSenhasModel};

type
  Comunicacoes = function: TSeComunicacao of Object;

  TSerasaIni = class(TObject)
  private
    FComunicacao: TSeComunicacao;
    //FCollectionIniFiles: ICollectionIniFilesModel;
    FConnection: IActiveRecordConnection;
    procedure ComunicacaoHTTP;
    //function Get(const ASecao, AItem, APadrao: string): IIniFilesModel;
  public
    constructor Create(const AConnection: IActiveRecordConnection; TipoComunicacao: TTipoComunicacao = tcComunicacao;
      AComunicacao: TSeComunicacao = nil);
    function CreateSerasaINI: TSerasa;
  end;

implementation

procedure TSerasaIni.ComunicacaoHTTP;
{var
  LSenhas: ISenhasModel;}
begin
  {case Get('Config', 'Comunicacao', '0').ValorAsInteger of
    0: begin
      FComunicacao := TSeHTTPS_Post.Create;
      (FComunicacao as TSeHTTPS_Post).URL := Get('Comunicacao HTTPS-Post', 'URL',
        'https://sitenet09.serasa.com.br/Prod/serasahttps2').Valor;
    end;
    1: begin}
      FComunicacao := TSeHTTPS.Create;
      (FComunicacao as TSeHTTPS).URLPrefix := {Get('Comunicacao HTTPS', 'URL',}
        'https://sitenet09.serasa.com.br/Prod/serasahttps2?p='{).Valor};
    {end;
    else
      FComunicacao:= nil;
  end;
  LSenhas := (SL as ISenhasModelService).FindByCodigo(FConnection.UserCode, FConnection);
  if (LSenhas <> nil) and (LSenhas.LogonSerasa.Value > '') then
  begin
    FComunicacao.Logon := LSenhas.LogonSerasa.Value;
    FComunicacao.Password := LSenhas.PasswordSerasa.Value;
  end
  else
  begin
    FComunicacao.Logon := Get('Config', 'Logon', '').Valor;
    FComunicacao.Password := TFacMetodos.UnCrypt(Get('Config', 'SenhaCrypt',
      TFacMetodos.Crypt(Get('Config', 'Senha', '').Valor)).Valor);
  end;}
  FComunicacao.NewPassword := '';
end;

constructor TSerasaIni.Create(const AConnection: IActiveRecordConnection; TipoComunicacao: TTipoComunicacao;
  AComunicacao: TSeComunicacao);
begin
  FConnection := AConnection;
  {FCollectionIniFiles := TCollectionIniFilesModel.CreateFromIterator(
    (SL as IIniFilesModelService).FindByFilialAndArquivo(0, Ini_Arquivo_Serasa, FConnection));}
  if TipoComunicacao = tcLocal then
    FComunicacao := AComunicacao
  else
    ComunicacaoHTTP;
end;

function TSerasaIni.CreateSerasaINI: TSerasa;
{var
  LIniFiles: IIniFilesModel;
  LIniFilesModelService: IIniFilesModelService;}
begin
  Result := TSerasa.Create(FComunicacao);
  {Result.CNPJContrato := Get('Config', 'CNPJ', '').Valor;
  Result.CNPJFIDC := Get('Config', 'CNPJFIDC', '').Valor;
  Result.CNPJFIDC2 := Get('Config', 'CNPJFIDC2', '').Valor;
  Result.DiasDecorridos := Get('Config', 'DiasDecorridos', '5').ValorAsInteger;
  Result.PeriodicidadeRelato := TPeriodicidadeRelato(Get('Config', 'PeriodicidadeRelato', '0').ValorAsInteger);
  Result.DiasMonitore := Get('Config', 'DiasMonitore', '30').ValorAsInteger;
  Result.MonitoreGrupoEMail := Get('Config', 'MonitoreGrupoEMail', '').Valor;
  Result.TarifaTitulos := Get('Config', 'TarifaConsultaTitulos', '0').ValorAsCurrency;}
  Result.MonitoreRetorno := mrEdi7; //TTipoMonitoreRetorno(Get('Config', 'MonitoreRetorno', '0').ValorAsInteger);
  {Result.PrazoConsulta := Get('Config', 'PrazoConsulta', '0').ValorAsInteger;
  Result.LimpezaSerasLog := Get('Config', 'LimpezaSerasLog', '15').ValorAsInteger;
  LIniFiles := Get('Config', 'RazaoSocialNaSerasa', '');
  if LIniFiles.Valor = '' then
  begin
    LIniFilesModelService := SL as IIniFilesModelService;
    LIniFiles.Valor := LIniFilesModelService.Get(0, wbaEmpresaRazaoSocial, FConnection).Valor;
    if LIniFiles.Valor <> '' then
      LIniFilesModelService.Save(LIniFiles);
  end;
  Result.RazaoSocialNaSerasa := LIniFiles.Valor;}
end;

{function TSerasaIni.Get(const ASecao, AItem, APadrao: string): IIniFilesModel;
begin
  Result := FCollectionIniFiles.FindByFilialAndArquivoAndSecaoAndItemOrPadrao(0, Ini_Arquivo_Serasa, ASecao, AItem,
    APadrao, FConnection);
end;}

end.
