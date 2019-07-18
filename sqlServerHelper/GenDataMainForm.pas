unit GenDataMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, Grids, DBGrids, ADODB,StrUtils,Math,UnitHashMap,
  UnitStrDecordMap,GenOptData,
  ValEdit;

type
  TGenData = class(TForm)
    JYDY: TLabeledEdit;
    ZQDM: TLabeledEdit;
    CJSL: TLabeledEdit;
    CJJG: TLabeledEdit;
    ZQZH: TLabeledEdit;
    ZJZH: TLabeledEdit;
    ITF_SH_GH: TButton;
    ITF_SH_JSMX: TButton;
    ITF_SH_ZJHZ: TButton;
    ITF_SH_ZQYE: TButton;
    Edit1: TEdit;
    ADOConnection: TADOConnection;
    ADOQuery: TADOQuery;
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    AutoGenFileButton: TButton;
    ShowOPTButton: TButton;

    procedure ITF_SH_GHClick(Sender: TObject);
    procedure ITF_SH_JSMXClick(Sender: TObject);
    procedure ITF_SH_ZJHZClick(Sender: TObject);
    procedure ITF_SH_ZQYEClick(Sender: TObject);
    procedure AutoGenFileButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShowOPTButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  kerValueMap=class
    keyss:string;
    value:string;
  end;
type
  keyValue=record
    key:string;
    value:string;
  end;
type
  BaseData=record
    sJYDY:string;
    sZQDM:string;
    sCJSL:string;
    sCJJG:string;
    sZQZH:string;
    sZJZH:string;
    sSTK_BIZ:string;
   end;
type
  ITF_SH_GHData=record
  
    sGDDM:string;
    sGDXM:string;
    sBCRQ:string;
    sCJBH:string;
    sGSDM:string;

    sCJSL:string;
    sBCYE:string;
    sZQDM:string;
    sSBSJ:string;
    sCJSJ:string;

    sCJJG:string;
    sCJJE:string;
    sSQBH:string;
    sBS  :string;
    sMJBH:string;
    
   end;
type
  ITF_SH_JSMXData=record
    sSCDM:string;
    sJLLX:string;
    sJYFS:string;
    sJSFS:string;
    sYWLX:string;

    sQSBZ:string;
    sGHLX:string;
    sJSBH:string;
    sCJBH:string;
    sSQBH:string;

    sWTBH:string;
    sJYRQ:string;
    sQSRQ:string;
    sJSRQ:string;
    sQTRQ:string;

    sWTSJ:string;
    sCJSJ:string;
    sXWH1:string;
    sXWH2:string;
    sXWHY:string;

    sJSHY:string;
    sTGHY:string;
    sZQZH:string;
    sZQDM1:string;
    sSQDM2:string;

    sZQLB:string;
    sLTLX:string;
    sQYLB:string;
    sGPNF:string;
    sMMBZ:string;

    sSL:string;
    sCJSL:string;
    sZJZH:string;
    sBZ:string;
    sJG1:string;

    sJG2:string;
    sQSJE:string;
    sYHS:string;
    sJSF:string;
    sGHF:string;

    sZGF:string;
    sSXF:string;
    sQTJE1:string;
    sQTJE2:string;
    sQTJE3:string;

    sSJSF:string;
    sJGDM:string;
    sFJSM:string;
  end;
type
  ITF_SH_ZJHZData=record
    sTRD_DATE:string;
    sITF_CFG_SN:string;
    sREC_SN:string;
    sSCDM:string;
    sJLLX:string;
    sJSFS:string;
    sQSRQ:string;
    sJSRQ:string;
    sXWH:string;
    sQSBH:string;
    sZJZH:string;
    sYHDM:string;
    sSJMJE:string;
    sBJMJE:string;
    sQSJE:string;
    sYHS:string;
    sJSF:string;
    sGHF:string;
    sZGF:string;
    sSXF:string;
    sQTFY1:string;
    sQTFY2:string;
    sQTFY3:string;
    sSJSF:string;
    sQSBZ:string;
    sYYRQ:string;
    sBCSM:string;
  end;
type
  PITF_SH_ZJHZData=^ITF_SH_ZJHZData;
type
  ITF_SH_ZQYEData=record
    sTRD_DATE:string;
    sITF_CFG_SN:string;
    sREC_SN:string;
    sSCDM:string;
    sQSBH:string;
    sZQZH:string;
    sXWH:string;
    sZQDM:string;
    sZQLB:string;
    sLTLX:string;
    sQYLB:string;
    sGPNF:string;
    sYE1:string;
    sYE2:string;
    sBY_01:string;
    sJZRQ:string;
  end;
type
  PITF_SH_ZQYEData=^ITF_SH_ZQYEData;
  
procedure InitRBaseData;
procedure InitRITF_SH_GHData;
procedure InitRITF_SH_JSMXData;
procedure InitRITF_SH_ZJHZData(pZJZH:string;pITF_SH_ZJHZSUMMap:TStrDecordMap);

//procedure CalRITF_SH_ZJHZData;
procedure InitRITF_SH_ZQYEData(pSTK_BIN:string;pZQDM:string;pITF_SH_ZQYESUMMap:TStrDecordMap);
function LeftZeroMatch(iNum:Integer;iCount:Integer):string;
function getSqlStmt(fileName:string):string;
procedure genfile(filename:string);
procedure deletefile(filename:string);
procedure addmap(pTStrDecordMap:TStrDecordMap);
var
  GenData: TGenData;
  RBaseData:BaseData;
  RITF_SH_GHData:ITF_SH_GHData;
  RITF_SH_JSMXData:ITF_SH_JSMXData;
  RITF_SH_ZJHZData:ITF_SH_ZJHZData;
  RITF_SH_ZQYEData:ITF_SH_ZQYEData;
  ValueListEditorGH: TValueListEditor;
  ITF_SH_GHList:TList;
  ITF_SH_JSMXList:TList;
  ITF_SH_ZJHZList:TList;
  ITF_SH_ZQYEList:TList;
  List:TList;

  ITF_SH_GHMap:TStringHashedMap;
  ITF_SH_JSMXMap:TStringHashedMap;
  ITF_SH_ZJHZMap:TStringHashedMap;
  ITF_SH_ZJHZSUMMap:TStrDecordMap;
  ITF_SH_ZQYEMap:TStringHashedMap;
  ITF_SH_ZQYESUMMap:TStrDecordMap;
procedure InitRITF_SH_ZJHZPtrData(pZJZH:string;pITF_SH_ZJHZSUMMap:TStrDecordMap;pITF_SH_JSMXMap:TStringHashedMap);
procedure calRITF_SH_ZJHZPtrData(pZJZH:string;pITF_SH_ZJHZSUMMap:TStrDecordMap;pITF_SH_JSMXMap:TStringHashedMap);
procedure InitRITF_SH_ZQYEPtrData(pZQDM:string;pITF_SH_ZQYESUMMap:TStrDecordMap;pITF_SH_JSMXMap:TStringHashedMap);
procedure calRITF_SH_ZQYEPtrData(pZQDM:string;pITF_SH_ZQYESUMMap:TStrDecordMap;pITF_SH_JSMXMap:TStringHashedMap);
implementation

