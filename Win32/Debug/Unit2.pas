unit Unit2;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;
type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form2: TForm2;
implementation
    uses  Unit1,Unit4,Unit5, Unit6,Unit7,Unit8,  Unit3;
{$R *.dfm}
procedure TForm2.Button1Click(Sender: TObject);
begin
Application.CreateForm(TForm1, Form1);
Form1.Show;
end;
procedure TForm2.Button2Click(Sender: TObject);
begin
Application.CreateForm(TForm3, Form3);
Form3.Show;
end;
procedure TForm2.Button3Click(Sender: TObject);
begin
Application.CreateForm(TForm4, Form4);
Form4.Show;
end;
procedure TForm2.Button4Click(Sender: TObject);
begin
Application.CreateForm(TForm5, Form5);
Form5.Show;
end;
procedure TForm2.Button5Click(Sender: TObject);
begin
 Application.CreateForm(TForm6, Form6);
Form6.Show;
end;
procedure TForm2.Button6Click(Sender: TObject);
begin
   Application.CreateForm(TForm7, Form7);
Form7.Show;
end;
procedure TForm2.Button7Click(Sender: TObject);
begin
   Application.CreateForm(TForm8, Form8);
Form8.Show;
end;
end.
