unit UserForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.WinXCalendars, Vcl.Mask;

type
  TfrmUser = class(TForm)
    pnlHeader: TPanel;
    pnlContent: TPanel;
    lblCaption: TLabel;
    btnAdd: TButton;
    btnClose: TButton;
    pnlGrig: TPanel;
    pnlInput: TPanel;
    Splitter1: TSplitter;
    pnlGridHeader: TPanel;
    grdList: TDBGrid;
    Label1: TLabel;
    edtSearch: TEdit;
    chkSearchName: TCheckBox;
    chkSearchPhone: TCheckBox;
    Label2: TLabel;
    edtName: TDBEdit;
    Label3: TLabel;
    dpBirth: TCalendarPicker;
    grpSex: TDBRadioGroup;
    Label4: TLabel;
    edtPhone: TDBEdit;
    Label5: TLabel;
    edtMail: TDBEdit;
    GroupBox1: TGroupBox;
    btnClearImage: TButton;
    btnLoadImage: TButton;
    imgUser: TImage;
    dlgOpenImage: TOpenDialog;
    btnDelete: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    dsUser: TDataSource;
    procedure btnLoadImageClick(Sender: TObject);
    procedure btnClearImageClick(Sender: TObject);
    procedure dsUserDataChange(Sender: TObject; Field: TField);
    procedure dpBirthCloseUp(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dsUserStateChange(Sender: TObject);
    procedure edtNameExit(Sender: TObject);
    procedure edtSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure DuplicatedUser;
  public
    { Public declarations }

  end;

var
  frmUser: TfrmUser;

implementation

{$R *.dfm}

uses DataAccessModule, CommonFunctions;

procedure TfrmUser.btnAddClick(Sender: TObject);
begin
  dmDataAccess.qryUser.Append;
  edtName.SetFocus;
end;

procedure TfrmUser.btnCancelClick(Sender: TObject);
begin
  dmDataAccess.qryUser.Cancel;
end;

procedure TfrmUser.btnClearImageClick(Sender: TObject);
var
  Field: TField;
begin
  imgUser.Picture.Assign(nil);
  Field := dmDataAccess.qryUser.FieldByName('USER_IMAGE');
  if dmDataAccess.qryUser.State <> dsEdit then
    dmDataAccess.qryUser.Edit;
  Field.Assign(nil);
end;

procedure TfrmUser.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUser.btnDeleteClick(Sender: TObject);
var
  RentCount: integer;
  Name, Msg, OutYN: string;
begin
  RentCount := dmDataAccess.qryUser.FieldByName('USER_RENT_COUNT').AsInteger;
  Name := dmDataAccess.qryUser.FieldByName('USER_NAME').AsString;
  OutYN := dmDataAccess.qryUser.FieldByName('USER_OUT_YN').AsString;

  if OutYN = 'Y' then
  begin
    ShowMessage('�̹� Ż���� ȸ���Դϴ�.');
    Exit;
  end;

  if RentCount > 0 then
  begin
    ShowMessage(Format('���� �뿩���� ������ %d�� �ֽ��ϴ�. �ݳ��� Ż�� �����մϴ�.', [RentCount]));
    Exit;
  end;

  Msg := Format('[%s]���� Ż��ó���Ͻðڽ��ϱ�?', [Name]);
  if MessageDlg(Msg, mtInformation, [mbYes, mbNo], 0) = mrNo then
    Exit;
  if dmDataAccess.qryUser.State <> dsEdit then
    dmDataAccess.qryUser.Edit;
  dmDataAccess.qryUser.FieldByName('USER_OUT_YN').AsString := 'Y';
  dmDataAccess.qryUser.FieldByName('USER_OUT_DATE').AsDateTime := Now;
  dmDataAccess.qryUser.Post;
  dmDataAccess.qryUser.Refresh;

end;

procedure TfrmUser.btnLoadImageClick(Sender: TObject);
var
  Field: TField;
begin
  if dlgOpenImage.Execute then
  begin
    LoadImageFromFile(imgUser, dlgOpenImage.FileName);
    Field := dmDataAccess.qryUser.FieldByName('USER_IMAGE');
    SaveImageToBlobField(imgUser, Field as TBlobField);
  end;
end;

procedure TfrmUser.btnSaveClick(Sender: TObject);
begin
  if edtName.Text = '' then
  begin
    ShowMessage('�̸��� �Է��ϼ���');
    edtName.SetFocus;
    Exit;
  end;

  if dpBirth.IsEmpty then
  begin
    ShowMessage('��������� �Է��ϼ���');
    dpBirth.SetFocus;
    Exit;
  end;
  if dmDataAccess.qryUser.FieldByName('USER_REG_DATE').AsString = '' then
    dmDataAccess.qryUser.FieldByName('USER_REG_DATE').AsDateTime := Now;
  dmDataAccess.qryUser.Post;
  dmDataAccess.qryUser.Refresh;
end;

procedure TfrmUser.dpBirthCloseUp(Sender: TObject);
var
  Field: TField;
begin
   Field := dmDataAccess.qryUser.FieldByName('USER_BIRTH');

   if Field.AsDateTime <> dpBirth.Date then
   begin
     if dmDataAccess.qryUser.State = dsBrowse then
     begin
       if dmDataAccess.qryUser.RecNo > 0 then
         dmDataAccess.qryUser.Edit
       else
         dmDataAccess.qryUser.Append;
     end;
     if dpBirth.IsEmpty then
       Field.Assign(nil)
     else
       Field.AsDateTime := dpBirth.Date;
   end;

   DuplicatedUser;
end;

procedure TfrmUser.dsUserDataChange(Sender: TObject; Field: TField);
var
  LField: TField;
begin
  if dmDataAccess.qryUser.State = dsEdit then
    Exit;
  LField := dmDataAccess.qryUser.FieldByName('USER_IMAGE');
  LoadImageFromBlobField(imgUser, LField as TBlobField);

  LField := dmDataAccess.qryUser.FieldByName('USER_BIRTH');
  if LField.AsDateTime = 0 then
    dpBirth.IsEmpty := True
  else
    dpBirth.Date := LField.AsDateTime;

end;

procedure TfrmUser.dsUserStateChange(Sender: TObject);
var
  State: TDataSetState;
  OutYN: string;
begin
  State := dmDataAccess.qryUser.State;

  btnAdd.Enabled := (State = dsBrowse);
  btnSave.Enabled := (State <> dsBrowse);
  btnDelete.Enabled := (State = dsBrowse);
  btnCancel.Enabled := (State <> dsBrowse);
end;

procedure TfrmUser.DuplicatedUser;
var
  Seq: Integer;
  Name: String;
  Birth: TDateTime;
begin
  Seq := dmDataAccess.qryUser.FieldByName('USER_SEQ').AsInteger;
  Name := dmDataAccess.qryUser.FieldByName('USER_NAME').AsString;
  Birth := dmDataAccess.qryUser.FieldByName('USER_BIRTH').AsDateTime;

  if (Name = '') or (Birth = 0) then
    Exit;

  if dmDataAccess.DuplicatedUSER(Seq, Name, Birth) then
    dmDataAccess.qryUser.Cancel;
    ShowMessage('�̹� ��ϵ� ȸ���Դϴ�.(�̸��� ��������� �ߺ��˴ϴ�.)');

end;

procedure TfrmUser.edtNameExit(Sender: TObject);
begin
  DuplicatedUser;
end;

procedure TfrmUser.edtSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Filter: string;
begin
  Filter := '';
  if edtSearch.Text <> '' then
  begin
    if chkSearchName.Checked then
      Filter := Format('USER_NAME like ''%%%s%%''', [edtSearch.Text]);
    if chkSearchPhone.Checked then
    begin
      if Filter <> '' then
        Filter := Filter + ' or ';
      Filter := Filter + Format('USER_PHONE like ''%%%s%%''', [edtSearch.Text]);
    end;
  end;

  dmDataAccess.qryUser.Filter := Filter;
  dmDataAccess.qryUser.Filtered := (Filter <> '');
end;

end.