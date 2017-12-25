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
    procedure ITF_SH_JSMXClick(Sender: TObject);
    procedure ITF_SH_ZJHZClick(Sender: TObject);
    procedure ITF_SH_ZQYEClick(Sender: TObject);
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
    sTRD_DATE:string;
    sITF_CFG_SN:string;
    sREC_SN:string;
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
    sTRD_DATE:string;
    sITF_CFG_SH:string;
    sREC_SN:string;
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
begin
  RITF_SH_GHData.sTRD_DATE:=FormatDateTime('yyyymmdd',now());
  RITF_SH_GHData.sITF_CFG_SN:='2012';
  RITF_SH_GHData.sREC_SN:='1';
  RITF_SH_GHData.sGDDM:=RBaseData.sZQZH;
  RITF_SH_GHData.sGDXM:=' ';
  RITF_SH_GHData.sBCRQ:=RITF_SH_GHData.sTRD_DATE;
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
  RITF_SH_GHData.sMJBH:=' ';
end;
procedure InitRITF_SH_JSMXData;
begin
  RITF_SH_JSMXData.sTRD_DATE:=RITF_SH_GHData.sTRD_DATE;
  RITF_SH_JSMXData.sITF_CFG_SH:='2101';
  RITF_SH_JSMXData.sREC_SN:='1';
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
  RITF_SH_JSMXData.sJYRQ:=RITF_SH_JSMXData.sTRD_DATE;
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
procedure InitRITF_SH_ZJHZData;
begin
  RITF_SH_ZJHZData.sTRD_DATE:=FormatDateTime('yyyymmdd',now());
  RITF_SH_ZJHZData.sITF_CFG_SN:='2121';
  RITF_SH_ZJHZData.sREC_SN:='1';
  RITF_SH_ZJHZData.sSCDM:='01';
  RITF_SH_ZJHZData.sJLLX:='001';

  RITF_SH_ZJHZData.sJSFS:='001';
  RITF_SH_ZJHZData.sQSRQ:=RITF_SH_ZJHZData.sTRD_DATE;
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
procedure InitRITF_SH_ZQYEData;
begin
  RITF_SH_ZQYEData.sTRD_DATE:=FormatDateTime('yyyymmdd',now());
  RITF_SH_ZQYEData.sITF_CFG_SN:='2116';
  RITF_SH_ZQYEData.sREC_SN:='1';
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

procedure exectSqlStmt(sqlStmt:string);
begin
  Form1.ADOQuery.SQL.Clear;
 // Form1.ADOQuery.SQL.Add(sqlStmt);
 // Form1.ADOQuery.ExecSQL;
 // Form1.ADOQuery.Close;
end;

procedure TGenData.ITF_SH_GHClick(Sender: TObject);
var
  sqlStmt:string;
