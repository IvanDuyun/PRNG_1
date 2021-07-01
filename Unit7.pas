unit Unit7;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Math, Vcl.StdCtrls, VclTee.TeeGDIPlus,
  Data.DB, VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart, VCLTee.Series;
type
  TForm7 = class(TForm)
    Label1: TLabel;
    SS: TEdit;
    Label2: TLabel;
    chislo_1: TEdit;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Kolm: TEdit;
    Pirs: TEdit;
    Chart1: TChart;
    Series1: TBarSeries;
    Label3: TLabel;
    Korrel: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Edit1: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Interv: TEdit;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form7: TForm7;
  chislo: Double;
 s1: string;
 s2,s3: string;
 i,otstup,razryad,s: integer;
 vihod: array of real;
   Koef_Korr: Double; //����������� ����������
         mas_gist: array of integer; //������. �������
       Sr_Int: array of real;
       Teor_Chast: array of real;  //��� �������� ������������� ������(������)
       Nakople_Teor_Chast: array of real;  //��� ����������� �������� ������������� ������(����������)
       Nakople_Mas_Gist: array of integer; //��� ����������� �������� �������� ������(����������)
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
           uses  Unit2;
{$R *.dfm}
procedure TForm7.Button1Click(Sender: TObject);

begin
 ///��������� �������� ������
   S:=0;
   chislo:=0;
   setlength(mas_gist, 0);
  setlength(Sr_Int, 0);
  setlength(Teor_Chast, 0);
  setlength(Nakople_Teor_Chast, 0);
  setlength(Nakople_Mas_Gist, 0);
  setlength(vihod,0);
  series1.Clear;      //��������� �����������
  Kolmogor:=0;
   Pirson:=0;
   Koef_Korr:=0;
   Znach_Koef_Korr:=0;
    Intervalov:=0;
    Sum_1:=0;
    Sum_2:=0;
    Sum_3:=0;
    Sum_4:=0;
    Sum_5:=0;
    Sr_Ar:=0;
    Disp:= 0;
 ///���������� �������� ���������� � �������� ����� ������������ ��������
  Intervalov:=strtoint(Interv.Text);
  setlength(mas_gist, Intervalov);
  setlength(Sr_Int, Intervalov);
  setlength(Teor_Chast, Intervalov);
  setlength(Nakople_Teor_Chast, Intervalov);
  setlength(Nakople_Mas_Gist, Intervalov);
 S:=strtoint(SS.Text);
 setlength(vihod,s);
 //chislo:=strtoFloat(chislo_1.Text);
     //chislo:=0.23346576;
 //  Str(chislo,s3);
 s3:=chislo_1.Text;
   razryad :=(Length(s3)-2)div 2;  //���������� ������ ����� ������� ���������� �����
   otstup :=razryad + 1; //������ ����� �����
    chislo:=strtoFloat(s3);
  for i:=0 to s-1 do begin
   chislo:=Sqr(chislo);
   Str(chislo,S1);
   s2:=Copy(s1,2+otstup,(Length(s3)-2)); //��������� ���������
  chislo:=StrToFloat(s2)/Power(10,(Length(s3)-2));
  vihod[i]:=chislo;
  end;
   ///��������� ���������
   size_int := 1/intervalov;
   f:=0;
   for j:=0 to intervalov-1 do begin
        mas_gist[j]:=0 ;
   end;
   for j:=0 to intervalov-1 do begin
     for i:=0 to s-1 do  begin
       if (vihod[i]>f) and (vihod[i]<=f+size_int) then mas_gist[j]:=mas_gist[j]+1 end;
   f:=f+size_int
   end;
     ///������� ������� �������� ����������(Sr_Int)
   Sr_Int[0]:=size_int/2; //������ �������
   for i:=1 to intervalov-1 do begin
   Sr_Int[i]:=size_int+Sr_Int[i-1] end;
     ///������� ���������� ������� (Sr_Ar)
   for i:=0 to intervalov-1 do begin
     Sr_Ar:=Sr_Ar+Sr_Int[i]*mas_gist[i] end;
     Sr_Ar:=Sr_Ar/s;
     ///�������  ���������� ���������(Disp)
   for i:=0 to intervalov-1 do begin
     Disp:=Disp + mas_gist[i]*Sqr(Sr_Int[i] - Sr_Ar) end;
     Disp:=Disp/s;
     ///������� ���������� ������������������ ����������(SR_KV_OTKL)
     SR_KV_OTKL:=Sqrt(Disp);
     ///������� ��������� ������������� (Par_A, Par_b)
     Par_A:=Sr_Ar - Sqrt(3)*SR_KV_OTKL;
     Par_B:=Sr_Ar + Sqrt(3)*SR_KV_OTKL;
     ///������� �������������� ��������� ������������� Fx
     FX:=1/(Par_b-Par_A);
     ///������� ������������� ������� (������ � ��������� �������� ��������� ��������)
     Teor_Chast[0]:=s*(size_int - Par_A)*FX;
     Teor_Chast[Intervalov-1]:=s*(Par_b - (1 - size_int))*FX;
     for i:=1 to intervalov-2 do begin
       Teor_Chast[i]:=s*(Sr_Int[i+1] - Sr_Int[i])*FX  end;
     ///������� �������� �������� �������
     for i:=0 to intervalov-1 do begin
     Pirson:=Pirson + Sqr(mas_gist[i] -  Teor_Chast[i])/Teor_Chast[i] end;
 ///������� ������� � ������������ ���������(���� � �������) � ������� ������������ ������� ����� ������������ ���������
     Nakople_Mas_Gist[0]:=Mas_Gist[0];
     Nakople_Teor_Chast[0]:=Teor_Chast[0];
     Max_nakople:=Nakople_Mas_Gist[0] - Nakople_Teor_Chast[0]; //��������� ��������
     for i:=1 to intervalov-1 do begin
       Nakople_Mas_Gist[i]:=Nakople_Mas_Gist[i-1]+Mas_Gist[i];
       Nakople_Teor_Chast[i]:=Nakople_Teor_Chast[i-1]+Teor_Chast[i];
       if Nakople_Mas_Gist[i] - Nakople_Teor_Chast[i] > Max_nakople then Max_nakople:=Nakople_Mas_Gist[i] - Nakople_Teor_Chast[i]
     end;
     Kolmogor:=Max_nakople/Sqrt(S);
     ///������� �������������� ������� (F_Korr)
     Tau:=3;
     for i:=0 to s-Tau-1 do begin
       ///����� ��� ����. �������
       Sum_1:=Sum_1 + vihod[i]*vihod[i+Tau];
       Sum_2:=Sum_2 + vihod[i];
       Sum_3:=Sum_3 + vihod[i+Tau];
       ///����� ��� ��������� ������� �������
       Sum_4:=Sum_4 + Sqr(vihod[i]);
       Sum_5:=Sum_5 + Sqr(vihod[i+Tau]);
     end;
     ///������� �������� ����. ������� (F_Korr)
     F_Korr:= (1/(S-Tau))*Sum_1 - (1/Sqr(S-Tau))*Sum_2*Sum_3;
     ///������� �������� ��������� Disp_x � Disp_y
     Disp_x:= (1/(S-Tau))*Sum_4 - (1/Sqr(S-Tau))*Sqr(Sum_2);
     Disp_y:= (1/(S-Tau))*Sum_5 - (1/Sqr(S-Tau))*Sqr(Sum_3);
         ///������� �����. ���������� (Koef_Korr)
     Koef_Korr:=ABS(F_Korr/Sqrt(Disp_x*Disp_y));
   ///��� �������� �����. ���������� (��� ����������� p=0.95)
     Znach_Koef_Korr:= (1-0.05)*Sqrt(1/S);
   ///����� ��������
   Kolm.Text:= FloatToStr(Kolmogor);
    Pirs.Text:= FloatToStr(Pirson);
   Korrel.Text:= FloatToStr(Koef_Korr);
   edit1.Text:= FloatToStr(Znach_Koef_Korr);
    ///���������� �����������
        for I := 0 to Intervalov-1 do  begin
        Series1.Add(mas_gist[i]);
        end;
     end;

procedure TForm7.Button2Click(Sender: TObject);
begin
Memo1.Clear;
for i := 0 to s-1 do begin
Memo1.Lines.Add(FloatToStr(vihod[i]));
end;
end;

end.
