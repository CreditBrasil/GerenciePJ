unit CreditBrDebug_Form;

interface

uses
  SysUtils, Classes, Forms, Controls, StdCtrls;

type
  TDebug = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Debug: TDebug;

implementation

uses
  SockApp;

{$R *.dfm}

initialization

  TWebAppSockObjectFactory.Create('CreditBr')

end.
