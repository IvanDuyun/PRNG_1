unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SSS: TEdit;
    Button1: TButton;
    chislo1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Memo1: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    Par_A: TEdit;
    Par_C: TEdit;
    Label9: TLabel;
    Par_M: TEdit;
    Label10: TLabel;
    procedure Button1Click(Sender: TObject);
//    procedure Label2Click(Sender: TObject);
//    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  A, M, C: integer;
  n: integer;  //���������� �����
  chislo: integer;
  s1: string;
  s2,s3: string;
  i,otstup,razryad,s: integer;
  vihod: array of integer;
  Koef_Korr: Double; //����������� ����������
       mas_gist: array[0..29] of integer; //������. �������
       mas_p: array[0..29] of real; //�����������
       Sr_Int: array[0..29] of real;
       Teor_Chast: array[0..29] of real;  //��� �������� ������������� ������(������)
       Nakople_Teor_Chast: array[0..29] of real;  //��� ����������� �������� ������������� ������(����������)
       Nakople_Mas_Gist: array[0..29] of integer; //��� ����������� �������� �������� ������(����������)
   f,size_int:real; //������ ���������
   j,intervalov: integer;
   SR_KV_OTKL:real;//������� ������������ ����������
   Sr_Ar:real;     //������� ���������.
   KOEF_OTKL:real;
   Disp: real; //���������
   Par_A, Par_b: real; //��������� ������������� a � b
   FX: real;   //��������� �������������
   Pirson: real;   //�������� �������� �������
   Max_nakople: real; //���� ������� ����� ������������ ���������(����������)
   Kolmogor: real; //�������� �������� �����������
   F_Korr: real; //�������������� ������
   Tau: integer; //���������� �������� ��� ���������� ���� �������
   Sum_1, Sum_2, Sum_3, Sum_4, Sum_5: real; //��� ���������� ���� �������
   Disp_x, Disp_y: real; //��������� ������� �������
   Znach_Koef_Korr: real; //��� �������� ������������ ����������



implementation
   uses Unit2;
{$R *.dfm}







procedure TForm3.Button1Click(Sender: TObject);
begin

 S:=strtoint(SSS.Text);
chislo:=strtoInt(chislo1.Text);
A:= strtoint(Par_A.Text);
C:= strtoint(Par_C.Text);
M:= strtoint(Par_M.Text);

setlength(vihod,s);

  for i:=0 to s-1 do begin
    chislo:=(A*chislo+c) mod m;
      vihod[i]:=chislo end;

   for I := 0 to s-1 do  begin
        Memo1.Lines.Add(IntToStr(vihod[i]));
                            end;
end;

end.
