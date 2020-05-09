object frmFindBook: TfrmFindBook
  Left = 0
  Top = 0
  Caption = #46020#49436#44160#49353
  ClientHeight = 269
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 507
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 635
    object Label1: TLabel
      Left = 24
      Top = 22
      Width = 22
      Height = 13
      Caption = #44160#49353
    end
    object edtSearch: TEdit
      Left = 60
      Top = 18
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyUp = edtSearchKeyUp
    end
    object chkSearchTitle: TCheckBox
      Left = 208
      Top = 20
      Width = 49
      Height = 17
      Caption = #51228#47785
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chkSearchAuthor: TCheckBox
      Left = 287
      Top = 20
      Width = 97
      Height = 17
      Caption = #51200#51088
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object grdList: TDBGrid
    Left = 0
    Top = 57
    Width = 507
    Height = 167
    Align = alClient
    DataSource = dsFindBook
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyUp = grdListKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'BOOK_TITLE'
        Title.Caption = #51228#47785
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOOK_AUTHOR'
        Title.Caption = #51200#51088
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOOK_PRICE'
        Title.Caption = #44032#44201
        Width = 50
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 224
    Width = 507
    Height = 45
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 260
    ExplicitWidth = 635
    DesignSize = (
      507
      45)
    object btnSelect: TButton
      Left = 331
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #49440#53469
      ModalResult = 1
      TabOrder = 0
      OnClick = btnSelectClick
      ExplicitLeft = 309
    end
    object btnClose: TButton
      Left = 417
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #45803#44592
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 395
    end
  end
  object dsFindBook: TDataSource
    DataSet = dmDataAccess.qryFindBook
    Left = 192
    Top = 136
  end
end
