USE [master]
GO
/****** Object:  Database [ESEMKATRAIN]    Script Date: 02/10/2017 14:51:56 ******/
CREATE DATABASE [ESEMKATRAIN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ESEMKATRAIN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ESEMKATRAIN.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ESEMKATRAIN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ESEMKATRAIN_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ESEMKATRAIN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ESEMKATRAIN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET ARITHABORT OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ESEMKATRAIN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ESEMKATRAIN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ESEMKATRAIN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ESEMKATRAIN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ESEMKATRAIN] SET  MULTI_USER 
GO
ALTER DATABASE [ESEMKATRAIN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ESEMKATRAIN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ESEMKATRAIN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ESEMKATRAIN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ESEMKATRAIN] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ESEMKATRAIN]
GO
/****** Object:  Table [dbo].[Buyer]    Script Date: 02/10/2017 14:51:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buyer](
	[BuyerID] [int] IDENTITY(1,1) NOT NULL,
	[Name_Buyer] [varchar](50) NOT NULL,
	[ID_Number] [varchar](50) NOT NULL,
	[Phone_Number] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Buyer] PRIMARY KEY CLUSTERED 
(
	[BuyerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 02/10/2017 14:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[Name_City] [varchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pessenger]    Script Date: 02/10/2017 14:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessenger](
	[PessengerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ID_Number] [int] NOT NULL,
	[Phone_Number] [int] NOT NULL,
	[BuyerID] [int] NOT NULL,
	[Image] [text] NULL,
 CONSTRAINT [PK_Pessenger] PRIMARY KEY CLUSTERED 
(
	[PessengerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seat]    Script Date: 02/10/2017 14:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seat](
	[SeatID] [int] IDENTITY(1,1) NOT NULL,
	[Row] [varchar](50) NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_Seat] PRIMARY KEY CLUSTERED 
(
	[SeatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 02/10/2017 14:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[TrainID] [int] NOT NULL,
	[PessengerID] [int] NOT NULL,
	[Dept_Date] [date] NOT NULL,
	[SeatID] [int] NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Train]    Script Date: 02/10/2017 14:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Train](
	[TrainID] [int] IDENTITY(1,1) NOT NULL,
	[Train_Name] [varchar](50) NOT NULL,
	[Route1] [int] NOT NULL,
	[Route2] [int] NOT NULL,
	[Dept_Time] [varchar](50) NOT NULL,
	[Arriv_Time] [varchar](50) NOT NULL,
	[Train_Class] [varchar](50) NOT NULL,
	[Ticket_Price] [int] NOT NULL,
	[Total_Seat] [int] NOT NULL,
 CONSTRAINT [PK_Train] PRIMARY KEY CLUSTERED 
(
	[TrainID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 02/10/2017 14:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Schedule]    Script Date: 02/10/2017 14:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Schedule]
AS
SELECT        t.Train_Name, c.Name_City AS Origin_Route, ci.Name_City AS Destination_Route, t.Dept_Time, t.Arriv_Time, t.Train_Class
FROM            dbo.Train AS t INNER JOIN
                         dbo.City AS c ON t.Route1 = c.CityID INNER JOIN
                         dbo.City AS ci ON t.Route2 = ci.CityID

GO
/****** Object:  View [dbo].[View_1]    Script Date: 02/10/2017 14:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Ticket.TicketID, dbo.Ticket.TrainID, dbo.Ticket.PessengerID, dbo.Ticket.Dept_Date, dbo.Ticket.SeatID, dbo.Ticket.Status, dbo.Seat.SeatID AS Expr1, dbo.Seat.Row, dbo.Seat.Number, 
                         dbo.Train.TrainID AS Expr2, dbo.Train.Train_Name, dbo.Train.Route1, dbo.Train.Route2, dbo.Train.Dept_Time, dbo.Train.Arriv_Time, dbo.Train.Train_Class, dbo.Train.Ticket_Price, dbo.Buyer.BuyerID, 
                         dbo.Buyer.Name_Buyer, dbo.Buyer.ID_Number, dbo.Buyer.Phone_Number
FROM            dbo.Ticket INNER JOIN
                         dbo.Seat ON dbo.Ticket.SeatID = dbo.Seat.SeatID INNER JOIN
                         dbo.Train ON dbo.Ticket.TrainID = dbo.Train.TrainID CROSS JOIN
                         dbo.Buyer

GO
/****** Object:  View [dbo].[View_2]    Script Date: 02/10/2017 14:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        dbo.Buyer.Name_Buyer, dbo.Buyer.ID_Number, dbo.Buyer.Phone_Number, dbo.Pessenger.Name, dbo.Pessenger.Phone_Number AS PhoneNumber, dbo.Ticket.TicketID, dbo.Ticket.Dept_Date, dbo.Seat.Row, 
                         dbo.Seat.Number, dbo.Train.Train_Name, dbo.Train.Route1 AS OriginRoute, dbo.Train.Route2 AS DestinationRoute, dbo.Train.Dept_Time, dbo.Train.Arriv_Time, dbo.Train.Train_Class, dbo.Train.Ticket_Price
FROM            dbo.Buyer INNER JOIN
                         dbo.Pessenger ON dbo.Buyer.BuyerID = dbo.Pessenger.BuyerID INNER JOIN
                         dbo.Ticket ON dbo.Pessenger.PessengerID = dbo.Ticket.PessengerID INNER JOIN
                         dbo.Seat ON dbo.Ticket.SeatID = dbo.Seat.SeatID INNER JOIN
                         dbo.Train ON dbo.Ticket.TrainID = dbo.Train.TrainID
WHERE        (dbo.Buyer.BuyerID =
                             (SELECT        MAX(BuyerID) AS Expr1
                               FROM            dbo.Buyer AS Buyer_1))

GO
/****** Object:  View [dbo].[View_3]    Script Date: 02/10/2017 14:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_3]
AS
SELECT        dbo.Buyer.Name_Buyer, dbo.Buyer.ID_Number, dbo.Buyer.Phone_Number, dbo.Pessenger.Name, dbo.Pessenger.Phone_Number AS PhoneNumber, dbo.Ticket.TicketID, dbo.Ticket.Dept_Date, dbo.Seat.Row, 
                         dbo.Seat.Number, dbo.Train.Train_Name, dbo.Train.Route1 AS OriginRoute, dbo.Train.Route2 AS DestinationRoute, dbo.Train.Dept_Time, dbo.Train.Arriv_Time, dbo.Train.Train_Class, dbo.Train.Ticket_Price
FROM            dbo.Buyer INNER JOIN
                         dbo.Pessenger ON dbo.Buyer.BuyerID = dbo.Pessenger.BuyerID INNER JOIN
                         dbo.Ticket ON dbo.Pessenger.PessengerID = dbo.Ticket.PessengerID INNER JOIN
                         dbo.Seat ON dbo.Ticket.SeatID = dbo.Seat.SeatID INNER JOIN
                         dbo.Train ON dbo.Ticket.TrainID = dbo.Train.TrainID

GO
/****** Object:  View [dbo].[View_4]    Script Date: 02/10/2017 14:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_4]
AS
SELECT        dbo.Buyer.Name_Buyer, dbo.Buyer.ID_Number, dbo.Buyer.Phone_Number, dbo.Pessenger.Name, dbo.Pessenger.Phone_Number AS PhoneNumber, dbo.Ticket.TicketID, dbo.Ticket.Dept_Date, dbo.Seat.Row, 
                         dbo.Seat.Number, dbo.Train.Train_Name, dbo.Train.Route1 AS OriginRoute, dbo.Train.Route2 AS DestinationRoute, dbo.Train.Dept_Time, dbo.Train.Arriv_Time, dbo.Train.Train_Class, dbo.Train.Ticket_Price
FROM            dbo.Buyer INNER JOIN
                         dbo.Pessenger ON dbo.Buyer.BuyerID = dbo.Pessenger.BuyerID INNER JOIN
                         dbo.Ticket ON dbo.Pessenger.PessengerID = dbo.Ticket.PessengerID INNER JOIN
                         dbo.Seat ON dbo.Ticket.SeatID = dbo.Seat.SeatID INNER JOIN
                         dbo.Train ON dbo.Ticket.TrainID = dbo.Train.TrainID

GO
/****** Object:  View [dbo].[View_5]    Script Date: 02/10/2017 14:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_5]
AS
SELECT        dbo.Buyer.Name_Buyer, dbo.Buyer.ID_Number, dbo.Buyer.Phone_Number, dbo.Pessenger.Name, dbo.Pessenger.Phone_Number AS PhoneNumber, dbo.Ticket.TicketID, dbo.Ticket.Dept_Date, dbo.Seat.Row, 
                         dbo.Seat.Number, dbo.Train.Train_Name, dbo.Train.Route1 AS OriginRoute, dbo.Train.Route2 AS DestinationRoute, dbo.Train.Dept_Time, dbo.Train.Arriv_Time, dbo.Train.Train_Class, dbo.Train.Ticket_Price
FROM            dbo.Buyer INNER JOIN
                         dbo.Pessenger ON dbo.Buyer.BuyerID = dbo.Pessenger.BuyerID INNER JOIN
                         dbo.Ticket ON dbo.Pessenger.PessengerID = dbo.Ticket.PessengerID INNER JOIN
                         dbo.Seat ON dbo.Ticket.SeatID = dbo.Seat.SeatID INNER JOIN
                         dbo.Train ON dbo.Ticket.TrainID = dbo.Train.TrainID
WHERE        (dbo.Buyer.BuyerID =
                             (SELECT        MAX(BuyerID) AS Expr1
                               FROM            dbo.Buyer AS Buyer_1))

GO
/****** Object:  View [dbo].[View_6]    Script Date: 02/10/2017 14:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_6]
AS
SELECT        t.TrainID, t.Train_Name, t.Route1, t.Route2, t.Dept_Time, t.Arriv_Time, t.Train_Class, t.Ticket_Price, t.Total_Seat, c.CityID, c.Name_City, ci.CityID AS Expr1, ci.Name_City AS Expr2
FROM            dbo.Train AS t INNER JOIN
                         dbo.City AS c ON t.Route1 = c.CityID INNER JOIN
                         dbo.City AS ci ON t.Route2 = ci.CityID

GO
SET IDENTITY_INSERT [dbo].[Buyer] ON 

INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (1, N'Gri', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (2, N'a', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (3, N'a', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (4, N'a', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (5, N'g', N'2', N'3')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (6, N'fefe', N'3', N'34')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (7, N'z', N'2', N'3')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (8, N's', N'2', N'34')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (9, N'e2wd', N'22', N'2')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (10, N'a', N'4', N'2')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (11, N'a', N'4', N'4')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (12, N'a', N'3', N'3')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (13, N'asa', N'123', N'321')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (14, N'aaa', N'1', N'22')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (15, N'mnmmmm', N'222', N'222')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (16, N'a', N'22', N'222')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (17, N'sds', N'23', N'3')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (18, N'1', N'2443', N'343')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (19, N'a', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (20, N'a', N'1', N'2')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (21, N'aaaaaaa', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (22, N'mmm', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (23, N'', N'', N'')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (24, N'a', N'44', N'3')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (25, N'a', N'23', N'333')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (26, N'aa', N'1', N'2')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (27, N'aa', N'12', N'2')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (29, N'a', N'3', N'3')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (30, N'aa', N'223', N'33')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (31, N'aa', N'33', N'33')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (32, N'sc', N'3', N'44')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (34, N'aa', N'12', N'222')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (35, N'asa', N'222', N'22')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (36, N'aa', N'11', N'11')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (37, N'aaa', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (38, N'fw2', N'23', N'3')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (39, N's', N'1', N'12')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (40, N'x', N'3', N'33')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (43, N'aa', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (45, N'aa', N'22', N'22')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (46, N'aa', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (47, N'aaa', N'11', N'11')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (48, N'aaa', N'11', N'11')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (49, N'aa', N'22', N'22')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (50, N'a', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (51, N'a', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (52, N'a', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (53, N'a', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (54, N'aa', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (55, N'a', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (56, N'a', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (57, N'a', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (58, N'a', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (60, N'a', N'1', N'1')
INSERT [dbo].[Buyer] ([BuyerID], [Name_Buyer], [ID_Number], [Phone_Number]) VALUES (62, N'a', N'1', N'1')
SET IDENTITY_INSERT [dbo].[Buyer] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [Name_City]) VALUES (1, N'Malang')
INSERT [dbo].[City] ([CityID], [Name_City]) VALUES (2, N'Yogyakarta')
INSERT [dbo].[City] ([CityID], [Name_City]) VALUES (3, N'Surabaya')
INSERT [dbo].[City] ([CityID], [Name_City]) VALUES (4, N'Bandung')
INSERT [dbo].[City] ([CityID], [Name_City]) VALUES (5, N'Jakarta')
INSERT [dbo].[City] ([CityID], [Name_City]) VALUES (6, N'Semarang')
INSERT [dbo].[City] ([CityID], [Name_City]) VALUES (7, N'Solo')
INSERT [dbo].[City] ([CityID], [Name_City]) VALUES (8, N'Jember')
INSERT [dbo].[City] ([CityID], [Name_City]) VALUES (9, N'Banyuwangi')
INSERT [dbo].[City] ([CityID], [Name_City]) VALUES (10, N'Kediri')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Pessenger] ON 

INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (1, N'Wahaz', 20111999, 876554, 1, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (13, N'Rizalaa', 201119991, 876554, 1, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (15, N'Wahaz', 20111999, 876554, 1, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (16, N'Wahaz', 20111999, 876554, 1, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (18, N'Wahaz', 20111999, 876554, 1, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (19, N'Wahaz', 20111999, 876554, 1, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (26, N'a', 1, 1, 1, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (27, N'b', 2, 2, 1, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (28, N'c', 3, 3, 1, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (29, N'b', 1, 1, 2, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (30, N'c', 1, 1, 2, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (31, N'x', 1, 3, 3, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (32, N'f', 3, 4, 3, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (33, N't', 2, 3, 4, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (34, N'v', 4, 3, 4, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (35, N'e', 3, 4, 5, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (36, N'f', 4, 3, 5, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (37, N'ffe', 4, 4, 6, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (38, N'efefe', 4, 4, 6, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (39, N'gg', 4, 5, 7, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (40, N'ggg', 3, 4, 7, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (41, N'3', 3, 33, 8, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (42, N'dw2', 2, 2, 9, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (43, N'2', 4, 2, 11, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (44, N'd', 3, 3, 12, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (45, N'asa', 33, 322, 13, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (46, N'aa', 32, 123, 14, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (47, N'mmmmmm', 443, 3334, 15, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (48, N'aaaaaaaaaa', 222, 1, 16, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (49, N'ddd', 3, 33, 17, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (50, N'sdsd', 24343, 5454, 18, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (51, N'a', 2, 2, 19, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (52, N'gg', 3, 4, 22, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (53, N'ooo', 66, 66, 22, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (54, N'', 0, 0, 23, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (55, N'', 0, 0, 23, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (56, N'2', 44, 344, 24, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (57, N'dff', 33, 33, 24, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (58, N'dfd', 23, 44, 24, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (59, N'333', 33, 3, 25, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (60, N'33', 33, 33, 25, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (61, N'33', 3, 33, 25, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (62, N'dd', 3, 4, 26, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (63, N'dd', 54, 5, 26, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (64, N'd', 23, 33, 27, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (65, N'd3', 33, 33, 27, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (68, N'd', 3, 3, 29, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (69, N'3ddd3', 33, 33, 30, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (70, N'd3', 33, 33, 31, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (71, N'vv', 44, 33, 32, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (73, N'dd', 333, 33, 34, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (74, N'22', 222, 22, 35, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (75, N'11', 1, 11, 36, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (76, N'a', 1, 1, 37, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (77, N'ff', 33, 33, 38, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (78, N'122', 22, 33, 39, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (79, N'd', 33, 3, 40, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (82, N'aa', 1, 1, 43, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (84, N'22', 2, 2, 45, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (85, N'a', 1, 3, 46, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (86, N'sss1', 1, 11, 47, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (87, N'ss', 11, 1, 47, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (88, N'11', 23, 233, 48, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (89, N'22', 2, 2, 49, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (90, N'a', 1, 1, 50, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (91, N'a', 1, 1, 51, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (92, N'1', 1, 1, 52, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (93, N'1', 2, 2, 53, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (94, N'1', 11, 1, 54, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (95, N'1', 1, 1, 55, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (96, N'1', 1, 11, 55, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (97, N'1', 1, 1, 55, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (98, N'1', 1, 1, 56, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (99, N'1', 1, 1, 56, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (100, N'1', 1, 11, 57, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (101, N'1', 1, 1, 57, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (102, N'1', 1, 1, 58, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (103, N'1', 1, 1, 58, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (105, N'b', 2, 2, 60, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (106, N'c', 3, 3, 60, NULL)
INSERT [dbo].[Pessenger] ([PessengerID], [Name], [ID_Number], [Phone_Number], [BuyerID], [Image]) VALUES (109, N'1', 1, 1, 62, N'C:\Users\Owner\Pictures\profil.jpg')
SET IDENTITY_INSERT [dbo].[Pessenger] OFF
SET IDENTITY_INSERT [dbo].[Seat] ON 

INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (1, N'A', 1)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (2, N'A', 2)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (3, N'A', 3)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (4, N'A', 4)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (5, N'A', 5)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (6, N'A', 6)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (7, N'A', 7)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (8, N'A', 8)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (9, N'A', 9)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (10, N'A', 10)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (11, N'B', 1)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (12, N'B', 2)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (13, N'B', 3)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (14, N'B', 4)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (15, N'B', 5)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (16, N'B', 6)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (17, N'B', 7)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (18, N'B', 8)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (19, N'B', 9)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (20, N'B', 10)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (21, N'C', 1)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (22, N'C', 2)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (23, N'C', 3)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (24, N'C', 4)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (25, N'C', 5)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (26, N'C', 6)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (27, N'C', 7)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (28, N'C', 8)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (29, N'C', 9)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (30, N'C', 10)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (31, N'D', 1)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (32, N'D', 2)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (33, N'D', 3)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (34, N'D', 4)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (35, N'D', 5)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (36, N'D', 6)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (37, N'D', 7)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (38, N'D', 8)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (39, N'D', 9)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (40, N'D', 10)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (41, N'A', 1)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (42, N'A', 2)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (43, N'A', 3)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (44, N'A', 4)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (45, N'A', 5)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (46, N'A', 6)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (47, N'A', 7)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (48, N'A', 8)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (49, N'A', 9)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (50, N'A', 10)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (51, N'B', 1)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (52, N'B', 2)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (53, N'B', 3)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (54, N'B', 4)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (55, N'B', 5)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (56, N'B', 6)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (57, N'B', 7)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (58, N'B', 8)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (59, N'B', 9)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (60, N'B', 10)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (61, N'C', 1)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (62, N'C', 2)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (63, N'C', 3)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (64, N'C', 4)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (65, N'C', 5)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (66, N'C', 6)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (67, N'C', 7)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (68, N'C', 8)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (69, N'C', 9)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (70, N'C', 10)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (71, N'D', 1)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (72, N'D', 2)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (73, N'D', 3)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (74, N'D', 4)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (75, N'D', 5)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (76, N'D', 6)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (77, N'D', 7)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (78, N'D', 8)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (79, N'D', 9)
INSERT [dbo].[Seat] ([SeatID], [Row], [Number]) VALUES (80, N'D', 10)
SET IDENTITY_INSERT [dbo].[Seat] OFF
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (1, 2, 1, CAST(N'2017-09-20' AS Date), 1, N'Checked In')
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (13, 1, 13, CAST(N'2017-09-20' AS Date), 16, N'Checked In')
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (19, 1, 19, CAST(N'2017-09-25' AS Date), 1, N'Checked In')
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (20, 1, 47, CAST(N'2017-09-25' AS Date), 2, N'Checked In')
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (21, 1, 46, CAST(N'2017-09-25' AS Date), 3, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (24, 1, 50, CAST(N'2017-09-26' AS Date), 4, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (30, 1, 61, CAST(N'2017-09-29' AS Date), 30, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (31, 1, 61, CAST(N'2017-09-29' AS Date), 36, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (32, 1, 61, CAST(N'2017-09-29' AS Date), 23, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (33, 1, 61, CAST(N'2017-09-29' AS Date), 15, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (34, 1, 61, CAST(N'2017-09-29' AS Date), 38, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (35, 1, 62, CAST(N'2017-09-29' AS Date), 32, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (36, 1, 63, CAST(N'2017-09-29' AS Date), 19, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (37, 1, 64, CAST(N'2017-09-29' AS Date), 27, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (38, 1, 61, CAST(N'2017-09-29' AS Date), 21, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (39, 1, 62, CAST(N'2017-09-29' AS Date), 10, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (40, 1, 63, CAST(N'2017-09-29' AS Date), 8, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (41, 1, 64, CAST(N'2017-09-29' AS Date), 7, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (42, 1, 82, CAST(N'2017-09-29' AS Date), 31, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (43, 1, 86, CAST(N'2017-09-29' AS Date), 6, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (44, 1, 87, CAST(N'2017-09-29' AS Date), 5, N'Checked In')
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (45, 2, 88, CAST(N'2017-09-29' AS Date), 21, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (46, 1, 89, CAST(N'2017-09-29' AS Date), 40, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (47, 1, 90, CAST(N'2017-10-02' AS Date), 24, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (48, 1, 91, CAST(N'2017-10-02' AS Date), 18, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (49, 1, 94, CAST(N'2017-10-02' AS Date), 34, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (50, 1, 95, CAST(N'2017-09-29' AS Date), 72, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (51, 1, 96, CAST(N'2017-09-29' AS Date), 43, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (52, 1, 97, CAST(N'2017-09-29' AS Date), 41, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (53, 1, 100, CAST(N'2017-09-29' AS Date), 11, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (54, 1, 101, CAST(N'2017-09-29' AS Date), 1, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (55, 1, 105, CAST(N'2017-10-02' AS Date), 41, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (56, 1, 106, CAST(N'2017-10-02' AS Date), 5, NULL)
INSERT [dbo].[Ticket] ([TicketID], [TrainID], [PessengerID], [Dept_Date], [SeatID], [Status]) VALUES (57, 1, 109, CAST(N'2017-10-02' AS Date), 71, NULL)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
SET IDENTITY_INSERT [dbo].[Train] ON 

INSERT [dbo].[Train] ([TrainID], [Train_Name], [Route1], [Route2], [Dept_Time], [Arriv_Time], [Train_Class], [Ticket_Price], [Total_Seat]) VALUES (1, N'Malioboro Ekspress', 1, 2, N'07.00', N'14.00', N'Ekonomi', 155000, 80)
INSERT [dbo].[Train] ([TrainID], [Train_Name], [Route1], [Route2], [Dept_Time], [Arriv_Time], [Train_Class], [Ticket_Price], [Total_Seat]) VALUES (2, N'Dhoho', 10, 1, N'01.00', N'04.00', N'Economy', 15000, 80)
INSERT [dbo].[Train] ([TrainID], [Train_Name], [Route1], [Route2], [Dept_Time], [Arriv_Time], [Train_Class], [Ticket_Price], [Total_Seat]) VALUES (5, N'Bandung Ekspress', 3, 4, N'09.00', N'14.00', N'Business', 175000, 80)
INSERT [dbo].[Train] ([TrainID], [Train_Name], [Route1], [Route2], [Dept_Time], [Arriv_Time], [Train_Class], [Ticket_Price], [Total_Seat]) VALUES (6, N'Malabar', 1, 2, N'09.00', N'15.00', N'Executive', 175000, 80)
SET IDENTITY_INSERT [dbo].[Train] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Name], [Username], [Password], [Role]) VALUES (1, N'Wahaz', N'admin', N'admin', N'admin')
INSERT [dbo].[User] ([UserID], [Name], [Username], [Password], [Role]) VALUES (2, N'a', N'wahaz', N'wahaz', N'guest')
INSERT [dbo].[User] ([UserID], [Name], [Username], [Password], [Role]) VALUES (3, N'a', N'wahaz', N'gri', N'guest')
INSERT [dbo].[User] ([UserID], [Name], [Username], [Password], [Role]) VALUES (4, N'a', N'a', N'a', N'guest')
INSERT [dbo].[User] ([UserID], [Name], [Username], [Password], [Role]) VALUES (5, N'z', N'z', N'z', N'guest')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Pessenger]  WITH CHECK ADD  CONSTRAINT [FK_Pessenger_Buyer] FOREIGN KEY([BuyerID])
REFERENCES [dbo].[Buyer] ([BuyerID])
GO
ALTER TABLE [dbo].[Pessenger] CHECK CONSTRAINT [FK_Pessenger_Buyer]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Pessenger] FOREIGN KEY([PessengerID])
REFERENCES [dbo].[Pessenger] ([PessengerID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Pessenger]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Seat] FOREIGN KEY([SeatID])
REFERENCES [dbo].[Seat] ([SeatID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Seat]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Train] FOREIGN KEY([TrainID])
REFERENCES [dbo].[Train] ([TrainID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Train]
GO
ALTER TABLE [dbo].[Train]  WITH CHECK ADD  CONSTRAINT [FK_Train_City] FOREIGN KEY([Route1])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Train] CHECK CONSTRAINT [FK_Train_City]
GO
ALTER TABLE [dbo].[Train]  WITH CHECK ADD  CONSTRAINT [FK_Train_City1] FOREIGN KEY([Route2])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Train] CHECK CONSTRAINT [FK_Train_City1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ci"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Schedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Schedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Buyer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Seat"
            Begin Extent = 
               Top = 6
               Left = 248
               Bottom = 119
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ticket"
            Begin Extent = 
               Top = 6
               Left = 456
               Bottom = 136
               Right = 626
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Train"
            Begin Extent = 
               Top = 6
               Left = 664
               Bottom = 136
               Right = 834
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 1350
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Buyer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 174
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pessenger"
            Begin Extent = 
               Top = 10
               Left = 257
               Bottom = 177
               Right = 445
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Seat"
            Begin Extent = 
               Top = 191
               Left = 314
               Bottom = 317
               Right = 490
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ticket"
            Begin Extent = 
               Top = 17
               Left = 587
               Bottom = 198
               Right = 758
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Train"
            Begin Extent = 
               Top = 6
               Left = 874
               Bottom = 233
               Right = 1072
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 28
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 150' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'0
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Buyer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pessenger"
            Begin Extent = 
               Top = 6
               Left = 248
               Bottom = 136
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Seat"
            Begin Extent = 
               Top = 6
               Left = 458
               Bottom = 119
               Right = 628
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ticket"
            Begin Extent = 
               Top = 6
               Left = 666
               Bottom = 136
               Right = 836
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Train"
            Begin Extent = 
               Top = 6
               Left = 874
               Bottom = 136
               Right = 1044
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Buyer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pessenger"
            Begin Extent = 
               Top = 6
               Left = 248
               Bottom = 136
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Seat"
            Begin Extent = 
               Top = 6
               Left = 458
               Bottom = 119
               Right = 628
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ticket"
            Begin Extent = 
               Top = 6
               Left = 666
               Bottom = 136
               Right = 836
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Train"
            Begin Extent = 
               Top = 6
               Left = 874
               Bottom = 136
               Right = 1044
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Buyer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pessenger"
            Begin Extent = 
               Top = 6
               Left = 248
               Bottom = 136
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Seat"
            Begin Extent = 
               Top = 6
               Left = 458
               Bottom = 119
               Right = 628
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ticket"
            Begin Extent = 
               Top = 6
               Left = 666
               Bottom = 136
               Right = 836
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Train"
            Begin Extent = 
               Top = 6
               Left = 874
               Bottom = 136
               Right = 1044
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ci"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_6'
GO
USE [master]
GO
ALTER DATABASE [ESEMKATRAIN] SET  READ_WRITE 
GO
