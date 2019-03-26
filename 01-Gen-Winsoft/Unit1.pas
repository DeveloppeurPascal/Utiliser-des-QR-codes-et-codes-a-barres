unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Barcode;

type
  TForm1 = class(TForm)
    Barcode1: TBarcode;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Barcode1.Symbology := TSymbology.syEAN;
  Barcode1.InputText := '0123456789';
  Image1.Picture.Bitmap.Assign(Barcode1.Bitmap);
end;

initialization

ZintLibraryName :=
  'C:\Program Files (x86)\Winsoft\Barcode\Examples\Delphi\Zint.dll';

end.
