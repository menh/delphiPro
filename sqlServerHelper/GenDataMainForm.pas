unit GenDataMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, Grids, DBGrids, ADODB,
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
    connectButton: TButton;

    procedure ITF_SH_GHClick(Sender: TObject);
    procedure ITF_SH_JSMXClick(Sender: TObject);
    procedure ITF_SH_ZJHZClick(Sender: TObject);
    procedure ITF_SH_ZQYEClick(Sender: TObject);
    procedure connectButtonClick(Sender: TObject);
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
procedure InitRBaseData;
procedure InitRITF_SH_GHData;
procedure InitRITF_SH_JSMXData;
procedure InitRITF_SH_ZJHZData;
procedure InitRITF_SH_ZQYEData;
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
implementation

uses Unit1;

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
  InitRBaseData;
  ITF_SH_GHList:=Tlist.create;
  new(p_kv);p_kv.key:='GDDM';p_kv.value:=RBaseData.sZQZH;ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='GDXM';p_kv.value:=' ';ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='BCRQ';p_kv.value:=FormatDateTime('yyyymmdd',now());ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='CJBH';p_kv.value:='0000000';ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='GSDM';p_kv.value:=RBaseData.sJYDY;ITF_SH_GHList.Add(p_kv);

  new(p_kv);p_kv.key:='CJSL';p_kv.value:=RBaseData.sCJSL;ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='BCYE';p_kv.value:='0';ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='ZQDM';p_kv.value:=RBaseData.sZQDM;;ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='SBSJ';p_kv.value:='102810';ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='CJSJ';p_kv.value:='112810';ITF_SH_GHList.Add(p_kv);

  new(p_kv);p_kv.key:='CJJG';p_kv.value:=RBaseData.sCJJG;ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='CJJE';p_kv.value:='';;ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='SQBH';p_kv.value:='LSH'+'111111';ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='BS';p_kv.value:='B';ITF_SH_GHList.Add(p_kv);
  new(p_kv);p_kv.key:='MJBH';p_kv.value:=' ';ITF_SH_GHList.Add(p_kv);

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
  InitRBaseData;
  ITF_SH_JSMXList:=Tlist.create;
  new(p_kv);p_kv.key:='SCDM';p_kv.value:='01';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JLLX';p_kv.value:='001';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JYFS';p_kv.value:='001';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JSFS';p_kv.value:='001';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='YWLX';p_kv.value:='001';ITF_SH_JSMXList.Add(p_kv);

  new(p_kv);p_kv.key:='QSBZ';p_kv.value:='060';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='GHLX';p_kv.value:='00A';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JSBH';p_kv.value:='0000000000000000';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='CJBH';p_kv.value:=RITF_SH_GHData.sCJBH;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='SQBH';p_kv.value:=RITF_SH_GHData.sSQBH;ITF_SH_JSMXList.Add(p_kv);

  new(p_kv);p_kv.key:='WTBH';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JYRQ';p_kv.value:='20180112';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='QSRQ';p_kv.value:=RITF_SH_JSMXData.sJYRQ;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JSRQ';p_kv.value:='20180113';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='QTRQ';p_kv.value:='0';ITF_SH_JSMXList.Add(p_kv);

  new(p_kv);p_kv.key:='WTSJ';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='CJSJ';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='XWH1';p_kv.value:=RBaseData.sJYDY;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='XWH2';p_kv.value:=RBaseData.sJYDY;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='XWHY';p_kv.value:='JS509';ITF_SH_JSMXList.Add(p_kv);

  new(p_kv);p_kv.key:='JSHY';p_kv.value:='JS509';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='TGHY';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='ZQZH';p_kv.value:=RBaseData.sZQZH;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='ZQDM1';p_kv.value:=RBaseData.sZQDM;;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='ZQDM2';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);

  new(p_kv);p_kv.key:='ZQLB';p_kv.value:='PT';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='LTLX';p_kv.value:='0';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='QYLB';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='GPNF';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='MMBZ';p_kv.value:='B';ITF_SH_JSMXList.Add(p_kv);

  new(p_kv);p_kv.key:='SL';p_kv.value:=RBaseData.sCJSL;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='CJSL';p_kv.value:=RBaseData.sCJSL;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='ZJZH';p_kv.value:=RBaseData.sZJZH;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='BZ';p_kv.value:='RMB';ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='JG1';p_kv.value:=RBaseData.sCJJG;ITF_SH_JSMXList.Add(p_kv);

  new(p_kv);p_kv.key:='JG2';p_kv.value:=RBaseData.sCJJG;ITF_SH_JSMXList.Add(p_kv);
  new(p_kv);p_kv.key:='QSJE';p_kv.value:='-'+' ';ITF_SH_JSMXList.Add(p_kv);//floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG));
  new(p_kv);p_kv.key:='YHS';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv); //floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  new(p_kv);p_kv.key:='JSF';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);   //floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  new(p_kv);p_kv.key:='GHF';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv);   //floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);

  new(p_kv);p_kv.key:='ZGF';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv); //floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  new(p_kv);p_kv.key:='SXF';p_kv.value:=' ';ITF_SH_JSMXList.Add(p_kv); //floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
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
procedure InitRITF_SH_ZJHZData;
var
 p_kv:^keyvalue;
