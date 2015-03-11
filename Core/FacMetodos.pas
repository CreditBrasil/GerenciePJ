unit FacMetodos;

{esta biblioteca segue o mesmo conceito da unit Metodos.
Porém, aqui são definidos métodos para tratamento de informações específicas,
como tipo de pessoa (física ou jurídica).}

interface

uses
  SysUtils, Metodos, csvstrings, Windows, Math;

type
  TFacMetodos = class(TMetodos)
  public
    class function PessoaJuridica(const ACNPJ: string): Boolean;
    class function RaizCNPJ(const ACNPJ: string): string;
    class function CalculaDigitoVerificadorCnpjCpf(const ACnpjCpfSemDigito: string; ACpf: Boolean): string;
    class function CEPFormatado(const ACEP: string): string;
    class function ChecaDigitoVerificadorCnpjCpf(const ACnpjCpf: string): Boolean;
    class function CodigoDeBarrasBoletoValido(const ACodigoDeBarras: string): Boolean;
    class procedure CodigoDeBarrasParaLinhaDigitadaBoleto(const ACodigoDeBarras: string; out Campo1, Campo2, Campo3,
      Campo4, Campo5, Campo6, Campo7, Campo8: string);
    class function ColocaPontos(const CGC: string; ComTexto: Boolean = False): string;
    class function IsEMailsValidos(const AEMails: string): Boolean;
    class function IsEMailValido(const AEMail: string): Boolean;
    class function LinhaDigitadaBoletoParaCodigoDeBarras(const Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7,
      Campo8: string): string;
    class function LinhaDigitadaBoletoValida(const Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7,
      Campo8: string): Boolean;
    class function Modulo10Boleto(const Entrada: string): string;
    class function Modulo11Boleto(const Entrada: string): string;
    class procedure SeparaDDDTelefone(const ADDDTelefone: string; out ADDD: string; out ATelefone: string);
    class function Crypt(const Senha: string): string;
    class function UnCrypt(const Senha: string): string;
    class function CodigoDeGerenteValido(const ACodigoDeGerente: string): Boolean;
    class function CodigoDeOperacaoValido(const ACodigoDeOperacao: string): Boolean;
    class function CodigoDeUsuarioValido(const ACodigoDeUsuario: string): Boolean;
    class procedure TrataCharEmCampoDeCodigoDeOperacao(var Key: Char);
    class function TrocaPontoVirgula(const Valor: string): string;
    class procedure SoNumeroValidaKey(var Key: Char);
    class procedure SoNumeroeVirgulaValidaKey(var Key: Char);
    class function EscondeValoresMonetarios(const ATexto: string; AByPass: Boolean = False): string;
    class function TrocaVirgulaPorPonto(const AValor: Currency; ATamanho: Integer;
      QuantidadeDeDecimais: Integer): string; overload;
    class function TrocaVirgulaPorPonto(const ATexto: string; ATamanho: Integer): string; overload;
    class function TrocaVirgulaPorPonto(const AValor: Double; QuantidadeDeDecimais: Integer): string; overload;
    class function ObterJuros(const AValor, ANPeriodo, ANTaxa: Extended): Extended;
    class function TaxaEquivalente(const ATaxaDe, APeriodo, APeriodoDesejado: Extended): Extended;
    class function TaxaEquivalenteMes(ATaxaDe, APeriodo: Extended): Extended;
    class function EnderecoFormatado(const ALogradouro, AEndereco, ANumero, AComplemento: string): string; overload;
    class function EnderecoFormatado(const ALogradouro, AEndereco, ANumero, AComplemento, ABairro,
      ACidade, AEstado, ACep: string; const APadraoCorreios: Boolean): string; overload;
  end;

resourcestring
  CodigoDeGerenteInvalido = 'Código de Gerente deve ser formado 999 (3 dígitos de 0 a 9)';
  CodigoDeOperacaoInvalido = 'Código de Operação deve ser formado 9XX (primeiro dígito de 0 a 9 e os outros 2 podem ser números ou letras)';
  CodigoDeUsuarioInvalido = 'Código de Usuário deve ser formado 999 (3 dígitos de 0 a 9)';
  EmailsInvalidos = 'E-mail(s) inválido(s),'#13#10'Digite o(s) e-mail(s) conforme exemplo:'#13#10'jefferson@wba.com.br; ferreira@wba.com.br';
  EmailInvalido = 'E-mail inválido,'#13#10'Digite o e-mail conforme exemplo:'#13#10'carlinhos@wba.com.br';

