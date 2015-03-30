unit CreditBr_Configuracao;

interface

uses
  SysUtils, IniFiles, MVC_Iniciadores;

type
  TBancoDeDados = (bdMsSQLServer, bdOracle);

  TConfiguracao = class(TObject)
  private
    FADOConnectionString: string;
    FBancoDeDados: TBancoDeDados;
    FTema: string;
    function DeterminaBancoDeDados(const ANomeBancoDeDados: string): TBancoDeDados;
  public
    constructor Create(const LNomeArquivoDeConfiguracao: string);
    property ADOConnectionString: string read FADOConnectionString;
    property BancoDeDados: TBancoDeDados read FBancoDeDados;
    property Tema: string read FTema;
  end;

var
  Configuracao: TConfiguracao;

implementation

const
  NomeBancoDeDados: array [TBancoDeDados] of string = (
    'MS SQL Server', //bdMsSQLServer
    'Oracle' //bdOracle
    );

type
  TIniciadorConfiguracao = class(TIniciador)
  public
    procedure RodaAoIniciar; override;
    procedure RodaAoFinalizar; override;
  end;

{ TConfiguracao }

constructor TConfiguracao.Create(const LNomeArquivoDeConfiguracao: string);
var
  LIniFile: TMemIniFile;
  LNomeBancoDeDados: string;
begin
  LIniFile := TMemIniFile.Create(LNomeArquivoDeConfiguracao);
  try
    FADOConnectionString := LIniFile.ReadString('Conexao', 'ADOConnectionString',
      'Falta definir o ADOConnectionString no WBA.ini');
    LNomeBancoDeDados := LIniFile.ReadString('Conexao', 'BancoDeDados', 'MS SQL Server');
    FBancoDeDados := DeterminaBancoDeDados(LNomeBancoDeDados);
    FTema := LIniFile.ReadString('Tema', 'DLL', 'TemaPadrao.tem');
  finally
    LIniFile.Free;
  end;
end;

function TConfiguracao.DeterminaBancoDeDados(const ANomeBancoDeDados: string): TBancoDeDados;
var
  LBancoDeDados: TBancoDeDados;
begin
  for LBancoDeDados := Low(TBancoDeDados) to High(TBancoDeDados) do
    if SameText(ANomeBancoDeDados, NomeBancoDeDados[LBancoDeDados]) then
    begin
      Result := LBancoDeDados;
      Exit;
    end;
  raise Exception.CreateFmt('O "%s" não é um tipo de banco de dados conhecido', [ANomeBancoDeDados]);
end;

{ TIniciadorConfiguracao }

procedure TIniciadorConfiguracao.RodaAoFinalizar;
begin
  FreeAndNil(Configuracao);
end;

procedure TIniciadorConfiguracao.RodaAoIniciar;
begin
  Configuracao := TConfiguracao.Create(ExtractFilePath(GetModuleName(HInstance)) + 'CreditBr.ini');
end;

initialization

  Iniciadores.AdicionaIniciador(TIniciadorConfiguracao.Create);

finalization

  //é finalizado no RodaAoFinalizar, mas coloco aqui por garantia.
  FreeAndNil(Configuracao);

end.