begin
  new(p_kv);p_kv.key:='SCDM';p_kv.value:='01';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='JLLX';p_kv.value:='001';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='JSFS';p_kv.value:='001';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='QSRQ';p_kv.value:=RITF_SH_ZJHZData.sTRD_DATE;ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='JSRQ';p_kv.value:='next trd date';ITF_SH_ZJHZList.Add(p_kv);

  new(p_kv);p_kv.key:='XWH';p_kv.value:='01';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='QSBH';p_kv.value:='JS509';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='ZJZH';p_kv.value:=RBaseData.sZQZH;;ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='YHDM';p_kv.value:='000';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='SJMJE';p_kv.value:='SJSF卖汇总';ITF_SH_ZJHZList.Add(p_kv);

  new(p_kv);p_kv.key:='BJMJE';p_kv.value:='SJSF买汇总';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='QSJE';p_kv.value:='RITF_SH_ZJHZData.sSJMJE-RITF_SH_ZJHZData.sBJMJE';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='YHS';p_kv.value:='YHS汇总';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='JSF';p_kv.value:='JSF汇总';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='GHF';p_kv.value:='GHF汇总';ITF_SH_ZJHZList.Add(p_kv);

  new(p_kv);p_kv.key:='ZGF';p_kv.value:='ZGF汇总';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='SXF';p_kv.value:='SXF汇总';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='QTFY1';p_kv.value:='0.00';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='QTFY2';p_kv.value:='0.00';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='QTFY3';p_kv.value:='0.00';ITF_SH_ZJHZList.Add(p_kv);

  new(p_kv);p_kv.key:='SJSF';p_kv.value:='SJSF汇总';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='QSBZ';p_kv.value:='060';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='YYRQ';p_kv.value:='0';ITF_SH_ZJHZList.Add(p_kv);
  new(p_kv);p_kv.key:='BCSM';p_kv.value:='A股交易清算';ITF_SH_ZJHZList.Add(p_kv);


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
procedure InitRITF_SH_ZQYEData;
var
 p_kv:^keyvalue;
begin

  new(p_kv);p_kv.key:='SCDM';p_kv.value:='01';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='QSBH';p_kv.value:='JS509';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='ZQZH';p_kv.value:=RBaseData.sZQZH;ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='XWH';p_kv.value:=RBaseData.sJYDY;ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='ZQDM';p_kv.value:=RBaseData.sZQDM;ITF_SH_ZQYEList.Add(p_kv);

  new(p_kv);p_kv.key:='ZQLB';p_kv.value:='PT';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='LTLX';p_kv.value:='0';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='QYLB';p_kv.value:=' ';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='GPNF';p_kv.value:='0';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='YE1';p_kv.value:='复杂计算';ITF_SH_ZQYEList.Add(p_kv);

  new(p_kv);p_kv.key:='YE2';p_kv.value:='0';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='BY_01';p_kv.value:=' ';ITF_SH_ZQYEList.Add(p_kv);
  new(p_kv);p_kv.key:='JZRQ';p_kv.value:=FormatDateTime('yyyymmdd',now());ITF_SH_ZQYEList.Add(p_kv);

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

