//
// Created by the DataSnap proxy generator.
// 11.11.2013 22:44:20
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
    procedure RegisterWare(ID: Integer);
  end;

implementation

procedure TServerMethods1Client.RegisterWare(ID: Integer);
begin
  if FRegisterWareCommand = nil then
  begin
    FRegisterWareCommand := FDBXConnection.CreateCommand;
    FRegisterWareCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRegisterWareCommand.Text := 'TServerMethods1.RegisterWare';
    FRegisterWareCommand.Prepare;
  end;
  FRegisterWareCommand.Parameters[0].Value.SetInt32(ID);
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

