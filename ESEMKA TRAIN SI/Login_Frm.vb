Public Class Login_Frm
    Dim db As New Database
    Public role As String
    Private Sub Login_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        db.conn()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Me.Close()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim uname As String = TextBox1.Text
        Dim pw As String = TextBox2.Text
        db.login(uname, pw)

        If role = "admin" Then
            Admin.Show()
            Me.Close()
        ElseIf role = "guest"
            Guest.Show()
            Me.Close()
        End If
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Register.Show()
        Me.Close()
    End Sub
End Class
