unit GenOptData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,UnitStrDecordMap,UnitHashMap, DB, ADODB, StrUtils,ExtCtrls,math;

type
  TGenOptDataForm = class(TForm)
    GenDataButton: TButton;
    ADOConnection: TADOConnection;
    ADOQuery: TADOQuery;
    ConnectButton: TButton;
    User: TLabeledEdit;
    Password: TLabeledEdit;
    DBAddr: TLabeledEdit;
    DBName: TLabeledEdit;
    ADOConnectionDBF: TADOConnection;
    ADOQueryDBF: TADOQuery;
    Edit1: TEdit;
    procedure ConnectButtonClick(Sender: TObject);
    procedure GenDataButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  ROPT_ORDER=Record
    TRD_DATE:String;
    ORDER_DATE:String;
    ORDER_TIME:String;
    ORDER_SN:String;
    ORDER_BSN:String;
    ORDER_ID:String;
    ORDER_TYPE:String;
    ORDER_STATUS:String;
    ORDER_VALID_FLAG:String;
    ORDER_VALID_DATE:String;
    INT_ORG:String;
    CUST_CODE:String;
    CUST_NAME:String;
    CUST_TYPE:String;
    CUST_CLS:String;
    CUACCT_CODE:String;
    CUACCT_ATTR:String;
    CUACCT_CLS:String;
    CUACCT_LVL:String;
    CUACCT_GRP:String;
    CUACCT_DMF:String;
    STKEX:String;
    STKBD:String;
    STKPBU:String;
    TRDACCT:String;
    SUBACCT_CODE:String;
    OPT_TRDACCT_LVL:String;
    TRDACCT_EXID:String;
    TRDACCT_TYPE:String;
    TRDACCT_EXCLS:String;
    STK_BIZ:String;
    STK_BIZ_ACTION:String;
    STK_BIZ_EX:String;
    OWNER_TYPE:String;
    OPT_NUM:String;
    OPT_CODE:String;
    OPT_NAME:String;
    OPT_TYPE:String;
    OPT_EXE_TYPE:String;
    STK_FLAG:String;
    COMB_NUM:String;
    COMB_STRA_CODE:String;
    LEG1_NUM:String;
    LEG2_NUM:String;
    LEG3_NUM:String;
    LEG4_NUM:String;
    CURRENCY:String;
    ORDER_PRICE:String;
    ORDER_QTY:String;
    ORDER_AMT:String;
    ORDER_FRZ_AMT:String;
    ORDER_UFZ_AMT:String;
    OFFER_QTY:String;
    OFFER_STIME:String;
    WITHDRAWN_QTY:String;
    MATCHED_QTY:String;
    MATCHED_AMT:String;
    RLT_SETT_AMT:String;
    IS_WITHDRAW:String;
    IS_WITHDRAWN:String;
    OPT_UNDL_CLS:String;
    OPT_UNDL_CODE:String;
    OPT_UNDL_NAME:String;
    UNDL_FRZ_QTY:String;
    UNDL_UFZ_QTY:String;
    UNDL_WTH_QTY:String;
    OP_USER:String;
    OP_ROLE:String;
    OP_NAME:String;
    OP_ORG:String;
    OP_SITE:String;
    CHANNEL:String;
    RAW_ORDER_ID:String;
    OFFER_REC_SN:String;
    OFFER_RET_MSG:String;
    STKEX_ORG_ID:String;
    ORDER_REMARK:String;
  end;
type
  RBasicData=Record
    JSFL:String;
    QSFL:String;
    GHFL:String;
    JSSXFL:String;
    CJBH:String;
  end;
type
  PStringHashedMap=^TStringHashedMap;
var
  GenOptDataForm: TGenOptDataForm;
  testMap:TStrDecordMap;
  //OPT_ITF_JSMXDaTa:TStringHashedMap;
  //OPT_ITF_ZQJSData:TStringHashedMap;
  BasicData:RBasicData;

procedure InitOPT_ITF_JSMXData(pOPT_ORDER:TStringHashedMap;pOPT_ITF_JSMXDaTa:TStringHashedMap);
procedure InitOPT_ITF_TRANS_INFOData(pOPT_ORDER:TStringHashedMap;pOPT_ITF_TRANS_INFODaTa:TStringHashedMap);
procedure InitOPT_ITF_ZQJSData(pOPT_ORDER:TStringHashedMap;pOPT_ITF_ZQJSDaTa:TStringHashedMap);
procedure InitOPT_ITF_HYCCPtrDataByOptOrder(var pOPT_ITF_HYCCData:TStringHashedMap;pOptOrder:TStringHashedMap);
procedure calOPT_ITF_HYCCPtrData(var pOPT_ITF_HYCCData:TStringHashedMap;pOPT_ORDER:TStringHashedMap);
function  GetInsertSql(fileName:string;HashMap:TStringHashedMap):string;
procedure GenFile(filename:string;HashMap:TStringHashedMap);
procedure CreateTxtFile(var F:TextFile;fileName:string);
procedure GenTxtFile(var F:TextFile;HashMap:TStringHashedMap);
procedure exectSqlStmt(sqlStmt:string);
procedure deletefile(filename:string);
procedure initBasicData;
function LeftZeroMatch(iNum:Integer;iCount:Integer):string;
procedure ConnectDB(User:string;DBName:string;Password:string;DBAddr:string);
implementation

{$R *.dfm}
procedure initBasicData;
begin
  BasicData.JSFL:='1.3';
  BasicData.QSFL:='0.3';
  BasicData.GHFL:='0';
  BasicData.JSSXFL:='0';
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

