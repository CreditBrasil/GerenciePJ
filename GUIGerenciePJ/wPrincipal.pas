unit wPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ServiceLocator, uActiveRecord,
  uGerenciePJ_Conexao, uNFConsultaSerasaModel, StdCtrls, Buttons, SerasaMonitore,
  //
  uRelatoFormatadoModel, uRelatoFormatadoParse, uRelatoFormatadoRelatorio, IniFiles;

type
  TPrincipal = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    txtConnectionString: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    txtResponsavelCadastroNetFactorNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    txtResponsavelCadastroNetFactorEMail: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    txtResponsavelMonitorarEMailsNome: TEdit;
    txtResponsavelMonitorarEMailsEMail: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CarregaConfiguracoes;
    procedure SalvaConfiguracoes;
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

procedure TPrincipal.BitBtn1Click(Sender: TObject);
var
  LConnection: IActiveRecordConnection;
begin
  LConnection := CriaConexao_GerenciePJ(txtConnectionString.Text);
  with TMonitore.Create do
  try
    ResponsavelCadastroNetFactorNome := txtResponsavelCadastroNetFactorNome.Text;
    ResponsavelCadastroNetFactorEMail := txtResponsavelCadastroNetFactorEMail.Text;
    ResponsavelMonitorarEMailsNome := txtResponsavelMonitorarEMailsNome.Text;
    ResponsavelMonitorarEMailsEMail := txtResponsavelMonitorarEMailsEMail.Text;
    RetornoMonitore(LConnection);
  finally
    Free;
  end;
end;

procedure TPrincipal.Button1Click(Sender: TObject);
var
  LArquivo: TStringList;
  LRelatoAnterior, LRelatoAtual: TRelatoFormatadoModel;
  LParser: TRelatoFormatadoParser;
  LRelatorio: TRelatoFormatadoRelatorio;
begin
  LArquivo := TStringList.Create;
  LRelatoAnterior := TRelatoFormatadoModel.Create;
  LRelatoAtual := TRelatoFormatadoModel.Create;
  LParser := TRelatoFormatadoParser.Create;
  LRelatorio := TRelatoFormatadoRelatorio.Create;
  try
    LArquivo.LoadFromFile('C:\GerenciePJ\GUIGerenciePJ\SerasaAnterior.txt');
    LParser.TextoParaRelatoFormatadoModel(LArquivo, LRelatoAnterior);
    LArquivo.LoadFromFile('C:\GerenciePJ\GUIGerenciePJ\SerasaAtual.txt');
    LParser.TextoParaRelatoFormatadoModel(LArquivo, LRelatoAtual);
    LArquivo.Text := LRelatorio.RelatorioDasDiferencas(LRelatoAnterior, LRelatoAtual, '');
    LArquivo.SaveToFile('C:\GerenciePJ\GUIGerenciePJ\Comparacao.html');
  finally
    LRelatorio.Free;
    LParser.Free;
    LRelatoAtual.Free;
    LRelatoAnterior.Free;
    LArquivo.Free;
  end;
end;

procedure TPrincipal.CarregaConfiguracoes;
begin
  with TMemIniFile.Create(ChangeFileExt(Application.ExeName, '.ini')) do
  try
    txtConnectionString.Text := ReadString('Banco de dados', 'ConnectioString',
      'Driver={SQL Server};Server=orderbysql\orderbysql;DataBase=netFactor;UID=sa;PWD=chica;Library=dbmssocn;');
    txtResponsavelCadastroNetFactorNome.Text := ReadString('Configuracoes', 'ResponsavelCadastroNetFactorNome',
      'Natalino Barros Amaral');
    txtResponsavelCadastroNetFactorEMail.Text := ReadString('Configuracoes', 'ResponsavelCadastroNetFactorEMail',
      'natalino.amaral@creditbr.com.br');
    txtResponsavelMonitorarEMailsNome.Text := ReadString('Configuracoes', 'ResponsavelMonitorarEMailsNome',
      'Natalino Barros Amaral');
    txtResponsavelMonitorarEMailsEMail.Text := ReadString('Configuracoes', 'ResponsavelMonitorarEMailsEMail',
      'natalino.amaral@creditbr.com.br');
  finally
    Free;
  end;
end;

procedure TPrincipal.SalvaConfiguracoes;
begin
  with TMemIniFile.Create(ChangeFileExt(Application.ExeName, '.ini')) do
  try
    WriteString('Banco de dados', 'ConnectioString', txtConnectionString.Text);
    WriteString('Configuracoes', 'ResponsavelCadastroNetFactorNome', txtResponsavelCadastroNetFactorNome.Text);
    WriteString('Configuracoes', 'ResponsavelCadastroNetFactorEMail', txtResponsavelCadastroNetFactorEMail.Text);
    WriteString('Configuracoes', 'ResponsavelMonitorarEMailsNome', txtResponsavelMonitorarEMailsNome.Text);
    WriteString('Configuracoes', 'ResponsavelMonitorarEMailsEMail', txtResponsavelMonitorarEMailsEMail.Text);
    UpdateFile;
  finally
    Free;
  end;
end;

procedure TPrincipal.FormDestroy(Sender: TObject);
begin
  SalvaConfiguracoes;
end;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
  CarregaConfiguracoes;
end;

end.
