unit CreditBr_Interfaces;

interface

uses
  Classes, MVC_Interfaces;

type
  (*TTipoAcessoCliente = (tacNaoDefinido, tacCliente{$IFDEF WBASh}, tacParceiros{$ENDIF});
  TPapel = (papelAdministrador, papelVisaoFinanceira, papelGerencial{$IFDEF WBASh}, papelCadastradorMaquinas,
    papelAtivador{$ENDIF});
  TPapeis = set of TPapel;

  TCodigoGerente = record
    Codigo: string;
    TemCodigo: Boolean;
  end;*)

  ISessao_CreditBr = interface(ISessao)
    ['{8E18AF79-F1FF-43EF-BF28-9373C3B596C8}']
    //function GetClienteAutenticado: Boolean;
    function GetCodigoChecagem: Integer;
    {function GetCodigoGerente: TCodigoGerente;
    function GetIdGrupoAcesso: Integer;
    function GetPapeis: TPapeis;
    function GetPodeAcessarCodigosDeGerentes: IMVCStrings;
    function GetSomentePainelDeGerente: Boolean;
    function GetTipoAcessoCliente: TTipoAcessoCliente;}
    function GetUsuarioCodigo: string;
    function GetUsuarioNome: string;
    //procedure SetClienteAutenticado(AValue: Boolean);
    procedure SetCodigoChecagem(AValue: Integer);
    {procedure SetCodigoGerente(const AValue: TCodigoGerente);
    procedure SetIdGrupoAcesso(AValue: Integer);
    procedure SetPapeis(const AValue: TPapeis);
    procedure SetSomentePainelDeGerente(AValue: Boolean);
    procedure SetTipoAcessoCliente(AValue: TTipoAcessoCliente);}
    procedure SetUsuarioCodigo(const AValue: string);
    procedure SetUsuarioNome(const AValue: string);

    //property ClienteAutenticado: Boolean read GetClienteAutenticado write SetClienteAutenticado;
    property CodigoChecagem: Integer read GetCodigoChecagem write SetCodigoChecagem;
    {property CodigoGerente: TCodigoGerente read GetCodigoGerente write SetCodigoGerente;
    property IdGrupoAcesso: Integer read GetIdGrupoAcesso write SetIdGrupoAcesso;
    property Papeis: TPapeis read GetPapeis write SetPapeis;
    property PodeAcessarCodigosDeGerentes: IMVCStrings read GetPodeAcessarCodigosDeGerentes;
    property SomentePainelDeGerente: Boolean read GetSomentePainelDeGerente write SetSomentePainelDeGerente;
    property TipoAcessoCliente: TTipoAcessoCliente read GetTipoAcessoCliente write SetTipoAcessoCliente;}
    property UsuarioCodigo: string read GetUsuarioCodigo write SetUsuarioCodigo;
    property UsuarioNome: string read GetUsuarioNome write SetUsuarioNome;
  end;

(*const
  NomePapel: array [TPapel] of string = (
    'Administrador', //papelAdministrador
    'VisaoFinanceira', //papelVisaoFinanceira
    'Gerencial' //papelGerencial
{$IFDEF WBASh},
    'CadastradorMaquinas', //papelCadastradorMaquinas
    'Ativador' //papelAtivador
{$ENDIF}
    );
  SemCodigoGerente: TCodigoGerente = (Codigo: ''; TemCodigo: False);
  NomeTipoAcessoCliente: array [TTipoAcessoCliente] of string = (
    'Não definido', //tacNaoDefinido
    'Cliente' //tacCliente
    {$IFDEF WBASh}
    , 'Parceiros' //tacParceiros
    {$ENDIF}
    );

function CodigoGerente(const ACodigo: string; ATemCodigo: Boolean = True): TCodigoGerente;*)

implementation

(*function CodigoGerente(const ACodigo: string; ATemCodigo: Boolean): TCodigoGerente;
begin
  if ATemCodigo then
    Result.Codigo := ACodigo
  else
    Result.Codigo := '';
  Result.TemCodigo := ATemCodigo;
end;*)

end.
