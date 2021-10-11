object Form_Principale: TForm_Principale
  Left = 736
  Top = 375
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Parameters Loup'
  ClientHeight = 336
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label_Coeff: TLabel
    Left = 8
    Top = 18
    Width = 180
    Height = 16
    Caption = 'Coefficient de grossissement :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object UpDown_Coeff: TUpDown
    Left = 240
    Top = 8
    Width = 17
    Height = 25
    Max = 50
    TabOrder = 0
    OnClick = UpDown_CoeffClick
  end
  object Edit_Coefficient: TEdit
    Left = 197
    Top = 8
    Width = 41
    Height = 26
    Color = clHighlightText
    ReadOnly = True
    TabOrder = 1
  end
  object GroupBox_Suivi: TGroupBox
    Left = 8
    Top = 41
    Width = 329
    Height = 129
    Caption = 'Suivi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Check_Suivi_Souris: TCheckBox
      Left = 10
      Top = 30
      Width = 296
      Height = 20
      Caption = 'Suivre le pointeur de la souris'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
      OnClick = Check_Suivi_SourisClick
    end
    object Check_Suivi_Clavier: TCheckBox
      Left = 10
      Top = 59
      Width = 296
      Height = 21
      Caption = 'Suivre les '#1081'l'#1081'ments s'#1081'lectionn'#1081's au clavier'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Check_Suivi_Texte: TCheckBox
      Left = 10
      Top = 89
      Width = 277
      Height = 21
      Caption = 'Suivre l'#39#1081'dition du texte'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object GroupBox_Presentation: TGroupBox
    Left = 8
    Top = 179
    Width = 329
    Height = 110
    Caption = 'Pr'#1081'sentation'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Check_Inv_Color: TCheckBox
      Left = 10
      Top = 22
      Width = 287
      Height = 20
      Caption = 'Inverser les couleurs'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Check_Dem_Ico: TCheckBox
      Left = 10
      Top = 51
      Width = 306
      Height = 21
      Caption = 'D'#1081'marrer sous forme d'#39'ic'#1092'ne'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Check_Aff_Loupe: TCheckBox
      Left = 10
      Top = 81
      Width = 198
      Height = 21
      Caption = 'Afficher la loupe'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
      OnClick = Check_Aff_LoupeClick
    end
  end
  object Button_Close: TButton
    Left = 224
    Top = 304
    Width = 113
    Height = 25
    Caption = 'Exit'
    TabOrder = 4
    OnClick = Button_CloseClick
  end
  object Button_Help: TButton
    Left = 104
    Top = 304
    Width = 114
    Height = 25
    Caption = 'About'
    TabOrder = 5
    OnClick = Button_HelpClick
  end
  object Timer_Prise: TTimer
    Interval = 1
    OnTimer = Timer_PriseTimer
    Left = 280
  end
end
