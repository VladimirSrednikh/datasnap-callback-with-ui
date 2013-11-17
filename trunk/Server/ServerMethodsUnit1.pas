unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  Datasnap.DSProxy, Data.DBXJSON,
  Windows,
  Unit1,
  Vcl.Dialogs;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegisterWare(ID: Integer; ClientID: string);
  end;
{$METHODINFO OFF}

implementation

{$R *.dfm}

uses ServerContainerUnit1;

procedure TServerMethods1.RegisterWare(ID: Integer; ClientID: string);
var
  Params, ParamsServ: TJSONObject;
  ResObj: TJSONValue;
  temp: TJSONValue;
begin
  ResObj := nil;
  Params := TJSONObject.Create;
  Params.AddPair(TJSONPair.Create('1', 'Размер 42'));
  Params.AddPair(TJSONPair.Create('2', 'Размер 43'));
  Params.AddPair(TJSONPair.Create('3', 'Размер 44'));
  ParamsServ := TJSONObject(Params.Clone);
  ServerContainer1.DSServer1.NotifyCallback(ClientID, 'SelectString', Params, ResObj);
  if Assigned(ResObj) then
    begin
      temp := ParamsServ.GetValue(ResObj.Value);
      if Assigned(temp) then
        Form1.QueueLogMsg(Format('RegisterWare %d с разрезом %s', [ID, temp.ToString]))
      else
        Form1.QueueLogMsg(Format('RegisterWare %d без разреза', [ID]));
      ResObj.Free;
      ParamsServ.Free;
    end
  else
    Form1.QueueLogMsg(Format('RegisterWare %d без разреза', [ID]));
end;

end.