uses Unit1;
var iCJBH,iSQBH,iJSBH:Integer;
    fLL:double;



{$R *.dfm}
procedure InitRBaseData;
begin
  RBaseData.sJYDY:=GenDataMainForm.GenData.JYDY.Text;
  RBaseData.sZQDM:=GenDataMainForm.GenData.ZQDM.Text;
  RBaseData.sCJSL:=GenDataMainForm.GenData.CJSL.Text;
  RBaseData.sCJJG:=GenDataMainForm.GenData.CJJG.Text;
  RBaseData.sZQZH:=GenDataMainForm.GenData.ZQZH.Text;
  RBaseData.sZJZH:=GenDataMainForm.GenData.ZJZH.Text;
end;
procedure InitRITF_SH_GHData;
var
 p_kv:^keyvalue;
begin
  //InitRBaseData;

  ITF_SH_GHMap:=TStringHashedMap.create;
  ITF_SH_GHMap.Add('GDDM',RBaseData.sZQZH);
  //ITF_SH_GHMap.Add('GDXM',' ');
  ITF_SH_GHMap.Add('BCRQ',FormatDateTime('yyyymmdd',now()));
  ITF_SH_GHMap.Add('CJBH',LeftZeroMatch(iCJBH,7));iCJBH:=iCJBH+1;
  ITF_SH_GHMap.Add('GSDM',RBaseData.sJYDY);

  ITF_SH_GHMap.Add('CJSL',RBaseData.sCJSL);
  ITF_SH_GHMap.Add('BCYE','0');
  ITF_SH_GHMap.Add('ZQDM',RBaseData.sZQDM);
  ITF_SH_GHMap.Add('SBSJ','102810');
  ITF_SH_GHMap.Add('CJSJ','112810');

  ITF_SH_GHMap.Add('CJJG',RBaseData.sCJJG);
  ITF_SH_GHMap.Add('CJJE',FloatToStr(RoundTo(StrToFloat(RBaseData.sCJSL)*StrToFloat(RBaseData.sCJJG),2)));
  ITF_SH_GHMap.Add('SQBH','LSH'+LeftZeroMatch(iSQBH,6));
  if RBaseData.sSTK_BIZ='100' then
  begin
    ITF_SH_GHMap.Add('BS','B');
  end
  else
    ITF_SH_GHMap.Add('BS','S');
  begin
  end;
 // ITF_SH_GHMap.Add('MJBH',' ');

  ITF_SH_GHList:=Tlist.create;
  new(p_kv);p_kv.key:='GDDM';p_kv.value:=RBaseData.sZQZH;ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='GDXM';p_kv.value:=' ';ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='BCRQ';p_kv.value:=FormatDateTime('yyyymmdd',now());ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='CJBH';p_kv.value:=LeftZeroMatch(iCJBH,7);ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='GSDM';p_kv.value:=RBaseData.sJYDY;ITF_SH_GHList.Add(p_kv);

  new(p_kv);p_kv.key:='CJSL';p_kv.value:=RBaseData.sCJSL;ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='BCYE';p_kv.value:='0';ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='ZQDM';p_kv.value:=RBaseData.sZQDM;ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='SBSJ';p_kv.value:='102810';ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='CJSJ';p_kv.value:='112810';ITF_SH_GHList.Add(p_kv);

  new(p_kv);p_kv.key:='CJJG';p_kv.value:=RBaseData.sCJJG;ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='CJJE';p_kv.value:=FloatToStr(RoundTo(StrToFloat(RBaseData.sCJSL)*StrToFloat(RBaseData.sCJJG),2));ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='SQBH';p_kv.value:='LSH'+LeftZeroMatch(iSQBH,6);ITF_SH_GHList.Add(p_kv);iSQBH:=iSQBH+1;
  new(p_kv);p_kv.key:='BS';p_kv.value:='B';ITF_SH_GHList.Add(p_kv);
 // new(p_kv);p_kv.key:='MJBH';p_kv.value:=' ';ITF_SH_GHList.Add(p_kv);

 {
  RITF_SH_GHData.sGDDM:=RBaseData.sZQZH;
  RITF_SH_GHData.sGDXM:=' ';
  RITF_SH_GHData.sBCRQ:=FormatDateTime('yyyymmdd',now());
  RITF_SH_GHData.sCJBH:='0000000';
  RITF_SH_GHData.sGSDM:=RBaseData.sJYDY;

  RITF_SH_GHData.sCJSL:=RBaseData.sCJSL;
  RITF_SH_GHData.sBCYE:='0';
  RITF_SH_GHData.sZQDM:=RBaseData.sZQDM;
  RITF_SH_GHData.sSBSJ:='102810';
  RITF_SH_GHData.sCJSJ:='112810';

  RITF_SH_GHData.sCJJG:=RBaseData.sCJJG;
  RITF_SH_GHData.sCJJE:='  ';//floattostr(strtofloat(RITF_SH_GHData.sCJSL)*strtofloat(RITF_SH_GHData.sCJJG));
  RITF_SH_GHData.sSQBH:='LSH'+'111111';
  RITF_SH_GHData.sBS  :='B';
  RITF_SH_GHData.sMJBH:=' ';  }
end;
procedure InitRITF_SH_JSMXData;
var
 p_kv:^keyvalue;
