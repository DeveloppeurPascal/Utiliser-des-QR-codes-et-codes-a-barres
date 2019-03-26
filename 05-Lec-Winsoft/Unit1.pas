unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Barcode,
  Obr;

type
  TForm1 = class(TForm)
    Barcode1: TBarcode;
    Edit1: TEdit;
    Button1: TButton;
    Panel1: TPanel;
    Image1: TImage;
    Memo1: TMemo;
    Obr1: TObr;
    procedure Button1Click(Sender: TObject);
    procedure Obr1BarcodeDetected(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  // creation du QR Code
  Barcode1.Symbology := TSymbology.syQRCode;
  Barcode1.InputText := Edit1.Text;
  Image1.Picture.Bitmap.Assign(Barcode1.Bitmap);
  Edit1.SelectAll;
  Edit1.SetFocus;
  // recherche de codes dans l'image
  Obr1.Picture.Assign(Image1.Picture);
  if not Obr1.Active then
    Obr1.Active := true;
  Obr1.Scan;
end;

procedure TForm1.Obr1BarcodeDetected(Sender: TObject);
begin
  for var i := 0 to Obr1.BarcodeCount - 1 do
  begin
    Memo1.Lines.Insert(0, Obr1.Barcode[i].DataAnsi);
    Memo1.Lines.Insert(0, Obr1.Barcode[i].SymbologyName);
  end;
end;

initialization

// pour TBarcode
ZintLibraryName :=
  'C:\Program Files (x86)\Winsoft\Barcode\Examples\Delphi\Zint.dll';
// pour TObr
ZbarLibraryName :=
  'C:\Program Files (x86)\Winsoft\Optical Barcode Recognition\Examples\Delphi\libzbar.dll';

end.
