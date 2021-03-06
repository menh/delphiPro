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
Dim result

Const dataBeginRow As Integer = 7
Const resultBeginRow As Integer = 3
Const resultEmpCodeCol As Integer = 3
Const resultAmtCol As Integer = 5


Sub getJSWYSum()
  Set result = CreateObject("Scripting.Dictionary")
  getDataSource
  writeResult
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
 Dim nRows As Integer

 bFind = False
 For Each sheet In Excel.Application.Sheets
    If (Trim(dataSheet) = Trim(sheet.Name)) Then
       bFind = True
       Exit For
     End If
 Next sheet

 If bFind = False Then
    MsgBox "未找到表(" & dataSheet & ")相关数据"
    Exit Sub
 End If
 nRows = sheet.UsedRange.Rows.Count
 For nRowIndex = dataBeginRow To nRows
    tmpInsuranceName = Trim(sheet.Cells(nRowIndex, insuranceNameCol))
    If (InStr(tmpInsuranceName, aimString)) Then
      tmpEmpCode = Trim(sheet.Cells(nRowIndex, empCodeCol))
      tmpAmt = sheet.Cells(nRowIndex, amtCol)
      If (result.exists(tmpEmpCode)) Then
        result(tmpEmpCode) = result(tmpEmpCode) + tmpAmt
      Else
        result(tmpEmpCode) = tmpAmt
      End If
    End If
  Next nRowIndex


End Sub

Sub writeResult()
  Dim sheet As Worksheet
  Dim bFind As Boolean
  Dim nRowIndex As Integer
  Dim tmpEmpCode As String
  Dim tmpAmt As Double
  Dim nRows As Integer

  bFind = False
  For Each sheet In Excel.Application.Sheets
    If (Trim(aimSheet) = Trim(sheet.Name)) Then
      bFind = True
      Exit For
    End If
  Next sheet

  If bFind = False Then
    MsgBox "未找到表(" & aimSheet & ")相关数据"
    Exit Sub
  End If
  nRows = sheet.UsedRange.Rows.Count
  For nRowIndex = resultBeginRow To nRows
    tmpEmpCode = Trim(sheet.Cells(nRowIndex, resultEmpCodeCol))
    If (result.exists(tmpEmpCode)) Then
      sheet.Cells(nRowIndex, resultAmtCol) = result(tmpEmpCode)
    Else
      sheet.Cells(nRowIndex, resultAmtCol) = 0
    End If
  Next nRowIndex

End Sub
