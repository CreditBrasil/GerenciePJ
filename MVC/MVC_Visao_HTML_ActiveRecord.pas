unit MVC_Visao_HTML_ActiveRecord;

interface

uses
  SysUtils, Classes, HTTPApp, uActiveRecord, MVC_Interfaces, MVC_Visao_HTML, ServiceLocator;

type
  TTabelaCelulaEvento = procedure (AFieldIndex: Integer; const AAccess: IActiveRecordAccess;
    const AFieldMetadata: TFieldMetadata; const ACelula: IHTMLFluente) of object;
  TTabelaLinhaEvento = procedure (const AAccess: IActiveRecordAccess; const AMetadata: IActiveRecordMetadata;
    const ALinha: IHTMLFluente) of object;

  ITabelaPara = interface(IConverteParaHTMLFluente)
    ['{5B622B69-387E-4F2E-91D5-459FBABC6C52}']
    function CamposASeremMostrados(const ACamposASeremMostrados: array of Integer): ITabelaPara;
    function Link(ACampoDoLink, ACampoTerceiroElementoDaRota: Integer; const ARotaFluente: IRotaFluente;
      AIcone: TIcone = glyphicon_eye_open): ITabelaPara; overload;
    function Link(const ATituloBotao: string; ACampoTerceiroElementoDaRota: Integer; const ARotaFluente: IRotaFluente;
      AIcone: TIcone = glyphicon_eye_open): ITabelaPara; overload;
    function SetOnCelula(const ATabelaCelulaEvento: TTabelaCelulaEvento): ITabelaPara;
    function SetOnLinha(const ATabelaLinhaEvento: TTabelaLinhaEvento): ITabelaPara;
    function SetTotalizacao(const ATotalizacao: IActiveRecordTotalizacao): ITabelaPara;
  end;

  ISelecaoPara = interface(IConverteParaHTMLFluente)
    ['{890F8027-71B3-4A78-AC80-505B53579BC9}']
    function CamposASeremMostrados(const ACamposASeremMostrados: array of Integer): ISelecaoPara;
    function DestacarTexto(const ATextoADestacar: string): ISelecaoPara;
    function SetIcone(AIcone: TIcone): ISelecaoPara;
  end;

  TControlGroupTamanho = (cgNaoDefinido, cgMinimo, cgPequeno, cgMedio, cgGrande, cgExtraGrande, cgExtraExtraGrande);

  IControlGroupPara = interface(IConverteParaHTMLFluente)
    ['{C039846E-DCAF-4D6E-A438-97F93561CADD}']
    function Input_AddClasse(const AClasse: string): IControlGroupPara;
    function Mensagem_AddClasse(const AClasse: string): IControlGroupPara;
    function Mensagem_TrocaTexto(const ATexto: string): IControlGroupPara;
    function Rotulo_AddClasse(const AClasse: string): IControlGroupPara;
    function Rotulo_TrocaTexto(const ATexto: string): IControlGroupPara;
    function SetDisabled(ADisabled: Boolean): IControlGroupPara;
    function SetTamanho(ATamanho: TControlGroupTamanho): IControlGroupPara;
  end;

  IComboBoxPara = interface(IConverteParaHTMLFluente)
    ['{E4383BA0-8183-463E-B828-750B47F8E568}']
    function AdicionarIterador(const AIterator: IIteratorActiveRecord; const AMetadata: IActiveRecordMetadata;
      AFieldIndexNome, AFieldIndexValor: Integer): IComboBoxPara;
    function AdicionarOpcao(const ATexto: string; const AValor: string = ''): IComboBoxPara;
    function Mensagem_AddClasse(const AClasse: string): IComboBoxPara;
    function Mensagem_TrocaTexto(const ATexto: string): IComboBoxPara;
    function Rotulo_AddClasse(const AClasse: string): IComboBoxPara;
    function Rotulo_TrocaTexto(const ATexto: string): IComboBoxPara;
    function SetDisabled(ADisabled: Boolean): IComboBoxPara;
  end;

  IGeraHTMLModeloPara = interface
    ['{263B80C5-1228-4F29-B347-D9AF7E069082}']
    function CampoSenhaPara(AFieldIndex: Integer; AComPlaceholder: Boolean = False): ITagHTMLFluente;
    function CampoTextoPara(AFieldIndex: Integer; AComPlaceholder: Boolean = False): ITagHTMLFluente;
    function CheckboxPara(AFieldIndex: Integer): ITagHTMLFluente;
    function ClasseHTMLPara(AFieldIndex: Integer): THTMLPuro;
    function ComboBoxPara(AFieldIndex: Integer): IComboBoxPara;
    function ControlGroupPara(AFieldIndex: Integer): IControlGroupPara;
    function MensagemPara(AFieldIndex: Integer): string;
    function RotuloPara(AFieldIndex: Integer): IHTMLFluente;
    function TituloPara(AFieldIndex: Integer; AParaColuna: Boolean = True): string;
    function ValorAMostrarPara(AFieldIndex: Integer): string;
  end;

  IGeraHTMLIteradorPara = interface
    ['{55FDC77E-5077-4F08-8608-8F6467CC6CAC}']
    function SelecaoPara(ACampoTerceiroElementoDaRota: Integer; const ARotaFluente: IRotaFluente): ISelecaoPara;
    function TabelaPara: ITabelaPara;
  end;

  TVisaoHTMLActiveRecord = class(TVisaoHTML)
  private
    FAccess: IActiveRecordAccess;
    FIterator: IIteratorActiveRecord;
    FMetadata: IActiveRecordMetadata;
  protected
    function AvisoModelo: THTMLPuro;
    function CampoSenhaPara(AFieldIndex: Integer; AComPlaceholder: Boolean = False): ITagHTMLFluente;
    function CampoTextoPara(AFieldIndex: Integer; AComPlaceholder: Boolean = False): ITagHTMLFluente;
    function CheckboxPara(AFieldIndex: Integer): ITagHTMLFluente;
    function ClasseHTMLPara(AFieldIndex: Integer): THTMLPuro;
    function ControlGroupPara(AFieldIndex: Integer): IControlGroupPara;
    function GeraHTMLIterador: IGeraHTMLIteradorPara;
    function GeraHTMLIteradorPara(const AIterator: IIteratorActiveRecord;
      const AMetadata: IActiveRecordMetadata; const APrefixoDoNome: string): IGeraHTMLIteradorPara;
    function GeraHTMLModelo: IGeraHTMLModeloPara;
    function GeraHTMLModeloPara(const AAccess: IActiveRecordAccess;
      const AMetadata: IActiveRecordMetadata; const APrefixoDoNome: string): IGeraHTMLModeloPara;
    function MensagemPara(AFieldIndex: Integer): string;
    function RotuloPara(AFieldIndex: Integer): IHTMLFluente;
    function SelecaoPara(ACampoTerceiroElementoDaRota: Integer; const ARotaFluente: IRotaFluente): ISelecaoPara;
    procedure SetModeloInterface(const AValue: IInterface); override;
    function TabelaPara: ITabelaPara;
    function TituloPara(AFieldIndex: Integer; AParaColuna: Boolean = True): string;
    function ValorAMostrarPara(AFieldIndex: Integer): string;
    procedure WriteVl(const AValor: TNullableString); overload;
    procedure WriteVl(const AValor: TNullableDateTime); overload;
    procedure WriteVl(const AValor: TNullableCurrency); overload;
    property Access: IActiveRecordAccess read FAccess;
    property Iterator: IIteratorActiveRecord read FIterator;
    property Metadata: IActiveRecordMetadata read FMetadata;
  public
    class function DeterminaCamposVisiveis(const AMetadata: IActiveRecordMetadata): TFieldIndexes;
    class function ModeloCampoSenhaPara(const AMetadata: IActiveRecordMetadata; const APrefixoDoNome: string;
      AFieldIndex: Integer; AComPlaceholder: Boolean = False): ITagHTMLFluente;
    class function ModeloCampoTextoPara(const AAccess: IActiveRecordAccess; const AMetadata: IActiveRecordMetadata;
      AParametros: IParametros; const APrefixoDoNome: string; AFieldIndex: Integer;
      AComPlaceholder: Boolean = False): ITagHTMLFluente;
    class function ModeloCheckboxPara(const AAccess: IActiveRecordAccess; const AMetadata: IActiveRecordMetadata;
      AParametros: IParametros; const APrefixoDoNome: string; AFieldIndex: Integer): ITagHTMLFluente;
    class function ModeloClasseHTMLPara(const AMetadata: IActiveRecordMetadata; AFieldIndex: Integer): THTMLPuro;
    class function ModeloComboBoxPara(const AAccess: IActiveRecordAccess; const AMetadata: IActiveRecordMetadata;
      AParametros: IParametros; const APrefixoDoNome: string; AFieldIndex: Integer; AOpcoes: TStrings): IHTMLFluente;
    class function ModeloMensagemPara(AParametros: IParametros; const AMetadata: IActiveRecordMetadata;
      const APrefixoDoNome: string; AFieldIndex: Integer): string;
    class function ModeloRotuloPara(const AMetadata: IActiveRecordMetadata; const APrefixoDoNome: string;
      AFieldIndex: Integer): IHTMLFluente;
    class function ModeloTituloPara(const AMetadata: IActiveRecordMetadata; AFieldIndex: Integer;
      AParaColuna: Boolean = False): string;
    class function ModeloValorAMostrarPara(const AAccess: IActiveRecordAccess; AFieldIndex: Integer): string;
    class function CreateTotalizacao: IActiveRecordTotalizacao;
  end;

