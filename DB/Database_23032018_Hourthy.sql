USE [BuuHoaNotaryOffice]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[ID_Account] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Passwords] [varchar](500) NOT NULL,
	[ID_Account_Type] [int] NOT NULL,
	[Note] [nvarchar](500) NULL,
	[AccountID] [int] NULL,
	[Create_Account] [datetime] NOT NULL,
	[Update_Account] [datetime] NOT NULL,
	[Is_Delete] [bit] NOT NULL DEFAULT ((1)),
	[Is_Not_Delete] [bit] NOT NULL DEFAULT ((0)),
	[Folder_Path] [text] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID_Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Account_Type]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Type](
	[ID_Account_Type] [int] IDENTITY(1,1) NOT NULL,
	[Account_Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ID_Account] PRIMARY KEY CLUSTERED 
(
	[ID_Account_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Article]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[ID_Article] [int] IDENTITY(1,1) NOT NULL,
	[Name_Article] [varchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Content] [ntext] NULL,
	[ImagePath] [varchar](100) NULL,
	[ID_Account] [int] NOT NULL,
	[Create_Date_Article] [datetime] NULL,
	[Update_Date_Article] [datetime] NULL,
	[Is_Delete] [bit] NOT NULL,
	[Count_View] [int] NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ID_Article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Article_To_Category]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article_To_Category](
	[ID_Category] [int] NOT NULL,
	[ID_Article] [int] NOT NULL,
	[Is_Delete] [bit] NOT NULL,
 CONSTRAINT [PK_ArtToCat] PRIMARY KEY CLUSTERED 
(
	[ID_Category] ASC,
	[ID_Article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID_Category] [int] IDENTITY(1,1) NOT NULL,
	[Name_Category] [nvarchar](100) NULL,
	[Is_Delete] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID_Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID_Employee] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Name] [nvarchar](100) NULL,
	[Birth_Day] [date] NULL,
	[Date_Start] [date] NULL,
	[ID_Account] [int] NOT NULL,
	[Salary] [float] NULL,
	[Is_Delete] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_ID_Employee] PRIMARY KEY CLUSTERED 
