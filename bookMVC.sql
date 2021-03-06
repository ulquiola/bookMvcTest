USE [master]
GO
/****** Object:  Database [bookMVC]    Script Date: 2018/10/24 11:00:55 ******/
CREATE DATABASE [bookMVC]
 
GO
USE [bookMVC]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 2018/10/24 11:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Price] [numeric](10, 2) NULL,
	[BookCoverUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2018/10/24 11:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[BookId] [int] NULL,
	[Num] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookId], [AuthorName], [Title], [Price], [BookCoverUrl]) VALUES (1, N'林徽因', N'你是人间四月天', CAST(26.78 AS Numeric(10, 2)), N'..\..\Images\1.jpg')
INSERT [dbo].[Books] ([BookId], [AuthorName], [Title], [Price], [BookCoverUrl]) VALUES (2, N'汪曾祺', N'人间滋味', CAST(17.99 AS Numeric(10, 2)), N'..\..\Images\2.jpg')
INSERT [dbo].[Books] ([BookId], [AuthorName], [Title], [Price], [BookCoverUrl]) VALUES (3, N'程杰', N'大话设计模式', CAST(39.65 AS Numeric(10, 2)), N'..\..\Images\3.jpg')
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [Address], [BookId], [Num]) VALUES (1, N'fhsjlgfl;a', 1, 3)
INSERT [dbo].[Orders] ([OrderId], [Address], [BookId], [Num]) VALUES (2, N'jxnu', 1, 6)
INSERT [dbo].[Orders] ([OrderId], [Address], [BookId], [Num]) VALUES (3, N'assss', 1, 5)
SET IDENTITY_INSERT [dbo].[Orders] OFF
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Orders] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Orders]
GO
USE [master]
GO
ALTER DATABASE [bookMVC] SET  READ_WRITE 
GO
