<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Report
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim ReportDataSource1 As Microsoft.Reporting.WinForms.ReportDataSource = New Microsoft.Reporting.WinForms.ReportDataSource()
        Me.View_2BindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.ESEMKATRAINDataSet3 = New ESEMKA_TRAIN_SI.ESEMKATRAINDataSet3()
        Me.ReportViewer1 = New Microsoft.Reporting.WinForms.ReportViewer()
        Me.View_2TableAdapter = New ESEMKA_TRAIN_SI.ESEMKATRAINDataSet3TableAdapters.View_2TableAdapter()
        Me.ESEMKATRAINDataSet8 = New ESEMKA_TRAIN_SI.ESEMKATRAINDataSet8()
        Me.View_4BindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.View_4TableAdapter = New ESEMKA_TRAIN_SI.ESEMKATRAINDataSet8TableAdapters.View_4TableAdapter()
        Me.ESEMKATRAINDataSet9 = New ESEMKA_TRAIN_SI.ESEMKATRAINDataSet9()
        Me.View_5BindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.View_5TableAdapter = New ESEMKA_TRAIN_SI.ESEMKATRAINDataSet9TableAdapters.View_5TableAdapter()
        CType(Me.View_2BindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.ESEMKATRAINDataSet3, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.ESEMKATRAINDataSet8, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.View_4BindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.ESEMKATRAINDataSet9, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.View_5BindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'View_2BindingSource
        '
        Me.View_2BindingSource.DataMember = "View_2"
        Me.View_2BindingSource.DataSource = Me.ESEMKATRAINDataSet3
        '
        'ESEMKATRAINDataSet3
        '
        Me.ESEMKATRAINDataSet3.DataSetName = "ESEMKATRAINDataSet3"
        Me.ESEMKATRAINDataSet3.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'ReportViewer1
        '
        Me.ReportViewer1.Dock = System.Windows.Forms.DockStyle.Fill
        ReportDataSource1.Name = "DataSet1"
        ReportDataSource1.Value = Me.View_5BindingSource
        Me.ReportViewer1.LocalReport.DataSources.Add(ReportDataSource1)
        Me.ReportViewer1.LocalReport.ReportEmbeddedResource = "ESEMKA_TRAIN_SI.Report5.rdlc"
        Me.ReportViewer1.Location = New System.Drawing.Point(0, 0)
        Me.ReportViewer1.Name = "ReportViewer1"
        Me.ReportViewer1.Size = New System.Drawing.Size(1381, 447)
        Me.ReportViewer1.TabIndex = 0
        '
        'View_2TableAdapter
        '
        Me.View_2TableAdapter.ClearBeforeFill = True
        '
        'ESEMKATRAINDataSet8
        '
        Me.ESEMKATRAINDataSet8.DataSetName = "ESEMKATRAINDataSet8"
        Me.ESEMKATRAINDataSet8.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'View_4BindingSource
        '
        Me.View_4BindingSource.DataMember = "View_4"
        Me.View_4BindingSource.DataSource = Me.ESEMKATRAINDataSet8
        '
        'View_4TableAdapter
        '
        Me.View_4TableAdapter.ClearBeforeFill = True
        '
        'ESEMKATRAINDataSet9
        '
        Me.ESEMKATRAINDataSet9.DataSetName = "ESEMKATRAINDataSet9"
        Me.ESEMKATRAINDataSet9.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'View_5BindingSource
        '
        Me.View_5BindingSource.DataMember = "View_5"
        Me.View_5BindingSource.DataSource = Me.ESEMKATRAINDataSet9
        '
        'View_5TableAdapter
        '
        Me.View_5TableAdapter.ClearBeforeFill = True
        '
        'Report
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1381, 447)
        Me.Controls.Add(Me.ReportViewer1)
        Me.Name = "Report"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Ticket"
        CType(Me.View_2BindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.ESEMKATRAINDataSet3, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.ESEMKATRAINDataSet8, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.View_4BindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.ESEMKATRAINDataSet9, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.View_5BindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents ReportViewer1 As Microsoft.Reporting.WinForms.ReportViewer
    Friend WithEvents View_2BindingSource As BindingSource
    Friend WithEvents ESEMKATRAINDataSet3 As ESEMKATRAINDataSet3
    Friend WithEvents View_2TableAdapter As ESEMKATRAINDataSet3TableAdapters.View_2TableAdapter
    Friend WithEvents View_4BindingSource As BindingSource
    Friend WithEvents ESEMKATRAINDataSet8 As ESEMKATRAINDataSet8
    Friend WithEvents View_4TableAdapter As ESEMKATRAINDataSet8TableAdapters.View_4TableAdapter
    Friend WithEvents View_5BindingSource As BindingSource
    Friend WithEvents ESEMKATRAINDataSet9 As ESEMKATRAINDataSet9
    Friend WithEvents View_5TableAdapter As ESEMKATRAINDataSet9TableAdapters.View_5TableAdapter
End Class
