unit MVC_Controlador;

interface

uses
  SysUtils, Classes, HTTPApp, ServiceLocator, Utilitario_StringToGUID, MVC_Interfaces, MVC_Iniciadores, DateUtils,
  superobject;

type
  TProcuraControlador = function (const ARota: IRota): IControlador;

  TControlador = class(TInterfacedObject, IControlador)
  private
    FFabricaTipoDeRota: IFabricaTipoDeRota;
    FFabricaVisao: IFabricaVisao;
    FParametros: IParametros;
    FRequest: TWebRequest;
    FResponse: TWebResponse;
    FRota: IRota;
    FTipoResposta: TTipoResposta;
    FVisao: IVisao;
    function GetNomeAcao: string;
    function GetNomeControlador: string;
    function GetParametros: IParametros;
    function GetRequest: TWebRequest;
  protected
    procedure AntesDeDespachar; virtual;
    function CriaListaDeValoresParaOName(const AName: string): TStrings;
    procedure DepoisDeDespachar; virtual;
    procedure DespachaAcao(const ANomeAcao: string); virtual; abstract;
    procedure FaltaInformacao(const AMensagem: string);
    function JaTemVisao: Boolean;
    function MetodoPost: Boolean;
    procedure NaoFoiAutorizado; overload;
    procedure NaoFoiAutorizado(const AMensagem: string); overload;
    procedure NaoFoiAutorizadoAcesso;
    procedure NaoFoiEncontrado; overload;
    procedure NaoFoiEncontrado(const AMensagem: string); overload;
    procedure NaoModificado;
    function NovaRota: IRotaFluente;
    procedure Redireciona(const ARotaFluente: IRotaFluente; AUsaJavascript: Boolean = False);
    procedure RedirecionaURL(const AURL: string; AUsaJavascript: Boolean = False);
    class procedure RegistreSe(const AGUID: TGUID; AFunctionFactory: TFunctionFactory); overload;
    class procedure RegistreSe(AFunctionFactory: TFunctionFactory); overload;
    procedure RetornaJSON(const ASuperObject: ISuperObject; ALiberadoAcesso: Boolean = False);
    function RotaAtual: IRotaFluente;
    function TemModificadoDesde(out AModificadoDesde: TDateTime): Boolean;
    procedure Visao; overload;
    procedure Visao(AModel: TObject); overload;
    procedure Visao(const AModel: IInterface); overload;
    procedure Visao(const AModel: Variant); overload;
    procedure Visao(const ANomeVisao: string); overload;
    procedure Visao(const ANomeVisao: string; AModel: TObject); overload;
    procedure Visao(const ANomeVisao: string; const AModel: IInterface); overload;
    procedure Visao(const ANomeVisao: string; const AModel: Variant); overload;
    procedure Visao(const ANomeControlador, ANomeVisao: string); overload;
    procedure Visao(const ANomeControlador, ANomeVisao: string; AModel: TObject); overload;
    procedure Visao(const ANomeControlador, ANomeVisao: string; const AModel: IInterface); overload;
    procedure Visao(const ANomeControlador, ANomeVisao: string; const AModel: Variant); overload;
    property NomeAcao: string read GetNomeAcao;
    property NomeControlador: string read GetNomeControlador;
    property Parametros: IParametros read GetParametros;
    property Request: TWebRequest read GetRequest;
    property Response: TWebResponse read FResponse;
    property Rota: IRota read FRota;
    { IControlador }
    function GetFabricaTipoDeRota: IFabricaTipoDeRota;
    function GetFabricaVisao: IFabricaVisao;
    function GetTipoResposta: TTipoResposta;
    function ProcessaERetornaVisao(const ARota: IRota; ARequest: TWebRequest; AResponse: TWebResponse): IVisao;
    procedure SetFabricaTipoDeRota(const AValue: IFabricaTipoDeRota);
    procedure SetFabricaVisao(const Value: IFabricaVisao);
    procedure SetTipoResposta(AValue: TTipoResposta);
  public
    class procedure RetornaTodosValuesDesteName(const AName: string; AOrigem: TStrings; ADestino: TStrings);
    class function TryParseFullDate(const AFullDate: string; out AValue: TDateTime): Boolean;
  end;

