unit Unit1;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompButton,
  IWCompEdit, Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompExtCtrls;

type
  TIWForm1 = class(TIWAppForm)
    IWImage1: TIWImage;
    IWEdit1: TIWEdit;
    IWButton1: TIWButton;
    procedure IWButton1Click(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses System.ioutils, ServerController;

procedure TIWForm1.IWButton1Click(Sender: TObject);
begin
  IWServerController.Barcode1.InputText := IWEdit1.Text;
  IWServerController.Barcode1.Save(tpath.Combine(tpath.GetDocumentsPath, 'qrcode.gif'));
  IWImage1.Picture.LoadFromFile(tpath.Combine(tpath.GetDocumentsPath,
    'qrcode.gif'));
  IWServerController.TetheringAppProfile1.Resources.FindByName('Password').Value
    := IWEdit1.Text;
end;

initialization

TIWForm1.SetAsMainForm;

end.