procedure InitOPT_ITF_JSMXData(pOPT_ORDER:TStringHashedMap;pOPT_ITF_JSMXDaTa:TStringHashedMap);
begin
  pOPT_ITF_JSMXDaTa.Add('JLGS','F01');//记录格式(根据业务 交易F01,行权F02,开户F03)
  pOPT_ITF_JSMXDaTa.Add('SCDM','10'); //市场代码（上海10）
  pOPT_ITF_JSMXDaTa.Add('JLLX','D01');//记录类型 (衍生品清算数据D01)
  pOPT_ITF_JSMXDaTa.Add('JSFS','001');//交收方式(净额担保001)
  pOPT_ITF_JSMXDaTa.Add('YWLX','Q01');//业务类型（期权交易Q01,期权行权Q02，期权开户Q10）

  pOPT_ITF_JSMXDaTa.Add('QSBZ','QB1'); //清算标志（期权交易清算QB1,期权行权结算QB2,期权个人账户开户QH1,期权机构账户开户QH2）
  pOPT_ITF_JSMXDaTa.Add('JSBH','1507230000009536'); //交收编号
  pOPT_ITF_JSMXDaTa.Add('CJBH','8536'); //成交编号
  pOPT_ITF_JSMXDaTa.Add('HYDDBH','S'+BasicData.CJBH);//合约订单编号
  pOPT_ITF_JSMXDaTa.Add('JYDDBH','61517');//交易订单编号

  pOPT_ITF_JSMXDaTa.Add('JYRQ',pOPT_ORDER['TRD_DATE']);//交易日期
  pOPT_ITF_JSMXDaTa.Add('QSRQ',pOPT_ORDER['TRD_DATE']);//清算日期
  pOPT_ITF_JSMXDaTa.Add('JSRQ','20180122');//交收日期
  pOPT_ITF_JSMXDaTa.Add('XWH1',pOPT_ORDER['STKPBU']);//交易单元
  pOPT_ITF_JSMXDaTa.Add('XWH2',pOPT_ORDER['STKPBU']);//结算单元

  pOPT_ITF_JSMXDaTa.Add('XWHY','XW509'); //交易参与人清算编号
  pOPT_ITF_JSMXDaTa.Add('JSHY','JS509');//结算参与人清算编号
  pOPT_ITF_JSMXDaTa.Add('ZQZH',pOPT_ORDER['TRDACCT']);//证券账号
  pOPT_ITF_JSMXDaTa.Add('ZZHBM','888');//期权子账户编码
  pOPT_ITF_JSMXDaTa.Add('HEYDM',pOPT_ORDER['OPT_NUM']);//期权合约代码

  pOPT_ITF_JSMXDaTa.Add('BDZQDM',pOPT_ORDER['OPT_UNDL_CODE']);//标的证券代码
  if pOPT_ORDER['STK_BIZ']='400' then
  begin
    pOPT_ITF_JSMXDaTa.Add('MMBZ','B');//买卖标志(买方B,卖方S)
    pOPT_ITF_JSMXDaTa.Add('KPBZ','O');//开平仓标志(开仓0，平仓C)
    pOPT_ITF_JSMXDaTa.Add('BDBZ',' ');//备兑标志(备兑1，非备兑‘’)
  end
  else
  begin
    pOPT_ITF_JSMXDaTa.Add('MMBZ','B');//买卖标志(买方B,卖方S)
    pOPT_ITF_JSMXDaTa.Add('KPBZ','O');//开平仓标志(开仓0，平仓C)
    pOPT_ITF_JSMXDaTa.Add('BDBZ',' ');//备兑标志(备兑1，非备兑‘’)
  end;

  pOPT_ITF_JSMXDaTa.Add('SL1',pOPT_ORDER['MATCHED_QTY']); //合约数量(开仓为正，平仓为负)

  pOPT_ITF_JSMXDaTa.Add('SL2','0');//标的券数量(对于CoveredCall 卖出方表示需交付的证券数量，值为负；对于买入方，值为0)
  pOPT_ITF_JSMXDaTa.Add('ZJZH',pOPT_ORDER['CUACCT_CODE']);//资金账号
  pOPT_ITF_JSMXDaTa.Add('BZ','RMB');//币种
  pOPT_ITF_JSMXDaTa.Add('JG1',pOPT_ORDER['ORDER_PRICE']);//价格1 权利金成交价
  pOPT_ITF_JSMXDaTa.Add('JG2','');//价格2

  pOPT_ITF_JSMXDaTa.Add('QSJE',pOPT_ORDER['MATCHED_AMT']);//清算金额
  pOPT_ITF_JSMXDaTa.Add('JSF',FloatToStr(StrToFloat(BasicData.JSFL)*StrToFloat(pOPT_ORDER['MATCHED_QTY'])));//经手费(经手费率*委托数量)
  pOPT_ITF_JSMXDaTa.Add('GHF',FloatToStr(StrToFloat(BasicData.GHFL)*StrToFloat(pOPT_ORDER['MATCHED_QTY'])));//过户费 (过户费率*委托数量)
  pOPT_ITF_JSMXDaTa.Add('JSSXF',FloatToStr(StrToFloat(BasicData.QSFL)*StrToFloat(pOPT_ORDER['MATCHED_QTY'])));//结算手续费 清算费(手续费率(清算费率)*委托数量)
  pOPT_ITF_JSMXDaTa.Add('QTJE','0');//其他金额

  pOPT_ITF_JSMXDaTa.Add('SFJE',FloatToStr(StrToFloat(pOPT_ITF_JSMXDaTa['QSJE'])+StrToFloat(pOPT_ITF_JSMXDaTa['JSF'])+StrToFloat(pOPT_ITF_JSMXDaTa['GHF'])+StrToFloat(pOPT_ITF_JSMXDaTa['JSSXF'])+StrToFloat(pOPT_ITF_JSMXDaTa['QTJE'])));//收付金额(收付金额=清算金额+经手费+过户费+结算费+其它金额)
  pOPT_ITF_JSMXDaTa.Add('JGDM','0000');//结果代码(正常0000)
  pOPT_ITF_JSMXDaTa.Add('FJSM','期权交易结算');//附加说明
  //pOPT_ITF_JSMXDaTa.Add('BY','1');//备用
end;
procedure InitOPT_ITF_TRANS_INFOData(pOPT_ORDER:TStringHashedMap;pOPT_ITF_TRANS_INFODaTa:TStringHashedMap);
begin
 // pOPT_ITF_TRANS_INFODaTa.create;
  pOPT_ITF_TRANS_INFODaTa.Add('RFStreamID','T0305');//参考数据类型(期权成交过户数据T0305)
  pOPT_ITF_TRANS_INFODaTa.Add('Account',pOPT_ORDER['TRDACCT']); //期权证券账户
  pOPT_ITF_TRANS_INFODaTa.Add('PartyID',pOPT_ORDER['STKPBU']); //业务交易单元
  pOPT_ITF_TRANS_INFODaTa.Add('branchId','4302'{pOPT_ORDER.STKEX_ORG_ID});//营业部代码
  pOPT_ITF_TRANS_INFODaTa.Add('OptionSubAccount','888');//证券账户期权子账户编码

  pOPT_ITF_TRANS_INFODaTa.Add('ClOrdID','S'+BasicData.CJBH);//会员内部订单号
  pOPT_ITF_TRANS_INFODaTa.Add('OrderID','31519');//订单编号
  pOPT_ITF_TRANS_INFODaTa.Add('SecurityID',pOPT_ORDER['OPT_NUM']);//合约编号
  pOPT_ITF_TRANS_INFODaTa.Add('OrigTime','100000');//申报时间  格式为HHMMSS
  pOPT_ITF_TRANS_INFODaTa.Add('TransactTime','100000');//成交时间 格式为HHMMSS

  pOPT_ITF_TRANS_INFODaTa.Add('TransactDate',pOPT_ORDER['TRD_DATE']);//过户日期  格式为YYYYMMDD
  pOPT_ITF_TRANS_INFODaTa.Add('ExecID','4341'); //成交编号
  pOPT_ITF_TRANS_INFODaTa.Add('LastQty',pOPT_ORDER['MATCHED_QTY']); //成交数量
  pOPT_ITF_TRANS_INFODaTa.Add('LastPx',pOPT_ORDER['ORDER_PRICE']); //成交价格
  pOPT_ITF_TRANS_INFODaTa.Add('TotalValueTraded',pOPT_ORDER['MATCHED_AMT']);//成交金额

  if pOPT_ORDER['STK_BIZ']='400' then
  begin
    pOPT_ITF_TRANS_INFODaTa.Add('Side','B');//买卖方向(买入B,卖出S)
    pOPT_ITF_TRANS_INFODaTa.Add('PositionEffect','O');//开平标志(开仓O,平仓C)
    pOPT_ITF_TRANS_INFODaTa.Add('CoveredOrUncovered',' ');//卖出开仓申报(备兑1,非备兑空)
  end
  else
  begin
    pOPT_ITF_TRANS_INFODaTa.Add('Side','B');//买卖方向(买入B,卖出S)
    pOPT_ITF_TRANS_INFODaTa.Add('PositionEffect','O');//开平标志(开仓O,平仓C)
    pOPT_ITF_TRANS_INFODaTa.Add('CoveredOrUncovered',' ');//卖出开仓申报(备兑1,非备兑空)
  end;

  pOPT_ITF_TRANS_INFODaTa.Add('ExecType','F');//当前订单执行状态(成交F)
  pOPT_ITF_TRANS_INFODaTa.Add('OwnerType','1');//订单所有类型(投资者发起1,交易所发起101,期权经营机构（包括其风险管理部门）102,机构投资者发起103,自营交易发起104,流动性服务提供商发起105)

  pOPT_ITF_TRANS_INFODaTa.Add('Currency','CNY');//币种(人民币CNY)
  pOPT_ITF_TRANS_INFODaTa.Add('Amount',FloatToStr(StrToFloat(BasicData.JSFL)*StrToFloat(pOPT_ORDER['MATCHED_QTY']))); //交易经手费(单位：元，精确到分)