begin

  ITF_SH_JSMXMap:=TStringHashedMap.create;
  ITF_SH_JSMXMap.Add('SCDM','01');
  ITF_SH_JSMXMap.Add('JLLX','001');
  ITF_SH_JSMXMap.Add('JYFS','001');
  ITF_SH_JSMXMap.Add('JSFS','001');
  ITF_SH_JSMXMap.Add('YWLX','001');

  ITF_SH_JSMXMap.Add('QSBZ','060');
  ITF_SH_JSMXMap.Add('GHLX','00A');
  ITF_SH_JSMXMap.Add('JSBH',LeftZeroMatch(iJSBH,16));iJSBH:=iJSBH+1;
  ITF_SH_JSMXMap.Add('CJBH',ITF_SH_GHMap['CJBH']);
  ITF_SH_JSMXMap.Add('SQBH',ITF_SH_GHMap['SQBH']);

  //ITF_SH_JSMXMap.Add('WTBH',' ');
  ITF_SH_JSMXMap.Add('JYRQ',FormatDateTime('yyyymmdd',now()));
  ITF_SH_JSMXMap.Add('QSRQ',FormatDateTime('yyyymmdd',now()));
  ITF_SH_JSMXMap.Add('JSRQ',FormatDateTime('yyyymmdd',now()));
  ITF_SH_JSMXMap.Add('QTRQ','0');

  //ITF_SH_JSMXMap.Add('WTSJ',' ');
  //ITF_SH_JSMXMap.Add('CJSJ',' ');
  ITF_SH_JSMXMap.Add('XWH1',RBaseData.sJYDY);
  ITF_SH_JSMXMap.Add('XWH2',RBaseData.sJYDY);
  ITF_SH_JSMXMap.Add('XWHY','JS509');

  ITF_SH_JSMXMap.Add('JSHY','JS509');
  //ITF_SH_JSMXMap.Add('TGHY',' ');
  ITF_SH_JSMXMap.Add('ZQZH',RBaseData.sZQZH);
  ITF_SH_JSMXMap.Add('ZQDM1',RBaseData.sZQDM);
  //ITF_SH_JSMXMap.Add('ZQDM2',' ');

  ITF_SH_JSMXMap.Add('ZQLB','PT');
  ITF_SH_JSMXMap.Add('LTLX','0');
  //ITF_SH_JSMXMap.Add('QYLB',' ');
  ITF_SH_JSMXMap.Add('GPNF','0');
  ITF_SH_JSMXMap.Add('MMBZ','B');

  ITF_SH_JSMXMap.Add('SL',RBaseData.sCJSL);
  ITF_SH_JSMXMap.Add('CJSL',RBaseData.sCJSL);
  ITF_SH_JSMXMap.Add('ZJZH',RBaseData.sZJZH);
  ITF_SH_JSMXMap.Add('BZ','RMB');
  ITF_SH_JSMXMap.Add('JG1',RBaseData.sCJJG);

  ITF_SH_JSMXMap.Add('JG2',RBaseData.sCJJG);
  ITF_SH_JSMXMap.Add('QSJE','-'+FloatToStr(RoundTo(StrToFloat(RBaseData.sCJSL)*StrToFloat(RBaseData.sCJJG),2)));
  ITF_SH_JSMXMap.Add('YHS',FloatToStr(RoundTo(StrToFloat(RBaseData.sCJSL)*StrToFloat(RBaseData.sCJJG)/1000*fLL,2)*1000));
  ITF_SH_JSMXMap.Add('JSF',FloatToStr(RoundTo(StrToFloat(RBaseData.sCJSL)*StrToFloat(RBaseData.sCJJG)/1000*fLL,2)*1000));
  ITF_SH_JSMXMap.Add('GHF',FloatToStr(RoundTo(StrToFloat(RBaseData.sCJSL)*StrToFloat(RBaseData.sCJJG)/1000*fLL,2)*1000));

  ITF_SH_JSMXMap.Add('ZGF',FloatToStr(RoundTo(StrToFloat(RBaseData.sCJSL)*StrToFloat(RBaseData.sCJJG)/1000*fLL,2)*1000));
  ITF_SH_JSMXMap.Add('SXF',FloatToStr(RoundTo(StrToFloat(RBaseData.sCJSL)*StrToFloat(RBaseData.sCJJG)/1000*fLL,2)*1000));
  ITF_SH_JSMXMap.Add('QTJE1','0.00');
  ITF_SH_JSMXMap.Add('QTJE2','0.00');
  ITF_SH_JSMXMap.Add('QTJE3','0.00');

  ITF_SH_JSMXMap.Add('SJSF',FloatToStr(StrToFloat(ITF_SH_JSMXMap['QSJE'])+StrToFloat(ITF_SH_JSMXMap['YHS'])+StrToFloat(ITF_SH_JSMXMap['JSF'])+StrToFloat(ITF_SH_JSMXMap['GHF'])+StrToFloat(ITF_SH_JSMXMap['ZGF'])+StrToFloat(ITF_SH_JSMXMap['SXF'])));
  ITF_SH_JSMXMap.Add('JGDM','0000');
  ITF_SH_JSMXMap.Add('FJSM','Ａ股交易清算');
  
  ITF_SH_JSMXList:=Tlist.create;
  new(p_kv);p_kv.key:='SCDM';p_kv.value:='01';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JLLX';p_kv.value:='001';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JYFS';p_kv.value:='001';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JSFS';p_kv.value:='001';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='YWLX';p_kv.value:='001';ITF_SH_JSMXList.Add(p_kv);

  new(p_kv);p_kv.key:='QSBZ';p_kv.value:='060';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='GHLX';p_kv.value:='00A';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JSBH';p_kv.value:=LeftZeroMatch(iJSBH,16);ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='CJBH';p_kv.value:=RITF_SH_GHData.sCJBH;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='SQBH';p_kv.value:=RITF_SH_GHData.sSQBH;ITF_SH_JSMXList.Add(p_kv);

  //new(p_kv);p_kv.key:='WTBH';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JYRQ';p_kv.value:='20180112';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='QSRQ';p_kv.value:=RITF_SH_JSMXData.sJYRQ;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JSRQ';p_kv.value:='20180113';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='QTRQ';p_kv.value:='0';ITF_SH_JSMXList.Add(p_kv);

  //new(p_kv);p_kv.key:='WTSJ';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);
  //new(p_kv);p_kv.key:='CJSJ';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='XWH1';p_kv.value:=RBaseData.sJYDY;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='XWH2';p_kv.value:=RBaseData.sJYDY;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='XWHY';p_kv.value:='JS509';ITF_SH_JSMXList.Add(p_kv);

  new(p_kv);p_kv.key:='JSHY';p_kv.value:='JS509';ITF_SH_JSMXList.Add(p_kv);
  //new(p_kv);p_kv.key:='TGHY';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='ZQZH';p_kv.value:=RBaseData.sZQZH;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='ZQDM1';p_kv.value:=RBaseData.sZQDM;ITF_SH_JSMXList.Add(p_kv);
  //new(p_kv);p_kv.key:='ZQDM2';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);

  new(p_kv);p_kv.key:='ZQLB';p_kv.value:='PT';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='LTLX';p_kv.value:='0';ITF_SH_JSMXList.Add(p_kv);
  //new(p_kv);p_kv.key:='QYLB';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);
  //new(p_kv);p_kv.key:='GPNF';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='MMBZ';p_kv.value:='B';ITF_SH_JSMXList.Add(p_kv);

  new(p_kv);p_kv.key:='SL';p_kv.value:=RBaseData.sCJSL;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='CJSL';p_kv.value:=RBaseData.sCJSL;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='ZJZH';p_kv.value:=RBaseData.sZJZH;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='BZ';p_kv.value:='RMB';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JG1';p_kv.value:=RBaseData.sCJJG;ITF_SH_JSMXList.Add(p_kv);

  new(p_kv);p_kv.key:='JG2';p_kv.value:=RBaseData.sCJJG;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='QSJE';p_kv.value:='-'+' ';ITF_SH_JSMXList.Add(p_kv);//floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG));
  //new(p_kv);p_kv.key:='YHS';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv); //floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  //new(p_kv);p_kv.key:='JSF';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);   //floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  //new(p_kv);p_kv.key:='GHF';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);   //floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);

  //new(p_kv);p_kv.key:='ZGF';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv); //floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  //new(p_kv);p_kv.key:='SXF';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv); //floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  new(p_kv);p_kv.key:='QTJE1';p_kv.value:='0.00';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='QTJE2';p_kv.value:='0.00';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='QTJE3';p_kv.value:='0.00';ITF_SH_JSMXList.Add(p_kv);

  new(p_kv);p_kv.key:='SJSF';p_kv.value:='QSJE+...SXF';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JGDM';p_kv.value:='0000';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='FJSM';p_kv.value:='Ａ股交易清算';ITF_SH_JSMXList.Add(p_kv);

 // RITF_SH_JSMXData.sTRD_DATE:=RITF_SH_GHData.sTRD_DATE;
 /// RITF_SH_JSMXData.sITF_CFG_SH:='2101';
 // RITF_SH_JSMXData.sREC_SN:='1';

  RITF_SH_JSMXData.sSCDM:='01';
  RITF_SH_JSMXData.sJLLX:='001';
  RITF_SH_JSMXData.sJYFS:='001';
  RITF_SH_JSMXData.sJSFS:='001';
  RITF_SH_JSMXData.sYWLX:='001';

  RITF_SH_JSMXData.sQSBZ:='060';
  RITF_SH_JSMXData.sGHLX:='00A';
  RITF_SH_JSMXData.sJSBH:='0000000000000000';
  RITF_SH_JSMXData.sCJBH:=RITF_SH_GHData.sCJBH;
  RITF_SH_JSMXData.sSQBH:=RITF_SH_GHData.sSQBH;

  RITF_SH_JSMXData.sWTBH:='';
  RITF_SH_JSMXData.sJYRQ:='20180112';
  RITF_SH_JSMXData.sQSRQ:=RITF_SH_JSMXData.sJYRQ;
  RITF_SH_JSMXData.sJSRQ:='next trd date';
  RITF_SH_JSMXData.sQTRQ:='0';

  RITF_SH_JSMXData.sWTSJ:='';
  RITF_SH_JSMXData.sCJSJ:='';
  RITF_SH_JSMXData.sXWH1:=RBaseData.sJYDY;
  RITF_SH_JSMXData.sXWH2:=RBaseData.sJYDY;
  RITF_SH_JSMXData.sXWHY:='JS509';

  RITF_SH_JSMXData.sJSHY:='JS509';
  RITF_SH_JSMXData.sTGHY:='';
  RITF_SH_JSMXData.sZQZH:=RBaseData.sZQZH;
  RITF_SH_JSMXData.sZQDM1:=RBaseData.sZQDM;
  RITF_SH_JSMXData.sSQDM2:='';

  RITF_SH_JSMXData.sZQLB:='PT';
  RITF_SH_JSMXData.sLTLX:='0';
  RITF_SH_JSMXData.sQYLB:='';
  RITF_SH_JSMXData.sGPNF:='';
  RITF_SH_JSMXData.sMMBZ:='B';

  RITF_SH_JSMXData.sSL:=RBaseData.sCJSL;
  RITF_SH_JSMXData.sCJSL:=RBaseData.sCJSL;
  RITF_SH_JSMXData.sZJZH:=RBaseData.sZJZH;
  RITF_SH_JSMXData.sBZ:='RMB';
  RITF_SH_JSMXData.sJG1:=RBaseData.sCJJG;

  RITF_SH_JSMXData.sJG2:=RBaseData.sCJJG;
  RITF_SH_JSMXData.sQSJE:='-'+' ';//floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG));
  RITF_SH_JSMXData.sYHS:=' ';//floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  RITF_SH_JSMXData.sJSF:=' ';//floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  RITF_SH_JSMXData.sGHF:=' ';//floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);

  RITF_SH_JSMXData.sZGF:=' ';//floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  RITF_SH_JSMXData.sSXF:=' ';//floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  RITF_SH_JSMXData.sQTJE1:='0.00';
  RITF_SH_JSMXData.sQTJE2:='0.00';
  RITF_SH_JSMXData.sQTJE3:='0.00';

  RITF_SH_JSMXData.sSJSF:='QSJE+...SXF';
  RITF_SH_JSMXData.sJGDM:='0000';
  RITF_SH_JSMXData.sFJSM:='Ａ股交易清算';