var
  ProcuraControlador: TProcuraControlador;

implementation

type
  THackWebRequest = class(TWebRequest);

var
  GGUIDControladores: TStringToGUID;

function ProcuraControladorPadrao(const ARota: IRota): IControlador;
var
  LNomeClasseControlador: string;
begin
  LNomeClasseControlador := 'TControlador' + ARota.NomeInternoDoControlador;
  if GGUIDControladores.Exists(LNomeClasseControlador) then
    Result := SL.Get(GGUIDControladores.GetGUID(LNomeClasseControlador)) as IControlador
  else
    raise ENaoEncontrado.CreateFmt('O controlador %s não foi encontrado', [ARota.NomeControlador]);
end;

{ TControlador }

procedure TControlador.AntesDeDespachar;
const
  LTempoMaximo = 60 * 100; //Espera 60 segundos
var
  LTempo: Integer;
begin
  LTempo := 0;
  while (not Iniciadores.Iniciado) and (LTempo < LTempoMaximo) do
  begin
    Sleep(10);
    Inc(LTempo);
  end;
  if (LTempo >= LTempoMaximo) or Iniciadores.TemErros and
    (not SameText(NomeControlador, 'Iniciadores')) then
    Redireciona(NovaRota.Nome('Padrao').Controlador('Iniciadores').Acao('Log'));
end;

function TControlador.CriaListaDeValoresParaOName(const AName: string): TStrings;
begin
  Result := TStringList.Create;
  try
    RetornaTodosValuesDesteName(AName, Request.ContentFields, Result);
  except
    Result.Free;
    raise;
  end;
end;

procedure TControlador.DepoisDeDespachar;
begin
  //Faz Nada
end;

procedure TControlador.FaltaInformacao(const AMensagem: string);
begin
  raise EFaltaInformacao.Create(AMensagem);
end;

function TControlador.GetFabricaTipoDeRota: IFabricaTipoDeRota;
begin
  Result := FFabricaTipoDeRota;
end;

function TControlador.GetFabricaVisao: IFabricaVisao;
begin
  Result := FFabricaVisao;
end;

function TControlador.GetNomeAcao: string;
begin
  Result := FRota.NomeAcao;
end;

function TControlador.GetNomeControlador: string;
begin
  Result := FRota.NomeInternoDoControlador;
end;

function TControlador.GetParametros: IParametros;
begin
  if FParametros = nil then
    FParametros := SL as IParametros;
  Result := FParametros;
end;

function TControlador.GetRequest: TWebRequest;
begin
  Result := FRequest;
end;

function TControlador.JaTemVisao: Boolean;
begin
  Result := FVisao <> nil;
end;

function TControlador.MetodoPost: Boolean;
begin
  Result := Request.MethodType = mtPost;
end;

procedure TControlador.NaoFoiAutorizado;
begin
  raise ENaoAutorizado.CreateFmt('A ação %s do controlador %s não foi autorizado o acesso', [NomeAcao, NomeControlador]);
end;

procedure TControlador.NaoFoiAutorizado(const AMensagem: string);
begin
  raise ENaoAutorizado.Create(AMensagem);
end;

