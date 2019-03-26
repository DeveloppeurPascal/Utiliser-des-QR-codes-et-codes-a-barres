unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
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

uses DelphiZXIngQRCode;

procedure TForm1.FormCreate(Sender: TObject);
var
  Scale: Double;
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
begin
  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.Data := 'Hello World';
    QRCode.Encoding := TQRCodeEncoding.qrAlphanumeric;
    QRCode.QuietZone := 4;
    Image1.Center := True;
    Image1.Proportional := True;
    Image1.Stretch := True;
    Image1.Picture.Bitmap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
      for Column := 0 to QRCode.Columns - 1 do
        if (QRCode.IsBlack[Row, Column]) then
          Image1.Picture.Bitmap.Canvas.Pixels[Column, Row] := clBlack
        else
          Image1.Picture.Bitmap.Canvas.Pixels[Column, Row] := clWhite;
  finally
    QRCode.Free;
  end;
end;

end.
