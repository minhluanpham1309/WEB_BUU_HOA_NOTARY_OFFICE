--Create database 20/3/2018--
CREATE DATABASE BuuHoaNotaryOffice
ON PRIMARY (NAME = 'BuuHoaNotaryOffcie', FILENAME = 'D:\Hoc\LapTrinhWeb\VanPhongCongChung_ProjectWeb\Database\BuuHoaNotaryOffice.mdf')
LOG ON (NAME = 'BuuHoaNotaryOffcie_Log', FILENAME = 'D:\Hoc\LapTrinhWeb\VanPhongCongChung_ProjectWeb\Database\BuuHoaNotaryOffice_Log.ldf')
GO
USE BuuHoaNotaryOffice
--create table notary person --
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
SET ANSI_PADDING ON
GO
CREATE TABLE TB_Notary_Person
(
	ID_NPerson INTEGER IDENTITY(1,1) NOT NULL,
	LastName NVARCHAR(100) NOT NULL,
	FirstName NVARCHAR(100) NOT NULL,
	ID_Code VarCHAR(10) NOT NULL,
	NPerson_Address NVARCHAR(500) NULL,
	Phone_Number VARCHAR(15) NULL,
	CONSTRAINT [PK_ID_NPerson] PRIMARY KEY(ID_NPerson ASC)
)
GO
SET ANSI_PADDING ON
--create table type contract --
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
SET ANSI_PADDING ON
GO
CREATE TABLE Type_Contract
(
	ID_TContract INTEGER IDENTITY(1,1) NOT NULL,
	Type_Name_Contract NVARCHAR(100) NULL,
	Number_Side INTEGER NOT NULL,
	CONSTRAINT [PK_ID_TContract] PRIMARY KEY(ID_TContract ASC) 
)
GO
SET ANSI_PADDING ON
GO 
-- Create Notary book --
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
SET ANSI_PADDING ON
GO