end;
procedure InitOPT_ITF_ZQJSData(pOPT_ORDER:TStringHashedMap;pOPT_ITF_ZQJSDaTa:TStringHashedMap);
begin
   pOPT_ITF_ZQJSDaTa.Add('JLGS','F13'); //记录格式(期权行权欠款扣券交收明细F14,备兑期权标的证券锁定净额汇总F15,期权行权申报处置扣券及返还F16)
   pOPT_ITF_ZQJSDaTa.Add('JLLX','D03');//记录类型 (衍生品业务交收结果D03)
   pOPT_ITF_ZQJSDaTa.Add('JSFS','001');//交收方式(净额担保001)
   pOPT_ITF_ZQJSDaTa.Add('YWLX','');//业务类型(期权行权Q02,备兑期权标的证券锁定Q07,期权行权处置申报Q91,期权处置申报返还Q92
   pOPT_ITF_ZQJSDaTa.Add('JSBH','1507220000049572');//交收编号

   pOPT_ITF_ZQJSDaTa.Add('GLJSBH',' '); //关联交收编号(' ',#,原行权证券交收通知的交收编号)
   pOPT_ITF_ZQJSDaTa.Add('QSRQ',pOPT_ORDER['TRD_DATE']);//清算日期
   pOPT_ITF_ZQJSDaTa.Add('JSRQ',pOPT_ORDER['TRD_DATE']);//交收日期
   pOPT_ITF_ZQJSDaTa.Add('JYDY',pOPT_ORDER['STKPBU']);//交易单元
   pOPT_ITF_ZQJSDaTa.Add('JSDY',pOPT_ORDER['STKPBU']);//结算单元

   pOPT_ITF_ZQJSDaTa.Add('XWHY','JS509'); //记交易参与人的清算编号
   pOPT_ITF_ZQJSDaTa.Add('JSHY','JS509'); //结算参与人清算编号
   pOPT_ITF_ZQJSDaTa.Add('ZQZH',pOPT_ORDER['TRDACCT']);//证券账号
   pOPT_ITF_ZQJSDaTa.Add('ZQDM',pOPT_ORDER['OPT_UNDL_CODE']);//证券代码
   pOPT_ITF_ZQJSDaTa.Add('ZQLB',pOPT_ORDER['OPT_UNDL_CLS']);//证券类别

   pOPT_ITF_ZQJSDaTa.Add('LTLX','0'); //流通类型
   pOPT_ITF_ZQJSDaTa.Add('QYLB',' ');//权益类别
   pOPT_ITF_ZQJSDaTa.Add('GPNF','0');//挂盘年份

   pOPT_ITF_ZQJSDaTa.Add('SL1',pOPT_ORDER['MATCHED_QTY']);//数量1 扣券数量(正数),锁定数量(正数),申报扣券数量(负数)申报返还数量(正数)
   pOPT_ITF_ZQJSDaTa.Add('SL2',' '); //数量2

   pOPT_ITF_ZQJSDaTa.Add('JG',pOPT_ORDER['ORDER_PRICE']); //价格
   pOPT_ITF_ZQJSDaTa.Add('ZJZH',pOPT_ORDER['CUACCT_CODE']);//资金账户
   pOPT_ITF_ZQJSDaTa.Add('JE1',pOPT_ORDER['MATCHED_AMT']);//金额1 扣券市值
   pOPT_ITF_ZQJSDaTa.Add('JE2',' ');//金额2
   pOPT_ITF_ZQJSDaTa.Add('JGDM','');//结果代码(正常0000)

   pOPT_ITF_ZQJSDaTa.Add('FJSM','行权欠款扣券'); //附加说明
   pOPT_ITF_ZQJSDaTa.Add('BY',' ');//备用
end;

procedure InitOPT_ITF_HYCCPtrDataByOptOrder(var pOPT_ITF_HYCCData:TStringHashedMap;pOptOrder:TStringHashedMap);
begin
  pOPT_ITF_HYCCData.Add('SCDM','10');
  pOPT_ITF_HYCCData.Add('QSBH','JS509');
  pOPT_ITF_HYCCData.Add('ZQZH',pOptOrder['TRDACCT']);
  pOPT_ITF_HYCCData.Add('ZZHBM','888');
  //OPT_ITF_HYCCData.Add('TGDY',' ');

  pOPT_ITF_HYCCData.Add('HEYDM',pOptOrder['OPT_NUM']);
  pOPT_ITF_HYCCData.Add('CCFX','L');
  pOPT_ITF_HYCCData.Add('BDBZ',' ');
  pOPT_ITF_HYCCData.Add('YE1',pOptOrder['MATCHED_QTY']);
  pOPT_ITF_HYCCData.Add('YE2','0');

  pOPT_ITF_HYCCData.Add('JE1','0');
  pOPT_ITF_HYCCData.Add('JE2','');
  //pOPT_ITF_HYCCData.Add('BY','');
end;


procedure InitOPT_ITF_HYCCPtrData(var pOPT_ITF_HYCCData:TStringHashedMap;pStdsOptAssetData:TStringHashedMap);
begin
  pOPT_ITF_HYCCData.Add('SCDM','10');
  pOPT_ITF_HYCCData.Add('QSBH','JS509');
  pOPT_ITF_HYCCData.Add('ZQZH',pStdsOptAssetData['TRDACCT']);
  pOPT_ITF_HYCCData.Add('ZZHBM','888');
  //OPT_ITF_HYCCData.Add('TGDY',' ');

  pOPT_ITF_HYCCData.Add('HEYDM',pStdsOptAssetData['OPT_NUM']);
  pOPT_ITF_HYCCData.Add('CCFX','L');
  pOPT_ITF_HYCCData.Add('BDBZ',' ');
  if pStdsOptAssetData.isfind('OPT_BLN') then
  begin
    pOPT_ITF_HYCCData.Add('YE1',pStdsOptAssetData['OPT_BLN']);
    pOPT_ITF_HYCCData.Add('YE2',pStdsOptAssetData['COMBED_QTY']);
  end
  else
  begin
    pOPT_ITF_HYCCData.Add('YE1',pStdsOptAssetData['MATCHED_QTY']);
    pOPT_ITF_HYCCData.Add('YE2','0');
  end;
  pOPT_ITF_HYCCData.Add('JE1','0');
  pOPT_ITF_HYCCData.Add('JE2','');
  //pOPT_ITF_HYCCData.Add('BY','');
