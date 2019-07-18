unit UnitHashMap;

interface
  uses Classes;

type
  TStringHashedMap=class(TPersistent)
    FKeyList:TStrings;
    FStrlist:Tstrings;
  private
    function GetItem(Key:String):String;
    procedure SetItem(Key:string;const value:string);
    function GetCount:integer;

  public
    constructor Create;
    destructor Destroy;override;
    property Items[Key:string]:string read GetItem write SetItem;default;
    property Count:Integer read GetCount;
    procedure Add(Key,Str:string);
    procedure Delete(Key:string);
    function FirstValue(index:Integer):string;
    function SecondeValue(index:Integer):string;
    function isfind(Key:string):boolean;
  end;
implementation
procedure TStringHashedMap.Add(Key,str:string);
begin
  if FKeyList.IndexOf(Key)<>-1 then
  begin
    Exit;
  end;
  FKeyList.Add(Key);
  FStrList.Add(Str);
end;

constructor TStringHashedMap.Create;
begin
   FKeyList:=TStringList.Create;
   FStrList:=TStringList.Create;
end;

procedure TStringHashedMap.Delete(Key:string);
var
  KeyIndex:integer;
begin
  keyIndex:=FKeyList.indexof(Key);
  FKeyList.Delete(KeyIndex);
  FStrList.Delete(KeyIndex);
end;

destructor TStringHashedMap.Destroy;
begin
  FStrlist.Free;
  FKeyList.Free;
  inherited Destroy;
end;

function TStringHashedMap.GetCount:Integer;
begin
  Result:=FKeylist.Count;
end;

function TSTringHashedMap.GetItem(Key:String):string;
var
  KeyIndex:Integer;
begin
  KeyIndex:=FKeyList.IndexOf(key);
  result:=FStrList[KeyIndex];
end;


procedure TStringHashedMap.SetItem(Key:string;Const Value:string);
var
  KeyIndex:Integer;
begin
  KeyIndex:=FKeylist.IndexOf(Key);
  FStrList[KeyIndex]:=Value;
end;

function TStringHashedMap.FirstValue(Index:Integer):string;
begin
  result:=FKeyList[Index];
end;
function TStringHashedMap.SecondeValue(Index:Integer):string;
begin
  result:=FStrList[Index];
end;

function TStringHashedMap.isfind(Key:string):boolean;
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
