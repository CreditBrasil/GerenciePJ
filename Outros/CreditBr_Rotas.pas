unit CreditBr_Rotas;

interface

uses
  SysUtils, Classes, HTTPApp, MVC_Interfaces, MVC_Rotas, FacMetodos;

type
  TTipoDeRotaGenerica = class(TTipoDeRota)
  protected
    function RotasSimilares(const ARota1, ARota2: IRota): Boolean; override;
  end;

  TTipoDeRotaNomeada = class(TTipoDeRotaGenerica)
  protected
    procedure CapturaElementos(ARequest: TWebRequest; AListaElementos: TStrings); override;
    function NomeInternoDoControlador(const ANomeControlador: string): string; override;
    function URLPara(const ARota: IRota): string; override;
  public
    class function Atende(Request: TWebRequest): Boolean; override;
  end;

  {TTipoDeRotaCliente = class(TTipoDeRotaNomeada)
  protected
    class function NomeFabricaRota: string; override;
  end;

  TTipoDeRotaGerente = class(TTipoDeRotaGenerica)
  protected
    procedure CapturaElementos(ARequest: TWebRequest; AListaElementos: TStrings); override;
    class function NomeFabricaRota: string; override;
    function NomeInternoDoControlador(const ANomeControlador: string): string; override;
    function URLPara(const ARota: IRota): string; override;
  public
    class function Atende(Request: TWebRequest): Boolean; override;
  end;}

  TTipoDeRotaPadrao = class(TTipoDeRotaGenerica)
  protected
    procedure CapturaElementos(ARequest: TWebRequest; AListaElementos: TStrings); override;
    class function NomeFabricaRota: string; override;
    function URLPara(const ARota: IRota): string; override;
  public
    class function Atende(Request: TWebRequest): Boolean; override;
  end;

implementation

const
  ControladorPadrao = 'Principal';
  AcaoPadrao = 'Indice';

{ TTipoDeRotaGenerica }

function TTipoDeRotaGenerica.RotasSimilares(const ARota1, ARota2: IRota): Boolean;
var
  laco: Integer;
  L1NomeAcao, L2NomeAcao, L1NomeControlador, L2NomeControlador: string;
begin
  if ARota1.NomeAcao <> '' then
    L1NomeAcao := ARota1.NomeAcao
  else
    L1NomeAcao := AcaoPadrao;
  if ARota2.NomeAcao <> '' then
    L2NomeAcao := ARota2.NomeAcao
  else
    L2NomeAcao := AcaoPadrao;
  if ARota1.NomeControlador <> '' then
    L1NomeControlador := ARota1.NomeControlador
  else
    L1NomeControlador := ControladorPadrao;
  if ARota2.NomeControlador <> '' then
    L2NomeControlador := ARota2.NomeControlador
  else
    L2NomeControlador := ControladorPadrao;
  Result := AnsiSameText(ARota1.Nome, ARota2.Nome) and
    AnsiSameText(L1NomeAcao, L2NomeAcao) and
    AnsiSameText(L1NomeControlador, L2NomeControlador) and
    (Length(ARota1.OutrosElementos) = Length(ARota2.OutrosElementos));
  if Result then
    for laco := 0 to Length(ARota1.OutrosElementos) - 1 do
      if not AnsiSameText(ARota1.OutrosElementos[laco], ARota2.OutrosElementos[laco]) then
      begin
        Result := False;
        Break;
      end;
end;

{ TTipoDeRotaNomeada }

class function TTipoDeRotaNomeada.Atende(Request: TWebRequest): Boolean;
var
  LListaElementos: TStrings;
begin
  LListaElementos := CreateListaElementos(Request.InternalPathInfo);
  try
    Result := (LListaElementos.Count > 0) and SameText(NomeFabricaRota, LListaElementos[0]);
  finally
    LListaElementos.Free;
  end;
end;

procedure TTipoDeRotaNomeada.CapturaElementos(ARequest: TWebRequest; AListaElementos: TStrings);
var
  laco: Integer;
  LOutrosElementos: TOutrosElementos;
begin
  Assert((AListaElementos.Count > 0) and SameText(NomeFabricaRota, AListaElementos[0]));
  if AListaElementos.Count > 1 then
    NomeControlador := AListaElementos[1]
  else
    NomeControlador := ControladorPadrao;
  if AListaElementos.Count > 2 then
    NomeAcao := AListaElementos[2]
  else
    NomeAcao := AcaoPadrao;
  if AListaElementos.Count > 3 then
  begin
    SetLength(LOutrosElementos, AListaElementos.Count - 3);
    for laco := 3 to AListaElementos.Count - 1 do
      LOutrosElementos[laco - 3] := AListaElementos[laco];
    OutrosElementos := LOutrosElementos;
  end;
end;

function TTipoDeRotaNomeada.NomeInternoDoControlador(const ANomeControlador: string): string;
begin
  Result := NomeFabricaRota + ANomeControlador;
end;

function TTipoDeRotaNomeada.URLPara(const ARota: IRota): string;

  function Controlador: string;
  begin
    if (ARota.NomeControlador <> '') and not SameText(ControladorPadrao, ARota.NomeControlador) or
      (Length(OutrosElementos) > 0) then
      Result := '/' + HTTPEncode(ARota.NomeControlador)
    else
      Result := '';
  end;

  function Acao: string;
  begin
    if (ARota.NomeAcao <> '') and not SameText(AcaoPadrao, ARota.NomeAcao) or (Length(OutrosElementos) > 0) then
      Result := '/' + HTTPEncode(ARota.NomeAcao)
    else
      Result := '';
  end;

var
  laco: Integer;
