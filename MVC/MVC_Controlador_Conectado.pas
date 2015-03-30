unit MVC_Controlador_Conectado;

interface

uses
  SysUtils, SyncObjs, MVC_Interfaces, MVC_Controlador_ComSessao, MVC_IniciadoresConectado, uActiveRecord;

type
  TControladorConectado = class(TControladorComSessao, IActiveRecordCallBackValidate)
  private
    FConnection: IActiveRecordConnection;
    FModeloValido: Boolean;
    FPrefixoDoNome: string;
    FUltimaMensagem: string;
    FUltimoModeloValido: Boolean;
  protected
    procedure AntesDeDespachar; override;
    procedure Bind(const AModelo: IActiveRecord; const APrefixoDoNome: string = '';
      AMetadata: IActiveRecordMetadata = nil);
    function CriaModeloEBind(AClasseDoModelo: TClassActiveRecord; const APrefixoDoNome: string = ''): IActiveRecord;
    procedure FieldInvalid(const ANomeCampo: string; const AMessage: string); overload;
    property Connection: IActiveRecordConnection read FConnection;
    property ModeloValido: Boolean read FModeloValido;
    property UltimaMensagem: string read FUltimaMensagem;
    { IActiveRecordCallBackValidate }
    procedure FieldInvalid(const ATableMetadata: TTableMetadata; const AFieldMetadata: TFieldMetadata;
      const AMessage: string); overload;
  public
    constructor Create(const AConnection: IActiveRecordConnection);
  end;

implementation

var
  GIniciadoresConectadoCriticalSection: TCriticalSection;

{ TControladorConectado }

procedure TControladorConectado.AntesDeDespachar;
begin
  inherited;
  if not JaTemVisao then
  begin
    GIniciadoresConectadoCriticalSection.Acquire;
    try
      if not IniciadoresConectado.Iniciado then
        IniciadoresConectado.Iniciar(Connection);
    finally
      GIniciadoresConectadoCriticalSection.Release;
    end;
  end; 
end;

procedure TControladorConectado.Bind(const AModelo: IActiveRecord; const APrefixoDoNome: string;
  AMetadata: IActiveRecordMetadata);

  function PadraoPara(const AFieldMetadata: TFieldMetadata): string;
  begin
    case AFieldMetadata.FieldType of
      arftNS, arftB01: Result := 'N';
    else
      Result := '';
    end;
  end;

  function PegaWebField(const AWebFieldName: string; out AValor: string; const APadrao: string): Boolean;
  begin
    Result := Request.ContentFields.IndexOfName(AWebFieldName) >= 0;
    if Result then
      AValor := Request.ContentFields.Values[AWebFieldName]
    else
    begin
      Result := Request.QueryFields.IndexOfName(AWebFieldName) >= 0;
      if Result then
        AValor := Request.QueryFields.Values[AWebFieldName]
      else
      begin
        Result := APadrao <> '';
        if Result then
          AValor := APadrao;
      end
    end;
  end;

var
  laco: Integer;
  LValor: string;
  LFieldMetadata: TFieldMetadata;
  LAccess: IActiveRecordAccess;
  LMensagem: string;
begin
  FUltimoModeloValido := True;
  LAccess := AModelo.Access;
  if AMetadata = nil then
    AMetadata := AModelo.ClassActiveRecord.ViewMetadata;
  for laco := 0 to AMetadata.FieldCount - 1 do
  begin
    LFieldMetadata := AMetadata.FieldMetadata(laco);
    if (not LFieldMetadata.ReadOnly) and (not LFieldMetadata.Commented) and
      PegaWebField(APrefixoDoNome + LFieldMetadata.Name, LValor, PadraoPara(LFieldMetadata)) then
    begin
      if not TActiveRecord.ValidateString(LValor, LFieldMetadata, LMensagem) then
      begin
        Parametros['MemoriaEntrada.' + APrefixoDoNome + LFieldMetadata.Name] := LValor;
        FieldInvalid(APrefixoDoNome + LFieldMetadata.Name, LMensagem)
      end
      else
        LAccess.AsString[laco] := LValor;
    end;
  end;
  if FUltimoModeloValido then
  begin
    FPrefixoDoNome := APrefixoDoNome;
    try
      AModelo.Validate(Self);
    finally
      FPrefixoDoNome := '';
    end;
  end;
end;

constructor TControladorConectado.Create(const AConnection: IActiveRecordConnection);
begin
  inherited Create;
  FConnection := AConnection;
  FModeloValido := True;
  FUltimoModeloValido := True;
end;

function TControladorConectado.CriaModeloEBind(AClasseDoModelo: TClassActiveRecord;
  const APrefixoDoNome: string): IActiveRecord;
begin
  Result := AClasseDoModelo.Create(Connection);
  Bind(Result, APrefixoDoNome, AClasseDoModelo.ViewMetadata);
end;

procedure TControladorConectado.FieldInvalid(const ATableMetadata: TTableMetadata; const AFieldMetadata: TFieldMetadata;
  const AMessage: string);
begin
  FieldInvalid(AFieldMetadata.Name, AMessage);
end;

procedure TControladorConectado.FieldInvalid(const ANomeCampo, AMessage: string);
var
  LNomeParametro: string;
begin
  FUltimaMensagem := AMessage;
  FModeloValido := False;
  FUltimoModeloValido := False;
  LNomeParametro := 'Mensagem.' + FPrefixoDoNome + ANomeCampo;
  if Parametros.TemCodigo(LNomeParametro) then
    Parametros[LNomeParametro] := Parametros[LNomeParametro] + '; ' + AMessage
  else
    Parametros[LNomeParametro] := AMessage;
  if not Parametros.TemCodigo('Aviso.Modelo') then
    Parametros['Aviso.Modelo'] := 'Ocorreu um erro na validação das informações, verifique o erro nos campos abaixo.';
end;

initialization

  GIniciadoresConectadoCriticalSection := TCriticalSection.Create;

finalization

  FreeAndNil(GIniciadoresConectadoCriticalSection);

end.
