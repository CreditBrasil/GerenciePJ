unit MVC_ProcessaRequisicoes;

interface

uses
  SysUtils, Classes, HTTPApp, WebReq, ServiceLocator, MVC_Interfaces, MVC_Rotas;

procedure ProcessaAcao(Request: TWebRequest; Response: TWebResponse);

implementation

procedure ProcessaAcao(Request: TWebRequest; Response: TWebResponse);
var
  LFabricaTipoDeRota: IFabricaTipoDeRota;
  LTipoDeRota: ITipoDeRota;
  LRota: IRota;
  LControlador: IControlador;
  LFabricaVisao: IFabricaVisao;
  LVisao: IVisao;

  function TipoResposta: TTipoResposta;
  begin
    if LControlador <> nil then
      Result := LControlador.TipoResposta
    else
      Result := respostaHTML;
  end;

begin
  LFabricaVisao := SL as IFabricaVisao;
  try
    LFabricaTipoDeRota := TFabricaTipoDeRota.Create(Request);
    LTipoDeRota := LFabricaTipoDeRota.CriaTipoDeRotaAtual;
    LRota := LTipoDeRota.CriaRota;
    LControlador := (SL as IFabricaControlador).CriaControlador(LRota);
    LControlador.FabricaTipoDeRota := LFabricaTipoDeRota;
    LControlador.FabricaVisao := LFabricaVisao;
    LVisao := LControlador.ProcessaERetornaVisao(LRota, Request, Response);
    LVisao.GeraResposta(LFabricaTipoDeRota, LRota, Response);
  except
    on e: ERota do
    begin
      LVisao := LFabricaVisao.CriaVisaoErro(TipoResposta);
      if LVisao <> nil then
      begin
        LVisao.ModeloObject := e.CriaErroModelo;
        LVisao.GeraResposta(LFabricaTipoDeRota, LRota, Response);
      end
      else
        raise;
    end;
    on e: Exception do
    begin
      LVisao := LFabricaVisao.CriaVisaoErro(TipoResposta);
      if LVisao <> nil then
      begin
        LVisao.ModeloObject := TErroModelo.CreateParaException(e.ClassName + ': ' + e.Message);
        LVisao.GeraResposta(LFabricaTipoDeRota, LRota, Response);
      end
      else
        raise;
    end;
  end;
end;

end.