begin
  Result := Request.InternalScriptName + '/' + NomeFabricaRota + Controlador + Acao;
  for laco := Low(ARota.OutrosElementos) to High(ARota.OutrosElementos) do
    Result := Result + '/' + HTTPEncode(ARota.OutrosElementos[laco]);
  Result := Result + inherited URLPara(ARota);
end;

{ TTipoDeRotaCliente }

{class function TTipoDeRotaCliente.NomeFabricaRota: string;
begin
  Result := 'Cliente';
end;}

{ TTipoDeRotaGerente }

{class function TTipoDeRotaGerente.Atende(Request: TWebRequest): Boolean;
var
  LListaElementos: TStrings;
begin
  LListaElementos := CreateListaElementos(Request.InternalPathInfo);
  try
    Result := (LListaElementos.Count > 1) and SameText(NomeFabricaRota, LListaElementos[0]) and
      TFacMetodos.CodigoDeGerenteValido(LListaElementos[1]);
  finally
    LListaElementos.Free;
  end;
end;

procedure TTipoDeRotaGerente.CapturaElementos(ARequest: TWebRequest; AListaElementos: TStrings);
var
  laco: Integer;
  LOutrosElementos: TOutrosElementos;
begin
  Assert((AListaElementos.Count > 1) and SameText(NomeFabricaRota, AListaElementos[0]) and
    TFacMetodos.CodigoDeGerenteValido(AListaElementos[1]));
  if AListaElementos.Count > 2 then
    NomeControlador := AListaElementos[2]
  else
    NomeControlador := ControladorPadrao;
  if AListaElementos.Count > 3 then
    NomeAcao := AListaElementos[3]
  else
    NomeAcao := AcaoPadrao;
  if AListaElementos.Count > 4 then
  begin
    SetLength(LOutrosElementos, AListaElementos.Count - 3);
    LOutrosElementos[0] := AListaElementos[1];
    for laco := 4 to AListaElementos.Count - 1 do
      LOutrosElementos[laco - 3] := AListaElementos[laco];
    OutrosElementos := LOutrosElementos;
  end
  else
  begin
    SetLength(LOutrosElementos, 1);
    LOutrosElementos[0] := AListaElementos[1];
    OutrosElementos := LOutrosElementos;
  end;
end;

class function TTipoDeRotaGerente.NomeFabricaRota: string;
begin
  Result := 'Gerente';
end;

function TTipoDeRotaGerente.NomeInternoDoControlador(const ANomeControlador: string): string;
begin
  Result := NomeFabricaRota + ANomeControlador;
end;

function TTipoDeRotaGerente.URLPara(const ARota: IRota): string;

  function Controlador: string;
  begin
    if (ARota.NomeControlador <> '') and not SameText(ControladorPadrao, ARota.NomeControlador) or
      not SameText(AcaoPadrao, ARota.NomeAcao) or (Length(OutrosElementos) > 1) then
      Result := '/' + HTTPEncode(ARota.NomeControlador)
    else
      Result := '';
  end;

  function Acao: string;
  begin
    if (ARota.NomeAcao <> '') and not SameText(AcaoPadrao, ARota.NomeAcao) or (Length(OutrosElementos) > 1) then
      Result := '/' + HTTPEncode(ARota.NomeAcao)
    else
      Result := '';
  end;

var
  laco: Integer;
begin
  Assert(Length(ARota.OutrosElementos) > 0, 'O primeiro elemento deve ser o código do gerente');
  Assert(TFacMetodos.CodigoDeOperacaoValido(ARota.OutrosElementos[0]), CodigoDeGerenteInvalido);
  Result := Request.InternalScriptName + '/' + NomeFabricaRota + '/' + ARota.OutrosElementos[0] + Controlador + Acao;
  for laco := Succ(Low(ARota.OutrosElementos)) to High(ARota.OutrosElementos) do
    Result := Result + '/' + HTTPEncode(ARota.OutrosElementos[laco]);
  Result := Result + inherited URLPara(ARota);
end;}

{ TTipoDeRotaPadrao }

class function TTipoDeRotaPadrao.Atende(Request: TWebRequest): Boolean;
begin
  Result := True;
end;

procedure TTipoDeRotaPadrao.CapturaElementos(ARequest: TWebRequest; AListaElementos: TStrings);
begin
  inherited;
  if NomeControlador = '' then
    NomeControlador := ControladorPadrao;
  if NomeAcao = '' then
    NomeAcao := AcaoPadrao;
end;

class function TTipoDeRotaPadrao.NomeFabricaRota: string;
begin
  Result := 'Padrao';
end;

function TTipoDeRotaPadrao.URLPara(const ARota: IRota): string;

  function Controlador: string;
  begin
    if (ARota.NomeControlador <> '') and not SameText(ControladorPadrao, ARota.NomeControlador) or
      (Length(ARota.OutrosElementos) > 0) then
      Result := '/' + HTTPEncode(ARota.NomeControlador)
    else
      Result := '';
  end;

  function Acao: string;
  begin
    if (ARota.NomeAcao <> '') and not SameText(AcaoPadrao, ARota.NomeAcao) or (Length(ARota.OutrosElementos) > 0) then
      Result := '/' + HTTPEncode(ARota.NomeAcao)
    else
      Result := '';
  end;

var
  laco: Integer;
begin
  Result := Request.InternalScriptName + Controlador + Acao;
  for laco := Low(ARota.OutrosElementos) to High(ARota.OutrosElementos) do
    Result := Result + '/' + HTTPEncode(ARota.OutrosElementos[laco]);
  Result := Result + inherited URLPara(ARota);
end;

initialization

   TRotas.Adiciona([
     //TTipoDeRotaCliente,
     //TTipoDeRotaGerente,
     TTipoDeRotaPadrao
     ]);

end.
