Imports System.Data.SqlClient
Imports System
Imports System.Drawing
Imports System.IO
Imports System.Drawing.Printing
Imports System.Windows.Forms

Public Class Admin
    Dim db As New Database
    Dim dbread As SqlDataReader
    Dim dbcomm As New SqlCommand
    Dim sql As String
    Dim PathFile As String
    Private stringToPrint As String = "Wahaz" + vbNewLine + "Rizaldi"
    Dim available As String = 80

    Private Sub Admin_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'ESEMKATRAINDataSet15.View_6' table. You can move, or remove it, as needed.
        Me.View_6TableAdapter.Fill(Me.ESEMKATRAINDataSet15.View_6)
        'TODO: This line of code loads data into the 'ESEMKATRAINDataSet14.Schedule' table. You can move, or remove it, as needed.
        'Me.ScheduleTableAdapter.Fill(Me.ESEMKATRAINDataSet14.Schedule)
        'TODO: This line of code loads data into the 'ESEMKATRAINDataSet12.City' table. You can move, or remove it, as needed.
        Me.CityTableAdapter.Fill(Me.ESEMKATRAINDataSet12.City)
        'TODO: This line of code loads data into the 'ESEMKATRAINDataSet8.View_4' table. You can move, or remove it, as needed.
        Me.View_4TableAdapter.Fill(Me.ESEMKATRAINDataSet8.View_4)
        'TODO: This line of code loads data into the 'ESEMKATRAINDataSet7.View_3' table. You can move, or remove it, as needed.
        Me.View_3TableAdapter1.Fill(Me.ESEMKATRAINDataSet7.View_3)
        'TODO: This line of code loads data into the 'ESEMKATRAINDataSet5.View_3' table. You can move, or remove it, as needed.
        Me.View_3TableAdapter.Fill(Me.ESEMKATRAINDataSet5.View_3)
        'TODO: This line of code loads data into the 'ESEMKATRAINDataSet2.Train' table. You can move, or remove it, as needed.
        'Me.TrainTableAdapter1.Fill(Me.ESEMKATRAINDataSet2.Train)
        'TODO: This line of code loads data into the 'ESEMKATRAINDataSet1.View_1' table. You can move, or remove it, as needed.
        Me.View_1TableAdapter.Fill(Me.ESEMKATRAINDataSet1.View_1)
        'TODO: This line of code loads data into the 'ESEMKATRAINDataSet.Train' table. You can move, or remove it, as needed.
        Me.TrainTableAdapter.Fill(Me.ESEMKATRAINDataSet.Train)

        TabControl1.ItemSize = New Size(0, 1)
        TabControl1.SizeMode = TabSizeMode.Fixed
        TabControl1.SelectTab(0)

        db.conn()
        Me.ReportViewer1.RefreshReport()
    End Sub

    Public Sub availableSeat()
        Dim r1 As String = cbOriginTicket.SelectedValue
        Dim r2 As String = cbDestTicket.SelectedValue
        sql = "select (80-count(*) over()) as Available from Ticket as t join Train as tr on t.TrainID=tr.TrainID where Route1='" & r1 & "' and Route2='" & r2 & "' and Dept_Date='" & DateTimePicker1.Value.ToString("yyyy/MM/dd") & "'"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            If dbread.Read() Then
                If dbread("Available") IsNot Nothing Then
                    available = dbread("Available")
                End If
            Else
                available = 80
            End If
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
            dbread.Close()
        End Try
    End Sub

    Public Sub ticket()
        availableSeat()
        DataGridView2.Rows.Clear()
        Dim r1 As String = cbOriginTicket.SelectedValue
        Dim r2 As String = cbDestTicket.SelectedValue

        sql = "select * from Train where Route1='" & r1 & "' and Route2='" & r2 & "'"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            If dbread.HasRows() Then
                While dbread.Read()
                    DataGridView2.Rows.Add(dbread("TrainID"), dbread("Train_Name"), dbread("Route1"), dbread("Route2"), dbread("Dept_Time"), dbread("Arriv_Time"), dbread("Train_Class"), dbread("Ticket_Price"), available)
                End While
            Else
                MsgBox("Data not found!", MsgBoxStyle.Exclamation)
            End If
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
            dbread.Close()
        End Try
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        TabControl1.SelectTab(0)
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        TabControl1.SelectTab(1)
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        TabControl1.SelectTab(2)
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        TabControl1.SelectTab(3)
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Login_Frm.Show()
        Me.Close()
    End Sub

    Public Sub resetTrain()
        txtIdTrain.Text = ""
        txtNameTrain.Text = ""
        txtDeptTrain.Text = ""
        txtArrivTrain.Text = ""
        cbClassTrain.SelectedIndex = -1
        cbClassTrain.Text = "Select"
        txtPriceTrain.Text = ""
    End Sub

    Private Sub btnInsertTrain_Click(sender As Object, e As EventArgs) Handles btnInsertTrain.Click
        Dim name1 As String = txtNameTrain.Text
        Dim origin As String = cbOriginTicket.SelectedValue
        Dim dest As String = cbDestTicket.SelectedValue
        Dim dept As String = txtDeptTrain.Text
        Dim arriv As String = txtArrivTrain.Text
        Dim tclass As String = cbClassTrain.Text
        Dim price As String = txtPriceTrain.Text
        If name1 = "" Or origin = "" Or arriv = "" Or tclass = "Select" Or price = "" Then
            MsgBox("All data must be fill", MsgBoxStyle.Exclamation)
            Exit Sub
        End If
        db.insertTrain(name1, origin, dest, dept, arriv, tclass, price)
        Me.TrainTableAdapter.Fill(Me.ESEMKATRAINDataSet.Train)
    End Sub

    Private Sub btnUpdateTrain_Click(sender As Object, e As EventArgs) Handles btnUpdateTrain.Click
        Dim trainid As String = txtIdTrain.Text
        Dim name1 As String = txtNameTrain.Text
        Dim origin As String = cbOriginTicket.SelectedValue
        Dim dest As String = cbDestTicket.SelectedValue
        Dim dept As String = txtDeptTrain.Text
        Dim arriv As String = txtArrivTrain.Text
        Dim tclass As String = cbClassTrain.Text
        Dim price As String = txtPriceTrain.Text
        If trainid = "" Then
            MsgBox("Select data first", MsgBoxStyle.Exclamation)
            Exit Sub
        End If
        db.updateTrain(name1, origin, dest, dept, arriv, tclass, price, trainid)
        Me.TrainTableAdapter.Fill(Me.ESEMKATRAINDataSet.Train)
    End Sub

    Private Sub btnDeleteTrain_Click(sender As Object, e As EventArgs) Handles btnDeleteTrain.Click
        Dim trainid As String = txtIdTrain.Text
        If trainid = "" Then
            MsgBox("Select data first", MsgBoxStyle.Exclamation)
            Exit Sub
        End If
        db.deleteTrain(trainid)
        Me.TrainTableAdapter.Fill(Me.ESEMKATRAINDataSet.Train)
    End Sub

    Private Sub btnResetTrain_Click(sender As Object, e As EventArgs) Handles btnResetTrain.Click
        resetTrain()
    End Sub

    Private Sub btnSearchTicket_Click(sender As Object, e As EventArgs) Handles btnSearchTicket.Click
        If cbQtyTicket.Text = "Select" Then
            MsgBox("Select Quantity First!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If
        ticket()
    End Sub

    Private Sub DataGridView2_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView2.CellClick
        Dim i As Integer = DataGridView2.CurrentRow.Index

        If e.ColumnIndex = 9 Then
            If DataGridView2.Item(8, i).Value - cbQtyTicket.Text < 0 Then
                MsgBox("Seats are full for that Quantity", MsgBoxStyle.Exclamation)
                Exit Sub
            Else
                Reserve_Ticket.dept = DateTimePicker1.Value.ToString("yyyy/MM/dd")
                Reserve_Ticket.qty = cbQtyTicket.Text
                Reserve_Ticket.trainid = DataGridView2.Item(0, i).Value
                Reserve_Ticket.Show()
            End If
        End If
    End Sub

    Private Sub btnSelectPath_Click(sender As Object, e As EventArgs) Handles btnSelectPathTrain.Click
        SaveFileDialog1.Filter = "CSV Files(*.csv)|*.csv"
        If SaveFileDialog1.ShowDialog = Me.DialogResult.OK Then
            PathFile = SaveFileDialog1.FileName
            txtNameExportTrain.Text = PathFile.Substring(PathFile.LastIndexOf("\") + 1)
            txtAddressExportTrain.Text = SaveFileDialog1.FileName
        End If
        exportTrain()
    End Sub

    Public Sub exportTrain()
        If txtAddressExportTrain.Text = "" Or txtNameExportTrain.Text = "" Then
            MsgBox("Select path file!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If
        Dim address As String = txtAddressExportTrain.Text
        Dim headers = (From header As DataGridViewColumn In DataGridView1.Columns.Cast(Of DataGridViewColumn)()
                       Select header.HeaderText).ToArray
        Dim rows = From row As DataGridViewRow In DataGridView1.Rows.Cast(Of DataGridViewRow)()
                   Where Not row.IsNewRow
                   Select Array.ConvertAll(row.Cells.Cast(Of DataGridViewCell).ToArray, Function(c) If(c.Value IsNot Nothing, c.Value.ToString, ""))
        Using sw As New IO.StreamWriter(address)
            sw.WriteLine(String.Join(",", headers))
            For Each r In rows
                sw.WriteLine(String.Join(",", r))
            Next
        End Using
        MsgBox("Export to CSV Success", MsgBoxStyle.Information)
        Process.Start(address)
    End Sub

    Private Sub PrintPreviewDialog1_Load(sender As Object, e As EventArgs) Handles PrintPreviewDialog1.Load

    End Sub

    Private Sub PrintDocument1_PrintPage(sender As Object, e As PrintPageEventArgs) Handles PrintDocument1.PrintPage
        'Dim charactersOnPage As Integer = 0
        'Dim linesPerPage As Integer = 0

        '' Sets the value of charactersOnPage to the number of characters 
        '' of stringToPrint that will fit within the bounds of the page.
        'e.Graphics.MeasureString(stringToPrint, Me.Font, e.MarginBounds.Size,
        '    StringFormat.GenericTypographic, charactersOnPage, linesPerPage)

        'Dim pen As New Pen(Color.Black)

        'e.Graphics.DrawLine(pen, e.MarginBounds.Width, 75, e.PageSettings.PaperSize.Width - e.MarginBounds.Width, 75)

        '' Draws the string within the bounds of the page.
        'e.Graphics.DrawString(stringToPrint, Me.Font, Brushes.Black,
        '    e.MarginBounds, StringFormat.GenericTypographic)

        '' Remove the portion of the string that has been printed.
        'stringToPrint = stringToPrint.Substring(charactersOnPage)

        '' Check to see if more pages are to be printed.
        'e.HasMorePages = stringToPrint.Length > 0

        '' If there are no more pages, reset the string to be printed.
        'If Not e.HasMorePages Then
        '    'stringToPrint = documentContents
        'End If
        Dim bm As New Bitmap(Me.DataGridView1.Width, Me.DataGridView1.Height)
        DataGridView1.DrawToBitmap(bm, New Rectangle(0, 0, Me.DataGridView1.Width, Me.DataGridView1.Height))
        e.Graphics.DrawImage(bm, 0, 0)
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        PrintPreviewDialog1.Document = PrintDocument1
        PrintPreviewDialog1.ShowDialog()
    End Sub

    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        OpenFileDialog1.Filter = "CSV Files(*.csv)|*.csv"
        If OpenFileDialog1.ShowDialog = Me.DialogResult.OK Then
            PathFile = OpenFileDialog1.FileName
            TextBox1.Text = PathFile.Substring(PathFile.LastIndexOf("\") + 1)
            TextBox2.Text = OpenFileDialog1.FileName
        End If
        setDatagrid()
    End Sub

    Public Sub setDatagrid()
        Dim sr As New IO.StreamReader(TextBox2.Text)
        Dim dt As New DataTable
        Dim newline() As String = sr.ReadLine.Split(","c)
        dt.Columns.AddRange({New DataColumn(newline(0)),
                             New DataColumn(newline(1)),
                            New DataColumn(newline(2)),
                            New DataColumn(newline(3)),
                            New DataColumn(newline(4)),
                            New DataColumn(newline(5)),
                            New DataColumn(newline(6)),
                            New DataColumn(newline(7))})
        While (Not sr.EndOfStream)
            newline = sr.ReadLine.Split(","c)
            Dim newrow As DataRow = dt.NewRow
            newrow.ItemArray = {newline(0), newline(1), newline(2), newline(3), newline(4), newline(5), newline(6), newline(7)}
            dt.Rows.Add(newrow)
        End While
        DataGridView3.DataSource = dt
    End Sub

    Private Sub Button9_Click(sender As Object, e As EventArgs) Handles Button9.Click
        For i As Integer = 0 To DataGridView3.Rows.Count - 1
            Dim nama As String = DataGridView3.Rows(i).Cells(1).Value
            Dim r1 As String = DataGridView3.Rows(i).Cells(2).Value
            Dim r2 As String = DataGridView3.Rows(i).Cells(3).Value
            Dim dept As String = DataGridView3.Rows(i).Cells(4).Value
            Dim arriv As String = DataGridView3.Rows(i).Cells(5).Value
            Dim clas As String = DataGridView3.Rows(i).Cells(6).Value
            Dim price As String = DataGridView3.Rows(i).Cells(7).Value

            sql = "insert into Train(Train_Name,Route1,Route2,Dept_Time,Arriv_Time,Train_Class,Ticket_Price) values('" & nama & "','" & r1 & "','" & r2 & "','" & dept & "','" & arriv & "','" & clas & "','" & price & "')"

            Try
                dbcomm = New SqlCommand(sql, db.conn)
                dbread = dbcomm.ExecuteReader
                dbread.Close()
            Catch ex As Exception
                MsgBox(ex.Message, MsgBoxStyle.Critical)
                dbread.Close()
            End Try
        Next

        MsgBox("Insert data success", MsgBoxStyle.Information)
    End Sub

    Private Sub Button10_Click(sender As Object, e As EventArgs) Handles Button10.Click
        TabControl1.SelectTab(4)
    End Sub

    Private Sub Button12_Click(sender As Object, e As EventArgs) Handles Button12.Click
        PrintPreviewControl1.AutoZoom = True
    End Sub

    Private Sub Button13_Click(sender As Object, e As EventArgs) Handles Button13.Click
        PrintPreviewControl1.Zoom = 1.2
    End Sub

    Private Sub Button14_Click(sender As Object, e As EventArgs)
        PrintPreviewControl1.Document = PrintDocument1
    End Sub

    Private Sub DataGridView1_CellMouseClick_1(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridView1.CellMouseClick
        Dim i As Integer = DataGridView1.CurrentRow.Index
        txtIdTrain.Text = DataGridView1.Item(0, i).Value
        txtNameTrain.Text = DataGridView1.Item(1, i).Value
        txtDeptTrain.Text = DataGridView1.Item(4, i).Value
        txtArrivTrain.Text = DataGridView1.Item(5, i).Value
        cbClassTrain.Text = DataGridView1.Item(6, i).Value
        txtPriceTrain.Text = DataGridView1.Item(7, i).Value
    End Sub
End Class