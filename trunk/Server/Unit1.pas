unit Unit1;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DBXJSON,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    mmoLog: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LogMsg(const AStr: string);
    procedure QueueLogMsg(const AStr: string);
  end;

var
  Form1: TForm1;

implementation

Uses ServerContainerUnit1;

{$R *.dfm}

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ServerContainer1.DSServer1.Stop;
end;

procedure TForm1.LogMsg(const AStr: string);
begin
  mmoLog.Lines.Add(AStr);
end;

procedure TForm1.QueueLogMsg(const AStr: string);
begin
  TThread.Queue(nil,
    procedure
    begin
      LogMsg(AStr)
    end
  );
end;

end.

