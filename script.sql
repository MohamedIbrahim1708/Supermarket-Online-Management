USE [master]
GO
/****** Object:  Database [FullOnlineSuperMarket]    Script Date: 7/22/2022 2:43:40 AM ******/
CREATE DATABASE [FullOnlineSuperMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FullOnlineSuperMarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FullOnlineSuperMarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FullOnlineSuperMarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FullOnlineSuperMarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FullOnlineSuperMarket] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FullOnlineSuperMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FullOnlineSuperMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET RECOVERY FULL 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET  MULTI_USER 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FullOnlineSuperMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FullOnlineSuperMarket] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FullOnlineSuperMarket', N'ON'
GO
ALTER DATABASE [FullOnlineSuperMarket] SET QUERY_STORE = OFF
GO
USE [FullOnlineSuperMarket]
GO
/****** Object:  Table [dbo].[AdminTbl]    Script Date: 7/22/2022 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminTbl](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminEmail] [varchar](50) NOT NULL,
	[AdminPassword] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillingTbl]    Script Date: 7/22/2022 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingTbl](
	[BillingID] [int] IDENTITY(1,1) NOT NULL,
	[BillingDate] [date] NOT NULL,
	[Seller] [int] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_BillingTbl] PRIMARY KEY CLUSTERED 
(
	[BillingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryTbl]    Script Date: 7/22/2022 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryTbl](
	[CatID] [int] IDENTITY(1000,1) NOT NULL,
	[CatName] [varchar](50) NOT NULL,
	[CatDescription] [varchar](150) NULL,
 CONSTRAINT [PK_CategoryTbl] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTbl]    Script Date: 7/22/2022 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTbl](
	[ProductID] [int] IDENTITY(1000,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductCat] [int] NOT NULL,
	[ProductPrice] [int] NOT NULL,
	[ProductQty] [int] NOT NULL,
	[ProductExpDate] [date] NOT NULL,
 CONSTRAINT [PK_ProductTbl] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerTbl]    Script Date: 7/22/2022 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerTbl](
	[SellerID] [int] IDENTITY(1000,1) NOT NULL,
	[SellerName] [varchar](50) NOT NULL,
	[SellerEmail] [varchar](50) NOT NULL,
	[SellerPassword] [varchar](50) NOT NULL,
	[SellerPhone] [varchar](50) NOT NULL,
	[SellerAddress] [varchar](150) NOT NULL,
 CONSTRAINT [PK_SellerTbl] PRIMARY KEY CLUSTERED 
(
	[SellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BillingTbl]  WITH CHECK ADD  CONSTRAINT [BillingSeller] FOREIGN KEY([Seller])
REFERENCES [dbo].[SellerTbl] ([SellerID])
GO
ALTER TABLE [dbo].[BillingTbl] CHECK CONSTRAINT [BillingSeller]
GO
ALTER TABLE [dbo].[ProductTbl]  WITH CHECK ADD  CONSTRAINT [ProductCategory] FOREIGN KEY([ProductCat])
REFERENCES [dbo].[CategoryTbl] ([CatID])
GO
ALTER TABLE [dbo].[ProductTbl] CHECK CONSTRAINT [ProductCategory]
GO
USE [master]
GO
ALTER DATABASE [FullOnlineSuperMarket] SET  READ_WRITE 
GO
