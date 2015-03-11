unit SerasaComunicacao;

interface

uses
  Serasa, SerasaINI, uActiveRecord{, uARSerasLog};

function CreateSerasa(const AConnection: IActiveRecordConnection; TipoComunicacao: TTipoComunicacao = tcComunicacao;
  AComunicacao: TSeComunicacao = nil): TSerasa;

implementation

type
  TSerasaLog = class(TInterfacedObject, ISerasaLog)
  private
    FConnection: IActiveRecordConnection;
  protected
    { ISerasaLog }
    procedure Log(const ALog: string);
  public
    constructor Create(const AConnection: IActiveRecordConnection);
  end;

function CreateSerasa(const AConnection: IActiveRecordConnection; TipoComunicacao: TTipoComunicacao;
  AComunicacao: TSeComunicacao): TSerasa;
begin
  with TSerasaIni.Create(AConnection, TipoComunicacao, AComunicacao) do
  try
    Result := CreateSerasaIni;
  finally
    Free;
  end;

  Result.SerasaLog := TSerasaLog.Create(AConnection);
end;

{ TSerasaLog }

constructor TSerasaLog.Create(const AConnection: IActiveRecordConnection);
begin
  FConnection := AConnection;
end;

procedure TSerasaLog.Log(const ALog: string);
{var
  LSerasLog: IARSerasLog;}
begin
  {LSerasLog := TARSerasLog.Create(FConnection);
  LSerasLog.Log := ALog;
  LSerasLog.Save;}
end;

end.
