Imports System.Data.SqlClient
Public Class Seat
    Dim db As New Database
    Public qty As String
    Dim dbcomm As New SqlCommand
    Dim sql As String
    Dim dbread As SqlDataReader
    Public trainid As String
    Public lastid As String
    Public buyer As String
    Public dept As String
    Dim limit As Integer = qty

    'Dim seatid As String
    Private Sub Seat_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        TabControl1.ItemSize = New Size(0, 1)
        TabControl1.SizeMode = TabSizeMode.Fixed

        Dim c As Control
        For Each c In GroupBox1.Controls
            If TypeOf (c) Is PictureBox Then
                AddHandler c.Click, AddressOf PictureBox1_Click
            End If
        Next

        For Each c In GroupBox2.Controls
            If TypeOf (c) Is PictureBox Then
                AddHandler c.Click, AddressOf PictureBox1_Click
            End If
        Next

        limit = qty
        MsgBox("Select " & limit & " Seat")

        db.conn()
        bookedSeat()
    End Sub

    Public Sub bookedSeat()
        sql = "select * from Ticket join Seat on Ticket.SeatID=Seat.SeatID where TrainID='" & trainid & "' and Dept_Date='" & dept & "'"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            While dbread.Read()
                CType(GroupBox1.Controls("PictureBox" & dbread("SeatID")), PictureBox).BackColor = Color.Red
                'CType(GroupBox2.Controls("PictureBox" & dbread("SeatID")), PictureBox).BackColor = Color.Red
            End While
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
            dbread.Close()
        End Try
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs)
        TabControl1.SelectTab(1)
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs)
        TabControl1.SelectTab(0)
    End Sub

    Private Sub PictureBox1_Click(sender As Object, e As EventArgs)
        If limit > 0 Then
            If CType(sender, PictureBox).BackColor = Color.Gray Then
                CType(sender, PictureBox).BackColor = Color.Lime
                limit -= 1
                MsgBox(limit & " seat left")
            ElseIf CType(sender, PictureBox).BackColor = Color.Lime Then
                CType(sender, PictureBox).BackColor = Color.Gray
                limit += 1
                MsgBox(limit & " seat left")
            End If
        End If
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
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

    Private Sub btnSubmitPessenger_Click(sender As Object, e As EventArgs) Handles btnSubmitPessenger.Click
        Dim c As Control
        Dim a As String = (lastid - qty) + 1
        Dim i As Integer
        Dim seatid As String
        Dim label As New Collection
        Dim b As Boolean = False

        'For Each c In GroupBox1.Controls
        '    If TypeOf (c) Is PictureBox Then
        '        If CType(c, PictureBox).BackColor = Color.Lime Then
        '            b = True
        '            Exit Sub
        '        End If
        '    End If
        'Next

        'If b = False Then
        '    MsgBox("Please select seat to book", MsgBoxStyle.Exclamation)
        '    Exit Sub
        'End If

        For Each c In GroupBox1.Controls
            If TypeOf (c) Is PictureBox Then
                If CType(c, PictureBox).BackColor = Color.Lime Then
                    seatid = Mid(CType(c, PictureBox).Name, 11)
                    db.insertTicket(trainid, a, dept, seatid)
                    a += 1
                End If
            End If
        Next

        'db.availableSeat(qty, trainid)

        MsgBox("Booking ticket success", MsgBoxStyle.Information)
        Report.Show()
        Me.Close()
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        lblTimer.Text = lblTimer.Text - 1
        If lblTimer.Text = 0 Then
            lblTimer.Text = 0
            MsgBox("Booking cancel", MsgBoxStyle.Exclamation)
            Me.Close()
        End If
    End Sub
End Class