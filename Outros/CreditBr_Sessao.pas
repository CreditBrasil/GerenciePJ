unit CreditBr_Sessao;

interface

uses
  Classes, ServiceLocator, MVC_Interfaces, CreditBr_Interfaces;

type
  TSessao_CreditBr = class(TSLObject, ISessao, ISessao_CreditBr)
  private
    FAutenticado: Boolean;
    //FClienteAutenticado: Boolean;
    FCodigoChecagem: Integer;
    //FCodigoGerente: TCodigoGerente;
    //FPodeAcessarCodigosDeGerentes: IMVCStrings;
    FGUID: TGUID;
    //FIdGrupoAcesso: Integer;
    //FPapeis: TPapeis;
    //FSomentePainelDeGerente: Boolean;
    //FTipoAcessoCliente: TTipoAcessoCliente;
    FUsuarioCodigo: string;
    FUsuarioNome: string;
  protected
    { ISessao }
    function GetAutenticado: Boolean;
    function GetGUID: TGUID;
    procedure SetAutenticado(AValue: Boolean);
    procedure SetGUID(const AValue: TGUID);
    { ISessao_WBA }
    //function GetClienteAutenticado: Boolean;
    function GetCodigoChecagem: Integer;
    //function GetCodigoGerente: TCodigoGerente;
    //function GetIdGrupoAcesso: Integer;
    //function GetPapeis: TPapeis;
    //function GetPodeAcessarCodigosDeGerentes: IMVCStrings;
    //function GetSomentePainelDeGerente: Boolean;
    //function GetTipoAcessoCliente: TTipoAcessoCliente;
    function GetUsuarioCodigo: string;
    function GetUsuarioNome: string;
    //procedure SetClienteAutenticado(AValue: Boolean);
    procedure SetCodigoChecagem(AValue: Integer);
    //procedure SetCodigoGerente(const AValue: TCodigoGerente);
    //procedure SetIdGrupoAcesso(AValue: Integer);
    //procedure SetPapeis(const AValue: TPapeis);
    //procedure SetSomentePainelDeGerente(AValue: Boolean);
    //procedure SetTipoAcessoCliente(AValue: TTipoAcessoCliente);
    procedure SetUsuarioCodigo(const AValue: string);
    procedure SetUsuarioNome(const AValue: string);
  public
    constructor Create; override;
  end;

implementation

{ TSessao_CreditBr }

constructor TSessao_CreditBr.Create;
begin
  inherited;
  FCodigoChecagem := Random(MaxInt);
  //FPodeAcessarCodigosDeGerentes := SL as IMVCStrings;
end;

function TSessao_CreditBr.GetAutenticado: Boolean;
begin
  Result := FAutenticado;
end;

{function TSessao_CreditBr.GetClienteAutenticado: Boolean;
begin
  Result := FClienteAutenticado;
end;}

function TSessao_CreditBr.GetCodigoChecagem: Integer;
begin
  Result := FCodigoChecagem;
end;

{function TSessao_CreditBr.GetCodigoGerente: TCodigoGerente;
begin
  Result := FCodigoGerente;
end;}

function TSessao_CreditBr.GetGUID: TGUID;
begin
  Result := FGUID;
end;

{function TSessao_CreditBr.GetIdGrupoAcesso: Integer;
begin
  Result := FIdGrupoAcesso;
end;}

{function TSessao_CreditBr.GetPapeis: TPapeis;
begin
  Result := FPapeis;
end;}

{function TSessao_CreditBr.GetPodeAcessarCodigosDeGerentes: IMVCStrings;
begin
  Result := FPodeAcessarCodigosDeGerentes;
end;}

{function TSessao_CreditBr.GetSomentePainelDeGerente: Boolean;
begin
  Result := FSomentePainelDeGerente;
end;}

{function TSessao_CreditBr.GetTipoAcessoCliente: TTipoAcessoCliente;
begin
  Result := FTipoAcessoCliente;
end;}

function TSessao_CreditBr.GetUsuarioCodigo: string;
begin
  Result := FUsuarioCodigo;
end;

function TSessao_CreditBr.GetUsuarioNome: string;
begin
  Result := FUsuarioNome;
end;

procedure TSessao_CreditBr.SetAutenticado(AValue: Boolean);
begin
  FAutenticado := AValue;
  {if FAutenticado then
    FClienteAutenticado := False;}
end;

{procedure TSessao_CreditBr.SetClienteAutenticado(AValue: Boolean);
begin
  FClienteAutenticado := AValue;
  if FClienteAutenticado then
  begin
    FAutenticado := False;
    //Os parâmetros abaixo não se aplicam no modo Cliente
    FCodigoGerente := SemCodigoGerente;
    FIdGrupoAcesso := -1;
    FPapeis := [];
  end;
end;}

procedure TSessao_CreditBr.SetCodigoChecagem(AValue: Integer);
begin
  FCodigoChecagem := AValue;
end;

{procedure TSessao_CreditBr.SetCodigoGerente(const AValue: TCodigoGerente);
begin
  FCodigoGerente := AValue;
end;}

procedure TSessao_CreditBr.SetGUID(const AValue: TGUID);
begin
  FGUID := AValue;
end;

{procedure TSessao_CreditBr.SetIdGrupoAcesso(AValue: Integer);
begin
  FIdGrupoAcesso := AValue;
end;}

{procedure TSessao_CreditBr.SetPapeis(const AValue: TPapeis);
begin
  FPapeis := AValue;
end;}

{procedure TSessao_CreditBr.SetSomentePainelDeGerente(AValue: Boolean);
begin
  FSomentePainelDeGerente := AValue;
end;}

{procedure TSessao_CreditBr.SetTipoAcessoCliente(AValue: TTipoAcessoCliente);
begin
  FTipoAcessoCliente := AValue;
end;}

procedure TSessao_CreditBr.SetUsuarioCodigo(const AValue: string);
begin
  FUsuarioCodigo := AValue;
end;

procedure TSessao_CreditBr.SetUsuarioNome(const AValue: string);
begin
  FUsuarioNome := AValue;
end;

initialization

  Randomize;
  TSessao_CreditBr.SelfRegister([ISessao, ISessao_CreditBr]);

end.
