object FrmMain: TFrmMain
  Left = 216
  Top = 127
  Width = 800
  Height = 588
  Caption = 'GDI Path Text'
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 800
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object PaintBoxTop: TPaintBox
    Left = 0
    Top = 0
    Width = 792
    Height = 368
    Align = alClient
    PopupMenu = PMRenderProperties
    OnPaint = PaintBoxTopPaint
  end
  object PnlBottom: TPanel
    Left = 0
    Top = 368
    Width = 792
    Height = 192
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      792
      192)
    object LblString: TLabel
      Left = 408
      Top = 45
      Width = 29
      Height = 16
      Caption = 'Text:'
    end
    object GPBBorderColor: TGroupBox
      Left = 8
      Top = 98
      Width = 305
      Height = 86
      Caption = ' Border color '
      TabOrder = 2
      object LblBorderAlpha: TLabel
        Left = 12
        Top = 22
        Width = 64
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Alpha'
      end
      object LblBorderRed: TLabel
        Left = 84
        Top = 22
        Width = 62
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Red'
      end
      object LblBorderGreen: TLabel
        Left = 154
        Top = 22
        Width = 63
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Green'
      end
      object LblBorderBlue: TLabel
        Left = 225
        Top = 22
        Width = 60
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Blue'
      end
      object EdtBorderAlpha: TEdit
        Left = 13
        Top = 42
        Width = 42
        Height = 24
        MaxLength = 3
        TabOrder = 0
        Text = '255'
      end
      object UDBorderAlpha: TUpDown
        Left = 55
        Top = 42
        Width = 21
        Height = 24
        Associate = EdtBorderAlpha
        Max = 255
        Position = 255
        TabOrder = 1
      end
      object UDBorderRed: TUpDown
        Left = 126
        Top = 41
        Width = 20
        Height = 24
        Associate = EdtBorderRed
        Max = 255
        Position = 101
        TabOrder = 3
      end
      object EdtBorderRed: TEdit
        Left = 84
        Top = 41
        Width = 42
        Height = 24
        MaxLength = 3
        TabOrder = 2
        Text = '101'
      end
      object UDBorderGreen: TUpDown
        Left = 196
        Top = 42
        Width = 21
        Height = 24
        Associate = EdtBorderGreen
        Max = 255
        Position = 154
        TabOrder = 5
      end
      object EdtBorderGreen: TEdit
        Left = 154
        Top = 42
        Width = 42
        Height = 24
        MaxLength = 3
        TabOrder = 4
        Text = '154'
      end
      object UDBorderBlue: TUpDown
        Left = 267
        Top = 42
        Width = 21
        Height = 24
        Associate = EdtBorderBlue
        Max = 255
        Position = 207
        TabOrder = 7
      end
      object EdtBorderBlue: TEdit
        Left = 225
        Top = 42
        Width = 42
        Height = 24
        MaxLength = 3
        TabOrder = 6
        Text = '207'
      end
    end
    object GPBFontProperties: TGroupBox
      Left = 8
      Top = 10
      Width = 385
      Height = 86
      Caption = ' Font properties '
      TabOrder = 0
      object LblFontNames: TLabel
        Left = 12
        Top = 22
        Width = 204
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Font name'
      end
      object LblFontSize: TLabel
        Left = 232
        Top = 22
        Width = 61
        Height = 17
        AutoSize = False
        Caption = 'Font size'
      end
      object LblBorderSize: TLabel
        Left = 304
        Top = 21
        Width = 73
        Height = 17
        AutoSize = False
        Caption = 'Border size'
      end
      object CBXFontNames: TComboBox
        Left = 12
        Top = 42
        Width = 213
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 0
        OnChange = CBXFontNamesChange
      end
      object EdtFontSize: TEdit
        Left = 232
        Top = 42
        Width = 41
        Height = 24
        MaxLength = 3
        TabOrder = 1
        Text = '72'
      end
      object UDFontSize: TUpDown
        Left = 273
        Top = 42
        Width = 21
        Height = 24
        Associate = EdtFontSize
        Min = 7
        Max = 200
        Position = 72
        TabOrder = 2
      end
      object EdtBorderSize: TEdit
        Left = 304
        Top = 40
        Width = 49
        Height = 24
        MaxLength = 3
        TabOrder = 3
        Text = '4'
      end
      object UDBorderSize: TUpDown
        Left = 353
        Top = 40
        Width = 19
        Height = 24
        Associate = EdtBorderSize
        Min = 1
        Max = 50
        Position = 4
        TabOrder = 4
      end
    end
    object GPBInnerColor: TGroupBox
      Left = 320
      Top = 98
      Width = 297
      Height = 86
      Caption = ' Inner color '
      TabOrder = 3
      object LblInnerAlpha: TLabel
        Left = 12
        Top = 22
        Width = 64
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Alpha'
      end
      object LblInnerRed: TLabel
        Left = 84
        Top = 22
        Width = 62
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Red'
      end
      object LblInnerGreen: TLabel
        Left = 154
        Top = 22
        Width = 63
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Green'
      end
      object LblInnerBlue: TLabel
        Left = 225
        Top = 22
        Width = 60
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Blue'
      end
      object EdtInnerAlpha: TEdit
        Left = 13
        Top = 42
        Width = 42
        Height = 24
        MaxLength = 3
        TabOrder = 0
        Text = '255'
      end
      object UDInnerAlpha: TUpDown
        Left = 55
        Top = 42
        Width = 21
        Height = 24
        Associate = EdtInnerAlpha
        Max = 255
        Position = 255
        TabOrder = 1
      end
      object UDInnerRed: TUpDown
        Left = 126
        Top = 42
        Width = 20
        Height = 24
        Associate = EdtInnerRed
        Max = 255
        Position = 170
        TabOrder = 3
      end
      object EdtInnerRed: TEdit
        Left = 84
        Top = 42
        Width = 42
        Height = 24
        MaxLength = 3
        TabOrder = 2
        Text = '170'
      end
      object UDInnerGreen: TUpDown
        Left = 196
        Top = 42
        Width = 21
        Height = 24
        Associate = EdtInnerGreen
        Max = 255
        Position = 196
        TabOrder = 5
      end
      object EdtInnerGreen: TEdit
        Left = 154
        Top = 42
        Width = 42
        Height = 24
        MaxLength = 3
        TabOrder = 4
        Text = '196'
      end
      object UDInnerBlue: TUpDown
        Left = 267
        Top = 42
        Width = 21
        Height = 24
        Associate = EdtInnerBlue
        Max = 255
        Position = 227
        TabOrder = 7
      end
      object EdtInnerBlue: TEdit
        Left = 225
        Top = 42
        Width = 42
        Height = 24
        MaxLength = 3
        TabOrder = 6
        Text = '227'
      end
    end
    object BtnApply: TButton
      Left = 624
      Top = 106
      Width = 157
      Height = 78
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Apply'
      TabOrder = 4
      OnClick = BtnApplyClick
    end
    object EdtString: TEdit
      Left = 448
      Top = 40
      Width = 329
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Text = 'www.delphisources.ru'
      OnChange = EdtStringChange
    end
  end
  object PMRenderProperties: TPopupMenu
    Left = 4
    Top = 4
    object MIRenderQuality: TMenuItem
      Caption = 'Render quality'
      object MIRenderQualityLow: TMenuItem
        Tag = 1
        AutoCheck = True
        Caption = 'Low'
        GroupIndex = 5
        RadioItem = True
        OnClick = CompQualityClick
      end
      object MIRenderQualityMedium: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'Medium'
        GroupIndex = 5
        RadioItem = True
        OnClick = CompQualityClick
      end
      object MIRenderQualityHigh: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'High'
        Checked = True
        GroupIndex = 5
        RadioItem = True
        OnClick = CompQualityClick
      end
    end
    object MIRenderSmooth: TMenuItem
      Caption = 'Smooth'
      object MIRenderSmoothNone: TMenuItem
        Tag = 1
        AutoCheck = True
        Caption = 'None'
        GroupIndex = 10
        RadioItem = True
        OnClick = SmoothClick
      end
      object MIRenderSmoothAAS: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'Antialias'
        Checked = True
        GroupIndex = 10
        RadioItem = True
        OnClick = SmoothClick
      end
      object MIRenderSmoothHigh: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'High'
        GroupIndex = 10
        RadioItem = True
        OnClick = SmoothClick
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 4
    Top = 36
  end
end