implementation

type
  TTabelaPara = class(TInterfacedObject, IConverteParaHTMLFluente, ITabelaPara)
  private
    FCampoDoLink, FCampoTerceiroElementoDaRota: Integer;
    FCampos: TFieldIndexes;
    FIconeLink: TIcone;
    FIterator: IIteratorActiveRecord;
    FMetadata: IActiveRecordMetadata;
    FPrefixoDoNome: string;
    FRotaFluente: IRotaFluente;
    FTabelaCelulaEvento: TTabelaCelulaEvento;
    FTabelaLinhaEvento: TTabelaLinhaEvento;
    FTituloBotao: string;
    FTotalizacao: IActiveRecordTotalizacao;
  protected
    { IConverteParaHTMLFluente }
    function HTML: IHTMLFluente;
    { ITabelaPara }
    function CamposASeremMostrados(const ACamposASeremMostrados: array of Integer): ITabelaPara;
    function Link(ACampoDoLink, ACampoTerceiroElementoDaRota: Integer; const ARotaFluente: IRotaFluente;
      AIcone: TIcone = glyphicon_eye_open): ITabelaPara; overload;
    function Link(const ATituloBotao: string; ACampoTerceiroElementoDaRota: Integer; const ARotaFluente: IRotaFluente;
      AIcone: TIcone = glyphicon_eye_open): ITabelaPara; overload;
    function SetOnCelula(const ATabelaCelulaEvento: TTabelaCelulaEvento): ITabelaPara;
    function SetOnLinha(const ATabelaLinhaEvento: TTabelaLinhaEvento): ITabelaPara;
    function SetTotalizacao(const ATotalizacao: IActiveRecordTotalizacao): ITabelaPara;
  public
    constructor Create(const AIterator: IIteratorActiveRecord; const AMetadata: IActiveRecordMetadata;
      const APrefixoDoNome: string);
  end;

  TSelecaoPara = class(TInterfacedObject, IConverteParaHTMLFluente, ISelecaoPara)
  private
    FCampoTerceiroElementoDaRota: Integer;
    FCampos: TFieldIndexes;
    FIcone: string;
    FIterator: IIteratorActiveRecord;
    FMetadata: IActiveRecordMetadata;
    FPrefixoDoNome: string;
    FRotaFluente: IRotaFluente;
    FTextoADestacar: string;
  protected
    { IConverteParaHTMLFluente }
    function HTML: IHTMLFluente;
    { ISelecaoPara }
    function CamposASeremMostrados(const ACamposASeremMostrados: array of Integer): ISelecaoPara;
    function DestacarTexto(const ATextoADestacar: string): ISelecaoPara;
    function SetIcone(AIcone: TIcone): ISelecaoPara;
  public
    constructor Create(const AIterator: IIteratorActiveRecord; const AMetadata: IActiveRecordMetadata;
      const APrefixoDoNome: string; ACampoTerceiroElementoDaRota: Integer; const ARotaFluente: IRotaFluente);
  end;

  TControlGroupPara = class(TInterfacedObject, IConverteParaHTMLFluente, IControlGroupPara)
  private
    FAccess: IActiveRecordAccess;
    FFieldIndex: Integer;
    FInput_AddClasse: string;
    FMensagem_AddClasse: string;
    FMensagem_TrocaTexto: string;
    FMetadata: IActiveRecordMetadata;
    FParametros: IParametros;
    FPrefixoDoNome: string;
    FRotulo_AddClasse: string;
    FRotulo_TrocaTexto: string;
    FSetDisabled: Boolean;
    FTamanho: TControlGroupTamanho;
  protected
    { IConverteParaHTMLFluente }
    function HTML: IHTMLFluente;
    { IControlGroupPara }
    function Input_AddClasse(const AClasse: string): IControlGroupPara;
    function Mensagem_AddClasse(const AClasse: string): IControlGroupPara;
    function Mensagem_TrocaTexto(const ATexto: string): IControlGroupPara;
    function Rotulo_AddClasse(const AClasse: string): IControlGroupPara;
    function Rotulo_TrocaTexto(const ATexto: string): IControlGroupPara;
    function SetDisabled(ADisabled: Boolean): IControlGroupPara;
    function SetTamanho(ATamanho: TControlGroupTamanho): IControlGroupPara;
  public
    constructor Create(AFieldIndex: Integer; const AAccess: IActiveRecordAccess;
      const AMetadata: IActiveRecordMetadata; AParametros: IParametros; const APrefixoDoNome: string);
  end;

  TComboBoxPara = class(TInterfacedObject, IConverteParaHTMLFluente, IComboBoxPara)
  private
    FAccess: IActiveRecordAccess;
    FDisabled: Boolean;
    FFieldIndex: Integer;
    FMensagem: IHTMLFluente;
    FMetadata: IActiveRecordMetadata;
    FOpcoes: TStringList;
    FParametros: IParametros;
    FPrefixoDoNome: string;
    FRotulo: IHTMLFluente;
    FTemErro: Boolean;
  protected
    { IConverteParaHTMLFluente }
    function HTML: IHTMLFluente;
    { IComboBoxPara }
    function AdicionarIterador(const AIterator: IIteratorActiveRecord; const AMetadata: IActiveRecordMetadata;
      AFieldIndexOpcao, AFieldIndexValor: Integer): IComboBoxPara;
    function AdicionarOpcao(const ATexto: string; const AValor: string = ''): IComboBoxPara;
    function Mensagem_AddClasse(const AClasse: string): IComboBoxPara;
    function Mensagem_TrocaTexto(const ATexto: string): IComboBoxPara;
    function Rotulo_AddClasse(const AClasse: string): IComboBoxPara;
    function Rotulo_TrocaTexto(const ATexto: string): IComboBoxPara;
    function SetDisabled(ADisabled: Boolean): IComboBoxPara;
  public
    constructor Create(AFieldIndex: Integer; const AAccess: IActiveRecordAccess;
      const AMetadata: IActiveRecordMetadata; AParametros: IParametros; const APrefixoDoNome: string);
    destructor Destroy; override;
  end;

  TGeraHTMLModeloPara = class(TInterfacedObject, IGeraHTMLModeloPara)
  private
    FAccess: IActiveRecordAccess;
    FMetadata: IActiveRecordMetadata;
    FParametros: IParametros;
    FPrefixoDoNome: string;
  protected
    { IGeraHTMLModeloPara }
    function CampoSenhaPara(AFieldIndex: Integer; AComPlaceholder: Boolean = False): ITagHTMLFluente;
    function CampoTextoPara(AFieldIndex: Integer; AComPlaceholder: Boolean = False): ITagHTMLFluente;
    function CheckboxPara(AFieldIndex: Integer): ITagHTMLFluente;
    function ClasseHTMLPara(AFieldIndex: Integer): THTMLPuro;
    function ComboBoxPara(AFieldIndex: Integer): IComboBoxPara;
    function ControlGroupPara(AFieldIndex: Integer): IControlGroupPara;
    function MensagemPara(AFieldIndex: Integer): string;
    function RotuloPara(AFieldIndex: Integer): IHTMLFluente;
    function TituloPara(AFieldIndex: Integer; AParaColuna: Boolean = True): string;
    function ValorAMostrarPara(AFieldIndex: Integer): string;
  public
    constructor Create(const AAccess: IActiveRecordAccess; const AMetadata: IActiveRecordMetadata;
      AParametros: IParametros; const APrefixoDoNome: string);
  end;

  TGeraHTMLIteradorPara = class(TInterfacedObject, IGeraHTMLIteradorPara)
  private
    FIterator: IIteratorActiveRecord;
    FMetadata: IActiveRecordMetadata;
    FParametros: IParametros;
    FPrefixoDoNome: string;
  protected
    { IGeraHTMLIteradorPara }
    function SelecaoPara(ACampoTerceiroElementoDaRota: Integer; const ARotaFluente: IRotaFluente): ISelecaoPara;
    function TabelaPara: ITabelaPara;
  public
    constructor Create(const AIterator: IIteratorActiveRecord; const AMetadata: IActiveRecordMetadata;
      AParametros: IParametros; const APrefixoDoNome: string);
  end;

