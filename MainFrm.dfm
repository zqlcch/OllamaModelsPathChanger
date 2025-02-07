object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = Button1
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ollama '#27169#22411#19979#36733#25991#20214#22841#20462#25913#24037#20855' - by '#19981#26029#25104#38271#30340#26497#20809'ROM'
  ClientHeight = 315
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 358
    Top = 87
    Width = 241
    Height = 26
    Cursor = crHandPoint
    AutoSize = False
    Caption = 'by - '#19981#26029#25104#38271#30340#26497#20809' ROM'
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = #24494#36719#38597#40657
    Font.Style = [fsBold, fsItalic, fsUnderline]
    ParentFont = False
    OnClick = Label1Click
  end
  object Button1: TButton
    Left = 14
    Top = 232
    Width = 585
    Height = 66
    Caption = #24674#22797' Ollama '#40664#35748#27169#22411#19979#36733#25991#20214#22841
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 14
    Top = 144
    Width = 585
    Height = 66
    Caption = #33258#23450#20041' Ollama '#27169#22411#19979#36733#25991#20214#22841
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 14
    Top = 16
    Width = 585
    Height = 65
    Enabled = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = #24494#36719#38597#40657
    Font.Style = [fsBold]
    Lines.Strings = (
      #36825#20010#23567#24037#20855#36890#36807#20462#25913#31995#32479#20840#23616#21464#37327' OLLAMA_MODELS '#26469#25913#21464' '
      'Ollama '#27169#22411#30340#19979#36733#25991#20214#22841' '#65292#20462#25913#23436#25104#19968#23450#35760#24471#37325#21551#30005#33041#21734#65281)
    ParentFont = False
    TabOrder = 2
  end
end