end;

procedure calRITF_SH_ZJHZPtrData(pZJZH:string;pITF_SH_ZJHZSUMMap:TStrDecordMap;pITF_SH_JSMXMap:TStringHashedMap);
var
  ptr:PITF_SH_ZJHZData;
begin
  ptr:=pITF_SH_ZJHZSUMMap[pZJZH];

  {ptr.sSCDM:='01';
  ptr.sJLLX:='001';
  ptr.sJSFS:='001';
  ptr.sQSRQ:=FormatDateTime('yyyymmdd',now());
  ptr.sJSRQ:=FormatDateTime('yyyymmdd',now());

  ptr.sXWH:=pITF_SH_JSMXMap['XWH1'];
  ptr.sQSBH:='JS509';
  ptr.sZJZH:=pITF_SH_JSMXMap['ZQZH'];
  ptr.sYHDM:='000';}
  ptr.sSJMJE:='0';

  ptr.sBJMJE:='0';
  ptr.sQSJE:=FloatToStr(StrTofloat(ptr.sSJMJE)-StrTofloat(ptr.sBJMJE));
  ptr.sYHS:=floattostr(Strtofloat(ptr.sYHS)+Strtofloat(pITF_SH_JSMXMap['YHS']));
  ptr.sJSF:=floattostr(Strtofloat(ptr.sJSF)+Strtofloat(pITF_SH_JSMXMap['JSF']));
  ptr.sGHF:=floattostr(Strtofloat(ptr.sGHF)+Strtofloat(pITF_SH_JSMXMap['GHF']));

  ptr.sZGF:=floattostr(Strtofloat(ptr.sZGF)+Strtofloat(pITF_SH_JSMXMap['ZGF']));
  ptr.sSXF:=floattostr(Strtofloat(ptr.sSXF)+Strtofloat(pITF_SH_JSMXMap['SXF']));
  ptr.sQTFY1:='0.00';
  ptr.sQTFY2:='0.00';
  ptr.sQTFY3:='0.00';

  ptr.sSJSF:=floattostr(Strtofloat(ptr.sSJSF)+Strtofloat(pITF_SH_JSMXMap['SJSF']));
 { ptr.sQSBZ:='060';
  ptr.sYYRQ:='0';
  ptr.sBCSM:='A股'; }

  pITF_SH_ZJHZSUMMap.Add(pZJZH,ptr);
end;

procedure InitRITF_SH_ZJHZPtrData(pZJZH:string;pITF_SH_ZJHZSUMMap:TStrDecordMap;pITF_SH_JSMXMap:TStringHashedMap);
var
  ptr:PITF_SH_ZJHZData;
begin
  new(ptr);
  ptr.sSCDM:='01';
  ptr.sJLLX:='001';
  ptr.sJSFS:='001';
  ptr.sQSRQ:=FormatDateTime('yyyymmdd',now());
  ptr.sJSRQ:=FormatDateTime('yyyymmdd',now());

  ptr.sXWH:=pITF_SH_JSMXMap['XWH1'];
  ptr.sQSBH:='JS509';
  ptr.sZJZH:=pITF_SH_JSMXMap['ZQZH'];
  ptr.sYHDM:='000';
  ptr.sSJMJE:='0';

  ptr.sBJMJE:='0';
  ptr.sQSJE:=FloatToStr(StrTofloat(ptr.sSJMJE)-StrTofloat(ptr.sBJMJE));
  ptr.sYHS:=pITF_SH_JSMXMap['YHS'];
  ptr.sJSF:=pITF_SH_JSMXMap['JSF'];
  ptr.sGHF:=pITF_SH_JSMXMap['GHF'];

  ptr.sZGF:=pITF_SH_JSMXMap['ZGF'];
  ptr.sSXF:=pITF_SH_JSMXMap['SXF'];
  ptr.sQTFY1:='0.00';
  ptr.sQTFY2:='0.00';
  ptr.sQTFY3:='0.00';

  ptr.sSJSF:=pITF_SH_JSMXMap['SJSF'];
  ptr.sQSBZ:='060';
  ptr.sYYRQ:='0';
  ptr.sBCSM:='A股';

  pITF_SH_ZJHZSUMMap.Add(pZJZH,ptr);