end;

procedure calOPT_ITF_HYCCPtrData(var pOPT_ITF_HYCCData:TStringHashedMap;pOPT_ORDER:TStringHashedMap);
begin
  pOPT_ITF_HYCCData['YE1']:= inttostr(strtoint(pOPT_ITF_HYCCData['YE1'])+strtoint(pOPT_ORDER['MATCHED_QTY'])) ;
end;


procedure InitOPT_ITF_HOLD_INFOPtrData(var pOPT_ITF_HOLD_INFOData:TStringHashedMap;pStdsOptAssetData:TStringHashedMap);
begin
  pOPT_ITF_HOLD_INFOData.Add('RFStreamID','H0301');// 参考数据类型(持仓余额对账接口:H0301)
  pOPT_ITF_HOLD_INFOData.Add('Account',pStdsOptAssetData['TRDACCT']);//期权合约账户
  pOPT_ITF_HOLD_INFOData.Add('OptionSubAcctount','888'); //期权合约子账户编号
  pOPT_ITF_HOLD_INFOData.Add('PartyID',pStdsOptAssetData['STKPBU']);//交易单元
  pOPT_ITF_HOLD_INFOData.Add('SecurityID',pStdsOptAssetData['OPT_NUM']);//合约编码

  pOPT_ITF_HOLD_INFOData.Add('PositionType','L');//持仓方向(权利方:L,义务方:S)
  pOPT_ITF_HOLD_INFOData.Add('SellCoveredOrUncovered',' ');//备兑标签(备兑:1,非备兑:' ')
  pOPT_ITF_HOLD_INFOData.Add('PositionQty',pStdsOptAssetData['OPT_BLN']); //持仓余额
  pOPT_ITF_HOLD_INFOData.Add('CompostionQty','0'); //组合持仓数量
end;

procedure InitOPT_ITF_HOLD_INFOPtrDataByOptOrder(var pOPT_ITF_HOLD_INFOData:TStringHashedMap;pOptOrder:TStringHashedMap);
begin
  pOPT_ITF_HOLD_INFOData.Add('RFStreamID','H0301');// 参考数据类型(持仓余额对账接口:H0301)
  pOPT_ITF_HOLD_INFOData.Add('Account',pOptOrder['TRDACCT']);//期权合约账户
  pOPT_ITF_HOLD_INFOData.Add('OptionSubAcctount','888'); //期权合约子账户编号
  pOPT_ITF_HOLD_INFOData.Add('PartyID',pOptOrder['STKPBU']);//交易单元
  pOPT_ITF_HOLD_INFOData.Add('SecurityID',pOptOrder['OPT_NUM']);//合约编码

  pOPT_ITF_HOLD_INFOData.Add('PositionType','L');//持仓方向(权利方:L,义务方:S)
  pOPT_ITF_HOLD_INFOData.Add('SellCoveredOrUncovered',' ');//备兑标签(备兑:1,非备兑:' ')
  pOPT_ITF_HOLD_INFOData.Add('PositionQty',pOptOrder['MATCHED_QTY']); //持仓余额
  pOPT_ITF_HOLD_INFOData.Add('CompostionQty','0'); //组合持仓数量
end;

procedure calOPT_ITF_HOLD_INFOPtrData(var pOPT_ITF_HOLD_INFOData:TStringHashedMap;pOPT_ORDER:TStringHashedMap);
begin
  pOPT_ITF_HOLD_INFOData['PositionQty']:= inttostr(strtoint(pOPT_ITF_HOLD_INFOData['PositionQty'])+strtoint(pOPT_ORDER['MATCHED_QTY'])) ;
  //GenOptDataForm.Edit1.Text:=OPT_ITF_HYCCData['YE1'];//OPT_ITF_HYCCMap['YE1']:='1';//OPT_ITF_HYCCMap['YE1']+pOPT_ORDER.MATCHED_QTY;
end;

procedure calOPT_ITF_BZJMXPtrData(var pOPT_ITF_BZJMXData:TStringHashedMap;OPT_ITF_HYCCData:TStringHashedMap);
var
  XZ:double;
  QLJJSJ:double;
  BDSPJ:double;
  XQJ:double;
  WCBZJ:double;
  HYDW:double;
  isGP:boolean;
  isRG:boolean;
  sqlStmt:string;
