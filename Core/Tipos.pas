unit Tipos;

{esta biblioteca visa organizar tipos genéricos. Alguns deles
provavelmente integram a JCL, mesmo que com outros nomes.}

interface

type
  {SysUtils.TIntegerSet é limitado de 0..31.}
  TIntegerSet256 = set of 0..255;

  TCharSet = set of Char;

  TObjectProcedure = procedure of object;

  TStringArray = array of string;

  TIntegerArray = array of Integer;

  TValor = record
    Indice: Integer;
    Valor: Double;
  end;

  TValores = array of TValor;

  TObjetoInterface = class(TObject)
  protected
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;
  end;

implementation

function TObjetoInterface._AddRef: Integer;
begin
  Result := -1;
end;

function TObjetoInterface._Release: Integer;
begin
  Result := -1;
end;

function TObjetoInterface.QueryInterface(const IID: TGUID;
  out Obj): HResult;
const
  LNaoSuportaInterface = HResult($80004002);
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := LNaoSuportaInterface;
end;

end.
