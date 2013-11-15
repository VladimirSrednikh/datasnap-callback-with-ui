unit ClientModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit1, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, Data.DB, Data.SqlExpr, Data.DBXJSON,
//  Vcl.Forms,
  windows,
  Datasnap.DSCommon, Datasnap.DSSession;

type
  TClientModule1 = class(TDataModule)
    SQLConnection1: TSQLConnection;
    DSClientCallbackChannelManager1: TDSClientCallbackChannelManager;
    procedure DataModuleCreate(Sender: TObject);
  private
    FInstanceOwner: Boolean;
    FServerMethods1Client: TServerMethods1Client;
    function GetServerMethods1Client: TServerMethods1Client;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethods1Client: TServerMethods1Client read GetServerMethods1Client write FServerMethods1Client;
end;

  TmyCallback = class(TDBXCallback)
  protected
    FSelectedString: Integer;
    procedure SelectString(const Arg: TJSONValue);
  public
    function Execute(const Arg: TJSONValue): TJSONValue; override;
  end;

var
  ClientModule1: TClientModule1;

implementation

Uses untfrmSelect;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TClientModule1.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

procedure TClientModule1.DataModuleCreate(Sender: TObject);
begin
  SQLConnection1.Connected := True;
//  DSClientCallbackChannelManager1.ManagerId := TDSTunnelSession.GenerateSessionId;
  DSClientCallbackChannelManager1.RegisterCallback('SelectString', TmyCallback.Create);
end;

destructor TClientModule1.Destroy;
begin
  FServerMethods1Client.Free;
  inherited;
end;

function TClientModule1.GetServerMethods1Client: TServerMethods1Client;
begin
  if FServerMethods1Client = nil then
  begin
    SQLConnection1.Open;
    FServerMethods1Client:= TServerMethods1Client.Create(SQLConnection1.DBXConnection, FInstanceOwner);
  end;
  Result := FServerMethods1Client;
end;

{ TmyCallback }

function TmyCallback.Execute(const Arg: TJSONValue): TJSONValue;
begin
  OutputDebugString(PChar(GetCurrentThreadId.ToString() + ' TmyCallback.Execute start'));
//  Application.ProcessMessages;
  TThread.Synchronize(nil, procedure()
    begin
      SelectString(Arg);
    end);
  Result := TJSONNumber.Create(FSelectedString);
end;

procedure TmyCallback.SelectString(const Arg: TJSONValue);
var
  strs: TStringList;
  enum: TJSONPairEnumerator;
  val, str: string;
begin
  enum := TJSONObject(Arg).GetEnumerator;
  if Assigned(enum) then
  begin
    strs := TStringList.Create;
    try
      while enum.MoveNext do
      begin
        Val:= enum.Current.JsonString.Value;
        str := enum.Current.JsonValue.Value;
        strs.AddObject(str, TObject(val.ToInteger()));
      end;
      FSelectedString := TfrmSelectString.SelectString(strs);
    finally
      strs.Free;
    end;
  end;
end;

end.
