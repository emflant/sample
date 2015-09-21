Sub 단추3_Click()

    Dim vCur(3) As Currency
    
    vCur(0) = 100000
    vCur(1) = 200000
    vCur(2) = 300000
    vCur(3) = 400000
    vCur(4) = 500000 ' ERROR 3으로 정의하면 0~3 까지 4개 배열생성됨.
    
    MsgBox vCur(3)

End Sub
