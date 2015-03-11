unit Serasa;

interface

uses
  SysUtils, contnrs, FacMetodos;

const
  ETX = #03;
  CodigoWBAnaSerasa = '5070';
                             //123456789
  CodigoWBAnaSerasaRaizCNPJ = '096425574'; //96.425.574/0001-80

type
  ESerasa = class(Exception);

  TTipoTransacao = string;

  TPeriodicidadeRelato = (prNaoEnvia, prDiario, prSemanal, prQuinzenal,
    prMensal);

  TTipoPessoa = (tpFisica, tpJuridica);

  TTipoMonitoreRetorno = (mrEmail, mrEdi7);

  TTipoComunicacao = (tcLocal, tcComunicacao);

  TTipoRelatorio = (trRelatoSegmento{, trCreditBureau, trSinteseComportamental,
    trConcentre, trAcheiRecheque}, trMonitore);

  TTiposRelatorios = set of TTipoRelatorio;

  ESerasaReturn = class(ESerasa)
  private
    FSQLCode: Integer;
    FReturnCode: Integer;
    FReturnStringCode: string;
    FMensagem: string;
    FTransacao: TTipoTransacao;
  public
    property ReturnCode: Integer read FReturnCode write FReturnCode;
    property ReturnStringCode: string read FReturnStringCode
      write FReturnStringCode;
    property Mensagem: string read FMensagem write FMensagem;
    property SQLCode: Integer read FSQLCode write FSQLCode;
    property Transacao: TTipoTransacao read FTransacao write FTransacao;
  end;

  TSeLogon = string[8];

  TSeComunicacao = class(TObject)
  private
    FLogon: TSeLogon;
    FPassword: TSeLogon;
    FNewPassword: TSeLogon;
  public
    function Get(Se: string): string; virtual;
    function TamanhoMaximo: Integer; virtual; abstract;
    property Logon: TSeLogon read FLogon write FLogon;
    property Password: TSeLogon read FPassword write FPassword;
    property NewPassword: TSeLogon read FNewPassword write FNewPassword;
  end;

  TSerasa = class; //forward

  TSeClasseString = class of TSeString;

  TSeString = class(TObject)
  private
    FSerasa: TSerasa;
    FTextOut: string;
  protected
    function EnviaTransacao: Boolean; virtual;
    function GetText: string; virtual;
    {a string de retorno informa o layout do retorno
    (propriedade "Transacao") a partir de qual posição?}
    function PosicaoTransacaoRetorno: Integer; virtual;
    function TamanhoTransacao: Integer; virtual;
    procedure SetText(const Value: string); virtual;
  public
    constructor Create(ASerasa: TSerasa); virtual;
    class function Transacao: TTipoTransacao; virtual;
    class function ClassePara(Se: string): TSeClasseString; virtual;
    property Serasa: TSerasa read FSerasa;
    property Text: string read GetText write SetText;
    property TextOut: string read FTextOut;
  end;

  ISerasaLog = interface
    ['{DF2698DE-A6EA-47EA-81FE-6B78D2C160E3}']
    procedure Log(const ALog: string);
  end;

  TSerasa = class(TObject)
  private
    FComunicacao: TSeComunicacao;
    FCNPJContrato: string;
    FCNPJFIDC: string;
    FCNPJFIDC2: string;
    FSerasaLog: ISerasaLog;
    FDiasDecorridos: Integer;
    FPeriodicidadeRelato: TPeriodicidadeRelato;
    FDiasMonitore: Integer;
    FMonitoreGrupoEMail: string;
    FTarifaTitulos: Double;
    FMonitoreRetorno: TTipoMonitoreRetorno;
    FPrazoConsulta: Integer;
    FLimpezaSerasLog: Integer;
    FRazaoSocialNaSerasa: string;
    function GetComunicacao: TSeComunicacao;
  protected
    procedure DoSerasaLog(const Log: string);
  public
    constructor Create(AComunicacao: TSeComunicacao);
    destructor Destroy; override;
    function Get(Se: string): string; overload;
    function Get(SeString: TSeString): TSeString; overload;
    function ProximaReciprocidadeRelato(const Ultima: TDateTime): TDateTime;
    function MaximoReciprocidadeRelato(const Ultima: TDateTime): TDateTime;
    property Comunicacao: TSeComunicacao read GetComunicacao write FComunicacao;
    property CNPJContrato: string read FCNPJContrato write FCNPJContrato;
    property CNPJFIDC: string read FCNPJFIDC write FCNPJFIDC;
    property CNPJFIDC2: string read FCNPJFIDC2 write FCNPJFIDC2;
    property SerasaLog: ISerasaLog read FSerasaLog write FSerasaLog;
    property DiasDecorridos: Integer read FDiasDecorridos write FDiasDecorridos;
    property PeriodicidadeRelato: TPeriodicidadeRelato read FPeriodicidadeRelato
      write FPeriodicidadeRelato;
    property DiasMonitore: Integer read FDiasMonitore write FDiasMonitore;
    property MonitoreGrupoEMail: string read FMonitoreGrupoEMail
      write FMonitoreGrupoEMail;
    property MonitoreRetorno: TTipoMonitoreRetorno read FMonitoreRetorno
      write FMonitoreRetorno;
    property TarifaTitulos: Double read FTarifaTitulos write FTarifaTitulos;
    property PrazoConsulta: Integer read FPrazoConsulta write FPrazoConsulta;
    property LimpezaSerasLog: Integer read FLimpezaSerasLog write FLimpezaSerasLog;
    property RazaoSocialNaSerasa: string read FRazaoSocialNaSerasa write FRazaoSocialNaSerasa;
  end;

  TSeItemDetalhes = class(TObject)
  protected
    function GetText: string; virtual; abstract;
    procedure SetText(const Value: string); virtual; abstract;
  public
    property Text: string read GetText write SetText;
  end;

  TClasseSeDetalhes = class of TSeDetalhes;

  TSeDetalhes = class(TSeString)
  private
    FCNPJ: string;  
  protected
    FDetalhes: TObjectList;
    FMais: Boolean;
    function GetDetalhes(Index: Integer): TSeItemDetalhes; virtual;
  public
    constructor Create(ASerasa: TSerasa); override;
    destructor Destroy; override;
    function Adiciona(ADetalhe: TSeItemDetalhes): Integer; virtual;
    procedure Limpa; virtual;
    function Quantidade: Integer; virtual;
    property CNPJ: string read FCNPJ write FCNPJ;
    property Detalhes[Index: Integer]: TSeItemDetalhes read GetDetalhes; default;
    property Mais: Boolean read FMais;
  end;

  //Código da estação no cliente (identificação do terminal ou computador)
  TSeEstacao = class(TSeDetalhes)
  private
    FEstacao: string;
  protected
    function GetText: string; override;
    procedure SetText(const Value: string); override;
  public
    constructor Create(ASerasa: TSerasa); override;
    property Estacao: string read FEstacao write FEstacao;
  end;

  TSeTamanho = class(TSeString)
  protected
    function GetText: string; override;
    class function Tamanho: Integer; virtual;
  end;

  TSeMetodos = class(TFacMetodos)
  public
    class function AAAAMMDDToDate(const Se: string): TDateTime;
    class function AAAAMMToDate(const Se: string): TDateTime;
    class function DateToAAAAMMDD(const Dt: TDateTime): string;
    class function DateToDDMMAAAA(const Dt: TDateTime): string;
    class function DDMMAAAAToDate(const Se: string): TDateTime;
    class function DDPMMPAAAAToDate(const Se: string): TDateTime;
    class function HHMMSSToTime(const Se: string): TDateTime;
    class function HHMMToTime(const Se: string): TDateTime;
    class function HHPMMPSSToTime(const Se: string): TDateTime;
    class function MMAAAAToDate(const Se: string): TDateTime;
    class function SeCNPJ(const CNPJ: string): string;
    class function SeCPF(const CPF: string): string;
    class function SeDVCGC(const CGC: string): string;
    class function SeNum(N: Int64; D: Integer): string; overload;
    class function SeNum(const N: string; D: Integer): string; overload;
    class function SeRaizCNPJ(const CNPJ: string; Tamanho: Integer = 8): string;
    class function SeFilialCNPJ(const CNPJ: string; Tamanho: Integer = 4): string;
    class function SeValor(const Valor: Double; Tamanho: Integer = 15): string;
    class function TipoPessoa(const CNPJ: string): Char;
  end;

