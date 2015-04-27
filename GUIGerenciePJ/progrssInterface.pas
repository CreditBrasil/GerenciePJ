unit progrssInterface;

interface

type
  IProgresso = interface
    ['{24C24287-73AD-4E70-824A-8E5DD2065743}']
    procedure Esconde;
    function GetPosition: Integer;
    function MaisUm(const Mens: string): Boolean;
    procedure Mostrar(const Titulo: string; ANivel: Integer = 0; AMostraCancelar: Boolean = False);
    function Posicao(const Mens: string; p, total: Integer): Boolean;
  end;
    
implementation

end.
