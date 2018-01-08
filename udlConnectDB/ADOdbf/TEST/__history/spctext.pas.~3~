unit spctext;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Comobj,Buttons, Grids, DB, ADODB, ExtDlgs,
  DBGrids;

type
  TForm1 = class(TForm)
    ADOQuery1: TADOQuery;
    Button1: TButton;
    ADOQuery2: TADOQuery;
    StringGrid1: TStringGrid;
    Button2: TButton;
    OpenTextFileDialog1: TOpenTextFileDialog;
    Button3: TButton;
    ADOScore: TADOQuery;
    Button4: TButton;
    Edit1: TEdit;
    Button5: TButton;
    DBGrid1: TDBGrid;
    Button6: TButton;
    ADOSPC: TADOQuery;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    function ExportStrGridToExcel(Args: array of const): Boolean;
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i,j: Integer;
begin
  with ADOQuery1 do
  begin
    for i := 1 to StringGrid1.RowCount - 1-1 do
    begin
      Close;
      sql.Text:='select * from billmodal_1_f1 where product='''+StringGrid1.Cells[0,i]+''' and '+
                'recension='''+StringGrid1.Cells[2,i]+''' and code='''+StringGrid1.Cells[1,i]+
                ''' and modal='''+StringGrid1.Cells[3,i]+'''';
      Open;
      if RecordCount=0 then
        Continue;
      for j:= 0 to recordcount - 1 do
      begin
        ADOQuery2.Close;
        ADOQuery2.SQL.Text:='insert into billmodal_1_f1 values('''
            +FieldByName('modal').AsString+''','''
            +FieldByName('number').AsString+''','''
            +FieldByName('product').AsString+''','''
            +FieldByName('code').AsString+''','''
            +FieldByName('recension').AsString+''','''
            +FieldByName('count').AsString+''','''
            +FieldByName('col1').AsString+''','''
            +FieldByName('col2').AsString+''','''
            +FieldByName('col3').AsString+''','''
            +FieldByName('col4').AsString+''','''
            +FieldByName('col5').AsString+''','''
            +FieldByName('col6').AsString+''','''
            +FieldByName('col7').AsString+''','''
            +FieldByName('col8').AsString+''','''
            +FieldByName('col9').AsString+''','''
            +FieldByName('col10').AsString+''','''
            +FieldByName('col11').AsString+''')';
        ADOQuery2.ExecSQL;
        Next;
      end;
      Edit1.text:=sql.Text;
    end;

  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
ExcelApp   :   Variant;
sheet   :   Variant;
ExcelRowCount   :   integer;   //Excel行数
ExcelColCount   :   integer;       //Excel列数
i   :   integer;                             //行变量
j   :   integer;                             //列变量
str   :   String;
WBK   :   OleVariant;
begin


        if   OpenTextFileDialog1.Execute()=false  then
        begin
            showmessage('没有选择目标文件');
        end
        else
        begin
            //导入数据到DBGrid
            stringgrid1.RowCount:=2;

            ExcelApp:=CreateOleObject('Excel.Application');    //建立Excel对象

            WBK   :=   ExcelApp.WorkBooks.Open(OpenTextFileDialog1.FileName);               //打开指定文件
            sheet   :=   ExcelApp.WorkSheets[1];
            ExcelApp.Visible   :=   False;                                                   //不显示Excel
            ExcelRowCount   :=   ExcelApp.WorkSheets[1].UsedRange.Rows.Count;   //行数
            ExcelColCount   :=   ExcelApp.WorkSheets[1].UsedRange.Columns.Count;   //列数
           // showmessage(inttostr(ExcelColCount));
            for   i   :=   3   to   ExcelRowCount   do
            begin
                //  showmessage(inttostr(ExcelRowCount));
                for   j   :=   1   to   stringgrid1.ColCount-1   do
                begin
                    str   :=   sheet.cells[i,j];
                   // showmessage( '第 '+inttostr(i)+ '行,第 '+inttostr(j)+ '列的值为 '+str);
                    stringgrid1.Cells[j-1,i-2]   :=   str;
                end;
                stringgrid1.RowCount   :=   StringGrid1.RowCount   +   1;
            end;
            WBK.Close(SaveChanges   :=   True);
        end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i,j: Integer;
begin

    for i := 1 to StringGrid1.RowCount - 1-1 do
    begin

        ADOQuery2.Close;
        ADOQuery2.SQL.Text:='insert into EtoC values('''
            +stringgrid1.Cells[0,i]+''','''
            +StringReplace(stringgrid1.Cells[1,i],' ','',[rfReplaceAll])+''')';
            try
               ADOQuery2.ExecSQL;

            except
            end;

      end;



end;


procedure TForm1.Button4Click(Sender: TObject);
var
  i: Integer;
begin
with  ADOScore do
begin
      Close;
      sql.Text:=edit1.Text;
      Open;
      for i := 0 to recordcount - 1 do
      begin
           StringGrid1.RowCount:=StringGrid1.RowCount+1;
           StringGrid1.Rows[StringGrid1.RowCount-1].Clear;
        //   StringGrid1.Cells[0,i]:=FieldByName('TypeName').AsString;
           StringGrid1.Cells[1,i]:=FieldByName('ProviderNameC').AsString;
           StringGrid1.Cells[2,i]:=FieldByName('ProviderNameE').AsString;
           StringGrid1.Cells[3,i]:=FieldByName('ShortNameC').AsString;
           StringGrid1.Cells[4,i]:=FieldByName('ShortNameE').AsString;
           Next;
      end;

end;
end;
function TForm1.ExportStrGridToExcel(Args: array of const): Boolean;
var
  iCount, jCount: Integer;
  XLApp: Variant;
  Sheet: Variant;
  I: Integer;
begin
  Result := False;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;

  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Exit;
  end;

  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := High(Args) + 1;

  for I := Low(Args) to High(Args) do
  begin
    with TStringGrid(Args[I].VObject) do
    begin
      XLApp.WorkBooks[1].WorkSheets[I+1].Name := Name;
      Sheet := XLApp.Workbooks[1].WorkSheets[Name];

      for jCount := 0 to RowCount - 1 do
      begin
        for iCount := 0 to ColCount - 1 do
        begin
          Sheet.Cells[jCount + 1, iCount + 1] := Cells[iCount, jCount];
        end;
      end;
    end;
  end;
  XlApp.Visible := True;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
      ExportStrGridToExcel([StringGrid1]);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
        with ADOSPC do
        begin
              Close;
              SQL.Text:=Edit1.Text;
              Open;
        end;
end;

end.
