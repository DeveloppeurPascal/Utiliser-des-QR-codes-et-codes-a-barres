object IWServerController: TIWServerController
  OldCreateOrder = False
  AppName = 'MyApp'
  Description = 'My IntraWeb Application'
  DisplayName = 'IntraWeb Application'
  Port = 8888
  ServerResizeTimeout = 0
  ShowLoadingAnimation = True
  SessionTimeout = 10
  LockSessionTimeout = 30000
  SSLOptions.NonSSLRequest = nsAccept
  SSLOptions.Port = 0
  SSLOptions.SSLVersions = []
  Version = '15.0.19'
  AllowMultipleSessionsPerUser = False
  JavaScriptOptions.jQueryVersion = '1.12.4'
  OnNewSession = IWServerControllerBaseNewSession
  Height = 310
  Width = 342
  object TetheringManager1: TTetheringManager
    Password = 'E179C674-7C13-4043-A73B-DDF50C196F89'
    Text = 'TetheringManager1'
    AllowedAdapters = 'Network'
    Left = 70
    Top = 64
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
      end>
    Left = 70
    Top = 112
  end
  object Barcode1: TBarcode
    Scale = 1.000000000000000000
    Left = 214
    Top = 64
  end
end
