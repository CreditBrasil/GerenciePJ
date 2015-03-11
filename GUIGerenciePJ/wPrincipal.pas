unit wPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ServiceLocator, uActiveRecord,
  uGerenciePJ_Conexao, uNFConsultaSerasaModel, StdCtrls, Buttons, SerasaMonitore;

type
  TPrincipal = class(TForm)
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FConnection: IActiveRecordConnection;
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

procedure TPrincipal.FormCreate(Sender: TObject);
begin
  FConnection := CriaConexao_GerenciePJ;
end;

procedure TPrincipal.FormDestroy(Sender: TObject);
begin
  FConnection := nil;
end;

procedure TPrincipal.BitBtn1Click(Sender: TObject);
{var
  FNFConsultaSerasaModel: INFConsultaSerasaModel;}
begin
  {FNFConsultaSerasaModel := TNFConsultaSerasaModel.Create(FConnection);
  with FConnection.StartTransaction do
  begin
    (SL as INFConsultaSerasaModelService).Save(FNFConsultaSerasaModel);
    Commit;
  end;
  ShowMessage(IntToStr(FNFConsultaSerasaModel.ID));}
  with TMonitore.Create do
  try
    RetornoMonitore(FConnection);
  finally
    Free;
  end;
end;

end.
