unit ClientForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TForm2 = class(TForm)
    btnRegisterWare: TButton;
    seWareID: TSpinEdit;
    procedure btnRegisterWareClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

Uses ClientModuleUnit1;

{$R *.dfm}

procedure TForm2.btnRegisterWareClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(
    procedure()
    begin
      clmClient.ServerMethods1Client.RegisterWare(seWareID.Value, clmClient.DSClientCallbackChannelManager1.ManagerId)
    end).Start;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
