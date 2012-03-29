object Form1: TForm1
  Left = 305
  Top = 107
  Width = 680
  Height = 489
  Caption = 'MD5 To Excel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxsprdsht1: TcxSpreadSheet
    Left = 8
    Top = 8
    Width = 649
    Height = 361
    BackgroundColor = clScrollBar
    ReadOnly = True
    DefaultStyle.Font.Name = #23435#20307
    DefaultStyle.Font.Size = 10
    DefaultStyle.Font.Charset = ANSI_CHARSET
    GridColor = clCream
    HeaderFont.Charset = ANSI_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -13
    HeaderFont.Name = #23435#20307
    HeaderFont.Style = []
    HeaderColor = clSkyBlue
  end
  object btn1: TButton
    Left = 504
    Top = 376
    Width = 137
    Height = 25
    Caption = 'Save To Excel'
    TabOrder = 1
    OnClick = btn1Click
  end
  object pb1: TProgressBar
    Left = 32
    Top = 384
    Width = 449
    Height = 40
    TabOrder = 2
  end
  object btn2: TButton
    Left = 504
    Top = 408
    Width = 137
    Height = 25
    Caption = 'Clear ALL'
    TabOrder = 3
    OnClick = btn2Click
  end
end