procedure getSql(fileName:string);
var
  sqlStmt1:string;
  sqlStmt2:string;
  iCount:Integer;
  iIndex:Integer;
  p_kv:^keyvalue;
  sqlStmt:string;
begin
  sqlStmt1:='INSERT INTO '+fileName+'(';
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
  sqlStmt:=sqlStmt1+sqlStmt2;
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

procedure TGenData.ITF_SH_GHClick(Sender: TObject);
var
  sqlStmt1:string;
  sqlStmt2:string;
  sqlStmt:string;
  iCount:integer;
  iIndex:integer;
  p_kv:^keyvalue;
begin
  InitRITF_SH_GHData;
  sqlStmt1:='INSERT INTO gh(';
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
  sqlStmt:=sqlStmt1+sqlStmt2;

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
  InitRITF_SH_JSMXData;
  sqlStmt1:='INSERT INTO jsmx(';
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
  sqlStmt:=sqlStmt1+sqlStmt2;
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
  InitRITF_SH_ZJHZData;
  sqlStmt1:='INSERT INTO jsmx(';
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
  sqlStmt:=sqlStmt1+sqlStmt2;
  exectSqlStmt(sqlStmt);
end;

procedure TGenData.ITF_SH_ZQYEClick(Sender: TObject);
var
  sqlStmt:String;
begin
  InitRITF_SH_ZQYEData;

  sqlStmt:='INSERT INTO ITF_SH_ZQYE VALUES(';

  sqlStmt:=''''+RITF_SH_ZQYEData.sTRD_DATE+''''+',';
  sqlStmt:=''''+RITF_SH_ZQYEData.sITF_CFG_SN+''''+',';
  sqlStmt:=''''+RITF_SH_ZQYEData.sREC_SN+''''+',';
  sqlStmt:=''''+RITF_SH_ZQYEData.sSCDM+''''+',';
  sqlStmt:=''''+RITF_SH_ZQYEData.sQSBH+''''+',';

  sqlStmt:=''''+RITF_SH_ZQYEData.sZQZH+''''+',';
  sqlStmt:=''''+RITF_SH_ZQYEData.sXWH+''''+',';
  sqlStmt:=''''+RITF_SH_ZQYEData.sZQDM+''''+',';
  sqlStmt:=''''+RITF_SH_ZQYEData.sZQLB+''''+',';
  sqlStmt:=''''+RITF_SH_ZQYEData.sLTLX+''''+',';

  sqlStmt:=''''+RITF_SH_ZQYEData.sQYLB+''''+',';
  sqlStmt:=''''+RITF_SH_ZQYEData.sGPNF+''''+',';
  sqlStmt:=''''+RITF_SH_ZQYEData.sYE1+''''+',';
  sqlStmt:=''''+RITF_SH_ZQYEData.sYE2+''''+',';
  sqlStmt:=''''+RITF_SH_ZQYEData.sBY_01+''''+',';

  sqlStmt:=''''+RITF_SH_ZQYEData.sJZRQ+''''+')';

  exectSqlStmt(sqlStmt);
end;

procedure TGenData.connectButtonClick(Sender: TObject);
var
  sqlStmt:string;
  p_kv:^keyvalue;
begin
edit1.Text:=inttostr(ITF_SH_GHList.Count);
 ADOConnection.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;'
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
                  +'Jet OLEDB:SFP=False;' ;
    sqlStmt:='select GDDM from gh';
  //  ADOQuery.Close;
  //  ADOQuery.SQL.Clear;
   // ADOQuery.SQL.Add(sqlStmt);
   // ADOQuery.Open;
   // Edit1.Text:=ADOQuery.Fields[0].AsString;
   // ADOQuery.Close;
end;

end.
