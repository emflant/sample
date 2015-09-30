Sub 단추2_Click()
    
    ' 일반적인 for 문법
    For i = 1 To 2
    
        For j = 1 To 3
        
            ' 출력
            MsgBox i & " * " & j & " = " & (i * j)
            
            ' 4 이상이면 loop break
            If i * j >= 4 Then
                MsgBox "break = Exit For"
                Exit For
            End If
            
        Next j
        
    Next i

End Sub