implementation

const
  CryptOriginal = '1234567890-=qwertyuiop´[asdfghjklç~]\zxcvbnm,.;/!@#$%¨&*()_+QWERTYUIOP`{ASDFGHJKLÇ^}|ZXCVBNM<>:?"''';
  CryptEmbralho = '[´poiuytrewq]~çlkjhgfdsa/;.,mnbvcxz\=-0987654321{`POIUYTREWQ}^ÇLKJHGFDSA?:><MNBVCXZ|+_)(*&¨%$#@!''"';
  Numeros = ['0'..'9'];
  NumerosELetrasMaiusculas = ['0'..'9', 'A'..'Z'];
  NumerosELetrasMaiusculasEMinusculas = ['0'..'9', 'A'..'Z', 'a'..'z'];

{ TFacMetodos }

class function TFacMetodos.CalculaDigitoVerificadorCnpjCpf(const ACnpjCpfSemDigito: string; ACpf: Boolean): string;
var
  S1, S2: Integer;
  V, I, M1, M2: Integer;
  L: string;
  D1, D2: Integer;
begin
  //Alex - 10/07/2010 - Cópia da função CGCCPFDV da mFunctions
  Result := '00';
  S1 := 0;
  S2 := 0;
  M2 := 2;
  for I := Length(ACnpjCpfSemDigito) downto 1 do
  begin
    L := Copy(ACnpjCpfSemDigito, I, 1);
    if StrToInt(L) in [0..9] then
    begin
      M1 := M2;
      if ACpf or (M2 < 9) then
        M2 := M2 + 1
      else
        M2 := 2;
      V := StrToInt(L);
      S1 := S1 + (V * M1);
      S2 := S2 + (V * M2);
    end;
  end;
  S1 := S1 mod 11;
  if S1 < 2 then
    D1 := 0
  else
    D1 := 11 - S1;
  S2 := (S2 + 2 * D1) mod 11;
  if S2 < 2 then
    D2 := 0
  else
    D2 := 11 - S2;
  Result := IntToStr(D1) + IntToStr(D2);
end;

class function TFacMetodos.CEPFormatado(const ACEP: string): string;
begin
  Result := SoNumero(ACEP);
  if Result > '' then
  begin
    Result := PoeLetraEsq(Result, 8, '0');
    Result := Copy(Result, 1, 5) + '-' + Copy(Result, 6, 3);
  end;
end;

class function TFacMetodos.ChecaDigitoVerificadorCnpjCpf(const ACnpjCpf: string): Boolean;
var
  LSoNumero: string;
  LDigitoVerificadorInformado: string;
  LTamanho: Integer;
begin
  LSoNumero := TFacMetodos.SoNumero(ACnpjCpf);
  LDigitoVerificadorInformado := Copy(LSoNumero, Length(LSoNumero) - 1, 2);
  LSoNumero := Copy(LSoNumero, 1, Length(LSoNumero) - 2);
  LTamanho := Length(LSoNumero);
  if LTamanho = 9 then
    Result := LDigitoVerificadorInformado = CalculaDigitoVerificadorCnpjCpf(LSoNumero, True)
  else if (LTamanho = 12) or (LTamanho = 13) then
    Result := LDigitoVerificadorInformado = CalculaDigitoVerificadorCnpjCpf(LSoNumero, False)
  else
    Result := False;
end;

class function TFacMetodos.CodigoDeBarrasBoletoValido(const ACodigoDeBarras: string): Boolean;
begin
  Result := (Length(ACodigoDeBarras) = 44) and (Modulo11Boleto(Copy(ACodigoDeBarras, 1, 4) +
    Copy(ACodigoDeBarras, 6, MaxInt)) = Copy(ACodigoDeBarras, 5, 1));
end;

class procedure TFacMetodos.CodigoDeBarrasParaLinhaDigitadaBoleto(const ACodigoDeBarras: string; out Campo1, Campo2,
  Campo3, Campo4, Campo5, Campo6, Campo7, Campo8: string);
