//
// Created by the DataSnap proxy generator.
// 17.11.2013 15:30:11
//

unit ClientClassesUnit1;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FRegisterWareCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure RegisterWare(ID: Integer; ClientID: string);
  end;

implementation

procedure TServerMethods1Client.RegisterWare(ID: Integer; ClientID: string);
begin
  if FRegisterWareCommand = nil then
  begin
    FRegisterWareCommand := FDBXConnection.CreateCommand;
    FRegisterWareCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRegisterWareCommand.Text := 'TServerMethods1.RegisterWare';
    FRegisterWareCommand.Prepare;
  end;
  FRegisterWareCommand.Parameters[0].Value.SetInt32(ID);
  FRegisterWareCommand.Parameters[1].Value.SetWideString(ClientID);
  FRegisterWareCommand.ExecuteUpdate;
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods1Client.Destroy;
begin
  FRegisterWareCommand.DisposeOf;
  inherited;
end;

end.

