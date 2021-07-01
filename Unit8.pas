unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.Series,
  VclTee.TeeGDIPlus;

type
  TForm8 = class(TForm)
    Chart1: TChart;
    Series1: TBarSeries;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation
        uses unit2;
{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
Series1.Add(10)
end;

end.
