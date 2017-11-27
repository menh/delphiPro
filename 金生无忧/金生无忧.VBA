Type Item
  empCode As String
  amt As Double
End Type
Const dataSheet As String = "Sheet1"
Const aimSheet As String = "Sheet3"
Const insuranceNameCol As Integer = 14
Const empCodeCol As Integer = 5
Const amtCol As Integer = 15
Const aimString As String = "金生无忧"


Dim dataBeginRow As Integer

Sub getJSWYSum()


End Sub

Sub getDataSource()
  '获取数据
 Dim bFind As Boolean
 Dim sheet As Worksheet
 Dim nColIndex As Integer
 Dim nRowIndex As Integer

 Dim tmpEmpCode As String
 Dim tmpAmt As Double
 Dim tmpInsuranceName As String


 bFind = False
 For Each sheet In Excel.Application.Sheets
    If (Trim(dataSheet) = RTrim(sTableName)) Then
       bFind = True
       Exit For
     End If
  Next sheet
 End Sub

 If bFind = False Then
    MsgBox "未找到表(" & dataSheet & ")相关数据"
    Exit Function
 End If

 For nRowIndex = dataBeginRow To sheet.Rows.Count
    tmpInsuranceName = Trim(sheet.Cells(dataBeginRow, insuranceNameCol))
    If (Trim(sTemp) = "") Then
      Exit For
    End If
    nColCount = nColCount + 1
    arrColNames(nColCount) = sTemp
  Next nColIndex

End Sub


Dim sSqlFileName As String       '用于保存目标ＳＱＬ文件名称
Dim sDeleteSql As String         'delete 语句
Dim sInsertSql As String         'insert 语句

Dim nSheetCount As Integer       '工作表数
Dim nRuleRecord As Integer       '规则记录数
Dim sSaveDir As String           '保存目录名
Dim sInsertSqlPrefix As String   '

Dim sFileDoFlag(2048, 2) As String '最大支持2048个文件生成
Dim nFileCount As Integer        '
Dim nFileIndex As Integer


'定义规则表名称
Const sRuleSheetName = "RULES"
'定义规则表列名
Const sTag_table_name = "TABLE_NAME"   '表名
Const sTag_file_name = "FILE_NAME"     '文件名
Const sTag_Delete_sql = "DELETE_SQL"   '删除语句
Const sInsertSqlPostFix = "); "

