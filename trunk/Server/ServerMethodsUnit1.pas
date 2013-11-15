unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  Datasnap.DSProxy, Data.DBXJSON,
  Windows,
  Vcl.Dialogs;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegisterWare(ID: Integer);
  end;
{$METHODINFO OFF}

implementation

{$R *.dfm}

uses {System.StrUtils,} ServerContainerUnit1;

procedure TServerMethods1.RegisterWare(ID: Integer);
var
  Params: TJSONObject;
  ResObj: TJSONValue;
begin
  ResObj := nil;
  OutputDebugString(PChar(GetCurrentThreadId.ToString() + ' Server RegisterWare start'));
  Params := TJSONObject.Create;
  Params.AddPair(TJSONPair.Create('1', 'Размер 42'));
  Params.AddPair(TJSONPair.Create('2', 'Размер 43'));
  Params.AddPair(TJSONPair.Create('3', 'Размер 44'));
  ServerContainer1.DSServer1.NotifyCallback('612888.388581.621832', 'SelectString', Params, ResObj);
  if Assigned(ResObj) then
    OutputDebugString(PChar(GetCurrentThreadId.ToString() + ' Server RegisterWare End Result = ' + ResObj.ToString()))
  else
    OutputDebugString(PChar(GetCurrentThreadId.ToString() + ' Server RegisterWare End Result = nil'));
  ResObj.Free;
end;

end.

