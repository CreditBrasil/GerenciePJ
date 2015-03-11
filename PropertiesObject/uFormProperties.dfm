object FormProperties: TFormProperties
  Left = 536
  Top = 174
  Width = 330
  Height = 402
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'FormProperties'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    322
    368)
  PixelsPerInch = 96
  TextHeight = 13
  object vleProperties: TValueListEditor
    Left = 8
    Top = 8
    Width = 306
    Height = 321
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnEditButtonClick = vlePropertiesEditButtonClick
  end
  object cmdCancelar: TBitBtn
    Left = 240
    Top = 337
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 1
    Kind = bkCancel
  end
  object cmdOk: TBitBtn
    Left = 160
    Top = 337
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 2
    OnClick = cmdOkClick
    Kind = bkOK
  end
end
