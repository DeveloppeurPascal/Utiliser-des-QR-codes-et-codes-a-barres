unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, pCore2D, pBarcode2D, pQRCode,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    Barcode2D_QRCode1: TBarcode2D_QRCode;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses ZXing.ScanManager, ZXing.BarcodeFormat, ZXing.ReadResult;

procedure TForm1.Button1Click(Sender: TObject);
var
  FScanManager: TScanManager;
  FReadResult: TReadResult;
begin
  // création du QR Code
  Barcode2D_QRCode1.Barcode := Edit1.Text;
  Edit1.SelectAll;
  Edit1.SetFocus;
  // lecture du QR Code
  FScanManager := TScanManager.Create(TBarcodeFormat.QR_CODE, nil);
  try
    FReadResult := FScanManager.Scan(Image1.Picture.Bitmap);
    if assigned(FReadResult) then
    begin
      Memo1.Lines.insert(0, FReadResult.Text);
      freeandnil(FReadResult);
    end;
  finally
    freeandnil(FScanManager);
  end;
end;

end.