end;

procedure InitRITF_SH_ZJHZData(pZJZH:string;pITF_SH_ZJHZSUMMap:TStrDecordMap);
var
  p_kv:^keyvalue;
  ptr:PITF_SH_ZJHZData;
begin
  ptr:=pITF_SH_ZJHZSUMMap[pZJZH];
  ITF_SH_ZJHZMap:=TStringHashedMap.create;
  ITF_SH_ZJHZMap.Add('SCDM',ptr.sSCDM);
  ITF_SH_ZJHZMap.Add('JLLX',ptr.sJLLX);
  ITF_SH_ZJHZMap.Add('JSFS',ptr.sJSFS);
  ITF_SH_ZJHZMap.Add('QSRQ',ptr.sQSRQ);
  ITF_SH_ZJHZMap.Add('JSRQ',ptr.sJSRQ);

  ITF_SH_ZJHZMap.Add('XWH',ptr.sXWH);
  ITF_SH_ZJHZMap.Add('QSBH',ptr.sQSBH);
  ITF_SH_ZJHZMap.Add('ZJZH',ptr.sZJZH);
  ITF_SH_ZJHZMap.Add('YHDM',ptr.sYHDM);
  ITF_SH_ZJHZMap.Add('SJMJE',ptr.sSJMJE);

  ITF_SH_ZJHZMap.Add('BJMJE',ptr.sBJMJE);
  ITF_SH_ZJHZMap.Add('QSJE',ptr.sQSJE);
  ITF_SH_ZJHZMap.Add('YHS',ptr.sYHS);
  ITF_SH_ZJHZMap.Add('JSF',ptr.sJSF);
  ITF_SH_ZJHZMap.Add('GHF',ptr.sGHF);

  ITF_SH_ZJHZMap.Add('ZGF',ptr.sZGF);
  ITF_SH_ZJHZMap.Add('SXF',ptr.sSXF);
  ITF_SH_ZJHZMap.Add('QTFY1',ptr.sQTFY1);
  ITF_SH_ZJHZMap.Add('QTFY2',ptr.sQTFY2);
  ITF_SH_ZJHZMap.Add('QTFY3',ptr.sQTFY3);

  ITF_SH_ZJHZMap.Add('SJSF',ptr.sSJSF);
  ITF_SH_ZJHZMap.Add('QSBZ',ptr.sQSBZ);
  ITF_SH_ZJHZMap.Add('YYRQ',ptr.sYYRQ);
  ITF_SH_ZJHZMap.Add('BCSM',ptr.sBCSM);

  ITF_SH_ZJHZList:=Tlist.create;
  new(p_kv);p_kv.key:='SCDM';p_kv.value:='01';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='JLLX';p_kv.value:='001';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='JSFS';p_kv.value:='001';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='QSRQ';p_kv.value:=RITF_SH_ZJHZData.sTRD_DATE;ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='JSRQ';p_kv.value:='20181115';ITF_SH_ZJHZList.Add(p_kv);

  new(p_kv);p_kv.key:='XWH';p_kv.value:='01';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='QSBH';p_kv.value:='JS509';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='ZJZH';p_kv.value:=RBaseData.sZQZH;ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='YHDM';p_kv.value:='000';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='SJMJE';p_kv.value:='SJSF';ITF_SH_ZJHZList.Add(p_kv);

  new(p_kv);p_kv.key:='BJMJE';p_kv.value:='SJSF';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='QSJE';p_kv.value:='RITF';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='YHS';p_kv.value:='YHS';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='JSF';p_kv.value:='JSF';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='GHF';p_kv.value:='GHF';ITF_SH_ZJHZList.Add(p_kv);

  new(p_kv);p_kv.key:='ZGF';p_kv.value:='ZGF';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='SXF';p_kv.value:='SXF';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='QTFY1';p_kv.value:='0.00';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='QTFY2';p_kv.value:='0.00';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='QTFY3';p_kv.value:='0.00';ITF_SH_ZJHZList.Add(p_kv);

  new(p_kv);p_kv.key:='SJSF';p_kv.value:='SJSF';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='QSBZ';p_kv.value:='060';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='YYRQ';p_kv.value:='0';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='BCSM';p_kv.value:='A股';ITF_SH_ZJHZList.Add(p_kv);


  RITF_SH_ZJHZData.sSCDM:='01';
  RITF_SH_ZJHZData.sJLLX:='001';
  RITF_SH_ZJHZData.sJSFS:='001';
  RITF_SH_ZJHZData.sQSRQ:=RITF_SH_ZJHZData.sTRD_DATE;
  RITF_SH_ZJHZData.sJSRQ:='20180113';

  RITF_SH_ZJHZData.sXWH:=RBaseData.sJYDY;
  RITF_SH_ZJHZData.sQSBH:='JS509';
  RITF_SH_ZJHZData.sZJZH:=RBaseData.sZQZH;
  RITF_SH_ZJHZData.sYHDM:='000';
  RITF_SH_ZJHZData.sSJMJE:='SJSF卖汇总';

  RITF_SH_ZJHZData.sBJMJE:='SJSF买汇总';
  RITF_SH_ZJHZData.sQSJE:='RITF_SH_ZJHZData.sSJMJE-RITF_SH_ZJHZData.sBJMJE';
  RITF_SH_ZJHZData.sYHS:='YHS汇总';
  RITF_SH_ZJHZData.sJSF:='JSF汇总';
  RITF_SH_ZJHZData.sGHF:='GHF汇总';

  RITF_SH_ZJHZData.sZGF:='ZGF汇总';
  RITF_SH_ZJHZData.sSXF:='SXF汇总';
  RITF_SH_ZJHZData.sQTFY1:='0.00';
  RITF_SH_ZJHZData.sQTFY2:='0.00';
  RITF_SH_ZJHZData.sQTFY3:='0.00';

  RITF_SH_ZJHZData.sSJSF:='SJSF汇总';
  RITF_SH_ZJHZData.sQSBZ:='060';
  RITF_SH_ZJHZData.sYYRQ:='0';
  RITF_SH_ZJHZData.sBCSM:='A股交易清算';
end;

procedure InitRITF_SH_ZQYEPtrData(pZQDM:string;pITF_SH_ZQYESUMMap:TStrDecordMap;pITF_SH_JSMXMap:TStringHashedMap);
var
  ptr:PITF_SH_ZQYEData;
begin
  new(ptr);

  ptr.sSCDM:='01';
  ptr.sQSBH:='JS509';
  ptr.sZQZH:=pITF_SH_JSMXMap['ZQZH'];
  ptr.sXWH:=pITF_SH_JSMXMap['XWH1'];
  ptr.sZQDM:=pITF_SH_JSMXMap['ZQDM1'];

  ptr.sZQLB:='PT';
  ptr.sLTLX:='0';
  //ptr.sQYLB:=' ';
  ptr.sGPNF:='0';
  ptr.sYE1:=pITF_SH_JSMXMap['CJSL'];

  ptr.sYE2:='0';
  //ptr.sBY_01:=' ';
  ptr.sJZRQ:=FormatDateTime('yyyymmdd',now());

  pITF_SH_ZQYESUMMap.Add(pZQDM,ptr);
