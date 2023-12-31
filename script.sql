USE [master]
GO

CREATE DATABASE [bloodbank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bloodbank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bloodbank.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bloodbank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bloodbank_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bloodbank] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bloodbank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bloodbank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bloodbank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bloodbank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bloodbank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bloodbank] SET ARITHABORT OFF 
GO
ALTER DATABASE [bloodbank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bloodbank] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [bloodbank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bloodbank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bloodbank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bloodbank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bloodbank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bloodbank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bloodbank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bloodbank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bloodbank] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bloodbank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bloodbank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bloodbank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bloodbank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bloodbank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bloodbank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bloodbank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bloodbank] SET RECOVERY FULL 
GO
ALTER DATABASE [bloodbank] SET  MULTI_USER 
GO
ALTER DATABASE [bloodbank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bloodbank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bloodbank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bloodbank] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [bloodbank]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insert_comments]
(
@comment_text nvarchar(max) ,
@comment_fk_onprofileid int ,
@comment_fk_fromprofileid int 
)
as
begin 

insert into comments(comment_text,comment_fk_onprofileid,comment_fk_fromprofileid,comment_date)
values(@comment_text,@comment_fk_onprofileid,@comment_fk_fromprofileid,GETDATE())
end

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_insert_donor]
(
@d_id int out,
@d_email nvarchar(50) ,
@d_password nvarchar(50) ,
@d_cnic nvarchar(50) ,
@d_name nvarchar(50) ,
@d_age int ,
@d_hospital int ,
@d_contact nvarchar(50) ,
@d_blood nvarchar(3) 

)
as

begin 


insert into user_donor
values
(

@d_email  ,
@d_password  ,
@d_cnic  ,
@d_name  ,
@d_age  ,
@d_hospital  ,
@d_contact  ,
@d_blood
)


select @d_id=SCOPE_IDENTITY()

insert into donor_img
values('~/Uploads/icon.png',@d_id)


end


GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_insert_donor_img]
(
@img_path nvarchar(max) ,
@img_fk_donor int 
)
as

begin 

delete from donor_img where img_fk_donor=@img_fk_donor;
insert into donor_img
values(@img_path,@img_fk_donor)
end



GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bloodgroup](
	[b_id] [int] IDENTITY(1,1) NOT NULL,
	[b_name] [nvarchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[b_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[comment_text] [nvarchar](max) NULL,
	[comment_fk_onprofileid] [int] NULL,
	[comment_fk_fromprofileid] [int] NULL,
	[comment_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donor_img](
	[img_id] [int] IDENTITY(1,1) NOT NULL,
	[img_path] [nvarchar](max) NOT NULL,
	[img_fk_donor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
	[Salary] [float] NULL,
	[Department] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hospitals](
	[hos_id] [int] IDENTITY(1,1) NOT NULL,
	[hos_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[hos_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_donor](
	[d_id] [int] IDENTITY(1,1) NOT NULL,
	[d_email] [nvarchar](50) NOT NULL,
	[d_password] [nvarchar](50) NOT NULL,
	[d_cnic] [nvarchar](50) NOT NULL,
	[d_name] [nvarchar](50) NOT NULL,
	[d_age] [int] NULL,
	[d_hospital] [int] NULL,
	[d_contact] [nvarchar](50) NOT NULL,
	[d_blood] [nvarchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[d_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[bloodgroup] ON 

INSERT [dbo].[bloodgroup] ([b_id], [b_name]) VALUES (1, N'A+')
INSERT [dbo].[bloodgroup] ([b_id], [b_name]) VALUES (2, N'A-')
INSERT [dbo].[bloodgroup] ([b_id], [b_name]) VALUES (3, N'AB+')
INSERT [dbo].[bloodgroup] ([b_id], [b_name]) VALUES (4, N'AB-')
INSERT [dbo].[bloodgroup] ([b_id], [b_name]) VALUES (5, N'O+')
INSERT [dbo].[bloodgroup] ([b_id], [b_name]) VALUES (6, N'O-')
SET IDENTITY_INSERT [dbo].[bloodgroup] OFF
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (1003, N'hello', 22, 21, CAST(0xF33D0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (1004, N'my comment ', 22, 21, CAST(0xF33D0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (1005, N'hello sir', 22, 21, CAST(0xF33D0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (1006, N'Need AB- BLOOD URGENTLY', 22, 21, CAST(0xF33D0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (1007, N'HELLO SIR', 22, 18, CAST(0xF33D0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (1008, N'nice profile', 23, 23, CAST(0xF33D0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (1009, N'hello world', 23, 23, CAST(0xF33D0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (1010, N'nice profile sir', 22, 23, CAST(0xF33D0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (1011, N'nice profile', 23, 8, CAST(0x383E0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (2011, N'what a profile', 21, 24, CAST(0x463E0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (2012, N'nice ', 21, 24, CAST(0x463E0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (3011, N'hello', 21, 24, CAST(0x4A3E0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (4011, N'hello sir', 22, 24, CAST(0x533E0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (4012, N'nice profile', 22, 1024, CAST(0x583E0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (4013, N'hello ', 9, 1024, CAST(0x583E0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (5012, N'hello', 1024, 2025, CAST(0x673E0B00 AS Date))
INSERT [dbo].[comments] ([comment_id], [comment_text], [comment_fk_onprofileid], [comment_fk_fromprofileid], [comment_date]) VALUES (5013, N'hello there', 1024, 8, CAST(0x673E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[comments] OFF
SET IDENTITY_INSERT [dbo].[donor_img] ON 

INSERT [dbo].[donor_img] ([img_id], [img_path], [img_fk_donor]) VALUES (5, N'~/Uploads/u1.jpg', 9)
INSERT [dbo].[donor_img] ([img_id], [img_path], [img_fk_donor]) VALUES (6, N'~/Uploads/u2.jpg', 10)
INSERT [dbo].[donor_img] ([img_id], [img_path], [img_fk_donor]) VALUES (2023, N'~/Uploads/u3.jpg', 13)
INSERT [dbo].[donor_img] ([img_id], [img_path], [img_fk_donor]) VALUES (2034, N'~/Uploads/u4.jpg', 21)
INSERT [dbo].[donor_img] ([img_id], [img_path], [img_fk_donor]) VALUES (2036, N'~/Uploads/u5.jpg', 18)
INSERT [dbo].[donor_img] ([img_id], [img_path], [img_fk_donor]) VALUES (2039, N'~/Uploads/u6.png', 23)
INSERT [dbo].[donor_img] ([img_id], [img_path], [img_fk_donor]) VALUES (2040, N'~/Uploads/u7.jpg', 22)
INSERT [dbo].[donor_img] ([img_id], [img_path], [img_fk_donor]) VALUES (3041, N'~/Uploads/u8.jpg', 24)
INSERT [dbo].[donor_img] ([img_id], [img_path], [img_fk_donor]) VALUES (3043, N'~/Uploads/u9.jpg', 1024)
INSERT [dbo].[donor_img] ([img_id], [img_path], [img_fk_donor]) VALUES (4042, N'~/Uploads/icon.png', NULL)
INSERT [dbo].[donor_img] ([img_id], [img_path], [img_fk_donor]) VALUES (4045, N'~/Uploads/u10.png', 2025)
INSERT [dbo].[donor_img] ([img_id], [img_path], [img_fk_donor]) VALUES (4046, N'~/Uploads/u11.jpg', 8)
SET IDENTITY_INSERT [dbo].[donor_img] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [Name], [Salary], [Department]) VALUES (1, N'A', 20000, N'Finance')
INSERT [dbo].[Employee] ([ID], [Name], [Salary], [Department]) VALUES (2, N'B', 10000, N'Finance')
INSERT [dbo].[Employee] ([ID], [Name], [Salary], [Department]) VALUES (3, N'C', 28000, N'IT')
INSERT [dbo].[Employee] ([ID], [Name], [Salary], [Department]) VALUES (4, N'D', 15000, N'Finance')
INSERT [dbo].[Employee] ([ID], [Name], [Salary], [Department]) VALUES (5, N'E', 39000, N'Finance')
INSERT [dbo].[Employee] ([ID], [Name], [Salary], [Department]) VALUES (6, N'F', 12000, N'Finance')
INSERT [dbo].[Employee] ([ID], [Name], [Salary], [Department]) VALUES (7, N'G', 40000, N'IT')
INSERT [dbo].[Employee] ([ID], [Name], [Salary], [Department]) VALUES (8, N'H', 32000, N'Finance')
INSERT [dbo].[Employee] ([ID], [Name], [Salary], [Department]) VALUES (9, N'I', 56000, N'IT')
INSERT [dbo].[Employee] ([ID], [Name], [Salary], [Department]) VALUES (10, N'J', 29000, N'Finance')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[hospitals] ON 

INSERT [dbo].[hospitals] ([hos_id], [hos_name]) VALUES (1, N'Mumbai')
INSERT [dbo].[hospitals] ([hos_id], [hos_name]) VALUES (2, N'Thane')
INSERT [dbo].[hospitals] ([hos_id], [hos_name]) VALUES (3, N'Pune')
INSERT [dbo].[hospitals] ([hos_id], [hos_name]) VALUES (4, N'Panvel')
INSERT [dbo].[hospitals] ([hos_id], [hos_name]) VALUES (5, N'New Delhi')
INSERT [dbo].[hospitals] ([hos_id], [hos_name]) VALUES (6, N'Bangalore')
INSERT [dbo].[hospitals] ([hos_id], [hos_name]) VALUES (7, N'Kochi')
SET IDENTITY_INSERT [dbo].[hospitals] OFF
SET IDENTITY_INSERT [dbo].[user_donor] ON 

INSERT [dbo].[user_donor] ([d_id], [d_email], [d_password], [d_cnic], [d_name], [d_age], [d_hospital], [d_contact], [d_blood]) VALUES (8, N'123@yahoo.com', N'12345', N'42101-8953456-2', N'Atul', 18, 1, N'03426543210', N'1')
INSERT [dbo].[user_donor] ([d_id], [d_email], [d_password], [d_cnic], [d_name], [d_age], [d_hospital], [d_contact], [d_blood]) VALUES (9, N'haris@gmail.com', N'Kingroot12', N'42101-2810762-9', N'Harry', 18, 1, N'03003840471', N'1')
INSERT [dbo].[user_donor] ([d_id], [d_email], [d_password], [d_cnic], [d_name], [d_age], [d_hospital], [d_contact], [d_blood]) VALUES (10, N'753@gmail.com', N'123', N'42101-7772423-7', N'Kat', 21, 1, N'03323700263', N'1')
INSERT [dbo].[user_donor] ([d_id], [d_email], [d_password], [d_cnic], [d_name], [d_age], [d_hospital], [d_contact], [d_blood]) VALUES (13, N'456@gmail.com', N'987', N'42101-8907123-6', N'Niya', 18, 1, N'03003664840', N'1')
INSERT [dbo].[user_donor] ([d_id], [d_email], [d_password], [d_cnic], [d_name], [d_age], [d_hospital], [d_contact], [d_blood]) VALUES (18, N'tech@yahoo.com', N'qwer1234', N'42101-9343202-1', N'Sai', 31, 4, N'03472243673', N'4')
INSERT [dbo].[user_donor] ([d_id], [d_email], [d_password], [d_cnic], [d_name], [d_age], [d_hospital], [d_contact], [d_blood]) VALUES (21, N'421@yahoo.com', N'qwer1234', N'42101-4165195-1', N'Dhruv', 18, 1, N'03542326781', N'1')
INSERT [dbo].[user_donor] ([d_id], [d_email], [d_password], [d_cnic], [d_name], [d_age], [d_hospital], [d_contact], [d_blood]) VALUES (22, N'test@gmail.com', N'qwer1234', N'42101-4565795-1', N'Dev', 18, 4, N'03542351781', N'4')
INSERT [dbo].[user_donor] ([d_id], [d_email], [d_password], [d_cnic], [d_name], [d_age], [d_hospital], [d_contact], [d_blood]) VALUES (23, N'sana@gmail.com', N'qwert1234', N'42101-4567812-0', N'Sana', 34, 3, N'03542167890', N'3')
INSERT [dbo].[user_donor] ([d_id], [d_email], [d_password], [d_cnic], [d_name], [d_age], [d_hospital], [d_contact], [d_blood]) VALUES (24, N'7123@yahoo.com', N'qsu1234567', N'42101-7421549-8', N'Purav', 18, 1, N'03423215432', N'1')
INSERT [dbo].[user_donor] ([d_id], [d_email], [d_password], [d_cnic], [d_name], [d_age], [d_hospital], [d_contact], [d_blood]) VALUES (1024, N'1234@yahoo.com', N'qwert1234', N'42101-7421549-0', N'Ali', 21, 5, N'03423211432', N'5')
INSERT [dbo].[user_donor] ([d_id], [d_email], [d_password], [d_cnic], [d_name], [d_age], [d_hospital], [d_contact], [d_blood]) VALUES (2025, N'abcd@yahoo.com', N'qwer1234', N'42101-7421549-4', N'ST', 37, 1, N'03423311432', N'1')
SET IDENTITY_INSERT [dbo].[user_donor] OFF
SET ANSI_PADDING ON

GO

ALTER TABLE [dbo].[user_donor] ADD UNIQUE NONCLUSTERED 
(
	[d_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO

ALTER TABLE [dbo].[user_donor] ADD UNIQUE NONCLUSTERED 
(
	[d_cnic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO

ALTER TABLE [dbo].[user_donor] ADD UNIQUE NONCLUSTERED 
(
	[d_contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD FOREIGN KEY([comment_fk_onprofileid])
REFERENCES [dbo].[user_donor] ([d_id])
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD FOREIGN KEY([comment_fk_fromprofileid])
REFERENCES [dbo].[user_donor] ([d_id])
GO
ALTER TABLE [dbo].[donor_img]  WITH CHECK ADD FOREIGN KEY([img_fk_donor])
REFERENCES [dbo].[user_donor] ([d_id])
GO
ALTER TABLE [dbo].[user_donor]  WITH CHECK ADD FOREIGN KEY([d_hospital])
REFERENCES [dbo].[hospitals] ([hos_id])
GO
USE [master]
GO
ALTER DATABASE [bloodbank] SET  READ_WRITE 
GO
