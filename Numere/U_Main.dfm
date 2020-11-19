object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Numere'
  ClientHeight = 685
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    660
    685)
  PixelsPerInch = 96
  TextHeight = 13
  object mmoNumere: TMemo
    Left = 8
    Top = 8
    Width = 644
    Height = 609
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'mmoNumere')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnGenerate: TButton
    Left = 8
    Top = 640
    Width = 305
    Height = 37
    Caption = 'Go!'
    TabOrder = 1
    OnClick = btnGenerateClick
  end
  object btnStop: TButton
    Left = 352
    Top = 640
    Width = 300
    Height = 37
    Caption = 'Stop'
    TabOrder = 2
    OnClick = btnStopClick
  end
end