var
  LBBB, LM, LD, LFFFF, LVVVVVVVVVV, LLLLLLLLLLLLLLLLLLLLLLLLLL: string;
begin
{          11111111112222222222333333333344444
  12345678901234567890123456789012345678901234
  BBBMDFFFFVVVVVVVVVVLLLLLLLLLLLLLLLLLLLLLLLLL

  Sendo:
  BBB: Código do banco
  M: Código da Moeda
  D: DV Código de Barras (módulo 11)
  FFFF: Fator do Vencimento
  VVVVVVVVVV: Valor do Título
  LLLLLLLLLLLLLLLLLLLLLLLLL: Campo Livre}

  LBBB := Copy(ACodigoDeBarras, 1, 3);
  LM := Copy(ACodigoDeBarras, 4, 1);
  LD := Copy(ACodigoDeBarras, 5, 1);
  LFFFF := Copy(ACodigoDeBarras, 6, 4);
  LVVVVVVVVVV := Copy(ACodigoDeBarras, 10, 10);
  LLLLLLLLLLLLLLLLLLLLLLLLLL := Copy(ACodigoDeBarras, 20, 25);

{ 12345 12345 12345 123456 12345 123456 1 12345678901234
  BBBML.LLLL1 LLLLL.LLLLL2 LLLLL.LLLLL3 D FFFFVVVVVVVVVV

  Sendo:
  1: Modulo 10 de BBBMLLLLL (primeiro bloco)
  2: Modulo 10 de LLLLLLLLLL (segundo bloco)
  3: Modulo 10 de LLLLLLLLLL (terceiro bloco)}

  Campo1 := LBBB + LM + Copy(LLLLLLLLLLLLLLLLLLLLLLLLLL, 1, 1);
  Campo2 := Copy(LLLLLLLLLLLLLLLLLLLLLLLLLL, 2, 4);
  Campo2 := Campo2 + Modulo10Boleto(Campo1 + Campo2);
  Campo3 := Copy(LLLLLLLLLLLLLLLLLLLLLLLLLL, 6, 5);
  Campo4 := Copy(LLLLLLLLLLLLLLLLLLLLLLLLLL, 11, 5);
  Campo4 := Campo4 + Modulo10Boleto(Campo3 + Campo4);
  Campo5 := Copy(LLLLLLLLLLLLLLLLLLLLLLLLLL, 16, 5);
  Campo6 := Copy(LLLLLLLLLLLLLLLLLLLLLLLLLL, 21, 5);
  Campo6 := Campo6 + Modulo10Boleto(Campo5 + Campo6);
  Campo7 := LD;
  Campo8 := LFFFF + LVVVVVVVVVV;
end;

class function TFacMetodos.CodigoDeGerenteValido(const ACodigoDeGerente: string): Boolean;
begin
  Result := (Length(ACodigoDeGerente) = 3) and
    (ACodigoDeGerente[1] in Numeros) and
    (ACodigoDeGerente[2] in Numeros) and
    (ACodigoDeGerente[3] in Numeros);
end;

class function TFacMetodos.CodigoDeOperacaoValido(const ACodigoDeOperacao: string): Boolean;
begin
  Result := (Length(ACodigoDeOperacao) = 3) and
    (ACodigoDeOperacao[1] in Numeros) and
    (ACodigoDeOperacao[2] in NumerosELetrasMaiusculas) and
    (ACodigoDeOperacao[3] in NumerosELetrasMaiusculas);
end;

class function TFacMetodos.CodigoDeUsuarioValido(const ACodigoDeUsuario: string): Boolean;
begin
  Result := (Length(ACodigoDeUsuario) in [1..3]) and
    (ACodigoDeUsuario[1] in NumerosELetrasMaiusculasEMinusculas) and
    ((Length(ACodigoDeUsuario) < 2) or (ACodigoDeUsuario[2] in NumerosELetrasMaiusculasEMinusculas)) and
    ((Length(ACodigoDeUsuario) < 3) or (ACodigoDeUsuario[3] in NumerosELetrasMaiusculasEMinusculas));
end;

class function TFacMetodos.ColocaPontos(const CGC: string; ComTexto: Boolean): string;
var
  laco: integer;
  dv, nr, texto: string;
