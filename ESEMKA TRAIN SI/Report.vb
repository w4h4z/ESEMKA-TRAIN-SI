Public Class Report
    Private Sub Ticket_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'ESEMKATRAINDataSet9.View_5' table. You can move, or remove it, as needed.
        Me.View_5TableAdapter.Fill(Me.ESEMKATRAINDataSet9.View_5)
        'TODO: This line of code loads data into the 'ESEMKATRAINDataSet8.View_4' table. You can move, or remove it, as needed.
        Me.View_4TableAdapter.Fill(Me.ESEMKATRAINDataSet8.View_4)
        'TODO: This line of code loads data into the 'ESEMKATRAINDataSet3.View_2' table. You can move, or remove it, as needed.
        Me.View_2TableAdapter.Fill(Me.ESEMKATRAINDataSet3.View_2)

        Me.ReportViewer1.RefreshReport()
    End Sub
End Class