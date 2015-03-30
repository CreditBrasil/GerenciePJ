unit CreditBr_Controlador_Principal;

interface

uses
  SysUtils, Variants, ServiceLocator, uActiveRecord, CreditBr_Controlador_Autenticado, CreditBr_Conexao;

type
  TControladorPrincipal = class(TControladorAutenticado)
  private
  protected
    procedure DespachaAcao(const ANomeAcao: string); override;
    procedure Indice;
  public
    //constructor Create(const AConnection: IActiveRecordConnection);
  end;

implementation

{ Fabrica }

function FabricaControladorPrincipal: IUnknown;
begin
  Result := TControladorPrincipal.Create(CriaConexao_WBA);
end;

{ TControladorPrincipal }

procedure TControladorPrincipal.DespachaAcao(const ANomeAcao: string);
begin
  if SameText(ANomeAcao, 'Indice') then
    Indice
  else
    NaoFoiEncontrado;
end;

procedure TControladorPrincipal.Indice;
begin
end;

initialization

  TControladorPrincipal.RegistreSe(FabricaControladorPrincipal);

end.