{ TTabelaPara }

function TTabelaPara.CamposASeremMostrados(const ACamposASeremMostrados: array of Integer): ITabelaPara;
var
  laco: Integer;
begin
  Result := Self;
  SetLength(FCampos, Length(ACamposASeremMostrados));
  for laco := 0 to High(ACamposASeremMostrados) do
    FCampos[laco] := ACamposASeremMostrados[laco];
end;

constructor TTabelaPara.Create(const AIterator: IIteratorActiveRecord; const AMetadata: IActiveRecordMetadata;
  const APrefixoDoNome: string);
begin
  FIterator := AIterator;
  FMetadata := AMetadata;
  FPrefixoDoNome := APrefixoDoNome;
  FCampoDoLink := -1;
end;

function TTabelaPara.HTML: IHTMLFluente;

  function Valor(const AAccess: IActiveRecordAccess; ACampo: Integer): THTMLPuro;
  begin
    if FCampoDoLink = ACampo then
      Result := TVisaoHTMLActiveRecord.Botao(tbDefault,
        FRotaFluente.Clonar.AddOutro(AAccess.AsString[FCampoTerceiroElementoDaRota]),
        AAccess.DisplayText(ACampo), FIconeLink).AddClasse('btn-xs').HTMLPuro
    else
      Result := TVisaoHTMLActiveRecord.HTMLPuro(HTMLEncode(AAccess.DisplayText(ACampo)));
  end;

var
  LConteudo, LConteudoLinha: string;
  laco, LCamposSemTotalizacao: Integer;
  LAccess: IActiveRecordAccess;
  LFieldMetadata: TFieldMetadata;
  LCelula, LLinha: IHTMLFluente;
