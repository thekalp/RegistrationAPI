USE [master]
GO
/****** Object:  Database [Test]    Script Date: 7/3/2023 12:28:22 AM ******/
CREATE DATABASE [Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Test] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [Test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Test] SET RECOVERY FULL 
GO
ALTER DATABASE [Test] SET  MULTI_USER 
GO
ALTER DATABASE [Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Test', N'ON'
GO
ALTER DATABASE [Test] SET QUERY_STORE = ON
GO
ALTER DATABASE [Test] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Test]
GO
/****** Object:  Table [dbo].[PartDetail]    Script Date: 7/3/2023 12:28:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartDetail](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_PartDetail] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partyMaster]    Script Date: 7/3/2023 12:28:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partyMaster](
	[partyID] [int] IDENTITY(1,1) NOT NULL,
	[partyCode] [nvarchar](max) NULL,
	[partyName] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[website] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
 CONSTRAINT [PK_partyMaster] PRIMARY KEY CLUSTERED 
(
	[partyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 7/3/2023 12:28:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NULL,
	[CityName] [nchar](10) NULL,
 CONSTRAINT [PK_tblCity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblState]    Script Date: 7/3/2023 12:28:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblState](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](max) NULL,
 CONSTRAINT [PK_tblState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserRegistration]    Script Date: 7/3/2023 12:28:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserRegistration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Email] [varchar](max) NULL,
	[Phone] [varchar](max) NULL,
	[Address] [varchar](max) NULL,
	[StateId] [int] NULL,
	[CityId] [int] NULL,
 CONSTRAINT [PK_tblUserRegistration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_City]    Script Date: 7/3/2023 12:28:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_City]
    @Mode NVARCHAR(20),
    @Id int = 0
AS
BEGIN
    IF @Mode = 'Select'
    BEGIN
        IF @Id > 0
        BEGIN
            select *
            from tblCity
            where Stateid = @Id
        END
        ELSE
        BEGIN
            select *
            from tblCity
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PartyMast]    Script Date: 7/3/2023 12:28:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_PartyMast]            
    @Mode NVARCHAR(20),            
	@VendorId INT = 0          
AS            
BEGIN            
       
 
            
    IF @Mode = 'Select'            
    BEGIN            
        IF (@VendorId > 0)       
        BEGIN            
          select * from partyMaster               

        END            
        ELSE            
        BEGIN            
          select * from partyMaster
        END            
    END            
            
            
END            
            
--select * from Subcontractors where IsDeleted = 0
GO
/****** Object:  StoredProcedure [dbo].[sp_PartyMaster]    Script Date: 7/3/2023 12:28:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_PartyMaster]
    @Mode NVARCHAR(20),
    @partyID NVARCHAR(MAX) = 0,
    @partyCode NVARCHAR(MAX) = '',
    @partyName NVARCHAR(MAX)='',
    @phone NVARCHAR(MAX)='',
    @email NVARCHAR(MAX)='',
    @website NVARCHAR(MAX)='',
    @status NVARCHAR(MAX)=''
AS
BEGIN
    IF @Mode = 'Insert'
    BEGIN
        INSERT INTO partyMaster
        (
            partyCode,
            partyName,
            phone,
            email,
            website,
            status
        )
        values
        (@partyCode, @partyName, @phone, @email, @website, @status)
    END


    IF @Mode = 'Update'
    BEGIN
        update partyMaster
        set partyCode = @partyCode,
            partyName = @partyName,
            phone = @phone,
            email = @email,
            website = @website,
            status = @status
        where partyID = @partyID

    END
    IF (@Mode = 'Delete')
    BEGIN
        delete partyMaster
        where partyID = @partyID
    END
    IF @Mode = 'Select'
    BEGIN
        IF @partyID > 0
        BEGIN
            select *
            from partyMaster
            where partyID = @partyID
        END
        ELSE
        BEGIN
            select *
            from partyMaster
        END
    end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_State]    Script Date: 7/3/2023 12:28:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_State]  
    @Mode NVARCHAR(20),  
    @Id int = 0  
AS  
BEGIN  
    IF @Mode = 'Select'  
    BEGIN  
        select *  
        from tblState  
         
    END  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserRegistration]    Script Date: 7/3/2023 12:28:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UserRegistration]
    @Mode NVARCHAR(20),
    @Id int = 0,
    @Name NVARCHAR(MAX) = '',
    @Email NVARCHAR(MAX) = '',
    @Phone NVARCHAR(MAX) = '',
    @Address NVARCHAR(MAX) = '',
    @StateId int = 0,
    @CityId int = 0
AS
BEGIN
    IF @Mode = 'Insert'
    BEGIN
        INSERT INTO tblUserRegistration
        (
            Name,
            Email,
            Phone,
            Address,
            StateId,
            CityId
        )
        values
        (@Name, @Email, @Phone, @Address, @StateId, @CityId)
    END


    IF @Mode = 'Update'
    BEGIN
        update tblUserRegistration
        set Name = @Name,
            Email = @Email,
            Phone = @Phone,
            Address = @Address,
            StateId = @StateId,
            CityId = @CityId
        where Id = @Id

    END
    IF (@Mode = 'Delete')
    BEGIN
        delete tblUserRegistration
        where Id = @Id
    END
    IF @Mode = 'Select'
    BEGIN
        IF @Id > 0
        BEGIN
            select *
            from tblUserRegistration
            where Id = @Id
        END
        ELSE
        BEGIN
            select *
            from tblUserRegistration
        END
    end
end
GO
USE [master]
GO
ALTER DATABASE [Test] SET  READ_WRITE 
GO
