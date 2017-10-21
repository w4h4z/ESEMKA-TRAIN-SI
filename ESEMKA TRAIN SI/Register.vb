Imports System.Text

Public Class Register
    Dim db As New Database

    Private Sub Register_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        captcha1()
    End Sub

    Public Sub resetRegister()
        txtName.Text = ""
        txtUsername.Text = ""
        txtPassword.Text = ""
        txtCaptcha.Text = ""
    End Sub

    Public Sub captcha1()
        Dim randomText As New StringBuilder
        Dim alphabet As String = "abcdefghijklmnopqrstuvwxyz1234567890"
        Dim r As New Random
        For j As Integer = 0 To 5
            randomText.Append(alphabet(r.[Next](alphabet.Length)))
        Next
        lblCaptcha.Text = randomText.ToString
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Login_Frm.Show()
        Me.Close()
    End Sub

    Private Sub btnReset_Click(sender As Object, e As EventArgs) Handles btnReset.Click
        resetRegister()
    End Sub

    Private Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        Dim name As String = txtName.Text
        Dim uname As String = txtUsername.Text
        Dim pw As String = txtPassword.Text
        Dim captcha As String = txtCaptcha.Text


        If name = "" Or uname = "" Or pw = "" Or captcha = "" Then
            MsgBox("All data must be fill", MsgBoxStyle.Exclamation)
        Else
            If db.checkUsername(uname) = True Then
                If lblCaptcha.Text = captcha Then
                    Dim role As String = "guest"
                    db.register(name, uname, pw, role)
                    Login_Frm.Show()
                    Me.Close()
                Else
                    MsgBox("Captcha is wrong!", MsgBoxStyle.Exclamation)
                    captcha = ""
                End If
            End If
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        captcha1()
    End Sub
End Class