begin
  if FCampos = nil then
    FCampos := TVisaoHTMLActiveRecord.DeterminaCamposVisiveis(FMetadata);
  LConteudo := #13#10#09'<thead>'#13#10#09#09'<tr>'#13#10;
  if FTituloBotao <> '' then
  begin
    LFieldMetadata := FMetadata.FieldMetadata(FCampoTerceiroElementoDaRota);
    LConteudo := LConteudo + Format(#09#09#09'<th id="%s"></th>'#13#10, [
      TVisaoHTMLActiveRecord.CodificaParametro(LFieldMetadata.Name)]);
  end;
  for laco := 0 to Length(FCampos) - 1 do
  begin
    LFieldMetadata := FMetadata.FieldMetadata(FCampos[laco]);
    LConteudo := LConteudo + Format(#09#09#09'<th id="%s">%s</th>'#13#10, [
      TVisaoHTMLActiveRecord.CodificaParametro(LFieldMetadata.Name), HTMLEncode(LFieldMetadata.Title)]);
  end;
  LConteudo := LConteudo + #09#09'</tr>'#13#10#09'</thead>'#13#10#09'<tbody>'#13#10;
  if FTotalizacao <> nil then
    FTotalizacao.Limpa;
  with FIterator do
    while Next do
    begin
      LConteudoLinha := #13#10#09#09;
      LAccess := CurrentItemActiveRecord.Access;
      if FTituloBotao <> '' then
      begin
        LFieldMetadata := FMetadata.FieldMetadata(FCampoTerceiroElementoDaRota);
        LCelula := TVisaoHTMLActiveRecord.HTMLFluente('td')
          .SetAtributo('headers', LFieldMetadata.Name)
          .AddClasse('BotaoAcao')
          .SetDentro(TVisaoHTMLActiveRecord.Botao(tbDefault,
            FRotaFluente.Clonar.AddOutro(LAccess.AsString[FCampoTerceiroElementoDaRota]),
            FTituloBotao, FIconeLink).AddClasse('btn-xs').HTMLPuro);
        if Assigned(FTabelaCelulaEvento) then
          FTabelaCelulaEvento(LFieldMetadata.Index, LAccess, LFieldMetadata, LCelula);
        LConteudoLinha := LConteudoLinha + #09 + LCelula.HTMLPuro.Conteudo + #13#10#09#09;
      end;
      for laco := 0 to Length(FCampos) - 1 do
      begin
        LFieldMetadata := FMetadata.FieldMetadata(FCampos[laco]);
        LCelula := TVisaoHTMLActiveRecord.HTMLFluente('td')
          .SetAtributo('headers', LFieldMetadata.Name)
          .AddClasse(TVisaoHTMLActiveRecord.ModeloClasseHTMLPara(FMetadata, LFieldMetadata.Index).Conteudo)
          .SetDentro(Valor(LAccess, FCampos[laco]));
        if Assigned(FTabelaCelulaEvento) then
          FTabelaCelulaEvento(LFieldMetadata.Index, LAccess, LFieldMetadata, LCelula);
        LConteudoLinha := LConteudoLinha + #09 + LCelula.HTMLPuro.Conteudo + #13#10#09#09;
      end;
      LLinha := TVisaoHTMLActiveRecord.HTMLFluente('tr')
        .SetDentro(TVisaoHTMLActiveRecord.HTMLPuro(LConteudoLinha));
      if Assigned(FTabelaLinhaEvento) then
        FTabelaLinhaEvento(LAccess, FMetadata, LLinha);
      LConteudo := LConteudo + #09#09 + LLinha.HTMLPuro.Conteudo + #13#10;
      if FTotalizacao <> nil then
        FTotalizacao.Processa(LAccess);
    end;
  if FTotalizacao <> nil then
  begin
    LConteudoLinha := #13#10#09#09;
    LCamposSemTotalizacao := 0;
    for laco := 0 to Length(FCampos) - 1 do
    begin
      LFieldMetadata := FMetadata.FieldMetadata(FCampos[laco]);
      if FTotalizacao.Tem(LFieldMetadata.Index) then
      begin
        if LCamposSemTotalizacao > 0 then
        begin
          LCelula := TVisaoHTMLActiveRecord.HTMLFluente('td')
            .SetAtributo('colspan', IntToStr(LCamposSemTotalizacao))
            .AddClasse('RotuloTotalizadora')
            .SetDentro('Total:');
          LConteudoLinha := LConteudoLinha + #09 + LCelula.HTMLPuro.Conteudo + #13#10#09#09;
          LCamposSemTotalizacao := -1;
        end;
        LCelula := TVisaoHTMLActiveRecord.HTMLFluente('td')
          .SetAtributo('headers', LFieldMetadata.Name)
          .AddClasse(TVisaoHTMLActiveRecord.ModeloClasseHTMLPara(FMetadata, LFieldMetadata.Index).Conteudo)
          .SetDentro(FTotalizacao.DisplayText(LFieldMetadata.Index));
        LConteudoLinha := LConteudoLinha + #09 + LCelula.HTMLPuro.Conteudo + #13#10#09#09;
      end
      else if LCamposSemTotalizacao >= 0 then
        Inc(LCamposSemTotalizacao)
      else
      begin
        LCelula := TVisaoHTMLActiveRecord.HTMLFluente('td')
          .SetDentro(TVisaoHTMLActiveRecord.HTMLPuro('&nbsp;'));
        LConteudoLinha := LConteudoLinha + #09 + LCelula.HTMLPuro.Conteudo + #13#10#09#09;
      end;
    end;
    LLinha := TVisaoHTMLActiveRecord.HTMLFluente('tr')
      .AddClasse('Totalizadora')
      .SetDentro(TVisaoHTMLActiveRecord.HTMLPuro(LConteudoLinha));
    LConteudo := LConteudo + #09#09 + LLinha.HTMLPuro.Conteudo + #13#10;
  end;
  LConteudo := LConteudo + #09'</tbody>'#13#10;
  Result := TVisaoHTMLActiveRecord.HTMLFluente('table')
    .SetId('table' + FPrefixoDoNome + FMetadata.TableMetadata.Name)
    .SetDentro(TVisaoHTMLActiveRecord.HTMLPuro(LConteudo));
end;

function TTabelaPara.Link(ACampoDoLink, ACampoTerceiroElementoDaRota: Integer;
  const ARotaFluente: IRotaFluente; AIcone: TIcone): ITabelaPara;
begin
  Result := Self;
  FCampoDoLink := ACampoDoLink;
  FCampoTerceiroElementoDaRota := ACampoTerceiroElementoDaRota;
  FRotaFluente := ARotaFluente;
  FIconeLink := AIcone;
  FTituloBotao := '';
end;

function TTabelaPara.Link(const ATituloBotao: string; ACampoTerceiroElementoDaRota: Integer;
  const ARotaFluente: IRotaFluente; AIcone: TIcone): ITabelaPara;
begin
  Result := Self;
  FCampoDoLink := -1;
  FCampoTerceiroElementoDaRota := ACampoTerceiroElementoDaRota;
  FRotaFluente := ARotaFluente;
  FIconeLink := AIcone;
  FTituloBotao := ATituloBotao;
end;

function TTabelaPara.SetOnCelula(const ATabelaCelulaEvento: TTabelaCelulaEvento): ITabelaPara;
begin
  Result := Self;
  FTabelaCelulaEvento := ATabelaCelulaEvento;
end;

function TTabelaPara.SetOnLinha(const ATabelaLinhaEvento: TTabelaLinhaEvento): ITabelaPara;
begin
  Result := Self;
  FTabelaLinhaEvento := ATabelaLinhaEvento;
end;

function TTabelaPara.SetTotalizacao(const ATotalizacao: IActiveRecordTotalizacao): ITabelaPara;
begin
  Result := Self;
  FTotalizacao := ATotalizacao;
end;

{ TSelecaoPara }

function TSelecaoPara.CamposASeremMostrados(const ACamposASeremMostrados: array of Integer): ISelecaoPara;
var
  laco: Integer;
begin
  Result := Self;
  SetLength(FCampos, Length(ACamposASeremMostrados));
  for laco := 0 to High(ACamposASeremMostrados) do
    FCampos[laco] := ACamposASeremMostrados[laco];
end;

constructor TSelecaoPara.Create(const AIterator: IIteratorActiveRecord; const AMetadata: IActiveRecordMetadata;
  const APrefixoDoNome: string; ACampoTerceiroElementoDaRota: Integer; const ARotaFluente: IRotaFluente);
begin
  FIterator := AIterator;
  FMetadata := AMetadata;
  FPrefixoDoNome := APrefixoDoNome;
  FCampoTerceiroElementoDaRota := ACampoTerceiroElementoDaRota;
  FRotaFluente := ARotaFluente;
end;

function TSelecaoPara.DestacarTexto(const ATextoADestacar: string): ISelecaoPara;
begin
  Result := Self;
  FTextoADestacar := AnsiUpperCase(ATextoADestacar);
end;

function TSelecaoPara.HTML: IHTMLFluente;

  function DestacarECodificar(const ATexto: string): string;
  var
    p: Integer;
  begin
    if FTextoADestacar = '' then
      Result := HTMLEncode(ATexto)
    else
    begin
      p := AnsiPos(FTextoADestacar, AnsiUpperCase(ATexto));
      if p > 0 then
        Result := HTMLEncode(Copy(ATexto, 1, p - 1)) + '<span class="destaque">' + HTMLEncode(Copy(ATexto, p,
          Length(FTextoADestacar))) + '</span>' + DestacarECodificar(Copy(ATexto, p + Length(FTextoADestacar), MaxInt))
      else
        Result := HTMLEncode(ATexto);
    end;
  end;

var
  LConteudo, LValor, LRotulo: string;
  LAccess: IActiveRecordAccess;
  laco: Integer;
