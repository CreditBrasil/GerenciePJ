unit uCMC7;

interface

uses
  SysUtils, Metodos, ServiceLocator{, uBancosModel};

type
  TComposicaoCMC7 = record
    Banco: string;
    Agencia: string;
    D1: Char;
    Comp: string;
    Cheque: string;
    Tipo: Char;
    D2: Char;
    Conta: string;
    D3: Char;
  end;

  TCMC7 = type string;

  TCMC7Metodos = class(TObject)
  public
    class function CMC7Valido(const ACMC7: TCMC7): Boolean;
    class function ComposicaoCMC7(const ACMC7: TCMC7): TComposicaoCMC7;
    class function DigitoCMC7(const ADados: string): string;
    class function GeraCMC7(const APraca, ABanco, AAgencia, AConta, ACheque: string): TCMC7; overload;
    class function CMC7ParaSql(const ACMC7: string): string;
    class function ContaAjustadoTamanho(const ACMC7: string; ATamanhoConta: Integer): string;
  end;

implementation

{ TCMC7Metodos }

class function TCMC7Metodos.CMC7Valido(const ACMC7: TCMC7): Boolean;
begin
  {esta validação apenas identifica se a string é do tipo de
  um CMC7. Ela deve para discernir um CMC7 de um número de duplicata.
  Para a validação matemática, há a biblioteca "LeitoraChequeStd.pas".}
  //1234567890123456789012345678901234
  //XBBBAAAADXCCCNNNNNN5XDCCCCCCCCCCDX
  Result := (Length(SysUtils.Trim(ACMC7)) = 34) and (ACMC7[1] = '<') and
    (ACMC7[10] = '<') and (ACMC7[21] = '>') and (ACMC7[34] = ':');
end;

class function TCMC7Metodos.ComposicaoCMC7(const ACMC7: TCMC7): TComposicaoCMC7;
begin
  if CMC7Valido(ACMC7) then
    with Result do
    begin
      //1234567890123456789012345678901234
      //XBBBAAAADXCCCNNNNNN5XDCCCCCCCCCCDX
      Banco := Copy(ACMC7, 2, 3);
      Agencia := Copy(ACMC7, 5, 4);
      D1 := ACMC7[22];
      Comp := Copy(ACMC7, 11, 3);
      Cheque := Copy(ACMC7, 14, 6);
      Tipo := ACMC7[20];
      D2 := ACMC7[9];
      Conta := Copy(ACMC7, 23, 10);
      D3 := ACMC7[33];
    end
  else
    FillChar(Result, SizeOf(TComposicaoCMC7), 0);
end;

class function TCMC7Metodos.DigitoCMC7(const ADados: string): string;
var
  total: string;
  laco, numero, dc, resto, resultado, multiplicador: Integer;
begin
  total := '';
  resultado := 0;
  multiplicador := 2;
  for laco := 0 to Length(ADados) - 1 do
  begin
    numero := StrToInt(Copy(ADados, Length(ADados) - laco, 1));
    total := total + IntToStr((numero * multiplicador));
    if multiplicador = 2 then
      multiplicador := 1
    else
      multiplicador := 2;
  end;
  for laco := 0 to Length(total) - 1 do
    resultado := resultado + StrToInt(Copy(total, Length(total) - laco, 1));
  resto := resultado mod 10;
  resto := 10 - resto;
  if (resto = 10) then
    dc := 0
  else
    dc := resto;
  Result := IntToStr(dc);
end;

class function TCMC7Metodos.GeraCMC7(const APraca, ABanco, AAgencia, AConta, ACheque: string): TCMC7;

  function EntradaInvalida: Boolean;
  begin
    Result := (Trim(APraca) = '') or (Trim(ABanco) = '') or (Trim(AAgencia) = '') or (Trim(AConta) = '') or
      (Trim(ACheque) = '');
  end;

var
  A1, A2, A3, C1, C2, C3: string;
begin

  if EntradaInvalida then
  begin
    Result := '';
    Exit;
  end;

  A1 := TMetodos.PoeLetraEsq(TMetodos.SoNumero(ABanco), 3, '0') +
    TMetodos.PoeLetraEsq(TMetodos.SoNumero(AAgencia), 4, '0');
  C1 := DigitoCMC7(A1);
  A2 := TMetodos.PoeLetraEsq(TMetodos.SoNumero(APraca), 3, '0') +
    TMetodos.PoeLetraEsq(TMetodos.SoNumero(ACheque), 6, '0') + '5';
  C2 := DigitoCMC7(A2);
  A3 := TMetodos.PoeLetraEsq(TMetodos.SoNumero(AConta), 10, '0');
  C3 := DigitoCMC7(A3);
  //1234567890123456789012345678901234
  //XBBBAAAADXCCCNNNNNN5XDCCCCCCCCCCDX
  Result := '<' + A1 + C2 + '<' + A2 + '>' + C1 + A3 + C3 + ':';
end;

class function TCMC7Metodos.CMC7ParaSql(const ACMC7: string): string;
var
  CMC7: string;
  laco: Integer;
  //LBancosModel: IBancosModel;
begin
  CMC7 := ACMC7;
  //1234567890123456789012345678901234
  //XBBBAAAADXCCCNNNNNN5XDCCCCCCCCCCDX
  CMC7[1] := '_';
  CMC7[9] := '_';
  CMC7[10] := '_';
  CMC7[20] := '_';
  CMC7[21] := '_';
  CMC7[22] := '_';
  CMC7[33] := '_';
  CMC7[34] := '%';

  {LBancosModel := (SL as IBancosModelService).FindByCodigo(Copy(CMC7, 2, 3), TBancosModel.DefaultConnection);
  if Assigned(LBancosModel) then
    for laco := 1 to (10 - LBancosModel.Tamanho) do
      CMC7[22 + laco] := '_';}

  if Copy(CMC7, 11, 3) = '000' {COMP não informada} then
    for laco := 11 to 13 do
      CMC7[laco] := '_';
  Result := CMC7;
end;

class function TCMC7Metodos.ContaAjustadoTamanho(const ACMC7: string;
  ATamanhoConta: Integer): string;
begin
  Result := Copy(ACMC7, 33 - ATamanhoConta, ATamanhoConta);
end;

end.
