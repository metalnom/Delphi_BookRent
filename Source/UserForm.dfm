object frmUser: TfrmUser
  Left = 0
  Top = 0
  Caption = #54924#50896' '#44288#47532' '#54868#47732
  ClientHeight = 478
  ClientWidth = 816
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 816
    Height = 49
    Align = alTop
    TabOrder = 0
    DesignSize = (
      816
      49)
    object lblCaption: TLabel
      Left = 24
      Top = 18
      Width = 44
      Height = 13
      Caption = #54924#50896#44288#47532
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAdd: TButton
      Left = 650
      Top = 13
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #49888#44508' '#46321#47197
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnClose: TButton
      Left = 731
      Top = 13
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #45803#44592
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
  object pnlContent: TPanel
    Left = 0
    Top = 49
    Width = 816
    Height = 429
    Align = alClient
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 511
      Top = 1
      Width = 8
      Height = 427
      Align = alRight
      ExplicitLeft = 536
    end
    object pnlGrig: TPanel
      Left = 1
      Top = 1
      Width = 510
      Height = 427
      Align = alClient
      TabOrder = 0
      object pnlGridHeader: TPanel
        Left = 1
        Top = 1
        Width = 508
        Height = 48
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 22
          Top = 16
          Width = 22
          Height = 13
          Caption = #44160#49353
        end
        object edtSearch: TEdit
          Left = 52
          Top = 12
          Width = 121
          Height = 21
          TabOrder = 0
          OnKeyUp = edtSearchKeyUp
        end
        object chkSearchName: TCheckBox
          Left = 200
          Top = 15
          Width = 57
          Height = 17
          Caption = #51060#47492
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object chkSearchPhone: TCheckBox
          Left = 269
          Top = 15
          Width = 97
          Height = 17
          Caption = #51204#54868#48264#54840
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      object grdList: TDBGrid
        Left = 1
        Top = 49
        Width = 508
        Height = 377
        Align = alClient
        DataSource = dsUser
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'USER_NAME'
            Title.Caption = #51060#47492
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_BIRTH'
            Title.Caption = #49373#45380#50900#51068
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_SEX_STR'
            Title.Caption = #49457#48324
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_PHONE'
            Title.Caption = #51204#54868#48264#54840
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_RENT_COUNT'
            Title.Caption = #45824#50668#44428#49688
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_REG_DATE'
            Title.Caption = #46321#47197#51068#51088
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_OUT'
            Title.Caption = #53448#53748#50668#48512
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USER_OUT_DATE'
            Title.Caption = #53448#53748#51068#51088
            Visible = True
          end>
      end
    end
    object pnlInput: TPanel
      Left = 519
      Top = 1
      Width = 296
      Height = 427
      Align = alRight
      TabOrder = 1
      DesignSize = (
        296
        427)
      object Label2: TLabel
        Left = 12
        Top = 9
        Width = 22
        Height = 13
        Caption = #51060#47492
      end
      object Label3: TLabel
        Left = 12
        Top = 58
        Width = 44
        Height = 13
        Caption = #49373#45380#50900#51068
      end
      object Label4: TLabel
        Left = 12
        Top = 172
        Width = 44
        Height = 13
        Caption = #51204#54868#48264#54840
      end
      object Label5: TLabel
        Left = 12
        Top = 223
        Width = 44
        Height = 13
        Caption = #47700#51068#51452#49548
      end
      object edtName: TDBEdit
        Left = 12
        Top = 27
        Width = 129
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'USER_NAME'
        DataSource = dsUser
        TabOrder = 0
        OnExit = edtNameExit
      end
      object dpBirth: TCalendarPicker
        Left = 12
        Top = 77
        Width = 129
        Height = 33
        Anchors = [akLeft, akTop, akRight]
        CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
        CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
        CalendarHeaderInfo.DaysOfWeekFont.Height = -13
        CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
        CalendarHeaderInfo.DaysOfWeekFont.Style = []
        CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
        CalendarHeaderInfo.Font.Color = clWindowText
        CalendarHeaderInfo.Font.Height = -20
        CalendarHeaderInfo.Font.Name = 'Segoe UI'
        CalendarHeaderInfo.Font.Style = []
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        OnCloseUp = dpBirthCloseUp
        ParentFont = False
        TabOrder = 1
        TextHint = 'select a date'
      end
      object grpSex: TDBRadioGroup
        Left = 12
        Top = 122
        Width = 129
        Height = 42
        Anchors = [akLeft, akTop, akRight]
        Caption = #49457#48324
        Columns = 2
        DataField = 'USER_SEX'
        DataSource = dsUser
        Items.Strings = (
          #45224
          #50668)
        TabOrder = 2
        Values.Strings = (
          'M'
          'F')
      end
      object edtPhone: TDBEdit
        Left = 12
        Top = 191
        Width = 129
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'USER_PHONE'
        DataSource = dsUser
        TabOrder = 3
      end
      object edtMail: TDBEdit
        Left = 12
        Top = 243
        Width = 129
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'USER_MAIL'
        DataSource = dsUser
        TabOrder = 4
      end
      object GroupBox1: TGroupBox
        Left = 147
        Top = 27
        Width = 134
        Height = 207
        Anchors = [akTop, akRight]
        TabOrder = 5
        object imgUser: TImage
          Left = 1
          Top = 3
          Width = 133
          Height = 201
          Proportional = True
          Stretch = True
        end
      end
      object btnClearImage: TButton
        Left = 146
        Top = 240
        Width = 65
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #52488#44592#54868
        TabOrder = 6
        OnClick = btnClearImageClick
      end
      object btnLoadImage: TButton
        Left = 217
        Top = 240
        Width = 65
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #48520#47084#50724#44592
        TabOrder = 7
        OnClick = btnLoadImageClick
      end
      object btnDelete: TButton
        Left = 6
        Top = 298
        Width = 75
        Height = 25
        Caption = #54924#50896#53448#53748
        TabOrder = 8
        OnClick = btnDeleteClick
      end
      object btnSave: TButton
        Left = 127
        Top = 298
        Width = 75
        Height = 25
        Caption = #51200#51109
        TabOrder = 9
        OnClick = btnSaveClick
      end
      object btnCancel: TButton
        Left = 208
        Top = 298
        Width = 75
        Height = 25
        Caption = #52712#49548
        TabOrder = 10
        OnClick = btnCancelClick
      end
    end
  end
  object dlgOpenImage: TOpenDialog
    Left = 706
    Top = 158
  end
  object dsUser: TDataSource
    DataSet = dmDataAccess.qryUser
    OnStateChange = dsUserStateChange
    OnDataChange = dsUserDataChange
    Left = 281
    Top = 266
  end
end