begin
  if FCampos = nil then
    FCampos := TVisaoHTMLActiveRecord.DeterminaCamposVisiveis(FMetadata);
  LConteudo := '';
  with FIterator do
    while Next do
    begin
      LRotulo := FIcone;
      LAccess := CurrentItemActiveRecord.Access;
      for laco := 0 to Length(FCampos) - 1 do
      begin
        LValor := DestacarECodificar(LAccess.DisplayText(FCampos[laco]));
        if LValor <> '' then
          LRotulo := LRotulo + LValor + ' - ';
      end;
      Delete(LRotulo, Length(LRotulo) - 2, 3);
      LConteudo := LConteudo + Format(#09'%s'#13#10, [
        TVisaoHTMLActiveRecord.Acao(FRotaFluente.Clonar.AddOutro(LAccess.AsString[FCampoTerceiroElementoDaRota]),
          TVisaoHTMLActiveRecord.HTMLPuro(LRotulo)).AddClasse('list-group-item').HTMLPuro.Conteudo]);
    end;
  Result := TVisaoHTMLActiveRecord.HTMLFluente('div')
    .SetClasse('list-group')
    .SetDentro(TVisaoHTML.HTMLPuro(LConteudo))
    .SetId('selection' + FPrefixoDoNome + FMetadata.TableMetadata.Name);
end;

function TSelecaoPara.SetIcone(AIcone: TIcone): ISelecaoPara;
begin
  Result := Self;
  FIcone := TVisaoHTMLActiveRecord.Icone(AIcone).Conteudo;
end;

{ TControlGroupPara }

constructor TControlGroupPara.Create(AFieldIndex: Integer; const AAccess: IActiveRecordAccess;
  const AMetadata: IActiveRecordMetadata; AParametros: IParametros; const APrefixoDoNome: string);
begin
  FFieldIndex := AFieldIndex;
  FAccess := AAccess;
  FMetadata := AMetadata;
  FParametros := AParametros;
  FPrefixoDoNome := APrefixoDoNome;
end;

function TControlGroupPara.HTML: IHTMLFluente;
const
  LTamanho: array [TControlGroupTamanho] of string = (
    '', //cgNaoDefinido
    'col-lg-1 col-md-2 col-sm-2', //cgMinimo
    'col-lg-2 col-md-3 col-sm-3', //cgPequeno
    'col-lg-4 col-md-5 col-sm-6', //cgMedio
    'col-lg-5 col-md-6 col-sm-7', //cgGrande
    'col-lg-7 col-md-8', //cgExtraGrande
    'col-lg-9 col-md-9' //cgExtraExtraGrande
    );
var
  LRotulo: IHTMLFluente;
  LInput: ITagHTMLFluente;
  LTextoMensagem: string;
  LTemErro: Boolean;
  LTextoRotulo: string;
begin
  LTextoMensagem := TVisaoHTMLActiveRecord.ModeloMensagemPara(FParametros, FMetadata, FPrefixoDoNome, FFieldIndex);
  LTemErro := LTextoMensagem <> '';
  if FMensagem_TrocaTexto <> '' then
    LTextoMensagem := FMensagem_TrocaTexto;
  case FMetadata.FieldMetadata(FFieldIndex).FieldType of
    arftDateTime, arftFloat, arftInteger, arftMoney, arftVarchar, arftMemo, arftColor:
      begin
        LRotulo := TVisaoHTMLActiveRecord.ModeloRotuloPara(FMetadata, FPrefixoDoNome, FFieldIndex)
          .SetClasse('col-lg-3 col-md-3 control-label');
        if FRotulo_AddClasse <> '' then
          LRotulo.AddClasse(FRotulo_AddClasse);
        if FRotulo_TrocaTexto <> '' then
          LRotulo.SetDentro(FRotulo_TrocaTexto);
        LInput := TVisaoHTMLActiveRecord.ModeloCampoTextoPara(FAccess, FMetadata, FParametros, FPrefixoDoNome,
          FFieldIndex).AddClasse('form-control');
        if FInput_AddClasse <> '' then
          LInput.AddClasse(FInput_AddClasse);
        LInput.SetDisabled(FSetDisabled);
        Result := TVisaoHTMLActiveRecord.HTMLFluente('div')
          .SetClasse('form-group')
          .SetDentro(TVisaoHTMLActiveRecord.HTMLPuro(
            LRotulo.HTMLPuro.Conteudo +
            '<div class="' + LTamanho[FTamanho] + '">' + LInput.HTMLPuro.Conteudo +
            '<span class="help-block">' + HTMLEncode(LTextoMensagem) + '</span></div>'
          ));
      end;
    arftNS, arftB01:
      begin
        LTextoRotulo := TVisaoHTMLActiveRecord.ModeloTituloPara(FMetadata, FFieldIndex);
        if FRotulo_TrocaTexto <> '' then
          LTextoRotulo := FRotulo_TrocaTexto;
        if FRotulo_AddClasse <> '' then
          LTextoRotulo := TVisaoHTMLActiveRecord.HTMLFluente('div')
            .SetClasse(FRotulo_AddClasse)
            .SetDentro(LTextoRotulo).HTMLPuro.Conteudo
        else
          LTextoRotulo := HTMLEncode(LTextoRotulo);
        LInput := TVisaoHTMLActiveRecord.ModeloCheckboxPara(FAccess, FMetadata, FParametros, FPrefixoDoNome,
          FFieldIndex);
        if FInput_AddClasse <> '' then
          LInput.AddClasse(FInput_AddClasse);
        LInput.SetDisabled(FSetDisabled);
        Result := TVisaoHTMLActiveRecord.HTMLFluente('div')
          .SetClasse('form-group')
          .SetDentro(TVisaoHTMLActiveRecord.HTMLPuro(
            '<div class="col-lg-offset-3 col-md-offset-3 col-lg-9 col-md-9">' +
            '<label>' + LInput.HTMLPuro.Conteudo + ' ' + LTextoRotulo + '</label>' +
            '<span class="help-block">' + HTMLEncode(LTextoMensagem) + '</span></div>'
          ));
      end;
  else
    Assert(False, 'Falta implementar o HTML do Formulário para este tipo de dado');
  end;
  if LTemErro then
    Result.AddClasse('has-error');
end;

function TControlGroupPara.Input_AddClasse(const AClasse: string): IControlGroupPara;
begin
  Result := Self;
  if FInput_AddClasse = '' then
    FInput_AddClasse := AClasse
  else
    FInput_AddClasse := FInput_AddClasse + ' ' + AClasse
end;

function TControlGroupPara.Mensagem_AddClasse(const AClasse: string): IControlGroupPara;
begin
  Result := Self;
  if FMensagem_AddClasse = '' then
    FMensagem_AddClasse := AClasse
  else
    FMensagem_AddClasse := FMensagem_AddClasse + ' ' + AClasse
end;

function TControlGroupPara.Mensagem_TrocaTexto(const ATexto: string): IControlGroupPara;
begin
  Result := Self;
  FMensagem_TrocaTexto := ATexto;
end;

function TControlGroupPara.Rotulo_AddClasse(const AClasse: string): IControlGroupPara;
begin
  Result := Self;
  if FMensagem_AddClasse = '' then
    FRotulo_AddClasse := AClasse
  else
    FRotulo_AddClasse := FRotulo_AddClasse + ' ' + AClasse
end;

function TControlGroupPara.Rotulo_TrocaTexto(const ATexto: string): IControlGroupPara;
begin
  Result := Self;
  FRotulo_TrocaTexto := ATexto;
end;

function TControlGroupPara.SetDisabled(ADisabled: Boolean): IControlGroupPara;
begin
  Result := Self;
  FSetDisabled := ADisabled;
end;

