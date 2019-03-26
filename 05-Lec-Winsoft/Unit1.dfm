object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 254
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
    Top = 47
    Width = 200
    Height = 200
    Center = True
    Proportional = True
    Stretch = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 152
    ExplicitWidth = 185
    object Edit1: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 6
      Width = 538
      Height = 29
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      TabOrder = 0
      Text = 'Edit1'
      ExplicitLeft = 264
      ExplicitTop = 20
      ExplicitWidth = 121
      ExplicitHeight = 21
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 554
      Top = 6
      Width = 75
      Height = 29
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Button1'
      Default = True
      TabOrder = 1
      OnClick = Button1Click
      ExplicitLeft = 288
      ExplicitTop = 16
      ExplicitHeight = 25
    end
  end
  object Memo1: TMemo
    Left = 214
    Top = 47
    Width = 413
    Height = 200
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    TabOrder = 1
  end
  object Barcode1: TBarcode
    Scale = 1.000000000000000000
    Left = 32
    Top = 200
  end
  object Obr1: TObr
    OnBarcodeDetected = Obr1BarcodeDetected
    Left = 312
    Top = 136
  end
end