'转换一个表格数据为ＳＱＬ
Private Function OneSheet2Sql(sTableName As String, sFileName As String, sTargetDir As String) As String
  On Error GoTo Error_Solve

  Dim sheet As Worksheet
  Dim bFind As Boolean
  Dim sTemp As String

  Dim arrColNames(255) As String '定义列名数组
  Dim nColCount As Integer       '定义列数
  Dim nColIndex As Integer       '列索引



  '查找是否存在相应sheet表，如果不存在，提示错误
  bFind = False
  For Each sheet In Excel.Application.Sheets
     If (Trim(sheet.Name) = RTrim(sTableName)) Then
       bFind = True
       Exit For
     End If
  Next sheet
  If bFind = False Then
    MsgBox "未找到表(" & sTableName & ")相关数据"
    Exit Function
  End If
  '读取删除ＳＱＬ
  sTemp = sheet.Cells(1, 1)
  If (RTrim(sTemp) <> sTag_Delete_sql) Then
    MsgBox "文件格式有误，第一行第一列值应为" & sTag_Delete_sql
    Exit Function
  End If
  sDeleteSql = Trim(sheet.Cells(1, 2))

  '读取字段列表到数组(第二行)
  nColCount = 0
  For nColIndex = 1 To sheet.Columns.Count
    sTemp = Trim(sheet.Cells(2, nColIndex))
    If (Trim(sTemp) = "") Then
      Exit For
    End If
    nColCount = nColCount + 1
    arrColNames(nColCount) = sTemp
  Next nColIndex
  If (nColCount <= 0) Then
    MsgBox "表" & sTableName & "未定义任何列"
    Exit Function
  End If
  '准备好ＩＮＳＥＲＴ前缀
  sInsertSqlPrefix = "INSERT INTO " & RTrim(sTableName) & " ("
  For nColIndex = 1 To nColCount
    If nColIndex = 1 Then
      sInsertSqlPrefix = sInsertSqlPrefix + arrColNames(nColIndex)
    Else
      sInsertSqlPrefix = sInsertSqlPrefix + ", " + arrColNames(nColIndex)
    End If
  Next nColIndex
  sInsertSqlPrefix = sInsertSqlPrefix + ") VALUES ("

  '确定文件打开方式
  Dim bAppend As Boolean
  bAppend = False
  sSqlFileName = sTargetDir + "\" + sFileName
  sTemp = ""
  sTemp = Dir(sSqlFileName)
  Dim Response
  If (sTemp <> "") Then
    '检查对于这种情况，用户的选择
    For nFileIndex = 1 To nFileCount
      If (sFileDoFlag(nFileIndex, 1) = sFileName) Then
        Exit For
      End If
    Next nFileIndex
    If (nFileIndex <= nFileCount) Then     '已经为该文件提醒用户了
      '如果用户已在前面选择不重写文件，后续如需写该文件都将被忽略
      If (sFileDoFlag(nFileIndex, 2) = "No") Then
        MsgBox sTableName & "未作输出"
        Exit Function
      Else
        bAppend = True
      End If



    Else                                   '首次遇到需重写该文件
      '
      Response = MsgBox("是否覆盖已有文件" & sSqlFileName & "?(如果选择No，后续如生成同名文件，将作忽略操作，如选择Yes，后续同名文件采用追加方式)", vbYesNo, "提醒")
      nFileCount = nFileCount + 1
      sFileDoFlag(nFileCount, 1) = sFileName
      If (Response = 7) Then
        sFileDoFlag(nFileCount, 2) = "No"
        MsgBox sTableName & "未作输出"
        Exit Function
      Else
        sFileDoFlag(nFileCount, 2) = "Yes"
      End If
    End If
  '如果不存在，直接生成，并且指示后面追加.
  Else
      nFileCount = nFileCount + 1
      sFileDoFlag(nFileCount, 1) = sFileName
      sFileDoFlag(nFileCount, 2) = "Append"
  End If

  If (bAppend = False) Then
    Open sSqlFileName For Output As #1 ' 打开输出文件。
  Else
    Open sSqlFileName For Append As #1 ' 打开输出文件。
  End If

  If (bAppend = True) Then
    Print #1, ""
  End If


  '输出结果
  If (sDeleteSql <> "") Then
    Print #1, sDeleteSql
  End If

  '进行转换处理，转成SQL语句
  Dim nRowIndex As Integer
  Dim nRows As Integer
  nRows = sheet.UsedRange.Rows.Count
  For nRowIndex = 3 To nRows
   '读列数据
   If Trim(sheet.Cells(nRowIndex, 1)) = "" Then
     GoTo Skip_For
   End If
   sTemp = ""
   For nColIndex = 1 To nColCount
     If (nColIndex = 1) Then
       sTemp = RTrim(sheet.Cells(nRowIndex, nColIndex))
     Else
       sTemp = sTemp + ", " + RTrim(sheet.Cells(nRowIndex, nColIndex))
    End If
   Next nColIndex
   sInsertSql = sInsertSqlPrefix + sTemp + sInsertSqlPostFix
   Print #1, sInsertSql
Skip_For:
  Next nRowIndex
  Close #1 ' 关闭文件
  Exit Function
Error_Solve:
  Close #1 ' 关闭文件
  Exit Function
End Function


Private Sub btSaveSqlFile_Click()
  '初始化变量
  nFileCount = 0
  '获取"编码规则"Sheet
  Dim sheetCodeList As Worksheet
  For Each sheetCodeList In Excel.Application.Sheets
     If (RTrim(sheetCodeList.Name) = sRuleSheetName) Then
       Exit For
     End If
  Next sheetCodeList
  '初始化
  Dim nTableName_Index As Integer
  Dim nFileName_Index As Integer

  Dim nCol As Integer
  Dim sTemp As String

  nTableName_Index = -1
  nFileName_Index = -1
  For nCol = 1 To 10
    sTemp = Trim(sheetCodeList.Cells(1, nCol))
    If sTemp = sTag_table_name Then
      nTableName_Index = nCol
    ElseIf sTemp = sTag_file_name Then
      nFileName_Index = nCol
    End If
  Next nCol
  If nTableName_Index = -1 Or nFileName_Index = -1 Then
    MsgBox sRuleSheetName & "首行列格式定义有误"
    Exit Sub
  End If
  '循环调用
  Dim nRowIndex As Integer
  Dim Rows As Integer
  Dim sTableName As String
  Dim sFileName As String

  nRows = sheetCodeList.UsedRange.Rows.Count
  For nRowIndex = 2 To nRows
    '读列数据
    sTableName = Trim(sheetCodeList.Cells(nRowIndex, nTableName_Index))
    sFileName = Trim(sheetCodeList.Cells(nRowIndex, nFileName_Index))
    If (sTableName <> "") And (sFileName <> "") Then
      OneSheet2Sql sTableName, sFileName, ThisWorkbook.Path
    End If
  Next nRowIndex
End Sub
