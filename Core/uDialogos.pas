unit uDialogos;

interface

uses
  Windows, Forms, Dialogs;

type
  TDialogo = class(TObject)
  private
    class function Junta(const Texto: array of string): string;
  public
     {
     Definição para utilização das mensagens:
     Alerta - Processo interrompido por algum item faltante, mas que terá a sua conclusão efetuada se corrigido/continuado.
     Fatal - Processo interrompido por alguma limitação, seja operacional ou erro de sistema (0% de conclusão).
     Informação - Mensagem de conlusão de algum processo, geração de arquivo, etc. (100% de conclusão).
     Pergunta - Mensagem questionando alguma ação para que o usuário decida.
     }
    class function Alerta(const Mensagens: array of string; TemCancel: Boolean): Integer;
    class procedure Fatal(const Titulo: string; const Mensagens: array of string);
    class procedure Informacao(const Titulo: string; const Mensagens: array of string);
    class function PegaTexto(const Titulo, Pergunta: string): string;
    class function PegaTextoPadrao(const Titulo, Pergunta, Padrao: string): string;
    class function Pergunta(const Titulo: string; const Mensagens: array of string; TemCancel,
      NaoDefault: Boolean): Integer;
  end;

implementation

{ TDialogos }

class function TDialogo.Alerta(const Mensagens: array of string; TemCancel: Boolean): Integer;
var
  aux: Integer;
begin
  aux := MB_ICONEXCLAMATION;
  if TemCancel then
    aux := aux + MB_OKCANCEL;
  Result := Application.MessageBox(PChar(Junta(Mensagens)), 'Atenção', aux);
end;

class procedure TDialogo.Fatal(const Titulo: string; const Mensagens: array of string);
begin
  Application.MessageBox(PChar(Junta(Mensagens)), PChar(Titulo), MB_ICONHAND);
end;

class procedure TDialogo.Informacao(const Titulo: string; const Mensagens: array of string);
begin
  Application.MessageBox(PChar(Junta(Mensagens)), PChar(Titulo), MB_ICONINFORMATION);
end;

class function TDialogo.Junta(const Texto: array of string): string;
var
  laco: Integer;
begin
  Result := Texto[Low(Texto)];
  for laco := Low(Texto) + 1 to High(Texto) do
    Result := Result + #13#10 + Texto[laco];
end;

class function TDialogo.PegaTexto(const Titulo, Pergunta: string): string;
begin
  Result := PegaTextoPadrao(Titulo, Pergunta, '');
end;

class function TDialogo.PegaTextoPadrao(const Titulo, Pergunta, Padrao: string): string;
var
  motivo: String;
begin
  motivo := Padrao;
  repeat
    if InputQuery(Titulo, Pergunta, motivo) then
      Result := motivo
    else
    begin
      Result := '';
      motivo := '***';
    end;
  until motivo <> '';
end;

class function TDialogo.Pergunta(const Titulo: string; const Mensagens: array of string; TemCancel,
  NaoDefault: Boolean): Integer;
var
  aux: Integer;
begin
  aux := MB_ICONQUESTION;
  if TemCancel then
    aux := aux + MB_YESNOCANCEL
  else
    aux := aux + MB_YESNO;
  if NaoDefault then
    aux := aux + MB_DEFBUTTON2;
  Result := Application.MessageBox(PChar(Junta(Mensagens)), PChar(Titulo), aux);
end;

end.