(
	[ID_Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Managed_Contract]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managed_Contract](
	[ID_Notary_Contract] [int] NOT NULL,
	[ID_Account] [int] NOT NULL,
 CONSTRAINT [PK_MaContract] PRIMARY KEY CLUSTERED 
(
	[ID_Notary_Contract] ASC,
	[ID_Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Module]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[ID_Module] [int] IDENTITY(1,1) NOT NULL,
	[Module_Name] [nvarchar](100) NULL,
	[Parent_ID] [int] NOT NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[ID_Module] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notary]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notary](
	[ID_NoTary] [int] IDENTITY(1,1) NOT NULL,
	[Name_Notary] [nvarchar](100) NOT NULL,
	[Regency] [nvarchar](50) NULL,
	[IS_Delect] [bit] NOT NULL DEFAULT ((1)),
	[ID_Account] [int] NULL,
 CONSTRAINT [PK_ID_Notary] PRIMARY KEY CLUSTERED 
(
	[ID_NoTary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notary_Book]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notary_Book](
	[ID_Notary_Book] [int] IDENTITY(1,1) NOT NULL,
	[Number_Of_Book] [int] NOT NULL,
	[Year_Book] [int] NOT NULL,
 CONSTRAINT [PK_ID_Book] PRIMARY KEY CLUSTERED 
(
	[ID_Notary_Book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notary_Contract]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notary_Contract](
	[ID_NotaryContract] [int] IDENTITY(1,1) NOT NULL,
	[Notary_Number] [varchar](20) NOT NULL,
	[Description] [ntext] NULL,
	[ID_Contract_Type] [int] NOT NULL,
	[ID_Notary_Person] [int] NOT NULL,
	[Notary_Date] [date] NOT NULL,
	[Sign_Date] [date] NOT NULL,
	[Note] [nvarchar](500) NULL,
	[Notary_Price] [float] NOT NULL,
	[ID_Notary_Book] [int] NOT NULL,
	[Contract_Image_Scan] [varchar](100) NULL,
	[Signed_Person] [int] NOT NULL,
 CONSTRAINT [PK_Notary_Contract] PRIMARY KEY CLUSTERED 
(
	[ID_NotaryContract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permisson]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisson](
	[ID_Account_Type] [int] NOT NULL,
	[ID_Module] [int] NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[ID_Module] ASC,
	[ID_Account_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_Notary_Person]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Notary_Person](
	[ID_NPerson] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[ID_Code] [varchar](10) NOT NULL,
	[NPerson_Address] [ntext] NULL,
	[Phone_Number] [varchar](15) NULL,
 CONSTRAINT [PK_ID_NPerson] PRIMARY KEY CLUSTERED 
(
	[ID_NPerson] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Type]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Type] [int] NULL,
	[Name_Type] [varchar](50) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Type_Contract]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_Contract](
	[ID_TContract] [int] IDENTITY(1,1) NOT NULL,
	[Type_Name_Contract] [nvarchar](100) NULL,
	[Number_Side] [int] NOT NULL CONSTRAINT [DF_Type_Contract_Number_Side]  DEFAULT ((1)),
	[ID_Type] [int] NULL,
 CONSTRAINT [PK_ID_TContract] PRIMARY KEY CLUSTERED 
(
	[ID_TContract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Article] ADD  DEFAULT ((1)) FOR [Is_Delete]
GO
ALTER TABLE [dbo].[Article_To_Category] ADD  DEFAULT ((1)) FOR [Is_Delete]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((1)) FOR [Is_Delete]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [fk_Account_AccT] FOREIGN KEY([ID_Account_Type])
REFERENCES [dbo].[Account_Type] ([ID_Account_Type])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [fk_Account_AccT]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [fk_Article_Account] FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID_Account])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [fk_Article_Account]
GO
ALTER TABLE [dbo].[Article_To_Category]  WITH CHECK ADD  CONSTRAINT [fk_ATC_Article] FOREIGN KEY([ID_Article])
REFERENCES [dbo].[Article] ([ID_Article])
GO
ALTER TABLE [dbo].[Article_To_Category] CHECK CONSTRAINT [fk_ATC_Article]
GO
ALTER TABLE [dbo].[Article_To_Category]  WITH CHECK ADD  CONSTRAINT [fk_ATC_Category] FOREIGN KEY([ID_Category])
REFERENCES [dbo].[Category] ([ID_Category])
GO
ALTER TABLE [dbo].[Article_To_Category] CHECK CONSTRAINT [fk_ATC_Category]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [fk_Empl_Account] FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID_Account])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [fk_Empl_Account]
GO
ALTER TABLE [dbo].[Managed_Contract]  WITH CHECK ADD  CONSTRAINT [fk_Ma_Acc] FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID_Account])
GO
ALTER TABLE [dbo].[Managed_Contract] CHECK CONSTRAINT [fk_Ma_Acc]
GO
ALTER TABLE [dbo].[Managed_Contract]  WITH CHECK ADD  CONSTRAINT [fk_Ma_Con] FOREIGN KEY([ID_Notary_Contract])
REFERENCES [dbo].[Notary_Contract] ([ID_NotaryContract])
GO
ALTER TABLE [dbo].[Managed_Contract] CHECK CONSTRAINT [fk_Ma_Con]
GO
ALTER TABLE [dbo].[Notary_Contract]  WITH CHECK ADD  CONSTRAINT [fk_NoCon_Book] FOREIGN KEY([ID_Notary_Book])
REFERENCES [dbo].[Notary_Book] ([ID_Notary_Book])
GO
ALTER TABLE [dbo].[Notary_Contract] CHECK CONSTRAINT [fk_NoCon_Book]
GO
ALTER TABLE [dbo].[Notary_Contract]  WITH CHECK ADD  CONSTRAINT [fk_NoCon_Notary] FOREIGN KEY([Signed_Person])
REFERENCES [dbo].[Notary] ([ID_NoTary])
GO
ALTER TABLE [dbo].[Notary_Contract] CHECK CONSTRAINT [fk_NoCon_Notary]
GO
ALTER TABLE [dbo].[Notary_Contract]  WITH CHECK ADD  CONSTRAINT [fk_NoCon_NPer] FOREIGN KEY([ID_Notary_Person])
REFERENCES [dbo].[TB_Notary_Person] ([ID_NPerson])
GO
ALTER TABLE [dbo].[Notary_Contract] CHECK CONSTRAINT [fk_NoCon_NPer]
GO
ALTER TABLE [dbo].[Notary_Contract]  WITH CHECK ADD  CONSTRAINT [fk_NoCon_Type] FOREIGN KEY([ID_Contract_Type])
REFERENCES [dbo].[Type_Contract] ([ID_TContract])
GO
ALTER TABLE [dbo].[Notary_Contract] CHECK CONSTRAINT [fk_NoCon_Type]
GO
ALTER TABLE [dbo].[Permisson]  WITH CHECK ADD  CONSTRAINT [fk_Per_AccT] FOREIGN KEY([ID_Account_Type])
REFERENCES [dbo].[Account_Type] ([ID_Account_Type])
GO
ALTER TABLE [dbo].[Permisson] CHECK CONSTRAINT [fk_Per_AccT]
GO
ALTER TABLE [dbo].[Permisson]  WITH CHECK ADD  CONSTRAINT [fk_Per_Module] FOREIGN KEY([ID_Module])
REFERENCES [dbo].[Module] ([ID_Module])
GO
ALTER TABLE [dbo].[Permisson] CHECK CONSTRAINT [fk_Per_Module]
GO
ALTER TABLE [dbo].[Type_Contract]  WITH CHECK ADD  CONSTRAINT [fk_TContract] FOREIGN KEY([ID_Type])
REFERENCES [dbo].[Type] ([ID])
GO
ALTER TABLE [dbo].[Type_Contract] CHECK CONSTRAINT [fk_TContract]
GO
/****** Object:  StoredProcedure [dbo].[SP_Account_Login]    Script Date: 3/23/2018 1:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Account_Login]
@UserName VARCHAR(100) ,
@Passwords VARCHAR(500)
AS
	BEGIN
		DECLARE @count INT;
		DECLARE @res BIT;
		SELECT @count = COUNT(*)
		FROM dbo.Account
		WHERE UserName = @UserName AND Passwords = @Passwords;
			IF @count > 0
				SET @res = 1;
			ELSE
				SET @res = 0;
				SELECT @res;
	END;

GO