begin
  sqlStmt:='select EXERCISE_PRICE,CLOSE_PRICE,OPT_TYPE,CURRENT_PRICE,OPT_UNIT,OPT_UNDL_CLS,* from OPT_INFO ,OPT_CLOSE_PRICE,STK_MKTINFO where OPT_INFO.OPT_NUM=OPT_CLOSE_PRICE.OPT_NUM and OPT_INFO.OPT_UNDL_CODE=STK_MKTINFO.STK_CODE and OPT_INFO.OPT_NUM='+''''+OPT_ITF_HYCCData['HEYDM']+'''';
  ConnectDB('sa','KSMM_STDS','sasa','192.168.204.168');
  GenOptDataForm.AdoQuery.Close;
  GenOptDataForm.AdoQuery.SQL.Clear;
  GenOptDataForm.ADOQuery.SQL.Add(sqlStmt);
  GenOptDataForm.ADOQuery.Open;
  QLJJSJ:=strtofloat(GenOptDataForm.Adoquery.FieldValues['CLOSE_PRICE']);
  BDSPJ:=strtofloat(GenOptDataForm.Adoquery.FieldValues['CURRENT_PRICE']);
  XQJ:=strtofloat(GenOptDataForm.Adoquery.FieldValues['EXERCISE_PRICE']);
  HYDW:=strtofloat(GenOptDataForm.Adoquery.FieldValues['OPT_UNIT']);
  if  GenOptDataForm.Adoquery.FieldValues['OPT_UNDL_CLS']='A' then
  begin
    isGP:=true;
  end
  else
  begin
    isGP:=false;
  end;

  if  GenOptDataForm.Adoquery.FieldValues['OPT_TYPE']='C' then
  begin
    isRG:=true;
  end
  else
  begin
    isRG:=false;
  end;


  pOPT_ITF_BZJMXData.Add('ZJZH','100000000000000001');
  pOPT_ITF_BZJMXData.Add('QSBH','JS509');
  pOPT_ITF_BZJMXData.Add('ZQZH',OPT_ITF_HYCCData['ZQZH']);
  pOPT_ITF_BZJMXData.Add('ZZHBM','888');
  pOPT_ITF_BZJMXData.Add('TGDY',' ');

  pOPT_ITF_BZJMXData.Add('BZJLX','SGL');
  pOPT_ITF_BZJMXData.Add('JELX','002');
  pOPT_ITF_BZJMXData.Add('HEYDM',OPT_ITF_HYCCData['HEYDM']);
  pOPT_ITF_BZJMXData.Add('CCFX','S');
  pOPT_ITF_BZJMXData.Add('BDBZ',' ');

  pOPT_ITF_BZJMXData.Add('SL1',OPT_ITF_HYCCData['YE1']);
  pOPT_ITF_BZJMXData.Add('SL2',OPT_ITF_HYCCData['YE3']);
  pOPT_ITF_BZJMXData.Add('BH1',' ');
  pOPT_ITF_BZJMXData.Add('BH2',' ');
  pOPT_ITF_BZJMXData.Add('BL1','0.0000000000');

  pOPT_ITF_BZJMXData.Add('BL2','0.0000000000');
  if isGP then
  begin
    if isRG then
    begin
      XZ:=Max(XQJ-BDSPJ,0);
      WCBZJ:=(QLJJSJ+Max((0.21*BDSPJ-XZ),0.10*XQJ))*HYDW;
    end
    else
    begin
      XZ:=MAX(BDSPJ-XQJ,0);
      WCBZJ:=Min(QLJJSJ+Max(0.19*BDSPJ-XZ,0.10*XQJ),XQJ)*HYDW
    end;
  end
  else
  begin
    if isRG then
    begin
      XZ:=Max(XQJ-BDSPJ,0);
      WCBZJ:=(QLJJSJ+Max((0.12*BDSPJ-XZ),0.07*XQJ))*HYDW;
    end
    else
    begin
      XZ:=MAX(BDSPJ-XQJ,0);
      WCBZJ:=Min(QLJJSJ+Max(0.12*BDSPJ-XZ,0.07*XQJ),XQJ)*HYDW
    end;
  end;
  pOPT_ITF_BZJMXData.Add('JE1',floattostr(WCBZJ));
  pOPT_ITF_BZJMXData.Add('JE2',floattostr(WCBZJ*strtoint(OPT_ITF_HYCCData['YE1'])));
  pOPT_ITF_BZJMXData.Add('JE3','0.00');
  pOPT_ITF_BZJMXData.Add('BY',' ');


  //pOPT_ITF_HOLD_INFOData['PositionQty']:= inttostr(strtoint(pOPT_ITF_HOLD_INFOData['PositionQty'])+strtoint(pOPT_ORDER.MATCHED_QTY)) ;
  //GenOptDataForm.Edit1.Text:=OPT_ITF_HYCCData['YE1'];//OPT_ITF_HYCCMap['YE1']:='1';//OPT_ITF_HYCCMap['YE1']+pOPT_ORDER.MATCHED_QTY;
end;

procedure ConnectDB(User:string;DBName:string;Password:string;DBAddr:string);
begin
  with GenOptDataForm.ADOConnection do
  begin
    Connected:=False;
    ConnectionString:='Provider=SQLOLEDB.1;Persist Security Info=False;User ID='+User+';Initial Catalog='+DBName+';password ='+Password+';Data Source='+DBAddr+';';
    try
      ConnectionTimeout:=20;
      CommandTimeout:=30;
      Connected:=True;
    except
      ShowMessage('not connect');
      raise;
      Exit;
    end;
  end;
end;

procedure TGenOptDataForm.ConnectButtonClick(Sender: TObject);
begin
  with ADOConnection do
  begin
    Connected:=False;
    ConnectionString:='Provider=SQLOLEDB.1;Persist Security Info=False;User ID='+User.Text+';Initial Catalog='+DBName.Text+';password ='+Password.Text+';Data Source='+DBAddr.Text+';';
    try
      ConnectionTimeout:=20;
      CommandTimeout:=30;
      Connected:=True;
    except
      ShowMessage('not connect');
      raise;
      Exit;
    end;
  end;
end;

procedure SelectOptAsset(pOPT_ITF_HYCCSUMMap:TStrDecordMap;pOPT_ITF_HYCCData:TStringHashedMap);
var
  StdsOptAssetData:TStringHashedMap;
  tableName:string;
  sqlStmt:string;
  rows:Integer;
  iIndex:Integer;
  OPT_ITF_HYCCCount:integer;
  ptr:PStringHashedMap;
  OPT_ITF_HYCCData:TStringHashedMap;
begin
  StdsOptAssetData:=TStringHashedMap.Create;
  ConnectDB('sa','KSMM_STDS','sasa','192.168.204.168');
  GenOptDataForm.AdoQuery.Close;
  GenOptDataForm.AdoQuery.SQL.Clear;
  tableName:='OPT_ASSET';
  sqlStmt:='SELECT * '+'FROM ' +TableName;
  GenOptDataForm.ADOQuery.SQL.Add(sqlStmt);
  GenOptDataForm.ADOQuery.Open;
  rows:=GenOptDataForm.Adoquery.RecordCount;
  for iIndex:=1 to rows do
  begin
    StdsOptAssetData.Add('TRDACCT',GenOptDataForm.Adoquery.FieldValues['TRDACCT']);
    GenOptDataForm.Edit1.Text:=GenOptDataForm.Adoquery.FieldValues['TRDACCT'];
    StdsOptAssetData.Add('OPT_NUM',GenOptDataForm.Adoquery.FieldValues['OPT_NUM']);
    GenOptDataForm.Edit1.Text:=GenOptDataForm.Adoquery.FieldValues['OPT_NUM'];
    StdsOptAssetData.Add('OPT_BLN',GenOptDataForm.Adoquery.FieldValues['OPT_BLN']);
    StdsOptAssetData.Add('COMBED_QTY',GenOptDataForm.Adoquery.FieldValues['COMBED_QTY']);
    pOPT_ITF_HYCCData:=TStringHashedMap.Create;
    InitOPT_ITF_HYCCPtrData(StdsOptAssetData,OPT_ITF_HYCCData);
   // pOPT_ITF_HYCCSUMMap.Add(GenOptDataForm.Adoquery.FieldValues['OPT_NUM'],@StdsOptAssetData);
    ptr:=pOPT_ITF_HYCCSUMMap.SecondeValue(0);
    GenOptDataForm.Adoquery.Next;
  end;
end;

procedure TGenOptDataForm.GenDataButtonClick(Sender: TObject);
var
  sqlStmt:String;
  tableName:String;
  rows:Integer;
  iIndex:Integer;
  OPT_ORDERDATA:TStringHashedMap;
  ORDERDATA:TStringHashedMap;
  PtrOPT_ITF_JSMXDaTa:PStringHashedMap;
  PtrOPT_ITF_TRANS_INFOData:PStringHashedMap;
  ptrOPT_ITF_HYCCData:PStringHashedMap;
  ptrLOPT_ITF_HYCCData:PStringHashedMap;
  ptrSOPT_ITF_HYCCData:PStringHashedMap;
  ptrCOPT_ITF_HYCCData:PStringHashedMap;
  ptrOPT_ITF_HOLD_INFOData:PStringHashedMap;
  OPT_ITF_HYCCSUMMap:TStrDecordMap;
  LOPT_ITF_HYCCSUMMap:TStrDecordMap;
  SOPT_ITF_HYCCSUMMap:TStrDecordMap;
  COPT_ITF_HYCCSUMMap:TStrDecordMap;

  OPT_ITF_HOLD_INFOSUMMap:TStrDecordMap;
  StdsOptAssetData:TStringHashedMap;
  Ftrns0321200:TextFile;
  Fhold0321200:TextFile;
  OPT_ITF_HYCCCount:integer;
  LOPT_ITF_HYCCCount:integer;
  SOPT_ITF_HYCCCount:integer;
  COPT_ITF_HYCCCount:integer;
  OPT_NUM:string;
  OPT_ITF_HOLD_INFOCount:integer;
  count2:integer;
  ptr:PStringHashedMap;
