Imports System.Data.SqlClient
Public Class Database
    Public dbconn As New SqlConnection
    Public dbcomm As New SqlCommand
    Public dbread As SqlDataReader
    Public sql As String
    Public lastid As String
    Public Function conn()
        dbconn = New SqlConnection("data source=.\SQLEXPRESS;database=ESEMKATRAIN;integrated security=true")

        Try
            dbconn.Open()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Return dbconn
    End Function

    Public Function crud(sql)
        Try
            dbcomm = New SqlCommand(sql, conn)
            dbread = dbcomm.ExecuteReader
            dbread.Read()
            Return dbread
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
            dbread.Close()
        End Try
    End Function

    Public Function crudid(sql)
        Try
            dbcomm = New SqlCommand(sql, conn)
            lastid = dbcomm.ExecuteScalar
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Return lastid
    End Function

    Public Function login(uname, pw)
        sql = "select * from [dbo].[User] where Username='" & uname & "' and Password='" & pw & "'"

        crud(sql)
        If dbread.HasRows Then
            MsgBox("Login Success", MsgBoxStyle.Information)
            Login_Frm.role = dbread("Role")
            dbread.Close()
        Else
            MsgBox("Login Failed, check your username and password", MsgBoxStyle.Exclamation)
            dbread.Close()
        End If
    End Function

    Public Function register(name, uname, pw, role)
        sql = "insert into [dbo].[User](Name,Username,Password,Role) values('" & name & "','" & uname & "','" & pw & "','" & role & "')"

        crud(sql)
        MsgBox("Register Success, please login", MsgBoxStyle.Information)
        dbread.Close()
    End Function

    Public Function checkUsername(uname)
        Dim b As Boolean
        sql = "select Username from [dbo].[User] where Username='" & uname & "'"

        crud(sql)
        If dbread.HasRows() Then
            MsgBox("Username already available!", MsgBoxStyle.Exclamation)
            b = False
            dbread.Close()
        Else
            b = True
        End If

        Return b
    End Function

    Public Function insertTrain(name, r1, r2, dept, arriv, tclass, price)
        sql = "insert into Train(Train_Name,Route1,Route2,Dept_Time,Arriv_Time,Train_Class,Ticket_Price,Total_Seat) values('" & name & "','" & r1 & "','" & r2 & "','" & dept & "','" & arriv & "','" & tclass & "','" & price & "',80)"

        crud(sql)
        MsgBox("Insert data success", MsgBoxStyle.Information)
        dbread.Close()
    End Function

    Public Function deleteTrain(TrainId)
        sql = "delete Train where TrainID='" & TrainId & "'"

        crud(sql)
        MsgBox("Delete data success", MsgBoxStyle.Information)
        dbread.Close()
    End Function

    Public Function updateTrain(name, r1, r2, dept, arriv, tclass, price, trainid)
        sql = "update Train set Train_Name='" & name & "', Route1='" & r1 & "', Route2='" & r2 & "', Dept_Time='" & dept & "', Arriv_Time='" & arriv & "',Train_Class='" & tclass & "',Ticket_Price='" & price & "' where TrainID='" & trainid & "'"

        crud(sql)
        MsgBox("Update data success", MsgBoxStyle.Information)
        dbread.Close()
    End Function

    Public Function insertBuyer(nama, id, phone)
        sql = "insert into Buyer(Name_Buyer,ID_Number,Phone_Number) output inserted.BuyerID values('" & nama & "','" & id & "','" & phone & "')"

        crudid(sql)

        Return lastid
    End Function

    Public Function insertPessenger(nama, id, phone, buyer, address)
        sql = "insert into Pessenger(Name,ID_Number,Phone_Number,BuyerID,Image) output inserted.PessengerID values('" & nama & "','" & id & "','" & phone & "','" & buyer & "','" & address & "')"

        crudid(sql)

        Return lastid
    End Function

    Public Function deleteBuyer(buyer)
        sql = "delete Buyer where BuyerID='" & buyer & "'"

        crud(sql)
        dbread.Close()
    End Function

    Public Function deletePessenger(pessenger)
        sql = "delete Pessenger where PessengerID='" & pessenger & "'"

        crud(sql)
        dbread.Close()
    End Function

    Public Function insertTicket(tid, pid, dept, sid)
        sql = "insert into Ticket(TrainID,PessengerID,Dept_Date,SeatID) values('" & tid & "','" & pid & "','" & dept & "','" & sid & "')"

        crud(sql)
        dbread.Close()
    End Function

    'Public Function availableSeat(seat, tid)
    '    sql = "update Train set Available_Seat=Available_seat-" & seat & " where TrainID='" & tid & "'"

    '    crud(sql)
    '    dbread.Close()
    'End Function

End Class
