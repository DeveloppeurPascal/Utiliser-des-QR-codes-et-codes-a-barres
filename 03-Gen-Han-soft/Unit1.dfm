object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
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
    Left = 0
    Top = 0
    Width = 328
    Height = 299
    Align = alClient
    ExplicitLeft = 272
    ExplicitTop = 120
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object Image2: TImage
    Left = 328
    Top = 0
    Width = 307
    Height = 299
    Align = alRight
  end
  object Barcode1D_EAN1281: TBarcode1D_EAN128
    Image = Image1
    Data = '0123456789'
    DisplayText = dtFullEncoded
    TextAlignment = taCenter
    TextFont.Charset = DEFAULT_CHARSET
    TextFont.Color = clBlack
    TextFont.Height = -11
    TextFont.Name = 'Tahoma'
    TextFont.Style = []
    Ratio = 2.000000000000000000
    Left = 160
    Top = 176
  end
  object Barcode2D_RSSExpanded1: TBarcode2D_RSSExpanded
    Image = Image2
    Barcode = '0123456789'
    Module = 2
    Style = rsStacked
    RowHeight = 34
    Left = 432
    Top = 192
  end
end
