object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 422
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 332
    Width = 680
    Height = 90
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
    ExplicitTop = 152
    ExplicitWidth = 472
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 680
    Height = 307
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 307
    Width = 680
    Height = 25
    DataSource = DataSource1
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 232
    ExplicitTop = 216
    ExplicitWidth = 240
  end
  object TetheringManager1: TTetheringManager
    Password = 'E179C674-7C13-4043-A73B-DDF50C196F89'
    Text = 'TetheringManager1'
    AllowedAdapters = 'Network'
    Left = 64
    Top = 48
  end
  object TetheringAppProfile1: TTetheringAppProfile
    Manager = TetheringManager1
    Text = 'TetheringAppProfile1'
    Group = 'ProgConfig'
    Actions = <>
    Resources = <
      item
        Name = 'Password'
        IsPublic = True
        Kind = Mirror
        OnResourceReceived = TetheringAppProfile1Resources0ResourceReceived
      end>
    Left = 64
    Top = 104
  end
  object TetheringManager2: TTetheringManager
    Text = 'TetheringManager2'
    AllowedAdapters = 'Network'
    Left = 328
    Top = 56
  end
  object TetheringAppProfile2: TTetheringAppProfile
    Manager = TetheringManager2
    Text = 'TetheringAppProfile2'
    Group = 'MobileApp'
    Actions = <>
    Resources = <
      item
        Name = 'CB'
        IsPublic = True
        Kind = Mirror
        OnResourceReceived = TetheringAppProfile2Resources0ResourceReceived
      end>
    Left = 328
    Top = 112
  end
  object FDMemTable1: TFDMemTable
    IndexFieldNames = 'Gencod'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 512
    Top = 208
    object FDMemTable1Gencod: TStringField
      FieldName = 'Gencod'
    end
    object FDMemTable1Titre: TStringField
      FieldName = 'Titre'
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 520
    Top = 136
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 512
    Top = 80
  end
end
