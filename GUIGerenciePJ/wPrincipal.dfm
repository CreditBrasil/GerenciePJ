object Principal: TPrincipal
  Left = 194
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Retorno Gerencie PJ'
  ClientHeight = 210
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 223
    Height = 13
    Caption = 'Conex'#227'o com o banco de dados do NetFactor:'
  end
  object BitBtn1: TBitBtn
    Left = 336
    Top = 176
    Width = 257
    Height = 25
    Caption = 'Inicia o processo de carga do arquivo'
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object Button1: TButton
    Left = 8
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object txtConnectionString: TEdit
    Left = 8
    Top = 24
    Width = 585
    Height = 21
    TabOrder = 2
    Text = 
      'Driver={SQL Server};Server=orderbysql\orderbysql;DataBase=netFac' +
      'tor;UID=sa;PWD=chica;Library=dbmssocn;'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 48
    Width = 585
    Height = 57
    Caption = 'Respons'#225'vel pelo cadastro de e-mails no NetFactor'
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label3: TLabel
      Left = 304
      Top = 24
      Width = 32
      Height = 13
      Caption = 'e-mail:'
    end
    object txtResponsavelCadastroNetFactorNome: TEdit
      Left = 42
      Top = 22
      Width = 239
      Height = 21
      TabOrder = 0
      Text = 'Natalino Barros Amaral'
    end
    object txtResponsavelCadastroNetFactorEMail: TEdit
      Left = 339
      Top = 22
      Width = 238
      Height = 21
      TabOrder = 1
      Text = 'natalino.amaral@creditbr.com.br'
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 112
    Width = 585
    Height = 57
    Caption = 
      'Pessoa que receber'#225' c'#243'pias dos e-mails para acompanhamento da en' +
      'trega'
    TabOrder = 4
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label5: TLabel
      Left = 304
      Top = 24
      Width = 32
      Height = 13
      Caption = 'e-mail:'
    end
    object txtResponsavelMonitorarEMailsNome: TEdit
      Left = 42
      Top = 22
      Width = 239
      Height = 21
      TabOrder = 0
      Text = 'Alex Dundes'
    end
    object txtResponsavelMonitorarEMailsEMail: TEdit
      Left = 339
      Top = 22
      Width = 238
      Height = 21
      TabOrder = 1
      Text = 'alex.dundes@creditbr.com.br'
    end
  end
end
