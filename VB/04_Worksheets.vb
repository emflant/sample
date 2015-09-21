Sub 단추4_Click()

    ' 워크시트 인덱스 번호는 통합 문서의 탭 표시줄에서 워크시트의 위치를 가리킵니다.
    ' Worksheets(1)은 통합 문서의 첫 번째(맨 왼쪽) 워크시트이고 Worksheets(Worksheets.Count)는 마지막 워크시트입니다.
    ' 숨겨진 워크시트를 포함하여 모든 워크시트가 인덱스 개수에 포함됩니다.
    ' Worksheets(1).Visible = False
    ' Worksheets.Item(1).Visible = False ' 위와 같은 의미임.
    
    MsgBox "Worksheets.Count = " & Worksheets.Count
    
    Dim vSheet As Worksheet
    
    'Set vSheet = Worksheets.Item(Worksheets.Count)
    Set vSheet = Worksheets.Item("Sheet2")
    
    ' 마지막 sheet 가 숨겨져 있으면 보이게 한다.
    If vSheet.Visible = False Then
        vSheet.Visible = True
    Else
        vSheet.Visible = False
    End If
    
    ' 개체를 해제합니다.
    Set vSheet = Nothing
    
    ' MsgBox "vSheet.Visible = " & vSheet.Visible
    
End Sub