CREATE TABLE Notary_Book
(
	ID_Notary_Book INTEGER IDENTITY(1,1) NOT NULL,
	Number_Of_Book INTEGER NOT NULL,
	Year_Book INTEGER NOT NULL,
	CONSTRAINT [PK_ID_Book] PRIMARY KEY (ID_Notary_Book ASC)
)
GO
SET ANSI_PADDING ON
GO 
-- create Notary (cong chung vien)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
SET ANSI_PADDING ON
GO
CREATE TABLE Notary
(
	ID_NoTary INTEGER IDENTITY(1,1) NOT NULL,
	Name_Notary NVARCHAR(100) NOT NULL,
	Regency NVARCHAR(50) null,
	ID_Account INT NULL,
	IS_Delect BIT NOT NULL DEFAULT (1),
    CONSTRAINT [PK_ID_Notary] PRIMARY KEY (ID_NoTary)
)
GO
SET ANSI_PADDING OFF
GO 
-- create table account --
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
SET ANSI_PADDING ON
GO
CREATE TABLE Account_Type
(
	ID_Account_Type INT IDENTITY(1,1) NOT NULL,
	Account_Name NVARCHAR(20) NOT NULL,
	CONSTRAINT [PK_ID_Account] PRIMARY KEY(ID_Account_Type ASC)
)
GO
SET ANSI_PADDING OFF
GO 
-- create table employee --
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
SET ANSI_PADDING ON
GO
CREATE TABLE Employee
(
	ID_Employee INT IDENTITY(1,1) NOT NULL,
	Employee_Name NVARCHAR(100) null,
	Birth_Day DATE null,
	Date_Start DATE null,
	ID_Account INT NOT NULL,
	-- ID_Employee_Type INT NOT NULL,
	Salary FLOAT NULL,
	Is_Delete bit NOT NULL DEFAULT(1),
	CONSTRAINT [PK_ID_Employee] PRIMARY KEY (ID_Employee ASC)
)
GO
SET ANSI_PADDING OFF
GO 
-- create table type employee
/*SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
SET ANSI_PADDING ON
GO
CREATE TABLE Employee_Type
(
	ID_Employee_Type INT IDENTITY(1,1) NOT NULL,
	Name_Type NVARCHAR(50) null,
	CONSTRAINT [PK_Employee_Type] PRIMARY KEY (ID_Employee_Type ASC)
)
GO
SET ANSI_PADDING OFF*/
GO 
-- create table permisson--
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
SET ANSI_PADDING ON
GO
CREATE TABLE Permisson (
	ID_Account_Type INT NOT NULL,
	ID_Module INT NOT NULL,
	Value INT NOT NULL,
	CONSTRAINT [PK_Permission] PRIMARY KEY (ID_Module,ID_Account_Type ASC)
)
GO
SET ANSI_PADDING OFF
GO
-- create table module --
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
SET ANSI_PADDING ON
GO
CREATE TABLE Module
(
	ID_Module INT IDENTITY(1,1) NOT NULL,
	Module_Name NVARCHAR(100) null,
	Parent_ID INT NOT NULL,
	CONSTRAINT [PK_Module] PRIMARY KEY (ID_Module ASC)
)
GO
SET ANSI_PADDING OFF
GO 
-- create table Account -- 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
SET ANSI_PADDING ON
GO
CREATE TABLE Account(
	ID_Account INT IDENTITY(1,1) NOT NULL,
	UserName VARCHAR(100) NOT NULL,
	Passwords VARBINARY(500) NOT NULL,
	ID_Account_Type INT NOT NULL,
	--ID_Employee INT NOT NULL,
	Note NVARCHAR(500) NULL,
	AccountID INT NULL,
	Create_Account DATETIME NOT NULL,
	Update_Account DATETIME NOT NULL,
	Is_Delete BIT NOT NULL DEFAULT (1),
	Is_Not_Delete BIT NOT NULL DEFAULT (0),
	Folder_Path TEXT NULL,
	CONSTRAINT [PK_Account] PRIMARY KEY (ID_Account ASC)
)
GO
SET ANSI_PADDING OFF
GO 
-- create table Category -- 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
SET ANSI_PADDING ON
GO
CREATE TABLE Category
(
	ID_Category INT IDENTITY(1,1) NOT NULL,
	Name_Category NVARCHAR(100) null,
	Is_Delete BIT NOT NULL DEFAULT(1),
	CONSTRAINT [PK_Category] PRIMARY KEY (ID_Category ASC)
)
GO
SET ANSI_PADDING OFF 
GO 
--create table article--
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
SET ANSI_PADDING ON
GO
CREATE TABLE Article 
(
	ID_Article INT IDENTITY(1,1) NOT NULL,
	Name_Article VARCHAR(100) NULL,
	[Description] NVARCHAR(500) NULL,
	Content NTEXT NULL,
	ImagePath VARCHAR(100) NULL,
	ID_Account INT NOT NULL,
	Create_Date_Article DATETIME NULL,
	Update_Date_Article DATETIME NULL,
	Is_Delete BIT NOT NULL DEFAULT (1),
	Count_View INT NULL,
	CONSTRAINT [PK_Article] PRIMARY KEY (ID_Article ASC)
)
GO
SET ANSI_PADDING OFF 
GO 
--create table Article to Category
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
SET ANSI_PADDING ON
GO
CREATE TABLE Article_To_Category
(
	ID_Category INT NOT NULL,
	ID_Article INT NOT NULL,
	Is_Delete BIT NOT NULL DEFAULT(1),
	CONSTRAINT [PK_ArtToCat] PRIMARY KEY(ID_Category ASC, ID_Article ASC)
)
GO
SET ANSI_PADDING OFF 
GO 
--create table notary contract--
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
SET ANSI_PADDING ON
GO
CREATE TABLE Notary_Contract
(
	ID_NotaryContract INT IDENTITY(1,1) NOT NULL,
	Notary_Number VARCHAR(20) NOT NULL,
	[Description] NTEXT NULL,
	ID_Contract_Type INT NOT NULL,
	ID_Notary_Person INT NOT NULL, 
	Notary_Date DATE NOT NULL,
	Sign_Date DATE NOT NULL,
	Note NVARCHAR(500) NULL,
	Notary_Price FLOAT NOT NULL,
	ID_Notary_Book INT NOT NULL,
	Contract_Image_Scan VARCHAR(100) NULL,
	Signed_Person INT NOT NULL, 
	CONSTRAINT [PK_Notary_Contract] PRIMARY KEY( ID_NotaryContract ASC)
)
GO
SET ANSI_PADDING OFF 
GO
-- Add table managed Contract--
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE Managed_Contract
(
	ID_Notary_Contract INT NOT NULL,
	ID_Account INT NOT NULL
	CONSTRAINT [PK_MaContract] PRIMARY KEY( ID_Notary_Contract, ID_Account)
)
GO
SET ANSI_PADDING OFF 
-- Add constrant foriegn key --
ALTER TABLE dbo.Account ADD CONSTRAINT [fk_Account_AccT] FOREIGN KEY (ID_Account_Type) REFERENCES dbo.Account_Type(ID_Account_Type)
GO
ALTER TABLE dbo.Article ADD CONSTRAINT [fk_Article_Account] FOREIGN KEY(ID_Account) REFERENCES dbo.Account(ID_Account)
GO
ALTER TABLE dbo.Article_To_Category ADD CONSTRAINT [fk_ATC_Category] FOREIGN KEY(ID_Category) REFERENCES dbo.Category(ID_Category)
GO
ALTER TABLE dbo.Article_To_Category ADD CONSTRAINT [fk_ATC_Article] FOREIGN KEY (ID_Article) REFERENCES dbo.Article(ID_Article)
GO
ALTER TABLE dbo.Permisson ADD CONSTRAINT [fk_Per_Module] FOREIGN KEY (ID_Module) REFERENCES dbo.Module(ID_Module)
GO
ALTER TABLE dbo.Permisson ADD CONSTRAINT [fk_Per_AccT] FOREIGN KEY (ID_Account_Type) REFERENCES dbo.Account_Type(ID_Account_Type)
GO 
ALTER TABLE dbo.Employee ADD CONSTRAINT [fk_Empl_Account] FOREIGN KEY(ID_Account) REFERENCES dbo.Account(ID_Account)
GO
ALTER TABLE dbo.Notary_Contract ADD CONSTRAINT [fk_NoCon_Book] FOREIGN KEY(ID_Notary_Book) REFERENCES dbo.Notary_Book(ID_Notary_Book)
GO
ALTER TABLE dbo.Notary_Contract ADD CONSTRAINT [fk_NoCon_Type] FOREIGN KEY (ID_Contract_Type) REFERENCES dbo.Type_Contract(ID_TContract)
GO
ALTER TABLE dbo.Notary_Contract ADD CONSTRAINT [fk_NoCon_NPer] FOREIGN KEY(ID_Notary_Person) REFERENCES dbo.TB_Notary_Person(ID_NPerson)
GO
ALTER TABLE dbo.Notary_Contract ADD CONSTRAINT [fk_NoCon_Notary] FOREIGN KEY (Signed_Person) REFERENCES dbo.Notary(ID_NoTary) 
GO
ALTER TABLE dbo.Managed_Contract ADD CONSTRAINT [fk_Ma_Acc] FOREIGN KEY (ID_Account)REFERENCES dbo.Account(ID_Account)
GO
ALTER TABLE dbo.Managed_Contract ADD CONSTRAINT [fk_Ma_Con] FOREIGN KEY (ID_Notary_Contract) REFERENCES dbo.Notary_Contract(ID_NotaryContract)
GO
ALTER TABLE dbo.Account ALTER COLUMN Passwords VARCHAR(500) NOT NULL
SELECT * FROM dbo.Account
