USE [LocalKarkaThamizha2022]
GO
/****** Object:  UserDefinedTableType [dbo].[UDT_Author]    Script Date: 21-10-2022 11.03.59 AM ******/
CREATE TYPE [dbo].[UDT_Author] AS TABLE(
	[AuthorID] [int] NOT NULL,
	[UserTypeID] [tinyint] NOT NULL,
	[BookID] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UDT_BookCategory]    Script Date: 21-10-2022 11.03.59 AM ******/
CREATE TYPE [dbo].[UDT_BookCategory] AS TABLE(
	[BookID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]  ******/

Create FUNCTION [dbo].[SplitString]
(
    @in_string VARCHAR(MAX),
    @delimiter VARCHAR(1)
)
RETURNS @list TABLE(Item VARCHAR(100))
AS
BEGIN
        WHILE LEN(@in_string) > 0
        BEGIN
            INSERT INTO @list(Item)
            SELECT left(@in_string, charindex(@delimiter, @in_string+',') -1) as tuple
    
            SET @in_string = stuff(@in_string, 1, charindex(@delimiter, @in_string + @delimiter), '')
        end
    RETURN 
END
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[AdminUserID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](35) NOT NULL,
	[UserID] [varchar](30) NOT NULL,
	[MailID] [varchar](35) NOT NULL,
	[Password] [nvarchar](60) NULL,
	[Mobile] [varchar](20) NOT NULL,
	[LastActivity] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthorSeries]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorSeries](
	[AuthorSeriesID] [int] IDENTITY(1,1) NOT NULL,
	[Header] [nvarchar](50) NULL,
	[AuthorID] [int] NOT NULL,
	[MagazineID] [smallint] NOT NULL,
	[WeekDaysID] [tinyint] NULL,
	[SeriesTypeID] [tinyint] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorSeriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthor]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthor](
	[BookID] [int] NOT NULL,
	[AuthorID] [int] NOT NULL,
	[UserTypeID] [tinyint] NOT NULL,
 CONSTRAINT [PK_BookAuthor] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC,
	[AuthorID] ASC,
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCategory]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCategory](
	[BookID] [int] NOT NULL,
	[CategoryID] [smallint] NOT NULL,
 CONSTRAINT [PK_BookCategory] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookFormat]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookFormat](
	[BookFormatID] [tinyint] IDENTITY(1,1) NOT NULL,
	[BookFormat] [nvarchar](15) NULL,
	[Name] [varchar](15) NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookFormatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Book] [nvarchar](100) NOT NULL,
	[Name] [varchar](60) NULL,
	[Tanglish] [varchar](60) NULL,
	[BookDescription] [nvarchar](1500) NULL,
	[AdminUserID] [tinyint] NOT NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BooksDetails]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BooksDetails](
	[BookDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[BookCode] [varchar](15) NULL,
	[Price] [decimal](6, 2) NOT NULL,
	[Pages] [smallint] NULL,
	[PublisherID] [smallint] NOT NULL,
	[NoofCopy] [tinyint] NOT NULL,
	[BookFormat] [tinyint] NOT NULL,
	[ImgBookSmallFS] [varchar](60) NULL,
	[ImgBookSmallBS] [varchar](60) NULL,
	[ImgBookLarge] [varchar](60) NULL,
	[ISBN13] [varchar](17) NULL,
	[FirstEdition] [varchar](10) NULL,
	[CurrentEdition] [varchar](10) NULL,
	[Dimensions] [varchar](14) NULL,
	[IsKarkaBook] [bit] NULL,
	[EnteredBy] [tinyint] NOT NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BooksLink]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BooksLink](
	[BooksLinkID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[LinkBook] [int] NOT NULL,
	[Type] [char](1) NOT NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[BooksLinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BooksReview]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BooksReview](
	[BooksReviewID] [int] IDENTITY(1,1) NOT NULL,
	[BookDetailsID] [int] NULL,
	[Header] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[UserID] [int] NOT NULL,
	[EnteredBy] [tinyint] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [date] NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[BooksReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CacheName]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CacheName](
	[CacheNameID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NULL,
	[CacheName] [varchar](20) NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CacheNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [smallint] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](60) NULL,
	[Name] [varchar](40) NULL,
	[ParentID] [smallint] NULL,
	[IsShownInMenu] [bit] NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [smallint] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NULL,
	[Name] [varchar](25) NOT NULL,
	[StateID] [tinyint] NOT NULL,
	[CountryID] [tinyint] NOT NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Country] [varchar](40) NOT NULL,
	[TwoLetterISOCode] [varchar](2) NULL,
	[ThreeLetterISOCode] [varchar](3) NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBExceptionLog]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBExceptionLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[ErrorLine] [int] NULL,
	[ErrorMessage] [nvarchar](4000) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorProcedure] [nvarchar](128) NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorDateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profession]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profession](
	[ProfessionID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Profession] [nvarchar](25) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProfessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Project] [varchar](20) NOT NULL,
	[URL] [varchar](35) NOT NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeriesType]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeriesType](
	[SeriesTypeID] [tinyint] IDENTITY(1,1) NOT NULL,
	[SeriesType] [nvarchar](20) NULL,
	[Name] [varchar](20) NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[SeriesTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialName]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialName](
	[SpecialNameID] [tinyint] IDENTITY(1,1) NOT NULL,
	[SpecialName] [nvarchar](25) NOT NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecialNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[StateID] [tinyint] IDENTITY(1,1) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[CountryID] [tinyint] NOT NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ToDoList]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToDoList](
	[ToDoListID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[EndDate] [date] NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ToDoListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserDetailID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Profile] [nvarchar](2000) NULL,
	[Protocol] [tinyint] NULL,
	[Website] [varchar](30) NULL,
	[Blog] [varchar](20) NULL,
	[BlogType] [char](1) NULL,
	[FaceBook] [nvarchar](50) NULL,
	[Twitter] [varchar](30) NULL,
	[Pinterest] [varchar](25) NULL,
	[YouTube] [varchar](32) NULL,
	[Instagram] [varchar](15) NULL,
	[Wikipedia] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[DOD] [date] NULL,
	[ImgProfile] [varchar](50) NULL,
	[ImgComments] [varchar](50) NULL,
	[Address] [nvarchar](150) NULL,
	[CityID] [smallint] NULL,
	[IsShownInMenu] [bit] NULL,
	[IsMailSubscription] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserReference]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserReference](
	[UserReferenceID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Reference] [nvarchar](500) NULL,
	[EnteredBy] [tinyint] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserReferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Initial] [nvarchar](10) NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Name] [varchar](35) NOT NULL,
	[MailID] [varchar](35) NULL,
	[Password] [nvarchar](60) NULL,
	[Mobile] [varchar](20) NOT NULL,
	[ProfessionID] [tinyint] NOT NULL,
	[UserTypeID] [tinyint] NOT NULL,
	[SpecialNameID] [tinyint] NULL,
	[LastActivity] [datetime] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 21-10-2022 11.03.59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[UserTypeID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[UserType] [varchar](15) NOT NULL,
	[ShortCode] [char](1) NOT NULL,
	[RecStatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdminUser] ON 

INSERT [dbo].[AdminUser] ([AdminUserID], [Name], [UserID], [MailID], [Password], [Mobile], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (1, N'LocalAdmin', N'LocalAdmin', N'karkathamizha@gmail.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8122885555', CAST(N'2022-01-15T11:43:19.210' AS DateTime), CAST(N'2022-01-15T11:43:19.210' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[AdminUser] OFF
GO
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (1, 4, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (2, 5, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (3, 5, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (4, 6, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (5, 8, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (6, 9, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (7, 9, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (8, 10, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (9, 11, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (10, 12, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (11, 14, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (12, 15, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (13, 15, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (14, 16, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (15, 17, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (16, 18, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (17, 19, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (18, 19, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (19, 19, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (20, 19, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (21, 19, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (22, 22, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (23, 23, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (24, 24, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (25, 25, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (26, 25, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (27, 25, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (28, 25, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (29, 25, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (30, 25, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (31, 25, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (32, 25, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (33, 25, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (34, 26, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (35, 27, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (36, 28, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (37, 29, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (38, 30, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (39, 31, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (40, 32, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (41, 33, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (42, 34, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (43, 35, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (44, 36, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (45, 37, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (46, 38, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (47, 39, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (48, 34, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (49, 40, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (50, 41, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (51, 42, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (52, 43, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (53, 44, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (54, 45, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (55, 46, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (56, 41, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (57, 27, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (58, 44, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (59, 47, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (60, 48, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (61, 49, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (62, 50, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (63, 25, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (64, 51, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (65, 52, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (66, 25, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (67, 25, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (68, 3, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (69, 25, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (70, 53, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (71, 53, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (72, 53, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (73, 53, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (74, 54, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (75, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (76, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (77, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (78, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (79, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (80, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (81, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (82, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (83, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (84, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (85, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (86, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (87, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (88, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (89, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (90, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (91, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (92, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (93, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (94, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (95, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (96, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (97, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (98, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (99, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (100, 61, 1)
GO
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (101, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (102, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (103, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (104, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (105, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (106, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (107, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (108, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (109, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (110, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (111, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (112, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (113, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (114, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (115, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (116, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (117, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (118, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (119, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (120, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (121, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (122, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (123, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (124, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (125, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (126, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (127, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (128, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (129, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (130, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (131, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (132, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (133, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (134, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (135, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (136, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (137, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (138, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (139, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (140, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (141, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (142, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (143, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (144, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (145, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (146, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (147, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (148, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (149, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (150, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (151, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (152, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (153, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (154, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (155, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (156, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (157, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (158, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (159, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (160, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (161, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (162, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (163, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (164, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (165, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (166, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (167, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (168, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (169, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (170, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (171, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (172, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (173, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (174, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (175, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (176, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (177, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (178, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (179, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (180, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (181, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (182, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (183, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (184, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (185, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (186, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (187, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (188, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (189, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (190, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (191, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (192, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (193, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (194, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (195, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (196, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (197, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (198, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (199, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (200, 61, 1)
GO
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (201, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (202, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (203, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (204, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (205, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (206, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (207, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (208, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (209, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (210, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (211, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (212, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (213, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (214, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (215, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (216, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (217, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (218, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (219, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (220, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (221, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (222, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (223, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (224, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (225, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (226, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (227, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (228, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (229, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (230, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (231, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (232, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (233, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (234, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (235, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (236, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (237, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (238, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (239, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (240, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (241, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (242, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (243, 61, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (244, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (245, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (246, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (247, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (248, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (249, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (250, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (251, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (252, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (253, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (254, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (255, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (256, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (257, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (258, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (259, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (260, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (261, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (262, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (263, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (264, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (265, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (266, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (267, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (268, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (269, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (270, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (271, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (272, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (273, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (274, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (275, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (276, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (277, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (278, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (279, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (280, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (281, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (282, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (283, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (284, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (285, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (286, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (287, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (288, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (289, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (290, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (291, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (292, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (293, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (294, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (295, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (296, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (297, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (298, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (299, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (300, 62, 1)
GO
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (301, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (302, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (303, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (304, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (305, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (306, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (307, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (308, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (309, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (310, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (311, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (312, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (313, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (314, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (315, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (316, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (317, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (318, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (319, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (320, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (321, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (322, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (323, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (324, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (325, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (326, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (327, 62, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (328, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (329, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (330, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (331, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (332, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (333, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (334, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (335, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (336, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (337, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (338, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (339, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (340, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (341, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (342, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (343, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (344, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (345, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (346, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (347, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (348, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (349, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (350, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (351, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (352, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (353, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (354, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (355, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (356, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (357, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (358, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (359, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (360, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (361, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (362, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (363, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (364, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (365, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (366, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (367, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (368, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (369, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (370, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (371, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (372, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (373, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (374, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (375, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (376, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (377, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (378, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (379, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (380, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (381, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (382, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (383, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (384, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (385, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (386, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (387, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (388, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (389, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (390, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (391, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (392, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (393, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (394, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (395, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (396, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (397, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (398, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (399, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (400, 63, 1)
GO
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (401, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (402, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (403, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (404, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (405, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (406, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (407, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (408, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (409, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (410, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (411, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (412, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (413, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (414, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (415, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (416, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (417, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (418, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (419, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (420, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (421, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (422, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (423, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (424, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (425, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (426, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (427, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (428, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (429, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (430, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (431, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (432, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (433, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (434, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (435, 63, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (436, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (437, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (438, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (439, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (440, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (441, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (442, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (443, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (444, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (445, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (446, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (447, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (448, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (449, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (450, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (451, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (452, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (453, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (454, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (455, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (456, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (457, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (458, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (459, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (460, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (461, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (462, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (463, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (464, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (465, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (466, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (467, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (468, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (469, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (470, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (471, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (472, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (473, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (474, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (475, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (476, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (477, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (478, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (479, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (480, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (481, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (482, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (483, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (484, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (485, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (486, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (487, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (488, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (489, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (490, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (491, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (492, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (493, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (494, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (495, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (496, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (497, 64, 1)
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [UserTypeID]) VALUES (498, 64, 1)
GO
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (75, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (76, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (77, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (78, 153)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (79, 404)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (80, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (81, 154)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (82, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (83, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (84, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (85, 409)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (86, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (87, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (88, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (89, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (90, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (91, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (92, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (93, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (94, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (95, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (96, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (97, 297)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (98, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (99, 365)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (100, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (101, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (102, 297)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (103, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (104, 293)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (105, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (106, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (107, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (108, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (109, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (110, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (111, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (112, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (113, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (114, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (115, 173)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (116, 165)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (117, 362)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (118, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (119, 405)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (120, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (121, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (122, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (123, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (124, 376)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (125, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (126, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (127, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (128, 393)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (129, 404)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (130, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (131, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (132, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (133, 173)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (134, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (135, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (136, 182)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (137, 182)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (138, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (139, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (140, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (141, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (142, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (143, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (144, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (145, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (146, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (147, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (148, 279)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (149, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (150, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (151, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (152, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (153, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (154, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (155, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (156, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (157, 160)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (158, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (159, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (160, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (161, 59)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (162, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (163, 376)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (164, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (165, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (166, 376)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (167, 376)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (168, 182)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (169, 182)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (170, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (171, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (172, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (173, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (174, 172)
GO
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (175, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (176, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (177, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (178, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (179, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (180, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (181, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (182, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (183, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (184, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (185, 182)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (186, 182)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (187, 182)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (188, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (189, 172)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (190, 371)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (191, 371)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (192, 371)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (193, 371)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (194, 371)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (195, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (196, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (197, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (198, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (199, 325)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (200, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (201, 376)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (202, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (203, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (204, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (205, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (206, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (207, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (208, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (209, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (210, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (211, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (212, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (213, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (214, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (215, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (216, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (217, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (218, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (219, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (220, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (221, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (222, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (223, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (224, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (225, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (226, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (227, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (228, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (229, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (230, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (231, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (232, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (233, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (234, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (235, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (236, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (237, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (238, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (239, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (240, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (241, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (242, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (243, 282)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (244, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (245, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (246, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (247, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (248, 353)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (249, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (250, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (251, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (252, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (253, 353)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (254, 352)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (255, 352)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (256, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (257, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (258, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (259, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (260, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (261, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (262, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (263, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (264, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (265, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (266, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (267, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (268, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (269, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (270, 353)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (271, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (272, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (273, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (274, 354)
GO
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (275, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (276, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (277, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (278, 409)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (279, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (280, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (281, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (282, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (283, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (284, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (285, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (286, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (287, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (288, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (289, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (290, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (291, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (292, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (293, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (294, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (295, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (296, 353)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (297, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (298, 352)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (299, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (300, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (301, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (302, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (303, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (304, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (305, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (306, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (307, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (308, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (309, 160)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (310, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (311, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (312, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (313, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (314, 293)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (315, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (316, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (317, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (318, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (319, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (320, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (321, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (322, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (323, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (324, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (325, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (326, 293)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (327, 293)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (328, 352)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (329, 352)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (330, 352)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (331, 352)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (332, 352)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (333, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (334, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (335, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (336, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (337, 351)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (338, 353)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (339, 353)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (340, 353)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (341, 353)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (342, 352)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (343, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (344, 104)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (345, 102)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (346, 102)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (347, 102)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (348, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (349, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (350, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (351, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (352, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (353, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (354, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (355, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (356, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (357, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (358, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (359, 107)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (360, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (361, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (362, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (363, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (364, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (365, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (366, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (367, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (368, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (369, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (370, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (371, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (372, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (373, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (374, 163)
GO
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (375, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (376, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (377, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (378, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (379, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (380, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (381, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (382, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (383, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (384, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (385, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (386, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (387, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (388, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (389, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (390, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (391, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (392, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (393, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (394, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (395, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (396, 354)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (397, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (398, 328)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (399, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (400, 409)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (401, 409)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (402, 409)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (403, 409)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (404, 409)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (405, 409)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (406, 324)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (407, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (408, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (409, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (410, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (411, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (412, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (413, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (414, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (415, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (416, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (417, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (418, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (419, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (420, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (421, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (422, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (423, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (424, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (425, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (426, 293)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (427, 293)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (428, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (429, 293)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (430, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (431, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (432, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (433, 207)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (434, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (435, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (436, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (437, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (438, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (439, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (440, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (441, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (442, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (443, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (444, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (445, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (446, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (447, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (448, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (449, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (450, 104)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (451, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (452, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (453, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (454, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (455, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (456, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (457, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (458, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (459, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (460, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (461, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (462, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (463, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (464, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (465, 322)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (466, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (467, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (468, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (469, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (470, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (471, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (472, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (473, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (474, 354)
GO
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (475, 163)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (476, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (477, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (478, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (479, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (480, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (481, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (482, 207)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (483, 207)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (484, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (485, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (486, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (487, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (488, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (489, 293)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (490, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (491, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (492, 293)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (493, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (494, 293)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (495, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (496, 214)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (497, 125)
INSERT [dbo].[BookCategory] ([BookID], [CategoryID]) VALUES (498, 214)
GO
SET IDENTITY_INSERT [dbo].[BookFormat] ON 

INSERT [dbo].[BookFormat] ([BookFormatID], [BookFormat], [Name], [RecStatus]) VALUES (1, N'ஆடியோ', N'Audio', N'A')
INSERT [dbo].[BookFormat] ([BookFormatID], [BookFormat], [Name], [RecStatus]) VALUES (2, N'கதை சொல்லல்', N'Story Telling', N'A')
INSERT [dbo].[BookFormat] ([BookFormatID], [BookFormat], [Name], [RecStatus]) VALUES (3, N'கிண்டில்', N'Kindle', N'A')
INSERT [dbo].[BookFormat] ([BookFormatID], [BookFormat], [Name], [RecStatus]) VALUES (4, N'கெட்டி அட்டை', N'Hard Copy', N'A')
INSERT [dbo].[BookFormat] ([BookFormatID], [BookFormat], [Name], [RecStatus]) VALUES (5, N'தாள் அட்டை', N'Paper Copy', N'A')
INSERT [dbo].[BookFormat] ([BookFormatID], [BookFormat], [Name], [RecStatus]) VALUES (6, N'மின்நூல்', N'eBook', N'A')
SET IDENTITY_INSERT [dbo].[BookFormat] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (1, N'தொல்காப்பியம்', N'Tholkappiyam', N'Tholkappiyam', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (2, N'திருக்குறள்', N'Thirukkural', N'Thirukkural', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (3, N'ஞான வெட்டியான்', N'Gnana Vettiyan', N'Gnana Vettiyan', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (4, N'இறையனார் அகப்பொருள்', N'', N'Iraiyanar Akapporul', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (5, N'புறப்பொருள் வெண்பாமாலை', N'', N'purapporul venbamalai', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (6, N'யாப்பருங்கலம்', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (7, N'யாப்பருங்கலக் காரிகை', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (8, N'வீரசோழியம்', N'', N'Veerasozhiyam', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (9, N'தண்டியலங்காரம்', N'', N'Thandialangaram', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (10, N'நேமிநாதம்', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (11, N'நன்னூல்', N'', N'Nannul', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (12, N'மாறனகப் பொருள்', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (13, N'மாறனலங்காரம்', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (14, N'இலக்கண விளக்கம்', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (15, N'இலக்கணக் கொத்து', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (16, N'சாமிநாதம்', N'', N'Samynatham', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (17, N'தொன்னூல் விளக்கம்', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (18, N'பரமார்த்த குரு கதை', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (19, N'தேம்பாவணி', N'Thembavani', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (20, N'சதுரகராதி', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (21, N'எதுகை அகராதி', N'Ethukai Agarathi', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (22, N'அறுவகை இலக்கணம்', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (23, N'முத்து வீரியம்', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (24, N'நவநீதப் பாட்டியல்', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (25, N'நற்றிணை', N'Natrrinai', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (26, N'குறுந்தொகை', N'Kuruntokai', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (27, N'ஐங்குறுநூறு', N'Ainkurunuru', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (28, N'பதிற்றுப்பத்து', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (29, N'பரிபாடல்', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (30, N'கலித்தொகை', N'Kalittokai', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (31, N'அகநானுறு', N'Akananuru', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (32, N'புறநானுறு', N'Purananuru', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (33, N'நாலடியார்', N'', N'Nalatiyar', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (34, N'நான்மணிக்கடிகை', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (35, N'இன்னா நாற்பது', N'inna narpathu', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (36, N'இனியவை நாற்பது', N'', N'iniyavai narpathu', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (37, N'கார் நாற்பது', N'', N'kaar narpathu', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (38, N'களவழி நாற்பது', N'', N'kalavali narpathu', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (39, N'ஐந்திணை ஐம்பது', N'', N'Ainti ai aimpatu', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (40, N'திணைமொழி ஐம்பது', N'', N'tinaimozhi aimpathu', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (41, N'ஐந்திணை எழுபது', N'Ainti?ai e?upatu', N'aintinai elupathu', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (42, N'திணைமாலை நூற்றைம்பது', N'', N'tinaimalai nutraimpathu', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (43, N'திரிகடுகம்', N'', N'tirikadukam', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (44, N'ஆசாரக்கோவை', N'', N'acarakkovai', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (45, N'பழமொழி நானுறு', N'', N'palamozhi nanuru', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (46, N'சிறுபஞ்சமூலம்', N'', N'cirupanchamoolam', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (47, N'முதுமொழிக்காஞ்சி', N'', N'mutumozhikkanchi', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (48, N'ஏலாதி', N'', N'elati', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (49, N'கைந்நிலை', N'', N'Kainnilai', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (50, N'திருமுருகாற்றுப்படை', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (51, N'பொருநராற்றுப்படை', N'', N'porunarrarruppatai', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (52, N'சிறுபாணாற்றுப்படை', N'', N'cirupanarruppatai', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (53, N'பெரும்பாணாற்றுப்படை', N'', N'perumpanarruppatai', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (54, N'முல்லைப்பாட்டு', N'', N'Mullaippattu', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (55, N'மதுரைக் கஞ்சி', N'', N'maduraik kanchi', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (56, N'நெடுநல்வாடை', N'', N'nedunalvadai', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (57, N'குறிஞ்சிப் பாட்டு', N'', N'kurunjip paddu', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (58, N'பட்டினப் பாலை', N'', N'pattinap pallai', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (59, N'மலைபடுகடாம்', N'', N'malaipadukadam', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (60, N'சிலப்பதிகாரம்', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (61, N'மணிமேகலை', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (62, N'சீவக சிந்தாமணி', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (63, N'வளையாபதி', N'', N'Valaiyapathy', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (64, N'குண்டலகேசி', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (65, N'சூளாமணி', N'', N'Soolamani', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (66, N'யசோதர காவியம்', N'', N'Yesodhara Kaviyam', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (67, N'உதயண குமார காவியம்', N'', N'Udhayana Kumara Kaviyam', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (68, N'நாககுமார காவியம்', N'', N'Nagakumara Kaviyam', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (69, N'நீலகேசி', N'', N'Neelakesi', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (70, N'ஆத்திச்சூடி', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (71, N'கொன்றை வேந்தன்', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (72, N'மூதுரை', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (73, N'நல்வழி', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (74, N'பெரியபுராணம்', N'', N'', NULL, 1, CAST(N'2022-02-20' AS Date), NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (75, N'இதுதான் மகாமகம் ', NULL, N'Idhuthan Magamagam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (76, N'கிராமச் சீர்திருத்தம்', NULL, N'Gramach Seerthirutham', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (77, N'மனுநீதி ஒரு குலத்துக்கு ஒரு நீதி ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (78, N'வகுப்புவாரி உரிமை ஏன்?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (79, N'திராவிடர் - ஆரியர் உண்மை ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (80, N'சுயமரியாதைத் திருமணம் ஏன்?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (81, N'இனி வரும் உலகம்(விரிவாக்கப்பட்ட பதிப்பு)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (82, N'புத்த நெறி', NULL, N'Buddha Neri', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (83, N'சிந்தனையும் பகுத்தறிவும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (84, N'சுயநலம் பிறநலம் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (85, N'தந்தை பெரியாரே எழுதிய சுயசரிதை ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (86, N'சுயமரியாதை இயக்ககத்தைத் தோற்றுவித்ததேன்?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (87, N'புரட்சி ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (88, N'கடவுள் மறுப்புத் தத்துவம் ஒரு விளக்கம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (89, N'மதமாற்றம் மதவெறியும் ', NULL, N'mathamatramum mathaverium', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (90, N'இளைஞர்களுக்கு அழைப்பு ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (91, N'இரயில்வே தொழிலாளர்களுக்குப் பெரியார் அறிவுரை ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (92, N'மனித வாழ்வின் பெருமை எது?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (93, N'தந்தை பெரியாரின் இறுதி பேருரை (விரிவாக்கப்பட்ட பதிப்பு)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (94, N'மனிதனும் மதமும் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (95, N'கடவுளும் மனிதனும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (96, N'அறிவு விருந்து ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (97, N'மெட்டிரியலிசம் அல்லது பொருள்முதல் வாதம் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (98, N'இந்து மதமும் தமிழர்களும் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (99, N'இந்து மதப் பண்டிகைகள்', NULL, N'hindumadhap pandigaikal', NULL, 1, NULL, NULL, N'A')
GO
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (100, N'வாழ்க்கைத் துணைநலம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (101, N'இராமாயணக் குறிப்புகள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (102, N'தத்துவ விளக்கம் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (103, N'இலக்கியம் வளர்ச்சிக்கு உதவ வேண்டாமா?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (104, N'தந்தை பெரியார் அவர்களின் இலங்கைப் பேருரை ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (105, N'பகுத்தறிவுச் சுடர் ஏங்குவீர்!', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (106, N'இளைஞர்களுக்கு தந்தை பெரியார் அறிவுரை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (107, N'உயர் எண்ணங்கள் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (108, N'சோதிட ஆராய்ச்சி ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (109, N'நமது குறிக்கோள்(தொகுதி 1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (110, N'நவமணிகள்(தொகுதி)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (111, N'வானொலியில் தந்தை பெரியார் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (112, N'அய்க்கோர்ட் நீதிப்போக்கு பாகம் - 2', NULL, N'Highcourt Needhippokku Part   2', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (113, N'சித்திர புத்திரன் கட்டுரைகள் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (114, N'பெண் ஏன் அடிமையானாள்?', NULL, N'pen yen adimaiyaanaal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (115, N'ஜாதி ஒழிய வேண்டும் ஏன்?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (116, N'தமிழர் தமிழ்நாடு தமிழர் பண்பாடு ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (117, N'பொன்மொழிகள் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (118, N'சமுதாய சீர்திருத்தம் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (119, N'இராமாயணப் பாத்திரங்கள் ', NULL, N'Ramayana Paaththirangal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (120, N'தந்தை பெரியாரின் லட்சிய முழக்கங்கள் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (121, N'எழுத்துச் சீர்திருத்தம் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (122, N'ஆச்சாரியார் ஆட்சியின் கொடுமைகள்', NULL, N'aachariyaar aatchiyin kodumaigal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (123, N'வாலமீகி இராமாயண சம்பாஷணைகள்', NULL, N'Valmiki Ramayana Sambashani', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (124, N'புராணம் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (125, N'பகுத்தறிவு ஏன்? எதற்காக?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (126, N'புரட்டு இமாலய புரட்டு ', NULL, N'Purattu imalayap Purattu', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (127, N'கர்ப்ப ஆட்சி', NULL, N'suyamariyathai iyakkathai thotruvithathen', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (128, N'இந்தி போர் முரசு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (129, N'எனது தொண்டு ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (130, N'தீண்டாமையை ஒழித்தது யார்?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (131, N'திராவிட விவசாய தொழிலாளர் கழக அமைப்பு ', NULL, N'Dravida Vivasaaya THozhilaalar Kazhaga Amaippu Nokkangal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (132, N'பெரியார் ஒளி முத்துக்கள் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (133, N'ஜாதி ஒழிப்புப் புரட்சி', NULL, N'Jathi Ozhippu Puratchi', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (134, N'புதியதோர் உலகு செய்வோம் ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (135, N'குடிஅரசு கலம்பம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (136, N'பெண் விடுதலை ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (137, N'பெரியார் அறிவுரை பெண்களுக்கு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (138, N'நீதி கெட்டது யாரால்?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (139, N'தமிழனை அடிமையாக்கியவை எவை?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (140, N'பெரியாரைப் பற்றி பெரியார்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (141, N'கடவுள் பக்தர்களின் சிந்தனைக்கு...', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (142, N'கடவுளும் மதமும் ஒழிய வேண்டும் ஏன்?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (143, N'மாணவர்களுக்கு...', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (144, N'தமிழிசை - மாற்றம் வேண்டும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (145, N'வகுப்புவாரி உரிமையின் வரலாறும் பின்னணியும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (146, N'எது கலை வளர்ச்சி?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (147, N'தன்மானம் - இனமானமும் தமிழ்ப் புலவர்களும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (148, N'கல்வி பற்றிய சிந்தனைகள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (149, N'சுயமரியாதை இயக்கத் தத்துவம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (150, N'வாழ்விணையர்களுக்குப் பெரியார் அறிவுரை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (151, N'உண்மை தொழிலாளர் யார்?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (152, N'மேல்நாடும் கீழ்நாடும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (153, N'பெண்கள் அலங்கார பொம்மைகளா?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (154, N'மே தினமும் தொழிலாளர் இயக்கமும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (155, N'பொதுவுடைமையும் சமதர்மமும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (156, N'பகுத்தறிவாளர் ஆக வேண்டும் ஏன்?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (157, N'மொழியும் இலக்கியமும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (158, N'மனித சமத்துவமும் இந்து சமுதாயமும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (159, N'மூன்று புரட்டுகள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (160, N'மனிதனின் பிறப்புரிமை சுயமரியாதையே!', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (161, N'கல்வி முறையும், தகுதி திறமையும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (162, N'தந்தை பெரியாரின் பொருளாதாரச் சிந்தனைகள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (163, N'கடவுள்-மதம் ஓர் அரிய விளக்கம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (164, N'பெரியார் களஞ்சியம் தொகுதி - 1 - கடவுள் (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (165, N'பெரியார் களஞ்சியம் தொகுதி - 2 - கடவுள் (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (166, N'பெரியார் களஞ்சியம் தொகுதி - 3 - மதம் (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (167, N'பெரியார் களஞ்சியம் தொகுதி - 4 - மதம் (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (168, N'பெரியார் களஞ்சியம் தொகுதி - 5 - பெண்ணுரிமை (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (169, N'பெரியார் களஞ்சியம் தொகுதி - 6 - பெண்ணுரிமை (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (170, N'பெரியார் களஞ்சியம் தொகுதி - 7 - ஜாதி (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (171, N'பெரியார் களஞ்சியம் தொகுதி - 8 - ஜாதி (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (172, N'பெரியார் களஞ்சியம் தொகுதி - 9 - ஜாதி (3)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (173, N'பெரியார் களஞ்சியம் தொகுதி - 10 - ஜாதி (4)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (174, N'பெரியார் களஞ்சியம் தொகுதி - 11 - ஜாதி (5)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (175, N'பெரியார் களஞ்சியம் தொகுதி - 12 - ஜாதி (6)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (176, N'பெரியார் களஞ்சியம் தொகுதி - 13 - ஜாதி (7)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (177, N'பெரியார் களஞ்சியம் தொகுதி - 14 - ஜாதி (8)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (178, N'பெரியார் களஞ்சியம் தொகுதி - 15 - ஜாதி (9)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (179, N'பெரியார் களஞ்சியம் தொகுதி - 16 - ஜாதி (10)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (180, N'பெரியார் களஞ்சியம் தொகுதி - 17 - ஜாதி (11)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (181, N'பெரியார் களஞ்சியம் தொகுதி - 18 - ஜாதி (12)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (182, N'பெரியார் களஞ்சியம் தொகுதி - 19 - ஜாதி (13)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (183, N'பெரியார் களஞ்சியம் தொகுதி - 20 - ஜாதி (14)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (184, N'பெரியார் களஞ்சியம் தொகுதி - 21 - ஜாதி (15)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (185, N'பெரியார் களஞ்சியம் தொகுதி - 22 - பெண்ணுரிமை (3)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (186, N'பெரியார் களஞ்சியம் தொகுதி - 23 - பெண்ணுரிமை (4)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (187, N'பெரியார் களஞ்சியம் தொகுதி - 24 - பெண்ணுரிமை (5)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (188, N'பெரியார் களஞ்சியம் தொகுதி - 25 - ஜாதி (16)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (189, N'பெரியார் களஞ்சியம் தொகுதி - 26 - ஜாதி (17)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (190, N'பெரியார் களஞ்சியம் தொகுதி - 27 - மதம் (3)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (191, N'பெரியார் களஞ்சியம் தொகுதி - 28 - மதம் (4)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (192, N'பெரியார் களஞ்சியம் தொகுதி - 29 - மதம் (5)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (193, N'பெரியார் களஞ்சியம் தொகுதி - 30 - மதம் (6)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (194, N'பெரியார் களஞ்சியம் தொகுதி - 31 - மதம் (7)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (195, N'பெரியார் களஞ்சியம் தொகுதி - 32 - கடவுள் (3)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (196, N'பெரியார் களஞ்சியம் தொகுதி - 33 - பகுத்தறிவு (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (197, N'பெரியார் களஞ்சியம் தொகுதி - 34 - பகுத்தறிவு (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (198, N'பெரியார் களஞ்சியம் தொகுதி - 35 - பகுத்தறிவு (3)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (199, N'பெரியார் களஞ்சியம் தொகுதி - 36 - கடவுள் - புராணங்கள் (4)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
GO
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (200, N'பெரியார் களஞ்சியம் தொகுதி - 37 - திருக்குறள் - வள்ளுவர்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (201, N'பெரியார் களஞ்சியம் தொகுதி - 38 - கடவுள் - புராணங்கள் (5)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (202, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (1) - 1925', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (203, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (2) - 1926  (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (204, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (3) - 1926 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (205, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (4) - 1927 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (206, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (5) - 1927(2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (207, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (6) - 1928(1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (208, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (7) - 1928 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (209, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (8) - 1929(1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (210, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (9) - 1929 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (211, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (10) - 1930 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (212, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (11) - 1930 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (213, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (12) - 1931 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (214, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (13) - 1931 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (215, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (14) - 1932 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (216, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (15) - 1932 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (217, N'பெரியார் களஞ்சியம் குடிஅரசு-புரட்சி தொகுதி (16) - 1933', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (218, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (17) - 1934', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (219, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (18) - 1935 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (220, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (19) - 1935 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (221, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (20) - 1936 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (222, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (21) - 1936 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (223, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (22) - 1937 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (224, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (23) - 1937 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (225, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (24) - 1938 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (226, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (25) - 1938 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (227, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (26) - 1939 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (228, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (27) - 1939 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (229, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (28) - 1940 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (230, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (29) - 1940 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (231, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (30) - 1943', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (232, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (31) - 1944 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (233, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (32) - 1944 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (234, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (33) - 1945 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (235, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (34) - 1945 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (236, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (35) - 1946 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (237, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (36) - 1946 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (238, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (37) - 1947 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (239, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (38) - 1947 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (240, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (39) - 1948 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (241, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (40) - 1948 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (242, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (41) - 1949 (1)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (243, N'பெரியார் களஞ்சியம் குடிஅரசு தொகுதி (42) - 1949 (2)', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (244, N'வெள்ளை மாளிகையில்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (245, N'பாவையின் பயணம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (246, N'வண்டிக்காரன் மகன்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (247, N'புன்னகை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (248, N'கலிங்கராணி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (249, N'திரும்பிப்பார்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (250, N'குமாஸ்தாவின் பெண்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (251, N'மக்கள் தீர்ப்பு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (252, N'ஓர் இரவு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (253, N'இரும்பாரம்', NULL, N'Irumbaaram', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (254, N'பார்வதி பி.ஏ.', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (255, N'ரங்கோன் ராதா', NULL, N'Rangon Ratha', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (256, N'அறுவடை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (257, N'காதல் ஜோதி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (258, N'இதன் விலை ரூபாய் மூவாயிரம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (259, N'குமரிக் கோட்டம்', NULL, N'Kumarik Kottam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (260, N'எட்டு நாட்கள்', NULL, N'Ettu Naatkal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (261, N'தேவ லீலைகள்', NULL, N'Theva leelaigal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (262, N'பணத்தோட்டம்', NULL, N'Panathottam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (263, N'கடைசிக் களவு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (264, N'தீ பரவும் முன்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (265, N'புதிய பொலிவு', NULL, N'Puthiya Polivu', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (266, N'கம்பரசம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (267, N'இன்பத் திராவிடம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (268, N'தேவையற்ற திருப்பணி', NULL, N'Thevaiyarra Thiruppani', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (269, N'ஆரிய மாயை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (270, N'இரும்பு முள்வேலி', NULL, N'Irumbu Mulveli', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (271, N'குடியாட்சி கோமான்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (272, N'துரோகி கப்லான்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (273, N'தசாவதாரம்', NULL, N'Dasaavathaaram', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (274, N'மழை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (275, N'கன்னி விதவையான கதை', NULL, N'Kanni Vithavaiyaana Kathai', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (276, N'ரோம் எரிகிறது', NULL, N'Rome Erigirathu', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (277, N'அல்லாடும் ஆண்டவன்', NULL, N'Allaadum Aandavan', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (278, N'மாவீரன் நெப்போலியன்', NULL, N'Maaveeran Napolean', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (279, N'நிலையும் நினைப்பும்', NULL, N'Nilaiyum Ninaippum', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (280, N'திராவிடர் நிலை', NULL, N'Dravidar Nilai', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (281, N'பெரியார் - ஒரு சகாப்தம்', NULL, N'Periyar Oru Sakaaptham', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (282, N'வர்ணாஸ்ரமம்', NULL, N'Varnaasramum', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (283, N'திராவிட இயக்கப் பெருமக்கள்', NULL, N'Dravida Iyakka Perumakkal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (284, N'மாஜி கடவுள்கள்', NULL, N'Maaji Kadavulgal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (285, N'உலகப் பெரியார் காந்தி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (286, N'காந்தியும் காந்தியமும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (287, N'ரோமாபுரி ராணிகள்', NULL, N'Romapuri Ranikal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (288, N'தஞ்சை வீழ்ச்சி', NULL, N'Thanjai Veezhchi', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (289, N'திருமலை கண்ட திவ்யஜோதி', NULL, N'Thirumalai Kanda Divya Jothi', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (290, N'சிங்களச் சீமாட்டி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (291, N'கோமளத்தின் கோபம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (292, N'கபோதிபுரத்துக் காதல்', NULL, N'Kapothipurathu Kadhal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (293, N'செவ்வாழை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (294, N'மங்களபுரி மைனர்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (295, N'சந்திரமோகன் (அ) சிவாஜி கண்ட இந்து ராஜ்யம்', NULL, N'Chandramohan or Sivaji Kanda Iindhu Rajyam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (296, N'பிடி சாம்பல்', NULL, N'Pidi Sambal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (297, N'சொர்க்கவாசல்', NULL, N'sorkkavasal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (298, N'என் வாழ்வு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (299, N'செங்கரும்பு', NULL, N'Senkarumbu', NULL, 1, NULL, NULL, N'A')
GO
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (300, N'நீதிதேவன் மயக்கம்', NULL, N'Needhidevan Mayakkam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (301, N'ரொட்டித் துண்டு', NULL, N'Rotti Thundu', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (302, N'யார் கேட்க முடியும்?', NULL, N'Yaar Kedkkamudiyum', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (303, N'சந்திரோதயம்', NULL, N'Santhrothayam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (304, N'வேலைக்காரி', NULL, N'Velaikaari', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (305, N'இரு பரம்பரைகள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (306, N'அண்ணாவின் கவிதைகள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (307, N'அப்போதே சொன்னேன்', NULL, N'Appothe Sonnen', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (308, N'பவழபஸ்பம்  ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (309, N'இலக்கியச் சோலை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (310, N'பாரதம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (311, N'நீதிபதி வக்கீலானார்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (312, N'கைதி எண் 6342', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (313, N'தீ பரவட்டும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (314, N'ஏ தாழ்ந்த தமிழகமே!', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (315, N'உடன் பிறந்தார் இருவர்', NULL, N'Udanpiranthar Iruvar', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (316, N'இந்துமதமும் தமிழரும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (317, N'பேரறிஞர் அண்ணாவின் கட்டுரைகள் தொகுதி - 1', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (318, N'பேரறிஞர் அண்ணாவின் கட்டுரைகள் தொகுதி - 2', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (319, N'பேரறிஞர் அண்ணாவின் கடிதங்கள் தொகுதி - 1', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (320, N'பேரறிஞர் அண்ணாவின் கடிதங்கள் தொகுதி - 2', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (321, N'பேரறிஞர் அண்ணாவின் கடிதங்கள் தொகுதி - 3', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (322, N'பேரறிஞர் அண்ணாவின் கடிதங்கள் தொகுதி - 4', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (323, N'பேரறிஞர் அண்ணாவின் கடிதங்கள் தொகுதி - 5', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (324, N'பேரறிஞர் அண்ணாவின் கடிதங்கள் தொகுதி - 6', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (325, N'பேரறிஞர் அண்ணாவின் கடிதங்கள் தொகுதி - 7', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (326, N'பேரறிஞர் அண்ணாவின் சொற்பொழிவுகள் தொகுதி - 1', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (327, N'பேரறிஞர் அண்ணாவின் சொற்பொழிவுகள் தொகுதி - 2', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (328, N'வெள்ளிக்கிழமை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (329, N'சுருளிமலை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (330, N'வான்கோழி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (331, N'புதையல்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (332, N'ஒரே இரத்தம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (333, N'ஒரு மரம் பூத்தது', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (334, N'அரும்பு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (335, N'பெரிய இடத்துப் பெண்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (336, N'சாரப்பள்ளம் சாமுண்டி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (337, N'நடுத்தெரு நாராயணி', NULL, N'Irumbaaram', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (338, N'பலிபீடம் நோக்கி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (339, N'ரோமாபுரிப் பாண்டியன்', NULL, N'Rangon Ratha', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (340, N'பொன்னர் – சங்கர் அண்ணன்மார் வரலாறு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (341, N'பாயும் புலி பண்டாரக வன்னியன்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (342, N'தென்பாண்டிச் சிங்கம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (343, N'தாய் – காவியம்', NULL, N'Kumarik Kottam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (344, N'குறளோவியம்', NULL, N'Ettu Naatkal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (345, N'சங்கத் தமிழ் (கவிதை நடை விளக்கம்)', NULL, N'Theva leelaigal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (346, N'திருக்குறள் கலைஞர் உரை', NULL, N'Panathottam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (347, N'தொல்காப்பியப் பூங்கா', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (348, N'கலைஞர் கடிதம் தொகுதி - 1', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (349, N'கலைஞர் கடிதம் தொகுதி - 2', NULL, N'Puthiya Polivu', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (350, N'கலைஞர் கடிதம் தொகுதி - 3', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (351, N'கலைஞர் கடிதம் தொகுதி - 4', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (352, N'கலைஞர் கடிதம் தொகுதி - 5', NULL, N'Thevaiyarra Thiruppani', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (353, N'கலைஞர் கடிதம் தொகுதி - 6', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (354, N'கலைஞர் கடிதம் தொகுதி - 7', NULL, N'Irumbu Mulveli', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (355, N'கலைஞர் கடிதம் தொகுதி - 8', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (356, N'கலைஞர் கடிதம் தொகுதி - 9', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (357, N'கலைஞர் கடிதம் தொகுதி - 10', NULL, N'Dasaavathaaram', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (358, N'கலைஞர் கடிதம் தொகுதி - 11', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (359, N'கலைஞர் கடிதம் தொகுதி - 12', NULL, N'Kanni Vithavaiyaana Kathai', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (360, N'உணர்ச்சி மாலை', NULL, N'Rome Erigirathu', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (361, N'பெருமூச்சு', NULL, N'Allaadum Aandavan', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (362, N'மீசை முளைத்த வயதில்', NULL, N'Maaveeran Napolean', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (363, N'பேசும் கலை வளர்ப்போம்', NULL, N'Nilaiyum Ninaippum', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (364, N'பூந்தோட்டமும் – இனமுழக்கமும்', NULL, N'Dravidar Nilai', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (365, N'யாரால்? யாரால்? யாரால்?', NULL, N'Periyar Oru Sakaaptham', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (366, N'மலரும் நினைவுகள்', NULL, N'Varnaasramum', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (367, N'இலங்கைத் தமிழா, இது கேளா', NULL, N'Dravida Iyakka Perumakkal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (368, N'திராவிடசம்பத்து', NULL, N'Maaji Kadavulgal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (369, N'தலைதாழாச் சிங்கம் தந்தை பெரியார்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (370, N'உரிமையின் குரலும் – உண்மையின் தெளிவும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (371, N'இருளும் ஒளியும்', NULL, N'Romapuri Ranikal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (372, N'சரித்திரத் திருப்பம்', NULL, N'Thanjai Veezhchi', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (373, N'உண்மைகளின் வெளிச்சத்தில்', NULL, N'Thirumalai Kanda Divya Jothi', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (374, N'மயிலிறகு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (375, N'அகிம்சா மூர்த்திகள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (376, N'அல்லி தர்பார்', NULL, N'Kapothipurathu Kadhal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (377, N'இன முழக்கம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (378, N'கலைஞரின் கவிதைகள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (379, N'சுழல் விளக்கு', NULL, N'Chandramohan or Sivaji Kanda Iindhu Rajyam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (380, N'துடிக்கும் இளமை', NULL, N'Pidi Sambal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (381, N'நாடும் நாடகமும்', NULL, N'sorkkavasal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (382, N'விடுதலைக் கிளர்ச்சி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (383, N'சங்கிலிச் சாமியார்', NULL, N'Senkarumbu', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (384, N'கிழவன் கனவு', NULL, N'Needhidevan Mayakkam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (385, N'பிள்ளையோ பிள்ளை', NULL, N'Rotti Thundu', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (386, N'தப்பிவிட்டார்கள்', NULL, N'Yaar Kedkkamudiyum', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (387, N'தாய்மை', NULL, N'Santhrothayam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (388, N'கண்ணடக்கம்', NULL, N'Velaikaari', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (389, N'சிலப்பதிகாரம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (390, N'முடியாத தொடர்கதை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (391, N'கலைஞர் கருணாநிதியின் சிறுகதைகள்', NULL, N'Appothe Sonnen', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (392, N'16 கதையினிலே', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (393, N'நளாயினி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (394, N'பழக்கூடை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (395, N'வாழ முடியாதவர்கள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (396, N'தேனலைகள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (397, N'சாம்ராட் அசோகன்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (398, N'இனியவை இருபது', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (399, N'ஆறுமாதக் கடுங்காவல்', NULL, N'Udanpiranthar Iruvar', NULL, 1, NULL, NULL, N'A')
GO
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (400, N'நெஞ்சுக்கு நீதி - பாகம் - 1', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (401, N'நெஞ்சுக்கு நீதி - பாகம் - 2', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (402, N'நெஞ்சுக்கு நீதி - பாகம் - 3', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (403, N'நெஞ்சுக்கு நீதி - பாகம் - 4', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (404, N'நெஞ்சுக்கு நீதி - பாகம் - 5', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (405, N'நெஞ்சுக்கு நீதி - பாகம் - 6', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (406, N'கையில் அள்ளிய கடல்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (407, N'சிறையில் பூத்த சின்ன சின்ன மலர்கள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (408, N'நச்சுக்கோப்பை சாந்தா (அ) பழனியப்பன்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (409, N'மகான் பெற்ற மகன்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (410, N'மணி மகுடம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (411, N'தூக்கு மேடை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (412, N'உதயசூரியன்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (413, N'ஒரே முத்தம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (414, N'திருவாளர் தேசியம்பிள்ளை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (415, N'பரதாயணம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (416, N'புனித இராஜ்யம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (417, N'நான்மணிமாலை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (418, N'காகிதப் பூ', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (419, N'பரப்பிரம்மம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (420, N'நானே அறிவாளி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (421, N'அனார்கலி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (422, N'சாக்ரடீஸ்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (423, N'உன்னைத்தான் தம்பி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (424, N'சேரன் செங்குட்டுவன்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (425, N'சிந்தனையும் செயலும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (426, N'முத்துக் குளியல் - பாகம் 1', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (427, N'முத்துக் குளியல் - பாகம் 2', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (428, N'காலப் பேழையும் கவிதைச் சாவியும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (429, N'இளைய சமுதாயம் எழுகவே', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (430, N'கலைஞரின் கவிதை மழை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (431, N'சக்கரவர்த்தியின் திருமகன்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (432, N'கல்லக்குடி களம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (433, N'மனோகரா', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (434, N'மேடையிலே வீசிய மெல்லிய பூங்காற்று', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (435, N'நெருக்கடி நெருப்பாறு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (436, N'இருண்ட வீடு', NULL, N'Irunda Veedu', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (437, N'இளைஞர் இலக்கியம்', NULL, N'Ilainjar Ilakkiyam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (438, N'அழகின் சிரிப்பு', NULL, N'Azakin Cirippu', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (439, N'தமிழியக்கம்', NULL, N'Thamizhiyakkam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (440, N'எதிர்பாராத முத்தம்', NULL, N'Etir Parata Muttam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (441, N'சேரதாண்டவம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (442, N'குடும்ப விளக்கு', NULL, N'Kudumpa Vilakku', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (443, N'இசையமுது', NULL, N'Isai Amutu', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (444, N'நல்ல தீர்ப்பு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (445, N'வேங்கையே எழுக', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (446, N'வந்தவர் மொழியா? செந்தமிழ்ச் செல்வமா?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (447, N'முல்லைக்காடு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (448, N'மானுடம் போற்று', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (449, N'பிசிராந்தையார்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (450, N'பாரதிதாசன் திருக்குறள் உரை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (451, N'பாரதிதாசன் கவிதைகள் (முதல் தொகுதி)', NULL, N'Bhrathidasan Kavitaikal - I Volume', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (452, N'பாரதிதாசன் கவிதைகள் (இரண்டாம் தொகுதி)', NULL, N'Bhrathidasan Kavitaikal - II Volume', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (453, N'பாரதிதாசன் கவிதைகள் (மூன்றாம் தொகுதி)', NULL, N'Bhrathidasan Kavitaikal - III Volume', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (454, N'பாரதிதாசன் கவிதைகள் (நான்காம் தொகுதி)', NULL, N'Bhrathidasan Kavitaikal - IV Volume', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (455, N'பாண்டியன் பரிசு', NULL, N'Pandiyan Parisu', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (456, N'படித்த பெண்கள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (457, N'பன்மணித்திரள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (458, N'நாள் மலர்கள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (459, N'தேனருவி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (460, N'தமிழுக்கு அமிழ்தென்று பேர்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (461, N'தமிழச்சியின் கத்தி', NULL, N'Tamizhachiyin Katti', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (462, N'செளமியன்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (463, N'சஞ்சீவி பர்வதத்தின் சாரல்', NULL, N'Sanjeevi Parvathathin Saral', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (464, N'கோயில் இருகோணங்கள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (465, N'கேட்டலும் கிளத்தலும்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (466, N'குறிஞ்சித் திட்டு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (467, N'குயில் பாடல்கள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (468, N'குமரகுருபரர்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (469, N'காதலா? கடமையா?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (470, N'கற்கண்டு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (471, N'கழைக் கூத்தியின் காதல்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (472, N'கண்ணகி புரட்சிக் காப்பியம்', NULL, N'Kannaki Puratchi Kappiyam', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (473, N'கடற்மேற் குமிழிகள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (474, N'ஏழைகள் சிரிக்கிறார்கள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (475, N'உலகுக்கோர் ஐந்தொழுக்கம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (476, N'இரணியன் அல்லது இணையற்ற வீரன்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (477, N'அமைதி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (478, N'அமிழ்து எது?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (479, N'இன்பக்கடல்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (480, N'சத்திமுத்தப் புலவர்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (481, N'அகத்தியன்விட்ட புதுக்கரடி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (482, N'வளையாபதி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (483, N'ஆயிரம் தலை வாங்கிய அபூர்வ சிந்தாமணி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (484, N'மணிமேகலை வெண்பா', NULL, N'Manimekalai Venba', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (485, N'புரட்சிக்கவி', NULL, N'Puratchi Kavi', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (486, N'காதல் நினைவுகள்', NULL, N'Kathal Ninaivugal', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (487, N'வீரத்தாய்', NULL, N'Veerathaai', NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (488, N'தன்மானத் தாலாட்டு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (489, N'கவிஞர் பேசுகிறார்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (490, N'திராவிடர் திருப்பாடல்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (491, N'பாரதிதாசன் ஆத்திசூடி', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (492, N'எது இசை?', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (493, N'ஏற்றப்பாட்டு', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (494, N'தமிழ் இன்பம்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (495, N'தாயின் மேல் ஆணை', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (496, N'ஒரு தாயின் உள்ளம் மகிழ்கிறது', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (497, N'தலைமலை கண்ட தேவர்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
INSERT [dbo].[Books] ([BookID], [Book], [Name], [Tanglish], [BookDescription], [AdminUserID], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (498, N'புகழ் மலர்கள்', NULL, NULL, NULL, 1, NULL, NULL, N'A')
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[BooksDetails] ON 

INSERT [dbo].[BooksDetails] ([BookDetailsID], [BookID], [BookCode], [Price], [Pages], [PublisherID], [NoofCopy], [BookFormat], [ImgBookSmallFS], [ImgBookSmallBS], [ImgBookLarge], [ISBN13], [FirstEdition], [CurrentEdition], [Dimensions], [IsKarkaBook], [EnteredBy], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (1, 339, N'', CAST(400.00 AS Decimal(6, 2)), 655, 513, 1, 4, N'Romapurip-Paandiyan - FS.jpg', N'', N'Romapurip-Paandiyan-L.jpg', N'', N'', N'', N'', 0, 1, CAST(N'2021-01-15' AS Date), NULL, N'A')
INSERT [dbo].[BooksDetails] ([BookDetailsID], [BookID], [BookCode], [Price], [Pages], [PublisherID], [NoofCopy], [BookFormat], [ImgBookSmallFS], [ImgBookSmallBS], [ImgBookLarge], [ISBN13], [FirstEdition], [CurrentEdition], [Dimensions], [IsKarkaBook], [EnteredBy], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (2, 391, N'', CAST(55.00 AS Decimal(6, 2)), 279, 513, 1, 5, N'Kalaignar-Sirukathaigal.jpg', N'', N'Kalaignar-Sirukathaigal.jpg', N'', N'', N'', N'', 1, 1, CAST(N'2021-01-15' AS Date), NULL, N'A')
INSERT [dbo].[BooksDetails] ([BookDetailsID], [BookID], [BookCode], [Price], [Pages], [PublisherID], [NoofCopy], [BookFormat], [ImgBookSmallFS], [ImgBookSmallBS], [ImgBookLarge], [ISBN13], [FirstEdition], [CurrentEdition], [Dimensions], [IsKarkaBook], [EnteredBy], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (3, 333, N'', CAST(40.00 AS Decimal(6, 2)), 125, 513, 1, 5, N'oru-maram-pooththadhu-FS.png', N'', N'oru-maram-pooththadhu-B.png', N'', N'', N'', N'', 0, 1, CAST(N'2021-01-15' AS Date), NULL, N'A')
INSERT [dbo].[BooksDetails] ([BookDetailsID], [BookID], [BookCode], [Price], [Pages], [PublisherID], [NoofCopy], [BookFormat], [ImgBookSmallFS], [ImgBookSmallBS], [ImgBookLarge], [ISBN13], [FirstEdition], [CurrentEdition], [Dimensions], [IsKarkaBook], [EnteredBy], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (4, 378, N'', CAST(300.00 AS Decimal(6, 2)), 447, 513, 1, 4, N'Kalaignarin-kavithaigal-FS.jpg', N'', N'Kalaignarin-Kavithaigal-B.jpg', N'', N'', N'', N'', 1, 1, CAST(N'2022-05-14' AS Date), NULL, N'A')
INSERT [dbo].[BooksDetails] ([BookDetailsID], [BookID], [BookCode], [Price], [Pages], [PublisherID], [NoofCopy], [BookFormat], [ImgBookSmallFS], [ImgBookSmallBS], [ImgBookLarge], [ISBN13], [FirstEdition], [CurrentEdition], [Dimensions], [IsKarkaBook], [EnteredBy], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (5, 408, N'', CAST(20.00 AS Decimal(6, 2)), 64, 513, 1, 5, N'Nachu-Koppai-FS.png', N'', N'Nachu-Koppai-LI.png', N'', N'', N'', N'', 1, 1, CAST(N'2022-05-15' AS Date), NULL, N'A')
INSERT [dbo].[BooksDetails] ([BookDetailsID], [BookID], [BookCode], [Price], [Pages], [PublisherID], [NoofCopy], [BookFormat], [ImgBookSmallFS], [ImgBookSmallBS], [ImgBookLarge], [ISBN13], [FirstEdition], [CurrentEdition], [Dimensions], [IsKarkaBook], [EnteredBy], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (6, 433, N'', CAST(50.00 AS Decimal(6, 2)), 105, 513, 1, 5, N'Manokara-S.jpg', N'', N'Manokara-L.jpg', N'', N'', N'', N'', 0, 1, CAST(N'2022-06-05' AS Date), NULL, N'A')
INSERT [dbo].[BooksDetails] ([BookDetailsID], [BookID], [BookCode], [Price], [Pages], [PublisherID], [NoofCopy], [BookFormat], [ImgBookSmallFS], [ImgBookSmallBS], [ImgBookLarge], [ISBN13], [FirstEdition], [CurrentEdition], [Dimensions], [IsKarkaBook], [EnteredBy], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (7, 398, N'', CAST(36.00 AS Decimal(6, 2)), 192, 513, 1, 5, N'', N'', N'', N'', N'', N'', N'', 0, 1, CAST(N'2022-06-05' AS Date), NULL, N'A')
SET IDENTITY_INSERT [dbo].[BooksDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[BooksReview] ON 

INSERT [dbo].[BooksReview] ([BooksReviewID], [BookDetailsID], [Header], [Description], [UserID], [EnteredBy], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (1, 1, N'ரோமாபுரிப் பாண்டியன் - கலைஞர் கருணாநிதி', N'51 அத்தியாயங்களைக் கொண்ட ரோமாபுரிப் பாண்டியன் சரித்திர நாவல் 1974 ஆம் ஆண்டு கலைஞர் கருணாநிதி அவர்களால் எழுதப்பட்ட முதல் சரித்திர நாவல். நூல் வெளியீட்டு விழா தலைமை தேவநேயப் பாவாணர் அவர்கள். நூலின் முதற்படியினைப் பெற்றவர் கவியரசு கண்ணதாசன் அவர்கள்.

ரோமாபுரிப் பாண்டியன் கதை கி.மு.20-ஆம் ஆண்டில் தொடங்குகிறது. சோழ மன்னன் கரிகாலனின் பூம்புகார் அன்று புதிய பொலிவுடன் திகழ்கிறது. காரணம் பாண்டிய நாட்டு வேந்தன் பெருவழுதியின் பயணம். இந்த உறவுக்கு காரணம் புலவர் காரிக்கண்ணனார். இந்நிலையில் பாண்டிய, சோழ உறவை சிதைக்க முற்படுகிறான் சோழ மன்னன் கரிகாலனிடம் தோற்றோடிப் போன சிற்றரசன் இருங்கோவேள். சிற்றரசன் இருங்கோவேளின் ஆட்கள் கரிகாலனை கொல்ல முற்படுகிறார்கள். ஆனால் பாண்டிய மன்னனின் பாதுகாவலன் செழியன் அதை தடுத்து விடுகிறான். எனவே அவர்கள் செழியனை சூழ்ச்சியால் கடத்தி விடுகிறார்கள். 

இந்நிலையில் புலவர் காரிக்கண்ணனாரைப் பார்க்க ஒருவன் வருகிறான். அவனிடமிருந்து தவறப்பட்ட "இருங்கோவேள்" என்று பொறிக்கப்பட்ட பதக்கம் ஒன்று புலவரின் மகள் முத்துநகை கைகளில் கிடைக்கிறது. இந்த நாட்டின் பகைவனான இருங்கோவேளிடம் தந்தை உறவு கொண்டாடுகிறார் என நினைத்து நாட்டையும், செழியனையும் காப்பாற்ற வீட்டை விட்டு புலவரின் மகள் முத்துநகை வெளியேறுகிறாள்.

காட்டுக்குள் செல்லும் முத்துநகைக இருங்கோவேளின் தங்கை தாமரை யிடம் தான் யார் என்று மறைத்து பழக்கமாகிறாள். அதுமட்டுமில்லாமல் இருங்கோவேளும் ஒரு விறகு வெட்டுபவனாக பாண்டிய ஒற்றனாக வீரபாண்டி எனும் பெயரில் அறிமுகம் ஆகி முத்துநகைக்கு காதலனாகிறான்.

இந்நிலையில் பாண்டிய மன்னர் செழியனை மீட்க படை திரட்டி தயாராகிறார். இந்நிலையில் மகள் முத்துநகை மற்றும் அரசர் கரிகாலனால் புலவர் காரிக்கண்ணனார் துரோகியாக்கப்பட்டு சிறையில் அடைக்கப்படுகிறார். 

மன்னன் இருங்கோவேளின் மனைவி வேளிர்குல இளவரசி பெருந்தேவி பல வருடங்கள் நோயால் பாதிக்கப்பட்டு காட்டினில் கணவருடன் வாழ்கிறாள்.அவள் ஒருநாள் இரவில் யாருக்கும் தெரியாமல் காட்டினில் இருந்து வெளியேறி தன் கணவன் இலட்சியம் நிறைவேற கரிகாலனை கொல்ல புறப்படுகிறாள். அவள் கரிகாலனை கொல்லும் முயற்சியில் வேறு ஒருவன் குறுக்கே புகுந்து விடுகிறான். எனவே அவளின் திட்டம் தோல்வி அடைந்து மரணமடைகிறாள். 

பகைவனின் இடத்தில் அண்ணியார் இறந்தது இருங்கோவேளின் தங்கை தாமரைக்கு தெரியவருகிறது.அப்போது தாமரைக்கு, சிறையில் இருக்கும் செழியன் தன் அண்ணியின் தம்பி என்று தெரிய வருகிறது செழியனின் துணையுடனும் சில நிபந்தனைகளுடனும் சோழ நாட்டிற்கு வருகிறாள். சிற்சில சம்பவங்களுக்கு பிறகு வேளிர்குல மன்னன் இருங்கோவேளும் அவனால் நேசிக்கப்பட்ட முத்துநகை கையாலேயே சோழ நாட்டில் சோழ மன்னன் முன்னே கொல்லப்படுகிறான். 

இந்நிலையில் இருங்கோவேளின் தங்கை தாமரையும் அண்ணி மற்றும் அண்ணன் இருங்கோவேள் மறைவுக்குப் பிறகு காணாமல் போகிறாள். மேலும் பாண்டிய நாட்டிற்க்கு ரோமாபுரியிலிருந்து தூதுவர் ஒருவர் வந்துள்ளதாக பாண்டியத் தளபதி நெடுமாறன் சோழ மன்னர் கரிகாலனிடம் தெரிவித்து அவரிடம் மடல் ஒன்றை கொடுக்கிறான். அதில் பாண்டிய மன்னர் பெருவழுதிப் பாண்டியன் உடல் நலங்குன்றி படுக்கையில் விழுந்து விட்டான் என்ற செய்தியும் உள்ளது.

எனவே சோழ மன்னர், செழியனுடன் புலவர் காரிக்கண்ணனாரை பாண்டிய நாட்டிற்கு அனுப்புகிறான்.( வேளிர்குல மன்னன் இருங்கோவேள் இறப்பதற்கு முன் புலவர் காரிக்கண்ணனார் குற்றமற்றவர் எனத் தெரிந்து அவரை சோழ மன்னர் விடுதலை செய்கிறான்). அங்கு சேர்ந்த உடன் செழியனை ரோமாபுரிக்கு தூதுவனாக அனுப்ப திடடமிடுகிறார்கள். அவன் ரோமாபுரிக்கு செல்வது பாண்டியத் தளபதி நெடுமாறன் ஒருவனுக்கு மட்டும் பிடிக்கவில்லை.

மேலும் புலவர் காரிக்கண்ணனார் சோழ இளவரசர் இளம்பெருவழுதி, தாமரையை காதலிப்பதாக கூறுகிறார். ஆனால் செழியனோ தாமரையை விரும்புகிறான். எனவே செழியன் தாமரையை மறக்க ரோமாபுரிக்கு தூதுவனாக போவதற்கு முக்கிய காரணம் இதுவும் ஒன்று. 38ஆவது அத்தியாயத்தில் தான் செழியன் ரோமாபுரி செல்வதாக கூறப்பட்டுள்ளது. ரோமாபுரியை கரிகாலன் - பெருவழுதிப் பாண்டியன் காலத்தில் ஆண்டு கொண்டிருப்பது அகஸ்டஸ் சீசர் எனும் மன்னர். 

ரோமாபுரியை சென்றடைந்த செழியனை அகஸ்டஸ் மன்னரின் அந்தரங்க செயலாளரான ஜூனோ எனும் பெண் வரவேற்கிறாள். பின்னர் அவன் அங்கு அகஸ்டஸ் மன்னரை சந்திக்கிறான். ரோமாபுரியின் வரலாற்றை செழியனின் மொழிபெயர்ப்பாளனின் மூலம் தெரிவிக்கும் கலைஞர் தமிழர்,தமிழ்நாட்டின் வரலாற்றைப் பற்றி செழியன் மூலம் ரோமாபுரி செனேட் - பாராளுமன்றத்தில் அழகாக சொல்லியுள்ளார். 

செழியன் ரோமாபுரியில் தங்கியிருக்கும்போது அகஸ்டஸ் சீசருக்கு அவரது எதிரிகளால் உயிருக்கு ஆபத்து ஏற்படுகிறது. செழியன் அகஸ்டஸ் மன்னரின் உயிரை அவரது எதிரிகளிடமிருந்து காப்பாற்றுகிறான். இந்நிலையில் தமிழகத்தில் பாண்டிய மன்னரின் உடல் நிலை மோசமாகிறது. இளவரசன் இளம்பெருவழுதியோ தாமரையைத் தேடி ஊர் ஊராக தேடி அலைகிறான்.தளபதி நெடுமாறனுக்கோ அரியணையை எப்படி கைப்பற்றுவது என்ற சிந்தனை .எனவே இச்சூழ்நிலையில் பாண்டிய மன்னர் செழியனை ரோமாபுரியிலிருந்து வரவழைக்க எண்ணுகிறார். அதற்கு புலவர் மகளை ரோமாபுரிக்கு அனுப்புகிறார். ரோமாபுரியிலிருந்து செழியன் கிளம்பும் நாளில் அகஸ்டஸ் மன்னர் ஜூனோவை செழியனுக்கு பரிசுப் பொருளாக அளிக்கிறார். ஜூனோவும் செழியனை காதலிக்கிறாள்.

பாண்டிய நாடு வந்ததும் அரசனைப் பார்க்கிறான். செழியனைப் பார்த்த மாத்திரத்தில் கண்ணை மூடுகிறார். இப்போது அடுத்த மன்னராக இளவரசன் இளம்பெருவழுதி முடிசூட்டு விழா. சோழ மன்னன் மற்றும் புலவர் புலவர் காரிக்கண்ணனார் இருவரும் அடுத்த மன்னரை த் தேர்தெடுக்க ஆயத்தமாகிறார்கள். ஆனால் தளபதி நெடுமாறன் ஒரு திடுக்கிடும் உண்மையைக் கூறுகிறான்.

1. தளபதி நெடுமாறன் கூறிய உண்மை என்ன?
2. இளவரசன் இளம்பெருவழுதி முடிசூட்டு விழா என்னவானது?
3. பாண்டிய நாட்டின் அடுத்த மன்னராக யார் தேர்ந்தெடுக்கப்பட்டார்கள்?
4.. தாமரை என்ன ஆனாள்?
வாசகர்கள் இந்த புதினத்தை வாங்கி படித்து இதை தெரிந்து கொள்ளலாம்.', 55, 1, CAST(N'2021-01-15T08:30:52.753' AS DateTime), NULL, N'A')
INSERT [dbo].[BooksReview] ([BooksReviewID], [BookDetailsID], [Header], [Description], [UserID], [EnteredBy], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (2, 2, N'கலைஞர் கருணாநிதியின் சிறுகதைகள்', N'கலைஞர் கருணாநிதியின் சிறுகதைகள் என்ற புத்தகம் பாரதி பதிப்பகம் மூலம் வெளிவந்த புத்தகமாகும். இச்சிறுகதைகள் முரசொலி மற்றும் பல இதழ்களில் கலைஞர் அவர்கள் அவ்வப்போது எழுதியவை. இப்புத்தகம் 279 பக்கங்களுடன் மொத்தம் 37 சிறுகதைகளை கொண்டுள்ளது.

கலைஞர் கருணாநிதி அரசியலையும், இலக்கியத்தையும் ஒன்றாகவே பாவித்தவர். தமிழ் இலக்கியச் சூழலில் கலைஞரின் இலக்கியப் பங்களிப்பை யாரும் மறுக்கவோ மறைக்கவோ முடியாது.கலைஞர் அவர்களின் அரசியலை அவரின் அரசியல் கொள்கைகளை ஏற்றுக் கொண்டவர்கள் அவரின் இலக்கிய பங்களிப்பை மக்களிடமும் தன்னிடம் ஒரு மிகப்பெரிய அளவில் ஏற்றுக் கொள்ளாதது காலத்தின் நகைமுரண்.

இந்த புத்தகத்தில் உள்ள சிறுகதைகளை கலைஞர் எந்த காலகட்டத்தில் எந்தெந்த  பத்திரிகைகளில் எழுதினார் என்ற விவரங்கள் தரப்படவில்லை. மேலும் கலைஞர் அவர்கள் தன்னுடைய பேச்சு மற்றும் திரைத்துறையில் எப்படி தனது கொள்கைகளை வெளிப்படுத்தினாரோ அதுபோலவே இச்சிறுகதைகளிலும் தனது கொள்கைகளை வெளிப்படுத்தியுள்ளார்.

கலைஞர் அவர்களின் சிறுகதைகளை கடவுள் மற்றும் புராண எதிர்ப்புச் சிறுகதைகள், பகுத்தறிவு, இந்தி எதிர்ப்பு, போலி சாமியார்கள் மற்றும் சமுதாயம் சார்ந்த சிறுகதைகள் என பிரிக்கலாம்.

இச்சிறுகதைப் புத்தகத்தில் கடவுள் மற்றும் புராண எதிர்ப்பு சிறுகதைகளாக ''கண்ணடக்கம், விஷம் இனிது, கங்கையின் காதல்,நளாயினி, ஒரிஜினலில் உள்ளபடி'' போன்ற சிறுகதைகளும்
பகுத்தறிவுக் கதையாக ''ஆட்டக் காவடி'' என்ற சிறுகதையும் இந்தி எதிர்ப்பு சார்ந்து ''சந்தன கிண்ணம்'' என்ற சிறுகதையும், போலி சாமியார்களைப் பற்றி சங்கிலிச்சாமி என்ற சிறுகதையும் வெளிவந்துள்ளது.

கண்ணடக்கம் என்ற சிறுகதையில் பக்தனுக்கும் சாமிக்கும் நடக்கும் உரையாடலை கலைஞர் இவ்வாறு அமைத்திருப்பார்.

"பத்ரகாளி! மகாதேவி! மகிஷாசுரமர்த்தினி!!" என்று கூவினான்.
"யார் அது?" காளி கேட்டாள்.
"என்னைத் தெரியவில்லையா?" என்று கதறினான் பக்தன்.
"தெரியவில்லை... சொல்!"
"நான் தான் உன் பக்தன்-காளிதாசன்!"
"எந்தக் காளிதாசன்? நாக்கிலே எழுதி நாவலனாக ஆக்கினேனே;அந்த காளிதாசனா?"
"இல்லை தாயே நான் அவனில்லை! நான் இயற்கையிலேயே கொஞ்சம் புத்திசாலி! ஆனாலும் உன் பக்தன்!"
"சரி போகட்டும்-பக்தா! என்ன வேண்டும் உனக்கு?"
"என்ன தாயே இப்படிக் கேட்கிறாய்? ஊரிலே சூறை நடக்கிறதே உனக்கு தெரியாதா?"
"சூறையா?"
"ஆமாம் தேவி! கொள்ளை கொள்ளையாக மக்கள் சாகிறார்கள். கொடுமையான வாந்தி பேதி! கொடிய விஷக்காய்ச்சல்! பிளேக்காம்; புதுவித இங்கிலீஷ் வியாதி! காமாலை!... அய்யய்யோ சொல்லத்தரமல்ல தாயே; கூடை கூடையாகக் குழந்தை பிணம்; பாடை பாடையாகப் பெரிய பிணம்!"
"அய்யோ..... அப்படியா? எனக்குத் தெரியாதே!"
"உண்மைதான்  அம்மா உண்மைதான்; உன் மக்கள் அனைவரும் இன்னும் ஓரிருநாட்களில் ஒழிந்துவிடுவார்கள்!"
"பக்தா! நான் ஒன்று சொல்கிறேன், கேட்கிறாயா?"
"ஆயிரம் சொல் அம்மையே!"
"கொடிய நோயினால் அழிந்துவிட்ட குடும்பங்களில் மிச்சமிருப்பவர்களிடம் என்னுடைய ஆழ்ந்த அனுதாபத்தைச் சொல்!"

மிக மோசமான விமர்சனம் பெற்ற ''வாழ முடியாதவர்கள்'' என்ற சிறுகதையும், அதிக அளவில் பாராட்டுப் பெற்ற ''குப்பைத்தொட்டி'' என்ற சிறுகதையும் இத்தொகுப்பில் இடம்பெற்றுள்ளது. குப்பைத்தொட்டி சிறுகதையானது வீதியோரத்தில் இருக்கும் ஒரு ''குப்பைதொட்டி'' தன்னைப் பற்றி கூறுவதாக கதை அமைந்துள்ளது.', 55, 1, CAST(N'2021-01-15T08:36:46.700' AS DateTime), NULL, N'A')
INSERT [dbo].[BooksReview] ([BooksReviewID], [BookDetailsID], [Header], [Description], [UserID], [EnteredBy], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (3, 3, N'ஒரு மரம் பூத்தது', N'கலைஞர் மு கருணாநிதி அவர்களின் குறுநாவல் ஒரு மரம் பூத்தது. இது சிறுகதை உலகில் புரட்சி ஏற்படுத்திய ஹென்றியின் ''கடைசி இலை'' என்ற சிறு கதையை மையமாக வைத்து இககுறு நாவலை எழுதி உள்ளார். இக்குறுநாவல் அக்கால சினிமாவை பிரதிபலிப்பதாக இருக்கிறது.

தேவகி 26 வயதான ஒரு இளம் விதவை. அவள் தன் ஒரே மகனான சிறுவன் பாபுவுடன் வாழ்ந்து வருகிறார். அவள் தனது வீட்டின் கீழ்ப் பகுதியை இரண்டாகப் பிரித்து ஒரு பகுதியை ஓவியக் கூடம் வைத்திருக்கும் ரகு என்பவருக்கும் மறுபகுதியை ராதா என்கிற போட்டோகிராபருக்கும் வாடகைக்கு விட்டு அதில் வாழ்ந்து வருகிறாள். இச்சூழ்நிலையில் ராதா தேவகியிடம் தவறாக நடக்கும் பொழுது ரகு தலையிட்டு தேவகியை காப்பாற்றுகிறான். மேலும் தேவகி செய்த ஒரு கொலைக்காக ரகு சிறை செல்ல வேண்டிய சூழ்நிலை ஏற்படுகிறது.

சிறையில் ரகுவுக்கு மாணிக்கம் என்பவரின் தொடர்பு கிடைக்கிறது. மாணிக்கம் சிறையிலிருந்து வெளி வந்தவுடன் தேவகிக்கு உதவுவதாக ரகுவிடம் உறுதி அளிக்கிறான்.
இந்நிலையில் ராதா மீண்டும் தேவகியை மிரட்டுகிறான். சிறையிலிருந்து வெளியே வந்த மாணிக்கம் தேவகிக்கு உதவி செய்து அவளை மலைப் பகுதிக்கு அழைத்துச் சென்று தன் இடத்தில் அடைத்து வைத்து தன்னை திருமணம் செய்துகொள்ள கட்டாயப்படுத்துகிறான்.

தேவகி மாணிக்கத்திடம் தந்திரமாக பேசி ஊட்டி கான்வென்ட்டில் படிக்கும் தன் மகன் பாபுவை வரவழைக்கிறார். மாணிக்கம் இடம் வரும் பாபு தன் தாயின் சூழ்நிலை புரிந்து அங்கிருந்து யாருக்கும் தெரியாமல் தப்பிச்சென்று ரகுவையும் போலீசாரையும் அழைத்துவந்து தன் தாயை காப்பாற்றுகிறான். இறுதியில் ரகுவும், தேவகியும் திருமணம் செய்து கொள்கிறார்கள்.', 55, 1, CAST(N'2021-01-15T08:40:54.797' AS DateTime), NULL, N'A')
INSERT [dbo].[BooksReview] ([BooksReviewID], [BookDetailsID], [Header], [Description], [UserID], [EnteredBy], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (4, 4, N'கலைஞரின் கவிதைகள்', N'கலைஞர் மு கருணாநிதி அவர்கள் 1945ஆம் ஆண்டு முதல் எழுதிய கவிதைகளும் கவியரங்குகளுக்குத் தலைமையேற்றுப் பாடிய கவிதைகளும் என மொத்தம் 77 கவிதைகள் "கலைஞரின் கவிதைகள்" என்ற தலைப்பில்  பாரதி பதிப்பகம் மூலம் வெளிவந்துள்ளது. இக் கவிதை தொகுப்பு ஐந்து பகுதிகளாக வந்துள்ளது.

முதற்பகுதி இதயத்தைக் தந்திடு அண்ணா!. இது ஒரே ஒரு கவிதையை கொண்டது.  இரண்டாவது பகுதி இனமான ஏந்தல்கள். இப்பகுதியில், தென்னவன் காதை, இந்திரஜித், இரணியன், வாளி மன்னன்(இராவணன்) ஆகியவர்களை புகழ்ந்து எழுதப்பட்ட கவிதைகள். மூன்றாவது பகுதி கவியரங்கக் கவிதைகள். இக்கவிதைகள் 1967 முதல் 1994 வரை பல்வேறு கவியரங்குகளில் பாடிய கவிதைகள். அடுத்து கண்ணீர்த் துளிகள் என்ற பகுதியில் மறைந்தவர்களுக்கு எழுதப்பட்ட ஆறு கவிதைகள். இறுதியில் மலர் தோட்டம் என்ற பகுதியில் உடன்பிறப்புகளுக்கும் சேர்த்து எழுதிய கவிதைகள்.

கலைஞர் தலைமை தாங்கி நடத்திய கவியரங்குகளில் இணைந்து கவிதைகள் பாடிய  முக்கிய கவிஞர்கள் பட்டியல்:  கொத்தமங்கலம் சுப்பு, கவிஞர் கண்ணதாசன்,கவிஞர் சுரதா, கவிஞர் குருவிக்கரம்பை சண்முகம்,  கவிஞர் யோகி சுத்தானந்த பாரதியார்,  தொ.மு.சிதம்பர ரகுநாதன், கவிஞர் தமிழண்ணல், கவிஞர் அப்துல் ரகுமான்,திருமதி சௌந்தரா கைலாசம், கவிஞர் ஈரோடு தமிழன்பன், கவிஞர் காவிரிமைந்தன், ஔவை நடராசன், கவிஞர் வைரமுத்து மற்றும் பலர்.

09.02.69 அன்று சென்னை வானொலியில் பேரறிஞர் அண்ணா அவர்களுக்குக் கலைஞர் மு. கருணாநிதி அவர்கள் அளித்த கண்ணீர் கவிதாஞ்சலி, இதயத்தைக் தந்திடு அண்ணா!. இக் கவிதையின் இறுதியில் கலைஞர் அவர்கள் எழுதிய பிரபலமான வரிகள்:

எதையும் தாங்கும் இதயம் வேண்டுமென்றாய்;
இதையும் தாங்க ஏதண்ணா எமக்கிதயம்!
கடற்கரையில் காற்று
வாங்கியது போதுமண்ணா!
எழுந்து வா எம்மண்ணா!
வரமாட்டாய்; வரமாட்டாய்;
இயற்கையின் சதி எமக்குத் தெரியும் அண்ணா... நீ
இருக்குமிடந் தேடி யான் வரும் வரையில்
இரவலாக உன் இதயத்தை தந்திடண்ணா....
நான் வரும்போது கையோடு கொணர்ந்து அஃதை
உன் கால் மலரில் வைப்பேன் அண்ணா....

''இனமான ஏந்தல்கள்'' என்ற பகுதியில் தமிழர்களின் எழுச்சிக்கு காரணமானவர்களைப் பாடியுள்ளார். இதில் தென்னவன் காதை கவிதையில் இராவணன் சொல்வதாக இப்பாடல் உள்ளது. இக்கவிதையில் ஒரு இடத்தில் இராவணன் சொல்வதாக கலைஞர் இவ்வாறு எழுதுகிறார்.

எருமைக்குமில்லாத தடித்த தோலன்,
இழி சுக்ரீவன் இவனுக்குத் தோழன்,
அண்ணனுக்கு மரணம் தந்தோன்!
இன்னொருவன், அனுமன் எனும் துரோகியுடன் 
இலங்கைக்குத் தீ வைத்த என்றன் தம்பி!
இவர்கள் எல்லாம் எதிர்க்கின்றார் என்னை யென்றால்,
இதிலேதோ மர்மம் இருக்கத்தான் வேண்டுமன்றோ?
நான்,
சீதைக்கோர் மகன் தந்து, இலங்கைச் செங்கோலும்
அந்த மகனுக்கே தந்துவிட வேண்டுமென்று,
தீப்பந்தனைய நிபந்தனைகள் போடுகின்றார்,
தீய இராமனது கூட்டத்தார்!

இப்பகுதியில் இன்னொரு கவிதை இரணியன். நாம், பிரகலாதன் என்பவன் தன் தந்தை இரணியனை கொன்றான் என கேள்விப்பட்டுள்ளோம். இரணியன் கதையை  கலைஞர் இக்கவிதையில்  இவ்வாறு கவி பாடுகிறார்.

பெற்றோர்கள் இட்ட பெயர் பெருந்தகை வேந்து!
இழிகுணத்தார் ஆரியர்கள் இட்ட பெயர் இரணியனாம்
பொருட்பாலும் அறத்துப்பாலும் ஆட்சிக்கப்பால் 
விலகாவண்ணம் காத்து வந்தான்! என்று இரணியனைப் பாடுகிறார்.

இரணியனுக்கு ஒரு குழந்தை பிறக்க அதனை,

பெண்ணழகை மிஞ்சுகின்ற பிறை நெற்றி கொண்டதாலே
பிறைநுதலான் எனச் சொல்லி அழைத்தார் பெற்றோர்;
பிற்போக்கு ஆரியரோ, பிரகலாதன் என்றார்!

இரணியனுக்கு பிரகலாதன் பிறந்ததைக் கண்ட ஆரியர்கள் மறவேந்தர் பரம்பரையில் குலக்கொடியும் முளைத்து விட்டால் மறையோதும் குலத்துக்கு நாசம் என கொதித்தெழுந்தனர். இரணியனை அழிக்க நினைத்த ஆரியர்கள், அதன் ஒரு பகுதியாக அவனது மகன் பிரகலாதனுக்கு வித்தைகள் சொல்லிக் கொடுக்கப் போவதாக சொல்கின்றனர். இரணியன் மறுக்கிறான். ஆனால் அவன் மனைவி குறுக்கே நிற்கிறாள். இறுதியில் ஆரிய ஆசான் ஒருவன் பிரகலாதனை அழைத்துச் சொல்கிறான்.

அங்கு பிரகலாதனை தன் மகளோடு பழக வைக்கிறான். அவள் பிரகலாதனுக்கு காமத்தை சொல்லிக்கொடுக்கிறாள். இறுதியில் இரணியன், "வில்வித்தை, யானையேற்றம்" முடிந்ததா என்று கேட்க, பிரகலாதன் அதற்கு "இன்பவல்லி தந்த சுகம் கண்டேன்... இறைவனது பாதாரவிந்தம் காண வழி கண்டேன்" என உரைக்கிறான். கோபம் கொண்ட இரணியன் நாளை  இரவுக்குள் கடவுளை காட்ட வேண்டும் என்கிறான். ஆனால் ஆரியர்கள் இரணியனை சூழ்ச்சியால் கொல்கின்றனர். அதனை கலைஞர் இவ்வாறு பிரதிபலிக்கிறார்.
ஆங்கு மறைந்த சூதனொருவன்
அரிமாக் கோலம் பூண்ட படியால்
ஆரியன் என்று யார்க்கும் தெரியாமல் - தெற்குப்
சூரியன் மார்பில் ஈட்டி நுழைத்தான்!
குபு குபுவெனப் பெருகிற்று உதிரம்!
குடலை அறுத்தனர்; நாவை அறுத்தனர்;
உடலை வெட்டினர், உருவை அழித்தனர்...
நமதாண்டவன் நரசிங்க வடிவில் வந்தான் என
நம்புதற்குக் கதையும் விற்றனர்
மூடிற்று மூடுபனி ஆரியத்தை எதிர்ப்பதற்கு
முழக்கமிட்ட வாயென்று;
ஆடிற்று ஆரியம் திருக்கூத்து!

மேலும் கவியரங்கில், கவியரங்கத் தலைவர் ஒவ்வொரு கவிதை படிப்பவர்களையும் அவர்களின் தலைப்பு குறித்து பாடச் சொல்வார். 14.11.1970 அன்று "நேரு கண்ட ஜனநாயகம்" என்ற தலைப்பில் கவிஞர் கண்ணதாசன் அவர்களை ''சொத்துரிமை'' பற்றி பாட அழைக்கும் பொழுது கீழ்க்கண்டவாறு கலைஞர் அவர்கள் கண்ணதாசனை அழைக்கிறார்.

வந்தவுடன் சொத்துரிமை கேட்கின்றார் - பாவம்
நொந்த மனம்! இவர்
சொத்துரிமை கேட்பதிலும் நியாயம் உண்டு பிள்ளைகள்
பத்துப் பன்னிரண்டு
போகட்டும் அளித்துவிட்டேன் சொத்துரிமை
பெருக, வருக, தருக

அதேபோல் புதுவை வானொலி நிலையத்தார் ஏற்பாடு செய்த கவியரங்கில் "மாறி வரும் ஊரினிலே" என்ற தலைப்பில் கலைஞர் கீழ்க்கண்டவாறு ஒரு கவிதை பாடுகிறார்.

வெங்காயம் கூடப் பாஞ்சாலி சபதம் செய்யும்
உரிக்க உரிக்கத் தோல் சேலை வருவதாலே
வெங்காயம் கூடப் பாஞ்சாலி சபதம் செய்யும்.

மேலும் 1971-ஆம் ஆண்டு அமெரிக்க அரசின் அழைப்பை ஏற்று சுற்றுப்பயணம் மேற்கொண்ட போது ஆர்லந்தோ ஏரியின் நீரூற்று கண்ட கலைஞர் எழுதிய கவிதை.

நல்ல வேளை -
தனியாக ரசிக்கின்ற வாய்ப்பெனக்கு
தப்பினேன் அதனாலே!
பெண்ணொருத்தி அருகிருந்தால் நீரூற்றின்
வண்ணத்தைக் கணக்கெடுத்து - மறுநாளே
வகைக்கு ஒன்றாய் சேலை கேட்பாள்!

வங்கதேசத்தில் நடந்த அரசியல் சூழ்நிலை கண்டு "சில நாடுகள் இருக்கின்றன" என்று ஒரு கவிதை எழுதுகிறார். அதில் ஜனநாயகம் ஒரு நாட்டிற்கு முக்கியத்துவம் எனக் கூறுகிறார்.

சர்வாதிகாரம்;
அஃதோர் வாழைமரம்
அதன் கன்றே அதனைச் சாய்க்கும்!', 55, 1, CAST(N'2022-05-14T06:02:30.563' AS DateTime), NULL, N'A')
INSERT [dbo].[BooksReview] ([BooksReviewID], [BookDetailsID], [Header], [Description], [UserID], [EnteredBy], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (5, 5, N'நச்சுக் கோப்பை', N'கலைஞர் கருணாநிதி அவர்கள் எழுதிய முதல் நாடகம்  பழனியப்பன். இது மூடநம்பிக்கைகள் எதிர்ப்பு, மறுமணம், குடியின் தீமை ஆகியவற்றை கொண்டு எழுதப்பட்ட நூல். இந்நாடகம் சாந்தா என்னும் பெயரிலும் பின்னர் நச்சு கோப்பை என்னும் பெயரில் தமிழகம் முழுவதும் அரங்கேற்றம் செய்யப்பட்டது. நாடகத்தில் கதை மாந்தர்களாக சாந்தா, தந்தையாக மணியப்ப முதலியார், அண்ணனாக பழனியப்பன், காதலனாக ஏகாம்பரம், கணவனாக அழகப்பன் மற்றும் ஐயர், ஐயரின் சிஷ்யன் ஆகியோர்.

இந்நாடகத்தின் கதைச்சுருக்கம், மணியப்ப முதலியார் என்பவருக்கு பழனியப்பன் என்ற மகனும் சாந்தா என்ற மகளும் உள்ளனர். பழனியப்பன் முற்போக்கு எண்ணம் கொண்டவனாக விளங்குகிறான். சாந்தா எதிர் வீட்டிலிருக்கும் ஏகாம்பரம் என்பவனை காதலிக்கிறாள். ஏகாம்பரம் ஏழை என்பதால் திருமணம் செய்து வைக்க மறுக்கும் முதலியார் சாந்தாவின் விருப்பமின்றி அழகப்பன் என்பவனுக்கு திருமணம் செய்து வைக்கிறார். இந்நிலையில் தனது காதலியை மறக்க ராணுவத்திற்கு வேலைக்குச் செல்கிறான்  ஏகம்பரம். அழகப்பனும் குடித்தே இறந்து விடுகிறான்.

ராணுவத்திலிருந்து ஏகாம்பரம் திரும்பி ஊருக்கு வருகிறான். அவனுக்கு பழனியப்பன் மீண்டும் தன் தங்கை சாந்தாவை மணமுடிக்க விரும்புகிறான். ஆனால் பிற்போக்கு எண்ணம் கொண்டவரான மணியப்ப முதலியார் மறுக்கிறார். தகப்பன், பிள்ளை இருவருக்கும் தகராறு வருகிறது. மணியப்ப முதலியார் ஏற்பாடு செய்தவன் பழனியப்பனை கொலை செய்துவிடுகிறான். இறுதியில் சாந்தாவும் ஏகாம்பரமும் இணைகின்றனர்

இந்நாடகத்தில் கலைஞர் தனது கொள்கைகளை மிக அதிகளவில் கையாண்டுள்ளார்.', 55, 1, CAST(N'2022-05-15T05:51:28.087' AS DateTime), NULL, N'A')
INSERT [dbo].[BooksReview] ([BooksReviewID], [BookDetailsID], [Header], [Description], [UserID], [EnteredBy], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (6, 6, N'மனோகரா', N'நாடகப் பேராசிரியர் பம்மல் சம்பந்த முதலியார் அவர்கள் எழுதிய 90க்கும் மேற்பட்ட நூல்களில் ஒன்று மனோகரா என்ற நாடகம்.  இந்நாடகம் மனோகரா என்ற பெயரிலேயே திரைப்படமாக தயாரிக்கப்பட்டு அப்படத்திற்கு கலைஞர் மு.கருணாநிதி அவர்களால் திரைக்கதை வசனம் தீட்டப்பட்டது.

இப்படத்தின் கதை, சோழ நாட்டை ஆள்பவர் புருஷோத்தமன் என்பவர். அவருடைய மகன் இளவரசன் மனோகரன். பட்டத்தரசி  மகாராணி பத்மாவதி. கணவனுக்காக எல்லாவற்றையும் பொறுத்துக் கொள்ளும் ஒரு பட்டத்தரசி.மகாராணி பத்மாவதிக்கு பணிப்பெண்ணாக வந்த வசந்தசேனையின் வலையில் புருஷோத்தமன் விழுந்து அவள் சொற்படி நடக்கிறார். இந்நிலையில் மனோகரன் பிறந்த நாளை முன்னிட்டு அரண்மனையில் ஒரு நாடகம் நடக்கிறது.

இந்த நாடகத்தை நடத்துபவன் வசந்தசேனையால் விஷம் கொடுக்கப்பட்டு மீண்ட கேசரிவர்மன் என்பவன். இவன் அரூபமாக வாழ்கிறான்.

இந்நாடகம் மூலம் மனோகரன் தனது பாட்டனாரை(பட்டத்தரசியின் தந்தை)பாண்டிய மன்னன் முத்து விஜயன்கொன்று  ரத்ன சிம்மாசனத்தையும் கைப்பற்றினான் என்று அறிகிறான். அதற்குப் பழிவாங்கும் பொறுப்பை ஏற்றுக்கொண்டு பாண்டிய நாட்டின் மீது படையெடுத்துச் செல்கிறான்.

போர்க்களத்திலே அரசன் முத்து விஜயனும் மனோகரனும் எதிர்கொள்கின்றனர். அப்போது நடக்கும் உரையாடல்.

முத்துவிஜயன்: வாடா தம்பீ!.... வாள் பிடிக்கத் தெரியாத வாலிபனே ! வளைத்துவிட்டோம் கோட்டையை என்று எண்ணிவிடாதே
மனோகரன்: கேள்விப்பட்டிருக்கிறேன் நீர் வீரர்.... வாய் வீச்சிலே என்று !
[முத்துவிஜயன் கோபாவேசத்துடன் வாளை வீசிக்கொண்டே....!]
முத்துவிஜயன்: வாள் வீச்சிலுங் கூடத்தான்....

முடிவில் மனோகரன் அரசன் முத்துவிஜயனைக் கொன்று அவரது மகள் விஜயாவை திருமணம் செய்து கொண்டு நாடு திரும்புகிறான். நாடு திரும்பிய மனோகரன் அங்கு அவன் அனுப்பிய ரத்ன சிம்மாசனத்தில் வசந்தசேனை அமர்ந்திருப்பதைக் கண்டு கோபம் கொள்கிறான். எனினும் மகாராணி பத்மாவதி மனோகரனிடம் அரசருக்கும்  வசந்தசேனைக்கும் எந்த ஆபத்தும் அவன் மூலம் வரக்கூடாது என்று சத்தியம் வாங்குகிறார். இந்நிலையில் வசந்தசேனை அரசன் முன்பே மனோகரனை வேசிமகன் என்று அழைக்கிறாள். அரசன் கோபம் கொள்வதைக் கண்டு அவனது கோபத்தை தணிக்கவும் அதனை நிரூபிக்கவும் அமைச்சர் சத்தியசீலருக்கும் மகாராணி பத்மாவதிக்கும் கள்ள உறவு இருப்பதாக கூறி நாடகமாடுகிறாள் வசந்தசேனை. அரசரை நம்பவும் வைக்கிறாள்.

எனவே அரசர் மகாராணியை சிறைக்கும், மனோகரன் வசந்த சேனையை அவமதித்ததற்காக மன்னிப்பும் கேட்க வேண்டும் என்கிறார். மனோகரன் கோபம் கொண்டு அரசவைக்கு வரும் போது இரும்பு சங்கிலியால் அவனை கட்டி அழைத்து வருகிறார்கள்.

இந்த அரசவைக் காட்சி தான் படத்தில் மிகப்பெரிய வெற்றி பெற்றது.

அரசன்: மனோகரா! உன்னை எதற்காக அழைத்திருக்கிறேன் தெரியுமா?
மனோகரன்: திருத்திக்கொள்ளுங்கள் தயவு செய்து. அழைத்து வரவில்லை. இழுத்து வரச் செய்திருக்கிறீர்கள்.
அரசன்: என் கட்டளையைத் தெரிந்து கொண்டிருப்பாய் நீ
மனோகரன்: கட்டளையா இது?  கரைகாண முடியாத ஆசை! பொன்னும், மணியும், மின்னும் வைரமும் பூட்டி மகிழ்ந்து, கண்ணே! முத்தே! தமிழ்ப் பண்ணே! என்றெல்லாம் குலவிக் கொஞ்சி, தந்தத்தால் ஆன கட்டிலிலே...சந்தனத் தொட்டிலிலே !  வீரனே !  என் விழி நிறைந்தவனே தீரர் வழி வந்தவனே ! என்று யாரைச் சீராட்டி பாராட்டினீர்களோ... அவனை அந்த மனோகரனை சங்கிலியால் பிணைத்து சபை நடுவே நிறுத்தி சந்தோஷத்தை கொண்டாட வேண்டும் என்ற தங்கள் தனியாத ஆசைக்குப் பெயர் கட்டளையா தந்தையே?
அரசன்: ஆத்திரத்தைக் கிளப்பாதே ! நிறைவேற்று அரசன் உத்தரவு
மனோகரன்: அரசன் உத்திரவென்ன? ஆண்டவனின் உத்திரவுக்கே காரணம் கேட்க ஆரம்பித்துவிட்டார்கள்.
அரசன்: தாய்க்கும் தந்தைக்கும்  வேற்றுமை அறியா மூடனே! தந்தையின் ஆணை கேட்டு தாயாரின் தலையை வெட்டியெறிந்த பரசுராமனைப் பற்றி கேள்விப்பட்டிருக்கிறாயா நீ? 
மனோகரன்: பரசுராமன் - அவதாரம். மனோகரன் மனிதன் !
அரசன்: என் உத்தரவை நிறைவேற்ற போகிறாயா இல்லையா?
மனோகரன்: நிறைவேற்றுகிறேன் - மன்னிப்பு கேட்க வேண்டும்-மனோகரன்.
அரசன்: ஆமாம்; அதுவும் அரை நொடியில்
மனோகரன்: அரை நொடியென்ன? அதற்குள்ளாகவே ! ஆனால் யாரிடம் மன்னிப்பு கேட்க வேண்டும் தெரியுமா? கோமளவல்லி-கோமேதகச் சிலை-கூவும் குயில்-குதிக்கும் மான் என்றெல்லாம் உம்மால் புகழப்படும் இந்தக் கோணல் புத்திக்காரியின் கொள்ளிக் கண்களை- கொடிய நாக்கை-என் கூர்வாளுக்கு இரையாகத் தந்துவிட்டு - அதை எதிர்த்தால் உம்மையும், உமக்குப் பக்கத் துணை வந்தால் அந்த பட்டாளத்தையும் பிணமாக்கிவிட்டு...சூன்யக்காரிக்கு ஆலவட்டம் சுற்றியவர்களை-சுடுகாட்டுக்கனுப்பி விட்டேன்... என்று சுழலும் வாளுடன்... சூழும் புகழுடன் என் அன்னையிடம் ஓடி மன்னிப்புக் கேட்க வேண்டும். நிறைவேற்றட்டுமா-அந்த உத்திரவை?...... தயார்தானா...? தயார்தானா?...

இறுதியில் மனோகரனை கொலைக்கலத்திற்கும், பட்டத்தரசியையும், மனோகரன் மனைவி விஜயாவையும் சிறையிலும் அடைகிறான் அரசன். கொலைக்கலத்திற்கு செல்லும் வழியில் வசந்தசேனையின் கணவன் கேசரிவர்மன் அரூபமாக வந்து மனோகரனை காப்பாற்றுகிறான். இந்நிலையில் வசந்தசேனை தனது மகனை இளவரசனாக்க வேண்டும் என்கிறாள். அரசன் மறுக்கவே அவள் தனது காதலனும் இமயபுரி வேந்தனுமான உக்கிரசேனனுக்கு சோழ சாம்ராஜ்யத்தை கைப்பற்ற அழைக்கிறாள். உக்கிரசேனன் அட்சயன் என்பவனிடம் ஓலை கொடுத்து அனுப்புகிறான். வரும்வழியில் மனோகரன் அவனைத் தாக்கி அந்த கடிதத்தை எடுத்து அரண்மனைக்கு புறப்படுகிறான்.

மேலும் உக்கிரசேனனும் அவன் படைவீரர்களும் சாது கூட்டம் வடிவில் உள்ளே நுழைகிறது. உக்கிரசேனனும் வசந்தியும் தனிமையில் இருக்கும்பொழுது அரசன் புருஷோத்தமன் பார்த்து விடுகிறான். வசந்தசேனை புருஷோத்தமனை சிறையில் அடைக்கிறாள். அரண்மனையில் மனோகரனுக்கு குழந்தை பிறக்கிறது. மேலும் அரண்மனையில் உலாவும் அட்சயன் மனோகரன் தான் என்பதையும் தெரிந்து கொண்டு கைது செய்ததுடன் அவன் குழந்தையை கொல்ல முற்படுகிறாள். மகாராணி பத்மாதேவியும் நிலைமை தெரிந்துகொண்டு, பொறுமைக்கு எங்கே இருக்கிறது பெருமை ? மனோகரா ! "பொறுத்தது போதும். பொங்கியெழு !"  என்கிறாள். என்கிறார்.மனோகரன் உக்கிரசேனை கொல்கிறான். வசந்தசேனை அவள் கணவனால் கொல்லப்படுகிறாள்.

பம்மல் சம்பந்த முதலியார் அவர்கள் எழுதிய நாடகத்தை கலைஞர் அவர்கள் சில இடங்களில் மாற்றம் செய்துள்ளார்.

1.மனோகரின் மனைவி விஜயா பகைவனின் மகள் என்று காட்டப்பட்டுள்ளது. ஆனால் பம்மல் சம்பந்த முதலியார் எழுதிய நாடகத்தில் அவ்வாறு காட்டப்படவில்லை.
2. வசந்தசேனையின் மகன் வசந்தன் ராஜ உடையில் இருக்கும் பொழுது அவனை அரசன் என்று நினைத்து வசந்தசேனை கொன்று விடுகிறாள். ஆனால் கலைஞர் எழுதிய நாடகத்தில் வசந்தசேனை மனோகரனை கொல்ல முற்படும் பொழுது வசந்தன் குறுக்கே பாய்ந்து விடுவதாக உள்ளது.
3. பம்மல் சம்பந்த முதலியார் நாடகத்தில் வசந்தசேனை தன் மகனை கொன்றதால் தன்னைப் தானே குத்திக் கொண்டு சாகிறாள். ஆனால் கலைஞர் எழுதிய நாடகத்தில் வசந்தசேனையை அவள் கணவன் கொல்வதாக உள்ளது.
4. கொலு மண்டபத்தில் அரசர் மனோகரனை கொல்ல உத்தரவு தருவதாக கூறி அவன் தன் மைந்தன் அல்ல என்று கூறுகிறார். அந்நிலையில் மனோகரன் அவரை தாக்க முற்படும் பொழுது மகாராணி தடுக்கிறாள். இதனால் அரசன் மனம் திருந்துவதாக பம்மல் சம்பந்த முதலியார் நாடகத்தில் உள்ளது.
5.பம்மல் சம்பந்த முதலியார் நாடகத்தின் இறுதியில் பாண்டிய நாடு சோழ நாடு மீது போர் தொடுக்கிறது. ஆனால் கலைஞர் நாடகத்தில் பாண்டிய நாடு சோழ நாட்டிற்கு உதவி புரிவதாக உள்ளது.
6. வசந்தசேனைக்கு இமயபுரி வேந்தன் காதலனாக இருப்பதாக கலைஞரின் மனோகராவில் உள்ளது.', 55, 1, CAST(N'2022-06-05T03:54:19.587' AS DateTime), NULL, N'A')
INSERT [dbo].[BooksReview] ([BooksReviewID], [BookDetailsID], [Header], [Description], [UserID], [EnteredBy], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (7, 7, N'இனியவை இருபது', N'கலைஞர் கருணாநிதி  அவர்கள் முதலமைச்சராக இருந்தபோது அரசுமுறைப் பயணமாக இருபது நாட்களாக ரோம்,சுவிட்சர்லாந்து,பிரான்ஸ்,செர்மனி,நெதர்லாந்து,இங்கிலாந்து,இலண்டன் நாடுகளுக்கு சென்று வந்ததை பற்றி அரசு ஏடான தமிழரசில் எழுதிய பயண நூலே 20  கட்டுரைகள் கொண்ட  இனியவை இருபது.

பயணநூல்களில்  பொதுவாக பார்க்க வேண்டிய இடங்கள்,வாங்க வேண்டிய பொருட்கள்,உன்ன வேண்டிய உணவுகள் பற்றிய செய்திகள் அதிகமாக இருக்கும்.ஆனால் கலைஞர் அவர்கள் ஒவ்வொரு நாட்டிலும் நுழைந்த பிறகு அந்த நாட்டின் வரலாறு,அந்த நாடு யாரால் முன்னேற்றப்பட்டது, யாரால் சீரழிவுக்கு ஆட்பட்டது என்பதை தெளிவாகாகக் கூறியுள்ளார்.

அது மட்டுமல்லாமல் அந்த நாட்டின் கலைஞர்கள் மற்றும் படைப்புகளையும் சொல்கிறார். உரோமில் போப்பாண்டவரைக் காண சென்றபோது அவருக்கும் அவரது துணைவியாருக்கும் மட்டும் அனுமதி தரப்பட்டபோது அவருடன் வந்த கிறித்தவ மதத்தைச் சேர்ந்தவரையும் அனுமதிக்க வேண்டும் என்று கூறி அவரையும் உள்ளே கூட்டிச் சென்றது, பின்னர் போப் அவர்களை சந்தித்து முடித்தபோது தன்னுடன் வந்தவர்கள் தங்களை காண முடியாமல் வெளியே இருக்கிறார்கள் அவர்களும் தங்களைக் காண அனுமதி அளிக்க வேண்டும் என்று கூறி அவர்களும் போப் ஆண்டவரை சந்திக்க வைக்க முயற்சி எடுத்தது அந்த இடத்தில் கலைஞரின் அறிவுக்கூர்மைக்கு ஓர் சான்று.

ஒவ்வொரு நாட்டிலும் பயணம் செய்யும்போது அந்த நாட்டைப்போல் தமிழ்நாட்டையும் அடுத்த நிலைக்கு கொண்டுவர விரும்புகிறார். உதாரணமாக கடல் கொண்ட பூம்புகாரை எந்த நாட்டின் உதவி கொண்டாவது மீட்க முடியுமா  என்று பெருமூச்சு விடுகிறார்.

இங்கிலாந்தில் பேட்டியின் போது தொழில் துறையில் தி மு க வின்  சாதித்த சாதனை என்ன என்று கேட்கும்போது மற்றவர்களைப்  போல் மூட்டி மறைக்காமல்,தற்போது தன்னிடம் புள்ளிவிவரம் இல்லை; ஆனால் தொழில் வளர்ச்சிக்காக எந்த முயற்சியையும் விட்டு வைக்கவில்லை என்று உள்ளது உள்ளபடி அழுத்தமாக கூறுகிறார்.

உண்மையில் தமிழ்நாட்டிற்காக இல்லாத துறைகளிலும் முன்மாதிரியாக பல முயற்சிகளை மேற்கொண்டுள்ளார்.அவர் இல்லாதது தமிழ்நாட்டிற்கு பேரிழப்பே.', 55, 1, CAST(N'2022-06-05T08:29:02.050' AS DateTime), NULL, N'A')
SET IDENTITY_INSERT [dbo].[BooksReview] OFF
GO
SET IDENTITY_INSERT [dbo].[CacheName] ON 

INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (1, N'ArticleType', N'Article Type', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (2, N'AuthorProfile', N'Author Profile', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (3, N'BestBooks', N'Best Books', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (4, N'BookDetails', N'Book Details', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (5, N'BookFair', N'Book Fair', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (6, N'BookFormat', N'Book Format', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (7, N'Books', N'Books', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (8, N'BooksContent', N'Books Content', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (9, N'BooksRecommend', N'Books Recommend', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (10, N'BooksReview', N'Books Review', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (11, N'CacheName', N'Cache Name', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (12, N'Category', N'Category', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (13, N'Country', N'Country', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (14, N'Events', N'Events', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (15, N'EventsType', N'Events Type', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (16, N'GeneralArticle', N'General Article', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (17, N'KarkaEvents', N'Karka Events', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (18, N'KarkaEventsType', N'Karka Events Type', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (19, N'Magazine', N'Magazine', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (20, N'MagazineIssue', N'Magazine Issue', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (21, N'MagazineReview', N'Magazine Review', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (22, N'MagazineType', N'Magazine Type', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (23, N'Profession', N'Profession', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (24, N'Publishers', N'Publishers', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (25, N'SeriesType', N'Series Type', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (26, N'SpecialName', N'Special Name', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (27, N'Subscription', N'Subscription', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (28, N'User', N'User', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (29, N'UserByAuthor', N'User By Author', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (30, N'UserType', N'User Type', N'A')
INSERT [dbo].[CacheName] ([CacheNameID], [Code], [CacheName], [RecStatus]) VALUES (31, N'WeekDays', N'Week Days', N'A')
SET IDENTITY_INSERT [dbo].[CacheName] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (1, N'அகராதி / களஞ்சியம்', N'Dictionary / Encyclopedia', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (2, N'அதிரடி & சாகசம்', N'Action & Adventure', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (3, N'அரசியல்', N'Politics', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (4, N'அறவியல்', N'Ethics', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (5, N'அறிவியல், தொழில்நுட்பம் மற்றும் மருத்துவம்', N'Sciences, Technology & Medicine', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (6, N'ஆட்சியியல்', N'Civilian', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (7, N'இதழ் தொகுப்பு', N'Magazine Gallery', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (8, N'இயற்கை', N'Nature', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (9, N'இலக்கணம்', N'Grammar', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (10, N'இலக்கியம்', N'Literature & Fiction', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (11, N'இல்லறம்', N'NULL', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (12, N'உடல் நலம் & குடும்பம்', N'Health, Family & Personal Development', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (13, N'கட்டுரைகள்', N'Essays', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (14, N'கணினி, இணையதளம் மற்றும் டிஜிட்டல் மீடியா', N'Computer, Internet & Digital Media', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (15, N'கலை & திரைப்படம்', N'Arts, Film & Photography', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (16, N'கவிதைகள்', N'Poems', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (17, N'காதல்', N'Romance', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (18, N'குழந்தைகள் மற்றும் சிறுவர்/சிறார்', N'Children''s & Young Adult', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (19, N'குறிப்பு', N'Reference', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (20, N'கைவினைகள், வீடு & வாழ்க்கை', N'Crafts, Home & Lifestyle', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (21, N'சங்க இலக்கியம்', N'Sangam literature', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (22, N'சட்டம்', N'Law', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (23, N'சமூகம் & சமூக அறிவியல்', N'Society & Social Sciences', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (24, N'சுயசரிதைகள் மற்றும் உண்மை கதை', N'Biographies & True story', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (25, N'சுயமுன்னேற்றம் / தன்னம்பிக்கை', N'Self-Improvement / Self-Confidence', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (26, N'சொற்பொழிவுகள்', N'Lectures', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (27, N'தத்துவம்', N'NULL', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (28, N'தொல்லியல்', N'Archeology', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (29, N'தேர்வு தயாரிப்பு & பாடப்புத்தகங்கள்', N'Exam Preparation & Textbooks', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (30, N'நகைச்சுவை', N'Humour', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (31, N'நேர்காணல் & உரையாடல்கள்', N'Interview & Conversations', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (32, N'பகுத்தறிவு', N'Rational', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (33, N'பயணம்', N'Travel', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (34, N'பழமொழிகள்', N'NULL', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (35, N'பாடப்புத்தகங்கள்', N'TextBooks', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (36, N'புதினம்(நாவல்)', N'Novel', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (37, N'பொது அறிவு', N'General Knowledge', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (38, N'பொன்மொழி', N'NULL', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (39, N'மதம்', N'Religion', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (40, N'மருத்துவம்', N'NULL', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (41, N'மொழி, மொழியியல் மற்றும் எழுதுதல்', N'Language, Linguistics & Writing', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (42, N'வட்டார நூல்கள் / நாட்டுப்புறவியல்', N'Regional texts / Folklore', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (43, N'வணிக மற்றும் பொருளியல்', N'Business & Economics', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (44, N'வரலாறு', N'History', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (45, N'விடுகதை', N'NULL', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (46, N'விளையாட்டு', N'Sports', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (47, N'வேளாண்மை மற்றும் விவசாயம்', N'Agriculture & Farming', NULL, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (48, N'அகராதி / களஞ்சியம்', N'Dictionary / Encyclopedia', 1, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (49, N'அதிரடி & சாகசம்', N'Action & Adventure', 2, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (50, N'அம்பேத்கரியம்', N'NULL', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (51, N'அரசியல் சித்தாந்தங்கள்', N'Political Ideologies', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (52, N'அரசு', N'Government', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (53, N'இந்துத்துவா ', N'Hindutva', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (54, N'இஸ்லாமியம் ', N'Islam', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (55, N'ஈழம் / தமிழீழம்', N'Eelam / Tamil Eelam', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (56, N'கட்டுரைகள்', N'Essays', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (57, N'கம்யூனிசம் / பொதுவுடைமை', N'Communism', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (58, N'கிறித்துவம்', N'', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (59, N'சமூக நீதி', N'Social Justice', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (60, N'சர்வதேச உறவுகள் மற்றும் உலகமயமாக்கல்', N'International Relations & Globalization', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (61, N'சுதந்திரம் & பாதுகாப்பு', N'Freedom & Security', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (62, N'தமிழினம் / தமிழ்த் தேசியம்', N'Tamil Nationality', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (63, N'தலித்தியம்', N'Dhalithiyam', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (64, N'திராவிடம் / திராவிடர்', N'Dravidian', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (65, N'பிராமணியம்', N'', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (66, N'பெரியாரியம்', N'NULL', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (67, N'பொது நிர்வாகம்', N'Public Administration', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (68, N'மார்க்சியம்', N'NULL', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (69, N'மொழிபெயர்ப்பு', N'Translation', 3, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (70, N'அறவியல்', N'Ethics', 4, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (71, N'இயற்பியல்', N'Physics', 5, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (72, N'உயிரியல்', N'Biology', 5, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (73, N'கணிதம்', N'Mathematics', 5, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (74, N'சுற்றுச்சூழல்', N'Environment', 5, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (75, N'நிலவியல்', N'Geography', 5, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (76, N'புவி அறிவியல்', N'Earth Sciences', 5, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (77, N'பொறியியல் மற்றும் தொழில்நுட்பம்', N'Engineering & Technology', 5, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (78, N'போக்குவரத்து மற்றும் தானியங்கி', N'Transportation & Automotive', 5, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (79, N'மருத்துவம்', N'Medicine', 5, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (80, N'வானியல்', N'Astronomy', 5, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (81, N'வேதியியல்', N'Chemistry', 5, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (82, N'மொழிபெயர்ப்பு', N'Translation', 5, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (83, N'ஆட்சியியல்', N'Civilian', 6, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (84, N'நிர்வாகம்', N'', 6, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (85, N'இதழ் / இதழ் தொகுப்பு', N'Magazine Collection', 7, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (86, N'சிறார் இதழ்', N'Children''s Magazine', 7, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (87, N'வார / மாத இதழ்கள்', N'Weekly / Monthly Magazines', 7, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (88, N'இயற்கை', N'Nature', 8, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (89, N'கட்டுரைகள்', N'Essays', 8, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (90, N'சுற்றுச்சூழல்', N'Environment', 8, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (91, N'பறவைகள்', N'Birds', 8, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (92, N'மொழிபெயர்ப்பு', N'Translation', 8, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (93, N'இலக்கணம்', N'Grammar', 9, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (94, N'அந்தாதி', N'NULL', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (95, N'அனுபவம்', N'Experience', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (96, N'ஆய்வு கட்டுரைகள்', N'Research Essays', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (97, N'இசுலாமிய இலக்கியம்', N'Islamic Literature', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (98, N'இதிகாசங்கள்', N'Epics', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (99, N'இந்திய இலக்கியம்', N'Indian Literature', 10, 0, N'A')
GO
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (100, N'இயல்-இசை-நாடகம்', N'Prose, Music and Drama', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (101, N'இலக்கியக் கோட்பாடு, வரலாறு மற்றும் விமர்சனங்கள்', N'Literary Theory, History & Criticism', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (102, N'இலக்கியம்', N'Literature', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (103, N'இலக்கியம் மற்றும் கற்பனை', N'NULL', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (104, N'உரை', N'', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (105, N'உரைநடை நாடகம்', N'Prose play', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (106, N'உலா', N'NULL', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (107, N'கடித இலக்கியம்', N'NULL', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (108, N'கட்டுக்கதைகள், புனைவுகள் & திரைப்படங்கள்', N'Myths, Legends & Sagas', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (109, N'கலம்பகம்', N'NULL', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (110, N'காப்பிய இலக்கியம்(காப்பியங்கள்)', N'Epics', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (111, N'கிளாசிக் கற்பனை/புனைகதை', N'Classic Fiction', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (112, N'கிறித்துவ இலக்கியம்', N'Christian Literature', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (113, N'குறவஞ்சி', N'NULL', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (114, N'கோவை', N'NULL', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (115, N'சமகால அறிவியல்', N'Contemporary Fiction', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (116, N'சமண இலக்கியம்', N'Jain literature', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (117, N'சமய  இலக்கியம்', N'Religious Literature', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (118, N'சித்தர் பாடல்கள்', N'Siddhar songs', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (119, N'சைவ இலக்கியம்', N'Saiva Literature', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (120, N'தல புராணங்கள்', N'Thala Puranagal', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (121, N'திரட்டு நூல்கள்', N'', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (122, N'தூது', N'NULL', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (123, N'தொகை நூல்கள்', N'Anthologies', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (124, N'நவீன இலக்கியம்', N'Modern Literature', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (125, N'நாடகம் / நாடகங்கள்', N'Drama / Play', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (126, N'பரணி', N'NULL', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (127, N'பள்ளு', N'NULL', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (128, N'பாடல்கள்', N'Songs', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (129, N'பிள்ளைத் தமிழ்', N'NULL', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (130, N'புராணங்கள்', N'Myths', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (131, N'வைணவ இலக்கியம்', N'Vaishnava Literature', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (132, N'மொழிபெயர்ப்பு', N'Translation', 10, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (133, N'அந்தரங்கம்', N'NULL', 11, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (134, N'இல்லறம்', N'NULL', 11, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (135, N'கருத்தரிப்பு', N'NULL', 11, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (136, N'பாலியல்', N'NULL', 11, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (137, N'மகப்பேறு', N'NULL', 11, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (138, N'அனுபவம்', N'Experience', 12, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (139, N'ஆசனங்கள்', N'NULL', 12, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (140, N'ஆரோக்கியம் & ஆரோக்கியமான வாழ்க்கை', N'Healthy Living & Wellness', 12, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (141, N'உடற்பயிற்சி', N'Exercise', 12, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (142, N'உடல் நலம்', N'Health', 12, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (143, N'குடும்பம் & உறவுகள்', N'Family & Relationships', 12, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (144, N'தனிப்பட்ட வளர்ச்சி மற்றும் சுய உதவி', N'Personal Development & Self-Help', 12, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (145, N'தியானம்', N'NULL', 12, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (146, N'திருமணம் மற்றும் இல்லறம்', N'Marriage and family life', 12, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (147, N'பிராணாயாமம்', N'NULL', 12, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (148, N'மனம், உடல் மற்றும் ஆத்மா', N'Mind, Body & Spirit', 12, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (149, N'மூச்சுக் கலை', N'NULL', 12, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (150, N'யோகாசனம்', N'NULL', 12, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (151, N'மொழிபெயர்ப்பு', N'Transalatoin', 12, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (152, N'அம்பேத்கரியம்', N'NULL', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (153, N'அரசியல்', N'Politics', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (154, N'அறிவியல்', N'Science', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (155, N'அனுபவம்', N'Experience', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (156, N'ஆத்திகம்', N'Theism', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (157, N'ஆய்வு கட்டுரைகள்', N'Research Articles', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (158, N'ஆன்மிகம்', N'Spirituality', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (159, N'இந்துத்துவம்', N'Hinduism', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (160, N'இலக்கியம்', N'Literature', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (161, N'உடல்நலம்-மருத்துவம்', N'Health-Medicine', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (162, N'உளவியல்', N'Psychology', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (163, N'கட்டுரைகள்', N'Essays', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (164, N'கம்யூனிசம்', N'NULL', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (165, N'கலாச்சாரம், பண்பாடு', N'Culture', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (166, N'கள ஆய்வு', N'NULL', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (167, N'குடும்பம் / உறவு', N'NULL', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (168, N'குழந்தை வளர்ப்பு', N'Child Care', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (169, N'சமூக நீதி', N'Social justice', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (170, N'சமையல்-உணவு', N'Kitchen Food', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (171, N'சாதி', N'NULL', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (172, N'சாதி - தீண்டாமை', N'NULL', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (173, N'சாதி ஒழிப்பு', N'NULL', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (174, N'சிந்தனை', N'', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (175, N'தன்னம்பிக்கை ', N'Self-confidence', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (176, N'திரைப்படம்', N'NULL', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (177, N'தொல்லியல்', N'Archaeology', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (178, N'நகைச்சுவை', N'Joke', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (179, N'நாத்திகம்', N'Atheism', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (180, N'பாலியல்', N'NULL', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (181, N'பிராமணியம்', N'Brahmanism', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (182, N'பெண்ணியம் / பெண்ணுரிமை', N'Feminism', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (183, N'பெரியாரியம்', N'NULL', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (184, N'மதம்', N'Religion', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (185, N'மார்க்சியம்', N'Marxism', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (186, N'மானுடவியல்', N'Anthropology', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (187, N'விமர்சனம் / விமர்சனங்கள்', N'NULL', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (188, N'மொழிபெயர்ப்பு', N'Translation', 13, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (189, N'இணைய மற்றும் வலை', N'Internet & Web', 14, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (190, N'இயங்குதளங்கள்', N'Operating Systems', 14, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (191, N'கணினி & வீடியோ கேம்கள்', N'Computer & Video Games', 14, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (192, N'கணினி அறிவியல்', N'Computer Science', 14, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (193, N'கணினி பாதுகாப்பு', N'Computer Security', 14, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (194, N'டிஜிட்டல் மீடியா மற்றும் கிராபிக் டிசைன்', N'Digital Media & Graphic Design', 14, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (195, N'தரவுத்தளங்கள்', N'Databases', 14, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (196, N'நிரலாக்க மற்றும் மென்பொருள் விருத்தி', N'Programming & Software Development', 14, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (197, N'நெட்வொர்க்ஸ் மற்றும் கணினி மேலாண்மை', N'Networks & System Administration', 14, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (198, N'மென்பொருள் மற்றும் வணிக பயன்பாடுகள்', N'Software & Business Applications', 14, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (199, N'வன்பொருள் மற்றும் கையடக்க சாதனங்கள்', N'Hardware & Handheld Devices', 14, 0, N'A')
GO
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (200, N'மொழிபெயர்ப்பு', N'Translation', 14, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (201, N'அருங்காட்சியகங்கள் & அரும் பொருட்காட்சி மனையை நிர்வகித்தல்', N'Museums & Museology', 15, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (202, N'இசை', N'Music', 15, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (203, N'ஓவியம் / ஓவியர்கள்', N'Drawing / Painting', 15, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (204, N'கட்டிடக்கலை', N'Architecture', 15, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (205, N'கட்டுரைகள்', N'Essays', 15, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (206, N'சினிமா & ஒளிபரப்பு', N'Cinema & Broadcast', 15, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (207, N'திரைக்கதை-வசனம்', N'Screenplay', 15, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (208, N'திரைப்படம்', N'Cinema', 15, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (209, N'நடனம்', N'Dance', 15, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (210, N'புகைப்படம் எடுத்தல்', N'Photography', 15, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (211, N'வடிவமைப்பு மற்றும் ஃபேஷன்', N'Design & Fashion', 15, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (212, N'வரலாறு, தியரி மற்றும் விமர்சனங்கள்', N'History, Theory & Criticism', 15, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (213, N'மொழிபெயர்ப்பு', N'Translation', 15, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (214, N'கவிதைகள்', N'Poems', 16, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (215, N'சங்க இலக்கியம்', N'Sanga Literature', 16, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (216, N'பிள்ளைத் தமிழ்', N'', 16, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (217, N'ஹைக்கூ', N'Haiku', 16, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (218, N'மொழிபெயர்ப்பு', N'Translation', 16, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (219, N'காதல்', N'Romance', 17, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (220, N'மற்றவை', N'Other', 17, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (221, N'மொழிபெயர்ப்பு', N'Translation', 17, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (222, N'அறிவியல், இயற்கை மற்றும் தொழில்நுட்பம்', N'Science, Nature & Technology', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (223, N'ஆரம்ப கற்றல்', N'Early Learning', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (224, N'இரகசியங்கள் மற்றும் உந்துதல்கள்', N'Mysteries & Curiosities', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (225, N'இலக்கியம் மற்றும் கற்பனை', N'Literature & Fiction', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (226, N'ஊடாடும் &  நடவடிக்கை புத்தகங்கள்', N'Interactive & Activity Books', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (227, N'ஓவியம், கலை மற்றும் இசை', N'Painting, Arts & Music', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (228, N'காமிக்ஸ் / கிராஃபிக் நாவல்', N'Comics / Graphic Novel', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (229, N'குடும்பம், தனிப்பட்ட மற்றும் சமூக சிக்கல்கள்', N'Family, Personal & Social Issues', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (230, N'குறிப்பு', N'Reference', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (231, N'குற்றம் & திகில்', N'Crime & Thriller', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (232, N'கைவினைகள்', N'Crafts, Hobbies & Practical Interests', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (233, N'சாதனை', N'Adventure', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (234, N'சிறார் பாடல்கள்', N'NULL', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (235, N'சிறுவர் கதைகள்', N'NULL', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (236, N'சிறுவர் நாவல்கள்', N'NULL', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (237, N'நகைச்சுவை', N'Humour', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (238, N'படக்கதைகள்', N'Comics', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (239, N'படப்புத்தகங்கள் & குழந்தைகள் மற்றும் சிறுவர்/சிறார் நூல்கள்', N'Picture Books', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (240, N'பணம் மற்றும் வேலை வாய்ப்புகள்', N'Money & Jobs', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (241, N'பாரம்பரிய கதைகள்', N'Traditional Stories', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (242, N'பேண்டஸி, நவீன அறிவியல் மற்றும் திகில்', N'Fantasy, Science Fiction & Horror', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (243, N'மதம்', N'Religion', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (244, N'மொழி கற்றல்', N'Language Learning', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (245, N'வரலாறு', N'History', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (246, N'வரலாற்று கற்பனை', N'Historical Fiction', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (247, N'விளையாட்டு', N'Sport', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (248, N'விளையாட்டு, விளையாட்டு பொம்மைகள்', N'Games, Toys & Activities', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (249, N'மொழிபெயர்ப்பு', N'Translation', 18, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (250, N'குறிப்பு', N'Reference', 19, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (251, N'அழகு குறிப்புகள்', N'Beauty Tips', 20, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (252, N'இல்லம் மற்றும் ஹவுஸ் பராமரிப்பு', N'Home & House Maintenance', 20, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (253, N'உணவு முறை', N'Diet', 20, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (254, N'உணவு, பானம் மற்றும் பொழுதுபோக்கு', N'Food, Drink & Entertaining', 20, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (255, N'கைவினைப் பொருட்கள், அலங்கார கலைகள் & கைத்தொழில்', N'Handicrafts, Decorative Arts & Crafts', 20, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (256, N'சமையல்', N'Cooking', 20, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (257, N'செல்லப்பிராணிகள்', N'Pets', 20, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (258, N'தியானம் / ஞானம்', N'Meditation / Enlightenment', 20, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (259, N'தோட்டம்', N'Gardening', 20, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (260, N'தையற்கலை', N'Tailoring', 20, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (261, N'மாதிரிகள் மற்றும் மாடல்', N'Models & Model Railroading', 20, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (262, N'வாழ்க்கைமுறை மற்றும் தனிப்பட்ட உடை வழிகாட்டிகள்', N'Lifestyle & Personal Style Guides', 20, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (263, N'விளையாட்டு மற்றும் வினாவிடை', N'Games & Quizzes', 20, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (264, N'மொழிபெயர்ப்பு', N'Translation', 20, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (265, N'இதிகாசம்', N'Mythology', 21, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (266, N'ஐஞ்சிறுகாப்பியம்', N'Aincirukappiyam', 21, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (267, N'ஐம்பெருங்காப்பியம்', N'Aimperunkappiyam', 21, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (268, N'சங்க காலக் கவிதைகள்', N'Sangam Poets', 21, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (269, N'சிற்றிலக்கியம்', N'Cirrilakkiyam', 21, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (270, N'தமிழ்க் காப்பியம்', N'NULL', 21, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (271, N'நீதி நூல்கள்', N'Justice books', 21, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (272, N'பக்தி இலக்கியம்', N'Devotional Literature', 21, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (273, N'பதினெண் கீழ்க்கணக்கு', N'Seventeen below', 21, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (274, N'பதினெண் மேற்கணக்கு', N'Eighteen West', 21, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (275, N'மற்றவை', N'Others', 21, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (276, N'சட்டம்', N'Law', 22, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (277, N'ஆராய்ச்சி கட்டுரை', N'Research Essays', 23, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (278, N'உளவியல்', N'Psychology', 23, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (279, N'கல்வி', N'Education', 23, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (280, N'சமூக நலத்துறை மற்றும் சமூக சேவைகள்', N'Social Welfare & Social Services', 23, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (281, N'சமூகம் & வளர்ப்பு', N'Society & Culture', 23, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (282, N'சமூகவியல்', N'Sociology', 23, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (283, N'தத்துவம்', N'Philosophy', 23, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (284, N'மானிடவியல்', N'Anthropology', 23, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (285, N'மொழிபெயர்ப்பு', N'Transalatoin', 23, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (286, N'அனுபவம்', N'', 24, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (287, N'உண்மை கணக்குகள்', N'', 24, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (288, N'கடிதங்கள் மற்றும் பதிவேடுகள்', N'', 24, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (289, N'சுயசரிதைகள் / வாழ்க்கை வரலாறு மற்றும் தன் வரலாறு', N'', 24, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (290, N'மொழிபெயர்ப்பு', N'Translation', 24, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (291, N'சுயமுன்னேற்றம் / தன்னம்பிக்கை', N'', 25, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (292, N'மொழிபெயர்ப்பு', N'Translation', 25, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (293, N'சொற்பொழிவுகள் / உரைகள்', N'Speech', 26, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (294, N'மொழிபெயர்ப்பு', N'Translation', 26, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (295, N'இந்தியத் தத்துவம்', N'NULL', 27, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (296, N'கீழைத் தத்துவம்', N'NULL', 27, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (297, N'தத்துவம்', N'NULL', 27, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (298, N'தமிழர் தத்துவம்', N'NULL', 27, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (299, N'மார்க்சியத் தத்துவம்', N'NULL', 27, 0, N'A')
GO
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (300, N'மேலை நாட்டுத் தத்துவம்', N'NULL', 27, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (301, N'மொழிபெயர்ப்பு', N'Translation', 27, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (302, N'தொல்லியல் / கல்வெட்டு', N'', 28, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (303, N'மற்றவை', N'', 28, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (304, N'அரசு தேர்வுகள்', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (305, N'இக்னோ நுழைவு தேர்வு', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (306, N'ஒருங்கிணைந்த மேலாண்மை நுழைவு', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (307, N'சட்டம் நுழைவுத் தேர்வுகள்', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (308, N'சர்வதேச நுழைவுத் தேர்வுகள்', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (309, N'தொழில்முறை சான்றிதழ் தேர்வுகள்', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (310, N'நிதி மற்றும் கணக்கியல்', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (311, N'பாதுகாப்பு', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (312, N'பாலிடெக்னிக்குகள் மற்றும் ஐடிஐ தேர்வுகள்', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (313, N'பொறியியல் நுழைவுத் தேர்வுகள்', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (314, N'பேட்டி தயாரிப்பு', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (315, N'போட்டித் தேர்வுகள்', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (316, N'மருத்துவ நுழைவுத் தேர்வுகள்', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (317, N'மற்றவை', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (318, N'யுபிஎஸ்சி தேர்வுகள்', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (319, N'வங்கி மற்றும் காப்புறுதி', N'', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (320, N'மொழிபெயர்ப்பு', N'Translation', 29, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (321, N'நகைச்சுவை', N'Comedy', 30, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (322, N'கேள்வி-பதில்', N'Question & Answer', 31, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (323, N'நேர்காணல் & உரையாடல்கள்', N'Interview', 31, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (324, N'பேட்டிகள்', N'Interviews', 31, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (325, N'பகுத்தறிவு', N'Rational', 32, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (326, N'மொழிபெயர்ப்பு', N'Translation', 32, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (327, N'சுற்றுலா & விடுமுறை வழிகாட்டிகள்', N'', 33, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (328, N'பயண கட்டுரை / பயண அனுபவம்', N'', 33, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (329, N'மொழிபெயர்ப்பு', N'Translation', 33, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (330, N'பழமொழிகள்', N'', 34, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (331, N'அறிவியல் மற்றும் கணிதம்', N'Science & Maths', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (332, N'ஆங்கிலம்', N'English', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (333, N'கணினி அறிவியல்', N'Computer', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (334, N'சட்டம்', N'Law', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (335, N'சமூக அறிவியல்', N'Social Science', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (336, N'தமிழ் ', N'Tamil', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (337, N'தொடர்பாடல் மற்றும் இதழியல்', N'', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (338, N'பள்ளி உரைகள்', N'', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (339, N'பொறியியல்', N'Engineering', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (340, N'போதனை மற்றும் கல்வி', N'', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (341, N'மருத்துவம் மற்றும் சுகாதார அறிவியல்', N'', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (342, N'மனிதநேயம்', N'', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (343, N'வரலாறு ', N'History', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (344, N'வர்த்தக மற்றும் நிதி', N'', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (345, N'மற்றவை', N'Others', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (346, N'மொழிபெயர்ப்பு', N'Translation', 35, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (347, N'அறிவியல் நாவல்', N'Science Fiction', 36, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (348, N'இதிகாச / புராண நாவல்', N'Epic / Mythological Novel', 36, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (349, N'கற்பனை நாவல்', N'Fantasy / Fictional Novel', 36, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (350, N'குறுங்கதைகள்', N'Short Stories', 36, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (351, N'குறுநாவல்', N'Short Story Novel', 36, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (352, N'சமூக நாவல்', N'Social novel', 36, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (353, N'சரித்திர / வரலாற்று நாவல்', N'Historical Novel', 36, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (354, N'சிறுகதைகள்', N'Short Stories', 36, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (355, N'திகில் நாவல்', N'Horror Novel', 36, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (356, N'துப்பறியும் புதினம்', N'Detective Novel', 36, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (357, N'நகைச்சுவை', N'Comedy', 36, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (358, N'நாட்டுப்புறக் கதைகள்', N'NULL', 36, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (359, N'நெடுங்கதைகள்', N'Long Stories', 36, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (360, N'மொழிபெயர்ப்பு', N'Translation', 36, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (361, N'பொது அறிவு', N'General Knowledge', 37, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (362, N'பொன்மொழி', N'', 38, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (363, N'அனுபவம்', N'Experience', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (364, N'ஆன்மீகம் / பக்தி', N'Spritual', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (365, N'இந்து மதம்', N'', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (366, N'இஸ்லாமியம்', N'Islamiyam', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (367, N'கவிதைகள்', N'Literature', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (368, N'கிறித்துவம்', N'Christ', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (369, N'சமண மதம்', N'', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (370, N'சமயக் கற்கைகள்', N'', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (371, N'சீக்கியம்', N'Sikh', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (372, N'சோதிடம்', N'', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (373, N'நெறிமுறை', N'', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (374, N'பஞ்சாங்கம்', N'', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (375, N'புத்தம் / பௌத்தம் / பவுத்தம்', N'', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (376, N'மதம் / மதங்கள்', N'NULL', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (377, N'யூதம்', N'', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (378, N'மொழிபெயர்ப்பு', N'Translation', 39, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (379, N'அக்குபிரஷர்', N'NULL', 40, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (380, N'அலோபதி', N'NULL', 40, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (381, N'ஆயுர்வேத மருத்துவம்', N'NULL', 40, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (382, N'இயற்கை மருத்துவம்', N'NULL', 40, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (383, N'கை வைத்தியம்', N'NULL', 40, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (384, N'சித்த வைத்தியம்', N'NULL', 40, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (385, N'நாட்டு வைத்தியம்', N'NULL', 40, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (386, N'பாட்டி வைத்தியம்', N'NULL', 40, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (387, N'மூலிகை வைத்தியம்', N'NULL', 40, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (388, N'ஹோமியோபதி', N'Homeopathy', 40, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (389, N'இதழியல்', N'', 41, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (390, N'இலக்கணம்', N'', 41, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (391, N'எழுதுதல் வழிகாட்டிகள்', N'', 41, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (392, N'கலை மற்றும் பேச்சுத்', N'', 41, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (393, N'மொழி', N'', 41, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (394, N'மொழி கற்றல் & போதனை', N'', 41, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (395, N'மொழியியல்', N'', 41, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (396, N'மொழிபெயர்ப்பு', N'', 41, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (397, N'தாலாட்டுப் பாடல்கள்', N'', 42, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (398, N'நாட்டுப்புறக் கதைகள்', N'', 42, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (399, N'நாட்டுப்புறவியல்', N'', 42, 0, N'A')
GO
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (400, N'கைத்தொழில் மற்றும் வணிக பிரிவுகள்', N'Industries & Business Sectors', 43, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (401, N'பொருளியல்', N'Economics', 43, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (402, N'வணிக சுய உதவி', N'Business Self-Help', 43, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (403, N'வணிகம், வியூகம் மற்றும் மேலாண்மை', N'Business, Strategy & Management', 43, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (404, N'வரலாறு', N'History', 44, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (405, N'வரலாற்று ஆய்வு', N'NULL', 44, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (406, N'நாட்குறிப்பு / நினைவுக்குறிப்பு', N'', 44, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (407, N'வரலாற்று கற்பனை', N'Historical Fiction', 44, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (408, N'வரலாற்றுச் சுவடு', N'NULL', 44, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (409, N'வாழ்க்கை வரலாறு', N'NULL', 44, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (410, N'மொழிபெயர்ப்பு', N'Translation', 44, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (411, N'விடுகதை', N'', 45, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (412, N'ஏர் விளையாட்டு', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (413, N'கபடி', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (414, N'காம்பாட் விளையாட்டு மற்றும் சுய பாதுகாப்பு', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (415, N'கால்பந்து', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (416, N'கால்ப்', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (417, N'கிரிக்கெட்', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (418, N'குதிரையேற்றம் மற்றும் விலங்கு விளையாட்டு', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (419, N'குளிர் கால விளையாட்டுக்கள்', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (420, N'கூடைப்பந்து', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (421, N'சைக்கிள் ஓட்டுதல்', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (422, N'டிரையத்லான்', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (423, N'டென்னிஸ்', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (424, N'நீர் விளையாட்டு', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (425, N'பயிற்சி', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (426, N'பாடிபில்டிங் மற்றும் பளு தூக்குதல்', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (427, N'பூல், பில்லியர்ட்ஸ் மற்றும் ஸ்னூக்கர்', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (428, N'பேஸ்பால்', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (429, N'மராத்தான் மற்றும் இயக்குதல்', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (430, N'மோட்டார் விளையாட்டு', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (431, N'ரக்பி', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (432, N'விளையாட்டு நிகழ்வுகள் மற்றும் நிறுவனங்கள்', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (433, N'ஜிம்னாஸ்டிக்ஸ்', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (434, N'ஸ்கேட்போர்டிங் & ரோலர்பிளேடிங்', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (435, N'மற்றவை', N'', 46, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (436, N'இயற்கை விவசாயம்', N'', 47, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (437, N'கட்டுரைகள்', N'', 47, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (438, N'விவசாயம் / உழவு', N'', 47, 0, N'A')
INSERT [dbo].[Category] ([CategoryID], [Category], [Name], [ParentID], [IsShownInMenu], [RecStatus]) VALUES (439, N'மொழிபெயர்ப்பு', N'Translation', 47, 0, N'A')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (1, N'அரியாங்குப்பம்', N'Ariyankuppam', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (2, N'உழவர்கரை', N'Uzhavarkarai', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (3, N'ஒழுகரை', N'Ozhukarai', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (4, N'காரைக்கால்', N'Karaikal', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (5, N'காலாப்பட்டு', N'Kalapet', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (6, N'குரும்பபெட்', N'Kurumbapet', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (7, N'திருநள்ளாறு', N'Thirunallar', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (8, N'திருமலைராயன் பட்டினம்', N'Tirumalairayanpattinam', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (9, N'நிரவி', N'Neravy', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (10, N'நெடுங்காடு', N'Nedungadu', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (11, N'பந்தக்கல்', N'Pandakkal', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (12, N'பாகூர்', N'Bahour', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (13, N'புதுச்சேரி', N'Puducherry', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (14, N'மணவெளி', N'Manavely', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (15, N'மாகே', N'Mahe', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (16, N'முத்தியால்பேட்டை', N'Muthialpet', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (17, N'யானம்', N'Yanam', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (18, N'லாஸ்பெட்', N'Lawspet', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (19, N'வில்லியனூர்', N'Villianur', 27, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (20, N'அகஸ்தீஸ்வரம்', N'Agastheeswaram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (21, N'அந்தியூர்', N'Anthiyur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (22, N'அம்பாசமுத்திரம்', N'Ambasamudram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (23, N'அரகண்டநல்லூர்', N'Arakandanallur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (24, N'அரக்கோணம்', N'Arakkonam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (25, N'அரவக்குறிச்சி', N'Aravakurichi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (26, N'அரியலூர்', N'Ariyalur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (27, N'அருப்புக்கோட்டை', N'Aruppukkottai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (28, N'அரூர்', N'Harur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (29, N'அவனியாபுரம்', N'Avaniapuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (30, N'அவிநாசி', N'Avinashi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (31, N'அறந்தாங்கி', N'Aranthangi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (32, N'அனகாபுத்தூர்', N'Anakaputhur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (33, N'ஆண்டிமடம்', N'Andimadam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (34, N'ஆத்தூர்', N'Attur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (35, N'ஆம்பூர்', N'Ambur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (36, N'ஆரணி', N'Arani', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (37, N'ஆற்காடு', N'Arcot', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (38, N'ஆனைமலை', N'Anaimalai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (39, N'ஆனையூர்', N'Anaiyur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (40, N'இனாம் கரூர்', N'Inam Karur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (41, N'ஈரோடு', N'Erode', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (42, N'உசிலம்பட்டி', N'Usilampatti', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (43, N'உடுமலைப்பேட்டை', N'Udumalaipettai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (44, N'உடையார்பாளையம்', N'Uadayarpalayam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (45, N'உதகமண்டலம்', N'Udhagamandalam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (46, N'உத்திரமேரூர்', N'Uthiramerur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (47, N'உளுந்தூர்பேட்டை', N'Ulundurpet', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (48, N'ஊத்தங்கரை', N'Uthangarai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (49, N'எடப்பாடி', N'Idappadi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (50, N'ஏற்காடு', N'Yercaud', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (51, N'ஒட்டன்சத்திரம்', N'Oddanchathiram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (52, N'ஒரத்தநாடு', N'Orathanad', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (53, N'ஓசூர்', N'Hosur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (54, N'ஓமல்பூர்', N'Omalpur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (55, N'கங்கைகொண்ட சோழபுரம்', N'Gangaikondapuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (56, N'கடலூர்', N'Cuddalore', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (57, N'கடையநல்லூர்', N'Kadayanallur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (58, N'கந்தர்வகோட்டை', N'Gandarvakottai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (59, N'கம்பம்', N'Cumbum', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (60, N'கரூர்', N'Karur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (61, N'கல்குளம்', N'Kalkulam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (62, N'கல்வராயன் மலை', N'Kalvarayan Hills', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (63, N'கவுண்டம்பாளையம்', N'Goundampalayam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (64, N'கள்ளக்குறிச்சி', N'Kallakurichi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (65, N'கன்னியாகுமரி', N'Kanyakumari', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (66, N'காங்கேயம்', N'Kangeyam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (67, N'காசிபாளையம்', N'Kasipalayam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (68, N'காஞ்சிபுரம்', N'Kanchipuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (69, N'காட்டு மன்னார் கோவில்', N'Kattumannarkoil', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (70, N'காயல்பட்டினம்', N'Kayalpattinam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (71, N'காரிமங்கலம்', N'Karimangalam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (72, N'காரைக்கால்', N'Karaikal', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (73, N'காரைக்குடி', N'Karaikudi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (74, N'கிணத்துக்கடவு', N'Kinathukaduvu', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (75, N'கிருஷ்ணகிரி', N'Krishnagiri', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (76, N'கிள்ளியூர்', N'Killiyoor', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (77, N'கீரனூர்', N'Keeranur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (78, N'கீழக்கரை', N'Keelakarai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (79, N'குடியாத்தம்', N'Gudiyatham', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (80, N'குமாரபாளையம்', N'Komarapalayam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (81, N'கும்பகோணம்', N'Kumbakonam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (82, N'குழித்துறை', N'Kuzhithurai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (83, N'குளச்சல்', N'Colachel', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (84, N'குறிச்சி', N'Kurichi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (85, N'குறிஞ்சிபாடி', N'Kurinjipadi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (86, N'குனியமுத்தூர்', N'Kuniyamuthur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (87, N'குன்றத்தூர்', N'Kundrathur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (88, N'குன்னூர்', N'Coonoor', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (89, N'குஜிலியம்பாறை', N'Guziliyamparai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (90, N'கூடலூர்', N'Gudalur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (91, N'கூத்தாநல்லூர்', N'Koothanallur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (92, N'கொடுமுடி', N'Kodumudi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (93, N'கொடைக்கானல்', N'Kodaikanal', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (94, N'கோத்தகிரி', N'Kotagiri', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (95, N'கோபிசெட்டிபாளையம்', N'Gobichettipalayam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (96, N'கோயம்புத்தூர்', N'Coimbatore', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (97, N'கோவில்பட்டி', N'Kovilpatti', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (98, N'சங்ககிரி', N'Sankagiri', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (99, N'சங்கரன்கோவில்', N'Sankarankoil', 31, 97, N'A')
GO
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (100, N'சங்கராபுரம்', N'Sankarapuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (101, N'சத்தியமங்கலம்', N'Sathyamangalam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (102, N'சாத்தூர்', N'Sattur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (103, N'சாயல்குடி', N'Sayalkudi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (104, N'சிதம்பரம்', N'Chidambaram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (105, N'சிவகங்கை', N'Sivagangai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (106, N'சிவகாசி', N'Sivakasi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (107, N'சின்னசேலம்', N'Chinnasalem', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (108, N'சின்னமனூர்', N'Chinnamanur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (109, N'சீர்காழி', N'Sirkazhi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (110, N'சூரம்பட்டி', N'Surampatti', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (111, N'சூலூர்', N'Sulur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (112, N'செங்கம்', N'Chengam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (113, N'செங்கல்பட்டு', N'Chengalpattu', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (114, N'செங்கோட்டை', N'Sengottai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (115, N'செஞ்சி', N'Gingee', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (116, N'செந்துறை', N'Sendurai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (117, N'செய்துங்கநல்லூர்', N'Seydunganallur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (118, N'செய்யாறு', N'Cheyyar', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (119, N'செய்யூர்', N'Cheyyur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (120, N'சென்னை', N'Chennai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (121, N'சேலம்', N'Salem', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (122, N'சோழவந்தான்', N'Sholavandan', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (123, N'டால்மியாபுரம்', N'Dalmiapuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (124, N'தஞ்சாவூர்', N'Thanjavur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (125, N'தரம்புரம்', N'Dharampuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (126, N'தருமபுரி', N'Dharmapuri', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (127, N'தாந்தோணி', N'Thanthoni', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (128, N'தாளவாடி', N'Thalavadi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (129, N'திட்டக்குடி', N'Thittakudi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (130, N'திண்டிவனம்', N'Tindivanam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (131, N'திண்டுக்கல்', N'Dindigul', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (132, N'திருக்கழுக்குன்றம்', N'Tirukkazhukkundram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (133, N'திருக்கோயிலூர்', N'Tirukkoyilur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (134, N'திருச்சிராப்பள்ளி', N'Tiruchirappalli', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (135, N'திருச்செங்கோடு', N'Tiruchengode', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (136, N'திருச்செந்தூர்', N'Tiruchendur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (137, N'திருத்தங்கல்', N'Thiruthangal', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (138, N'திருத்தணி', N'Thiruthani', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (139, N'திருத்துறைப்பூண்டி', N'Thiruthuraipoondi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (140, N'திருநெல்வேலி', N'Tirunelvelli', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (141, N'திருப்பத்தூர்', N'Tiruppattur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (142, N'திருப்பரங்குன்றம்', N'Thirupparankundram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (143, N'திருப்பூர்', N'Tiruppur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (144, N'திருப்போருர்', N'Thirupporur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (145, N'திருமங்கலம்', N'Thirumanglam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (146, N'திருவட்டார்', N'Thiruvattar', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (147, N'திருவண்ணாமலை', N'Thiruvannamalai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (148, N'திருவள்ளூர்', N'Tiruvallur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (149, N'திருவாரூர்', N'Tiruvarur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (150, N'திருவெட்டிபுரம்', N'Tiruvettipuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (151, N'திருவேற்காடு', N'Thiruverkadu', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (152, N'திருவொற்றியூர்', N'Tiruvottiyur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (153, N'துவாக்குடி', N'Thuvakudi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (154, N'துறையூர்', N'Thuraiyur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (155, N'தூத்துக்குடி', N'Thoothukudi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (156, N'தென்கலம்', N'Thenkalam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (157, N'தென்காசி', N'Tenkasi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (158, N'தேவகோட்டை', N'Devakottai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (159, N'தேனி', N'Theni', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (160, N'தேனி அல்லிநகரம்', N'Theni Allinagaram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (161, N'தேன்கனிக்கோட்டை', N'Denkanikoitah', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (162, N'தோவாளை', N'Thovalai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (163, N'நத்தம்', N'Natham', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (164, N'நம்பியூர்', N'Nambiyur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (165, N'நரசிங்கபுரம்', N'Narasingapuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (166, N'நல்லம்பள்ளி', N'Nallampalli', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (167, N'நல்லூர்', N'Nallur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (168, N'நன்னிலம்', N'Nannilam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (169, N'நாகப்பட்டினம்', N'Nagapattinam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (170, N'நாகர்கோவில்', N'Nagarcoil', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (171, N'நாங்குநேரி', N'Nanguneri', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (172, N'நாமக்கல்', N'Namakkal', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (173, N'நிலக்கோட்டை', N'Nilakottai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (174, N'நெல்லிக்குப்பம்', N'Nellikuppam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (175, N'நெல்லியாளம்', N'Nelliyalam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (176, N'பட்டுக்கோட்டை', N'Pattukkottai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (177, N'பண்ருட்டி', N'Panruti', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (178, N'பத்மநாபபுரம்', N'Padmanabhapuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (179, N'பம்மல்', N'Pammal', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (180, N'பரங்கிப்பேட்டை', N'Parangipettai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (181, N'பரமக்குடி', N'Paramakudi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (182, N'பல்லடம்', N'Palladam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (183, N'பல்லவபுரம்', N'Pallavapuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (184, N'பவானி', N'Bhavani', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (185, N'பழனி', N'Palani', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (186, N'பள்ளிபாளையம்', N'Pallipalayam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (187, N'பாண்டிச்சேரி', N'Pondicherry', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (188, N'பாபநாசம்', N'Papanasam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (189, N'பாப்பிரெட்டிபட்டி', N'Pappireddiappatti', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (190, N'பாலகோடு', N'Palacode', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (191, N'பாலக்கோடு', N'Palacode', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (192, N'பாளையங்கோட்டை', N'Palayamkottai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (193, N'புஞ்சைபுளியம்பட்டி', N'Punjaipuliampatti', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (194, N'புதுக்கோட்டை', N'Pudukkottai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (195, N'புவனகிரி', N'Bhuvanagiri', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (196, N'புழுதிவாக்கம்', N'Puzhuthivakkam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (197, N'புளியங்குடி', N'Puliyankudi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (198, N'பூந்தமல்லி', N'Poonamallee', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (199, N'பெரம்பலூர்', N'Perambalur', 31, 97, N'A')
GO
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (200, N'பெரியகுளம்', N'Periyakulam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (201, N'பெரியசேமூர்', N'Periyasemur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (202, N'பெருந்துறை', N'Perundurai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (203, N'பென்னாகரம்', N'Pennagaram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (204, N'பேரூர்', N'Perur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (205, N'பேர்ணாம்பட்டு', N'Pernampattu', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (206, N'பொள்ளாச்சி', N'Pollachi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (207, N'பொன்னமராவதி', N'Ponnamaravathi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (208, N'பொன்னேரி', N'Ponneri', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (209, N'போடிநாயக்கனூர்', N'Bodinayakanur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (210, N'போளூர்', N'Polur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (211, N'மணப்பாறை', N'Manapparai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (212, N'மதுக்கரை', N'Madhukkarai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (213, N'மதுராந்தகம்', N'Maduranthakam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (214, N'மதுரை', N'Madurai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (215, N'மயிலாடுதுறை', N'Mayiladuthurai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (216, N'மறைமலைநகர்', N'Maraimalainagar', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (217, N'மன்னார்குடி', N'Mannargudi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (218, N'மானாமதுரை', N'Manamadurai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (219, N'முசிறி', N'Musiri', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (220, N'முதுகுளத்தூர்', N'Mudukulathur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (221, N'மூலனூர்', N'Mulanur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (222, N'மேட்டுப்பாளையம்', N'Mettupalayam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (223, N'மேட்டூர்', N'Mettur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (224, N'மேலூர்', N'Melur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (225, N'மேல்விஷாரம்', N'Melvisharam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (226, N'மொடக்குறிச்சி', N'Modakurichi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (227, N'ராசிபுரம்', N'Rasipuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (228, N'ராணிப்பேட்டை', N'Ranipet', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (229, N'ராமநாதபுரம்', N'Ramanathapuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (230, N'ராமேஸ்வரம்', N'Rameshwaram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (231, N'ராஜபாளையம்', N'Rajapalayam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (232, N'வண்டலூர்', N'Vandalur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (233, N'வத்தலக்குண்டு', N'Batlagundu', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (234, N'வத்திராயிருப்பு', N'Watrap(Vattirayiruppu)', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (235, N'வந்தவாசி', N'Vandavasi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (236, N'வலங்கைமான்', N'Valangaiman', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (237, N'வள்ளியூர்', N'Valliyoor', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (238, N'வாணியம்பாடி', N'Vaniyambadi', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (239, N'வாண்டிவாஷ்', N'Wandiwash', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (240, N'வாலாஜாபேட்டை', N'Walajapettai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (241, N'வால்பாறை', N'Valparai', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (242, N'வாழப்பாடி', N'Valapady', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (243, N'விக்கிரமசிங்கபுரம்', N'Vikramasingapuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (244, N'விருதுநகர்', N'Virudhunagar', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (245, N'விருத்தாசலம்', N'Virudhachalam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (246, N'விழுப்புரம்', N'Villupuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (247, N'விளவன்கோடு', N'Vilavancode', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (248, N'விளாத்திகுளம்', N'Vilathikulam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (249, N'வீரப்பன்சத்திரம்', N'Veerappanchatram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (250, N'வெள்ளக்கோயில்', N'Vellakoil', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (251, N'வேடசந்தூர்', N'Vedasandur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (252, N'வேதாரண்யம்', N'Vedaranyam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (253, N'வேப்பூர் வட்டம்', N'Vepur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (254, N'வேலம்பாளையம்', N'Velampalayam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (255, N'வேலூர்', N'Vellore', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (256, N'ஜலகண்டாபுரம்', N'Jalakandapuram', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (257, N'ஜெயம்கொண்டான்', N'Jayamkondan', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (258, N'ஜோலார்பேட்டை', N'Jolarpet', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (259, N'ஸ்ரீபெரும்புதூர்', N'Sriperumpudur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (260, N'ஸ்ரீமூஷ்ணம்', N'Srimushnam', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (261, N'ஸ்ரீவில்லிபுத்தூர்', N'Srivilliputhur', 31, 97, N'A')
INSERT [dbo].[City] ([CityID], [City], [Name], [StateID], [CountryID], [RecStatus]) VALUES (262, N'ஸ்ரீவைகுண்டம்', N'Srivaikundam', 31, 97, N'A')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (1, N'Afghanistan', N'AF', N'AFG', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (2, N'Albania', N'AL', N'ALB', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (3, N'Algeria', N'DZ', N'DZA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (4, N'American Samoa', N'AS', N'ASM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (5, N'Andorra', N'AD', N'AND', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (6, N'Angola', N'AO', N'AGO', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (7, N'Anguilla', N'AI', N'AIA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (8, N'Antarctica', N'AQ', N'ATA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (9, N'Antigua and Barbuda', N'AG', N'ATG', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (10, N'Argentina', N'AR', N'ARG', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (11, N'Armenia', N'AM', N'ARM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (12, N'Aruba', N'AW', N'ABW', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (13, N'Australia', N'AU', N'AUS', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (14, N'Austria', N'AT', N'AUT', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (15, N'Azerbaijan', N'AZ', N'AZE', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (16, N'Bahamas', N'BS', N'BHS', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (17, N'Bahrain', N'BH', N'BHR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (18, N'Bangladesh', N'BD', N'BGD', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (19, N'Barbados', N'BB', N'BRB', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (20, N'Belarus', N'BY', N'BLR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (21, N'Belgium', N'BE', N'BEL', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (22, N'Belize', N'BZ', N'BLZ', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (23, N'Benin', N'BJ', N'BEN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (24, N'Bermuda', N'BM', N'BMU', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (25, N'Bhutan', N'BT', N'BTN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (26, N'Bolivia', N'BO', N'BOL', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (27, N'Bosnia and Herzegowina', N'BA', N'BIH', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (28, N'Botswana', N'BW', N'BWA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (29, N'Bouvet Island', N'BV', N'BVT', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (30, N'Brazil', N'BR', N'BRA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (31, N'British Indian Ocean Territory', N'IO', N'IOT', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (32, N'Brunei Darussalam', N'BN', N'BRN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (33, N'Bulgaria', N'BG', N'BGR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (34, N'Burkina Faso', N'BF', N'BFA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (35, N'Burundi', N'BI', N'BDI', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (36, N'Cambodia', N'KH', N'KHM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (37, N'Cameroon', N'CM', N'CMR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (38, N'Canada', N'CA', N'CAN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (39, N'Cape Verde', N'CV', N'CPV', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (40, N'Cayman Islands', N'KY', N'CYM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (41, N'Central African Republic', N'CF', N'CAF', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (42, N'Chad', N'TD', N'TCD', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (43, N'Chile', N'CL', N'CHL', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (44, N'China', N'CN', N'CHN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (45, N'Christmas Island', N'CX', N'CXR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (46, N'Cocos (Keeling) Islands', N'CC', N'CCK', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (47, N'Colombia', N'CO', N'COL', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (48, N'Comoros', N'KM', N'COM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (49, N'Congo', N'CG', N'COG', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (50, N'Cook Islands', N'CK', N'COK', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (51, N'Costa Rica', N'CR', N'CRI', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (52, N'Cote D''Ivoire', N'CI', N'CIV', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (53, N'Croatia', N'HR', N'HRV', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (54, N'Cuba', N'CU', N'CUB', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (55, N'Cyprus', N'CY', N'CYP', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (56, N'Czech Republic', N'CZ', N'CZE', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (57, N'Denmark', N'DK', N'DNK', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (58, N'Djibouti', N'DJ', N'DJI', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (59, N'Dominica', N'DM', N'DMA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (60, N'Dominican Republic', N'DO', N'DOM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (61, N'Ecuador', N'EC', N'ECU', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (62, N'Egypt', N'EG', N'EGY', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (63, N'El Salvador', N'SV', N'SLV', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (64, N'Equatorial Guinea', N'GQ', N'GNQ', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (65, N'Eritrea', N'ER', N'ERI', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (66, N'Estonia', N'EE', N'EST', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (67, N'Ethiopia', N'ET', N'ETH', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (68, N'Falkland Islands (Malvinas)', N'FK', N'FLK', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (69, N'Faroe Islands', N'FO', N'FRO', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (70, N'Fiji', N'FJ', N'FJI', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (71, N'Finland', N'FI', N'FIN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (72, N'France', N'FR', N'FRA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (73, N'French Guiana', N'GF', N'GUF', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (74, N'French Polynesia', N'PF', N'PYF', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (75, N'French Southern Territories', N'TF', N'ATF', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (76, N'Gabon', N'GA', N'GAB', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (77, N'Gambia', N'GM', N'GMB', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (78, N'Georgia', N'GE', N'GEO', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (79, N'Germany', N'DE', N'DEU', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (80, N'Ghana', N'GH', N'GHA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (81, N'Gibraltar', N'GI', N'GIB', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (82, N'Greece', N'GR', N'GRC', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (83, N'Greenland', N'GL', N'GRL', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (84, N'Grenada', N'GD', N'GRD', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (85, N'Guadeloupe', N'GP', N'GLP', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (86, N'Guam', N'GU', N'GUM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (87, N'Guatemala', N'GT', N'GTM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (88, N'Guinea', N'GN', N'GIN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (89, N'Guinea-Bissau', N'GW', N'GNB', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (90, N'Guyana', N'GY', N'GUY', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (91, N'Haiti', N'HT', N'HTI', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (92, N'Heard and Mc Donald Islands', N'HM', N'HMD', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (93, N'Honduras', N'HN', N'HND', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (94, N'Hong Kong', N'HK', N'HKG', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (95, N'Hungary', N'HU', N'HUN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (96, N'Iceland', N'IS', N'ISL', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (97, N'India', N'IN', N'IND', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (98, N'Indonesia', N'ID', N'IDN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (99, N'Iran', N'IR', N'IRN', N'A')
GO
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (100, N'Iraq', N'IQ', N'IRQ', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (101, N'Ireland', N'IE', N'IRL', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (102, N'Israel', N'IL', N'ISR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (103, N'Italy', N'IT', N'ITA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (104, N'Jamaica', N'JM', N'JAM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (105, N'Japan', N'JP', N'JPN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (106, N'Jordan', N'JO', N'JOR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (107, N'Kazakhstan', N'KZ', N'KAZ', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (108, N'Kenya', N'KE', N'KEN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (109, N'Kiribati', N'KI', N'KIR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (110, N'Kuwait', N'KW', N'KWT', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (111, N'Kyrgyzstan', N'KG', N'KGZ', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (112, N'Lao People''s Democratic Republic(Laos)', N'LA', N'LAO', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (113, N'Latvia', N'LV', N'LVA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (114, N'Lebanon', N'LB', N'LBN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (115, N'Lesotho', N'LS', N'LSO', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (116, N'Liberia', N'LR', N'LBR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (117, N'Libyan Arab Jamahiriya', N'LY', N'LBY', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (118, N'Liechtenstein', N'LI', N'LIE', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (119, N'Lithuania', N'LT', N'LTU', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (120, N'Luxembourg', N'LU', N'LUX', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (121, N'Macau', N'MO', N'MAC', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (122, N'Macedonia', N'MK', N'MKD', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (123, N'Madagascar', N'MG', N'MDG', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (124, N'Malawi', N'MW', N'MWI', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (125, N'Malaysia', N'MY', N'MYS', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (126, N'Maldives', N'MV', N'MDV', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (127, N'Mali', N'ML', N'MLI', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (128, N'Malta', N'MT', N'MLT', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (129, N'Marshall Islands', N'MH', N'MHL', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (130, N'Martinique', N'MQ', N'MTQ', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (131, N'Mauritania', N'MR', N'MRT', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (132, N'Mauritius', N'MU', N'MUS', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (133, N'Mayotte', N'YT', N'MYT', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (134, N'Mexico', N'MX', N'MEX', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (135, N'Micronesia', N'FM', N'FSM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (136, N'Moldova', N'MD', N'MDA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (137, N'Monaco', N'MC', N'MCO', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (138, N'Mongolia', N'MN', N'MNG', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (139, N'Montserrat', N'MS', N'MSR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (140, N'Morocco', N'MA', N'MAR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (141, N'Mozambique', N'MZ', N'MOZ', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (142, N'Myanmar', N'MM', N'MMR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (143, N'Namibia', N'NA', N'NAM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (144, N'Nauru', N'NR', N'NRU', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (145, N'Nepal', N'NP', N'NPL', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (146, N'Netherlands', N'NL', N'NLD', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (147, N'Netherlands Antilles', N'AN', N'ANT', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (148, N'New Caledonia', N'NC', N'NCL', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (149, N'New Zealand', N'NZ', N'NZL', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (150, N'Nicaragua', N'NI', N'NIC', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (151, N'Niger', N'NE', N'NER', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (152, N'Nigeria', N'NG', N'NGA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (153, N'Niue', N'NU', N'NIU', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (154, N'Norfolk Island', N'NF', N'NFK', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (155, N'North Korea', N'KP', N'PRK', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (156, N'Northern Mariana Islands', N'MP', N'MNP', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (157, N'Norway', N'NO', N'NOR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (158, N'Oman', N'OM', N'OMN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (159, N'Pakistan', N'PK', N'PAK', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (160, N'Palau', N'PW', N'PLW', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (161, N'Panama', N'PA', N'PAN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (162, N'Papua New Guinea', N'PG', N'PNG', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (163, N'Paraguay', N'PY', N'PRY', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (164, N'Peru', N'PE', N'PER', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (165, N'Philippines', N'PH', N'PHL', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (166, N'Pitcairn', N'PN', N'PCN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (167, N'Poland', N'PL', N'POL', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (168, N'Portugal', N'PT', N'PRT', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (169, N'Puerto Rico', N'PR', N'PRI', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (170, N'Qatar', N'QA', N'QAT', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (171, N'Reunion', N'RE', N'REU', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (172, N'Romania', N'RO', N'ROM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (173, N'Russia', N'RU', N'RUS', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (174, N'Rwanda', N'RW', N'RWA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (175, N'Saint Kitts and Nevis', N'KN', N'KNA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (176, N'Saint Lucia', N'LC', N'LCA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (177, N'Saint Vincent and the Grenadines', N'VC', N'VCT', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (178, N'Samoa', N'WS', N'WSM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (179, N'San Marino', N'SM', N'SMR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (180, N'Sao Tome and Principe', N'ST', N'STP', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (181, N'Saudi Arabia', N'SA', N'SAU', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (182, N'Senegal', N'SN', N'SEN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (183, N'Serbia', N'RS', N'SRB', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (184, N'Seychelles', N'SC', N'SYC', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (185, N'Sierra Leone', N'SL', N'SLE', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (186, N'Singapore', N'SG', N'SGP', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (187, N'Slovakia', N'SK', N'SVK', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (188, N'Slovenia', N'SI', N'SVN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (189, N'Solomon Islands', N'SB', N'SLB', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (190, N'Somalia', N'SO', N'SOM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (191, N'South Africa', N'ZA', N'ZAF', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (192, N'South Georgia & South Sandwich Islands', N'GS', N'SGS', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (193, N'South Korea', N'KR', N'KOR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (194, N'Spain', N'ES', N'ESP', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (195, N'Sri Lanka', N'LK', N'LKA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (196, N'St. Helena', N'SH', N'SHN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (197, N'St. Pierre and Miquelon', N'PM', N'SPM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (198, N'Sudan', N'SD', N'SDN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (199, N'Suriname', N'SR', N'SUR', N'A')
GO
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (200, N'Svalbard and Jan Mayen Islands', N'SJ', N'SJM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (201, N'Swaziland', N'SZ', N'SWZ', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (202, N'Sweden', N'SE', N'SWE', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (203, N'Switzerland', N'CH', N'CHE', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (204, N'Syrian Arab Republic', N'SY', N'SYR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (205, N'Taiwan', N'TW', N'TWN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (206, N'Tajikistan', N'TJ', N'TJK', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (207, N'Tanzania', N'TZ', N'TZA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (208, N'Thailand', N'TH', N'THA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (209, N'Togo', N'TG', N'TGO', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (210, N'Tokelau', N'TK', N'TKL', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (211, N'Tonga', N'TO', N'TON', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (212, N'Trinidad and Tobago', N'TT', N'TTO', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (213, N'Tunisia', N'TN', N'TUN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (214, N'Turkey', N'TR', N'TUR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (215, N'Turkmenistan', N'TM', N'TKM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (216, N'Turks and Caicos Islands', N'TC', N'TCA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (217, N'Tuvalu', N'TV', N'TUV', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (218, N'Uganda', N'UG', N'UGA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (219, N'Ukraine', N'UA', N'UKR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (220, N'United Arab Emirates', N'AE', N'ARE', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (221, N'United Kingdom', N'GB', N'GBR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (222, N'United States', N'US', N'USA', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (223, N'United States minor outlying islands', N'UM', N'UMI', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (224, N'Uruguay', N'UY', N'URY', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (225, N'Uzbekistan', N'UZ', N'UZB', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (226, N'Vanuatu', N'VU', N'VUT', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (227, N'Vatican City State (Holy See)', N'VA', N'VAT', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (228, N'Venezuela', N'VE', N'VEN', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (229, N'Vietnam', N'VN', N'VNM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (230, N'Virgin Islands (British)', N'VG', N'VGB', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (231, N'Virgin Islands (U.S.)', N'VI', N'VIR', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (232, N'Wallis and Futuna Islands', N'WF', N'WLF', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (233, N'Western Sahara', N'EH', N'ESH', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (234, N'Yemen', N'YE', N'YEM', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (235, N'Zambia', N'ZM', N'ZMB', N'A')
INSERT [dbo].[Country] ([CountryID], [Country], [TwoLetterISOCode], [ThreeLetterISOCode], [RecStatus]) VALUES (236, N'Zimbabwe', N'ZW', N'ZWE', N'A')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Profession] ON 

INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (1, N'அரசியல்வாதி', N'Politician', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (2, N'அரசு ஊழியர்', N'Government Employee', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (3, N'ஆசிரியர் / பேராசிரியர்', N'Teacher/Professor', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (4, N'ஆய்வாளர்', N'Analyst', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (5, N'ஆலோசகர்', N'Consultant', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (6, N'உரையாசிரியர்', N'Speechwriter', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (7, N'எழுத்தாளர் / கவிஞர்', N'Writer / Poet', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (8, N'ஓவியர்', N'Artist', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (9, N'கணிப்பொறியாளர்', N'Software Engineer', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (10, N'காவல்துறையினர்', N'Police', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (11, N'குடும்பத் தலைவி', N'House Wofe', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (12, N'சங்ககாலப் புலவர்', N'Sanga Poet', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (13, N'சந்தைப் பிரிவு', N'Marketing', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (14, N'சமூக சேவகர்', N'Social', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (15, N'தமிழறிஞர்', N'', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (16, N'தனியார் அலுவலக ஊழியர்', N'Private Employee', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (17, N'திரைப்படக் கலைஞர்', N'Cinema Artist', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (18, N'திறனாய்வாளர் / விமர்சகர்', N'Reviewer', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (19, N'தொலைக்காட்சி', N'TV', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (20, N'தொல்லியல் அறிஞர்', N'Archaeologist', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (21, N'நீதிபதி', N'Judge', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (22, N'நூலகர்', N'Librariyan', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (23, N'பதிப்பகத்தார்', N'Publisher', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (24, N'பத்திரிகையாளர்', N'Journalist', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (25, N'பொறியாளர்', N'Engineer', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (26, N'மதகுரு', N'Priest', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (27, N'மருத்துவர்', N'Doctor', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (28, N'மாணவர்', N'Student', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (29, N'வரலாற்று ஆய்வாளர்', N'Historian', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (30, N'வர்த்தகர்', N'Merchant', N'A')
INSERT [dbo].[Profession] ([ProfessionID], [Profession], [Name], [RecStatus]) VALUES (31, N'வழக்குரைஞர்', N'Attorney', N'A')
SET IDENTITY_INSERT [dbo].[Profession] OFF
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([ProjectID], [Code], [Project], [URL], [RecStatus]) VALUES (1, N'KarkaThamizha', N'Karka Thamizha', N'http://www.karkathamizha.com', N'A')
INSERT [dbo].[Projects] ([ProjectID], [Code], [Project], [URL], [RecStatus]) VALUES (2, N'KarkaThamizha-Admin', N'Karka Thamizha Admin', N'http://www.admin.karkathamizha.com', N'A')
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
SET IDENTITY_INSERT [dbo].[SeriesType] ON 

INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (1, N'அரசியல்', N'Politics', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (2, N'ஆன்மிகம்', N'Spirituality', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (3, N'இலக்கியம்', N'Literature', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (4, N'உண்வு', N'Food', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (5, N'கட்டுரை', N'Essay', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (6, N'கலாச்சாரம்-பண்பாடு', N'Culture', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (7, N'கவிதை', N'Poet', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (8, N'குடும்பம்', N'Family', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (9, N'சமூக நாவல்', N'Social Novel', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (10, N'சமூகம்', N'Society', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (11, N'சினிமா', N'Cinema', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (12, N'சுற்றுச்சூழல்', N'Environment', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (13, N'தமிழீழம்', N'', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (14, N'தன் வரலாறு', N'Biography', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (15, N'தன்னம்பிக்கை', N'Self-confidence', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (16, N'திராவிட இயக்க வரலாறு', N'Dravidian Movement', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (17, N'தொடர் கதை', N'Serial', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (18, N'பகுத்தறிவு', N'Rational', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (19, N'மருத்துவம்', N'Medicine', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (20, N'வரலாற்று தொடர்', N'Historical Series', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (21, N'வரலாற்று நாவல்', N'Historical Novel', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (22, N'வாழ்க்கை வரலாறு', N'Life History', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (23, N'விவசாயம்', N'Agriculture', N'A')
INSERT [dbo].[SeriesType] ([SeriesTypeID], [SeriesType], [Name], [RecStatus]) VALUES (24, N'விளையாட்டு', N'Sports', N'A')
SET IDENTITY_INSERT [dbo].[SeriesType] OFF
GO
SET IDENTITY_INSERT [dbo].[SpecialName] ON 

INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (1, N'ஆசிரியர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (2, N'ஆய்வறிஞர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (3, N'இலக்கியச் செல்வர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (4, N'உரைவேந்தர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (5, N'உவமைக் கவிஞர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (6, N'ஔவை', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (7, N'கலைஞர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (8, N'கவிச்சக்கரவர்த்தி', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (9, N'கவிஞர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (10, N'கவிஞாயிறு', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (11, N'கவிப்பேரரசு', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (12, N'கவிமணி', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (13, N'கவியரசர் ', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (14, N'கவியரசு', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (15, N'கவியோகி', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (16, N'கவிராஜ பண்டிதர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (17, N'கிறிஸ்தவக் கம்பர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (18, N'குழந்தைக் கவிஞர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (19, N'கூலவாணிகன்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (20, N'சதாவதானி', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (21, N'சிலம்புச் செல்வர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (22, N'சிறுகதை வேந்தர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (23, N'சொல்லின் செல்வர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (24, N'டாக்டர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (25, N'தந்தை பெரியார்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (26, N'தமிழக வேர்ட்ஸ்வொர்த்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (27, N'தமிழறிஞர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (28, N'தமிழ் நாடகத் தந்தை', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (29, N'தமிழ்த் தாத்தா', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (30, N'தனித்தமிழ் இயக்கத் தந்தை', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (31, N'திராவிட சாஸ்திரி', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (32, N'திராவிட சிசு', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (33, N'திருக்குறளார்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (34, N'தெய்வப்புலவர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (35, N'நாமக்கல் கவிஞர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (36, N'நீதிபதி', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (37, N'பண்டிதமணி', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (38, N'பண்டிதர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (39, N'பன்மொழிப் புலவர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (40, N'பாவலரேறு', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (41, N'பாவேந்தர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (42, N'புலவர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (43, N'பேரறிஞர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (44, N'பேராசிரியர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (45, N'மகாகவி', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (46, N'மகாவித்துவான்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (47, N'மக்கள் கவிஞர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (48, N'மதுரகவி', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (49, N'மருத்துவர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (50, N'முத்தமிழ்க் காவலர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (51, N'முல்லை', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (52, N'முனைவர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (53, N'மூதறிஞர்', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (54, N'மொழி ஞாயிறு', N'A')
INSERT [dbo].[SpecialName] ([SpecialNameID], [SpecialName], [RecStatus]) VALUES (55, N'ரசிகமணி', N'A')
SET IDENTITY_INSERT [dbo].[SpecialName] OFF
GO
SET IDENTITY_INSERT [dbo].[States] ON 

INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (1, N'Andaman and Nicobar Islands', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (2, N'Andra Pradesh', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (3, N'Arunachal Pradesh', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (4, N'Assam', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (5, N'Bihar', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (6, N'Chandigarh', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (7, N'Chhattisgarh', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (8, N'Dadar and Nagar Haveli', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (9, N'Daman and Diu', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (10, N'Delhi', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (11, N'Goa', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (12, N'Gujarat', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (13, N'Haryana', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (14, N'Himachal Pradesh', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (15, N'Jammu and Kashmir', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (16, N'Jharkhand', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (17, N'Karnataka', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (18, N'Kerala', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (19, N'Lakshadweep', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (20, N'Madya Pradesh', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (21, N'Maharashtra', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (22, N'Manipur', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (23, N'Meghalaya', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (24, N'Mizoram', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (25, N'Nagaland', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (26, N'Orissa', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (27, N'Puducherry', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (28, N'Punjab', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (29, N'Rajasthan', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (30, N'Sikkim', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (31, N'Tamil Nadu', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (32, N'Telangana', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (33, N'Tripura', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (34, N'Uttar Pradesh', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (35, N'Uttarakhand', 97, N'A')
INSERT [dbo].[States] ([StateID], [State], [CountryID], [RecStatus]) VALUES (36, N'West Bengal', 97, N'A')
SET IDENTITY_INSERT [dbo].[States] OFF
GO
SET IDENTITY_INSERT [dbo].[UserDetails] ON 

INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (1, 1, N'', 0, N'', N'', N' ', N'', N'', N'', N'', N'', N'', NULL, NULL, N'', N'', N'', 120, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (9, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (11, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (13, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (14, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (15, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (16, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (17, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (18, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (19, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (20, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (21, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (22, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (23, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (24, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (25, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (26, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (27, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (28, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (29, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (30, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.843' AS DateTime), CAST(N'2022-01-21T01:53:31.843' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (31, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (32, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (33, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (34, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (35, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (36, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (37, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (38, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (39, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (40, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (41, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (42, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (43, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (44, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (45, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (46, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (47, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (48, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (49, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (50, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (51, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (52, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (53, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (54, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (55, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (56, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (57, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (58, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (59, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (60, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (61, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (62, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (63, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'M.Karunanidhi.jpg', NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (64, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (65, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (66, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (67, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (68, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (69, 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (70, 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (71, 71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (72, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (73, 73, N'', 0, N'', N'', N' ', N'profile.php?id=100006624606464', N'', N'', N'', N'', N'', NULL, NULL, N'', N'', N'', 120, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (74, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (75, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (76, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (77, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (78, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (79, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (80, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (81, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (82, 82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (83, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (84, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (85, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (86, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (87, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (88, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (89, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (90, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (91, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (92, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (93, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (94, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (95, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (96, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (97, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (98, 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (99, 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
GO
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (100, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (101, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (102, 102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (103, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (104, 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (105, 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (106, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (107, 107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.860' AS DateTime), CAST(N'2022-01-21T01:53:31.860' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (109, 109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (110, 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (111, 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (112, 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (113, 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (114, 114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (115, 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (116, 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (117, 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (118, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (119, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (120, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (121, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (122, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (123, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (124, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (125, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (126, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (127, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (128, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (129, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (130, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (131, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (132, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (133, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (134, 134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (135, 135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (136, 136, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (137, 137, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (138, 138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (139, 139, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (140, 140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (141, 141, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (142, 142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (143, 143, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (144, 144, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (145, 145, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (146, 146, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (147, 147, N'', 0, N'', N'', N' ', N'ma.tholkappiyan', N'', N'', N'', N'', N'', CAST(N'1971-09-19' AS Date), NULL, N'', N'', N'', 211, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (148, 148, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (149, 149, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2022-01-21T01:53:31.873' AS DateTime), CAST(N'2022-01-21T01:53:31.873' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (150, 150, N'', 0, N'', N'shajiwriter', N'B', N'shaji.chen.1', N'', NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', 120, 0, 0, CAST(N'2022-05-16T21:21:43.787' AS DateTime), CAST(N'2022-05-16T21:21:43.787' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (151, 151, N'', 0, N'', N'', N' ', N'', N'', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-12-24' AS Date), N'', N'', N'', 192, 0, 0, CAST(N'2022-08-20T08:46:22.503' AS DateTime), CAST(N'2022-08-20T08:46:22.503' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (152, 152, N'', 0, N'', N'', N' ', N'azhagappan.rasi', N'rasiazhagappan', NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', 120, 0, 0, CAST(N'2022-08-20T08:54:16.003' AS DateTime), CAST(N'2022-08-20T08:54:16.003' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (153, 153, N'', 0, N'', N'', N' ', N'profile.php?id=100068669241275', N'', NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', 120, 0, 0, CAST(N'2022-08-20T09:26:04.077' AS DateTime), CAST(N'2022-08-20T09:26:04.077' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (154, 154, N'', 0, N'', N'', N' ', N'pozhilantamizh', N'', NULL, NULL, NULL, NULL, NULL, CAST(N'1961-08-23' AS Date), N'', N'', N'', 120, 0, 0, CAST(N'2022-08-20T21:16:30.107' AS DateTime), CAST(N'2022-08-20T21:16:30.107' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (155, 155, N'', 0, N'', N'', N' ', N'thangamurugesan.murugesan.33', N'', NULL, NULL, NULL, NULL, CAST(N'1961-12-13' AS Date), NULL, N'', N'', N'', 109, 0, 0, CAST(N'2022-08-20T21:45:20.663' AS DateTime), CAST(N'2022-08-20T21:45:20.663' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (156, 156, N'', 0, N'', N'', N' ', N's.sasi.slm', N'', NULL, NULL, NULL, NULL, CAST(N'1979-05-13' AS Date), CAST(N'2021-05-18' AS Date), N'', N'', N'', 120, 0, 0, CAST(N'2022-08-20T23:05:01.420' AS DateTime), CAST(N'2022-08-20T23:05:01.420' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (157, 157, N'', 0, N'', N'', N' ', N'sasithra.dhamodaran', N'', NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', 96, 0, 0, CAST(N'2022-08-21T07:59:20.490' AS DateTime), CAST(N'2022-08-21T07:59:20.490' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (158, 158, N'', 0, N'', N'', N' ', N'manaanatpu', N'', NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', 120, 0, 0, CAST(N'2022-08-21T08:07:01.990' AS DateTime), CAST(N'2022-08-21T08:07:01.990' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (159, 159, N'', 2, N'kesavans.com', N'', N' ', N'kokesavantrust', N'', NULL, NULL, NULL, NULL, CAST(N'1946-10-05' AS Date), CAST(N'1998-09-16' AS Date), N'', N'', N'Ko. Kesavan Arakattalai, G603 Purva Swanlake apartments, OMR, Kelambakkam, Chennai 603 103', 120, 0, 0, CAST(N'2022-08-21T08:40:05.230' AS DateTime), CAST(N'2022-08-21T08:40:05.230' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (160, 160, N'', 0, N'', N'', N' ', N'andanoor.sura', N'', NULL, NULL, NULL, NULL, CAST(N'1983-05-29' AS Date), NULL, N'', N'', N'', 120, 0, 0, CAST(N'2022-08-21T09:03:21.930' AS DateTime), CAST(N'2022-08-21T09:03:21.930' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (161, 161, N'', 0, N'', N'', N' ', N'suriya.doss', N'', NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', 131, 0, 0, CAST(N'2022-08-21T21:09:42.357' AS DateTime), CAST(N'2022-08-21T21:09:42.357' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (162, 162, N'', 0, N'', N'', N' ', N'marx.anthonisamy', N'', NULL, NULL, NULL, NULL, CAST(N'1949-10-04' AS Date), NULL, N'', N'', N'', 124, 0, 0, CAST(N'2022-08-21T21:47:42.780' AS DateTime), CAST(N'2022-08-21T21:47:42.780' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (163, 163, N'', 1, N'marabinmaindan.com', N'', N' ', N'muthaiah.marudhavaanan', N'', NULL, NULL, NULL, NULL, CAST(N'1968-08-01' AS Date), NULL, N'', N'', N'', 96, 0, 0, CAST(N'2022-08-21T22:07:11.180' AS DateTime), CAST(N'2022-08-21T22:07:11.180' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (164, 164, N'', 0, N'', N'', N' ', N'kovan.kalai.39', N'', NULL, NULL, NULL, NULL, CAST(N'1982-07-08' AS Date), NULL, N'', N'', N'', 41, 0, 0, CAST(N'2022-08-21T22:26:37.767' AS DateTime), CAST(N'2022-08-21T22:26:37.767' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (165, 165, N'', 0, N'', N'', N' ', N'devibharathi.n', N'', NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', 143, 0, 0, CAST(N'2022-08-21T22:41:36.087' AS DateTime), CAST(N'2022-08-21T22:41:36.087' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (166, 166, N'', 0, N'', N'', N' ', N'profile.php?id=100005391195676', N'', N'', N'', N'', N'', NULL, NULL, N'', N'', N'', 96, 0, 0, CAST(N'2022-08-21T23:04:54.610' AS DateTime), CAST(N'2022-08-21T23:04:54.610' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (167, 167, N'', 0, N'', N'', N' ', N'thanappan.kathir', N'', NULL, NULL, NULL, NULL, CAST(N'1972-06-07' AS Date), NULL, N'', N'', N'', 140, 0, 0, CAST(N'2022-08-22T05:06:54.240' AS DateTime), CAST(N'2022-08-22T05:06:54.240' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (168, 168, N'', 2, N'nanjilnadan.com', N'', N' ', N'', N'', NULL, NULL, NULL, NULL, CAST(N'1947-12-31' AS Date), NULL, N'', N'', N'வீரநாராயணமங்கலம் தாழக்குடி அஞ்சல், தோவாளை வட்டம், கன்னியாகுமரி மாவட்டம். தமிழ் நாடு – 629 901.', 65, 0, 0, CAST(N'2022-08-22T05:31:06.677' AS DateTime), CAST(N'2022-08-22T05:31:06.677' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (169, 169, N'', 0, N'', N'', N' ', N'profile.php?id=100052443347670', N'', NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', 120, 0, 0, CAST(N'2022-08-22T06:25:22.077' AS DateTime), CAST(N'2022-08-22T06:25:22.077' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (170, 170, N'', 0, N'', N'', N' ', N'profile.php?id=100052588965996', N'', NULL, NULL, NULL, NULL, CAST(N'1970-05-29' AS Date), NULL, N'', N'', N'', 120, 0, 0, CAST(N'2022-08-22T07:07:07.290' AS DateTime), CAST(N'2022-08-22T07:07:07.290' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (171, 171, N'', 0, N'', N'', N' ', N'ashok.thamizhan', N'', NULL, NULL, NULL, NULL, CAST(N'1986-01-22' AS Date), NULL, N'', N'', N'', 113, 0, 0, CAST(N'2022-08-22T07:31:35.290' AS DateTime), CAST(N'2022-08-22T07:31:35.290' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (172, 172, N'', 0, N'', N'appanasamy', N'B', N'appsmoo', N'', NULL, NULL, NULL, NULL, CAST(N'1961-05-27' AS Date), NULL, N'', N'', N'', 97, 0, 0, CAST(N'2022-08-22T07:47:36.763' AS DateTime), CAST(N'2022-08-22T07:47:36.763' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (173, 173, N'', 0, N'', N'', N' ', N'', N'', NULL, NULL, NULL, NULL, CAST(N'1949-06-06' AS Date), NULL, N'', N'', N'', 246, 0, 0, CAST(N'2022-08-23T21:58:47.040' AS DateTime), CAST(N'2022-08-23T21:58:47.040' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (174, 174, N'', 0, N'', N'', N' ', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', 120, 0, 0, CAST(N'2022-08-24T05:06:06.957' AS DateTime), CAST(N'2022-08-24T05:06:06.957' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (175, 175, N'', 0, N'', N'', N' ', N'thamiza.mallan', N'', NULL, NULL, NULL, NULL, CAST(N'1949-07-01' AS Date), NULL, N'', N'', N'', 13, 0, 0, CAST(N'2022-09-01T20:11:36.933' AS DateTime), CAST(N'2022-09-01T20:11:36.933' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (176, 176, N'', 0, N'', N'', N' ', N'profile.php?id=100013489818854', N'', NULL, NULL, NULL, NULL, CAST(N'1964-03-30' AS Date), NULL, N'', N'', N'', 168, 0, 0, CAST(N'2022-09-03T05:27:27.283' AS DateTime), CAST(N'2022-09-03T05:27:27.283' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (177, 177, N'', 0, N'', N'', N' ', N'savithri.kannan.7', N'', NULL, NULL, NULL, NULL, CAST(N'1965-06-14' AS Date), NULL, N'', N'', N'', 214, 0, 0, CAST(N'2022-09-03T06:11:20.760' AS DateTime), CAST(N'2022-09-03T06:11:20.760' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (178, 178, N'', 0, N'', N'', N' ', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', 120, 0, 0, CAST(N'2022-10-21T10:16:14.020' AS DateTime), CAST(N'2022-10-21T10:16:14.020' AS DateTime), N'A')
INSERT [dbo].[UserDetails] ([UserDetailID], [UserID], [Profile], [Protocol], [Website], [Blog], [BlogType], [FaceBook], [Twitter], [Pinterest], [YouTube], [Instagram], [Wikipedia], [DOB], [DOD], [ImgProfile], [ImgComments], [Address], [CityID], [IsShownInMenu], [IsMailSubscription], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (179, 179, N'', 0, N'', N'', N' ', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', 120, 0, 0, CAST(N'2022-10-21T10:18:58.327' AS DateTime), CAST(N'2022-10-21T10:18:58.327' AS DateTime), N'A')
SET IDENTITY_INSERT [dbo].[UserDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (1, NULL, N'கற்க', N'Karka', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 9, 6, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (2, N'', N'கற்க தமிழா', N'Karka Thamizha', N'ameed@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 8, 6, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (3, N'', N'-', N'-', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (4, N'', N'தொல்காப்பியர்', N'Tholkappiyar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (5, N'', N'திருவள்ளூவர்', N'Thiruvalluvar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (6, N'', N'இறையனார்', N'Iraiyanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (7, N'', N'நக்கீரனார்', N'Nakkiranar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 2, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (8, N'', N'ஐயனாரிதனார்', N'Aiyanaridanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (9, N'', N'அமிர்தசாகரனார்', N'Amirthasagaranar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (10, N'', N'புத்தமித்திரர்', N'Buddamithirar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (11, N'', N'தண்டி', N'Dandi', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (12, N'', N'குணவீரபண்டிதர்', N'Gunaveerapandithar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (13, N'', N'நாற்கவிராசநம்பி', N'Naarkaviraasanampi', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (14, N'', N'பவணந்தி முனிவர்', N'Pavananthi Munivar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (15, N'', N'திருக்குருகைப் பெருமாள் கவிராயர்', N'Thirukkurugaip Perumal Kaviraayar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (16, N'', N'வைத்தியநாத தேசிகர்', N'Vaidyanatha Desigar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (17, N'', N'சுவாமிநாத தேசிகர்', N'Swaminatha Desikar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (18, N'', N'சுவாமிக் கவிராயர்', N'Samy Kaviyarasar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (19, N'', N'வீரமாமுனிவர்', N'Veeramamunivar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 24, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (20, N'', N'சூ. இன்னாசி', N'Soo.Innasi', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 3, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (21, N'', N'பி.ஆர்.அப்பாய் செட்டியார்', N'P.R.Appai Chettiar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 3, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (22, N'', N'தண்டபாணி சுவாமி', N'Dhandapani swamy', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (23, N'', N'முத்துவீர உபாத்தியாயர்', N'Muthuveera Upathiyayar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (24, N'', N'நவநீதநாடான்', N'Navaneethanadaan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (25, N'', N'சங்ககாலப் புலவர்கள்', N'Sangakalap Pulavarkal', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (26, N'', N'விளம்பி நாகனார்', N'Vilambi Naganaar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (27, N'', N'கபிலர்', N'Kapilar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (28, N'', N'பூதஞ்சேந்தனார்', N'Putancentanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (29, N'', N'மதுரைக் கண்ணன் கூத்தனார்', N'Maturaik Kannan Kuttanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (30, N'', N'பொய்கையார்', N'Poikaiyar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (31, N'', N'மாறன் பொறையனார்', N'Maran Poraiyanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (32, N'', N'கண்ணன் சேந்தனார்', N'Kannan Centanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (33, N'', N'மூவாதியார்', N'Muvatiyar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (34, N'', N'கணிமேதாவியார்', N'Kanimetaviyar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (35, N'', N'நல்லாதனார்', N'Nallatanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (36, N'', N'பெருவாயில் முள்ளியார்', N'Peruvayil Mulliyar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (37, N'', N'முன்றுரை அரையனார்', N'Munrurai Araiyanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (38, N'', N'காரியாசான்', N'Kariyasan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.850' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (39, N'', N'கூடலூர்க் கிழார்', N'Kutalurk Kilar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (40, N'', N'புல்லங்காடனார்', N'Pullankatanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (41, N'', N'நக்கீரர்', N'Nakkirar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (42, N'', N'முடத்தாமக் கண்ணியார்', N'Mutattamak Kanniyar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (43, N'', N'நல்லூர் நத்தத்தனார்', N'Nallur Nattattanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (44, N'', N'கடியலூர் உருத்திரங் கண்ணனார்', N'Katiyalur Uruttiran Kannanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (45, N'', N'நப்பூதனார்', N'Napputanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (46, N'', N'மாங்குடி மருதனார்', N'Mankudi Marutanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (47, N'', N'பெருங்கெளசிகனார்', N'Perunkelacikanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (48, N'', N'இளங்கோவடிகள்', N'Ilango Adigal', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (49, N'', N'மதுரை கூலவாணிகன் சீத்தலைச் சாத்தனார்', N'Chithalai Chathanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (50, N'', N'திருத்தக்க தேவர்', N'Tiruttakka devar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (51, N'', N'நாதகுத்தனார்', N'Nadakuttanar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (52, N'', N'தோலாமொழித் தேவர்', N'Tolamozhith Devar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (53, N'', N'ஒளவையார்', N'Avvaiyar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (54, N'', N'சேக்கிழார்', N'Sekkizhar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (55, N'இ.', N'சாகுல் அமீது', N'sahul hameed', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 8, 6, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (56, N'சா.', N'கல்வத் ஹபீபா', N'S.Kalvath Habeeba', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 10, 6, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (57, N'சா.', N'ஆப்ரீன்', N'S.Aafreen', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 26, 6, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (58, N'சா.', N'முஹம்மது ஆதில்', N'Mohamed aadhil', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 26, 6, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (59, N'சா.', N'குட்டி பையா', N'kutty paiya', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 26, 6, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (60, N'கா.', N'பரக்கத் நிஷா', N'Barakth Nisha', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 10, 6, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (61, N'', N'தந்தை பெரியார்', N'Thanthai Periyar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (62, N'', N'அண்ணா', N'C.N.anna', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 1, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (63, N'மு.', N'கருணாநிதி', N'M.Karunanidhi', N'admin@kalaignarkarunanidhi.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 1, 1, 7, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (64, N'', N'பாரதிதாசன்', N'Bharathidasan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (65, N'கி.', N'வீரமணி', N'K.Veeramani', N'info@periyar.org', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 21, 1, 1, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (66, N'', N'பாரதியார்', N'Bharatiyar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (67, N'', N'கல்கி', N'Kalki', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (68, N'', N'சாண்டில்யன்', N'Sandilyan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (69, N'', N'மனுஷ்ய புத்திரன்', N'Manushya Puthiran', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (70, N'', N'எஸ்.ராமகிருஷ்ணன்', N'S.Ramakrishnan', N'writerramki@gmail.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (71, N'', N'ஜெயமோகன்', N'Jeyamohan', N'jeyamohan.writerpoet@gmail.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (72, N'', N'மறைமலை அடிகள்', N'Maraimalai Adigal', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 14, 1, 26, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (73, N'அ.', N'வெண்ணிலா', N'A.Vennila', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 3, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (74, N'', N'கபிலன்', N'Kabilan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (75, N'', N'அகர முதல்வன்', N'Akara Muthalvan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (76, N'', N'மருதன்', N'Marudhan', N'marudhan@gmail.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (77, N'', N'சிவமணி', N'Sivamani', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (78, N'', N'சாரதி', N'Sarathi', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (79, N'', N'கதிர்நம்பி', N'Kathirnambi', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (80, N'ப‌.', N'நடராஜன் பாரதிதாஸ்', N'Natarajan Bharathidas', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (81, N'', N'கம்பர்', N'Kambar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 11, 1, 8, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (82, N'சி.', N'மோகன்', N'C.Mohan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (83, N'', N'இளங்கோ கிருஷ்ணன்', N'Ilanko', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (84, N'ச.', N'பாலமுருகன்', N'Balamurugan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 28, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (85, N'', N'அன்றிலன்', N'Andrilan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (86, N'எஸ்.', N'சண்முகம்', N'S.Shanmugam', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (87, N'', N'சந்திரா தங்கராஜ்', N'Chandra Thangaraj', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (88, N'இரா.', N'கவியரசு', N'R.Kaviyarasu', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (89, N'', N'அழகுபாண்டி அரசப்பன்', N'Azhagupandi Arasappan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (90, N'', N'கரிச்சான் குஞ்சு', N'Karichan Kunju', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (91, N'எம்.வி.', N'வெங்கட்ராம்', N'M.V.Venkatram', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (92, N'', N'வளவ துரையன்', N'Valavaduraiyan', N'valavaduraiyan@gmail.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'9367631228', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (93, N'', N'சிற்பி பாலசுப்பிரமணியம்', N'Sirpi Balasubramaniam', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, 9, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (94, N'', N'ப்ரியா பாஸ்கரன்', N'Priya Baskaran', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (95, N'', N'உமா மோகன்', N'Uma Mohan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (96, N'சுப.', N'வீரபாண்டியன்', N'Suba.Veerapandian', N'subaveerapandian@gmail.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (97, N'', N'பிரான்சிஸ் கிருபா', N'Francis Kiruba', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (98, N'', N'பானு இக்பால்', N'Banu Iqbal', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (99, N'', N'யாழினிஸ்ரீ', N'Yazhini Sri', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
GO
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (100, N'மா.', N'சுப்பிரமணியம்', N'Ma. Subramanian', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 1, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (101, N'எஸ்.', N'மஹ்மூது நெய்னா', N'Mahmood Naina', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (102, N'க.', N'சுபாஷிணி', N'Subashini', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (103, N'', N'அல்லி பாத்திமா', N'K.Alli Fathima', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (104, N'K.V.S.', N'ஹபீப் முஹம்மது', N'Dr KVS Habeebmuhammad', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (105, N'செ.', N'திவான்', N'S.Divan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 4, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (106, N'', N'உமையவன்', N'Umayavan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (107, N'வி.', N'விக்ரம் குமார்', N'Vikram Kumar', N'drvikramkumar86@gmail.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 26, 1, NULL, CAST(N'2022-01-15T23:30:40.867' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (109, N'பா.', N'திருமாவேலன்', N'Pa.Thirumavelan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (110, N'க.சி.', N'பழனிக்குமார்', N'Palanikumar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (111, N'', N'அருணந்தி சிவம்', N'Arunanthi Sivam', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'9894182212', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (112, N'', N'எழில் பாரதி', N'Ezhil Bharathi', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (113, N'', N'அருண்பாண்டியன் மனோகரன்', N'Arunpandian Manoharan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 16, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (114, N'வரத.', N'இராஜமாணிக்கம்', N'Varatha.Rajamanickam', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (115, N'', N'பூர்ணா', N'Poorna Yesydoss', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (116, N'', N'அமுதன் துரையரசன்', N'Amudhan Duraiarasan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (117, N'', N'ரவிச்சந்திரன் அரவிந்தன்', N'Ravichandran Aravindhan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (118, N'', N'ஜோ மல்லூரி', N'Joe Malloori', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'9952511200', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (119, N'', N'வேல்முருகன்', N'Velmurugan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (120, N'', N'ஹரீஷ் பிரபாகரன்', N'Harish Prabhakaran', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (121, N'', N'ஆரூர் தமிழ்நாடன்', N'Arur Tamilnadan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 22, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (122, N'', N'சென்னிமலை தண்டபாணி', N'Chennimalai Dhandapani', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (123, N'', N'நரன்', N'Naran', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (124, N'', N'ராணிதிலக்', N'Raanithilak', N'raanithilak@gmail.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 3, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (125, N'ஜி.எஸ்.', N'தயாளன்', N'G.S.Dhayalan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (126, N'', N'சஹானா', N'Sahana', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (127, N'சூ.ம.', N'ஜெயசீலன்', N'S.M.Jayaseelan', N'sumajeyaseelan@gmail.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (128, N'என்.டி.', N'ராஜ்குமார்', N'N.D.Rajkumar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (129, N'', N'நாகலட்சுமி சண்முகம்', N'Nagalakshmi Shanmugam', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 7, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (130, N'', N'பிரவீண் பஃறுளி', N'Praveen Pagruli', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (131, N'', N'சுபா செந்தில்குமார்', N'Subha Senthilkumar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (132, N'', N'வசுமித்ர', N'Vasumithra', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (133, N'', N'ஸ்டாலின் ராஜாங்கம்', N'Stalin Rajangam', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (134, N'', N'பாரதிப்பிரியன்', N'Bharathipriyan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (135, N'', N'வினையன்', N'Vinaiyan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (136, N'ந.', N'முருகேசபாண்டியன்', N'N.Murugesa Pandian', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (137, N'', N'யுவ கிருஷ்ணா', N'Yuvakrishna', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 6, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (138, N'', N'பெருமாள் முருகன்', N'Perumal Murugan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 3, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (139, N'', N'சிவபாலன் இளங்கோவன்', N'Sivabalan Elangovan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 26, 1, NULL, CAST(N'2022-01-15T23:30:40.880' AS DateTime), CAST(N'2022-01-15' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (140, NULL, N'இன்பா', N'Inbha', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-01-20T10:43:26.877' AS DateTime), CAST(N'2022-01-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (141, NULL, N'மஞ்சுளா', N'Manjula', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 3, 1, NULL, CAST(N'2022-01-20T10:43:51.093' AS DateTime), CAST(N'2022-01-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (142, N'ஆழி.', N'செந்தில்நாதன்', N'Aazhi Senthilnathan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-01-20T10:44:17.250' AS DateTime), CAST(N'2022-01-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (143, NULL, N'சுப்ரபாரதிமணியன்', N'Subrabharathimanian', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-01-20T10:44:52.113' AS DateTime), CAST(N'2022-01-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (144, N'க.', N'ஜெய்சங்கர்', N'K.Jaisankar', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-01-20T10:45:18.413' AS DateTime), CAST(N'2022-01-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (145, NULL, N'மழவை.தமிழமுதன்', N'Thamizhan Amuthan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-01-20T10:45:48.637' AS DateTime), CAST(N'2022-01-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (146, N'நா.', N'காமராசன்', N'Kamarasan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-01-20T10:46:21.437' AS DateTime), CAST(N'2022-01-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (147, N'ம.', N'தொல்காப்பியன்', N'Ma.Tholkappiyan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-01-20T10:46:47.380' AS DateTime), CAST(N'2022-01-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (148, NULL, N'மதன்.எஸ்.ராஜா', N'Mathan S. Raja', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-01-20T10:47:08.527' AS DateTime), CAST(N'2022-01-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (149, NULL, N'ராஜகம்பீரன் அப்பாஸ்', N'Rajakambeeran Abbas', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-01-20T10:47:35.180' AS DateTime), CAST(N'2022-01-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (150, NULL, N'ஷாஜி', N'Shaji', N'shaajichennai@gmail.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 6, NULL, CAST(N'2022-05-16T21:21:43.757' AS DateTime), CAST(N'2022-05-16' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (151, N'தொ.', N'பரமசிவன்', N'Tho.Paramasivan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 3, 1, 52, CAST(N'2022-08-20T08:46:22.470' AS DateTime), CAST(N'2022-08-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (152, NULL, N'ராசி அழகப்பன்', N'Rasi Azhagappan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-20T08:54:15.987' AS DateTime), CAST(N'2022-08-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (153, NULL, N'சித்தார்த்தன் பாரதி', N'Siddharthan Bharathi', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-20T09:26:04.030' AS DateTime), CAST(N'2022-08-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (154, NULL, N'பொழிலன்', N'Pozhilan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-20T21:16:30.077' AS DateTime), CAST(N'2022-08-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (155, NULL, N'தங்க.முருகேசன்', N'Thanga Murugesan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-20T21:45:20.633' AS DateTime), CAST(N'2022-08-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (156, NULL, N'சசி', N'Sasi', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-20T23:05:01.357' AS DateTime), CAST(N'2022-08-20' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (157, NULL, N'சசித்ரா தாமோதரன்', N'Sasithra Dhamodaran', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 27, 1, 24, CAST(N'2022-08-21T07:59:20.460' AS DateTime), CAST(N'2022-08-21' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (158, NULL, N'மணா', N'Manaa', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 24, 1, NULL, CAST(N'2022-08-21T08:07:01.973' AS DateTime), CAST(N'2022-08-21' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (159, N'கோ.', N'கேசவன்', N'Ko. Kesavan', N'contact@kesavans.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8925706664', 7, 1, NULL, CAST(N'2022-08-21T08:40:05.217' AS DateTime), CAST(N'2022-08-21' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (160, NULL, N'அன்டனூர் சுரா', N'Andanoor Sura', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-21T09:03:21.883' AS DateTime), CAST(N'2022-08-21' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (161, NULL, N'சூரியதாஸ்', N'Suriyadoss', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-21T21:09:42.323' AS DateTime), CAST(N'2022-08-21' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (162, N'அ.', N'மார்க்ஸ்', N'A.Marx', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-21T21:47:42.733' AS DateTime), CAST(N'2022-08-21' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (163, NULL, N'மரபின் மைந்தன் முத்தையா', N'Marabin Maindan Muthaiah', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'9865189966', 7, 1, NULL, CAST(N'2022-08-21T22:07:11.133' AS DateTime), CAST(N'2022-08-21' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (164, NULL, N'கலைக்கோவன்', N'Kalai Kovan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-21T22:26:37.720' AS DateTime), CAST(N'2022-08-21' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (165, NULL, N'தேவிபாரதி', N'Devibharathi', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-21T22:41:36.053' AS DateTime), CAST(N'2022-08-21' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (166, N'மீ.', N'உமா மகேஸ்வரி', N'Uma Maheswari', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-21T23:04:54.580' AS DateTime), CAST(N'2022-08-21' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (167, NULL, N'தாணப்பன் கதிர்', N'Thanappan Kathir', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-22T05:06:54.210' AS DateTime), CAST(N'2022-08-22' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (168, NULL, N'நாஞ்சில் நாடன்', N'Nanjil Nadan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'9443057024', 7, 1, NULL, CAST(N'2022-08-22T05:31:06.660' AS DateTime), CAST(N'2022-08-22' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (169, NULL, N'சுபி', N'Subi', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-22T06:25:22.047' AS DateTime), CAST(N'2022-08-22' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (170, NULL, N'வீரமணி', N'Veeramani', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-22T07:07:07.260' AS DateTime), CAST(N'2022-08-22' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (171, N'அ.', N'அசோக்', N'A.Ashok', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 31, 1, NULL, CAST(N'2022-08-22T07:31:35.277' AS DateTime), CAST(N'2022-08-22' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (172, N'மூ.', N'அப்பணசாமி', N'Appanasamy', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-22T07:47:36.733' AS DateTime), CAST(N'2022-08-22' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (173, N'ஜி.', N'ராமகிருஷ்ணன்', N'G. Ramakrishnan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 1, 1, NULL, CAST(N'2022-08-23T21:58:47.010' AS DateTime), CAST(N'2022-08-23' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (174, N'க.', N'முருகேசன்', N'Murugesan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-08-24T05:06:06.927' AS DateTime), CAST(N'2022-08-24' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (175, N'க.', N'தமிழமல்லன்', N'Thamizamallan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, 52, CAST(N'2022-09-01T20:11:36.900' AS DateTime), CAST(N'2022-09-01' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (176, NULL, N'நக்கீரன்', N'Nakkeeran', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-09-03T05:27:27.207' AS DateTime), CAST(N'2022-09-03' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (177, NULL, N'சாவித்திரி கண்ணன்', N'Savithri Kannan', N'support@karkathamizha.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 24, 1, NULL, CAST(N'2022-09-03T06:11:20.730' AS DateTime), CAST(N'2022-09-03' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (178, NULL, N'Naga', N'Naga', N'naga@gmail.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 9, 6, NULL, CAST(N'2022-10-21T10:16:13.967' AS DateTime), CAST(N'2022-10-21' AS Date), NULL, N'A')
INSERT [dbo].[Users] ([UserID], [Initial], [UserName], [Name], [MailID], [Password], [Mobile], [ProfessionID], [UserTypeID], [SpecialNameID], [LastActivity], [CreatedDate], [ModifiedDate], [RecStatus]) VALUES (179, NULL, N'மணி', N'Mani', N'mani@gmail.com', N'TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=', N'8189989911', 7, 1, NULL, CAST(N'2022-10-21T10:18:58.260' AS DateTime), CAST(N'2022-10-21' AS Date), NULL, N'A')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([UserTypeID], [Name], [UserType], [ShortCode], [RecStatus]) VALUES (1, N'ஆசிரியர்', N'Author', N'A', N'A')
INSERT [dbo].[UserTypes] ([UserTypeID], [Name], [UserType], [ShortCode], [RecStatus]) VALUES (2, N'உரையாசிரியர்', N'Text Writer', N'W', N'A')
INSERT [dbo].[UserTypes] ([UserTypeID], [Name], [UserType], [ShortCode], [RecStatus]) VALUES (3, N'தொகுப்பாசிரியர்', N'Collector', N'C', N'A')
INSERT [dbo].[UserTypes] ([UserTypeID], [Name], [UserType], [ShortCode], [RecStatus]) VALUES (4, N'பதிப்பகத்தார்', N'Publisher', N'P', N'A')
INSERT [dbo].[UserTypes] ([UserTypeID], [Name], [UserType], [ShortCode], [RecStatus]) VALUES (5, N'பதிப்பாசிரியர்', N'Editor', N'E', N'A')
INSERT [dbo].[UserTypes] ([UserTypeID], [Name], [UserType], [ShortCode], [RecStatus]) VALUES (6, N'பயனர்', N'User', N'U', N'A')
INSERT [dbo].[UserTypes] ([UserTypeID], [Name], [UserType], [ShortCode], [RecStatus]) VALUES (7, N'மொழிபெயர்ப்பாளர்', N'Translator', N'T', N'A')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
GO
ALTER TABLE [dbo].[AdminUser] ADD  DEFAULT (getdate()) FOR [LastActivity]
GO
ALTER TABLE [dbo].[AdminUser] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AuthorSeries] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[BookFormat] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[BooksDetails] ADD  DEFAULT ('FALSE') FOR [IsKarkaBook]
GO
ALTER TABLE [dbo].[BooksDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BooksDetails] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[BooksLink] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[BooksReview] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BooksReview] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[CacheName] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((0)) FOR [IsShownInMenu]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[City] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[Country] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[Profession] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[Projects] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[SeriesType] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[SpecialName] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[States] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[ToDoList] ADD  DEFAULT (getdate()) FOR [EndDate]
GO
ALTER TABLE [dbo].[ToDoList] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[UserDetails] ADD  DEFAULT ((0)) FOR [IsShownInMenu]
GO
ALTER TABLE [dbo].[UserDetails] ADD  DEFAULT ((0)) FOR [IsMailSubscription]
GO
ALTER TABLE [dbo].[UserDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserDetails] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[UserDetails] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[UserReference] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserReference] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [LastActivity]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[UserTypes] ADD  DEFAULT ('A') FOR [RecStatus]
GO
ALTER TABLE [dbo].[AuthorSeries]  WITH CHECK ADD FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[AuthorSeries]  WITH CHECK ADD FOREIGN KEY([SeriesTypeID])
REFERENCES [dbo].[SeriesType] ([SeriesTypeID])
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypes] ([UserTypeID])
GO
ALTER TABLE [dbo].[BookCategory]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[BookCategory]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([AdminUserID])
REFERENCES [dbo].[AdminUser] ([AdminUserID])
GO
ALTER TABLE [dbo].[BooksDetails]  WITH CHECK ADD FOREIGN KEY([BookFormat])
REFERENCES [dbo].[BookFormat] ([BookFormatID])
GO
ALTER TABLE [dbo].[BooksDetails]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[BooksDetails]  WITH CHECK ADD FOREIGN KEY([EnteredBy])
REFERENCES [dbo].[AdminUser] ([AdminUserID])
GO
ALTER TABLE [dbo].[BooksLink]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[BooksLink]  WITH CHECK ADD FOREIGN KEY([LinkBook])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[BooksReview]  WITH CHECK ADD FOREIGN KEY([BookDetailsID])
REFERENCES [dbo].[BooksDetails] ([BookDetailsID])
GO
ALTER TABLE [dbo].[BooksReview]  WITH CHECK ADD FOREIGN KEY([EnteredBy])
REFERENCES [dbo].[AdminUser] ([AdminUserID])
GO
ALTER TABLE [dbo].[BooksReview]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([StateID])
REFERENCES [dbo].[States] ([StateID])
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserReference]  WITH CHECK ADD FOREIGN KEY([EnteredBy])
REFERENCES [dbo].[AdminUser] ([AdminUserID])
GO
ALTER TABLE [dbo].[UserReference]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([ProfessionID])
REFERENCES [dbo].[Profession] ([ProfessionID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([SpecialNameID])
REFERENCES [dbo].[SpecialName] ([SpecialNameID])
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypes] ([UserTypeID])
GO
/****** Object:  StoredProcedure [dbo].[USP_AddAuthorSeries]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[USP_AddAuthorSeries]      
(  
 @AuthorSeriesID INT ,   
 @Header NVARCHAR(50) ,    
 @AuthorID  INT    ,    
 @MagazineID SMALLINT  ,    
 @WeekDaysID TINYINT = NULL,    
 @SeriesTypeID TINYINT   ,    
 @StartDate  DATE   = NULL,  
 @EndDate  DATE   = NULL,
 @Result  VARCHAR(10)  Output      
 )  
as      
      
BEGIN      
      
SET NOCOUNT ON      
    
Insert into dbo.AuthorSeries(Header,AuthorID,MagazineID,WeekDaysID,SeriesTypeID,StartDate)    
 values(@Header,@AuthorID,@MagazineID,@WeekDaysID,@SeriesTypeID,@StartDate)    
    
 set @Result = 'Success'   
      
END 
GO
/****** Object:  StoredProcedure [dbo].[USP_AddBooks]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_AddBooks]  --N'உணவு மழைத்தீவு','' ,'Food rain','U?avu ma?aitteevu',1,''      
(                 
@Book nvarchar(200),          
@Name varchar(60),          
@Tanglish varchar(60) ,        
@BookDescription nvarchar(1500),              
@AdminID tinyint,      
@RecStatus char(1),      
@Result int Output      
)                       
      
AS                            
BEGIN                            
 --SET NOCOUNT ON               
 --Declare @Return varchar(30)            
 IF NOT EXISTS(SELECT Book              
             FROM Books              
             WHERE Book = @Book)              
     BEGIN              
       INSERT INTO Books(Book,Name,Tanglish,BookDescription,AdminUserID,RecStatus)values                  
        (@Book,@Name,@Tanglish,@BookDescription,@AdminID,@RecStatus)         
       set @Result = scope_Identity()           
        return @Result      
     END              
    ELSE              
    BEGIN              
      set @Result=-2            
     return @Result      
      
    END                 
      
END       
      
      
      
GO
/****** Object:  StoredProcedure [dbo].[USP_AddBooksAuthor]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[USP_AddBooksAuthor]  
(  
 @Authors AS dbo.UDT_Author READONLY  
)  
 AS  
 BEGIN  
  
 SET NOCOUNT ON  
  
  delete from BookAuthor where BookID in(SELECT  BookID FROM @Authors)  
  
  INSERT INTO dbo.BookAuthor(AuthorID,UserTypeID,BookID)  
  
      SELECT  AuthorID,UserTypeID,BookID FROM @Authors  
  
END  
 
GO
/****** Object:  StoredProcedure [dbo].[USP_AddBooksCategory]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_AddBooksCategory]    
(    
 @Categories AS dbo.UDT_BookCategory READONLY    
)    
AS    
BEGIN    
 SET NOCOUNT ON;    
  BEGIN TRY    
   delete from BookCategory where BookID =(SELECT distinct BookID FROM @Categories)  
  
   INSERT INTO BookCategory(BookID,CategoryID)SELECT BookID,CategoryID FROM @Categories    
   --RAISERROR (@ErrorMsg, @ErrorSeverity, @ErrorState)  
  END TRY    
  BEGIN CATCH    
   EXEC dbo.USP_GetErrorInfo    
  END CATCH    
END   
  
  
GO
/****** Object:  StoredProcedure [dbo].[USP_AddBooksDetails]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_AddBooksDetails](        
@BookDetailsID int,     @BookID int,            
@BookCode varchar(15),    @Price decimal (6,2),            
@Pages smallint,     @PublisherID smallint,            
@NoofCopy tinyint,     @BookFormatID tinyint,            
@ImgBookSmallFS varchar (50),       @ImgBookSmallBS varchar (50),            
@ImgBookLarge varchar (50),   @ISBN13 varchar (17),            
@FirstEdition varchar(8),   @CurrentEdition varchar(10),            
@Dimensions varchar (14),   @IsKarkaBook bit ,
@EnteredBy tinyint
)            
AS            
BEGIN            
SET NOCOUNT ON            
--select BookFormatID,Name as FormatName from dbo.BookFormat        
 IF(@BookDetailsID =0)    
  BEGIN        
   Insert into dbo.BooksDetails(BookID,BookCode,Price,Pages,PublisherID,NoofCopy,BookFormat,ImgBookSmallFS,ImgBookSmallBS,ImgBookLarge,ISBN13,FirstEdition,            
   CurrentEdition,Dimensions,IsKarkaBook,EnteredBy)            
  values(@BookID,@BookCode,@Price,@Pages,@PublisherID,@NoofCopy,@BookFormatID,@ImgBookSmallFS,@ImgBookSmallBS,@ImgBookLarge,@ISBN13,@FirstEdition,            
  @CurrentEdition,@Dimensions,@IsKarkaBook,@EnteredBy)            
  END    
 ELSE    
 BEGIN    
  Update dbo.BooksDetails set BookCode=@BookCode,Price=@Price,Pages=@Pages,PublisherID=@PublisherID,NoofCopy=@NoofCopy,    
  BookFormat=@BookFormatID,ImgBookSmallFS=@ImgBookSmallFS,ImgBookSmallBS=@ImgBookSmallBS,ImgBookLarge=@ImgBookLarge,ISBN13=@ISBN13,FirstEdition=@FirstEdition,            
   CurrentEdition=@CurrentEdition,Dimensions=@Dimensions,IsKarkaBook=@IsKarkaBook, EnteredBy = @EnteredBy  
  where BookDetailsID=@BookDetailsID    
END    
END   



GO
/****** Object:  StoredProcedure [dbo].[USP_AddBooksReview]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[USP_AddBooksReview](                  
@BookDetailsID int,                  
@Header nvarchar(500),                  
@BookDescription nvarchar(max),          
@UserID int null
)                  
AS                  
BEGIN                  
 SET NOCOUNT ON              
        
  Insert into dbo.BooksReview(BookDetailsID,Header,Description,UserID,EnteredBy,CreatedDate)            
   values(@BookDetailsID,@Header,@BookDescription,@UserID,1,getdate())          
         
END   

GO
/****** Object:  StoredProcedure [dbo].[USP_AddToDoList]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[USP_AddToDoList]

(@description nvarchar(1000))

as

Begin

	Insert into dbo.ToDoList(Description,CreatedDate )values(@description,getdate())
End
GO
/****** Object:  StoredProcedure [dbo].[USP_AddUser]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
        
        
/****** Object:  StoredProcedure [dbo].[USP_AddUser]    Script Date: 07-11-2021 12.33.19 PM ******/        
CREATE Procedure [dbo].[USP_AddUser](          
@UserID int,          
@Initial nvarchar(7)=null,          
@User nvarchar(100), @Name varchar(35),          
@Email varchar(40),          
@Password nvarchar(60),          
@Mobile varchar(10),          
@ProfessionID tinyint,          
@UserTypeID tinyint,          
@SpecialNameID tinyint =null,          
@Result int Output          
)          
as          
Begin          
Declare @FullName nvarchar(110)   
Set @FullName = @Initial + @User  
  
if (@UserID=0)          
BEGIN          
IF NOT EXISTS(SELECT (Initial + UserName)AS userName FROM Users WHERE (Initial + UserName) = @FullName)          
BEGIN          
INSERT INTO Users(Initial,UserName,Name,MailID,Password,Mobile,ProfessionID,UserTypeID,SpecialNameID,LastActivity,CreatedDate)values          
(LTRIM(RTRIM(@Initial)),LTRIM(RTRIM(@User)),LTrim(RTrim(@Name)),@Email,@Password,@Mobile,@ProfessionID,@UserTypeID,@SpecialNameID,getdate(),getdate())          
set @Result = scope_Identity()          
return @Result          
END          
ELSE          
BEGIN          
set @Result=-2          
return @Result          
END          
END          
ELSE          
update Users set Initial=LTRIM(RTRIM(@Initial)),UserName=LTRIM(RTRIM(@User)),Name=LTRIM(RTRIM(@Name)),MailID=LTRIM(RTRIM(@Email)),Password=@Password,Mobile=LTRIM(RTRIM(@Mobile)),          
ProfessionID=@ProfessionID,UserTypeID=@UserTypeID,SpecialNameID=@SpecialNameID          
OUTPUT INSERTED.UserId          
where UserId=@UserID          
set @Result=@UserID          
return @Result          
End     
GO
/****** Object:  StoredProcedure [dbo].[USP_AddUserDetails]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[USP_AddUserDetails] --1,'','','','','','','','','','','','','comm','Profile','',43,0,0,'',''    
(@userID int, @profile nvarchar(1000) = null,@protocol char(1),    
@website varchar(30) = null, @blog varchar(20)= null,    
@blogType char(1) = null, @faceBook nvarchar(50) = null,    
@twitter varchar(30) = null, @pinterest varchar(25) = null,    
@youTube varchar(32)= null, @instagram varchar(15)= null,    
@wikipedia nvarchar(50) = null, @dOB date = null,    
@dOD date = null, @imgComments varchar(32) = null,    
@imgProfile varchar(32) = null, @address nvarchar(300) = null,    
@cityID smallint = null, @IsShownInMenu bit,    
@IsMailSubscription bit, @reference nvarchar(500) = null,    
@result varchar(10) Output )    
as    
BEGIN    
IF NOT EXISTS(SELECT UserID FROM Userdetails WHERE UserID = @userID)    
BEGIN    
 INSERT INTO dbo.UserDetails(UserID,Profile,Protocol,Website,Blog,BlogType,FaceBook,Twitter,DOB,DOD,ImgComments,ImgProfile,Address,CityId,IsShownInMenu,IsMailSubscription)values    
 (@userID,@profile,@protocol,@website,@blog,@blogType,@faceBook,@twitter,@dOB,@dOD,@imgComments,@imgProfile,@address,@cityID,@IsShownInMenu,@IsMailSubscription)    
 if(@Reference !='')    
  BEGIN    
   Insert into dbo.UserReference (UserID,Reference,EnteredBy)values(@userID,@reference,1)    
 END    
 set @Result ='Success'    
END    
    
ELSE    
 BEGIN    
 update dbo.UserDetails set Profile=@profile,Protocol=@protocol,Website=@website,Blog=@blog,BlogType=@blogType,FaceBook=@faceBook,Twitter=@twitter,    
 Pinterest=@pinterest,YouTube=@youTube,Instagram=@instagram,Wikipedia=@wikipedia,DOB=@dOB,DOD=@dOD,ImgComments=@imgComments,    
 ImgProfile=@imgProfile,Address=@address,CityId=@cItyID,IsShownInMenu=@IsShownInMenu,IsMailSubscription=@IsMailSubscription    
 where UserID = @userID    
    
IF EXISTS(SELECT UserID FROM dbo.UserReference WHERE UserID = @userID)    
BEGIN    
  update dbo.UserReference set Reference=@reference where UserID = @userID    
 END    
    
 set @result ='Success'    
END    
End 
GO
/****** Object:  StoredProcedure [dbo].[USP_CheckUserExists]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_CheckUserExists] --'LocalAdmin','TALrlbcogFCREM1uwXHJ2WjYzC32kM2ruxoOTC2dcsQ=',''      
(@Name varchar(20),@Password nvarchar(60),@Result int Output)      
as      
BEGIN      
 if not exists(select AdminUserID from dbo.AdminUser where Name=@Name and Password=@Password)      
	 BEGIN
		 select @Result=2     
		 --Print @Result
	 END
 else   
	 select @Result=AdminUserID from dbo.AdminUser where Name=@Name and Password=@Password   
	 --Print @Result
END      


GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllAuthorSeries]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_GetAllAuthorSeries]            
            
as            
            
BEGIN            
            
Set NoCount on            
            
select AuthorSeriesID,            
            
S.Header ,U.UserName as Author,AuthorID,SeriesType,S.SeriesTypeID,           
M.Magazine as Magazine,S.MagazineID, WeekDay, S.WeekDaysID,StartDate,EndDate            
            
from dbo.AuthorSeries S Join Users U on S.AuthorID=U.UserID              
Join Magazines M on M.MagazineID=S.MagazineID              
Left Join WeekDays W on W.WeekDaysID=S.WeekDaysID            
Join SeriesType T on T.SeriesTypeID=S.SeriesTypeID            
            
END   
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllAuthorsProfile]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
/****** Object:  StoredProcedure [dbo].[USP_GetAllAuthorsProfile]    Script Date: 07-11-2021 12.33.19 PM ******/  
CREATE Procedure [dbo].[USP_GetAllAuthorsProfile]-- 1        
  (@UserTypeID int)        
  as        
  BEGIN        
        
SET NOCOUNT ON        
        
 select U.UserID,      
 --CONCAT(ISNULL(S.Name+' ',''),Initial,'',LTRIM(RTRIM(U.Name))) As Name,      
 U.UserName,U.Name,UserDetailID,Profile,Protocol,Website,Blog,BlogType,FaceBook,Twitter,YouTube,        
        
 Pinterest,Instagram,Wikipedia,ImgProfile,        
        
 ImgComments,DOB,DOD,MailID from Users U         
        
 Left Join UserDetails UD on U.UserID=UD.UserID         
        
 Left Join SpecialName S on U.SpecialNameID=S.SpecialNameID        
        
where UserTypeID= @UserTypeID  and U.UserID !=3 --User is not clear use Hypen(-)    
        
order by U.ModifiedDate        
        
END   
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllBookDetails]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
  
/****** Object:  StoredProcedure [dbo].[USP_GetAllBookDetails]    Script Date: 07-11-2021 12.33.19 PM ******/  
CREATE Procedure [dbo].[USP_GetAllBookDetails]    
As    
Set Nocount on    
Begin    
 select B.BookID, BD.BookDetailsID, B.Book AS BookName,Price,  Pages,NoofCopy,    
 P.PublisherID, BookFormat,FirstEdition, ISBN13     
 From dbo.BooksDetails BD join dbo.Books B on BD.BookID=B.BookID     
 Join dbo.Publishers P on BD.PublisherID=P.PublisherID    
 where B.Recstatus='A' order by BD.CreatedDate desc    
    
End    
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllBookFormat]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_GetAllBookFormat]      
AS      
BEGIN      
 SET NOCOUNT ON      
 select BookFormatID,BookFormat from dbo.BookFormat      
       
END    
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllBookReviewsByBookID]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_GetAllBookReviewsByBookID] --756      
(@BookID int)      
As      
Set nocount on      
Begin      
 Select BD.BookID,BR.BookDetailsID,BR.Header,U.Name,BR.CreatedDate from dbo.BooksReview BR Join dbo.BooksDetails BD on     
 BR.BookDetailsID =BD.BookDetailsID  Join dbo.Users U on     
 U.UserID=BR.UserID where BD.BookID=@BookID      
ENd      
      
      
      
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllBooksDetailsByAuthorID]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
          
/****** Object:  StoredProcedure [dbo].[USP_GetAllBooksDetailsByAuthorID]   ******/          
CREATE Procedure [dbo].[USP_GetAllBooksDetailsByAuthorID] --62
(@AuthorID int)              
as                          
BEGIN              
SET NOCOUNT ON              
 SELECT B.BookID,              
   BD.BookDetailsID, B.Book AS BookName,U.Userid, U.UserName, Price,  Pages,BooksReviewID              
   ,BookCode,  BookDescription,BD.PublisherID,  P.Publisher,  NoofCopy,  BF.BookFormat,          
   BC.CategoryID as SubCategoryID, C.Category as SubCategoryName, C.ParentID AS CategoryID,        
   M.Category as CategoryName, BD.ImgBookSmallFS,BD.ImgBookSmallBS, BD.ImgBookLarge,  ISBN13,  FirstEdition,          
   CurrentEdition,  IsKarkaBook,  Dimensions, B.RecStatus,BA.UserTypeID      
 FROM Books B left outer JOIN dbo.BooksDetails BD ON BD.BookID = B.BookID              
 Left Outer JOIN Publishers P ON P.PublisherID = BD.PublisherID              
 Left Outer JOIN BookFormat BF ON BF.BookFormatID = BD.BookFormat              
 left outer Join BookAuthor BA on  B.BookID=BA.BookID              
 left outer Join Users U on BA.AuthorID=U.UserID              
 left outer join BookCategory BC on BC.BookID=B.BookID              
 left outer join Category C on C.CategoryID=BC.CategoryID              
 left outer join Category M on M.CategoryID=C.Parentid              
 Left outer join BooksReview BR on BD.BookDetailsID=BR.BookDetailsID       
   
 where U.UserID=@AuthorID and  B.RecStatus <>'D'               
END 
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllBooksDetailsByBookID]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_GetAllBooksDetailsByBookID] --1      
(@BookID int)                
As                  
    
BEGIN      
      
SET NOCOUNT ON      
      
DECLARE @userid int;      
      
Select @userid=authorid from bookauthor  where BookID=@BookID      
      
SELECT  BD.BookDetailsID,  B.BookID,  B.Name AS BookName,U.Userid, U.Name AS [User], BookCode,  BookDescription,  Price,  Pages,  BD.PublisherID,      
      
  P.Name AS Publisher,  NoofCopy,  BF.BookFormat,  BF.Name AS Format,BC.CategoryID as SubCategoryID, C.Name as SubCategoryName, C.ParentID as CategoryID,M.Name as CategoryName,      
      
   BD.ImgBookSmallFS,BD.ImgBookSmallBS,      
      
  BD.ImgBookLarge,  ISBN13,  FirstEdition,  CurrentEdition,  IsKarkaBook,  Dimensions,  BD.CreatedDate,  BD.ModifiedDate,  B.RecStatus      
      
FROM Books B  JOIN dbo.BooksDetails BD ON BD.BookID = B.BookID      
      
Left Outer JOIN Publishers P ON P.PublisherID = BD.PublisherID      
      
Left Outer JOIN BookFormat BF ON BF.BookFormatID = BD.BookFormat      
      
left outer Join BookAuthor BA on  B.BookID=BA.BookID      
      
left outer Join Users U on BA.AuthorID=U.UserID      
      
left outer join bookcategory BC on BC.BookID=BD.BookID      
      
left outer join category C on C.CategoryID=BC.CategoryID      
      
left outer join category M on M.CategoryID=C.Parentid      
      
where BD.BookID=@BookID and Userid=@userID and B.RecStatus <>'D'       
      
END 
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllBooksReviewByBookDetailsID]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_GetAllBooksReviewByBookDetailsID] --1    
(@bookDetailsID int)                            
AS                            
BEGIN                            
 SET NOCOUNT ON                      
SELECT    
 BR.BooksReviewID,  BD.BookDetailsID,  B.BookID,  B.Name AS BookName,  BR.Header,BR.Description,      
   BC.CategoryID, C.Name AS BookCategory    
 FROM dbo.BooksReview BR    
 JOIN dbo.BooksDetails BD ON BR.BookDetailsID = BD.BookDetailsID    
 JOIN dbo.Books B ON BD.BookID = B.BookID 
 JOIN dbo.BookCategory BC ON BC.BookID = BD.BookID    
 JOIN dbo.Category C ON C.CategoryID = BC.CategoryID    
 WHERE BR.BookDetailsID = @bookDetailsID    
AND BR.RecStatus = 'A'    
    
END    
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllBooksReviewDetails]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
  
/****** Object:  StoredProcedure [dbo].[USP_GetAllBooksReviewDetails]    Script Date: 07-11-2021 12.33.19 PM ******/  
CREATE Procedure [dbo].[USP_GetAllBooksReviewDetails] --1            
(@TYPE int)                  
as            
BEGIN                      
SET NOCOUNT ON                      
   IF(@TYPE=2) --பத்திரிக்கைகள்            
    BEGIN            
    SELECT BooksReviewID,BR.BookDetailsID,B.Book AS BookName,Header,Description,            
    BR.MagazineID as SourceID,M.Name AS Source,BR.SourceDate             
    FROM dbo.BooksReview_Others BR JOIN dbo.BooksDetails BD ON BR.BookDetailsID = BD.BookDetailsID             
    JOIN dbo.Books B ON B.BookID = BD.BookID            
    JOIN dbo.Magazines M ON BR.MagazineID = M.MagazineID             
    AND B.RecStatus ='A' AND BR.Recstatus = 'A'            
   END            
 ELSE IF(@TYPE=1)--எழுத்தாளர்கள்/வாசகர்கள்            
  BEGIN            
   SELECT BooksReviewID,BR.BookDetailsID,B.BookID,B.Book AS BookName,Header,Description,C.Category AS Category,        
   BR.UserID as SourceID,U.UserName AS Source, BD.ImgBookSmallFS,BR.CreatedDate as SourceDate            
   FROM dbo.BooksReview BR JOIN dbo.BooksDetails BD ON BR.BookDetailsID = BD.BookDetailsID             
   JOIN dbo.Books B ON B.BookID = BD.BookID            
   JOIN dbo.Users U ON BR.UserID = U.UserID            
   JOin dbo.BookCategory BC on BC.BookID=B.BookID      
   Join dbo.Category C on C.CategoryID=BC.CategoryID      
   AND B.RecStatus ='A' AND BR.Recstatus = 'A'            
  END            
END   
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllBooksWithAuthor]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_GetAllBooksWithAuthor]      
as                          
BEGIN                          
 SET NOCOUNT ON           
 SELECT B.BookID,B.Book as BookName,B.Name,B.BookDescription,B.Tanglish,Convert(date,B.CreatedDate,103)as CreatedDate,    
 (Initial + U.UserName) As Author,A.AuthorId,U.UserTypeID FROM dbo.BOOKS B    
 Left Join dbo.BookAuthor A on B.BookID=A.BookID   
    Left Join dbo.Users U on A.AuthorID=U.UserID    
 where B.RecStatus='A'   
END 
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllBooksWithCategory]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
  
  
/****** Object:  StoredProcedure [dbo].[USP_GetAllBooksWithCategory]    Script Date: 07-11-2021 12.33.19 PM ******/  
CREATE Procedure [dbo].[USP_GetAllBooksWithCategory]      
as      
BEGIN      
 Set Nocount on      
      
 select B.BookID,B.Book,U.UserName as UserName,C.Category as CategoryName from dbo.Books B Join dbo.BookAuthor A on B.BookID=A.BookID      
 Join dbo.Users U on U.UserID=A.AuthorID       
 Join dbo.BookCategory BC on BC.BookID=B.BookID      
 Join dbo.Category C on C.CategoryID=BC.CategoryID      
      
END   
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllCacheName]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
  
/****** Object:  StoredProcedure [dbo].[USP_GetAllCacheName]    Script Date: 07-11-2021 12.33.19 PM ******/  
CREATE Procedure [dbo].[USP_GetAllCacheName]    
as    
Begin    
 Set nocount on    
 select CacheNameID,Code, CacheName from CacheName    
End   
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllCategory]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
/****** Object:  StoredProcedure [dbo].[USP_GetAllCategory]    Script Date: 07-11-2021 12.33.19 PM ******/  
CREATE procedure [dbo].[USP_GetAllCategory]    
AS              
BEGIN              
SET NOCOUNT ON        
 select CategoryID,Category,ParentID from Category    
END    
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllCountries]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
  
/****** Object:  StoredProcedure [dbo].[USP_GetAllCountries]    Script Date: 07-11-2021 12.33.19 PM ******/  
CREATE Procedure [dbo].[USP_GetAllCountries]  
as  
BEGIN  
set nocount on  
 select CountryID,Country from dbo.Country  
END  
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllProfession]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
/****** Object:  StoredProcedure [dbo].[USP_GetAllProfession]    Script Date: 07-11-2021 12.33.19 PM ******/  
Create Procedure [dbo].[USP_GetAllProfession]  
as  
SET NOCOUNT ON  
BEGIN  
 select ProfessionID,Profession from dbo.Profession  
END  
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllSeriesType]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
/****** Object:  StoredProcedure [dbo].[USP_GetAllSeriesType]    Script Date: 07-11-2021 12.33.19 PM ******/  
CREATE Procedure [dbo].[USP_GetAllSeriesType]  
as  
BeGIN  
 SELECT SeriesTypeID,SeriesType from dbo.SeriesType  
END  
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllSpecialName]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
/****** Object:  StoredProcedure [dbo].[USP_GetAllSpecialName]    Script Date: 07-11-2021 12.33.19 PM ******/  
CREATE procedure [dbo].[USP_GetAllSpecialName]  
AS                
BEGIN                
 SET NOCOUNT ON                
 select SpecialNameID,SpecialName from dbo.SpecialName  
END  
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllToDo]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
/****** Object:  StoredProcedure [dbo].[USP_GetAllToDo]    Script Date: 07-11-2021 12.33.19 PM ******/  
CREATE Procedure [dbo].[USP_GetAllToDo]  
as  
Begin  
set nocount on  
 select ToDoListID, Description, CreatedDate ,  
case  
 WHEN DATEDIFF(day,createddate,getdate())>0  
 THEN  CAST(DATEDIFF(day,createddate,getdate()) as varchar) + ' day'  
 ELSE CAST(DATEDIFF(hour,createddate,getdate()) as varchar) + + ' hour'  
End TimeInterval  
from dbo.ToDoList where recstatus='A'  
End  
  
  
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllUsers]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_GetAllUsers]        
        
AS        
        
BEGIN        
        
SET NOCOUNT ON        
        
SELECT U.UserID,Initial,UserName,U.Name,        
        
MailID,Password,Mobile,U.CreatedDate,U.UserTypeID,UT.UserType, P.ProfessionID,Profession,        
        
SpecialNameID,Profile,Protocol, Website,Blog,BlogType,FaceBook,        
        
Twitter,Pinterest,YouTube,Instagram,Wikipedia, Address, format(DOB,'dd/MM/yyyy') as DOB,DOD,ImgProfile,ImgComments,        
        
Cy.CountryID,S.StateID,C.CityID,IsShownInMenu,IsMailSubscription,R.Reference from        
        
dbo.Users U        
        
LEFT OUTER JOIN dbo.Userdetails UD on U.UserID=UD.UserID        
        
LEFT OUTER JOIN dbo.Usertypes UT on U.UserTypeID=UT.UserTypeID        
        
LEFT OUTER JOIN dbo.Profession P on P.ProfessionID=U.ProfessionID        
        
LEFT OUTER JOIN dbo.City C on UD.CityID=C.CityID        
        
LEFT OUTER JOIN dbo.States S on S.StateID=C.StateID        
        
LEFT OUTER JOIN dbo.Country Cy on Cy.CountryID=S.CountryID        
        
LEFT OUTER JOIN dbo.UserReference R on R.UserID=U.UserID        
        
where U.RecStatus='A'     
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllUserType]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
      
      
/****** Object:  StoredProcedure [dbo].[USP_GetAllUserType]    Script Date: 07-11-2021 12.33.19 PM ******/      
CREATE procedure [dbo].[USP_GetAllUserType]                    
      
AS                    
      
BEGIN                    
      
 SET NOCOUNT ON       
      
 select UserTypeID,UserType + ' - ' + Name as UserType,ShortCode from dbo.UserTypes      
      
END       


    
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAuthorsProfileByID]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
/****** Object:  StoredProcedure [dbo].[USP_GetAuthorsProfileByID]    Script Date: 07-11-2021 12.33.19 PM ******/  
CREATE Procedure [dbo].[USP_GetAuthorsProfileByID]  -- 63    
   
(@userID int)    
   
as    
    
BEGIN    
    
SET NOCOUNT ON    
    
select U.UserID,CONCAT(ISNULL(S.SpecialName+' ',''),Initial,'',LTRIM(RTRIM(U.UserName))) As UserName,UserDetailID,Profile,Website,Blog,BlogType,FaceBook,Twitter,YouTube,    
    
Pinterest,Instagram,Wikipedia,ImgProfile,ImgComments,DOB,DOD,MailID,U.CreatedDate    
    
from dbo.Users U left Join dbo.UserDetails UD on U.UserID=UD.UserID     
Left Join SpecialName S on U.SpecialNameID=S.SpecialNameID    
    
where U.UserID= @userID     
    
END    
GO
/****** Object:  StoredProcedure [dbo].[USP_GetBookDetailsByID]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE Procedure [dbo].[USP_GetBookDetailsByID]  --103    
   (@bookDetailsID int)             
     as                
    BEGIN    
      SET NOCOUNT ON    
     
    Select BD.BookDetailsID,  B.BookID,  B.Name AS BookName from dbo.BooksDetails BD join dbo.Books B on   
 BD.BookID=B.BookID where BD.BookDetailsID=@bookDetailsID and B.RecStatus <>'D'    
    
       END   
GO
/****** Object:  StoredProcedure [dbo].[USP_GetBooksReview]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
    
    
/****** Object:  StoredProcedure [dbo].[USP_GetBooksReview]    Script Date: 07-11-2021 12.33.19 PM ******/    
CREATE procedure [dbo].[USP_GetBooksReview] --6       
(@userTypeID Int)        
AS        
BEGIN        
SET NOCOUNT ON        
select * from(        
SELECT Row_Number()over(partition by C.CategoryID order by BR.CreatedDate desc) as R,        
BooksReviewID,BD.BookDetailsID,BD.BookId, BC.CategoryID,C.ParentID, C.Category AS BookCategory, BR.Header,BR.Description,        
BR.CreatedDate, ImgBookSmallFS, UD.ImgComments,U.UserId,U.UserName        
FROM BooksReview BR        
left outer JOIN Booksdetails BD ON BR.BookDetailsID = BD.BookDetailsID        
left outer JOIN BookCategory BC ON BC.BookID = BD.BookID        
left outer JOIN Category C ON C.CategoryID = BC.CategoryID        
left outer join UserDetails UD on UD.UserID=BR.UserID        
left outer join Users U on UD.UserID=U.UserID        
where U.UserTypeID in(@userTypeID)        
) as T where R <=1 Order by CreatedDate desc        
END        
GO
/****** Object:  StoredProcedure [dbo].[USP_GetBooksReviewByReviewID]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_GetBooksReviewByReviewID]      -- 1  
(@booksReviewID int)                                
AS                                
BEGIN                                
  SET NOCOUNT ON                          
      
SELECT       
    BR.BooksReviewID,      
    BD.BookDetailsID,      
    B.BookID,      
    B.Name AS BookName,      
    BR.Header,      
    BR.Description,      
    BR.UserID,      
    U.UserName,      
    BR.CreatedDate,      
    BC.CategoryID,      
    C.Name AS BookCategory      
      
  FROM dbo.BooksReview BR      
      
  JOIN dbo.BooksDetails BD      
    ON BR.BookDetailsID = BD.BookDetailsID      
      
  JOIN dbo.Books B      
    ON BD.BookID = B.BookID      
      
  JOIN dbo.Users U      
    ON U.UserID = BR.UserID      
      
  JOIN dbo.BookCategory BC      
    ON BC.BookID = BD.BookID      
      
  JOIN dbo.Category C      
    ON C.CategoryID = BC.CategoryID      
      
  WHERE BR.BooksReviewID = @booksReviewID      
  AND BR.RecStatus = 'A'      
      
--order by BR.BooksReviewID                        
      
END  
GO
/****** Object:  StoredProcedure [dbo].[USP_GetCategoryByBookID]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[USP_GetCategoryByBookID]  -- 1
(@BookID int)            
as              
BEGIN  
SET NOCOUNT ON  
 Select C.CategoryID,Name,ParentID from BookCategory BC join Category C on BC.CategoryID=C.CategoryID where bookid=@BookID  
END  
GO
/****** Object:  StoredProcedure [dbo].[USP_GetCityByStateID]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
  
/****** Object:  StoredProcedure [dbo].[USP_GetCityByStateID]    Script Date: 07-11-2021 12.33.19 PM ******/  
CREATE Procedure [dbo].[USP_GetCityByStateID] --   27     
      
(@stateID smallint)        
        
as        
        
BEGIN        
        
 set nocount on        
        
 select CityID,Name +' - ' + City as City from City where StateID=@stateID 
        
END        
        
GO
/****** Object:  StoredProcedure [dbo].[USP_GetErrorInfo]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE Proc [dbo].[USP_GetErrorInfo]    
as    
begin    
DECLARE @ObjectName varchar(250);
set @ObjectName = Error_Procedure()

insert into DBExceptionLog(      
ErrorLine, ErrorMessage, ErrorNumber,      
ErrorProcedure, ErrorSeverity, ErrorState,      
ErrorDateTime      
)      
SELECT      
ERROR_LINE () as ErrorLine,      
Error_Message() as ErrorMessage,      
Error_Number() as ErrorNumber,      
--Error_Procedure() as 'Proc',      
@ObjectName ,
Error_Severity() as ErrorSeverity,      
Error_State() as ErrorState,      
GETDATE () as DateErrorRaised     
End     
GO
/****** Object:  StoredProcedure [dbo].[USP_GetLogInUser]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_GetLogInUser] --'support@karkathamizha.com','29sCWNY1si/v'  
(@emailId varchar(35),@password nvarchar(60))  
as   
BEGIN  
 SELECT UserID, ISNULL(UserName,Name)As UserName from dbo.Users where  
 MailID = @emailId AND Password = @password AND RecStatus='A'  
END  
  
  
GO
/****** Object:  StoredProcedure [dbo].[USP_GetSelectedAuthor]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_GetSelectedAuthor] --1  
 
(@bookid int)  
  
AS    
  
BEGIN    
  
 SET NOCOUNT ON    
  
 SELECT BookID, AuthorID, UserTypeID from bookauthor where bookid=@bookid  
  
END   
GO
/****** Object:  StoredProcedure [dbo].[USP_GetSelectedCategories]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[USP_GetSelectedCategories] -- 1  
(@bookid int)  
as  
  
Begin  
  
 set nocount on
 
 select BookID,BC.CategoryID,ParentID from BookCategory BC join Category C on BC.CategoryID=C.Categoryid where BookID=@bookid  
  
end  
GO
/****** Object:  StoredProcedure [dbo].[USP_GetStatesByCountryID]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
/****** Object:  StoredProcedure [dbo].[USP_GetStatesByCountryID]    Script Date: 07-11-2021 12.33.19 PM ******/  
Create Procedure [dbo].[USP_GetStatesByCountryID] --97  
  
(@countryID tinyint)  
  
as  
  
BEGIN  
  
 set nocount on  
  
 select StateID,State from States where CountryID=@countryID  
  
END  
GO
/****** Object:  StoredProcedure [dbo].[USP_GetUserByAuthorType]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Used in UserRepository.cs file in GetUserByAuthorType() */      
      
CREATE Procedure [dbo].[USP_GetUserByAuthorType]                
      
as                 
Begin              
 set Nocount on                  
 select U.UserID,Name + ' - ' + UserName as UserName from dbo.users U           
 Join Userdetails D on U.UserID=D.UserID          
 where UserTypeID !=6 --6-User            
 --and DOD is null        
 order by Name           
End 
GO
/****** Object:  StoredProcedure [dbo].[USP_GetUserDetails]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
/****** Object:  StoredProcedure [dbo].[USP_GetUserDetails]    Script Date: 07-11-2021 12.33.19 PM ******/  
CREATE Procedure [dbo].[USP_GetUserDetails] --'77,79,8'  
( @authorID varchar(500) )      
as          
Begin         
      
Select UserID,ImgProfile,ImgComments from dbo.UserDetails WHERE UserID IN (  
 SELECT CAST(Item AS INTEGER)  
        FROM dbo.SplitString(@authorID, ',')  
)      
       
END          
      
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateBook]    Script Date: 21-10-2022 11.04.00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_UpdateBook]         
(  
@BookID int,        
@Book nvarchar(200),          
@Name varchar(60),        
@Tanglish varchar(60),  
@BookDescription nvarchar(1500),
@RecStatus char(1)   
)             
 
AS                  
  
BEGIN                  
  
 SET NOCOUNT ON            
  
 update Books set Book=@Book,Name=@Name,Tanglish=@Tanglish,BookDescription=@BookDescription,RecStatus=@RecStatus where BookID=@BookID        
  
END  
GO
