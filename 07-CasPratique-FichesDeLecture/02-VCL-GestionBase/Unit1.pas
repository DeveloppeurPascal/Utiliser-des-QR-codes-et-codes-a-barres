unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, IPPeerServer,
  Vcl.StdCtrls, System.Tether.Manager, System.Tether.AppProfile,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin;

type
  TForm1 = class(TForm)
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    Memo1: TMemo;
    TetheringManager2: TTetheringManager;
    TetheringAppProfile2: TTetheringAppProfile;
    FDMemTable1: TFDMemTable;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    FDMemTable1Gencod: TStringField;
    FDMemTable1Titre: TStringField;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    procedure TetheringAppProfile1Resources0ResourceReceived
      (const Sender: TObject; const AResource: TRemoteResource);
    procedure FormCreate(Sender: TObject);
    procedure TetheringAppProfile2Resources0ResourceReceived
      (const Sender: TObject; const AResource: TRemoteResource);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses System.ioutils;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDMemTable1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TetheringManager1.AutoConnect;
  FDMemTable1.ResourceOptions.PersistentFileName :=
    tpath.Combine(tpath.GetDirectoryName(Application.ExeName), 'mabase.bin');
  FDMemTable1.ResourceOptions.Persistent := true;
  FDMemTable1.Open;
end;

procedure TForm1.TetheringAppProfile1Resources0ResourceReceived
  (const Sender: TObject; const AResource: TRemoteResource);
begin
  Memo1.Lines.Insert(0, 'Nouveau mot de passe : ' + AResource.Value.AsString);
  TetheringManager2.Password := AResource.Value.AsString;
end;

procedure TForm1.TetheringAppProfile2Resources0ResourceReceived
  (const Sender: TObject; const AResource: TRemoteResource);
var
  gencod: string;
  titre: string;
begin
  titre := '';
  gencod := AResource.Value.AsString;
  if FDMemTable1.FindKey([gencod]) then
    titre := FDMemTable1.FieldByName('titre').AsString
  else
  begin
    FDMemTable1.Insert;
    FDMemTable1.FieldByName('Gencod').AsString := gencod;
    FDMemTable1.FieldByName('Titre').AsString := '';
    FDMemTable1.Post;
  end;
  TetheringAppProfile2.SendString(TetheringAppProfile2.ConnectedProfiles.First,
    'Reponse', gencod + ' - ' + titre);
  Memo1.Lines.Insert(0, gencod + ' - ' + titre);
end;

end.
