program DS_Client;

uses
  Vcl.Forms,
  ClientForm in 'ClientForm.pas' {Form2},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {clmClient: TDataModule},
  untfrmSelect in 'untfrmSelect.pas' {frmSelectString};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TclmClient, clmClient);
  Application.CreateForm(TfrmSelectString, frmSelectString);
  Application.Run;
end.
