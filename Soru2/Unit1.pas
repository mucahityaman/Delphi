unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, QRCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, qrpctrls;

type
  TForm1 = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    TitleBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData4: TQRSysData;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRPShape1: TQRPShape;
    QRPShape2: TQRPShape;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses unit7;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var I:integer;
begin
for I := 0 to QRmemo1.Lines.Count do
begin
  QRmemo1.Lines.LoadFromFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\Ad.txt');
  QRmemo2.Lines.LoadFromFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\Soyad.txt');
  QRmemo3.Lines.LoadFromFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\SaatlikUcret.txt');
  QRmemo4.Lines.LoadFromFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\ToplamSaat.txt');
end;
end;
end.
