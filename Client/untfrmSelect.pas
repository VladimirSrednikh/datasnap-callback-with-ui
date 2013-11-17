unit untfrmSelect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmSelectString = class(TForm)
    lst1: TListBox;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    procedure lst1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function SelectString(AStrs: TStrings): Integer;
  end;

var
  frmSelectString: TfrmSelectString;

implementation

{$R *.dfm}

procedure TfrmSelectString.lst1DblClick(Sender: TObject);
begin
  if lst1.ItemIndex <> -1 then
    ModalResult := mrOk;
end;

class function TfrmSelectString.SelectString(AStrs: TStrings): Integer;
var
  frm: TfrmSelectString;
begin
  Result := -1;
  frm := TfrmSelectString.Create(nil);
  try
    frm.lst1.Items.Assign(AStrs);
    if (frm.ShowModal = mrOk) and (frm.lst1.ItemIndex <> -1) then
      Result := Integer(frm.lst1.Items.Objects[frm.lst1.ItemIndex]);
  finally
    frm.Free;
  end;
end;

end.