function TControlGroupPara.SetTamanho(ATamanho: TControlGroupTamanho): IControlGroupPara;
begin
  Result := Self;
  FTamanho := ATamanho;
end;

{ TComboBoxPara }

function TComboBoxPara.AdicionarIterador(const AIterator: IIteratorActiveRecord; const AMetadata: IActiveRecordMetadata;
  AFieldIndexOpcao, AFieldIndexValor: Integer): IComboBoxPara;
var
  LAccess: IActiveRecordAccess;
begin
  Result := Self;
  if FMetadata.FieldMetadata(FFieldIndex).Nullable then
    AdicionarOpcao('');
  while AIterator.Next do
  begin
    LAccess := AIterator.CurrentItemActiveRecord.Access;
    AdicionarOpcao(LAccess.DisplayText(AFieldIndexOpcao), LAccess.AsString[AFieldIndexValor]);
  end;
end;

function TComboBoxPara.AdicionarOpcao(const ATexto, AValor: string): IComboBoxPara;
begin
  if ATexto = '' then
    FOpcoes.Add('')
  else if AValor = '' then
    FOpcoes.Values[ATexto] := ATexto
  else
    FOpcoes.Values[ATexto] := AValor;
end;

constructor TComboBoxPara.Create(AFieldIndex: Integer; const AAccess: IActiveRecordAccess;
  const AMetadata: IActiveRecordMetadata; AParametros: IParametros; const APrefixoDoNome: string);
var
  LMensagem: string;
begin
  FOpcoes := TStringList.Create;
  FFieldIndex := AFieldIndex;
  FAccess := AAccess;
  FMetadata := AMetadata;
  FParametros := AParametros;
  FPrefixoDoNome := APrefixoDoNome;
  FRotulo := TVisaoHTMLActiveRecord.ModeloRotuloPara(AMetadata, APrefixoDoNome, AFieldIndex).SetClasse('col-lg-3 col-md-3 control-label');
  LMensagem := TVisaoHTMLActiveRecord.ModeloMensagemPara(AParametros, AMetadata, APrefixoDoNome, AFieldIndex);
  FMensagem := TVisaoHTMLActiveRecord.HTMLFluente('span').SetDentro(LMensagem).SetClasse('help-block');
  FTemErro := LMensagem <> '';
end;

destructor TComboBoxPara.Destroy;
begin
  FOpcoes.Free;
  inherited;
end;

function TComboBoxPara.HTML: IHTMLFluente;
var
  LInput: IHTMLFluente;
