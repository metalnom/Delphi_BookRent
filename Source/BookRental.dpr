program BookRental;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  DataAccessModule in 'DataAccessModule.pas' {dmDataAccess: TDataModule},
  BookForm in 'BookForm.pas' {frmBook},
  CommonFunctions in 'CommonFunctions.pas',
  UserForm in 'UserForm.pas' {frmUser},
  RentForm in 'RentForm.pas' {frmRent},
  FindUserForm in 'FindUserForm.pas' {frmFindUser},
  FindBookForm in 'FindBookForm.pas' {frmFindBook},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TdmDataAccess, dmDataAccess);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