end;

procedure calRITF_SH_ZQYEPtrData(pZQDM:string;pITF_SH_ZQYESUMMap:TStrDecordMap;pITF_SH_JSMXMap:TStringHashedMap);
var
  ptr:PITF_SH_ZQYEData;
begin
  ptr:=pITF_SH_ZQYESUMMap[pZQDM];
  ptr.sYE1:=ptr.sYE1+pITF_SH_JSMXMap['CJSL'];
end;

procedure InitRITF_SH_ZQYEData(pSTK_BIN:string;pZQDM:string;pITF_SH_ZQYESUMMap:TStrDecordMap);
var
 p_kv:^keyvalue;
 ptr:PITF_SH_ZQYEData;
begin
  ptr:=pITF_SH_ZQYESUMMap[pZQDM];
  ITF_SH_ZQYEMap:=TStringHashedMap.create;
  ITF_SH_ZQYEMap.Add('SCDM',ptr.sSCDM);
  ITF_SH_ZQYEMap.Add('QSBH',ptr.sQSBH);
  ITF_SH_ZQYEMap.Add('ZQZH',ptr.sZQZH);
  ITF_SH_ZQYEMap.Add('XWH',ptr.sXWH);
  ITF_SH_ZQYEMap.Add('ZQDM',ptr.sZQDM);

  ITF_SH_ZQYEMap.Add('ZQLB',ptr.sZQLB);
  ITF_SH_ZQYEMap.Add('LTLX',ptr.sLTLX);
  //ITF_SH_ZQYEMap.Add('QYLB',ptr.sQYLB);
  ITF_SH_ZQYEMap.Add('GPNF',ptr.sGPNF);
  ITF_SH_ZQYEMap.Add('YE1',ptr.sYE1);

  ITF_SH_ZQYEMap.Add('YE2',inttostr(Strtoint(ptr.sYE2)+StrtoInt(pSTK_BIN)));
  //ITF_SH_ZQYEMap.Add('BY',ptr.sBY);
  ITF_SH_ZQYEMap.Add('JZRQ',ptr.sJZRQ);

  ITF_SH_ZQYEList:=Tlist.create;

  new(p_kv);p_kv.key:='SCDM';p_kv.value:='01';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='QSBH';p_kv.value:='JS509';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='ZQZH';p_kv.value:=RBaseData.sZQZH;ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='XWH';p_kv.value:=RBaseData.sJYDY;ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='ZQDM';p_kv.value:=RBaseData.sZQDM;ITF_SH_ZQYEList.Add(p_kv);

  new(p_kv);p_kv.key:='ZQLB';p_kv.value:='PT';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='LTLX';p_kv.value:='0';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='QYLB';p_kv.value:=' ';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='GPNF';p_kv.value:='0';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='YE1';p_kv.value:='YE1';ITF_SH_ZQYEList.Add(p_kv);

  new(p_kv);p_kv.key:='YE2';p_kv.value:='0';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='JZRQ';p_kv.value:=FormatDateTime('yyyymmdd',now());ITF_SH_ZQYEList.Add(p_kv);
  //new(p_kv);p_kv.key:='BY';p_kv.value:='';ITF_SH_ZQYEList.Add(p_kv);
  {RITF_SH_ZQYEData.sTRD_DATE:=FormatDateTime('yyyymmdd',now());
  RITF_SH_ZQYEData.sITF_CFG_SN:='2116';
  RITF_SH_ZQYEData.sREC_SN:='1'; }

  RITF_SH_ZQYEData.sSCDM:='01';
  RITF_SH_ZQYEData.sQSBH:='JS509';
  RITF_SH_ZQYEData.sZQZH:=RBaseData.sZQZH;
  RITF_SH_ZQYEData.sXWH:=RBaseData.sJYDY;
  RITF_SH_ZQYEData.sZQDM:=RBaseData.sZQDM;

  RITF_SH_ZQYEData.sZQLB:='PT';
  RITF_SH_ZQYEData.sLTLX:='0';
  RITF_SH_ZQYEData.sQYLB:=' ';
  RITF_SH_ZQYEData.sGPNF:='0';
  RITF_SH_ZQYEData.sYE1:='复杂计算';

  RITF_SH_ZQYEData.sYE2:='0';
  RITF_SH_ZQYEData.sBY_01:=' ';
  RITF_SH_ZQYEData.sJZRQ:=FormatDateTime('yyyymmdd',now());
end;

function getSqlStmt(fileName:string):string;
var
  sqlStmt1:string;
  sqlStmt2:string;
  iCount:Integer;
  iIndex:Integer;
  p_kv:^keyvalue;
  sqlStmt:string;
  HashMap:TStringHashedMap;
begin
  sqlStmt1:='INSERT INTO '+fileName+'(';
  sqlStmt2:='VALUES(';

  if fileName='gh' then
  begin
    HashMap:=ITF_SH_GHMap;
  end
  else if fileName='jsmx' then
  begin
    HashMap:=ITF_SH_JSMXMap;
  end
  else if fileName='zjhz' then
  begin
    HashMap:=ITF_SH_ZJHZMap;
  end
  else if fileName='zqye' then
  begin
    HashMap:=ITF_SH_zqyeMap;
  end;
  iCount:=HashMap.Count;
  for iIndex:=0 to iCount-2  do
  begin
    sqlStmt1:=sqlStmt1+HashMap.FirstValue(iIndex)+',';
    sqlStmt2:=sqlStmt2+''''+HashMap.SecondeValue(iIndex)+''''+',';
  end;
  sqlStmt1:=sqlStmt1+HashMap.FirstValue(iIndex)+')';
  sqlStmt2:=sqlStmt2+''''+HashMap.SecondeValue(iIndex)+''''+')';
  sqlStmt:=sqlStmt1+sqlStmt2;
  result:=sqlStmt;
end;

procedure exectSqlStmt(sqlStmt:string);
begin
  GenData.Edit1.text:=sqlStmt;
  GenData.ADOConnection.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;'
                  +'User ID=Admin;'
                  +'Data Source=F:\gitPro\delphiPro\udlConnectDB;'
                  +'Mode=ReadWrite;Jet OLEDB:System database="";'
                  +'Jet OLEDB:Registry Path="";'
                  +'Jet OLEDB:Database Password="";'
                  +'Jet OLEDB:Engine Type=18;'
                  +'Jet OLEDB:Database Locking Mode=0;'
                  +'Jet OLEDB:Global Partial Bulk Ops=2;'
                  +'Jet OLEDB:Global Bulk Transactions=1;'
                  +'Jet OLEDB:New Database Password="";'
                  +'Jet OLEDB:Create System Database=False;'
                  +'Jet OLEDB:Encrypt Database=False;'
                  +'Jet OLEDB:Don''t Copy Locale on Compact=False;'
                  +'Jet OLEDB:Compact Without Replica Repair=False;'
                  +'Jet OLEDB:SFP=False;';
    GenData.ADOQuery.Close;
    GenData.ADOQuery.SQL.Clear;
    GenData.ADOQuery.SQL.Add(sqlStmt);
    GenData.ADOQuery.ExecSQL;
    GenData.ADOQuery.Close;