begin
  initBasicData;
  deletefile('op_hyccjs486');
  OPT_ITF_HYCCSUMMap:=TStrDecordMap.Create;
  LOPT_ITF_HYCCSUMMap:=TStrDecordMap.Create;
  SOPT_ITF_HYCCSUMMap:=TStrDecordMap.Create;
  COPT_ITF_HYCCSUMMap:=TStrDecordMap.Create;
  OPT_ITF_HOLD_INFOSUMMap:=TStrDecordMap.Create;

  ConnectDB('sa','KSMM_STDS','sasa','192.168.204.168');
  GenOptDataForm.AdoQuery.Close;
  GenOptDataForm.AdoQuery.SQL.Clear;
  tableName:='OPT_ASSET';
  sqlStmt:='SELECT * '+'FROM ' +TableName;
  GenOptDataForm.ADOQuery.SQL.Add(sqlStmt);
  GenOptDataForm.ADOQuery.Open;
  rows:=GenOptDataForm.Adoquery.RecordCount;
  for iIndex:=1 to rows do
  begin
    StdsOptAssetData:=TStringHashedMap.Create;
    StdsOptAssetData.Add('TRDACCT',GenOptDataForm.Adoquery.FieldValues['TRDACCT']);
    StdsOptAssetData.Add('OPT_NUM',GenOptDataForm.Adoquery.FieldValues['OPT_NUM']);
    StdsOptAssetData.Add('OPT_BLN',GenOptDataForm.Adoquery.FieldValues['OPT_BLN']);
    StdsOptAssetData.Add('COMBED_QTY',GenOptDataForm.Adoquery.FieldValues['COMBED_QTY']);
    StdsOptAssetData.Add('STKPBU',GenOptDataForm.Adoquery.FieldValues['STKPBU']);
    StdsOptAssetData.Add('OPT_TYPE',GenOptDataForm.Adoquery.FieldValues['OPT_TYPE']);
    StdsOptAssetData.Add('OPT_SIDE',GenOptDataForm.Adoquery.FieldValues['OPT_SIDE']);
    StdsOptAssetData.Add('OPT_CVD_FLAG',GenOptDataForm.Adoquery.FieldValues['OPT_CVD_FLAG']);
    new(ptrOPT_ITF_HYCCData);
    ptrOPT_ITF_HYCCData^:=TStringHashedMap.Create;
    InitOPT_ITF_HYCCPtrData(ptrOPT_ITF_HYCCData^,StdsOptAssetData);
    if GenOptDataForm.Adoquery.FieldValues['OPT_SIDE']='L' then   //权利仓
    begin
      LOPT_ITF_HYCCSUMMap.Add(GenOptDataForm.Adoquery.FieldValues['OPT_NUM'],ptrOPT_ITF_HYCCData);
    end
    else if GenOptDataForm.Adoquery.FieldValues['OPT_SIDE']='S' then    //义务仓
    begin
      SOPT_ITF_HYCCSUMMap.Add(GenOptDataForm.Adoquery.FieldValues['OPT_NUM'],ptrOPT_ITF_HYCCData);
    end
    else      //备兑仓
    begin
      COPT_ITF_HYCCSUMMap.Add(GenOptDataForm.Adoquery.FieldValues['OPT_NUM'],ptrOPT_ITF_HYCCData);
    end;
    OPT_ITF_HYCCSUMMap.Add(GenOptDataForm.Adoquery.FieldValues['OPT_NUM'],ptrOPT_ITF_HYCCData); //所有持仓

    new(ptrOPT_ITF_HOLD_INFOData);
    ptrOPT_ITF_HOLD_INFOData^:=TStringHashedMap.Create;
    InitOPT_ITF_HOLD_INFOPtrData(ptrOPT_ITF_HOLD_INFOData^,StdsOptAssetData);
    OPT_ITF_HOLD_INFOSUMMap.Add(GenOptDataForm.Adoquery.FieldValues['OPT_NUM'],ptrOPT_ITF_HOLD_INFOData);

    GenOptDataForm.Adoquery.Next;
  end;

 // SelectOptAsset(OPT_ITF_HYCCSUMMap,ptrOPT_ITF_HYCCData^);
  CreateTxtFile(Ftrns0321200,'trns0321200.txt');
  CreateTxtFile(Fhold0321200,'hold0321200.txt');
  ConnectDB('sa','KSMM_OPT','sasa','192.168.204.168');
  AdoQuery.Close;
  AdoQuery.SQL.Clear;
  tableName:='OPT_ORDER';
  sqlStmt:='SELECT * '+'FROM ' +TableName;
  ADOQuery.SQL.Add(sqlStmt);
  ADOQuery.Open;
  rows:=Adoquery.RecordCount;
  deletefile('op_jsmxjs486');
  OPT_ORDERDATA:=TStringHashedMap.Create;
  for iIndex:=1 to rows do
  begin
    OPT_ORDERDATA.ADD('TRD_DATE',Adoquery.FieldValues['TRD_DATE']);
    OPT_ORDERDATA.ADD('ORDER_DATE',Adoquery.FieldValues['ORDER_DATE']);
    OPT_ORDERDATA.ADD('CUACCT_CODE',Adoquery.FieldValues['CUACCT_CODE']);
    OPT_ORDERDATA.ADD('STKPBU',Adoquery.FieldValues['STKPBU']);
    OPT_ORDERDATA.ADD('TRDACCT',Adoquery.FieldValues['TRDACCT']);
    OPT_ORDERDATA.ADD('OPT_CODE',Adoquery.FieldValues['OPT_CODE']);
    OPT_ORDERDATA.ADD('OPT_NUM',Adoquery.FieldValues['OPT_NUM']);
    OPT_ORDERDATA.ADD('OPT_UNDL_CODE',Adoquery.FieldValues['OPT_UNDL_CODE']);
    OPT_ORDERDATA.ADD('MATCHED_QTY',Adoquery.FieldValues['MATCHED_QTY']);
    OPT_ORDERDATA.ADD('ORDER_PRICE',Adoquery.FieldValues['ORDER_PRICE']);
    OPT_ORDERDATA.ADD('MATCHED_AMT',Adoquery.FieldValues['MATCHED_AMT']);
    OPT_ORDERDATA.ADD('STK_BIZ',Adoquery.FieldValues['STK_BIZ']);

 {   OPT_ORDERDATA.TRD_DATE:=Adoquery.FieldValues['TRD_DATE'];
    OPT_ORDERDATA.ORDER_DATE:=Adoquery.FieldValues['ORDER_DATE'];
    OPT_ORDERDATA.CUACCT_CODE:=Adoquery.FieldValues['CUACCT_CODE'];
    OPT_ORDERDATA.STKPBU:=Adoquery.FieldValues['STKPBU'];
    OPT_ORDERDATA.TRDACCT:=Adoquery.FieldValues['TRDACCT'];
    OPT_ORDERDATA.OPT_CODE:=Adoquery.FieldValues['OPT_CODE'];
    OPT_ORDERDATA.OPT_NUM:=Adoquery.FieldValues['OPT_NUM'];
    OPT_ORDERDATA.OPT_UNDL_CODE:=Adoquery.FieldValues['OPT_UNDL_CODE'];
    OPT_ORDERDATA.MATCHED_QTY:=Adoquery.FieldValues['MATCHED_QTY'];
    OPT_ORDERDATA.ORDER_PRICE:=Adoquery.FieldValues['ORDER_PRICE'];
    OPT_ORDERDATA.MATCHED_AMT:=Adoquery.FieldValues['MATCHED_AMT'];
    OPT_ORDERDATA.STK_BIZ:=Adoquery.FieldValues['STK_BIZ'];
}

    BasicData.CJBH:=LeftZeroMatch(iIndex,9);
    new(PtrOPT_ITF_JSMXDaTa);
    new(PtrOPT_ITF_TRANS_INFOData);
    PtrOPT_ITF_JSMXDaTa^:=TStringHashedMap.Create;
    ptrOPT_ITF_TRANS_INFODaTa^:=TStringHashedMap.Create;
    InitOPT_ITF_JSMXData(OPT_ORDERDATA,PtrOPT_ITF_JSMXDaTa^);
    InitOPT_ITF_TRANS_INFOData(OPT_ORDERDATA,ptrOPT_ITF_TRANS_INFODaTa^);
    if OPT_ITF_HYCCSUMMap.isfind(Adoquery.FieldValues['OPT_NUM']) then
    begin
      if LOPT_ITF_HYCCSUMMap.isfind(Adoquery.FieldValues['OPT_NUM']) then
      begin
        ptrOPT_ITF_HYCCData:=LOPT_ITF_HYCCSUMMap[Adoquery.FieldValues['OPT_NUM']];
        calOPT_ITF_HYCCPtrData(ptrOPT_ITF_HYCCData^,OPT_ORDERDATA);
      end
      else if SOPT_ITF_HYCCSUMMap.isfind(Adoquery.FieldValues['OPT_NUM']) then
      begin
        ptrOPT_ITF_HYCCData:=SOPT_ITF_HYCCSUMMap[Adoquery.FieldValues['OPT_NUM']];
        calOPT_ITF_HYCCPtrData(ptrOPT_ITF_HYCCData^,OPT_ORDERDATA);
      end
      else
      begin
        ptrOPT_ITF_HYCCData:=COPT_ITF_HYCCSUMMap[Adoquery.FieldValues['OPT_NUM']];
        calOPT_ITF_HYCCPtrData(ptrOPT_ITF_HYCCData^,OPT_ORDERDATA);
      end;

      ptrOPT_ITF_HYCCData:=OPT_ITF_HYCCSUMMap[Adoquery.FieldValues['OPT_NUM']];
      calOPT_ITF_HYCCPtrData(ptrOPT_ITF_HYCCData^,OPT_ORDERDATA);

      ptrOPT_ITF_HOLD_INFOData:=OPT_ITF_HOLD_INFOSUMMap[Adoquery.FieldValues['OPT_NUM']];
      calOPT_ITF_HOLD_INFOPtrData(ptrOPT_ITF_HOLD_INFOData^,OPT_ORDERDATA);
    end
    else
    begin
      if Adoquery.FieldValues['STK_BIZ']='400' then
      begin
        new(ptrOPT_ITF_HYCCData);
        ptrOPT_ITF_HYCCData^:=TStringHashedMap.Create;
        InitOPT_ITF_HYCCPtrDataByOptOrder(ptrOPT_ITF_HYCCData^,OPT_ORDERDATA);
        LOPT_ITF_HYCCSUMMap.Add(Adoquery.FieldValues['OPT_NUM'],ptrOPT_ITF_HYCCData);
      end
      else if Adoquery.FieldValues['STK_BIZ']='402' then
      begin
        new(ptrOPT_ITF_HYCCData);
        ptrOPT_ITF_HYCCData^:=TStringHashedMap.Create;
        InitOPT_ITF_HYCCPtrDataByOptOrder(ptrOPT_ITF_HYCCData^,OPT_ORDERDATA);
        SOPT_ITF_HYCCSUMMap.Add(Adoquery.FieldValues['OPT_NUM'],ptrOPT_ITF_HYCCData);
      end
      else
      begin
        new(ptrOPT_ITF_HYCCData);
        ptrOPT_ITF_HYCCData^:=TStringHashedMap.Create;
        InitOPT_ITF_HYCCPtrDataByOptOrder(ptrOPT_ITF_HYCCData^,OPT_ORDERDATA);
        COPT_ITF_HYCCSUMMap.Add(Adoquery.FieldValues['OPT_NUM'],ptrOPT_ITF_HYCCData);
      end;

      new(ptrOPT_ITF_HYCCData);
      ptrOPT_ITF_HYCCData^:=TStringHashedMap.Create;
      InitOPT_ITF_HYCCPtrDataByOptOrder(ptrOPT_ITF_HYCCData^,OPT_ORDERDATA);
      OPT_ITF_HYCCSUMMap.Add(Adoquery.FieldValues['OPT_NUM'],ptrOPT_ITF_HYCCData);

      new(ptrOPT_ITF_HOLD_INFOData);
      ptrOPT_ITF_HOLD_INFOData^:=TStringHashedMap.Create;
      InitOPT_ITF_HOLD_INFOPtrDataByOptOrder(ptrOPT_ITF_HOLD_INFOData^,OPT_ORDERDATA);
      OPT_ITF_HOLD_INFOSUMMap.Add(Adoquery.FieldValues['OPT_NUM'],ptrOPT_ITF_HOLD_INFOData);
    end;
    GenFile('op_jsmxjs486',PtrOPT_ITF_JSMXDaTa^);
    GenTxtFile(Ftrns0321200,ptrOPT_ITF_TRANS_INFODaTa^);
    Dispose(PtrOPT_ITF_JSMXDaTa);
    Dispose(PtrOPT_ITF_TRANS_INFOData);
    Adoquery.Next;
  end;

  //合约对冲
  LOPT_ITF_HYCCCount:=LOPT_ITF_HYCCSUMMap.Count;
  for iIndex:=1 to LOPT_ITF_HYCCCount do
  begin
    OPT_NUM:=LOPT_ITF_HYCCSUMMap.FirstValue(iIndex-1);
    ptrLOPT_ITF_HYCCData:=LOPT_ITF_HYCCSUMMap.SecondeValue(iIndex-1);
    if SOPT_ITF_HYCCSUMMap.isfind(OPT_NUM) then
    begin
      ptrSOPT_ITF_HYCCData:=SOPT_ITF_HYCCSUMMap[OPT_NUM];
      if StrToFloat(ptrLOPT_ITF_HYCCData^['YE1'])>StrToFloat(ptrSOPT_ITF_HYCCData^['YE1'])  then
      begin
         ptrLOPT_ITF_HYCCData^['YE1']:=floattostr(StrToFloat(ptrLOPT_ITF_HYCCData^['YE1'])-StrToFloat(ptrSOPT_ITF_HYCCData^['YE1'])) ;
      end
      else if  StrToFloat(ptrLOPT_ITF_HYCCData^['YE1'])=StrToFloat(ptrSOPT_ITF_HYCCData^['YE1']) then
      begin
        //LOPT_ITF_HYCCSUMMap.Delete(OPT_NUM);
        SOPT_ITF_HYCCSUMMap.Delete(OPT_NUM);
      end
      else
      begin
        //LOPT_ITF_HYCCSUMMap.Delete(OPT_NUM);
        ptrSOPT_ITF_HYCCData^['YE1']:=floattostr(StrToFloat(ptrSOPT_ITF_HYCCData^['YE1'])-StrToFloat(ptrLOPT_ITF_HYCCData^['YE1'])) ;
      end;
    end;

    if (strToInt(ptrLOPT_ITF_HYCCData^['YE1'])<>0) and COPT_ITF_HYCCSUMMap.isfind(OPT_NUM) then
    begin
      ptrCOPT_ITF_HYCCData:=COPT_ITF_HYCCSUMMap[OPT_NUM];
      if StrToFloat(ptrLOPT_ITF_HYCCData^['YE1'])>StrToFloat(ptrCOPT_ITF_HYCCData^['YE1'])  then
      begin
         ptrLOPT_ITF_HYCCData^['YE1']:=floattostr(StrToFloat(ptrLOPT_ITF_HYCCData^['YE1'])-StrToFloat(ptrCOPT_ITF_HYCCData^['YE1'])) ;
      end
      else if  StrToFloat(ptrLOPT_ITF_HYCCData^['YE1'])=StrToFloat(ptrCOPT_ITF_HYCCData^['YE1']) then
      begin
        //LOPT_ITF_HYCCSUMMap.Delete(OPT_NUM);
        COPT_ITF_HYCCSUMMap.Delete(OPT_NUM);
      end
      else
      begin
        //LOPT_ITF_HYCCSUMMap.Delete(OPT_NUM);
        ptrCOPT_ITF_HYCCData^['YE1']:=floattostr(StrToFloat(ptrCOPT_ITF_HYCCData^['YE1'])-StrToFloat(ptrLOPT_ITF_HYCCData^['YE1'])) ;
      end;
    end
    //GenFile('op_hyccjs486',ptrOPT_ITF_HYCCData^);
  end;

  LOPT_ITF_HYCCCount:=LOPT_ITF_HYCCSUMMap.Count;
  for iIndex:=1 to LOPT_ITF_HYCCCount do
  begin
    ptrLOPT_ITF_HYCCData:=LOPT_ITF_HYCCSUMMap.SecondeValue(iIndex-1);
    if strtoint(ptrLOPT_ITF_HYCCData^['YE1'])<>0 then
    begin
     GenFile('op_hyccjs486',ptrLOPT_ITF_HYCCData^);
    end;
  end;

   SOPT_ITF_HYCCCount:=SOPT_ITF_HYCCSUMMap.Count;
   for iIndex:=1 to SOPT_ITF_HYCCCount do
   begin
     ptrSOPT_ITF_HYCCData:=SOPT_ITF_HYCCSUMMap.SecondeValue(iIndex-1);
     if strtoint(ptrSOPT_ITF_HYCCData^['YE1'])<>0 then
     begin
      GenFile('op_hyccjs486',ptrSOPT_ITF_HYCCData^);
     end;
   end;

   COPT_ITF_HYCCCount:=COPT_ITF_HYCCSUMMap.Count;
   for iIndex:=1 to COPT_ITF_HYCCCount do
   begin
     ptrCOPT_ITF_HYCCData:=COPT_ITF_HYCCSUMMap.SecondeValue(iIndex-1);
     if strtoint(ptrCOPT_ITF_HYCCData^['YE1'])<>0 then
     begin
      GenFile('op_hyccjs486',ptrCOPT_ITF_HYCCData^);
     end;
   end;

  {OPT_ITF_HYCCCount:=OPT_ITF_HYCCSUMMap.Count;
  for iIndex:=1 to OPT_ITF_HYCCCount do
  begin
    ptrOPT_ITF_HYCCData:=OPT_ITF_HYCCSUMMap.SecondeValue(iIndex-1);
    GenFile('op_hyccjs486',ptrOPT_ITF_HYCCData^);
  end;}

  OPT_ITF_HOLD_INFOCount:=OPT_ITF_HOLD_INFOSUMMap.Count;
  for iIndex:=1 to OPT_ITF_HOLD_INFOCount do
  begin
    ptrOPT_ITF_HOLD_INFOData:=OPT_ITF_HOLD_INFOSUMMap.SecondeValue(iIndex-1);
    GenTxtFile(Fhold0321200,ptrOPT_ITF_HOLD_INFOData^);
  end;
  Closefile(Fhold0321200);
  Closefile(Ftrns0321200);

