unit IdQotd;
{*******************************************************}
{                                                       }
{       Indy QUOTD Client TIdQOTD                       }
{                                                       }
{       Copyright (C) 2000 Winshoes WOrking Group       }
{       Started by J. Peter Mugaas                      }
{       2000-April-23                                   }
{                                                       }
{*******************************************************}

interface

uses
   Classes,
   IdAssignedNumbers,
   IdTCPClient;

type
  TIdQOTD = class(TIdTCPClient)
  protected
    Function GetQuote: String;
  public
    constructor Create(AOwner: TComponent); override;
    { This is the quote from the server }
    Property Quote: String read GetQuote;
  published
    Property Port default IdPORT_QOTD;
  end;

implementation

uses
  SysUtils;

{ TIdQotd }

constructor TIdQOTD.Create(AOwner: TComponent);
begin
  inherited;
  Port := IdPORT_QOTD;
end;

function TIdQOTD.GetQuote: String;
begin
  Result := ConnectAndGetAll;
end;

end.
