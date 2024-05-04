USE [master]
GO
/****** Object:  Database [BRDryCleaning]    Script Date: 4/23/2024 9:03:49 PM ******/
CREATE DATABASE [BRDryCleaning]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BRDryCleaning', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BRDryCleaning.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BRDryCleaning_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BRDryCleaning_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BRDryCleaning] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BRDryCleaning].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BRDryCleaning] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BRDryCleaning] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BRDryCleaning] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BRDryCleaning] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BRDryCleaning] SET ARITHABORT OFF 
GO
ALTER DATABASE [BRDryCleaning] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BRDryCleaning] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BRDryCleaning] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BRDryCleaning] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BRDryCleaning] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BRDryCleaning] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BRDryCleaning] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BRDryCleaning] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BRDryCleaning] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BRDryCleaning] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BRDryCleaning] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BRDryCleaning] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BRDryCleaning] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BRDryCleaning] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BRDryCleaning] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BRDryCleaning] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BRDryCleaning] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BRDryCleaning] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BRDryCleaning] SET  MULTI_USER 
GO
ALTER DATABASE [BRDryCleaning] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BRDryCleaning] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BRDryCleaning] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BRDryCleaning] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BRDryCleaning] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BRDryCleaning] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BRDryCleaning] SET QUERY_STORE = ON
GO
ALTER DATABASE [BRDryCleaning] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BRDryCleaning]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LoyaltyPoints] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[StatusID] [int] NULL,
	[SecurityRoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [varchar](200) NOT NULL,
	[AddressLine2] [varchar](200) NULL,
	[AddressLine3] [varchar](200) NULL,
	[City] [varchar](100) NOT NULL,
	[State] [varchar](5) NOT NULL,
	[Country] [varchar](255) NOT NULL,
	[PostalCode] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Address__3214EC27B3BEC607] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](225) NOT NULL,
	[LastName] [varchar](225) NOT NULL,
	[PhoneNumber] [varchar](15) NULL,
	[EmailAddress] [varchar](100) NULL,
	[AddressID] [int] NULL,
	[NotificationPreferenceID] [int] NULL,
	[PasswordHash] [varchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[DiscountTypeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountType]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoursOfOperation]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoursOfOperation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DayOfWeek] [varchar](25) NULL,
	[OpenTime] [time](7) NULL,
	[CloseTime] [time](7) NULL,
	[StoreID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeetingPurpose]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeetingPurpose](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeetingType]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeetingType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonetaryTransaction]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonetaryTransaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AmountPaid] [decimal](18, 0) NOT NULL,
	[OrderID] [int] NULL,
	[PaymentTypeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationPreference]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationPreference](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[DropOffDate] [datetime] NOT NULL,
	[EstimatedCompleteDate] [datetime] NOT NULL,
	[Notes] [text] NULL,
	[StatusID] [int] NULL,
	[StoreID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDiscount]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDiscount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[DiscountID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [text] NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[OrderID] [int] NULL,
	[ServiceItemTypeID] [int] NULL,
	[Quantity] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItemDiscount]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItemDiscount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderItemID] [int] NULL,
	[DiscountID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderServicePromotional]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderServicePromotional](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderItemID] [int] NULL,
	[PromotionalID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotional]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotional](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[DiscountTypeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordStatus]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleEntry]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[Notes] [text] NULL,
	[MeetingTypeID] [int] NULL,
	[MeetingPurposeID] [int] NULL,
	[MeetingEnd] [datetime] NULL,
	[MeetingStart] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityPermission]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityPermission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityRole]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityRolePermission]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityRolePermission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SecurityPermissionID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[SecurityRoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[IsTaxable] [bit] NULL,
	[TaxRate] [decimal](18, 0) NULL,
	[StoreID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceItemType]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceItemType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[IsActive] [bit] NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[ServiceID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePromotional]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePromotional](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[ServiceID] [int] NULL,
	[PromotionalID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[AddressID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreInformation]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreInformation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InformationKey] [varchar](255) NOT NULL,
	[InformationValue] [text] NOT NULL,
	[StoreID] [int] NULL,
 CONSTRAINT [PK__StoreInf__3214EC27FA38C8AA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Testimonial]    Script Date: 4/23/2024 9:03:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Testimonial](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [text] NOT NULL,
	[Body] [text] NOT NULL,
	[CustomerID] [int] NULL,
	[StoreID] [int] NULL,
	[DisplayToPublic] [bit] NULL,
	[HideFromAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (27, 150, 1, 1, 1)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (28, 0, 2, 1, 1)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (29, 75, 3, 1, 2)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (30, 200, 4, 1, 2)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (31, 50, 5, 1, 3)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (32, 100, 6, 1, 3)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (33, 300, 7, 1, 2)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (34, 25, 8, 1, 1)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (35, 150, 9, 1, 1)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (36, 80, 10, 1, 1)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (37, 10, 11, 1, 2)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (38, 120, 12, 1, 2)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (39, 175, 13, 1, 3)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (40, 90, 14, 1, 3)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (41, 30, 15, 1, 2)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (42, 200, 16, 1, 2)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (43, 75, 17, 1, 1)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (44, 150, 18, 1, 1)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (45, 40, 19, 1, 1)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (46, 100, 20, 1, 2)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (47, 60, 21, 1, 2)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (48, 80, 22, 1, 2)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (49, 20, 23, 1, 1)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (50, 150, 24, 1, 1)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (51, 70, 25, 1, 2)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (52, 120, 26, 1, 3)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (53, 0, 53, 1, 1)
GO
INSERT [dbo].[Account] ([ID], [LoyaltyPoints], [CustomerID], [StatusID], [SecurityRoleID]) VALUES (54, 0, 54, 1, 5)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Address] ON 
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (1, N'123 Main St', N'Apt 1', NULL, N'Springfield', N'IL', N'USA', N'62701')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (2, N'456 Elm St', NULL, NULL, N'Riverside', N'CA', N'USA', N'92507')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (3, N'789 Oak St', N'Suite 200', NULL, N'Lexington', N'KY', N'USA', N'40507')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (4, N'789 Pine St', NULL, NULL, N'Boulder', N'CO', N'USA', N'80301')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (5, N'1010 Cedar Ave', N'Unit B', NULL, N'Portland', N'OR', N'USA', N'97205')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (6, N'111 Maple Ln', N'Suite 100', NULL, N'Austin', N'TX', N'USA', N'78701')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (7, N'1313 Oakwood Dr', NULL, NULL, N'Seattle', N'WA', N'USA', N'98101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (8, N'1515 Birch St', NULL, NULL, N'Boston', N'MA', N'USA', N'02101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (9, N'789 Pine St', NULL, NULL, N'Boulder', N'CO', N'USA', N'80301')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (10, N'1010 Cedar Ave', N'Unit B', NULL, N'Portland', N'OR', N'USA', N'97205')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (11, N'111 Maple Ln', N'Suite 100', NULL, N'Austin', N'TX', N'USA', N'78701')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (12, N'1313 Oakwood Dr', NULL, NULL, N'Seattle', N'WA', N'USA', N'98101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (13, N'1515 Birch St', NULL, NULL, N'Boston', N'MA', N'USA', N'02101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (14, N'1515 Willow St', N'Apt 101', NULL, N'Houston', N'TX', N'USA', N'77001')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (15, N'1616 Pine Ave', NULL, NULL, N'Philadelphia', N'PA', N'USA', N'19101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (16, N'1717 Cedar Ct', N'Suite 400', NULL, N'Phoenix', N'AZ', N'USA', N'85001')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (17, N'1818 Elm Dr', NULL, NULL, N'San Diego', N'CA', N'USA', N'92101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (18, N'1919 Oak St', N'Unit D', NULL, N'Dallas', N'TX', N'USA', N'75201')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (19, N'2020 Birch Rd', NULL, NULL, N'Miami', N'FL', N'USA', N'33101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (20, N'2121 Maple Ave', N'Apt 201', NULL, N'Atlanta', N'GA', N'USA', N'30301')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (21, N'2222 Willow Ln', NULL, NULL, N'Las Vegas', N'NV', N'USA', N'89101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (22, N'2323 Pine St', N'Suite 500', NULL, N'Seattle', N'WA', N'USA', N'98101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (23, N'2424 Cedar Ave', NULL, NULL, N'Denver', N'CO', N'USA', N'80202')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (24, N'2525 Elm St', N'Unit E', NULL, N'Boston', N'MA', N'USA', N'02101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (25, N'2626 Oakwood Ct', NULL, NULL, N'Chicago', N'IL', N'USA', N'60601')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (26, N'2727 Maple Dr', N'Apt 301', NULL, N'Los Angeles', N'CA', N'USA', N'90001')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (27, N'2828 Birch Rd', NULL, NULL, N'San Francisco', N'CA', N'USA', N'94102')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (28, N'2929 Willow St', N'Suite 600', NULL, N'New York', N'NY', N'USA', N'10001')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (29, N'123 Main St', N'Apt 1', NULL, N'Springfield', N'IL', N'USA', N'62701')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (30, N'456 Elm St', NULL, NULL, N'Riverside', N'CA', N'USA', N'92507')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (31, N'789 Oak St', N'Suite 200', NULL, N'Lexington', N'KY', N'USA', N'40507')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (32, N'789 Pine St', NULL, NULL, N'Boulder', N'CO', N'USA', N'80301')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (33, N'1010 Cedar Ave', N'Unit B', NULL, N'Portland', N'OR', N'USA', N'97205')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (34, N'111 Maple Ln', N'Suite 100', NULL, N'Austin', N'TX', N'USA', N'78701')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (35, N'1313 Oakwood Dr', NULL, NULL, N'Seattle', N'WA', N'USA', N'98101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (36, N'1515 Birch St', NULL, NULL, N'Boston', N'MA', N'USA', N'02101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (37, N'789 Pine St', NULL, NULL, N'Boulder', N'CO', N'USA', N'80301')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (38, N'1010 Cedar Ave', N'Unit B', NULL, N'Portland', N'OR', N'USA', N'97205')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (39, N'111 Maple Ln', N'Suite 100', NULL, N'Austin', N'TX', N'USA', N'78701')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (40, N'1313 Oakwood Dr', NULL, NULL, N'Seattle', N'WA', N'USA', N'98101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (41, N'1515 Birch St', NULL, NULL, N'Boston', N'MA', N'USA', N'02101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (42, N'1515 Willow St', N'Apt 101', NULL, N'Houston', N'TX', N'USA', N'77001')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (43, N'1616 Pine Ave', NULL, NULL, N'Philadelphia', N'PA', N'USA', N'19101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (44, N'1717 Cedar Ct', N'Suite 400', NULL, N'Phoenix', N'AZ', N'USA', N'85001')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (45, N'1818 Elm Dr', NULL, NULL, N'San Diego', N'CA', N'USA', N'92101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (46, N'1919 Oak St', N'Unit D', NULL, N'Dallas', N'TX', N'USA', N'75201')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (47, N'2020 Birch Rd', NULL, NULL, N'Miami', N'FL', N'USA', N'33101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (48, N'2121 Maple Ave', N'Apt 201', NULL, N'Atlanta', N'GA', N'USA', N'30301')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (49, N'2222 Willow Ln', NULL, NULL, N'Las Vegas', N'NV', N'USA', N'89101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (50, N'2323 Pine St', N'Suite 500', NULL, N'Seattle', N'WA', N'USA', N'98101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (51, N'2424 Cedar Ave', NULL, NULL, N'Denver', N'CO', N'USA', N'80202')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (52, N'2525 Elm St', N'Unit E', NULL, N'Boston', N'MA', N'USA', N'02101')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (53, N'2626 Oakwood Ct', NULL, NULL, N'Chicago', N'IL', N'USA', N'60601')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (54, N'2727 Maple Dr', N'Apt 301', NULL, N'Los Angeles', N'CA', N'USA', N'90001')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (55, N'2828 Birch Rd', NULL, NULL, N'San Francisco', N'CA', N'USA', N'94102')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (56, N'2929 Willow St', N'Suite 600', NULL, N'New York', N'NY', N'USA', N'10001')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (57, N'226 N Michigan Ave', NULL, NULL, N'Big Rapids', N'MI', N'USA', N'49307')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (58, N'1836 E Beltline Ave NE', NULL, NULL, N'Grand Rapids', N'MI', N'USA', N'49525')
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [AddressLine3], [City], [State], [Country], [PostalCode]) VALUES (59, N'320 W Broadway St.', NULL, NULL, N'Mount Pleasant', N'MI', N'USA', N'48804')
GO
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (1, N'John', N'Doe', N'123-456-7890', N'john@example.com', 1, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (2, N'Jane', N'Smith', N'987-654-3210', N'jane@example.com', 2, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (3, N'Michael', N'Johnson', N'555-555-5555', N'michael@example.com', 3, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (4, N'Emily', N'Davis', N'111-222-3333', N'emily@example.com', 4, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (5, N'William', N'Wilson', N'444-555-6666', N'william@example.com', 5, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (6, N'Sophia', N'Martinez', N'777-888-9999', N'sophia@example.com', 6, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (7, N'James', N'Anderson', N'123-456-7890', N'james@example.com', 7, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (8, N'Olivia', N'Taylor', N'987-654-3210', N'olivia@example.com', 8, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (9, N'Benjamin', N'Thomas', N'555-555-5555', N'benjamin@example.com', 9, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (10, N'Amelia', N'Roberts', N'111-111-1111', N'amelia@example.com', 10, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (11, N'Logan', N'Johnson', N'222-222-2222', N'logan@example.com', 11, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (12, N'Emma', N'Brown', N'333-333-3333', N'emma@example.com', 12, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (13, N'Mason', N'Garcia', N'444-444-4444', N'mason@example.com', 13, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (14, N'Ava', N'Miller', N'555-555-5555', N'ava@example.com', 14, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (15, N'Lucas', N'Jackson', N'666-666-6666', N'lucas@example.com', 15, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (16, N'Isabella', N'Harris', N'777-777-7777', N'isabella@example.com', 16, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (17, N'Ethan', N'White', N'888-888-8888', N'ethan@example.com', 17, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (18, N'Charlotte', N'Lee', N'999-999-9999', N'charlotte@example.com', 18, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (19, N'Alexander', N'Walker', N'111-222-3333', N'alexander@example.com', 19, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (20, N'Mia', N'Hall', N'444-555-6666', N'mia@example.com', 20, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (21, N'Liam', N'Young', N'777-888-9999', N'liam@example.com', 21, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (22, N'Harper', N'King', N'123-456-7890', N'harper@example.com', 22, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (23, N'Elijah', N'Evans', N'987-654-3210', N'elijah@example.com', 23, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (24, N'Avery', N'Wright', N'555-555-5555', N'avery@example.com', 24, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (25, N'Scarlett', N'Turner', N'111-111-1111', N'scarlett@example.com', 25, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (26, N'Grayson', N'Parker', N'222-222-2222', N'grayson@example.com', 26, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (27, N'John', N'Doe', N'123-456-7890', N'john@example.com', 1, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (28, N'Jane', N'Smith', N'987-654-3210', N'jane@example.com', 2, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (29, N'Michael', N'Johnson', N'555-555-5555', N'michael@example.com', 3, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (30, N'Emily', N'Davis', N'111-222-3333', N'emily@example.com', 4, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (31, N'William', N'Wilson', N'444-555-6666', N'william@example.com', 5, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (32, N'Sophia', N'Martinez', N'777-888-9999', N'sophia@example.com', 6, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (33, N'James', N'Anderson', N'123-456-7890', N'james@example.com', 7, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (34, N'Olivia', N'Taylor', N'987-654-3210', N'olivia@example.com', 8, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (35, N'Benjamin', N'Thomas', N'555-555-5555', N'benjamin@example.com', 9, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (36, N'Amelia', N'Roberts', N'111-111-1111', N'amelia@example.com', 10, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (37, N'Logan', N'Johnson', N'222-222-2222', N'logan@example.com', 11, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (38, N'Emma', N'Brown', N'333-333-3333', N'emma@example.com', 12, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (39, N'Mason', N'Garcia', N'444-444-4444', N'mason@example.com', 13, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (40, N'Ava', N'Miller', N'555-555-5555', N'ava@example.com', 14, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (41, N'Lucas', N'Jackson', N'666-666-6666', N'lucas@example.com', 15, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (42, N'Isabella', N'Harris', N'777-777-7777', N'isabella@example.com', 16, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (43, N'Ethan', N'White', N'888-888-8888', N'ethan@example.com', 17, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (44, N'Charlotte', N'Lee', N'999-999-9999', N'charlotte@example.com', 18, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (45, N'Alexander', N'Walker', N'111-222-3333', N'alexander@example.com', 19, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (46, N'Mia', N'Hall', N'444-555-6666', N'mia@example.com', 20, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (47, N'Liam', N'Young', N'777-888-9999', N'liam@example.com', 21, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (48, N'Harper', N'King', N'123-456-7890', N'harper@example.com', 22, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (49, N'Elijah', N'Evans', N'987-654-3210', N'elijah@example.com', 23, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (50, N'Avery', N'Wright', N'555-555-5555', N'avery@example.com', 24, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (51, N'Scarlett', N'Turner', N'111-111-1111', N'scarlett@example.com', 25, 1, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (52, N'Grayson', N'Parker', N'222-222-2222', N'grayson@example.com', 26, 2, NULL)
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (53, N'Steven', N'Starlin', N'2316404339', N'test@contoso.com', NULL, NULL, N'5A27D71318D40FAAA5BDBFD8A5EAAD027DAAFD9D5027F1058730A580778FBA32:BED5ADD94AEDA477C0F76665E1C6A5E7:50000:SHA256')
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [AddressID], [NotificationPreferenceID], [PasswordHash]) VALUES (54, N'sefgsdfg', N'sdfgbsdfhb', N'1234567890', N'list@list.list', NULL, NULL, N'AE670CD7B812BC8300B291AB1120DBEC25AE35875B42EF5132A54B9C5EA39229:B754E408E6288FAC754A1C66A4675D73:50000:SHA256')
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 
GO
INSERT [dbo].[Discount] ([ID], [Title], [IsActive], [Amount], [DiscountTypeID]) VALUES (1, N'10% Off Dry Cleaning', 1, CAST(10 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Discount] ([ID], [Title], [IsActive], [Amount], [DiscountTypeID]) VALUES (2, N'20% Off Dry Cleaning', 1, CAST(20 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Discount] ([ID], [Title], [IsActive], [Amount], [DiscountTypeID]) VALUES (3, N'30% Off Dry Cleaning', 1, CAST(30 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Discount] ([ID], [Title], [IsActive], [Amount], [DiscountTypeID]) VALUES (4, N'40% Off Dry Cleaning', 1, CAST(40 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Discount] ([ID], [Title], [IsActive], [Amount], [DiscountTypeID]) VALUES (5, N'50% Off Dry Cleaning', 1, CAST(50 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Discount] ([ID], [Title], [IsActive], [Amount], [DiscountTypeID]) VALUES (6, N'Free Pickup & Delivery', 1, CAST(0 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Discount] ([ID], [Title], [IsActive], [Amount], [DiscountTypeID]) VALUES (7, N'10% Off Alterations', 1, CAST(10 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Discount] ([ID], [Title], [IsActive], [Amount], [DiscountTypeID]) VALUES (8, N'20% Off Alterations', 1, CAST(20 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Discount] ([ID], [Title], [IsActive], [Amount], [DiscountTypeID]) VALUES (9, N'30% Off Alterations', 1, CAST(30 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Discount] ([ID], [Title], [IsActive], [Amount], [DiscountTypeID]) VALUES (10, N'40% Off Alterations', 1, CAST(40 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Discount] ([ID], [Title], [IsActive], [Amount], [DiscountTypeID]) VALUES (11, N'50% Off Alterations', 1, CAST(50 AS Decimal(18, 0)), 1)
GO
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[DiscountType] ON 
GO
INSERT [dbo].[DiscountType] ([ID], [Title], [IsActive]) VALUES (1, N'Percentage', 1)
GO
INSERT [dbo].[DiscountType] ([ID], [Title], [IsActive]) VALUES (2, N'Dollar Amount', 1)
GO
SET IDENTITY_INSERT [dbo].[DiscountType] OFF
GO
SET IDENTITY_INSERT [dbo].[MeetingPurpose] ON 
GO
INSERT [dbo].[MeetingPurpose] ([ID], [Title], [IsActive]) VALUES (1, N'Service Inquiry', 1)
GO
INSERT [dbo].[MeetingPurpose] ([ID], [Title], [IsActive]) VALUES (2, N'Order Pickup', 1)
GO
INSERT [dbo].[MeetingPurpose] ([ID], [Title], [IsActive]) VALUES (3, N'Complaint Resolution', 1)
GO
INSERT [dbo].[MeetingPurpose] ([ID], [Title], [IsActive]) VALUES (4, N'Service Consultation', 1)
GO
INSERT [dbo].[MeetingPurpose] ([ID], [Title], [IsActive]) VALUES (5, N'Feedback Session', 1)
GO
INSERT [dbo].[MeetingPurpose] ([ID], [Title], [IsActive]) VALUES (6, N'Alteration Consultation', 1)
GO
INSERT [dbo].[MeetingPurpose] ([ID], [Title], [IsActive]) VALUES (7, N'Special Request Discussion', 1)
GO
INSERT [dbo].[MeetingPurpose] ([ID], [Title], [IsActive]) VALUES (8, N'Billing Inquiry', 1)
GO
SET IDENTITY_INSERT [dbo].[MeetingPurpose] OFF
GO
SET IDENTITY_INSERT [dbo].[MeetingType] ON 
GO
INSERT [dbo].[MeetingType] ([ID], [Title], [IsActive]) VALUES (1, N'In-person Meeting', 1)
GO
INSERT [dbo].[MeetingType] ([ID], [Title], [IsActive]) VALUES (2, N'Virtual Meeting', 1)
GO
INSERT [dbo].[MeetingType] ([ID], [Title], [IsActive]) VALUES (3, N'Conference Call', 1)
GO
INSERT [dbo].[MeetingType] ([ID], [Title], [IsActive]) VALUES (4, N'Phone Call', 1)
GO
SET IDENTITY_INSERT [dbo].[MeetingType] OFF
GO
SET IDENTITY_INSERT [dbo].[MonetaryTransaction] ON 
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (52, CAST(35 AS Decimal(18, 0)), 52, 2)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (53, CAST(40 AS Decimal(18, 0)), 53, 3)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (54, CAST(0 AS Decimal(18, 0)), 54, 4)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (55, CAST(60 AS Decimal(18, 0)), 55, 5)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (56, CAST(45 AS Decimal(18, 0)), 56, 1)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (57, CAST(55 AS Decimal(18, 0)), 57, 2)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (58, CAST(30 AS Decimal(18, 0)), 58, 3)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (59, CAST(0 AS Decimal(18, 0)), 59, 4)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (60, CAST(70 AS Decimal(18, 0)), 60, 5)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (61, CAST(25 AS Decimal(18, 0)), 61, 1)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (62, CAST(35 AS Decimal(18, 0)), 62, 2)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (63, CAST(40 AS Decimal(18, 0)), 63, 3)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (64, CAST(0 AS Decimal(18, 0)), 64, 4)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (65, CAST(60 AS Decimal(18, 0)), 65, 5)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (66, CAST(45 AS Decimal(18, 0)), 66, 1)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (67, CAST(55 AS Decimal(18, 0)), 67, 2)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (68, CAST(30 AS Decimal(18, 0)), 68, 3)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (69, CAST(0 AS Decimal(18, 0)), 69, 4)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (70, CAST(70 AS Decimal(18, 0)), 70, 5)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (71, CAST(25 AS Decimal(18, 0)), 71, 1)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (72, CAST(35 AS Decimal(18, 0)), 72, 2)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (73, CAST(40 AS Decimal(18, 0)), 73, 3)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (74, CAST(0 AS Decimal(18, 0)), 74, 4)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (75, CAST(60 AS Decimal(18, 0)), 75, 5)
GO
INSERT [dbo].[MonetaryTransaction] ([ID], [AmountPaid], [OrderID], [PaymentTypeID]) VALUES (77, CAST(1 AS Decimal(18, 0)), 52, 2)
GO
SET IDENTITY_INSERT [dbo].[MonetaryTransaction] OFF
GO
SET IDENTITY_INSERT [dbo].[NotificationPreference] ON 
GO
INSERT [dbo].[NotificationPreference] ([ID], [Title], [IsActive]) VALUES (1, N'Email', 1)
GO
INSERT [dbo].[NotificationPreference] ([ID], [Title], [IsActive]) VALUES (2, N'SMS', 1)
GO
INSERT [dbo].[NotificationPreference] ([ID], [Title], [IsActive]) VALUES (3, N'Email', 1)
GO
INSERT [dbo].[NotificationPreference] ([ID], [Title], [IsActive]) VALUES (4, N'SMS', 1)
GO
SET IDENTITY_INSERT [dbo].[NotificationPreference] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (51, 27, CAST(N'2024-01-01T08:00:00.000' AS DateTime), CAST(N'2024-01-01T08:15:00.000' AS DateTime), CAST(N'2024-01-02T17:00:00.000' AS DateTime), N'Dry clean shirts and pants', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (52, 28, CAST(N'2024-01-02T09:30:00.000' AS DateTime), CAST(N'2024-01-02T09:45:00.000' AS DateTime), CAST(N'2024-01-03T18:00:00.000' AS DateTime), N'Wash and press suits', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (53, 29, CAST(N'2024-01-03T11:00:00.000' AS DateTime), CAST(N'2024-01-03T11:15:00.000' AS DateTime), CAST(N'2024-01-04T16:00:00.000' AS DateTime), N'Dry clean dresses and coats', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (54, 30, CAST(N'2024-01-04T13:45:00.000' AS DateTime), CAST(N'2024-01-04T14:00:00.000' AS DateTime), CAST(N'2024-01-05T18:30:00.000' AS DateTime), N'Dry clean jackets and pants', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (55, 31, CAST(N'2024-01-05T15:15:00.000' AS DateTime), CAST(N'2024-01-05T15:30:00.000' AS DateTime), CAST(N'2024-01-06T17:00:00.000' AS DateTime), N'Wash and fold towels and sheets', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (56, 32, CAST(N'2024-01-06T08:30:00.000' AS DateTime), CAST(N'2024-01-06T08:45:00.000' AS DateTime), CAST(N'2024-01-07T17:30:00.000' AS DateTime), N'Dry clean suits and shirts', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (57, 33, CAST(N'2024-01-07T10:00:00.000' AS DateTime), CAST(N'2024-01-07T10:15:00.000' AS DateTime), CAST(N'2024-01-08T17:15:00.000' AS DateTime), N'Wash and press pants and jackets', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (58, 34, CAST(N'2024-01-08T12:45:00.000' AS DateTime), CAST(N'2024-01-08T13:00:00.000' AS DateTime), CAST(N'2024-01-09T17:45:00.000' AS DateTime), N'Dry clean dresses and coats', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (59, 35, CAST(N'2024-01-09T14:30:00.000' AS DateTime), CAST(N'2024-01-09T14:45:00.000' AS DateTime), CAST(N'2024-01-10T18:30:00.000' AS DateTime), N'Wash and fold bed linens', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (60, 36, CAST(N'2024-01-10T16:15:00.000' AS DateTime), CAST(N'2024-01-10T16:30:00.000' AS DateTime), CAST(N'2024-01-11T17:00:00.000' AS DateTime), N'Dry clean jackets and pants', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (61, 37, CAST(N'2024-01-11T09:30:00.000' AS DateTime), CAST(N'2024-01-11T09:45:00.000' AS DateTime), CAST(N'2024-01-12T17:30:00.000' AS DateTime), N'Wash and fold towels and sheets', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (62, 38, CAST(N'2024-01-12T12:00:00.000' AS DateTime), CAST(N'2024-01-12T12:15:00.000' AS DateTime), CAST(N'2024-01-13T18:15:00.000' AS DateTime), N'Dry clean suits and shirts', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (63, 39, CAST(N'2024-01-13T14:45:00.000' AS DateTime), CAST(N'2024-01-13T15:00:00.000' AS DateTime), CAST(N'2024-01-14T17:45:00.000' AS DateTime), N'Wash and press pants and jackets', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (64, 40, CAST(N'2024-01-14T16:30:00.000' AS DateTime), CAST(N'2024-01-14T16:45:00.000' AS DateTime), CAST(N'2024-01-15T18:30:00.000' AS DateTime), N'Dry clean dresses and coats', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (65, 41, CAST(N'2024-01-15T09:15:00.000' AS DateTime), CAST(N'2024-01-15T09:30:00.000' AS DateTime), CAST(N'2024-01-16T17:15:00.000' AS DateTime), N'Wash and fold bed linens', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (66, 42, CAST(N'2024-01-16T11:00:00.000' AS DateTime), CAST(N'2024-01-16T11:15:00.000' AS DateTime), CAST(N'2024-01-17T17:00:00.000' AS DateTime), N'Dry clean jackets and pants', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (67, 43, CAST(N'2024-01-17T13:45:00.000' AS DateTime), CAST(N'2024-01-17T14:00:00.000' AS DateTime), CAST(N'2024-01-18T18:45:00.000' AS DateTime), N'Wash and fold towels and sheets', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (68, 44, CAST(N'2024-01-18T15:30:00.000' AS DateTime), CAST(N'2024-01-18T15:45:00.000' AS DateTime), CAST(N'2024-01-19T17:30:00.000' AS DateTime), N'Dry clean suits and shirts', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (69, 45, CAST(N'2024-01-19T08:15:00.000' AS DateTime), CAST(N'2024-01-19T08:30:00.000' AS DateTime), CAST(N'2024-01-20T16:15:00.000' AS DateTime), N'Wash and press pants and jackets', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (70, 46, CAST(N'2024-01-20T10:00:00.000' AS DateTime), CAST(N'2024-01-20T10:15:00.000' AS DateTime), CAST(N'2024-01-21T18:00:00.000' AS DateTime), N'Dry clean dresses and coats', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (71, 47, CAST(N'2024-01-21T12:45:00.000' AS DateTime), CAST(N'2024-01-21T13:00:00.000' AS DateTime), CAST(N'2024-01-22T17:45:00.000' AS DateTime), N'Wash and fold bed linens', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (72, 48, CAST(N'2024-01-22T14:30:00.000' AS DateTime), CAST(N'2024-01-22T14:45:00.000' AS DateTime), CAST(N'2024-01-23T18:30:00.000' AS DateTime), N'Dry clean jackets and pants', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (73, 49, CAST(N'2024-01-23T09:15:00.000' AS DateTime), CAST(N'2024-01-23T09:30:00.000' AS DateTime), CAST(N'2024-01-24T17:15:00.000' AS DateTime), N'Wash and fold towels and sheets', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (74, 50, CAST(N'2024-01-24T11:00:00.000' AS DateTime), CAST(N'2024-01-24T11:15:00.000' AS DateTime), CAST(N'2024-01-25T17:00:00.000' AS DateTime), N'Dry clean suits and shirts', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (75, 51, CAST(N'2024-01-25T13:45:00.000' AS DateTime), CAST(N'2024-01-25T14:00:00.000' AS DateTime), CAST(N'2024-01-26T18:45:00.000' AS DateTime), N'Wash and press pants and jackets', 1, NULL)
GO
INSERT [dbo].[Order] ([ID], [AccountID], [CreatedDate], [DropOffDate], [EstimatedCompleteDate], [Notes], [StatusID], [StoreID]) VALUES (76, 53, CAST(N'2024-04-04T21:21:41.480' AS DateTime), CAST(N'2024-04-04T00:00:00.000' AS DateTime), CAST(N'2024-04-11T00:00:00.000' AS DateTime), N'asdasgd', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (26, N'Plain dress', CAST(20 AS Decimal(18, 0)), 51, 8, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (27, N'Skirt', CAST(10 AS Decimal(18, 0)), 52, 9, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (28, N'Outdoor coat or jacket', CAST(21 AS Decimal(18, 0)), 53, 10, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (29, N'Sheet set with 2 pillow cases', CAST(25 AS Decimal(18, 0)), 54, 11, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (30, N'Sheet set with 4 pillow cases', CAST(35 AS Decimal(18, 0)), 55, 12, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (31, N'Dress shirt laundered', CAST(4 AS Decimal(18, 0)), 56, 13, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (32, N'Dress shirt laundered greater than 7', CAST(4 AS Decimal(18, 0)), 57, 14, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (33, N'Polo shirts', CAST(7 AS Decimal(18, 0)), 58, 15, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (34, N'Blouse', CAST(8 AS Decimal(18, 0)), 59, 16, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (35, N'Sweaters', CAST(10 AS Decimal(18, 0)), 60, 17, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (36, N'Pants or Slacks', CAST(10 AS Decimal(18, 0)), 61, 18, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (37, N'Sports coats', CAST(13 AS Decimal(18, 0)), 62, 19, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (38, N'Plain dress', CAST(20 AS Decimal(18, 0)), 63, 20, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (39, N'Skirt', CAST(10 AS Decimal(18, 0)), 64, 21, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (40, N'Outdoor coat or jacket', CAST(21 AS Decimal(18, 0)), 65, 22, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (41, N'Sheet set with 2 pillow cases', CAST(25 AS Decimal(18, 0)), 66, 23, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (42, N'Sheet set with 4 pillow cases', CAST(35 AS Decimal(18, 0)), 67, 24, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (43, N'Dress shirt laundered', CAST(4 AS Decimal(18, 0)), 68, 25, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (44, N'Dress shirt laundered greater than 7', CAST(4 AS Decimal(18, 0)), 69, 26, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (45, N'Polo shirts', CAST(7 AS Decimal(18, 0)), 70, 27, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (46, N'Blouse', CAST(8 AS Decimal(18, 0)), 71, 28, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (47, N'Sweaters', CAST(10 AS Decimal(18, 0)), 72, 29, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (48, N'Pants or Slacks', CAST(10 AS Decimal(18, 0)), 73, 30, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (49, N'Sports coats', CAST(13 AS Decimal(18, 0)), 74, 31, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (50, N'Plain dress', CAST(20 AS Decimal(18, 0)), 75, 32, CAST(1 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([ID], [Notes], [Price], [OrderID], [ServiceItemTypeID], [Quantity]) VALUES (51, NULL, CAST(0 AS Decimal(18, 0)), 76, 1, CAST(1 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItemDiscount] ON 
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (24, 26, 4)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (25, 27, 5)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (26, 28, 6)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (27, 29, 7)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (28, 30, 8)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (29, 31, 9)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (30, 32, 10)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (31, 33, 11)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (34, 36, 4)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (35, 37, 5)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (36, 38, 6)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (37, 39, 7)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (38, 40, 8)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (39, 41, 9)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (40, 42, 10)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (41, 43, 11)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (43, 45, 5)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (44, 46, 4)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (45, 47, 5)
GO
INSERT [dbo].[OrderItemDiscount] ([ID], [OrderItemID], [DiscountID]) VALUES (46, 48, 6)
GO
SET IDENTITY_INSERT [dbo].[OrderItemDiscount] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderServicePromotional] ON 
GO
INSERT [dbo].[OrderServicePromotional] ([ID], [OrderItemID], [PromotionalID]) VALUES (1, 26, 1)
GO
INSERT [dbo].[OrderServicePromotional] ([ID], [OrderItemID], [PromotionalID]) VALUES (2, 27, 2)
GO
INSERT [dbo].[OrderServicePromotional] ([ID], [OrderItemID], [PromotionalID]) VALUES (3, 28, 3)
GO
INSERT [dbo].[OrderServicePromotional] ([ID], [OrderItemID], [PromotionalID]) VALUES (4, 29, 4)
GO
INSERT [dbo].[OrderServicePromotional] ([ID], [OrderItemID], [PromotionalID]) VALUES (5, 30, 5)
GO
INSERT [dbo].[OrderServicePromotional] ([ID], [OrderItemID], [PromotionalID]) VALUES (6, 31, 6)
GO
INSERT [dbo].[OrderServicePromotional] ([ID], [OrderItemID], [PromotionalID]) VALUES (7, 32, 7)
GO
INSERT [dbo].[OrderServicePromotional] ([ID], [OrderItemID], [PromotionalID]) VALUES (8, 33, 8)
GO
INSERT [dbo].[OrderServicePromotional] ([ID], [OrderItemID], [PromotionalID]) VALUES (9, 34, 9)
GO
SET IDENTITY_INSERT [dbo].[OrderServicePromotional] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 
GO
INSERT [dbo].[PaymentType] ([ID], [Title], [IsActive]) VALUES (1, N'Cash', 1)
GO
INSERT [dbo].[PaymentType] ([ID], [Title], [IsActive]) VALUES (2, N'Credit Card', 1)
GO
INSERT [dbo].[PaymentType] ([ID], [Title], [IsActive]) VALUES (3, N'Debit', 1)
GO
INSERT [dbo].[PaymentType] ([ID], [Title], [IsActive]) VALUES (4, N'Loyalty Points', 1)
GO
INSERT [dbo].[PaymentType] ([ID], [Title], [IsActive]) VALUES (5, N'Check', 1)
GO
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotional] ON 
GO
INSERT [dbo].[Promotional] ([ID], [Title], [IsActive], [Price], [DiscountTypeID]) VALUES (1, N'Spring Sale', 1, CAST(50 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Promotional] ([ID], [Title], [IsActive], [Price], [DiscountTypeID]) VALUES (2, N'Summer Savings', 1, CAST(25 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Promotional] ([ID], [Title], [IsActive], [Price], [DiscountTypeID]) VALUES (3, N'Fall Frenzy', 1, CAST(30 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Promotional] ([ID], [Title], [IsActive], [Price], [DiscountTypeID]) VALUES (4, N'Winter Discount', 1, CAST(40 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Promotional] ([ID], [Title], [IsActive], [Price], [DiscountTypeID]) VALUES (5, N'Holiday Special', 1, CAST(20 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Promotional] ([ID], [Title], [IsActive], [Price], [DiscountTypeID]) VALUES (6, N'NewYear Sale', 1, CAST(35 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Promotional] ([ID], [Title], [IsActive], [Price], [DiscountTypeID]) VALUES (7, N'NewYear Joy', 1, CAST(35 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Promotional] ([ID], [Title], [IsActive], [Price], [DiscountTypeID]) VALUES (8, N'Presidents Day Sale', 1, CAST(30 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Promotional] ([ID], [Title], [IsActive], [Price], [DiscountTypeID]) VALUES (9, N'Black Friday Deal', 1, CAST(50 AS Decimal(18, 0)), 1)
GO
SET IDENTITY_INSERT [dbo].[Promotional] OFF
GO
SET IDENTITY_INSERT [dbo].[RecordStatus] ON 
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (1, N'Active', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (2, N'Inactive', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (3, N'Archived', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (4, N'Pending', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (5, N'Cancelled', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (6, N'Canceled', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (7, N'In Progress', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (8, N'Awaiting Payment', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (9, N'Scheduled', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (10, N'Partially Shipped', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (11, N'Partially Delivered', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (12, N'Ready for Pickup', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (13, N'Awaiting Review', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (14, N'Completed', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (15, N'On Hold', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (16, N'Pending Approval', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (17, N'Shipped', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (18, N'Delivered', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (19, N'Returned', 1)
GO
INSERT [dbo].[RecordStatus] ([ID], [Title], [IsActive]) VALUES (20, N'Refunded', 1)
GO
SET IDENTITY_INSERT [dbo].[RecordStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[ScheduleEntry] ON 
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (27, 27, N'In-person Meeting', 1, 1, CAST(N'2024-02-25T00:00:00.000' AS DateTime), CAST(N'2024-02-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (28, 28, N'Virtual Meeting', 2, 2, CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'2024-02-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (29, 29, N'Conference Call', 3, 3, CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-02-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (30, 30, N'Phone Call', 4, 4, CAST(N'2024-02-28T00:00:00.000' AS DateTime), CAST(N'2024-02-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (31, 31, N'In-person Meeting', 1, 5, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (32, 32, N'Virtual Meeting', 2, 6, CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-03-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (33, 33, N'Conference Call', 3, 7, CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (34, 34, N'Phone Call', 4, 8, CAST(N'2024-03-03T00:00:00.000' AS DateTime), CAST(N'2024-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (35, 35, N'In-person Meeting', 1, 1, CAST(N'2024-03-04T00:00:00.000' AS DateTime), CAST(N'2024-03-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (36, 36, N'Virtual Meeting', 2, 2, CAST(N'2024-03-05T00:00:00.000' AS DateTime), CAST(N'2024-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (37, 37, N'Conference Call', 3, 3, CAST(N'2024-03-06T00:00:00.000' AS DateTime), CAST(N'2024-03-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (38, 38, N'Phone Call', 4, 4, CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (39, 39, N'In-person Meeting', 1, 5, CAST(N'2024-03-08T00:00:00.000' AS DateTime), CAST(N'2024-03-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (40, 40, N'Virtual Meeting', 2, 6, CAST(N'2024-03-09T00:00:00.000' AS DateTime), CAST(N'2024-03-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (41, 41, N'Conference Call', 3, 7, CAST(N'2024-03-10T00:00:00.000' AS DateTime), CAST(N'2024-03-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (42, 42, N'Phone Call', 4, 8, CAST(N'2024-03-11T00:00:00.000' AS DateTime), CAST(N'2024-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (43, 43, N'In-person Meeting', 1, 1, CAST(N'2024-03-12T00:00:00.000' AS DateTime), CAST(N'2024-03-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (44, 44, N'Virtual Meeting', 2, 2, CAST(N'2024-03-13T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (45, 45, N'Conference Call', 3, 3, CAST(N'2024-03-14T00:00:00.000' AS DateTime), CAST(N'2024-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (46, 46, N'Phone Call', 4, 4, CAST(N'2024-03-15T00:00:00.000' AS DateTime), CAST(N'2024-03-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (47, 47, N'In-person Meeting', 1, 5, CAST(N'2024-03-16T00:00:00.000' AS DateTime), CAST(N'2024-03-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (48, 48, N'Virtual Meeting', 2, 6, CAST(N'2024-03-17T00:00:00.000' AS DateTime), CAST(N'2024-03-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (49, 49, N'Conference Call', 3, 7, CAST(N'2024-03-18T00:00:00.000' AS DateTime), CAST(N'2024-03-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (50, 50, N'Phone Call', 4, 8, CAST(N'2024-03-19T00:00:00.000' AS DateTime), CAST(N'2024-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (51, 51, N'In-person Meeting', 1, 1, CAST(N'2024-03-20T00:00:00.000' AS DateTime), CAST(N'2024-03-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (52, 52, N'Virtual Meeting', 2, 2, CAST(N'2024-03-21T00:00:00.000' AS DateTime), CAST(N'2024-03-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (53, 54, N'sdrghjdsfgjh', 2, 2, CAST(N'2024-04-16T11:42:00.000' AS DateTime), CAST(N'2024-04-16T10:42:00.000' AS DateTime))
GO
INSERT [dbo].[ScheduleEntry] ([ID], [AccountID], [Notes], [MeetingTypeID], [MeetingPurposeID], [MeetingEnd], [MeetingStart]) VALUES (54, 54, N'TO BE HIDDEN', 3, 5, CAST(N'2024-04-01T12:16:00.000' AS DateTime), CAST(N'2024-04-01T11:16:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ScheduleEntry] OFF
GO
SET IDENTITY_INSERT [dbo].[SecurityPermission] ON 
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (1, N'ViewOrders', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (2, N'Edit Orders', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (3, N'Delete Orders', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (4, N'View Customers', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (5, N'Edit Customers', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (6, N'View Inventory', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (7, N'Edit Inventory', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (8, N'View Reports', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (9, N'Generate Reports', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (10, N'Approve Orders', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (11, N'Cancel Orders', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (12, N'Refund Transactions', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (13, N'Manage Inventory', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (14, N'Create Accounts', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (15, N'Edit Accounts', 1)
GO
INSERT [dbo].[SecurityPermission] ([ID], [Title], [IsActive]) VALUES (16, N'Delete Accounts', 1)
GO
SET IDENTITY_INSERT [dbo].[SecurityPermission] OFF
GO
SET IDENTITY_INSERT [dbo].[SecurityRole] ON 
GO
INSERT [dbo].[SecurityRole] ([ID], [Title], [IsActive]) VALUES (1, N'Admin', 1)
GO
INSERT [dbo].[SecurityRole] ([ID], [Title], [IsActive]) VALUES (2, N'Manager', 1)
GO
INSERT [dbo].[SecurityRole] ([ID], [Title], [IsActive]) VALUES (3, N'Employee', 1)
GO
INSERT [dbo].[SecurityRole] ([ID], [Title], [IsActive]) VALUES (4, N'Guest', 1)
GO
INSERT [dbo].[SecurityRole] ([ID], [Title], [IsActive]) VALUES (5, N'Customer', 1)
GO
SET IDENTITY_INSERT [dbo].[SecurityRole] OFF
GO
SET IDENTITY_INSERT [dbo].[SecurityRolePermission] ON 
GO
INSERT [dbo].[SecurityRolePermission] ([ID], [SecurityPermissionID], [IsActive], [SecurityRoleID]) VALUES (1, 7, 1, 4)
GO
INSERT [dbo].[SecurityRolePermission] ([ID], [SecurityPermissionID], [IsActive], [SecurityRoleID]) VALUES (2, 8, 1, 4)
GO
INSERT [dbo].[SecurityRolePermission] ([ID], [SecurityPermissionID], [IsActive], [SecurityRoleID]) VALUES (3, 9, 1, 5)
GO
INSERT [dbo].[SecurityRolePermission] ([ID], [SecurityPermissionID], [IsActive], [SecurityRoleID]) VALUES (4, 10, 1, 5)
GO
INSERT [dbo].[SecurityRolePermission] ([ID], [SecurityPermissionID], [IsActive], [SecurityRoleID]) VALUES (13, 7, 1, 4)
GO
INSERT [dbo].[SecurityRolePermission] ([ID], [SecurityPermissionID], [IsActive], [SecurityRoleID]) VALUES (14, 8, 1, 4)
GO
INSERT [dbo].[SecurityRolePermission] ([ID], [SecurityPermissionID], [IsActive], [SecurityRoleID]) VALUES (15, 9, 1, 5)
GO
INSERT [dbo].[SecurityRolePermission] ([ID], [SecurityPermissionID], [IsActive], [SecurityRoleID]) VALUES (16, 10, 1, 5)
GO
INSERT [dbo].[SecurityRolePermission] ([ID], [SecurityPermissionID], [IsActive], [SecurityRoleID]) VALUES (17, 11, 1, 1)
GO
INSERT [dbo].[SecurityRolePermission] ([ID], [SecurityPermissionID], [IsActive], [SecurityRoleID]) VALUES (18, 12, 1, 1)
GO
INSERT [dbo].[SecurityRolePermission] ([ID], [SecurityPermissionID], [IsActive], [SecurityRoleID]) VALUES (19, 13, 1, 2)
GO
INSERT [dbo].[SecurityRolePermission] ([ID], [SecurityPermissionID], [IsActive], [SecurityRoleID]) VALUES (20, 14, 1, 2)
GO
INSERT [dbo].[SecurityRolePermission] ([ID], [SecurityPermissionID], [IsActive], [SecurityRoleID]) VALUES (21, 15, 1, 3)
GO
INSERT [dbo].[SecurityRolePermission] ([ID], [SecurityPermissionID], [IsActive], [SecurityRoleID]) VALUES (22, 16, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[SecurityRolePermission] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (1, N'Dry Cleaning', 1, CAST(45 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (2, N'Wet Cleaning', 1, CAST(2 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (3, N'Pressing', 1, CAST(4 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (4, N'Tailoring', 1, CAST(35 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (5, N'Delivery', 1, CAST(16 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (6, N'Non-Standard Delivery', 1, CAST(10 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (7, N'Accessories Cleaning', 1, CAST(35 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (8, N'Household Items', 1, CAST(77 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (9, N'Outerwear', 1, CAST(23 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (10, N'Rentals', 1, CAST(35 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (11, N'Dry Cleaning', 1, CAST(64 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (12, N'Wet Cleaning', 1, CAST(2 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (13, N'Pressing', 1, CAST(4 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (14, N'Tailing', 1, CAST(65 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (15, N'Delivery', 1, CAST(34 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (16, N'Non-Standard Delivery', 1, CAST(10 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (17, N'Accessories Cleaning', 1, CAST(23 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (18, N'Household Items', 1, CAST(54 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (19, N'Outerwear', 1, CAST(65 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (20, N'Rentals', 1, CAST(54 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (21, N'Dry Cleaning', 1, CAST(67 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (22, N'Wet Cleaning', 1, CAST(2 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (23, N'Pressing', 1, CAST(4 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (24, N'Tailing', 1, CAST(65 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (25, N'Delivery', 1, CAST(45 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (26, N'Non-Standard Delivery', 1, CAST(10 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (27, N'Accessories Cleaning', 1, CAST(42 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (28, N'Household Items', 1, CAST(65 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (29, N'Outerwear', 1, CAST(43 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[Service] ([ID], [Title], [IsActive], [Price], [IsTaxable], [TaxRate], [StoreID]) VALUES (30, N'Rentals', 1, CAST(45 AS Decimal(18, 0)), 0, CAST(0 AS Decimal(18, 0)), 3)
GO
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceItemType] ON 
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (1, N'Dress shirt laundered', 1, CAST(4 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (2, N'Dress shirt laundered greater than 7', 1, CAST(4 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (3, N'Polo shirts', 1, CAST(7 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (4, N'Blouse', 1, CAST(8 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (5, N'Sweaters', 1, CAST(10 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (6, N'Pants or Slacks', 1, CAST(10 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (7, N'Sports coats', 1, CAST(13 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (8, N'Plain dress', 1, CAST(20 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (9, N'Skirt', 1, CAST(10 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (10, N'Outdoor coat or jacket', 1, CAST(21 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (11, N'Sheet set with 2 pillow cases', 1, CAST(25 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (12, N'Sheet set with 4 pillow cases', 1, CAST(35 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (13, N'Dress shirt laundered', 1, CAST(4 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (14, N'Dress shirt laundered greater than 7', 1, CAST(4 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (15, N'Polo shirts', 1, CAST(7 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (16, N'Blouse', 1, CAST(8 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (17, N'Sweaters', 1, CAST(10 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (18, N'Pants or Slacks', 1, CAST(10 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (19, N'Sports coats', 1, CAST(13 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (20, N'Plain dress', 1, CAST(20 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (21, N'Skirt', 1, CAST(10 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (22, N'Outdoor coat or jacket', 1, CAST(21 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (23, N'Sheet set with 2 pillow cases', 1, CAST(25 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (24, N'Sheet set with 4 pillow cases', 1, CAST(35 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (25, N'Dress shirt laundered', 1, CAST(4 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (26, N'Dress shirt laundered greater than 7', 1, CAST(4 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (27, N'Polo shirts', 1, CAST(7 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (28, N'Blouse', 1, CAST(8 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (29, N'Sweaters', 1, CAST(10 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (30, N'Pants or Slacks', 1, CAST(10 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (31, N'Sports coats', 1, CAST(13 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (32, N'Plain dress', 1, CAST(20 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (33, N'Skirt', 1, CAST(10 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (34, N'Outdoor coat or jacket', 1, CAST(21 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (35, N'Sheet set with 2 pillow cases', 1, CAST(25 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (36, N'Sheet set with 4 pillow cases', 1, CAST(35 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (37, N'Hemming Pants', 1, CAST(20 AS Decimal(18, 0)), 4)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (38, N'Jacket Fitting', 1, CAST(25 AS Decimal(18, 0)), 4)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (39, N'Tuxedo 5 day', 1, CAST(180 AS Decimal(18, 0)), 7)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (40, N'Gowns 5 day', 1, CAST(120 AS Decimal(18, 0)), 7)
GO
INSERT [dbo].[ServiceItemType] ([ID], [Title], [IsActive], [Price], [ServiceID]) VALUES (41, N'Tuxedo mail back', 1, CAST(30 AS Decimal(18, 0)), 7)
GO
SET IDENTITY_INSERT [dbo].[ServiceItemType] OFF
GO
SET IDENTITY_INSERT [dbo].[ServicePromotional] ON 
GO
INSERT [dbo].[ServicePromotional] ([ID], [Title], [ServiceID], [PromotionalID]) VALUES (1, N'Dry Cleaning Spring Sale', 1, 10)
GO
INSERT [dbo].[ServicePromotional] ([ID], [Title], [ServiceID], [PromotionalID]) VALUES (2, N'Wet Cleaning Spring Sale', 2, 10)
GO
INSERT [dbo].[ServicePromotional] ([ID], [Title], [ServiceID], [PromotionalID]) VALUES (3, N'Pressing Summer Deal', 3, 11)
GO
INSERT [dbo].[ServicePromotional] ([ID], [Title], [ServiceID], [PromotionalID]) VALUES (4, N'Tailing Fall Special', 4, 12)
GO
INSERT [dbo].[ServicePromotional] ([ID], [Title], [ServiceID], [PromotionalID]) VALUES (5, N'Delivery Winter Discount', 5, 13)
GO
INSERT [dbo].[ServicePromotional] ([ID], [Title], [ServiceID], [PromotionalID]) VALUES (6, N'Non-Standard Delivery Holiday Special', 6, 14)
GO
INSERT [dbo].[ServicePromotional] ([ID], [Title], [ServiceID], [PromotionalID]) VALUES (7, N'Accessories Cleaning NewYear Sale', 7, 15)
GO
INSERT [dbo].[ServicePromotional] ([ID], [Title], [ServiceID], [PromotionalID]) VALUES (8, N'Household Items Presidents Day Sale', 8, 16)
GO
INSERT [dbo].[ServicePromotional] ([ID], [Title], [ServiceID], [PromotionalID]) VALUES (9, N'Outerwear Black Friday Deal', 9, 17)
GO
INSERT [dbo].[ServicePromotional] ([ID], [Title], [ServiceID], [PromotionalID]) VALUES (10, N'Rentals Fall Frenzy', 10, 18)
GO
SET IDENTITY_INSERT [dbo].[ServicePromotional] OFF
GO
SET IDENTITY_INSERT [dbo].[Store] ON 
GO
INSERT [dbo].[Store] ([ID], [Title], [AddressID]) VALUES (1, N'Big Rapids', 29)
GO
INSERT [dbo].[Store] ([ID], [Title], [AddressID]) VALUES (2, N'Grand Rapids', 30)
GO
INSERT [dbo].[Store] ([ID], [Title], [AddressID]) VALUES (3, N'Mount Pleasant', 31)
GO
SET IDENTITY_INSERT [dbo].[Store] OFF
GO
SET IDENTITY_INSERT [dbo].[StoreInformation] ON 
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (1, N'FacebookLink', N'https://facebook.com', 29)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (2, N'TwitterLink', N'https://twitter.com', 29)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (3, N'Instagram', N'https://instagram.com', 29)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (4, N'FacebookLink', N'https://facebook.com', 30)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (5, N'TwitterLink', N'https://twitter.com', 30)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (6, N'Instagram', N'https://instagram.com', 30)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (7, N'FacebookLink', N'https://facebook.com', 31)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (8, N'TwitterLink', N'https://twitter.com', 31)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (9, N'Instagram', N'https://instagram.com', 31)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (10, N'StoreInformationKey', N'CallToAction1', 1)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (11, N'StoreInformationKey', N'CallToAction1', 2)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (12, N'StoreInformationKey', N'CallToAction1', 3)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (13, N'StoreInformationKey', N'CallToAction1Quote', 1)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (14, N'StoreInformationKey', N'CallToAction1Quote', 2)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (15, N'StoreInformationKey', N'CallToAction1Quote', 3)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (16, N'StoreInformationKey', N'CallToAction1SubParagraph', 1)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (17, N'StoreInformationKey', N'CallToAction1SubParagraph', 2)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (18, N'StoreInformationKey', N'CallToAction1SubParagraph', 3)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (19, N'StoreInformationKey', N'AboutUs', 1)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (20, N'StoreInformationKey', N'AboutUs', 2)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (21, N'StoreInformationKey', N'AboutUs', 3)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (22, N'StoreInformationKey', N'AboutUsSecondParagraph', 1)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (23, N'StoreInformationKey', N'AboutUsSecondParagraph', 2)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (24, N'StoreInformationKey', N'AboutUsSecondParagraph', 3)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (25, N'CallToAction1', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel lobortis felis. Suspendisse molestie nisi nec est condimentum, in vestibulum turpis faucibus. Ut quis felis nibh. In vulputate dolor quis vehicula hendrerit. Morbi nec velit bibendum, bibendum nibh vel, sagittis ex. Phasellus hendrerit lectus at neque dictum dictum at et mauris. Nullam nulla dui, dictum vitae lectus at, molestie varius nulla. Phasellus lobortis nulla vel nisl condimentum iaculis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam porttitor eu est et dapibus.', 1)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (26, N'CallToAction1Quote', N'Phasellus et lacus erat. ', 1)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (27, N'CallToAction1SubParagraph', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel lobortis felis. Suspendisse molestie nisi nec est condimentum, in vestibulum turpis faucibus. Ut quis felis nibh. In vulputate dolor quis vehicula hendrerit. Morbi nec velit bibendum, bibendum nibh vel, sagittis ex. Phasellus hendrerit lectus at neque dictum dictum at et mauris. Nullam nulla dui, dictum vitae lectus at, molestie varius nulla. Phasellus lobortis nulla vel nisl condimentum iaculis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam porttitor eu est et dapibus.', 1)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (28, N'AboutUs', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel lobortis felis. Suspendisse molestie nisi nec est condimentum, in vestibulum turpis faucibus. Ut quis felis nibh. In vulputate dolor quis vehicula hendrerit. Morbi nec velit bibendum, bibendum nibh vel, sagittis ex. Phasellus hendrerit lectus at neque dictum dictum at et mauris. Nullam nulla dui, dictum vitae lectus at, molestie varius nulla. Phasellus lobortis nulla vel nisl condimentum iaculis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam porttitor eu est et dapibus.', 1)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (29, N'AboutUsSecondParagraph', N'Pellentesque varius porta felis in iaculis. Aliquam sit amet mauris condimentum, gravida nunc id, luctus ex. Duis est lectus, pharetra eget magna sit amet, tincidunt lacinia ipsum. Nam semper fringilla nisl et tincidunt. Aenean ornare nisl et tortor posuere vulputate. Cras blandit, neque id vestibulum cursus, erat lacus maximus nunc, vel ullamcorper sapien elit vulputate tortor. Donec aliquam auctor ligula eu posuere. Morbi blandit ex id sem semper fringilla eu in mauris.', 1)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (30, N'CallToAction1', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel lobortis felis. Suspendisse molestie nisi nec est condimentum, in vestibulum turpis faucibus. Ut quis felis nibh. In vulputate dolor quis vehicula hendrerit. Morbi nec velit bibendum, bibendum nibh vel, sagittis ex. Phasellus hendrerit lectus at neque dictum dictum at et mauris. Nullam nulla dui, dictum vitae lectus at, molestie varius nulla. Phasellus lobortis nulla vel nisl condimentum iaculis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam porttitor eu est et dapibus.', 2)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (31, N'CallToAction1Quote', N'Phasellus et lacus erat. ', 2)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (32, N'CallToAction1SubParagraph', N'Pellentesque varius porta felis in iaculis. Aliquam sit amet mauris condimentum, gravida nunc id, luctus ex. Duis est lectus, pharetra eget magna sit amet, tincidunt lacinia ipsum. Nam semper fringilla nisl et tincidunt. Aenean ornare nisl et tortor posuere vulputate. Cras blandit, neque id vestibulum cursus, erat lacus maximus nunc, vel ullamcorper sapien elit vulputate tortor. Donec aliquam auctor ligula eu posuere. Morbi blandit ex id sem semper fringilla eu in mauris.', 2)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (33, N'AboutUs', N'Pellentesque varius porta felis in iaculis. Aliquam sit amet mauris condimentum, gravida nunc id, luctus ex. Duis est lectus, pharetra eget magna sit amet, tincidunt lacinia ipsum. Nam semper fringilla nisl et tincidunt. Aenean ornare nisl et tortor posuere vulputate. Cras blandit, neque id vestibulum cursus, erat lacus maximus nunc, vel ullamcorper sapien elit vulputate tortor. Donec aliquam auctor ligula eu posuere. Morbi blandit ex id sem semper fringilla eu in mauris.', 2)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (34, N'AboutUsSecondParagraph', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel lobortis felis. Suspendisse molestie nisi nec est condimentum, in vestibulum turpis faucibus. Ut quis felis nibh. In vulputate dolor quis vehicula hendrerit. Morbi nec velit bibendum, bibendum nibh vel, sagittis ex. Phasellus hendrerit lectus at neque dictum dictum at et mauris. Nullam nulla dui, dictum vitae lectus at, molestie varius nulla. Phasellus lobortis nulla vel nisl condimentum iaculis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam porttitor eu est et dapibus.', 2)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (35, N'AboutUs', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel lobortis felis. Suspendisse molestie nisi nec est condimentum, in vestibulum turpis faucibus. Ut quis felis nibh. In vulputate dolor quis vehicula hendrerit. Morbi nec velit bibendum, bibendum nibh vel, sagittis ex. Phasellus hendrerit lectus at neque dictum dictum at et mauris. Nullam nulla dui, dictum vitae lectus at, molestie varius nulla. Phasellus lobortis nulla vel nisl condimentum iaculis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam porttitor eu est et dapibus.', 3)
GO
INSERT [dbo].[StoreInformation] ([ID], [InformationKey], [InformationValue], [StoreID]) VALUES (36, N'AboutUsSecondParagraph', N'Pellentesque varius porta felis in iaculis. Aliquam sit amet mauris condimentum, gravida nunc id, luctus ex. Duis est lectus, pharetra eget magna sit amet, tincidunt lacinia ipsum. Nam semper fringilla nisl et tincidunt. Aenean ornare nisl et tortor posuere vulputate. Cras blandit, neque id vestibulum cursus, erat lacus maximus nunc, vel ullamcorper sapien elit vulputate tortor. Donec aliquam auctor ligula eu posuere. Morbi blandit ex id sem semper fringilla eu in mauris.', 3)
GO
SET IDENTITY_INSERT [dbo].[StoreInformation] OFF
GO
SET IDENTITY_INSERT [dbo].[Testimonial] ON 
GO
INSERT [dbo].[Testimonial] ([ID], [Subject], [Body], [CustomerID], [StoreID], [DisplayToPublic], [HideFromAdmin]) VALUES (1, N'Test', N'Test', 53, 1, 1, 0)
GO
INSERT [dbo].[Testimonial] ([ID], [Subject], [Body], [CustomerID], [StoreID], [DisplayToPublic], [HideFromAdmin]) VALUES (2, N'gthkjrtykje56j', N'ju46uw4tehsdhdfg', 53, 2, 1, 1)
GO
INSERT [dbo].[Testimonial] ([ID], [Subject], [Body], [CustomerID], [StoreID], [DisplayToPublic], [HideFromAdmin]) VALUES (3, N'qejtq45hqeh', N'adehe5yq', 53, 1, 1, 0)
GO
INSERT [dbo].[Testimonial] ([ID], [Subject], [Body], [CustomerID], [StoreID], [DisplayToPublic], [HideFromAdmin]) VALUES (4, N'56we456uw4ehtadfgh', N'sjhsftuw45y', 53, 2, 1, 0)
GO
INSERT [dbo].[Testimonial] ([ID], [Subject], [Body], [CustomerID], [StoreID], [DisplayToPublic], [HideFromAdmin]) VALUES (5, N'w5ryjw5y1q3rg', N'afegsdhsdthwe5t', 53, 3, 1, 0)
GO
INSERT [dbo].[Testimonial] ([ID], [Subject], [Body], [CustomerID], [StoreID], [DisplayToPublic], [HideFromAdmin]) VALUES (6, N'wh4e5hq3g', N'awegfsjke6134t12', 53, 1, 1, 0)
GO
INSERT [dbo].[Testimonial] ([ID], [Subject], [Body], [CustomerID], [StoreID], [DisplayToPublic], [HideFromAdmin]) VALUES (7, N'wethqwerg21123r', N'asfg34g2134g', 53, 2, 1, 0)
GO
INSERT [dbo].[Testimonial] ([ID], [Subject], [Body], [CustomerID], [StoreID], [DisplayToPublic], [HideFromAdmin]) VALUES (8, N'qewrgaewfgasgf', N'h123q45j1q35hqrwhbasfhw5h25y23q4gtq', 54, 1, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Testimonial] OFF
GO
ALTER TABLE [dbo].[OrderItem] ADD  CONSTRAINT [DF_OrderItem_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([SecurityRoleID])
REFERENCES [dbo].[SecurityRole] ([ID])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[RecordStatus] ([ID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK__Customer__Addres__5165187F] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK__Customer__Addres__5165187F]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([NotificationPreferenceID])
REFERENCES [dbo].[NotificationPreference] ([ID])
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD FOREIGN KEY([DiscountTypeID])
REFERENCES [dbo].[DiscountType] ([ID])
GO
ALTER TABLE [dbo].[HoursOfOperation]  WITH CHECK ADD  CONSTRAINT [FK_HoursOfOperation_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[HoursOfOperation] CHECK CONSTRAINT [FK_HoursOfOperation_Store]
GO
ALTER TABLE [dbo].[MonetaryTransaction]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[MonetaryTransaction]  WITH CHECK ADD FOREIGN KEY([PaymentTypeID])
REFERENCES [dbo].[PaymentType] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[RecordStatus] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[OrderDiscount]  WITH CHECK ADD FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discount] ([ID])
GO
ALTER TABLE [dbo].[OrderDiscount]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([ServiceItemTypeID])
REFERENCES [dbo].[ServiceItemType] ([ID])
GO
ALTER TABLE [dbo].[OrderItemDiscount]  WITH CHECK ADD FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discount] ([ID])
GO
ALTER TABLE [dbo].[OrderItemDiscount]  WITH CHECK ADD FOREIGN KEY([OrderItemID])
REFERENCES [dbo].[OrderItem] ([ID])
GO
ALTER TABLE [dbo].[OrderServicePromotional]  WITH CHECK ADD FOREIGN KEY([OrderItemID])
REFERENCES [dbo].[OrderItem] ([ID])
GO
ALTER TABLE [dbo].[OrderServicePromotional]  WITH CHECK ADD FOREIGN KEY([PromotionalID])
REFERENCES [dbo].[Promotional] ([ID])
GO
ALTER TABLE [dbo].[Promotional]  WITH CHECK ADD FOREIGN KEY([DiscountTypeID])
REFERENCES [dbo].[DiscountType] ([ID])
GO
ALTER TABLE [dbo].[ScheduleEntry]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[ScheduleEntry]  WITH CHECK ADD FOREIGN KEY([MeetingPurposeID])
REFERENCES [dbo].[MeetingPurpose] ([ID])
GO
ALTER TABLE [dbo].[ScheduleEntry]  WITH CHECK ADD FOREIGN KEY([MeetingTypeID])
REFERENCES [dbo].[MeetingType] ([ID])
GO
ALTER TABLE [dbo].[SecurityRolePermission]  WITH CHECK ADD FOREIGN KEY([SecurityPermissionID])
REFERENCES [dbo].[SecurityPermission] ([ID])
GO
ALTER TABLE [dbo].[SecurityRolePermission]  WITH CHECK ADD FOREIGN KEY([SecurityRoleID])
REFERENCES [dbo].[SecurityRole] ([ID])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[ServiceItemType]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePromotional]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK__Store__AddressID__0D7A0286] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK__Store__AddressID__0D7A0286]
GO
ALTER TABLE [dbo].[StoreInformation]  WITH CHECK ADD  CONSTRAINT [FK__StoreInfo__Store__10566F31] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[StoreInformation] CHECK CONSTRAINT [FK__StoreInfo__Store__10566F31]
GO
ALTER TABLE [dbo].[Testimonial]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Testimonial]  WITH CHECK ADD FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
USE [master]
GO
ALTER DATABASE [BRDryCleaning] SET  READ_WRITE 
GO
