Sub 단추1_Click()

    ' 변수선언
    ' Byte, Boolean, Integer, Long, Currency, Single, Double, Decimal(현재 지원 안됨), Date, String(가변 길이)
    Dim vGrade As String
    Dim vScore As Integer
    Dim vResult As VbMsgBoxResult
    
    vResult = MsgBox("123", vbOKCancel, "확인")
    
    ' 결과값 확인.
    MsgBox vResult
    
    ' if 문법
    If VbMsgBoxResult.vbOK = vResult Then
        MsgBox "vbOK...."
    ElseIf VbMsgBoxResult.vbIgnore = vResult Then
        MsgBox "vbIgnore...."
    Else
        MsgBox "etc...."
    End If
    
End Sub