begin
  Result := CGC;
  // retirar todos os (.,/-)
  nr := '';
  texto := '';
  for laco := 1 to length( CGC ) do
  begin
    if CGC[laco] in [ '0'..'9' ] then
    begin
      nr := nr + CGC[laco];
      texto := '';
    end;
    if UpCase(CGC[laco]) in ['A'..'Z'] then
      texto := texto + UpCase(CGC[laco]);
  end;
  dv := copy( nr, length( nr ) - 1, 2 );
  nr := copy( nr, 1, length( nr ) - 2 );
  if length( nr ) = 9 then
  begin
    if dv = CalculaDigitoVerificadorCnpjCpf(nr, True) then
      Result := Copy(nr, 1, 3) + '.' + Copy(nr, 4, 3) + '.' + Copy(nr, 7, 3)
                + '-' + dv;
    if ComTexto and (texto <> '') then
      Result := Result + texto;
  end;
  if length( nr ) = 12 then
    if dv = CalculaDigitoVerificadorCnpjCpf(nr, False) then
      Result := Copy(nr, 1, 2) + '.' + Copy(nr, 3, 3) + '.' + Copy(nr, 6, 3)
                + '/' + Copy(nr, 9, 4) + '-' + dv;
  if length( nr ) = 13 then
  begin
    if dv = CalculaDigitoVerificadorCnpjCpf(nr, False) then
      Result := Copy(nr, 1, 3) + '.' + Copy(nr, 4, 3) + '.' + Copy(nr, 7, 3)
                + '/' + Copy(nr, 10, 4) + '-' + dv;
    if Result[1] = '0' then
      Delete(Result, 1, 1);
  end;
end;

class function TFacMetodos.Crypt(const Senha: string): string;
var
  laco, P: Integer;
begin
  for laco := 1 to Length(Senha) do
  begin
    P := Pos(Senha[laco], CryptOriginal);
    if P > 0 then
      Result := Result + CryptEmbralho[P]
    else
      Result := Result + Senha[laco];
  end;
end;

class function TFacMetodos.EnderecoFormatado(const ALogradouro, AEndereco,
  ANumero, AComplemento: string): string;
begin
  Result := '';
  if Trim(ALogradouro) <> '' then
    Result := Result + Trim(ALogradouro) + ' ';
  if Trim(AEndereco) <> '' then
    Result := Trim(Result + AEndereco);
  if Trim(ANumero) <> '' then
    Result := Result + ', ' + ANumero;
  if Trim(AComplemento) <> '' then
    Result := Result + ' ' + AComplemento;
  Result := Trim(Result);
end;

class function TFacMetodos.EnderecoFormatado(const ALogradouro, AEndereco,
  ANumero, AComplemento, ABairro, ACidade, AEstado, ACep: string; const APadraoCorreios: Boolean): string;
begin
  // Seguido Padrão Correios conforme Link
  //http://www.correios.com.br/para-voce/precisa-de-ajuda/como-enderecar-cartas-e-encomendas
  Result := EnderecoFormatado(ALogradouro, AEndereco, ANumero, AComplemento);
  if Trim(ABairro) <> '' then
    Result := Result + ' ' + ABairro;
  if APadraoCorreios then
    Result := Result + #13+#10;
  if Trim(ACep) <> '' then
    Result := Result + ' ' + ACep;
  if Trim(ACidade) <> '' then
    Result := Result + ' ' + ACidade;
  if Trim(AEstado) <> '' then
    Result := Result + ' - ' + AEstado;
end;

class function TFacMetodos.EscondeValoresMonetarios(const ATexto: string; AByPass: Boolean): string;
var
  i, f, LTamanho, LQuantidadeDeVirgula, LQuantidadeDeNumerosAposVirgula: Integer;
