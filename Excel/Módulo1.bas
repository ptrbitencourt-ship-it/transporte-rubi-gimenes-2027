Attribute VB_Name = "Módulo1"

Option Explicit

Private Sub txtBusca_Change()

    Dim tbl As ListObject
    Dim termo As String
    Dim colunaNome As Long

    On Error GoTo TrataErro

    Set tbl = Me.ListObjects("tbl_transporte")

    If tbl.DataBodyRange Is Nothing Then Exit Sub

    termo = Trim$(CStr(Me.txtBusca.Value))

    colunaNome = tbl.ListColumns("Nome").Index

    If Len(termo) = 0 Then

        tbl.Range.AutoFilter Field:=colunaNome

    Else

        termo = Replace(termo, "~", "~~")
        termo = Replace(termo, "*", "~*")
        termo = Replace(termo, "?", "~?")

        tbl.Range.AutoFilter _
            Field:=colunaNome, _
            Criteria1:="*" & termo & "*"

    End If

    Exit Sub

TrataErro:

    MsgBox "Erro: " & Err.Description, vbExclamation

End Sub