procedure TControlador.NaoFoiEncontrado;
begin
  raise ENaoEncontrado.CreateFmt('A ação %s do controlador %s não foi encontrada'#13#10'%s', [NomeAcao, NomeControlador, Rota.URL]);
end;

procedure TControlador.NaoFoiAutorizadoAcesso;
begin
  raise ENaoAutorizado.Create('O grupo de acesso a qual pertence não permite acessar este recurso, verifique com o seu administrador');
end;

procedure TControlador.NaoFoiEncontrado(const AMensagem: string);
begin
  raise ENaoEncontrado.Create(AMensagem);
end;

procedure TControlador.NaoModificado;
begin
  FVisao := FFabricaVisao.CriaNaoModificado;
end;

function TControlador.NovaRota: IRotaFluente;
begin
  Result := FFabricaTipoDeRota.CriaRotaFluente;
end;

function TControlador.ProcessaERetornaVisao(const ARota: IRota; ARequest: TWebRequest; AResponse: TWebResponse): IVisao;
begin
  FRota := ARota;
  FRequest := ARequest;
  FResponse := AResponse;
  AntesDeDespachar;
  if not JaTemVisao then
  begin
    DespachaAcao(NomeAcao);
    DepoisDeDespachar;
    if not JaTemVisao then
      Visao;
  end;
  FVisao.FabricaVisao := FFabricaVisao;
  if (FParametros <> nil) and (FVisao.Parametros <> nil) then
    FVisao.Parametros.Assign(FParametros);
  Result := FVisao;
end;

procedure TControlador.Redireciona(const ARotaFluente: IRotaFluente; AUsaJavascript: Boolean);
begin
  RedirecionaURL(ARotaFluente.CriaRota.URL, AUsaJavascript);
end;

procedure TControlador.RedirecionaURL(const AURL: string; AUsaJavascript: Boolean);
begin
  if AUsaJavascript then
    FVisao := FFabricaVisao.CriaRedirecionaJavascript(AURL)
  else
    FVisao := FFabricaVisao.CriaRedireciona(AURL);
end;

class procedure TControlador.RegistreSe(const AGUID: TGUID; AFunctionFactory: TFunctionFactory);
begin
  GGUIDControladores.Add(Self.ClassName, AGUID);
  SL.Add(AGUID, AFunctionFactory);
end;

class procedure TControlador.RegistreSe(AFunctionFactory: TFunctionFactory);
var
  LGUID: TGUID;
begin
  Assert(CreateGUID(LGUID) = 0);
  RegistreSe(LGUID, AFunctionFactory);
end;

class procedure TControlador.RetornaTodosValuesDesteName(const AName: string; AOrigem, ADestino: TStrings);
var
  laco: Integer;
begin
  ADestino.BeginUpdate;
  try
    ADestino.Clear;
    for laco := 0 to AOrigem.Count - 1 do
      if AnsiSameText(AOrigem.Names[laco], AName) then
        ADestino.Add(AOrigem.ValueFromIndex[laco]);
  finally
    ADestino.EndUpdate;
  end;
end;

function TControlador.RotaAtual: IRotaFluente;
begin
  Result := FFabricaTipoDeRota.CriaRotaFluente(FRota);
end;

procedure TControlador.SetFabricaTipoDeRota(const AValue: IFabricaTipoDeRota);
begin
  FFabricaTipoDeRota := AValue;
end;

procedure TControlador.SetFabricaVisao(const Value: IFabricaVisao);
begin
  FFabricaVisao := Value;
end;

procedure TControlador.Visao(const AModel: Variant);
begin
  Visao(NomeAcao, AModel);
end;

procedure TControlador.Visao(const ANomeVisao: string);
begin
  Visao(NomeControlador, ANomeVisao);
end;

procedure TControlador.Visao(const ANomeVisao: string; const AModel: IInterface);
begin
  Visao(NomeControlador, ANomeVisao, AModel);
end;

procedure TControlador.Visao;
begin
  Visao(NomeAcao);
end;

procedure TControlador.Visao(const AModel: IInterface);
begin
  Visao(NomeAcao, AModel);
end;

procedure TControlador.Visao(AModel: TObject);
begin
  Visao(NomeAcao, AModel);
end;

procedure TControlador.Visao(const ANomeControlador, ANomeVisao: string; const AModel: IInterface);
begin
  FVisao := FFabricaVisao.CriaVisao(ANomeControlador, ANomeVisao);
  FVisao.ModeloInterface := AModel;
end;

procedure TControlador.Visao(const ANomeControlador, ANomeVisao: string; AModel: TObject);
begin
  FVisao := FFabricaVisao.CriaVisao(ANomeControlador, ANomeVisao);
  FVisao.ModeloObject := AModel;
end;

procedure TControlador.Visao(const ANomeControlador, ANomeVisao: string; const AModel: Variant);
begin
  FVisao := FFabricaVisao.CriaVisao(ANomeControlador, ANomeVisao);
  FVisao.ModeloValor := AModel;
end;

procedure TControlador.Visao(const ANomeVisao: string; AModel: TObject);
begin
  Visao(NomeControlador, ANomeVisao, AModel);
end;

procedure TControlador.Visao(const ANomeVisao: string; const AModel: Variant);
begin
  Visao(NomeControlador, ANomeVisao, AModel);
end;

procedure TControlador.Visao(const ANomeControlador, ANomeVisao: string);
begin
  FVisao := FFabricaVisao.CriaVisao(ANomeControlador, ANomeVisao);
end;

class function TControlador.TryParseFullDate(const AFullDate: string; out AValue: TDateTime): Boolean;
const
  Months: array[1..12] of string = (
    'Jan', 'Feb', 'Mar', 'Apr',
    'May', 'Jun', 'Jul', 'Aug',
    'Sep', 'Oct', 'Nov', 'Dec');
  DaysOfWeek: array[1..7] of string = (
    'Sun', 'Mon', 'Tue', 'Wed',
    'Thu', 'Fri', 'Sat');
  DaysOfWeekFull: array[1..7] of string = (
    'Sunday', 'Monday', 'Tuesday', 'Wednesday',
    'Thursday', 'Friday', 'Saturday');

  function TryStrToMonth(const AMonth: string; out AValue: Integer): Boolean;
  var
    laco: Integer;
  begin
    Result := False;
    for laco := Low(Months) to High(Months) do
      if SameText(AMonth, Months[laco]) then
      begin
        Result := True;
        AValue := laco;
        Break;
      end;
  end;

var
  laco, p: Integer;
  y, m, d, h, n, s: Integer;
begin
  //http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.3.1
  {Sun, 06 Nov 1994 08:49:37 GMT  ; RFC 822, updated by RFC 1123
  Sunday, 06-Nov-94 08:49:37 GMT ; RFC 850, obsoleted by RFC 1036
  Sun Nov  6 08:49:37 1994       ; ANSI C's asctime() format

  HTTP-date    = rfc1123-date | rfc850-date | asctime-date
       rfc1123-date = wkday "," SP date1 SP time SP "GMT"
       rfc850-date  = weekday "," SP date2 SP time SP "GMT"
       asctime-date = wkday SP date3 SP time SP 4DIGIT
       date1        = 2DIGIT SP month SP 4DIGIT
                      ; day month year (e.g., 02 Jun 1982)
       date2        = 2DIGIT "-" month "-" 2DIGIT
                      ; day-month-year (e.g., 02-Jun-82)
       date3        = month SP ( 2DIGIT | ( SP 1DIGIT ))
                      ; month day (e.g., Jun  2)
       time         = 2DIGIT ":" 2DIGIT ":" 2DIGIT
                      ; 00:00:00 - 23:59:59
       wkday        = "Mon" | "Tue" | "Wed"
                    | "Thu" | "Fri" | "Sat" | "Sun"
       weekday      = "Monday" | "Tuesday" | "Wednesday"
                    | "Thursday" | "Friday" | "Saturday" | "Sunday"
       month        = "Jan" | "Feb" | "Mar" | "Apr"
                    | "May" | "Jun" | "Jul" | "Aug"
                    | "Sep" | "Oct" | "Nov" | "Dec"}
  Result := False;
  for laco := Low(DaysOfWeekFull) to High(DaysOfWeekFull) do
    if SameText(Copy(AFullDate, 1, Length(DaysOfWeekFull[laco])), DaysOfWeekFull[laco]) then
    begin
      p := Length(DaysOfWeekFull[laco]);
      //          1         2
      //012345678901234567890123
      //, dd-MMM-yy hh:nn:ss GMT
      if (Copy(AFullDate, p, 2) <> ', ') or (Copy(AFullDate, p + 4, 1) <> '-') or (Copy(AFullDate, p + 8, 1) <> '-')
        or (Copy(AFullDate, p + 11, 1) <> ' ') or (Copy(AFullDate, p + 14, 1) <> ':')
        or (Copy(AFullDate, p + 17, 1) <> ':') or (Copy(AFullDate, p + 20, 1) <> ' ')
        or (Copy(AFullDate, p + 21, 3) <> 'GMT') or (not TryStrToInt(Copy(AFullDate, p + 2, 2), d))
        or (not TryStrToMonth(Copy(AFullDate, p + 5, 3), m)) or (not TryStrToInt(Copy(AFullDate, p + 9, 2), y))
        or (not TryStrToInt(Copy(AFullDate, p + 12, 2), h)) or (not TryStrToInt(Copy(AFullDate, p + 15, 2), n))
        or (not TryStrToInt(Copy(AFullDate, p + 18, 2), s)) then
        Exit;
      if y <= TwoDigitYearCenturyWindow then
        Inc(y, 1900)
      else
        Inc(y, 2000);
      Result := TryEncodeDateTime(y, m, d, h, n, s, 0, AValue);
      Exit;
    end;
  for laco := Low(DaysOfWeek) to High(DaysOfWeek) do
    if SameText(Copy(AFullDate, 1, 3), DaysOfWeek[laco]) then
    begin
      if Copy(AFullDate, 4, 2) = ', ' then
      begin
        //         1         2
        //12345678901234567890123456789
        //Sun, 06 Nov 1994 08:49:37 GMT
        if (Copy(AFullDate, 8, 1) <> ' ') or (Copy(AFullDate, 12, 1) <> ' ') or (Copy(AFullDate, 17, 1) <> ' ')
          or (Copy(AFullDate, 20, 1) <> ':') or (Copy(AFullDate, 23, 1) <> ':') or (Copy(AFullDate, 26, 1) <> ' ')
          or (Copy(AFullDate, 27, 3) <> 'GMT') or (not TryStrToInt(Copy(AFullDate, 6, 2), d))
          or (not TryStrToMonth(Copy(AFullDate, 9, 3), m)) or (not TryStrToInt(Copy(AFullDate, 13, 4), y))
          or (not TryStrToInt(Copy(AFullDate, 18, 2), h)) or (not TryStrToInt(Copy(AFullDate, 21, 2), n))
          or (not TryStrToInt(Copy(AFullDate, 24, 2), s)) then
          Exit;
        Result := TryEncodeDateTime(y, m, d, h, n, s, 0, AValue);
        Exit;
      end
      else if Copy(AFullDate, 4, 1) = ' ' then
      begin
        //         1         2
        //123456789012345678901234
        //Sun Nov  6 08:49:37 1994
        if (Copy(AFullDate, 8, 1) <> ' ') or (Copy(AFullDate, 11, 1) <> ' ') or (Copy(AFullDate, 14, 1) <> ':')
          or (Copy(AFullDate, 17, 1) <> ':') or (Copy(AFullDate, 20, 1) <> ' ')
          or (not TryStrToMonth(Copy(AFullDate, 5, 3), m)) or (not TryStrToInt(Trim(Copy(AFullDate, 9, 2)), d))
          or (not TryStrToInt(Copy(AFullDate, 12, 2), h)) or (not TryStrToInt(Copy(AFullDate, 15, 2), n))
          or (not TryStrToInt(Copy(AFullDate, 18, 2), s)) or (not TryStrToInt(Copy(AFullDate, 21, 4), y)) then
          Exit;
        Result := TryEncodeDateTime(y, m, d, h, n, s, 0, AValue);
        Exit;
      end;
    end;
end;

function TControlador.TemModificadoDesde(out AModificadoDesde: TDateTime): Boolean;
begin
  Result := TryParseFullDate(THackWebRequest(Request).GetStringVariable(11 {IfModifiedSince}), AModificadoDesde);
end;

function TControlador.GetTipoResposta: TTipoResposta;
begin
  Result := FTipoResposta;
end;

procedure TControlador.SetTipoResposta(AValue: TTipoResposta);
begin
  FTipoResposta := AValue;
end;

procedure TControlador.RetornaJSON(const ASuperObject: ISuperObject; ALiberadoAcesso: Boolean);
begin
  if ALiberadoAcesso then
    Visao('JSONLiberadoAcesso', '', ASuperObject)
  else
    Visao('JSON', '', ASuperObject);
end;

initialization

  GGUIDControladores := TStringToGUID.Create;
  ProcuraControlador := @ProcuraControladorPadrao;

finalization

  ProcuraControlador := nil;
  FreeAndNil(GGUIDControladores);

end.
