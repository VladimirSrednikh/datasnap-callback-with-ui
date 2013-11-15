unit ClientForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    btnRegisterWare: TButton;
    procedure btnRegisterWareClick(Sender: TObject);
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
        ClientModule1.ServerMethods1Client.RegisterWare(2)
      end).Start;
end;

end.
