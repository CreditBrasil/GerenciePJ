unit ConfiguracaoRelatoSegmento;

interface

uses
  SysUtils, ConsultaCreditoDefinicoes, ServiceLocator, uActiveRecord{, uIniFilesModel};

type
  TConfiguracaoRelatoSegmento = class(TObject)
  private
    FDados: TDadosConfiguracaoRelatoSegmento;
    FConnection: IActiveRecordConnection;
    function GetDados: TDadosConfiguracaoRelatoSegmento;
  public
    constructor Create(const AConnection: IActiveRecordConnection);
    destructor Destroy; override;
    procedure Le;
    procedure Grava;
    property Dados: TDadosConfiguracaoRelatoSegmento read GetDados;
  end;

implementation

{ TConfiguracaoRelatoSegmento }

constructor TConfiguracaoRelatoSegmento.Create(const AConnection: IActiveRecordConnection);
begin
  inherited Create;
  FConnection := AConnection;
  Le;
end;

destructor TConfiguracaoRelatoSegmento.Destroy;
begin
  FDados.Free;
  inherited;
end;

function TConfiguracaoRelatoSegmento.GetDados: TDadosConfiguracaoRelatoSegmento;
begin
  if not Assigned(FDados) then
    FDados := TDadosConfiguracaoRelatoSegmento.Create;
  Result := FDados;
end;

procedure TConfiguracaoRelatoSegmento.Grava;
{var
  LCollectionIniFiles: ICollectionIniFilesModel;
  LService: IIniFilesModelService;

  function Get(const AItem, APadrao: string): IIniFilesModel;
  begin
    Result := LCollectionIniFiles.FindByFilialAndArquivoAndSecaoAndItemOrPadrao(0, Ini_Arquivo_Serasa, Ini_Secao_Config,
      AItem, APadrao, FConnection);
  end;

  function SetInteger(const AIniFiles: IIniFilesModel; AValor: Integer): IIniFilesModel;
  begin
    Result := AIniFiles;
    AIniFiles.ValorAsInteger := AValor;
  end;

  function SetBoolean(const AIniFiles: IIniFilesModel; AValor: Boolean): IIniFilesModel;
  begin
    Result := AIniFiles;
    AIniFiles.ValorAsBoolean := AValor;
  end;
}
begin
  {LService := SL as IIniFilesModelService;
  LCollectionIniFiles := TCollectionIniFilesModel.CreateFromIterator(
    LService.FindByFilialAndArquivoAndSecao(0, Ini_Arquivo_Serasa, Ini_Secao_Config, FConnection));

  LService.Save(SetInteger(Get('calculoriskscoring', '0'), Dados.CalculoRiskScoring));
  LService.Save(SetBoolean(Get('consultamonitore', 'False'), Dados.ConsultaMonitore));
  LService.Save(SetBoolean(Get('consultaquadrosocial', 'False'), Dados.ConsultaQuadroSocial));
  LService.Save(SetBoolean(Get('consultaparticipacoes', 'False'), Dados.ConsultaParticipacoes));
  LService.Save(SetInteger(Get('indicadorriskatacadista', '0'), Dados.IndicadorRiskAtacadista));
  LService.Save(SetBoolean(Get('consultacentraldetitulos', 'False'), Dados.ConsultaCentralDeTitulos));}
end;

procedure TConfiguracaoRelatoSegmento.Le;
{var
  LCollectionIniFiles: ICollectionIniFilesModel;
  LService: IIniFilesModelService;

  function Get(const AItem, APadrao: string): IIniFilesModel;
  begin
    Result := LCollectionIniFiles.FindByFilialAndArquivoAndSecaoAndItemOrPadrao(0, Ini_Arquivo_Serasa, Ini_Secao_Config,
      AItem, APadrao, FConnection);
  end;
}
begin
{  LService := SL as IIniFilesModelService;
  LCollectionIniFiles := TCollectionIniFilesModel.CreateFromIterator(
    LService.FindByFilialAndArquivoAndSecao(0, Ini_Arquivo_Serasa, Ini_Secao_Config, FConnection));

  Dados.CalculoRiskScoring := Get('calculoriskscoring', '0').ValorAsInteger;
  Dados.ConsultaMonitore := Get('consultamonitore', 'False').ValorAsBoolean;
  Dados.ConsultaQuadroSocial := Get('consultaquadrosocial', 'False').ValorAsBoolean;
  Dados.ConsultaParticipacoes := Get('consultaparticipacoes', 'False').ValorAsBoolean;
  Dados.IndicadorRiskAtacadista := Get('indicadorriskatacadista', '0').ValorAsInteger;
  Dados.ConsultaCentralDeTitulos := Get('consultacentraldetitulos', 'False').ValorAsBoolean;}
end;

end.