procedure AddSeClasseString(ASeClasseString: TSeClasseString); overload;
procedure AddSeClasseString(
  ASeClasseStrings: array of TSeClasseString); overload;
function TemSeClasseString(Tipo: TTipoTransacao): Boolean;
function GetSeClasseString(Tipo: TTipoTransacao): TSeClasseString;

implementation

uses
  cachecod;

{ TSeComunicacao }

function TSeComunicacao.Get(Se: string): string;
begin
  FLogon := TSeMetodos.PoeLetra(FLogon, 8);
  FPassword := TSeMetodos.PoeLetra(FPassword, 8);
  FNewPassword := TSeMetodos.PoeLetra(FNewPassword, 8);
  Result := Logon + Password + NewPassword + Se;
end;

{ TSeString }

class function TSeString.ClassePara(Se: string): TSeClasseString;
begin
  Result := nil;
end;

constructor TSeString.Create(ASerasa: TSerasa);
begin
  inherited Create;
  FSerasa := ASerasa;
  FTextOut := '';
end;

function TSeString.EnviaTransacao: Boolean;
begin
  Result := True;
end;

function TSeString.GetText: string;
begin
  Result := '';
  if EnviaTransacao then
    Result := Result + TSeMetodos.PoeLetra(Transacao, 4);