begin
  if AByPass then
    Result := ATexto
  else
  begin
    i := 1;
    LTamanho := Length(ATexto);
    LQuantidadeDeVirgula := 0;
    LQuantidadeDeNumerosAposVirgula := 0;
    while (i <= LTamanho) and not (ATexto[i] in Numeros) do
      Inc(i);
    if i > LTamanho then
      Result := ATexto
    else
    begin
      f := i;
      while ((f + 1) <= LTamanho) and ((ATexto[f + 1] in Numeros) or ((LQuantidadeDeVirgula < 1) and
        (ATexto[f + 1] in [ThousandSeparator, DecimalSeparator]))) do
      begin
        if ATexto[f + 1] = DecimalSeparator then
          Inc(LQuantidadeDeVirgula)
        else if (LQuantidadeDeVirgula = 1) and (ATexto[f + 1] in Numeros) then
          Inc(LQuantidadeDeNumerosAposVirgula)
        else
          LQuantidadeDeNumerosAposVirgula := 0;
        Inc(f);
      end;
      if LQuantidadeDeNumerosAposVirgula = CurrencyDecimals then
        Result := Copy(ATexto, 1, i - 1) + '*' + DecimalSeparator + StringOfChar('*', CurrencyDecimals) +
          EscondeValoresMonetarios(Copy(ATexto, f + 1, MaxInt))
      else
        Result := Copy(ATexto, 1, f) + EscondeValoresMonetarios(Copy(ATexto, f + 1, MaxInt));
    end;
  end;
end;

class function TFacMetodos.IsEMailsValidos(const AEMails: string): Boolean;
var
  emails: TCSVStringList;
  laco: Integer;
begin
  emails := TCSVStringList.Create;
  try
    emails.CSVText := AEmails;
    Result := emails.Count > 0;
    for laco := 0 to emails.Count - 1 do
      if not IsEMailValido(SysUtils.Trim(emails[laco])) then
      begin
        Result := False;
        Break;
      end;
  finally
    emails.Free;
  end;
end;

class function TFacMetodos.IsEMailValido(const AEMail: string): Boolean;
const
  V = ['a'..'z', 'A'..'Z', '0'..'9', '_', '-', '+'];
  VPonto = V + ['.'];
var
  email: string;

  function Proximo: Char;
  begin
    if email <> '' then
    begin
      Result := email[1];
      Delete(email, 1, 1);
    end
    else
      Result := #0;
  end;

  function Estado1(ALetra: Char; var Valido: Boolean): Integer;
  begin
    if ALetra in VPonto then
      Result := 2
    else
      Result := 9;
  end;

  function Estado2(ALetra: Char; var Valido: Boolean): Integer;
  begin
    if ALetra in VPonto then
      Result := 2
    else if ALetra = '@' then
      Result := 3
    else
      Result := 9;
  end;

  function Estado3(ALetra: Char; var Valido: Boolean): Integer;
  begin
    if ALetra in V then
      Result := 4
    else
      Result := 9;
  end;

  function Estado4(ALetra: Char; var Valido: Boolean): Integer;
  begin
    if ALetra in V then
      Result := 5
    else
      Result := 9;
  end;

  function Estado5(ALetra: Char; var Valido: Boolean): Integer;
  begin
    if ALetra in V then
      Result := 5
    else if ALetra = '.' then
      Result := 6
    else
      Result := 9;
  end;

  function Estado6(ALetra: Char; var Valido: Boolean): Integer;
  begin
    if ALetra in V then
      Result := 7
    else
      Result := 9;
  end;

  function Estado7(ALetra: Char; var Valido: Boolean): Integer;
  begin
    if ALetra in V then
      Result := 8
    else
      Result := 9;
  end;

  function Estado8(ALetra: Char; var Valido: Boolean): Integer;
  begin
    if ALetra in V then
      Result := 8
    else if ALetra = '.' then
      Result := 6
    else if ALetra = #0 then
    begin
      Valido := True;
      Result := 9;
    end
    else
      Result := 9;
  end;

type
  TTestaEstado = function(ALetra: Char; var Valido: Boolean): Integer;
var
  TestaEstado: array [1..8] of TTestaEstado;
  estado: Integer;
begin
  TestaEstado[1] := @Estado1;
  TestaEstado[2] := @Estado2;
  TestaEstado[3] := @Estado3;
  TestaEstado[4] := @Estado4;
  TestaEstado[5] := @Estado5;
  TestaEstado[6] := @Estado6;
  TestaEstado[7] := @Estado7;
  TestaEstado[8] := @Estado8;
  email := AEMail;
  Result := False;
  estado := 1;
  while estado < 9 do
    estado := TestaEstado[estado](Proximo, Result);
end;

class function TFacMetodos.LinhaDigitadaBoletoParaCodigoDeBarras(const Campo1, Campo2, Campo3, Campo4, Campo5, Campo6,
  Campo7, Campo8: string): string;
