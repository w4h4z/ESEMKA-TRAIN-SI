Imports System.Data.SqlClient
Public Class Guest
    Dim db As New Database
    Dim dbcomm As New SqlCommand
    Dim sql As String
    Dim dbread As SqlDataReader
    Dim address As String
    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        TabControl1.SelectTab(2)
    End Sub

    Private Sub Guest_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'ESEMKATRAINDataSet14.Schedule' table. You can move, or remove it, as needed.
        Me.ScheduleTableAdapter.Fill(Me.ESEMKATRAINDataSet14.Schedule)
        Me.TrainTableAdapter.Fill(Me.ESEMKATRAINDataSet.Train)
        TabControl1.ItemSize = New Size(0, 1)
        TabControl1.SizeMode = TabSizeMode.Fixed

        db.conn()
        dataBoarding()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Login_Frm.Show()
        Me.Close()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        TabControl1.SelectTab(0)
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        TabControl1.SelectTab(1)
    End Sub

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        sql = "select * from Ticket as t join Train as tr on t.TrainID=tr.TrainID join Pessenger as p on t.PessengerID=p.PessengerID where TicketID='" & txtBoarding.Text & "'"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            dbread.Read()
            If dbread.HasRows Then
                txtIdBoarding.Text = dbread("TicketID")
                txtNameBoarding.Text = dbread("Name")
                txtNumberBoarding.Text = dbread("ID_Number")
                txtTrainBoarding.Text = dbread("Train_Name")
                txtOriginBoarding.Text = dbread("Route1")
                txtDestBoarding.Text = dbread("Route2")
                txtDeptBoarding.Text = dbread("Dept_Time")
                txtArrivBoarding.Text = dbread("Arriv_Time")
                txtClassBoarding.Text = dbread("Train_Class")
                PictureBox1.ImageLocation = dbread("Image")
                PictureBox1.SizeMode = PictureBoxSizeMode.StretchImage
            Else
                MsgBox("Data not found!", MsgBoxStyle.Exclamation)
            End If
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
            dbread.Close()
        End Try
    End Sub

    Public Sub resetBoarding()
        txtIdBoarding.Text = ""
        txtNameBoarding.Text = ""
        txtNumberBoarding.Text = ""
        txtTrainBoarding.Text = ""
        txtOriginBoarding.Text = ""
        txtDestBoarding.Text = ""
        txtDeptBoarding.Text = ""
        txtArrivBoarding.Text = ""
        txtClassBoarding.Text = ""
        txtBoarding.Text = ""
    End Sub

    Private Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        resetBoarding()
    End Sub

    Public Sub dataBoarding()
        DataGridView4.Rows.Clear()
        sql = "select * from Ticket as t join Train as tr on t.TrainID=tr.TrainID join Pessenger as p on t.PessengerID=p.PessengerID"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            While dbread.Read()
                DataGridView4.Rows.Add(dbread("TicketID"), dbread("Name"), dbread("ID_Number"), dbread("Phone_Number"), dbread("Route1"), dbread("Route2"), dbread("Dept_Date").toshortdatestring, dbread("Train_Name"), dbread("Train_Class"), dbread("Dept_Time"), dbread("Arriv_Time"), dbread("Ticket_Price"), dbread("Status"))
            End While
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
            dbread.Close()
        End Try
    End Sub

    Private Sub btnCheckIn_Click(sender As Object, e As EventArgs) Handles btnCheckIn.Click
        sql = "update Ticket set Status='Checked In' where TicketID='" & txtIdBoarding.Text & "'"

        If txtBoarding.Text = "" Then
            MsgBox("Search Ticket ID first", MsgBoxStyle.Exclamation)
            Exit Sub
        End If

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            MsgBox("Check In success", MsgBoxStyle.Information)
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
            dbread.Close()
        End Try
        dataBoarding()
        resetBoarding()
    End Sub
End Class