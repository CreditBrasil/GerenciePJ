unit MVC_Visao_Recurso;

interface

uses
  SysUtils, HTTPApp, MVC_Interfaces, MVC_Visao, MVC_Recurso;

type
  TVisaoRecurso = class(TVisao)
  private
    FModelo: TRecursoModelo;
  protected
    procedure GeraResposta(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
      AResponse: TWebResponse); override;
    function GetConteudo(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
      AResponse: TWebResponse): string; override;
    function GetModeloObject: TObject; override;
    procedure SetModeloObject(const AValue: TObject); override;
  public
    destructor Destroy; override;
  end;

implementation

{ TVisaoRecurso }

destructor TVisaoRecurso.Destroy;
begin
  //O Response já libera o objeto content, por isso ele não é liberado nem por aqui e nem pelo TRecursoModelo
  FModelo.Free;
  inherited;
end;

procedure TVisaoRecurso.GeraResposta(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
  AResponse: TWebResponse);
const
  sDateFormatGMT = sDateFormat + ' "GMT"';
var
  LAgora: TDateTime;
{$IFNDEF FullDebugMode}
  LAmanha: TDateTime;
{$ENDIF}
begin
  LAgora := Now;
  AResponse.SetCustomHeader('Date', Format(FormatDateTime(sDateFormatGMT, LAgora), [DayOfWeekStr(LAgora), MonthStr(LAgora)]));
  AResponse.SetCustomHeader('Server', AResponse.Server);
  AResponse.SetCustomHeader('X-Powered-By', 'Delphi 7');
{$IFDEF FullDebugMode}
  AResponse.SetCustomHeader('Expires', 'Wed, 11 Jan 1984 05:00:00 GMT');
  AResponse.SetCustomHeader('Last-Modified', Format(FormatDateTime(sDateFormatGMT, GDataHoraDosRecursos), [DayOfWeekStr(GDataHoraDosRecursos), MonthStr(GDataHoraDosRecursos)]));
  AResponse.SetCustomHeader('Cache-Control', 'no-cache, must-revalidate, max-age=0');
  AResponse.SetCustomHeader('Pragma', 'no-cache');
{$ELSE}
  LAmanha := LAgora + 1;
  AResponse.SetCustomHeader('Expires', Format(FormatDateTime(sDateFormatGMT, LAmanha), [DayOfWeekStr(LAmanha), MonthStr(LAmanha)]));
  AResponse.SetCustomHeader('Last-Modified', Format(FormatDateTime(sDateFormatGMT, GDataHoraDosRecursos), [DayOfWeekStr(GDataHoraDosRecursos), MonthStr(GDataHoraDosRecursos)]));
  AResponse.SetCustomHeader('Cache-Control', 'max-age=86400');
{$ENDIF}
  AResponse.ContentType := FModelo.MimeType;
  AResponse.ContentStream := FModelo.Content;
end;

function TVisaoRecurso.GetConteudo(const AFabricaTipoDeRota: IFabricaTipoDeRota; const ARota: IRota;
  AResponse: TWebResponse): string;
begin
  Result := '';
end;

function TVisaoRecurso.GetModeloObject: TObject;
begin
  Result := FModelo;
end;

procedure TVisaoRecurso.SetModeloObject(const AValue: TObject);
begin
  FModelo := AValue as TRecursoModelo;
end;

initialization

  TVisaoRecurso.RegistreSe;

end.
