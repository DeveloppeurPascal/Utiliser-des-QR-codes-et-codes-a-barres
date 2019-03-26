unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TMSCloudImage, FMX.TMSCloudBase, FMX.TMSCloudBaseFMX,
  FMX.TMSCloudCustomBarcode, FMX.TMSCloudBarcode;

type
  TForm1 = class(TForm)
    TMSFMXCloudBarcode1: TTMSFMXCloudBarcode;
    TMSFMXCloudImage1: TTMSFMXCloudImage;
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  TMSFMXCloudBarcode1.BarcodeOptions.ShowText := true;
  TMSFMXCloudImage1.URL := TMSFMXCloudBarcode1.GetBarcodeURL('0123456789',
    tbarcodetype.btC128a);
end;

end.
