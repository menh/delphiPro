unit UnitStrDecordMap;

interface
uses Classes;
type
  TStrDecordMap=class
    FKeyList:TStrings;
    FValList:TList;
  private
    function GetItem(Key:String):Pointer;
    procedure SetItem(Key:string;const ptr:Pointer);
    function GetCount:integer;
  public
    constructor Create;
    destructor Destroy;override;
    procedure Add(Key:string;ptr:Pointer);
    property Items[Key:string]:Pointer read GetItem write SetItem;default;
    property Count:Integer read GetCount;
    function isfind(key:string):boolean;
    procedure Delete(Key:string);
    function FirstValue(index:Integer):string;
    function SecondeValue(index:Integer):pointer;
  end;

implementation
constructor TStrDecordMap.Create;
begin
  FKeyList:=TStringList.Create;
  FValList:=TList.Create;
end;
destructor TStrDecordMap.Destroy;
begin
  FVallist.Free;
  FKeyList.Free;
  inherited Destroy;
end;
procedure TStrDecordMap.Add(Key:string;ptr:Pointer);
begin
  if FKeyList.IndexOf(Key)<>-1 then
  begin
    Exit;
  end;
  FKeyList.Add(Key);
  FValList.Add(ptr);
end;
function TStrDecordMap.GetCount:Integer;
begin
  Result:=FKeylist.Count;
end;

function TStrDecordMap.GetItem(Key:String):Pointer;
var
  KeyIndex:Integer;
begin
  KeyIndex:=FKeyList.IndexOf(Key);
  result:=FValList[KeyIndex];
end;

procedure TStrDecordMap.SetItem(Key:string;const ptr:Pointer);
var
  KeyIndex:Integer;
begin
  KeyIndex:=FKeylist.IndexOf(Key);
  FValList[KeyIndex]:=ptr;
end;
procedure TStrDecordMap.Delete(Key:string);
var
  KeyIndex:integer;
begin
  keyIndex:=FKeyList.indexof(Key);
  FKeyList.Delete(KeyIndex);
  FValList.Delete(KeyIndex);
end;
function TStrDecordMap.FirstValue(index:Integer):string;
begin
  result:=FKeyList[Index];
end;
function TStrDecordMap.SecondeValue(index:Integer):pointer;
begin
  result:=FValList[Index]
end;
function TStrDecordMap.isfind(Key:string):boolean;
begin
  if FKeyList.IndexOf(Key)<>-1 then
  begin
    result:=true;
  end
  else
  begin
    result:=false;
  end;
end;
end.
