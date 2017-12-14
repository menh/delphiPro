unit GenDataMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

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
    procedure ITF_SH_GHClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
    iTRD_DATE:integer;
    iITF_CFG_SN:integer;
    iREC_SN:integer;
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
    iTRD_DATE:integer;
    iITF_CFG_SH:integer;
    iREC_SN:integer;
    sSCDM:string;
    sJLLX:string;
    sJYFS:string;
    sJSFS:string;
    sYWLX:string;
    sQSBZ:string;
    sBDLX:string;
    sQSLSH:string;
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
    iTRD_DATE:integer;
    iITF_CFG_SN:integer;
    iREC_SN:integer;
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
    iTRD_DATE:integer;
    iITF_CFG_SN:integer;
    iREC_SN:integer;
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
procedure InitRITF_SH_JSMX;
procedure InitRITF_SH_ZJHZ;
procedure InitRITF_SH_ZQYE;
var
  GenData: TGenData;
  RBaseData:BaseData;
  RITF_SH_GHData:ITF_SH_GHData;
  RITF_SH_JSMXData:ITF_SH_JSMXData;
  RITF_SH_ZJHZData:ITF_SH_ZJHZData;
  RITF_SH_ZQYEData:ITF_SH_ZQYEData;


implementation

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
begin
  RITF_SH_GHData.iTRD_DATE:=strtoint(FormatDateTime('yyyymmdd',now()));
  RITF_SH_GHData.iITF_CFG_SN:=2012;
  RITF_SH_GHData.iREC_SN:=1;
  RITF_SH_GHData.sGDDM:=RBaseData.sZQZH;
  RITF_SH_GHData.sGDXM:='';
  RITF_SH_GHData.sBCRQ:=inttostr(RITF_SH_GHData.iTRD_DATE);
  RITF_SH_GHData.sCJBH:='0000000';
  RITF_SH_GHData.sGSDM:=RBaseData.sJYDY;
  RITF_SH_GHData.sCJSL:=RBaseData.sCJSL;
  RITF_SH_GHData.sBCYE:='0';
  RITF_SH_GHData.sZQDM:=RBaseData.sZQDM;
  RITF_SH_GHData.sSBSJ:='102810';
  RITF_SH_GHData.sCJSJ:='112810';
  RITF_SH_GHData.sCJJG:=RBaseData.sCJJG;
  RITF_SH_GHData.sCJJE:=floattostr(strtofloat(RITF_SH_GHData.sCJSL)*strtofloat(RITF_SH_GHData.sCJJG));
  RITF_SH_GHData.sSQBH:='LSH'+'111111';
  RITF_SH_GHData.sBS  :='B';
  RITF_SH_GHData.sMJBH:='';
end;
procedure InitRITF_SH_JSMX;
begin
  RITF_SH_JSMXData.iTRD_DATE:=RITF_SH_GHData.iTRD_DATE;
  RITF_SH_JSMXData.iITF_CFG_SH:=2101;
  RITF_SH_JSMXData.iREC_SN:=1;
  RITF_SH_JSMXData.sSCDM:='01';
  RITF_SH_JSMXData.sJLLX:='001';
  RITF_SH_JSMXData.sJYFS:='001';
  RITF_SH_JSMXData.sJSFS:='001';
  RITF_SH_JSMXData.sYWLX:='001';
  RITF_SH_JSMXData.sQSBZ:='060';
  RITF_SH_JSMXData.sBDLX:='00A';
  RITF_SH_JSMXData.sQSLSH:='0000000000000000';
  RITF_SH_JSMXData.sCJBH:=RITF_SH_GHData.sCJBH;
  RITF_SH_JSMXData.sSQBH:=RITF_SH_GHData.sSQBH;
  RITF_SH_JSMXData.sWTBH:='';
  RITF_SH_JSMXData.sJYRQ:=inttostr(RITF_SH_JSMXData.iTRD_DATE);
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
  RITF_SH_JSMXData.sQSJE:='-'+floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG));
  RITF_SH_JSMXData.sYHS:=floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  RITF_SH_JSMXData.sJSF:=floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  RITF_SH_JSMXData.sGHF:=floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  RITF_SH_JSMXData.sZGF:=floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  RITF_SH_JSMXData.sSXF:=floattostr(strtofloat(RBaseData.sCJSL)*strtofloat(RBaseData.sCJJG)/1000*0);
  RITF_SH_JSMXData.sQTJE1:='0.00';
  RITF_SH_JSMXData.sQTJE2:='0.00';
  RITF_SH_JSMXData.sQTJE3:='0.00';
  RITF_SH_JSMXData.sSJSF:='QSJE+...SXF';
  RITF_SH_JSMXData.sJGDM:='0000';
  RITF_SH_JSMXData.sFJSM:='Ａ股交易清算';
end;
procedure TGenData.ITF_SH_GHClick(Sender: TObject);
begin
  InitRITF_SH_GHData;
end;
procedure InitRITF_SH_ZJHZ;
begin
  RITF_SH_ZJHZData.iTRD_DATE:=strtoint(FormatDateTime('yyyymmdd',now()));
  RITF_SH_ZJHZData.iITF_CFG_SN:=2121;
  RITF_SH_ZJHZData.iREC_SN:=1;
  RITF_SH_ZJHZData.sSCDM:='01';
  RITF_SH_ZJHZData.sJLLX:='001';
  RITF_SH_ZJHZData.sJSFS:='001';
  RITF_SH_ZJHZData.sQSRQ:=inttostr(RITF_SH_ZJHZData.iTRD_DATE);
  RITF_SH_ZJHZData.sJSRQ:='next trd date';
  RITF_SH_ZJHZData.sXWH:=RBaseData.sJYDY;
  RITF_SH_ZJHZData.sQSBH:='JS509';
  RITF_SH_ZJHZData.sZJZH:=RBaseData.sZQZH;;
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
procedure InitRITF_SH_ZQYE;
begin
  RITF_SH_ZQYEData.iTRD_DATE:=strtoint(FormatDateTime('yyyymmdd',now()));
  RITF_SH_ZQYEData.iITF_CFG_SN:=2116;
  RITF_SH_ZQYEData.iREC_SN:=1;
  RITF_SH_ZQYEData.sSCDM:='01';
  RITF_SH_ZQYEData.sQSBH:='JS509';
  RITF_SH_ZQYEData.sZQZH:=RBaseData.sZQZH;;
  RITF_SH_ZQYEData.sXWH:=RBaseData.sJYDY;
  RITF_SH_ZQYEData.sZQDM:=RBaseData.sZQDM;
  RITF_SH_ZQYEData.sZQLB:='PT';
  RITF_SH_ZQYEData.sLTLX:='0';
  RITF_SH_ZQYEData.sQYLB:='';
  RITF_SH_ZQYEData.sGPNF:='0';
  RITF_SH_ZQYEData.sYE1:='复杂计算';
  RITF_SH_ZQYEData.sYE2:='0';
  RITF_SH_ZQYEData.sBY_01:='';
  RITF_SH_ZQYEData.sJZRQ:=FormatDateTime('yyyymmdd',now());
end;
end.
