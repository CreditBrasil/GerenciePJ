unit SerasaNR054;

interface

uses
  SerasaIP20, Serasa, contnrs;

type
  TSerasaLocalNR054 = class(TSeComunicacao)
  private
    FComunicacao: TSeComunicacao;
  public
    constructor Create(AComunicacao: TSeComunicacao);
    function Get(Se: string): string; override;
    function TamanhoMaximo: Integer; override;
  end;

  TSeNR054 = class(TSeDetalhes)
  private
    FSeIP20: TComunicacaoIP20;
    FContainerSeIP20: TObjectList;
    FIndiceIP20: Integer;
    function GetSeIP20(Index: Integer): TComunicacaoIP20;
    procedure GetIndiceIP20(const Value: Integer);
  protected
    function GetDetalhes(Index: Integer): TSeItemDetalhes; override;
    function GetText: string; override;
    procedure SetText(const Value: string); override;
    function TamanhoTransacao: Integer; override;
  public
    constructor Create(ASerasa: TSerasa); override;
    destructor Destroy; override;
    function Adiciona(ADetalhe: TSeItemDetalhes): Integer; override;
    function AdicionaSeIP20(const ACNPJ, Texto: string): Integer;
    procedure Limpa; override;
    function Quantidade: Integer; override;
    function QuantidadeSeIP20: Integer;
    property SeIP20[Index: Integer]: TComunicacaoIP20 read GetSeIP20;
    property IndiceIP20: Integer read FIndiceIP20 write GetIndiceIP20;
    class function Transacao: TTipoTransacao; override;
  end;

implementation

uses
  Classes, SysUtils;

{ TSeNR054 }

function TSeNR054.Adiciona(ADetalhe: TSeItemDetalhes): Integer;
begin
  Result := FSeIP20.Adiciona(ADetalhe);
end;

function TSeNR054.AdicionaSeIP20(const ACNPJ, Texto: string): Integer;
begin
  FSeIP20 := TComunicacaoIP20.Create(Serasa);
  FSeIp20.CNPJ := ACNPJ;
  FSeIp20.Text := Texto;
  Result := FContainerSeIP20.Add(FSeIp20);
end;

constructor TSeNR054.Create(ASerasa: TSerasa);
begin
  inherited;
  FContainerSeIP20 := TObjectList.Create;
end;

destructor TSeNR054.Destroy;
begin
  FContainerSeIP20.Free;
  inherited;
end;

function TSeNR054.GetDetalhes(Index: Integer): TSeItemDetalhes;
begin
  Result := FSeIP20.Detalhes[Index];
end;

procedure TSeNR054.GetIndiceIP20(const Value: Integer);
begin
  FIndiceIP20 := Value;
  FSeIP20 := SeIP20[Value];
end;

function TSeNR054.GetSeIP20(Index: Integer): TComunicacaoIP20;
begin
  Result := FContainerSeIP20[Index] as TComunicacaoIP20;
end;

function TSeNR054.GetText: string;
begin
  Result := 'NR054';
end;

procedure TSeNR054.Limpa;
begin
  FSeIP20.Limpa;
end;

function TSeNR054.Quantidade: Integer;
begin
  Result := FSeIP20.Quantidade;
end;

function TSeNR054.QuantidadeSeIP20: Integer;
begin
  Result := FContainerSeIP20.Count;
end;

procedure TSeNR054.SetText(const Value: string);
const
  Cabecalho = '#INI0000IP20';
var
  Texto: TStringList;
  laco: Integer;
  Linha, S, CNPJ, CNPJAnterior: string;
begin
  if SysUtils.Trim(Value) <> '' then
  begin
    Texto := TStringList.Create;
    try
      Texto.Text := StringReplace(Value, '#L', #13#10, [rfReplaceAll]);

      Texto.Delete(Texto.Count - 1);
      S := Cabecalho;
      CNPJAnterior := Copy(Texto.Strings[1], 19, 9);

      for laco := 1 to Texto.Count - 1 do
      begin
        Linha := Texto.Strings[laco];
        CNPJ := Copy(Linha, 19, 9);
        Delete(Linha, 1, 28);

        if (CNPJ <> CNPJAnterior) or (laco >= Texto.Count - 1)  then
        begin
          AdicionaSeIP20(CNPJAnterior, S);
          S := Cabecalho;
        end;

        S := S + '#L' + Linha;
        CNPJAnterior := CNPJ;
      end;

    finally
      Texto.Free;
    end;
  end;
end;

function TSeNR054.TamanhoTransacao: Integer;
begin
  Result := 5;
end;

class function TSeNR054.Transacao: TTipoTransacao;
begin
  Result := 'NR054';
end;

{ TSerasaLocalNR054 }

constructor TSerasaLocalNR054.Create(AComunicacao: TSeComunicacao);
begin
  FComunicacao := AComunicacao;
end;

function TSerasaLocalNR054.Get(Se: string): string;
begin
  FComunicacao.Logon := Logon;
  FComunicacao.Password := Password;
  FComunicacao.NewPassword := NewPassword;
  Result := FComunicacao.Get(Se);

  if SysUtils.Trim(Result) <> '' then
    Result := 'NR054' + Result;
end;

function TSerasaLocalNR054.TamanhoMaximo: Integer;
begin
  Result := FComunicacao.TamanhoMaximo;
end;

initialization

  AddSeClasseString(TSeNR054);

end.
