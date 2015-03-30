unit MVC_SessoesEmMemoria;

interface

uses
  Classes, ServiceLocator, MVC_Interfaces;

type
  TSessoesEmMemoria = class(TSLObject, ISessoes)
  private
    FSessoes: IInterfaceList;
  protected
    { ISessoes }
    procedure ArmazenaSessao(const ASessao: ISessao);
    procedure ExcluiTodasAsSessoes;
    function RecuperaSessao(const AGUID: TGUID; AForca: Boolean): ISessao;
  public
    constructor Create; override;
  end;

implementation

{ TSessoesEmMemoria }

procedure TSessoesEmMemoria.ArmazenaSessao(const ASessao: ISessao);
begin
  //Faz Nada
end;

constructor TSessoesEmMemoria.Create;
begin
  inherited;
  FSessoes := TInterfaceList.Create;
end;

procedure TSessoesEmMemoria.ExcluiTodasAsSessoes;
var
  laco: Integer;
begin
  FSessoes.Lock;
  try
    for laco := 0 to FSessoes.Count - 1 do
      SL.Remove((FSessoes[laco] as ISessao).GUID);
    FSessoes.Clear;
  finally
    FSessoes.Unlock;
  end;
end;

function TSessoesEmMemoria.RecuperaSessao(const AGUID: TGUID; AForca: Boolean): ISessao;
begin
  if SL.Exist(AGUID) then
    Result := SL.Get(AGUID) as ISessao
  else if AForca then
  begin
    Result := SL as ISessao;
    Result.GUID := AGUID;
    SL.Add(AGUID, Result);
    FSessoes.Add(Result);
  end
  else
    Result := nil;
end;

initialization

  SL.Add(ISessoes, TSessoesEmMemoria.Create as ISessoes);

end.
