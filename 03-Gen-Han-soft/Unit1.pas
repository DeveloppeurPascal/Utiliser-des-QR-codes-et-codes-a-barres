unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, pBarcode1D, pCode128,
  pEAN128, pCore2D, pBarcode2D, pRssExpanded;

type
  TForm1 = class(TForm)
    Barcode1D_EAN1281: TBarcode1D_EAN128;
    Image1: TImage;
    Image2: TImage;
    Barcode2D_RSSExpanded1: TBarcode2D_RSSExpanded;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
