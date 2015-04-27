unit wPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ServiceLocator, uActiveRecord,
  uGerenciePJ_Conexao, uNFConsultaSerasaModel, StdCtrls, Buttons, SerasaMonitore,
  //
  uRelatoFormatadoModel, uRelatoFormatadoParse;

type
  TPrincipal = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
begin
  with TMonitore.Create do
  try
    RetornoMonitore(FConnection);
  finally
    Free;
  end;
end;

procedure TPrincipal.Button1Click(Sender: TObject);
var
  LArquivo: TStringList;
  LRelato: TRelatoFormatadoModel;
  LParser: TRelatoFormatadoParser;
begin
  LArquivo := TStringList.Create;
  LRelato := TRelatoFormatadoModel.Create;
  LParser := TRelatoFormatadoParser.Create;
  try
    LArquivo.LoadFromFile('C:\GerenciePJ\GUIGerenciePJ\SERASA.txt');
    LParser.TextoParaRelatoFormatadoModel(LArquivo, LRelato);
  finally
    LParser.Free;
    LRelato.Free;
    LArquivo.Free;
  end;
end;

end.