begin
  LInput := TVisaoHTMLActiveRecord.ModeloComboBoxPara(FAccess, FMetadata, FParametros, FPrefixoDoNome, FFieldIndex,
    FOpcoes).SetClasse('form-control');
  LInput.SetDisabled(FDisabled);
  Result := TVisaoHTMLActiveRecord.HTMLFluente('div')
    .SetClasse('form-group')
    .SetDentro(TVisaoHTMLActiveRecord.HTMLPuro(#13#10#09 + FRotulo.HTMLPuro.Conteudo + #13#10 +
    #09'<div class="col-lg-9 col-md-9">'#13#10 +
    #09#09 + LInput.HTMLPuro.Conteudo + #13#10 +
    #09#09 + FMensagem.HTMLPuro.Conteudo + #13#10 +
    #09'</div>'#13#10));
  if FTemErro then
    Result.AddClasse('has-error');
end;

function TComboBoxPara.Mensagem_AddClasse(const AClasse: string): IComboBoxPara;
begin
  Result := Self;
  FMensagem.AddClasse(AClasse);
end;

function TComboBoxPara.Mensagem_TrocaTexto(const ATexto: string): IComboBoxPara;
begin
  Result := Self;
  FMensagem.SetDentro(ATexto);
end;

function TComboBoxPara.Rotulo_AddClasse(const AClasse: string): IComboBoxPara;
begin
  Result := Self;
  FRotulo.AddClasse(AClasse);
end;

function TComboBoxPara.Rotulo_TrocaTexto(const ATexto: string): IComboBoxPara;
begin
  Result := Self;
  FRotulo.SetDentro(ATexto);
end;

function TComboBoxPara.SetDisabled(ADisabled: Boolean): IComboBoxPara;
begin
  FDisabled := ADisabled;
end;

{ TGeraHTMLModeloPara }

function TGeraHTMLModeloPara.CampoSenhaPara(AFieldIndex: Integer; AComPlaceholder: Boolean): ITagHTMLFluente;
begin
  Result := TVisaoHTMLActiveRecord.ModeloCampoSenhaPara(FMetadata, FPrefixoDoNome, AFieldIndex, AComPlaceholder);
end;

function TGeraHTMLModeloPara.CampoTextoPara(AFieldIndex: Integer; AComPlaceholder: Boolean): ITagHTMLFluente;
begin
  Result := TVisaoHTMLActiveRecord.ModeloCampoTextoPara(FAccess, FMetadata, FParametros, FPrefixoDoNome, AFieldIndex,
    AComPlaceHolder);
end;

function TGeraHTMLModeloPara.CheckboxPara(AFieldIndex: Integer): ITagHTMLFluente;
begin
  Result := TVisaoHTMLActiveRecord.ModeloCheckBoxPara(FAccess, FMetadata, FParametros, FPrefixoDoNome, AFieldIndex);
end;

function TGeraHTMLModeloPara.ClasseHTMLPara(AFieldIndex: Integer): THTMLPuro;
begin
  Result := TVisaoHTMLActiveRecord.ModeloClasseHTMLPara(FMetadata, AFieldIndex);
end;

function TGeraHTMLModeloPara.ComboBoxPara(AFieldIndex: Integer): IComboBoxPara;
begin
  Result := TComboBoxPara.Create(AFieldIndex, FAccess, FMetadata, FParametros, FPrefixoDoNome);
end;

function TGeraHTMLModeloPara.ControlGroupPara(AFieldIndex: Integer): IControlGroupPara;
begin
  Result := TControlGroupPara.Create(AFieldIndex, FAccess, FMetadata, FParametros, FPrefixoDoNome);
end;

constructor TGeraHTMLModeloPara.Create(const AAccess: IActiveRecordAccess; const AMetadata: IActiveRecordMetadata;
  AParametros: IParametros; const APrefixoDoNome: string);
begin
  FAccess := AAccess;
  FMetadata := AMetadata;
  FParametros := AParametros;
  FPrefixoDoNome := APrefixoDoNome
end;

function TGeraHTMLModeloPara.MensagemPara(AFieldIndex: Integer): string;
begin
  Result := TVisaoHTMLActiveRecord.ModeloMensagemPara(FParametros, FMetadata, FPrefixoDoNome, AFieldIndex);
end;

function TGeraHTMLModeloPara.RotuloPara(AFieldIndex: Integer): IHTMLFluente;
begin
  Result := TVisaoHTMLActiveRecord.ModeloRotuloPara(FMetadata, FPrefixoDoNome, AFieldIndex);
end;

function TGeraHTMLModeloPara.TituloPara(AFieldIndex: Integer; AParaColuna: Boolean): string;
begin
  Result := TVisaoHTMLActiveRecord.ModeloTituloPara(FMetadata, AFieldIndex, AParaColuna);
end;

function TGeraHTMLModeloPara.ValorAMostrarPara(AFieldIndex: Integer): string;
begin
  Result := TVisaoHTMLActiveRecord.ModeloValorAMostrarPara(FAccess, AFieldIndex);
end;

{ TGeraHTMLIteradorPara }

constructor TGeraHTMLIteradorPara.Create(const AIterator: IIteratorActiveRecord; const AMetadata: IActiveRecordMetadata;
  AParametros: IParametros; const APrefixoDoNome: string);
begin
  FIterator := AIterator;
  FMetadata := AMetadata;
  FParametros := AParametros;
  FPrefixoDoNome := APrefixoDoNome;
end;

function TGeraHTMLIteradorPara.SelecaoPara(ACampoTerceiroElementoDaRota: Integer;
  const ARotaFluente: IRotaFluente): ISelecaoPara;
begin
  Result := TSelecaoPara.Create(FIterator, FMetadata, FPrefixoDoNome, ACampoTerceiroElementoDaRota, ARotaFluente);
end;

function TGeraHTMLIteradorPara.TabelaPara: ITabelaPara;
begin
  Result := TTabelaPara.Create(FIterator, FMetadata, FPrefixoDoNome);
end;

{ TVisaoHTMLActiveRecord }

function TVisaoHTMLActiveRecord.AvisoModelo: THTMLPuro;
begin
  Result := AvisoPerigo(Parametros['Aviso.Modelo']);
end;

function TVisaoHTMLActiveRecord.CampoSenhaPara(AFieldIndex: Integer; AComPlaceholder: Boolean): ITagHTMLFluente;
begin
  Result := GeraHTMLModelo.CampoSenhaPara(AFieldIndex, AComPlaceholder);
end;

function TVisaoHTMLActiveRecord.CampoTextoPara(AFieldIndex: Integer; AComPlaceholder: Boolean): ITagHTMLFluente;
begin
  Result := GeraHTMLModelo.CampoTextoPara(AFieldIndex, AComPlaceholder);
end;

function TVisaoHTMLActiveRecord.CheckboxPara(AFieldIndex: Integer): ITagHTMLFluente;
begin
  Result := GeraHTMLModelo.CheckboxPara(AFieldIndex);
end;

function TVisaoHTMLActiveRecord.ClasseHTMLPara(AFieldIndex: Integer): THTMLPuro;
begin
  Result := GeraHTMLModelo.ClasseHTMLPara(AFieldIndex);
end;

function TVisaoHTMLActiveRecord.ControlGroupPara(AFieldIndex: Integer): IControlGroupPara;
begin
  Result := GeraHTMLModelo.ControlGroupPara(AFieldIndex);
end;

class function TVisaoHTMLActiveRecord.CreateTotalizacao: IActiveRecordTotalizacao;
begin
  Result := SL as IActiveRecordTotalizacao;
end;

class function TVisaoHTMLActiveRecord.DeterminaCamposVisiveis(const AMetadata: IActiveRecordMetadata): TFieldIndexes;
var
  laco, qtd: Integer;
  LFieldMetadata: TFieldMetadata;
begin
  SetLength(Result, AMetadata.FieldCount);
  qtd := 0;
  for laco := 0 to AMetadata.FieldCount - 1 do
  begin
    LFieldMetadata := AMetadata.FieldMetadata(laco);
    if LFieldMetadata.Visible and (not LFieldMetadata.Commented) then
    begin
      Result[qtd] := LFieldMetadata.Index;
      Inc(qtd);
    end;
  end;
  SetLength(Result, qtd);
end;

function TVisaoHTMLActiveRecord.GeraHTMLIterador: IGeraHTMLIteradorPara;
begin
  Result := GeraHTMLIteradorPara(Iterator, Metadata, '');
end;

function TVisaoHTMLActiveRecord.GeraHTMLIteradorPara(const AIterator: IIteratorActiveRecord;
  const AMetadata: IActiveRecordMetadata; const APrefixoDoNome: string): IGeraHTMLIteradorPara;
begin
  Result := TGeraHTMLIteradorPara.Create(AIterator, AMetadata, Parametros, APrefixoDoNome);
end;

function TVisaoHTMLActiveRecord.GeraHTMLModelo: IGeraHTMLModeloPara;
begin
  Result := GeraHTMLModeloPara(Access, Metadata, '');
end;

function TVisaoHTMLActiveRecord.GeraHTMLModeloPara(const AAccess: IActiveRecordAccess;
  const AMetadata: IActiveRecordMetadata; const APrefixoDoNome: string): IGeraHTMLModeloPara;
begin
  Result := TGeraHTMLModeloPara.Create(AAccess, AMetadata, Parametros, APrefixoDoNome);
end;

function TVisaoHTMLActiveRecord.MensagemPara(AFieldIndex: Integer): string;
begin
  Result := GeraHTMLModelo.MensagemPara(AFieldIndex);
end;

class function TVisaoHTMLActiveRecord.ModeloCampoSenhaPara(const AMetadata: IActiveRecordMetadata;
  const APrefixoDoNome: string; AFieldIndex: Integer; AComPlaceholder: Boolean): ITagHTMLFluente;
var
  LFieldMetadata: TFieldMetadata;
  LNome: string;
begin
  LFieldMetadata := AMetadata.FieldMetadata(AFieldIndex);
  LNome := APrefixoDoNome + LFieldMetadata.Name;
  Result := Tag('input')
    .SetAtributo('type', 'password')
    .SetAtributo('name', LNome)
    .SetId(LNome)
    .SetAtributo('size', IntToStr(LFieldMetadata.Length));
  if AComPlaceholder then
    Result.SetAtributo('placeholder', LFieldMetadata.Caption);
end;

class function TVisaoHTMLActiveRecord.ModeloCampoTextoPara(const AAccess: IActiveRecordAccess;
  const AMetadata: IActiveRecordMetadata; AParametros: IParametros; const APrefixoDoNome: string; AFieldIndex: Integer;
  AComPlaceholder: Boolean): ITagHTMLFluente;
var
  LFieldMetadata: TFieldMetadata;
  LValor, LNome: string;
begin
  LFieldMetadata := AMetadata.FieldMetadata(AFieldIndex);
  LNome := APrefixoDoNome + LFieldMetadata.Name;
  if AParametros.TemCodigo('MemoriaEntrada.' + LNome) then
    LValor := AParametros['MemoriaEntrada.' + LNome]
  else
    LValor := AAccess.AsString[AFieldIndex];
  Result := Tag('input')
    .SetAtributo('type', 'text')
    .SetAtributo('name', LNome)
    .SetId(LNome)
    //No Bootstrap o size é desprezado, devemos usar no class:
    //input-mini, input-small, input-medium, input-large, input-xlarge ou input-xxlarge, ou ainda span1, span2...
    //.SetAtributo('size', IntToStr(LFieldMetadata.Length))
    .SetAtributo('value', LValor);
  if LFieldMetadata.Length > 0 then
    Result.SetAtributo('maxlength', IntToStr(LFieldMetadata.Length));
  if AComPlaceholder then
    Result.SetAtributo('placeholder', LFieldMetadata.Caption);
end;

class function TVisaoHTMLActiveRecord.ModeloCheckboxPara(const AAccess: IActiveRecordAccess;
  const AMetadata: IActiveRecordMetadata; AParametros: IParametros; const APrefixoDoNome: string;
  AFieldIndex: Integer): ITagHTMLFluente;
var
  LFieldMetadata: TFieldMetadata;
  LValor, LNome: string;
begin
  LFieldMetadata := AMetadata.FieldMetadata(AFieldIndex);
  LNome := APrefixoDoNome + LFieldMetadata.Name;
  if AParametros.TemCodigo('MemoriaEntrada.' + LNome) then
    LValor := AParametros['MemoriaEntrada.' + LNome]
  else
    LValor := AAccess.AsString[AFieldIndex];
  Result := Tag('input')
    .SetAtributo('type', 'checkbox')
    .SetAtributo('name', LNome)
    .SetId(LNome)
    .SetAtributo('value', 'S')
    .SetAtributo('checked', SameText(Copy(LValor, 1, 1), 'S'));
end;

class function TVisaoHTMLActiveRecord.ModeloClasseHTMLPara(const AMetadata: IActiveRecordMetadata;
  AFieldIndex: Integer): THTMLPuro;
const
  LClasseParaOFieldTypeMetadata: array [TFieldTypeMetadata] of string = (
    'TipoDateTime', //arftDateTime
    'TipoFloat', //arftFloat
    'TipoInteger', //arftInteger
    'TipoMoney', //arftMoney,
    'TipoNS', //arftNS
    'TipoVarchar', //arftVarchar,
    'TipoMemo', //arftMemo,
    'TipoB01', //arftB01
    'TipoColor', //arftColor
    'TipoBinary', //arftBinary
    'TipoVarchar' //arftNVarchar
    );
begin
  Result := HTMLPuro(CodificaParametro(LClasseParaOFieldTypeMetadata[AMetadata.FieldMetadata(AFieldIndex).FieldType]));
end;

class function TVisaoHTMLActiveRecord.ModeloComboBoxPara(const AAccess: IActiveRecordAccess;
  const AMetadata: IActiveRecordMetadata; AParametros: IParametros; const APrefixoDoNome: string; AFieldIndex: Integer;
  AOpcoes: TStrings): IHTMLFluente;
var
  LFieldMetadata: TFieldMetadata;
  LValor, LNome, LOpcoes: string;
  laco: Integer;
  LOpcao: IHTMLFluente;
begin
  LFieldMetadata := AMetadata.FieldMetadata(AFieldIndex);
  LNome := APrefixoDoNome + LFieldMetadata.Name;
  if AParametros.TemCodigo('MemoriaEntrada.' + LNome) then
    LValor := AParametros['MemoriaEntrada.' + LNome]
  else
    LValor := AAccess.AsString[AFieldIndex];
  Result := HTMLFluente('select')
    .SetAtributo('name', LNome)
    .SetId(LNome);
  LOpcoes := #13#10;
  for laco := 0 to AOpcoes.Count - 1 do
  begin
    LOpcao := HTMLFluente('option')
      .SetAtributo('value', AOpcoes.Values[AOpcoes.Names[laco]])
      .SetDentro(AOpcoes.Names[laco]);
    if AnsiSameText(AOpcoes.Values[AOpcoes.Names[laco]], LValor) then
      LOpcao.SetAtributo('selected');
    LOpcoes := LOpcoes + #9 + LOpcao.HTMLPuro.Conteudo + #13#10;
  end;
  Result.SetDentro(HTMLPuro(LOpcoes));
end;

class function TVisaoHTMLActiveRecord.ModeloMensagemPara(AParametros: IParametros;
  const AMetadata: IActiveRecordMetadata; const APrefixoDoNome: string; AFieldIndex: Integer): string;
begin
  Result := AParametros['Mensagem.' + APrefixoDoNome + AMetadata.FieldMetadata(AFieldIndex).Name];
end;

class function TVisaoHTMLActiveRecord.ModeloRotuloPara(const AMetadata: IActiveRecordMetadata;
  const APrefixoDoNome: string; AFieldIndex: Integer): IHTMLFluente;
begin
  Result := HTMLFluente('label')
    .SetAtributo('for', APrefixoDoNome + AMetadata.FieldMetadata(AFieldIndex).Name)
    .SetDentro(HTMLPuro(HTMLEncode(ModeloTituloPara(AMetadata, AFieldIndex))));
end;

class function TVisaoHTMLActiveRecord.ModeloTituloPara(const AMetadata: IActiveRecordMetadata; AFieldIndex: Integer;
  AParaColuna: Boolean): string;
begin
  if AParaColuna then
    Result := AMetadata.FieldMetadata(AFieldIndex).Title
  else
    Result := AMetadata.FieldMetadata(AFieldIndex).Caption;
end;

class function TVisaoHTMLActiveRecord.ModeloValorAMostrarPara(const AAccess: IActiveRecordAccess;
  AFieldIndex: Integer): string;
begin
  Result := AAccess.DisplayText(AFieldIndex);
end;

function TVisaoHTMLActiveRecord.RotuloPara(AFieldIndex: Integer): IHTMLFluente;
begin
  Result := GeraHTMLModelo.RotuloPara(AFieldIndex);
end;

function TVisaoHTMLActiveRecord.SelecaoPara(ACampoTerceiroElementoDaRota: Integer;
  const ARotaFluente: IRotaFluente): ISelecaoPara;
begin
  Result := GeraHTMLIterador.SelecaoPara(ACampoTerceiroElementoDaRota, ARotaFluente);
end;

procedure TVisaoHTMLActiveRecord.SetModeloInterface(const AValue: IInterface);
var
  LGetClassActiveRecord: IGetClassActiveRecord;
  LActiveRecord: IActiveRecord;
  LIteratorActiveRecord: IIteratorActiveRecord;
  LCollectionActiveRecord: ICollectionActiveRecord;
begin
  if Supports(AValue, IGetClassActiveRecord, LGetClassActiveRecord) then
    FMetadata := LGetClassActiveRecord.ClassActiveRecord.ViewMetadata;
  if Supports(AValue, IActiveRecord, LActiveRecord) then
  begin
    FAccess := LActiveRecord.Access;
    FIterator := nil;
  end
  else if Supports(AValue, IIteratorActiveRecord, LIteratorActiveRecord) then
  begin
    FIterator := LIteratorActiveRecord;
    FAccess := nil;
  end
  else if Supports(AValue, ICollectionActiveRecord, LCollectionActiveRecord) then
  begin
    FIterator := TIteratorCollectionActiveRecordDecorator.Decore(LCollectionActiveRecord);
    FAccess := nil;
  end
  else
  begin
    FAccess := nil;
    FIterator := nil;
  end;
  inherited;
end;

function TVisaoHTMLActiveRecord.TabelaPara: ITabelaPara;
begin
  Result := GeraHTMLIterador.TabelaPara;
end;

function TVisaoHTMLActiveRecord.TituloPara(AFieldIndex: Integer; AParaColuna: Boolean): string;
begin
  Result := GeraHTMLModelo.TituloPara(AFieldIndex, AParaColuna);
end;

function TVisaoHTMLActiveRecord.ValorAMostrarPara(AFieldIndex: Integer): string;
begin
  Result := GeraHTMLModelo.ValorAMostrarPara(AFieldIndex);
end;

procedure TVisaoHTMLActiveRecord.WriteVl(const AValor: TNullableString);
begin
  WriteVL(TActiveRecord.ToString(AValor));
end;

procedure TVisaoHTMLActiveRecord.WriteVl(const AValor: TNullableDateTime);
begin
  WriteVL(TActiveRecord.ToString(AValor));
end;

procedure TVisaoHTMLActiveRecord.WriteVl(const AValor: TNullableCurrency);
begin
  WriteVL(TActiveRecord.NullOrString(AValor.Null, FormatFloat(',0.00', AValor.Value)));
end;

end.