var
  LBBB, LM, LD, LFFFF, LVVVVVVVVVV, LLLLLLLLLLLLLLLLLLLLLLLLLL: string;
begin
  LBBB := Copy(Campo1, 1, 3);
  LM := Copy(Campo1, 4, 1);
  LD := Copy(Campo7, 1, 1);
  LFFFF := Copy(Campo8, 1, 4);
  LVVVVVVVVVV := Copy(Campo8, 5, 10);
  LLLLLLLLLLLLLLLLLLLLLLLLLL := Copy(Campo1, 5, 1) + Copy(Campo2, 1, 4) + Copy(Campo3, 1, 5) + Copy(Campo4, 1, 5) +
    Copy(Campo5, 1, 5) + Copy(Campo6, 1, 5);
  Result := LBBB + LM + LD + LFFFF + LVVVVVVVVVV + LLLLLLLLLLLLLLLLLLLLLLLLLL;
end;

class function TFacMetodos.LinhaDigitadaBoletoValida(const Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7,
  Campo8: string): Boolean;
begin
  Result := False;
  if (Length(Campo1) <> 5) or (Length(Campo2) <> 5) or (Length(Campo3) <> 5) or (Length(Campo4) <> 6) or
    (Length(Campo5) <> 5) or (Length(Campo6) <> 6) or (Length(Campo7) <> 1) or (Length(Campo8) <> 14) then
    Exit;
  if Modulo10Boleto(Copy(Campo1, 1, 5) + Copy(Campo2, 1, 4)) <> Copy(Campo2, 5, 1) then
    Exit;
  if Modulo10Boleto(Copy(Campo3, 1, 5) + Copy(Campo4, 1, 5)) <> Copy(Campo4, 6, 1) then
    Exit;
  if Modulo10Boleto(Copy(Campo5, 1, 5) + Copy(Campo6, 1, 5)) <> Copy(Campo6, 6, 1) then
    Exit;
  Result := CodigoDeBarrasBoletoValido(LinhaDigitadaBoletoParaCodigoDeBarras(Campo1, Campo2, Campo3, Campo4, Campo5,
    Campo6, Campo7, Campo8));
end;

class function TFacMetodos.Modulo10Boleto(const Entrada: string): string;
const
  UmDois: array [Boolean] of Integer = (1, 2);
var
  LSoma, laco, LResto, LFator: Integer;
  LEntrada, LDigitos: string;
begin
  LEntrada := SoNumero(Entrada);
  if Trim(LEntrada) = '' then
    Result := ''
  else
  begin
    LSoma := 0;
    LDigitos := '';
    for laco := 1 to Length(LEntrada) do
    begin
      LFator := UmDois[Odd(Length(LEntrada) - laco + 1)];
      LDigitos := LDigitos + IntToStr(StrToInt(LEntrada[laco]) * LFator);
    end;
    for laco := 1 to Length(LDigitos) do
      LSoma := LSoma + StrToInt(LDigitos[laco]);
    LResto := LSoma mod 10;
    if LResto = 0 then
      Result := '0'
    else
      Result := IntToStr(10 - LResto);
  end;
end;

class function TFacMetodos.Modulo11Boleto(const Entrada: string): string;
var
  LSoma, laco, LDV, LFator: Integer;
  LEntrada: string;
begin
  LEntrada := SoNumero(Entrada);
  if Trim(LEntrada) = '' then
    Result := ''
  else
  begin
    LSoma := 0;
    for laco := 1 to Length(LEntrada) do
    begin
      LFator := (Length(LEntrada) - laco) mod 8 + 2;
      LSoma := LSoma + StrToInt(LEntrada[laco]) * LFator;
    end;
    LDV := 11 - LSoma mod 11;
    if LDV in [0, 1, 10, 11] then
      Result := '1'
    else
      Result := IntToStr(LDV);
  end;
end;

class function TFacMetodos.ObterJuros(const AValor, ANPeriodo, ANTaxa: Extended): Extended;
begin
  Result := AValor * (Power(ANTaxa / 100 + 1, ANPeriodo) - 1);
end;