end;
procedure genFile(filename:string);
var
  sqlStmt1:string;
  sqlStmt2:string;
  sqlStmt:string;
  iCount:integer;
  iIndex:integer;
begin
  sqlStmt:=getSqlStmt(filename);
  GenData.Edit1.Text:=sqlStmt;
  exectSqlStmt(sqlStmt);
end;
procedure deletefile(filename:string);
var
  sqlStmt1:string;
  sqlStmt2:string;
  sqlStmt:string;
  iCount:integer;
  iIndex:integer;
begin
  sqlStmt:='delete * from '+filename;
  GenData.Edit1.Text:=sqlStmt;
  exectSqlStmt(sqlStmt);
end;
procedure TGenData.ITF_SH_GHClick(Sender: TObject);
var
  sqlStmt1:string;
  sqlStmt2:string;
  sqlStmt:string;
  iCount:integer;
  iIndex:integer;
  p_kv:^keyvalue;
begin
  InitRBaseData;
  InitRITF_SH_GHData;
  sqlStmt:=getSqlStmt('gh');
  GenData.Edit1.Text:=sqlStmt;
  {sqlStmt1:='INSERT INTO gh(';
  sqlStmt2:='VALUES(';
  iCount:=ITF_SH_GHList.Count;
  for iIndex:=0 to iCount-2  do
  begin
    new(p_kv);
    p_kv:=ITF_SH_GHList.Items[iIndex];
    sqlStmt1:=sqlStmt1+p_kv^.key+',';
    if (p_kv^.value='') or (p_kv^.value=' ') then
    begin
      p_kv^.value:='0';
    end;
    sqlStmt2:=sqlStmt2+''''+p_kv^.value+''''+',';
  end;
  new(p_kv);
  p_kv:=ITF_SH_GHList.Items[iIndex];
  sqlStmt1:=sqlStmt1+p_kv^.key+') ';
  if (p_kv^.value='') or (p_kv^.value=' ') then
  begin
    p_kv^.value:='0';
  end;
  sqlStmt2:=sqlStmt2+''''+p_kv^.value+''''+')';
  sqlStmt:=sqlStmt1+sqlStmt2; }

  //sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sTRD_DATE+''''+',';
  //sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sITF_CFG_SN+''''+',';
  // sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sREC_SN+''''+',';
  {sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sGDDM+''''+',';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sGDXM+''''+',';

  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sBCRQ+''''+',';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sCJBH+''''+',';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sGSDM+''''+',';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sCJSL+''''+',';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sBCYE+''''+',';

  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sZQDM+''''+',';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sSBSJ+''''+',';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sCJSJ+''''+',';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sCJJG+''''+',';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sCJJE+''''+',';

  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sSQBH+''''+',';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sBS+''''+',';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sMJBH+''''+')';}
  exectSqlStmt(sqlStmt);
end;

procedure TGenData.ITF_SH_JSMXClick(Sender: TObject);
var
  sqlStmt1:string;
  sqlStmt2:string;
  sqlStmt:string;
  iCount:integer;
  iIndex:integer;
  p_kv:^keyvalue;
begin
  InitRBaseData;
  InitRITF_SH_JSMXData;
  sqlStmt:=getSqlStmt('jsmx');
  GenData.Edit1.Text:=sqlStmt;
  {sqlStmt1:='INSERT INTO jsmx(';
  sqlStmt2:='VALUES(';
  iCount:=ITF_SH_JSMXList.Count;
  for iIndex:=0 to iCount-2  do
  begin
    new(p_kv);
    p_kv:=ITF_SH_JSMXList.Items[iIndex];
    sqlStmt1:=sqlStmt1+p_kv^.key+',';
    if (p_kv^.value='') or (p_kv^.value=' ') then
    begin
      p_kv^.value:='0';
    end;
    sqlStmt2:=sqlStmt2+''''+p_kv^.value+''''+',';
  end;
  new(p_kv);
  p_kv:=ITF_SH_JSMXList.Items[iIndex];
  sqlStmt1:=sqlStmt1+p_kv^.key+') ';
  if (p_kv^.value='') or (p_kv^.value=' ') then
  begin
    p_kv^.value:='0';
  end;
  sqlStmt2:=sqlStmt2+''''+p_kv^.value+''''+')';
  sqlStmt:=sqlStmt1+sqlStmt2;  }
  exectSqlStmt(sqlStmt);
end;

procedure TGenData.ITF_SH_ZJHZClick(Sender: TObject);
var
  sqlStmt1:string;
  sqlStmt2:string;
  sqlStmt:string;
  iCount:integer;
  iIndex:integer;
  p_kv:^keyvalue;
begin
  InitRBaseData;
  //InitRITF_SH_ZJHZData;
  sqlStmt:=getSqlStmt('zjhz');
  GenData.Edit1.Text:=sqlStmt;
  {sqlStmt1:='INSERT INTO zjhz(';
  sqlStmt2:='VALUES(';
  iCount:=ITF_SH_ZJHZList.Count;
  for iIndex:=0 to iCount-2  do
  begin
    new(p_kv);
    p_kv:=ITF_SH_ZJHZList.Items[iIndex];
    sqlStmt1:=sqlStmt1+p_kv^.key+',';
    if (p_kv^.value='') or (p_kv^.value=' ') then
    begin
      p_kv^.value:='0';
    end;
    sqlStmt2:=sqlStmt2+''''+p_kv^.value+''''+',';
  end;
  new(p_kv);
  p_kv:=ITF_SH_ZJHZList.Items[iIndex];
  sqlStmt1:=sqlStmt1+p_kv^.key+') ';
  if (p_kv^.value='') or (p_kv^.value=' ') then
  begin
    p_kv^.value:='0';
  end;
  sqlStmt2:=sqlStmt2+''''+p_kv^.value+''''+')';
  sqlStmt:=sqlStmt1+sqlStmt2; }
  exectSqlStmt(sqlStmt);
end;

procedure TGenData.ITF_SH_ZQYEClick(Sender: TObject);
var
  sqlStmt1:string;
  sqlStmt2:string;
  sqlStmt:string;
  iCount:integer;
  iIndex:integer;
  p_kv:^keyvalue;
begin
  InitRBaseData;
  //InitRITF_SH_ZQYEData;
  sqlStmt:=getSqlStmt('zqye');
  GenData.Edit1.Text:=sqlStmt;
  {sqlStmt1:='INSERT INTO zqye(';
  sqlStmt2:='VALUES(';
  iCount:=ITF_SH_ZQYEList.Count;
  for iIndex:=0 to iCount-2  do
  begin
    new(p_kv);
    p_kv:=ITF_SH_ZQYEList.Items[iIndex];
    sqlStmt1:=sqlStmt1+p_kv^.key+',';
    if (p_kv^.value='') or (p_kv^.value=' ') then
    begin
      p_kv^.value:='0';
    end;
    sqlStmt2:=sqlStmt2+''''+p_kv^.value+''''+',';
  end;
  new(p_kv);
  p_kv:=ITF_SH_ZQYEList.Items[iIndex];
  sqlStmt1:=sqlStmt1+p_kv^.key+') ';
  if (p_kv^.value='') or (p_kv^.value=' ') then
  begin
    p_kv^.value:='0';
  end;
  sqlStmt2:=sqlStmt2+''''+p_kv^.value+''''+')';
  sqlStmt:=sqlStmt1+sqlStmt2;   }
  exectSqlStmt(sqlStmt);
end;

procedure TGenData.AutoGenFileButtonClick(Sender: TObject);
var
  sTableName:string;
  sqlStmt:string;
  rows:Integer;
  iIndex:Integer;
  iZJZHCount:Integer;
  iZQYECount:Integer;
  iSTK_BLN:String;
begin
  ITF_SH_ZJHZSUMMap:=TStrDecordMap.Create;
  ITF_SH_ZQYESUMMap:=TStrDecordMap.Create;
  sTableName:='STK_ORDER';
  Form1.ADOQuery.Close;
  Form1.ADOQuery.SQL.Clear;
  sqlStmt:='SELECT CUST_CODE,STKPBU,TRDACCT,CUACCT_CODE,STK_CODE,MATCHED_QTY,ORDER_PRICE,STK_BIZ '+
           'FROM ' +sTableName;
  Form1.ADOQuery.SQL.Add(sqlStmt);
  Form1.ADOQuery.Open;
  deleteFile('gh');
  deleteFile('jsmx');
  deleteFile('zqye');
  deleteFile('zjhz');
  rows:=Form1.Adoquery.RecordCount;
  for iIndex:=1 to rows do
  begin
    RBaseData.sJYDY:=Form1.Adoquery.FieldValues['STKPBU'];
    RBaseData.sZQDM:=Form1.Adoquery.FieldValues['STK_CODE'];
    RBaseData.sCJSL:=Form1.Adoquery.FieldValues['MATCHED_QTY'];
    RBaseData.sCJJG:=Form1.Adoquery.FieldValues['ORDER_PRICE'];
    RBaseData.sZQZH:=Form1.Adoquery.FieldValues['CUACCT_CODE'];
    RBaseData.sZJZH:=Form1.Adoquery.FieldValues['TRDACCT'];
    RBaseData.sZJZH:=Form1.Adoquery.FieldValues['STK_BIZ'];
    InitRITF_SH_GHData;
    genFile('gh');
    InitRITF_SH_JSMXData;
    genFile('jsmx');
    if ITF_SH_ZJHZSUMMap.isfind(RBaseData.sZJZH) then
    begin
      calRITF_SH_ZJHZPtrData(RBaseData.sZJZH,ITF_SH_ZJHZSUMMap,ITF_SH_JSMXMap);
    end
    else
    begin
      InitRITF_SH_ZJHZPtrData(RBaseData.sZJZH,ITF_SH_ZJHZSUMMap,ITF_SH_JSMXMap);
    end;

    if ITF_SH_ZQYESUMMap.isfind(RBaseData.sZQDM) then
    begin
      calRITF_SH_ZQYEPtrData(RBaseData.sZQDM,ITF_SH_ZQYESUMMap,ITF_SH_JSMXMap);
    end
    else
    begin
      InitRITF_SH_ZQYEPtrData(RBaseData.sZQDM,ITF_SH_ZQYESUMMap,ITF_SH_JSMXMap);
    end;
    Form1.Adoquery.Next;
  end;
  iZJZHCount:=ITF_SH_ZJHZSUMMap.Count;
  for iIndex:=1 to iZJZHCount do
  begin
    InitRITF_SH_ZJHZData(ITF_SH_ZJHZSUMMap.FirstValue(iIndex-1),ITF_SH_ZJHZSUMMap);
    genFile('zjhz');
  end;

  iZQYECount:=ITF_SH_ZQYESUMMap.Count;
  for iIndex:=1 to iZQYECount do
  begin
    sTableName:='STK_ASSET';
    Form1.ADOQuery.Close;
    Form1.ADOQuery.SQL.Clear;
    sqlStmt:='SELECT STK_BLN '+
           'FROM ' +sTableName+' where STK_CODE='+ITF_SH_ZJHZSUMMap.FirstValue(iIndex-1);
    Form1.ADOQuery.SQL.Add(sqlStmt);
    Form1.ADOQuery.Open;

    if Form1.ADOQuery.RecordCount=0 then
    begin
      iSTK_BLN:='0';
    end
    else
    begin
      iSTK_BLN:=Form1.Adoquery.FieldValues['STK_BIN'];
    end;
    InitRITF_SH_ZQYEData(iSTK_BLN,ITF_SH_ZQYESUMMap.FirstValue(iIndex-1),ITF_SH_ZQYESUMMap);
    genFile('zqye');
  end;
end;
function LeftZeroMatch(iNum:Integer;iCount:Integer):string;
var
  sNumString:string;
  iStrLen:Integer;
  iIndex:Integer;
begin
  sNumString:=ReverseString(inttostr(iNum));
  iStrlen:=Length(sNumString);
  for iIndex:=1 to iCount-iStrlen do
  begin
    sNumString:=sNumString+'0';
  end;
  LeftZeroMatch:=ReverseString(sNumString);
end;
type
  IntegerArr=record
    i:string;
    j:string;
end;
procedure TGenData.FormCreate(Sender: TObject);
var
  TSH:TStringHashedMap;
  TSH2:TStringHashedMap;
  TSH3:TStringHashedMap;
  TSD:TStrDecordMap;
  TSD1:TStrDecordMap;
  p_IntegerArr:^IntegerArr;
begin
  iCJBH:=1;
  iSQBH:=1;
  iJSBH:=1;
  fLL:=1.0;
  //ShowMessage(LeftZeroMatch(123,7));
  TSH:=TStringHashedMap.Create;
  TSH3:=TStringHashedMap.Create;
  TSH.Add('k1','a');
  TSH.Add('k2','ab');
  TSH3.Add('ss','ssss');
  TSH2:=TSH;
  TSD:=TStrDecordMap.Create;
  new(p_IntegerArr);
  p_IntegerArr.i:='11';
  p_IntegerArr.j:='22';
  TSD.Add('aa',p_IntegerArr);
  new(p_IntegerArr);
  p_IntegerArr.i:='12';
  p_IntegerArr.j:='23';
  TSD.Add('aab',p_IntegerArr);
  //p_IntegerArr:=TSD.SecondeValue(1);

 // addmap(TSD1);
  TSD1:=TStrDecordMap.Create;
  TSD1.Add('2212',p_IntegerArr);
  addmap(TSD1);
  //showmessage(inttostr(TSD1.Count));
   Dispose(p_IntegerArr);
end;
procedure addmap(pTStrDecordMap:TStrDecordMap);
var
p_IntegerArr:^IntegerArr;
begin
  new(p_IntegerArr);
  p_IntegerArr.i:='1';
  p_IntegerArr.j:='2';
  pTStrDecordMap.Add('234',p_IntegerArr);
end;
procedure TGenData.ShowOPTButtonClick(Sender: TObject);
begin
  GenOptDataForm.Show;
 // GenData.Close;
end;

end.
