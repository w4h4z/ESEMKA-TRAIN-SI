Imports System.Data.SqlClient
Public Class Reserve_Ticket
    Dim dbcomm As New SqlCommand
    Dim dbread As SqlDataReader
    Dim sql As String
    Dim db As New Database
    Public qty As String
    Dim nama As New Collection
    Dim id As New Collection
    Dim phone As New Collection
    Dim lastid As String
    Dim buyer As String
    Public trainid As String
    Public dept As String
    Dim PathFile As String
    Private Sub Reserve_Ticket_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If qty = 1 Then
            Me.Size = New Size(950, 341)
        ElseIf qty = 2
            Me.Size = New Size(950, 491)
            GroupBox3.Visible = True
        ElseIf qty = 3
            Me.Size = New Size(950, 641)
            GroupBox3.Visible = True
            GroupBox4.Visible = True
        ElseIf qty = 4
            Me.Size = New Size(950, 791)
            GroupBox3.Visible = True
            GroupBox4.Visible = True
            GroupBox5.Visible = True
        End If

        nama.Add(txtNameP1)
        nama.Add(txtNameP2)
        nama.Add(txtNameP3)
        nama.Add(txtNameP4)

        id.Add(txtIdP1)
        id.Add(txtIdP2)
        id.Add(txtIdP3)
        id.Add(txtIdP4)

        phone.Add(txtPhoneP1)
        phone.Add(txtPhoneP2)
        phone.Add(txtPhoneP3)
        phone.Add(txtPhoneP4)

        db.conn()
    End Sub

    Private Sub btnSubmitPessenger_Click(sender As Object, e As EventArgs) Handles btnSubmitPessenger.Click
        Dim namab As String = txtNameBuyer.Text
        Dim idb As String = txtIdBuyer.Text
        Dim phoneb As String = txtPhoneBuyer.Text

        If qty = 1 Then
            If txtNameBuyer.Text = "" Or txtIdBuyer.Text = "" Or txtPhoneBuyer.Text = "" Or txtNameP1.Text = "" Or txtIdP1.Text = "" Or txtPhoneP1.Text = "" Then
                MsgBox("All data must be fill", MsgBoxStyle.Exclamation)
                Exit Sub
            End If
        ElseIf qty = 2 Then
            If txtNameBuyer.Text = "" Or txtIdBuyer.Text = "" Or txtPhoneBuyer.Text = "" Or txtNameP1.Text = "" Or txtIdP1.Text = "" Or txtPhoneP1.Text = "" Or txtNameP2.Text = "" Or txtIdP2.Text = "" Or txtPhoneP2.Text = "" Then
                MsgBox("All data must be fill", MsgBoxStyle.Exclamation)
                Exit Sub
            End If
        ElseIf qty = 3 Then
            If txtNameBuyer.Text = "" Or txtIdBuyer.Text = "" Or txtPhoneBuyer.Text = "" Or txtNameP1.Text = "" Or txtIdP1.Text = "" Or txtPhoneP1.Text = "" Or txtNameP2.Text = "" Or txtIdP2.Text = "" Or txtPhoneP2.Text = "" Or txtNameP3.Text = "" Or txtIdP3.Text = "" Or txtPhoneP3.Text = "" Then
                MsgBox("All data must be fill", MsgBoxStyle.Exclamation)
                Exit Sub
            End If
        ElseIf qty = 4 Then
            If txtNameBuyer.Text = "" Or txtIdBuyer.Text = "" Or txtPhoneBuyer.Text = "" Or txtNameP1.Text = "" Or txtIdP1.Text = "" Or txtPhoneP1.Text = "" Or txtNameP2.Text = "" Or txtIdP2.Text = "" Or txtPhoneP2.Text = "" Or txtNameP3.Text = "" Or txtIdP3.Text = "" Or txtPhoneP3.Text = "" Or txtNameP4.Text = "" Or txtIdP4.Text = "" Or txtPhoneP4.Text = "" Then
                MsgBox("All data must be fill", MsgBoxStyle.Exclamation)
                Exit Sub
            End If
        End If

        Dim result As Integer = MessageBox.Show("All the data are true?", "Confirmation", MessageBoxButtons.YesNo)
        If result = DialogResult.Yes Then
            buyer = db.insertBuyer(namab, idb, phoneb)

            Dim i As Integer
            For i = 1 To qty
                lastid = db.insertPessenger(nama(i).text, id(i).text, phone(i).text, buyer, PathFile)
            Next

            Seat.qty = qty
            Seat.dept = dept
            Seat.buyer = buyer
            Seat.lastid = lastid
            Seat.trainid = trainid
            Seat.Show()
            Me.Close()
        End If
    End Sub

    Private Sub txtIdBuyer_KeyPress(sender As Object, e As KeyPressEventArgs) Handles txtPhoneP4.KeyPress, txtPhoneP3.KeyPress, txtPhoneP2.KeyPress, txtPhoneP1.KeyPress, txtPhoneBuyer.KeyPress, txtIdP4.KeyPress, txtIdP3.KeyPress, txtIdP2.KeyPress, txtIdP1.KeyPress, txtIdBuyer.KeyPress
        If Asc(e.KeyChar) <> 8 Then
            If Asc(e.KeyChar) < 48 Or Asc(e.KeyChar) > 57 Then
                e.Handled = True
            End If
        End If
    End Sub

    Private Sub btnCancelPessenger_Click(sender As Object, e As EventArgs) Handles btnCancelPessenger.Click
        Dim a As String = (lastid - qty) + 1

        Dim result As Integer = MessageBox.Show("Are you sure want to cancel?", "Confirmation", MessageBoxButtons.YesNo)
        If result = DialogResult.Yes Then
            Dim i As Integer
            For i = 1 To qty
                db.deletePessenger(a)
                a += 1
            Next

            db.deleteBuyer(buyer)

            Me.Close()
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        OpenFileDialog1.Filter = "JPG Files(*.jpg)|*.jpg|JPEG Files (*.jpeg)|*.jpeg|PNG Files(*.png)|*.png"
        OpenFileDialog1.FileName = ""
        If OpenFileDialog1.ShowDialog = Me.DialogResult.OK Then
            PathFile = OpenFileDialog1.FileName
            PictureBox1.SizeMode = PictureBoxSizeMode.StretchImage
            PictureBox1.ImageLocation = PathFile
        End If
    End Sub
End Class