end;

function TSeString.PosicaoTransacaoRetorno: Integer;
begin
  Result := 1;
end;

procedure TSeString.SetText(const Value: string);
begin
  FTextOut := Value;
  if Copy(Value, PosicaoTransacaoRetorno, TamanhoTransacao) <>
    Transacao then
    raise ESerasa.CreateFmt('String %s não corresponde ao layout %s',
      [Copy(Value, 1, TamanhoTransacao), Transacao]);
end;

function TSeString.TamanhoTransacao: Integer;
begin
  Result := 4;
end;

class function TSeString.Transacao: TTipoTransacao;
begin
  Result := '????';
end;

{ TSerasa }

constructor TSerasa.Create(AComunicacao: TSeComunicacao);
begin
  inherited Create;
  FComunicacao := AComunicacao;
end;

function TSerasa.Get(Se: string): string;

  function Limpa(Se: string): string;
  var
    laco: Integer;
  begin
    Result := Se;
    for laco := 1 to Length(Result) do
      if not (Result[laco] in [' '..#126, #128..#254]) then
        Result[laco] := ' ';
  end;

begin
  DoSerasaLog('I:' + Se);
  Result := Limpa(Comunicacao.Get(Se));
  DoSerasaLog('O:' + Result);
end;

procedure TSerasa.DoSerasaLog(const Log: string);
begin
  if Assigned(FSerasaLog) then
    FSerasaLog.Log(Log);
end;

function TSerasa.Get(SeString: TSeString): TSeString;
var
  Tipo, Aux: string;
  C, C2: TSeClasseString;
begin
  Result := nil;
  Aux := SeString.Text;
  Tipo := Copy(Aux, 1, SeString.TamanhoTransacao);
  if not TemSeClasseString(Tipo) then
    raise ESerasa.CreateFmt(
      'Layout Serasa não registrado "%s". Registre antes de usar.', [Tipo]);
  Aux := Get(Aux);
  if Aux <> '' then
  begin
    Tipo := Copy(Aux, SeString.PosicaoTransacaoRetorno,
      SeString.TamanhoTransacao);
    if not TemSeClasseString(Tipo) then
      raise ESerasa.CreateFmt(
        'Layout Serasa não registrado "%s". ' +
        'Não foi possível tratar o retorno: %s', [Tipo, Aux]);
    C := GetSeClasseString(Tipo);
    C2 := C.ClassePara(Aux);
    if C2 <> nil then
      C := C2;
    Result := C.Create(Self);
    try
      Result.Text := Aux;
    except
      FreeAndNil(Result);
      raise;
    end;
  end;
end;

function TSerasa.GetComunicacao: TSeComunicacao;
begin
  if not Assigned(FComunicacao) then
    raise ESerasa.Create('SERASA: Comunicação não está definida');
  Result := FComunicacao;
end;

{ Registro do Tipo de Classe de SeString }

type
  TItemSeClasseString = class(TString)
    Classe: TSeClasseString;
  end;

  TListaSeClasseString = class(TCacheString)
  private
    function GetSeClasseString: TSeClasseString;
    procedure SetSeClasseString(const Value: TSeClasseString);
  public
    constructor Create;
    property Classe: TSeClasseString read GetSeClasseString
      write SetSeClasseString;
  end;

function TSerasa.ProximaReciprocidadeRelato(
  const Ultima: TDateTime): TDateTime;
var
  a, m, d: Word;
begin
  case FPeriodicidadeRelato of
    prDiario: Result := Ultima + 1;
    prSemanal: Result := Ultima + 7;
    prQuinzenal: Result := Ultima + 15;
    prMensal:
    begin
      DecodeDate(IncMonth(Ultima, 1), a, m, d);
      Result := EncodeDate(a, m, 1);
    end;
  else
    Result := 0;
  end;
end;

function TSerasa.MaximoReciprocidadeRelato(
  const Ultima: TDateTime): TDateTime;
var
  a, m, d: Word;
begin
  case FPeriodicidadeRelato of
    prDiario: Result := Ultima + 3;
    prSemanal: Result := Ultima + 10;
    prQuinzenal: Result := Ultima + 18;
    prMensal:
    begin
      DecodeDate(IncMonth(Ultima, 1), a, m, d);
      Result := EncodeDate(a, m, 10);
    end;
  else
    Result := 0;
  end;
end;

destructor TSerasa.Destroy;
begin
  {(Douglas 09/2006) o ponteiro do objeto FComunicação é passado por parâmetro do
  construtor de TSerasa pelo método SerasaINI.TSerasaIni.CreateSerasaINI}
  FComunicacao.Free;
  inherited;
end;

{ TListaSeClasseString }

constructor TListaSeClasseString.Create;
begin
  inherited;
  FClasse := TItemSeClasseString;
end;

function TListaSeClasseString.GetSeClasseString: TSeClasseString;
begin
  Result := (FObjeto as TItemSeClasseString).Classe;
end;

procedure TListaSeClasseString.SetSeClasseString(
  const Value: TSeClasseString);
begin
  (FObjeto as TItemSeClasseString).Classe := Value;
end;

{ Funcoes }

var
  GListaSeClasseString: TListaSeClasseString;

procedure AddSeClasseString(ASeClasseString: TSeClasseString); overload;
begin
  GListaSeClasseString.Codigo := ASeClasseString.Transacao;
  GListaSeClasseString.Classe := ASeClasseString;
end;

procedure AddSeClasseString(
  ASeClasseStrings: array of TSeClasseString); overload;
var
  laco: Integer;
begin
  for laco := Low(ASeClasseStrings) to High(ASeClasseStrings) do
    AddSeClasseString(ASeClasseStrings[laco]);
end;

function TemSeClasseString(Tipo: TTipoTransacao): Boolean;
begin
  Result := GListaSeClasseString.TemCodigo(Tipo);
end;

function GetSeClasseString(Tipo: TTipoTransacao): TSeClasseString;
begin
  GListaSeClasseString.Codigo := Tipo;
  Result := GListaSeClasseString.Classe;
end;

{ TSeEstacao }

constructor TSeEstacao.Create(ASerasa: TSerasa);
begin
  inherited;
  FEstacao := '000000';
end;

function TSeEstacao.GetText: string;
begin
  Result := (inherited GetText);
  Result := Result + TSeMetodos.PoeLetra(FEstacao, 6);
end;

procedure TSeEstacao.SetText(const Value: string);
begin
  inherited;
  FEstacao := Copy(Value, PosicaoTransacaoRetorno + 4, 6);
end;

{ TSeTamanho }

function TSeTamanho.GetText: string;
begin
  Result := (inherited GetText) + TSeMetodos.SeNum(Tamanho, 4);
end;

class function TSeTamanho.Tamanho: Integer;
begin
  Result := 4;
end;

{ TSeMetodos }

class function TSeMetodos.AAAAMMDDToDate(const Se: string): TDateTime;
var
  d: Integer;
begin
  if (Se = '00000000') or (Trim(Se) = '') then
    Result := 0
  else
  {a Serasa pode enviar datas "99999999", ao menos na base de
  dados de teste. Tais valores não podem ser convertidos em datas. Por isto
  adiciono o bloco try.. except.}
    try
      {a Serasa pode não informar o dia, mas sim informando o
      ano e o mês. Presumirei que é o 1º dia.}
      d := StrToIntDef(Copy(Se, 7, 2), 0);
      if d = 0 then
        Inc(d);
      Result := EncodeDate(StrToIntDef(Copy(Se, 1, 4), 0),
        StrToIntDef(Copy(Se, 5, 2), 0), d);
      {a Serasa enviou uma data "00371108", na base de produção,
      o que resultou na data -680133. Portanto, jogo zero para datas negativas.}
      if Result < 0 then
        Result := 0;
    except
      Result := 0;
    end;
end;

class function TSeMetodos.AAAAMMToDate(const Se: string): TDateTime;
begin
  Result := AAAAMMDDToDate(Se + '00');
end;

class function TSeMetodos.DateToAAAAMMDD(const Dt: TDateTime): string;
begin
  if Dt = 0 then
    Result := '00000000'
  else
    Result := FormatDateTime('YYYYMMDD', Dt);
end;

class function TSeMetodos.DateToDDMMAAAA(const Dt: TDateTime): string;
begin
  if Dt = 0 then
    Result := '00000000'
  else
    Result := FormatDateTime('DDMMYYYY', Dt);
end;

class function TSeMetodos.DDMMAAAAToDate(const Se: string): TDateTime;
var
  d: Integer;
begin
  if (Se = '00000000') or (Trim(Se) = '') then
    Result := 0
  else
  {a Serasa pode enviar datas "99999999", ao menos na base de
  dados de teste. Tais valores não podem ser convertidos em datas. Por isto
  adiciono o bloco try.. except.}
    try
      {a Serasa pode não informar o dia, mas sim informando o
      ano e o mês. Presumirei que é o 1º dia.}
      d := StrToIntDef(Copy(Se, 1, 2), 0);
      if d = 0 then
        Inc(d);
      Result := EncodeDate(StrToIntDef(Copy(Se, 5, 4), 0),
        StrToIntDef(Copy(Se, 3, 2), 0), d);
    except
      Result := 0;
    end;
end;

class function TSeMetodos.DDPMMPAAAAToDate(const Se: string): TDateTime;
begin
  if Trim(Se) = '' then
    Result := 0
  else
    Result := EncodeDate(StrToIntDef(Copy(Se, 7, 4), 0),
      StrToIntDef(Copy(Se, 4, 2), 0), StrToIntDef(Copy(Se, 1, 2), 0));
end;

class function TSeMetodos.HHMMSSToTime(const Se: string): TDateTime;
var
  s: Integer;
begin
  if (Se = '000000') or (Trim(Se) = '') then
    Result := 0
  else
  {a Serasa pode enviar datas "99999999", ao menos na base de
  dados de teste. Tais valores não podem ser convertidos em datas. Por isto
  adiciono o bloco try.. except.}
    try
      s := StrToIntDef(Copy(Se, 5, 2), 0);
      Result := EncodeTime(StrToIntDef(Copy(Se, 1, 2), 0),
        StrToIntDef(Copy(Se, 3, 2), 0), s, 0);
    except
      Result := 0;
    end;
end;

class function TSeMetodos.HHMMToTime(const Se: string): TDateTime;
begin
  Result := HHMMSSToTime(Se + '00');
end;

class function TSeMetodos.HHPMMPSSToTime(const Se: string): TDateTime;
begin
  if Trim(Se) = '' then
    Result := 0
  else
    Result := EncodeTime(StrToIntDef(Copy(Se, 1, 2), 0),
      StrToIntDef(Copy(Se, 4, 2), 0), StrToIntDef(Copy(Se, 7, 2), 0), 0);
end;

class function TSeMetodos.MMAAAAToDate(const Se: string): TDateTime;
begin
  Result := DDMMAAAAToDate('00' + Se);
end;

class function TSeMetodos.SeCNPJ(const CNPJ: string): string;
begin
  Result := PoeLetraEsq(SoNumero(CNPJ), 15, '0');
end;

class function TSeMetodos.SeCPF(const CPF: string): string;
begin
  Result := PoeLetraEsq(SoNumero(CPF), 11, '0');
end;

class function TSeMetodos.SeNum(N: Int64; D: Integer): string;
begin
  Result := SeNum(IntToStr(N), D);
end;

class function TSeMetodos.SeDVCGC(const CGC: string): string;
begin
  Result := SeNum(Copy(CGC, Length(CGC) - 1, 2), 2);
end;

class function TSeMetodos.SeNum(const N: string; D: Integer): string;
begin
  Result := PoeLetraEsq(N, D, '0');
end;

class function TSeMetodos.SeRaizCNPJ(const CNPJ: string;
  Tamanho: Integer): string;
begin
  Result := SeNum(Copy(CNPJ, 1, Length(CNPJ) - 6), Tamanho);
end;

class function TSeMetodos.SeFilialCNPJ(const CNPJ: string;
  Tamanho: Integer): string;
begin
  Result := SeNum(Copy(CNPJ, 9, 4), Tamanho);
end;

class function TSeMetodos.SeValor(const Valor: Double;
  Tamanho: Integer): string;
begin
  Result := PoeLetraEsq(FloatToStr(Int(Valor * 100 + 0.5)), Tamanho, '0');
end;

class function TSeMetodos.TipoPessoa(const CNPJ: string): Char;
begin
  if TSeMetodos.PessoaJuridica(CNPJ) then
    Result := 'J'
  else
    Result := 'F';
end;

{ TSeDetalhes }

function TSeDetalhes.Adiciona(ADetalhe: TSeItemDetalhes): Integer;
begin
  Result := FDetalhes.Add(ADetalhe);
end;

constructor TSeDetalhes.Create(ASerasa: TSerasa);
begin
  inherited;
  FDetalhes := TObjectList.Create;
end;

destructor TSeDetalhes.Destroy;
begin
  FDetalhes.Free;
  inherited;
end;

function TSeDetalhes.GetDetalhes(Index: Integer): TSeItemDetalhes;
begin
  Result := FDetalhes[Index] as TSeItemDetalhes;
end;

procedure TSeDetalhes.Limpa;
begin
  FDetalhes.OwnsObjects := False;
  FDetalhes.Clear;
  FDetalhes.OwnsObjects := True;
end;

function TSeDetalhes.Quantidade: Integer;
begin
  Result := FDetalhes.Count;
end;

initialization

  GListaSeClasseString := TListaSeClasseString.Create;

finalization

  FreeAndNil(GListaSeClasseString);

end.
