unit MVC_FabricaVisao;

interface

uses
  SysUtils, Classes, ServiceLocator, MVC_Interfaces, MVC_Visao, MVC_Visao_Redireciona, MVC_Visao_NaoModificado;

implementation

type
  TFabricaVisao = class(TSLObject, IFabricaVisao)
  protected
    { IFabricaVisao }
    function CriaNaoModificado: IVisao;
    function CriaRedireciona(const AURL: string): IVisao;
    function CriaRedirecionaJavascript(const AURL: string): IVisao;
    function CriaVisao(const ANomeControlador, ANomeVisao: string): IVisao;
    function CriaVisaoErro(ATipoResposta: TTipoResposta): IVisao;
  end;

{ TFabricaVisao }

function TFabricaVisao.CriaNaoModificado: IVisao;
begin
  Result := TVisaoNaoModificado.Create;
end;

function TFabricaVisao.CriaRedireciona(const AURL: string): IVisao;
begin
  Result := TVisaoRedireciona.Create(AURL);
end;

function TFabricaVisao.CriaRedirecionaJavascript(const AURL: string): IVisao;
begin
  Result := CriaVisao('Redireciona', 'Javascript');
  Result.ModeloValor := AURL;
end;

function TFabricaVisao.CriaVisao(const ANomeControlador, ANomeVisao: string): IVisao;
begin
  Result := ProcuraVisao(ANomeControlador, ANomeVisao);
end;

function TFabricaVisao.CriaVisaoErro(ATipoResposta: TTipoResposta): IVisao;
begin
  try
    case ATipoResposta of
      respostaHTML: Result := CriaVisao('Erro', 'Padrao');
      respostaJSON: Result := CriaVisao('Erro', 'JSON');
    else
      Assert(False, 'Falta definir o tipo da resposta de erro');
    end;
  except
    on e: ENaoEncontrado do
      Result := nil;  
  end;
end;

initialization

  TFabricaVisao.SelfRegister(IFabricaVisao);

end.
