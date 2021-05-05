unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm7 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    StringGrid1: TStringGrid;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Button3: TButton;
    Edit1: TEdit;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  Degisti:bool;
implementation
uses unit1;
{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
var
  I: Integer;
  veri:string;
begin
Degisti:=True;
for I := 0 to 3 do
begin
  veri:=InputBox('Veri Giriþ',StringGrid1.Cells[i,0]+' Giriniz:','');
  while veri='' do
    veri:=InputBox('Veri Giriþ',StringGrid1.Cells[i,0]+' Giriniz:','');
  StringGrid1.Cells[i,(StringGrid1.RowCount)]:=veri;
end;
StringGrid1.RowCount:=StringGrid1.RowCount+1;
end;

procedure TForm7.Button2Click(Sender: TObject);
var K,L:integer;
cevap:word;
begin
if degisti then
begin
  cevap:=Application.MessageBox('Verileri önceki verilerin üzerine kayýt etmek istediðine emin misin?','Emin Misin?', MB_YESNO);
  if cevap=mrYes then
  begin
    for K := memo1.Lines.Count+2 to StringGrid1.RowCount do
    begin
      memo1.Lines.Add(StringGrid1.Cells[0,K-1]);
      memo2.Lines.Add(StringGrid1.Cells[1,K-1]);
      memo3.Lines.Add(StringGrid1.Cells[2,K-1]);
      memo4.Lines.Add(StringGrid1.Cells[3,K-1]);
    end;
      memo1.Lines.SaveToFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\Ad.txt');
      memo2.Lines.SaveToFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\Soyad.txt');
      memo3.Lines.SaveToFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\SaatlikUcret.txt');
      memo4.Lines.SaveToFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\ToplamSaat.txt');
      Application.MessageBox('Veriler Baþarýlý Bir Þekilde Kayýt Edildi.','Baþarýlý', MB_OK);
  end;
end
else Application.MessageBox('Herhangi Bir Deðiþiklik Yapmadýnýz.','Uyarý', MB_OK);
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
Form1.QuickRep1.Preview;
end;

procedure TForm7.Button4Click(Sender: TObject);
begin
Form1.QuickRep1.Print;
end;

procedure TForm7.Button5Click(Sender: TObject);
var
  I,K,L,J: Integer;
  Varmi:bool;
begin
Varmi:=false;
if edit1.Text='' then
  ShowMessage('Kayýt Silinecek Ýsmi Giriniz!')
else
begin
  for I := 0 to StringGrid1.RowCount do
  begin
    if edit1.Text=StringGrid1.Cells[0,I] then
    begin
      Varmi:=true;
      break;
    end;
  end;
  if Varmi then
  begin
    for K := I to StringGrid1.RowCount-2 do
      for L := 0 to Stringgrid1.ColCount do
        StringGrid1.Cells[L,K]:=StringGrid1.Cells[L,K+1];
    StringGrid1.RowCount:=StringGrid1.RowCount-1;
    for J := 0 to memo1.Lines.Count do
      if edit1.Text=memo1.Lines[J] then
      begin
        memo1.Lines.Delete(J);
        memo2.Lines.Delete(J);
        memo3.Lines.Delete(J);
        memo4.Lines.Delete(J);
      end;
      Degisti:=True;
      edit1.Text:='';
      ShowMessage('Kayýt tablodan silindi.');
  end
  Else
    ShowMessage('Kayýtlý Ýsim Bulunamadý. Lütfen Ýsmi Kontrol Ediniz.');
end;

end;

procedure TForm7.Edit1Click(Sender: TObject);
begin
edit1.Text:='';
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
var T:integer;
cevap:word;
begin
if (Degisti)  then
begin
  cevap:=Application.MessageBox('Yaptýðýnýz deðiþiklikler kayýt edilmedi. Verileri kayýt etmek ister misin?','Emin Misin?', MB_YESNO);
  if cevap=mrYes then
    begin
      ShowMessage('Bilgiler Kayýt Edildi.');
      for T := memo1.Lines.Count+2 to StringGrid1.RowCount do
      begin
      memo1.Lines.Add(StringGrid1.Cells[0,T-1]);
      memo2.Lines.Add(StringGrid1.Cells[1,T-1]);
      memo3.Lines.Add(StringGrid1.Cells[2,T-1]);
      memo4.Lines.Add(StringGrid1.Cells[3,T-1]);
      end;
      memo1.Lines.SaveToFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\Ad.txt');
      memo2.Lines.SaveToFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\Soyad.txt');
      memo3.Lines.SaveToFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\SaatlikUcret.txt');
      memo4.Lines.SaveToFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\ToplamSaat.txt');
    end;
end
Else
    Action:=caFree;
end;

procedure TForm7.FormCreate(Sender: TObject);
var
  I: Integer;
begin
StringGrid1.Cells[0,0]:='Ad';
StringGrid1.Cells[1,0]:='Soyad';
StringGrid1.Cells[2,0]:='Saatlik Ücret';
StringGrid1.Cells[3,0]:='Toplam Saat';

memo1.Lines.LoadFromFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\Ad.txt');
memo2.Lines.LoadFromFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\Soyad.txt');
memo3.Lines.LoadFromFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\SaatlikUcret.txt');
memo4.Lines.LoadFromFile('C:\Users\mucah\OneDrive\Masaüstü\Soru2\ToplamSaat.txt');

stringGrid1.RowCount:=memo1.Lines.Count+1;

for I := 0 to memo1.Lines.Count do
begin
  StringGrid1.Cells[0,I+1]:=memo1.Lines[I];
  StringGrid1.Cells[1,I+1]:=memo2.Lines[I];
  StringGrid1.Cells[2,I+1]:=memo3.Lines[I];
  StringGrid1.Cells[3,I+1]:=memo4.Lines[I];
end;
end;

end.
