object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'Form8'
  ClientHeight = 405
  ClientWidth = 885
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 32
    Top = 24
    Width = 433
    Height = 273
    Foot.Frame.Visible = False
    Title.Frame.Visible = False
    Title.Text.Strings = (
      'TChart')
    Chart3DPercent = 35
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      18
      15
      18)
    ColorPaletteIndex = 13
    object Series1: TBarSeries
      Marks.Visible = False
      Marks.Style = smsValue
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
  object Button1: TButton
    Left = 120
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end