end;

function GetInsertSql(fileName:string;HashMap:TStringHashedMap):string;
var
  sqlStmt1:string;
  sqlStmt2:string;
  iCount:Integer;
  iIndex:Integer;
  sqlStmt:string;
begin
  sqlStmt1:='INSERT INTO '+fileName+'(';
  sqlStmt2:='VALUES(';
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
procedure GenFile(filename:string;HashMap:TStringHashedMap);
var
  sqlStmt1:string;
  sqlStmt2:string;
  sqlStmt:string;
  iCount:integer;
  iIndex:integer;
begin
  sqlStmt:=GetInsertSql(filename,HashMap);
  GenOptDataForm.Edit1.Text:=sqlStmt;
 // GenData.Edit1.Text:=sqlStmt;
  exectSqlStmt(sqlStmt);
end;

procedure CreateTxtFile(var F:TextFile;fileName:string);
begin
  AssignFile(F,FileName);
  ReWrite(F);
end;
procedure GenTxtFile(var F:TextFile;HashMap:TStringHashedMap);
var
  iCount:Integer;
  iIndex:Integer;
  sLineText:string;
begin
  iCount:=HashMap.Count;
  for iIndex:=0 to iCount-2 do
  begin
    sLineText:=HashMap.SecondeValue(iIndex)+' |';
    Write(F,sLineText);
  end;
  sLineText:=HashMap.SecondeValue(iIndex);
  Writeln(F,sLineText);
  //Closefile(F);
end;

procedure exectSqlStmt(sqlStmt:string);
begin
  GenOptDataForm.ADOConnectionDBF.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;'
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
    GenOptDataForm.ADOQueryDBF.Close;
    GenOptDataForm.ADOQueryDBF.SQL.Clear;
    GenOptDataForm.ADOQueryDBF.SQL.Add(sqlStmt);
    GenOptDataForm.ADOQueryDBF.ExecSQL;
    GenOptDataForm.ADOQueryDBF.Close;
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
 // GenData.Edit1.Text:=sqlStmt;
  exectSqlStmt(sqlStmt);
end;

end.
