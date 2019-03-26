object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 266
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 56
    Width = 200
    Height = 200
    Center = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object Edit1: TEdit
      Left = 1
      Top = 1
      Width = 558
      Height = 39
      Align = alClient
      TabOrder = 0
      Text = 'Edit1'
      ExplicitHeight = 21
    end
    object Button1: TButton
      Left = 559
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Button1'
      Default = True
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Memo1: TMemo
    Left = 214
    Top = 56
    Width = 413
    Height = 200
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Barcode2D_QRCode1: TBarcode2D_QRCode
    Image = Image1
    Stretch = True
    Left = 112
    Top = 184
  end
end