class function TFacMetodos.PessoaJuridica(const ACNPJ: string): Boolean;
begin
  {(Edgar 08/07/2006) se o CNPJ tiver mais de 11 dígitos, ou se tiver uma barra,
  será considerado pessoa jurídica.}
  Result := (Pos('/', ACNPJ) > 0) or (Length(SoNumero(ACNPJ)) > 11);
end;

class function TFacMetodos.RaizCNPJ(const ACNPJ: string): string;
begin
  if Pos('/', ACNPJ) = 0 then
    raise Exception.CreateFmt('O TFacMetodos.RaizCNPJ não pôde tratar o CNPJ %s',
      [ACNPJ]);
  Result := Copy(ACNPJ, 1, Pos('/', ACNPJ) - 1);
end;

class procedure TFacMetodos.SeparaDDDTelefone(const ADDDTelefone: string;
  out ADDD, ATelefone: string);
var
  LString: string;
begin
  LString := SoNumero(ADDDTelefone);
  if Length(LString) > 8 then
  begin
    ATelefone := Copy(LString, Length(LString) - 7, 8);
    ADDD := Copy(LString, 1, Length(LString) - 8);
  end
  else
    ATelefone := LString;
end;

class procedure TFacMetodos.SoNumeroeVirgulaValidaKey(var Key: Char);
begin
  if not (Key in [DecimalSeparator,'0'..'9', '.', ',', Char(VK_BACK), Chr(VK_DELETE)]) then
    Key := #0;
end;

class procedure TFacMetodos.SoNumeroValidaKey(var Key: Char);
begin
  if not(Key in ['0'..'9', Chr(VK_BACK), Chr(VK_DELETE)]) then
    Key := #0;
end;

class function TFacMetodos.TaxaEquivalente(const ATaxaDe, APeriodo, APeriodoDesejado: Extended): Extended;
begin
  Result := 0;
  if APeriodo <> 0 then
    Result := (Power(1 + (ATaxaDe / 100), APeriodoDesejado / APeriodo) - 1) * 100;
end;

class function TFacMetodos.TaxaEquivalenteMes(ATaxaDe, APeriodo: Extended): Extended;
begin
  Result := 0;
  if APeriodo <> 0 then
    Result := TaxaEquivalente(ATaxaDe, APeriodo, 30);
end;

class procedure TFacMetodos.TrataCharEmCampoDeCodigoDeOperacao(var Key: Char);
const
  CaracteresAceitos = NumerosELetrasMaiusculas + [Char(VK_BACK)];
begin
  Key := UpCase(Key);
  if not (Key in CaracteresAceitos) then
    Key := #0;
end;

class function TFacMetodos.TrocaPontoVirgula(const Valor: string): string;
begin
  Result := Valor;
  if DecimalSeparator <> '.' then
    Result := StringReplace(Result, '.', DecimalSeparator, [rfIgnoreCase]);
  if DecimalSeparator <> ',' then
    Result := StringReplace(Result, ',', DecimalSeparator, [rfIgnoreCase]);
end;

class function TFacMetodos.TrocaVirgulaPorPonto(const AValor: Currency;
  ATamanho: Integer; QuantidadeDeDecimais: Integer): string;
begin
  Result := TMetodos.PoeLetraEsq(StringReplace(FormatCurr('0.' + StringOfChar('0', QuantidadeDeDecimais), AValor),
    ',', '.', [rfReplaceAll]), ATamanho, '0');
end;

class function TFacMetodos.TrocaVirgulaPorPonto(
  const ATexto: string; ATamanho: Integer): string;
begin
  Result := TMetodos.PoeLetra(StringReplace(ATexto, ',', '.', [rfReplaceAll]), ATamanho, ' ');
end;

class function TFacMetodos.TrocaVirgulaPorPonto(const AValor: Double;
  QuantidadeDeDecimais: Integer): string;
begin
  Result := StringReplace(FormatCurr('0.' + StringOfChar('0', QuantidadeDeDecimais), AValor),
    ',', '.', [rfReplaceAll]);
end;

class function TFacMetodos.UnCrypt(const Senha: string): string;
var
  laco, P: Integer;
begin
  for laco := 1 to Length(Senha) do
  begin
    P := Pos(Senha[laco], CryptEmbralho);
    if P > 0 then
      Result := Result + CryptOriginal[P]
    else
      Result := Result + Senha[laco];
  end;
end;

end.
