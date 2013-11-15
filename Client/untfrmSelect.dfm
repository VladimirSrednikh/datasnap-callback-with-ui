object frmSelectString: TfrmSelectString
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1101#1083#1077#1084#1077#1085#1090
  ClientHeight = 281
  ClientWidth = 268
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 268
    Height = 232
    Align = alClient
    TabOrder = 0
    object lst1: TListBox
      Left = 1
      Top = 1
      Width = 266
      Height = 230
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      OnDblClick = lst1DblClick
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 232
    Width = 268
    Height = 49
    Align = alBottom
    TabOrder = 1
    object btnOk: TButton
      Left = 48
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 152
      Top = 14
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
