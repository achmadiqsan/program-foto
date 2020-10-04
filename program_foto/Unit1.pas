unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtDlgs, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, MemDS, DBAccess, MyAccess, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    MyConnection1: TMyConnection;
    MyTable1: TMyTable;
    DataSource1: TDataSource;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Button2: TButton;
    Image2: TImage;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.Button1Click(Sender: TObject);
begin
  MyTable1.Append;
  MyTable1['id'] := Edit1.Text;
  MyTable1['nama'] := Edit2.Text;
  MyTable1['foto'] := Edit3.Text;
  MyTable1.Post;
  if image1.Visible = true then
  image1.Picture.SaveToFile('D:\program_foto\foto\'+Edit1.Text+'.jpg')
  else
  image2.Picture.SaveToFile('D:\program_foto\foto\'+Edit1.Text+'.jpg');
  Image1.Visible := False;
  Image2.Visible := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Button2.Caption = '&Ambil Foto' then
   begin
      if OpenPictureDialog1.Execute then
         begin
           Image1.Visible := true;
           Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
           Edit3.Text := OpenPictureDialog1.FileName;
           Button2.Caption := '&Hapus Foto';
           Image2.Visible := false;
         end;
   end
  else
  if Button2.Caption = '&Ubah foto' then
    begin
        if OpenPictureDialog1.Execute then
         begin
           Image1.Visible := true;
           Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
           Edit3.Text := OpenPictureDialog1.FileName;
           Button2.Caption := '&Hapus Foto';
           //Image2.Visible := false;
         end;
    end
  else
  if Button2.Caption = '&Hapus Foto' then
   begin
      Image2.Visible := true;
      Image1.Visible := false;
      Button2.Caption := '&Ambil Foto';
   end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   Image2.Visible := True;
   Image1.Visible := False;
   MyTable1.Delete ;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  MyTable1.Edit;
  MyTable1['id'] := Edit1.Text;
  MyTable1['nama'] := Edit2.Text;
  MyTable1['foto'] := Edit3.Text;
  MyTable1.Post;
  if image1.Visible = true then
  image1.Picture.SaveToFile('D:\program_foto\foto\'+Edit1.Text+'.jpg')
  else
  image2.Picture.SaveToFile('D:\program_foto\foto\'+Edit1.Text+'.jpg');
  Image1.Visible := False;
  Image2.Visible := True;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
DirectoryFileGambar : String;
begin
  //MyTable1.Close;
  //MyTable1.Open;
  //MyTable1.First;
  //while MyTable1.Eof = False do
   // begin
      //frxReport1.QRImage1.Picture.LoadFromFile(Form1.ADOQuery2['Foto']);
      //TfrxPictureView(frxReport1.LoadFromFile('D:\program_foto\foto\'+MyTable1['id']+'.jpg'));
      //Edit3.Text := MyTable1['id']  ;
      //TfrxPictureView(frxreport1.FindObject('Picture1')).Picture.loadfromfile(edit3.Text);
      //TfrxPictureView(frxreport1.FindObject('Picture1')).Picture.loadfromfile(MyTable1['foto']);
     // MyTable1.Next;
    //end;
  //FrxReport1.Script.Variables[MyTable1['foto']] := DirectoryFileGambar;
  //TfrxPictureView(frxreport1.FindObject('Picture1')).Picture.LoadFromFile(MyTable1['foto']);
  //frxReport1.PrepareReport();
  //FrxReport1.ShowReport();
  Form2.QuickRep1.Preview;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  Edit1.Text := MyTable1['id'] ;
  Edit2.Text := MyTable1['nama'] ;
  Edit3.Text := MyTable1['foto']  ;
  image2.Visible := False;
  image1.Visible := True;
  if image1.Visible = true then
  Button2.Caption :='&Ubah foto';
  //if Image3.Visible = True THen
  image1.Picture.LoadFromFile('D:\program_foto\foto\'+MyTable1['id']+'.jpg');
end;

end.