begin
  InitRITF_SH_GHData;
  sqlStmt:='INSERT INTO ITF_SH_GH VALUES(';

  sqlStmt:=sqlStmt+' '''+ RITF_SH_GHData.sTRD_DATE+''' ';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sITF_CFG_SN+'''';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sREC_SN+'''';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sGDDM+'''';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sGDXM+'''';

  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sBCRQ+'''';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sCJBH+'''';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sGSDM+'''';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sCJSL+'''';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sBCYE+'''';

  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sZQDM+'''';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sSBSJ+'''';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sCJSJ+'''';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sCJJG+'''';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sCJJE+'''';

  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sSQBH+'''';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sBS+'''';
  sqlStmt:=sqlStmt+''''+ RITF_SH_GHData.sMJBH+'''';
  sqlStmt:=')';
  exectSqlStmt(sqlStmt);
end;

procedure TGenData.ITF_SH_JSMXClick(Sender: TObject);
var
  sqlStmt:string;
begin
   InitRITF_SH_JSMXData;
   sqlStmt:='INSERT INTO ITF_SH_JSMX VALUES(';
   sqlStmt:=''''+RITF_SH_JSMXData.sTRD_DATE+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sITF_CFG_SH+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sREC_SN+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sSCDM+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sJLLX+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sJYFS+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sJSFS+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sYWLX+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sQSBZ+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sBDLX+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sQSLSH+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sCJBH+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sSQBH+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sWTBH+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sJYRQ+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sQSRQ+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sJSRQ+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sQTRQ+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sWTSJ+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sCJSJ+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sXWH1+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sXWH2+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sXWHY+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sJSHY+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sTGHY+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sZQZH+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sZQDM1+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sSQDM2+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sZQLB+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sLTLX+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sQYLB+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sGPNF+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sMMBZ+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sSL+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sCJSL+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sZJZH+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sBZ+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sJG1+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sJG2+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sQSJE+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sYHS+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sJSF+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sGHF+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sZGF+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sSXF+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sQTJE1+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sQTJE2+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sQTJE3+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sSJSF+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sJGDM+'''';
   sqlStmt:=''''+RITF_SH_JSMXData.sFJSM+'''';
   sqlStmt:=')';
   exectSqlStmt(sqlStmt);
end;

procedure TGenData.ITF_SH_ZJHZClick(Sender: TObject);
var
  sqlStmt:string;
begin
  InitRITF_SH_ZJHZData;

  sqlStmt:='INSERT INTO ITF_SH_ZJHZ VALUES(';

  sqlStmt:=''''+RITF_SH_ZJHZData.sTRD_DATE+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sITF_CFG_SN+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sREC_SN+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sSCDM+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sJLLX+'''';

  sqlStmt:=''''+RITF_SH_ZJHZData.sJSFS+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sQSRQ+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sJSRQ+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sXWH+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sQSBH+'''';

  sqlStmt:=''''+RITF_SH_ZJHZData.sZJZH+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sYHDM+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sSJMJE+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sBJMJE+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sQSJE+'''';

  sqlStmt:=''''+RITF_SH_ZJHZData.sYHS+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sJSF+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sGHF+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sZGF+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sSXF+'''';

  sqlStmt:=''''+RITF_SH_ZJHZData.sQTFY1+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sQTFY2+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sQTFY3+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sSJSF+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sQSBZ+'''';

  sqlStmt:=''''+RITF_SH_ZJHZData.sYYRQ+'''';
  sqlStmt:=''''+RITF_SH_ZJHZData.sBCSM+'''';

  sqlStmt:=sqlStmt+')';
  exectSqlStmt(sqlStmt);
end;

procedure TGenData.ITF_SH_ZQYEClick(Sender: TObject);
var
  sqlStmt:String;
begin
  InitRITF_SH_ZQYEData;

  sqlStmt:='INSERT INTO ITF_SH_ZQYE VALUES(';

  sqlStmt:=''''+RITF_SH_ZQYEData.sTRD_DATE+'''';
  sqlStmt:=''''+RITF_SH_ZQYEData.sITF_CFG_SN+'''';
  sqlStmt:=''''+RITF_SH_ZQYEData.sREC_SN+'''';
  sqlStmt:=''''+RITF_SH_ZQYEData.sSCDM+'''';
  sqlStmt:=''''+RITF_SH_ZQYEData.sQSBH+'''';

  sqlStmt:=''''+RITF_SH_ZQYEData.sZQZH+'''';
  sqlStmt:=''''+RITF_SH_ZQYEData.sXWH+'''';
  sqlStmt:=''''+RITF_SH_ZQYEData.sZQDM+'''';
  sqlStmt:=''''+RITF_SH_ZQYEData.sZQLB+'''';
  sqlStmt:=''''+RITF_SH_ZQYEData.sLTLX+'''';

  sqlStmt:=''''+RITF_SH_ZQYEData.sQYLB+'''';
  sqlStmt:=''''+RITF_SH_ZQYEData.sGPNF+'''';
  sqlStmt:=''''+RITF_SH_ZQYEData.sYE1+'''';
  sqlStmt:=''''+RITF_SH_ZQYEData.sYE2+'''';
  sqlStmt:=''''+RITF_SH_ZQYEData.sBY_01+'''';

  sqlStmt:=''''+RITF_SH_ZQYEData.sJZRQ+'''';

  sqlStmt:=sqlStmt+')';
  exectSqlStmt(sqlStmt);
end;

end.
