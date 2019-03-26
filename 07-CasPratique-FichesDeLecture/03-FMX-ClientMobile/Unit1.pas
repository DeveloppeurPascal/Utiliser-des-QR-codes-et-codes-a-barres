unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  IPPeerServer, FMX.TabControl, System.Tether.Manager, System.Tether.AppProfile,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Media, FMX.Objects,
  FMX.Layouts, FMX.ExtCtrls, Winsoft.FireMonkey.Obr, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    TabControl1: TTabControl;
    tabConfig: TTabItem;
    tabLecture: TTabItem;
    Edit1: TEdit;
    Button1: TButton;
    CameraComponent1: TCameraComponent;
    Image1: TImage;
    FObr1: TFObr;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TetheringAppProfile1AcceptResource(const Sender: TObject;
      const AProfileId: string; const AResource: TCustomRemoteItem;
      var AcceptResource: Boolean);
    procedure TetheringAppProfile1ResourceReceived(const Sender: TObject;
      const AResource: TRemoteResource);
    procedure FormSaveState(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CameraComponent1SampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure FObr1BarcodeDetected(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Déclarations privées }
    FScanEnCours: Boolean;
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  TetheringAppProfile1.Resources.FindByName('CB').Value := Edit1.Text;
end;

procedure TForm1.CameraComponent1SampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
  if not FScanEnCours then
  begin
    try
      CameraComponent1.SampleBufferToBitmap(Image1.Bitmap, true);
      if not FObr1.Active then
        FObr1.Active := true;
      FScanEnCours := true;
      CameraComponent1.SampleBufferToBitmap(FObr1.Picture, true);
      tthread.CreateAnonymousThread(
        procedure
        begin
          try
            FObr1.Scan;
          finally
            FScanEnCours := false;
          end;
        end).Start;
    except
      FScanEnCours := false;
      showmessage('erreur');
    end;
  end;
end;

procedure TForm1.FObr1BarcodeDetected(Sender: TObject);
begin
  for var i := 0 to FObr1.BarcodeCount - 1 do
  begin
    var
    cb := FObr1.Barcode[i].DataUtf8;
    if cb <> Edit1.Text then
    begin
      if (TabControl1.ActiveTab = tabConfig) then
      begin
        TetheringManager1.Password := cb;
        TetheringManager1.AutoConnect;
        Memo1.Lines.Add('password : ' + cb);
        TabControl1.ActiveTab := tabLecture;
      end
      else
      begin
        Memo1.Lines.Add(cb);
        TetheringAppProfile1.Resources.FindByName('CB').Value := cb;
        Edit1.Text := cb;
      end;
    end;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CameraComponent1.Active := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FScanEnCours := false;
  TabControl1.ActiveTab := tabConfig;
end;

procedure TForm1.FormSaveState(Sender: TObject);
begin
  CameraComponent1.Active := false;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  if not CameraComponent1.Active then
    try
      CameraComponent1.Active := true;
      CameraComponent1.FocusMode := TFocusMode.ContinuousAutoFocus;
    finally
    end;
end;

procedure TForm1.TetheringAppProfile1AcceptResource(const Sender: TObject;
const AProfileId: string; const AResource: TCustomRemoteItem;
var AcceptResource: Boolean);
begin
  AcceptResource := AResource.Hint = 'Reponse';
end;

procedure TForm1.TetheringAppProfile1ResourceReceived(const Sender: TObject;
const AResource: TRemoteResource);
begin
  if AResource.Hint = 'Reponse' then
    showmessage(AResource.Value.AsString);
end;

end.
