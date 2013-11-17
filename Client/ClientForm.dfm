object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Client'
  ClientHeight = 148
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnRegisterWare: TButton
    Left = 80
    Top = 56
    Width = 121
    Height = 25
    Caption = 'btnRegisterWare'
    TabOrder = 0
    OnClick = btnRegisterWareClick
  end
  object seWareID: TSpinEdit
    Left = 80
    Top = 16
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 20
  end
end
