CREATE DATABASE FinalProject
USE FinalProject
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryManager](
	[CodeDelivery] [varchar](25) NOT NULL,
	[Manager] [nvarchar](50) NULL,
	[CustomerName] [nvarchar] (50) NULL,
	[DateDelivery] [date] NULL,
	[paymethod] [varchar](40) NULL,
	[StatusDelivery] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeDelivery] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/********Table [dbo].[Goods Delivery]**********/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods Delivery](
	[CodeDelivery] [varchar](25) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[ProductID] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[PriceDelivery] [int] NULL,
 CONSTRAINT [PK_Delivery_Detail] PRIMARY KEY CLUSTERED 
(
	[CodeDelivery] ASC,
	[OrderNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/**********Table [dbo].[ReceivedManager]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceivedManager](
	[CodeReceived] [varchar](25) NOT NULL,
	[Manager] [nvarchar](50) NULL,
	[DateReceived] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeReceived] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/******Table [dbo].[Goods Received]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods Received](
	[CodeReceived] [varchar](25) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[ProductID] [nvarchar](50) NULL,
	[quantityReceived] [int] NULL,
	[PriceReceived] [int] NULL,
 CONSTRAINT [PK_Received_Detail] PRIMARY KEY CLUSTERED 
(
	[CodeReceived] ASC,
	[OrderNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



GO
/******Table [dbo].[LoginManager]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginManager](
	[Username] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/******Table [dbo].[Order]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [nvarchar](50) NULL,
	[ProductName] [nvarchar](50) NULL,
	[Status] [nvarchar](20) NULL,
	[paymethod] [varchar](25) NULL,
	[DateReceived] [date] NULL,
	[DateDelivery] [date] NULL,
	[PriceDelivery] [int] NULL,
	[PriceReceived] [int] NULL,
	[Profit] [int] NULL,
	[UserId] [int] NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/******Table [dbo].[Product]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[DateDelivery] [date] NULL,
	[DateReceived] [date] NULL,
	[PriceDelivery] [int] NULL,
	[PriceReceived] [int] NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/******Table [dbo].[RevenueReport]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RevenueReport](
	[ProductID] [nvarchar](50) NOT NULL,
	[product] [nvarchar](50) NULL,
	[quantityReceived] [int] NULL,
	[quantityDelivery] [int] NULL,
	[DateDelivery] [date] NULL,
	[DateReceived] [date] NULL,
	[PriceDelivery] [int] NULL,
	[PriceReceived] [int] NULL,
	[Profitprice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/******Table [dbo].[User]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--------------------Table DeliveryManager-------------------------
INSERT [dbo].[DeliveryManager] ([CodeDelivery], [Manager], [CustomerName], [DateDelivery], [paymethod], [StatusDelivery]) VALUES (N'Delivery101', N'Nguyen Chanh Tin', N'Nguyen Van A', CAST(N'2022-10-10' AS Date), N'Momo', N'Wait')
INSERT [dbo].[DeliveryManager] ([CodeDelivery], [Manager], [CustomerName], [DateDelivery], [paymethod], [StatusDelivery]) VALUES (N'Delivery102', N'Nguyen Trung Tin', N'Nguyen Van B', CAST(N'2022-09-29' AS Date), N'bank transfer', N'Wait')
INSERT [dbo].[DeliveryManager] ([CodeDelivery], [Manager], [CustomerName], [DateDelivery], [paymethod], [StatusDelivery]) VALUES (N'Delivery103', N'Nguyen Trung Tin', N'Nguyen Van C', CAST(N'2022-10-30' AS Date), N'Momo', N'Delivery')
INSERT [dbo].[DeliveryManager] ([CodeDelivery], [Manager], [CustomerName], [DateDelivery], [paymethod], [StatusDelivery]) VALUES (N'Delivery104', N'Nguyen Chanh Tin', N'Nguyen Van D', CAST(N'2022-11-11' AS Date), N'Cash', N'Wait')
INSERT [dbo].[DeliveryManager] ([CodeDelivery], [Manager], [CustomerName], [DateDelivery], [paymethod], [StatusDelivery]) VALUES (N'Delivery105', N'Nguyen Trung Tin', N'Nguyen Van E', CAST(N'2022-12-01' AS Date), N'bank transfer', N'Wait')
INSERT [dbo].[DeliveryManager] ([CodeDelivery], [Manager], [CustomerName], [DateDelivery], [paymethod], [StatusDelivery]) VALUES (N'Delivery106', N'Nguyen Trung Tin', N'Nguyen Van F', CAST(N'2022-12-03' AS Date), N'Cash', N'Delivery')
INSERT [dbo].[DeliveryManager] ([CodeDelivery], [Manager], [CustomerName], [DateDelivery], [paymethod], [StatusDelivery]) VALUES (N'Delivery107', N'Nguyen Chanh Tin', N'Nguyen Van G', CAST(N'2022-10-02' AS Date), N'Momo', N'Delivery')
GO

-------------------Table Goods Delivery----------------------
INSERT [dbo].[Goods Delivery] ([CodeDelivery], [OrderNumber], [ProductID], [quantity], [PriceDelivery]) VALUES (N'Delivery101', 1, N'Product201', 25, 30000000)
INSERT [dbo].[Goods Delivery] ([CodeDelivery], [OrderNumber], [ProductID], [quantity], [PriceDelivery]) VALUES (N'Delivery101', 2, N'Product202', 10, 30000000)
INSERT [dbo].[Goods Delivery] ([CodeDelivery], [OrderNumber], [ProductID], [quantity], [PriceDelivery]) VALUES (N'Delivery101', 3, N'Product203', 20, 40000000)
INSERT [dbo].[Goods Delivery] ([CodeDelivery], [OrderNumber], [ProductID], [quantity], [PriceDelivery]) VALUES (N'Delivery102', 1, N'Product203', 20, 40000000)
INSERT [dbo].[Goods Delivery] ([CodeDelivery], [OrderNumber], [ProductID], [quantity], [PriceDelivery]) VALUES (N'Delivery102', 2, N'Product204', 10, 25000000)
INSERT [dbo].[Goods Delivery] ([CodeDelivery], [OrderNumber], [ProductID], [quantity], [PriceDelivery]) VALUES (N'Delivery102', 3, N'Product206', 20, 40000000)
INSERT [dbo].[Goods Delivery] ([CodeDelivery], [OrderNumber], [ProductID], [quantity], [PriceDelivery]) VALUES (N'Delivery104', 1, N'Product204', 10, 25000000)
INSERT [dbo].[Goods Delivery] ([CodeDelivery], [OrderNumber], [ProductID], [quantity], [PriceDelivery]) VALUES (N'Delivery104', 2, N'Product204', 10, 25000000)
INSERT [dbo].[Goods Delivery] ([CodeDelivery], [OrderNumber], [ProductID], [quantity], [PriceDelivery]) VALUES (N'Delivery105', 1, N'Product205', 10, 30000000)
INSERT [dbo].[Goods Delivery] ([CodeDelivery], [OrderNumber], [ProductID], [quantity], [PriceDelivery]) VALUES (N'Delivery106', 1, N'Product206', 10, 40000000)
INSERT [dbo].[Goods Delivery] ([CodeDelivery], [OrderNumber], [ProductID], [quantity], [PriceDelivery]) VALUES (N'Delivery107', 1, N'Product207', 10, 32000000)
GO

select *from [Goods Delivery]
----------Table ReceivedManager---------------------------------
INSERT [dbo].[ReceivedManager] ([CodeReceived], [Manager], [DateReceived]) VALUES (N'Code301', N'Nguyen Chanh Tin', CAST(N'2022-10-22' AS Date))
INSERT [dbo].[ReceivedManager] ([CodeReceived], [Manager], [DateReceived]) VALUES (N'Code302', N'Nguyen Trung Tin', CAST(N'2022-10-10' AS Date))
INSERT [dbo].[ReceivedManager] ([CodeReceived], [Manager], [DateReceived]) VALUES (N'Code303', N'Nguyen Trung Tin', CAST(N'2022-11-10' AS Date))
INSERT [dbo].[ReceivedManager] ([CodeReceived], [Manager], [DateReceived]) VALUES (N'Code304', N'Nguyen Chanh Tin', CAST(N'2022-11-20' AS Date))
INSERT [dbo].[ReceivedManager] ([CodeReceived], [Manager], [DateReceived]) VALUES (N'Code305', N'Nguyen Trung Tin', CAST(N'2022-12-11' AS Date))
INSERT [dbo].[ReceivedManager] ([CodeReceived], [Manager], [DateReceived]) VALUES (N'Code306', N'Nguyen Trung Tin', CAST(N'2022-12-10' AS Date))
INSERT [dbo].[ReceivedManager] ([CodeReceived], [Manager], [DateReceived]) VALUES (N'Code307', N'Nguyen Chanh Tin', CAST(N'2022-10-22' AS Date))
GO

----------Table Goods Received---------------------------
INSERT [dbo].[Goods Received] ([CodeReceived], [OrderNumber], [ProductID], [quantityReceived], [PriceReceived]) VALUES (N'Code301', 1, N'Product201', 100, 25000000)
INSERT [dbo].[Goods Received] ([CodeReceived], [OrderNumber], [ProductID], [quantityReceived], [PriceReceived]) VALUES (N'Code301', 2, N'Product202', 200, 15000000)
INSERT [dbo].[Goods Received] ([CodeReceived], [OrderNumber], [ProductID], [quantityReceived], [PriceReceived]) VALUES (N'Code301', 3, N'Product203', 300, 35000000)
INSERT [dbo].[Goods Received] ([CodeReceived], [OrderNumber], [ProductID], [quantityReceived], [PriceReceived]) VALUES (N'Code302', 1, N'Product201', 100, 25000000)
INSERT [dbo].[Goods Received] ([CodeReceived], [OrderNumber], [ProductID], [quantityReceived], [PriceReceived]) VALUES (N'Code302', 2, N'Product202', 200, 15000000)
INSERT [dbo].[Goods Received] ([CodeReceived], [OrderNumber], [ProductID], [quantityReceived], [PriceReceived]) VALUES (N'Code303', 1, N'Product203', 300, 35000000)
INSERT [dbo].[Goods Received] ([CodeReceived], [OrderNumber], [ProductID], [quantityReceived], [PriceReceived]) VALUES (N'Code304', 1, N'Product204', 20, 20000000)
INSERT [dbo].[Goods Received] ([CodeReceived], [OrderNumber], [ProductID], [quantityReceived], [PriceReceived]) VALUES (N'Code305', 1, N'Product205', 25, 25000000)
INSERT [dbo].[Goods Received] ([CodeReceived], [OrderNumber], [ProductID], [quantityReceived], [PriceReceived]) VALUES (N'Code306', 1, N'Product206', 20, 27000000)
INSERT [dbo].[Goods Received] ([CodeReceived], [OrderNumber], [ProductID], [quantityReceived], [PriceReceived]) VALUES (N'Code307', 1, N'Product207', 150, 28000000)
GO

select *from [Goods Received]
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [ProductID], [ProductName], [Status], [paymethod], [DateReceived], [DateDelivery], [PriceDelivery], [PriceReceived], [Profit], [UserId], [Amount]) VALUES (1, N'Product201', N'Blackmores Evening', N'Wait', N'Momo', CAST(N'2022-10-22' AS Date), CAST(N'2022-10-10' AS Date), 30000000, 25000000, 5000000, 1, 1)
INSERT [dbo].[Order] ([Id], [ProductID], [ProductName], [Status], [paymethod], [DateReceived], [DateDelivery], [PriceDelivery], [PriceReceived], [Profit], [UserId], [Amount]) VALUES (2, N'Product202', N'Prenatal Multi DHA', N'Wait', N'bank transfer', CAST(N'2022-10-10' AS Date), CAST(N'2022-09-29' AS Date), 30000000, 15000000, 10000000, 1, 1)
INSERT [dbo].[Order] ([Id], [ProductID], [ProductName], [Status], [paymethod], [DateReceived], [DateDelivery], [PriceDelivery], [PriceReceived], [Profit], [UserId], [Amount]) VALUES (3, N'Product203', N'PURITAN’S PRIDE', N'Delivery', N'Momo', CAST(N'2022-11-10' AS Date), CAST(N'2022-10-30' AS Date), 40000000, 35000000, 10000000, 1, 1)
INSERT [dbo].[Order] ([Id], [ProductID], [ProductName], [Status], [paymethod], [DateReceived], [DateDelivery], [PriceDelivery], [PriceReceived], [Profit], [UserId], [Amount]) VALUES (4, N'Product204', N'Kirkland Fish Oil 1000mg', N'Wait', N'Cash', CAST(N'2022-11-20' AS Date), CAST(N'2022-11-11' AS Date), 25000000, 20000000, 5000000, 2, 1)
INSERT [dbo].[Order] ([Id], [ProductID], [ProductName], [Status], [paymethod], [DateReceived], [DateDelivery], [PriceDelivery], [PriceReceived], [Profit], [UserId], [Amount]) VALUES (5, N'Product205', N'Non-GMO Soy Isoflavones', N'Wait', N'bank transfer', CAST(N'2022-12-11' AS Date), CAST(N'2022-12-01' AS Date), 30000000, 25000000, 3000000, 2, 3)
INSERT [dbo].[Order] ([Id], [ProductID], [ProductName], [Status], [paymethod], [DateReceived], [DateDelivery], [PriceDelivery], [PriceReceived], [Profit], [UserId], [Amount]) VALUES (6, N'Product206', N'Ginkgo Biloba 120mg Trunature', N'Delivery', N'Cash', CAST(N'2022-12-10' AS Date), CAST(N'2022-12-03' AS Date), 40000000, 27000000, 7000000, 2, 1)
INSERT [dbo].[Order] ([Id], [ProductID], [ProductName], [Status], [paymethod], [DateReceived], [DateDelivery], [PriceDelivery], [PriceReceived], [Profit], [UserId], [Amount]) VALUES (7, N'Product207', N'Schiff Glucosamine Plus MSM 1500mg', N'Delivery', N'Momo', CAST(N'2022-10-22' AS Date), CAST(N'2022-10-02' AS Date), 32000000, 28000000, 5000000, 3, 2)
INSERT [dbo].[Order] ([Id], [ProductID], [ProductName], [Status], [paymethod], [DateReceived], [DateDelivery], [PriceDelivery], [PriceReceived], [Profit], [UserId], [Amount]) VALUES (8, N'Product205', N'Non-GMO Soy Isoflavones', N'Wait', N'COD', CAST(N'2022-12-11' AS Date), CAST(N'2022-12-01' AS Date), 30000000, 25000000, 5000000, 3, 1)
INSERT [dbo].[Order] ([Id], [ProductID], [ProductName], [Status], [paymethod], [DateReceived], [DateDelivery], [PriceDelivery], [PriceReceived], [Profit], [UserId], [Amount]) VALUES (9, N'Product204', N'Kirkland Fish Oil 1000mg', N'Wait', N'COD', CAST(N'2022-11-20' AS Date), CAST(N'2022-11-11' AS Date), 25000000, 20000000, 5000000, 3, 1)
INSERT [dbo].[Order] ([Id], [ProductID], [ProductName], [Status], [paymethod], [DateReceived], [DateDelivery], [PriceDelivery], [PriceReceived], [Profit], [UserId], [Amount]) VALUES (10, N'Product202', N'Prenatal Multi DHA', N'Wait', N'COD', CAST(N'2022-10-10' AS Date), CAST(N'2022-09-29' AS Date), 30000000, 15000000, 40000000, 4, 4)
INSERT [dbo].[Order] ([Id], [ProductID], [ProductName], [Status], [paymethod], [DateReceived], [DateDelivery], [PriceDelivery], [PriceReceived], [Profit], [UserId], [Amount]) VALUES (11, N'Product203', N'PURITAN’S PRIDE', N'Wait', N'COD', CAST(N'2022-11-10' AS Date), CAST(N'2022-10-30' AS Date), 40000000, 35000000, 20000000, 4, 2)
INSERT [dbo].[Order] ([Id], [ProductID], [ProductName], [Status], [paymethod], [DateReceived], [DateDelivery], [PriceDelivery], [PriceReceived], [Profit], [UserId], [Amount]) VALUES (12, N'Product206', N'Ginkgo Biloba 120mg Trunature', N'Wait', N'COD', CAST(N'2022-12-10' AS Date), CAST(N'2022-12-03' AS Date), 40000000, 27000000, 14000000, 4, 2)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO


INSERT [dbo].[Product] ([ProductID], [ProductName], [quantity], [DateDelivery], [DateReceived], [PriceDelivery], [PriceReceived], [price]) VALUES (N'Product201', N'Blackmores Evening', 200, CAST(N'2022-10-10' AS Date), CAST(N'2022-10-22' AS Date), 30000000, 25000000, 15000000)
INSERT [dbo].[Product] ([ProductID], [ProductName], [quantity], [DateDelivery], [DateReceived], [PriceDelivery], [PriceReceived], [price]) VALUES (N'Product202', N'Prenatal Multi DHA', 250, CAST(N'2022-09-29' AS Date), CAST(N'2022-10-10' AS Date), 30000000, 15000000, 50000000)
INSERT [dbo].[Product] ([ProductID], [ProductName], [quantity], [DateDelivery], [DateReceived], [PriceDelivery], [PriceReceived], [price]) VALUES (N'Product203', N'PURITAN’S PRIDE', 300, CAST(N'2022-10-30' AS Date), CAST(N'2022-11-10' AS Date), 40000000, 35000000, 25000000)
INSERT [dbo].[Product] ([ProductID], [ProductName], [quantity], [DateDelivery], [DateReceived], [PriceDelivery], [PriceReceived], [price]) VALUES (N'Product204', N'Kirkland Fish Oil 1000mg', 250, CAST(N'2022-11-11' AS Date), CAST(N'2022-11-20' AS Date), 25000000, 200000000, 12000000)
INSERT [dbo].[Product] ([ProductID], [ProductName], [quantity], [DateDelivery], [DateReceived], [PriceDelivery], [PriceReceived], [price]) VALUES (N'Product205', N'Non-GMO Soy Isoflavones', 100, CAST(N'2022-12-01' AS Date), CAST(N'2022-12-11' AS Date), 30000000, 25000000, 15000000)
INSERT [dbo].[Product] ([ProductID], [ProductName], [quantity], [DateDelivery], [DateReceived], [PriceDelivery], [PriceReceived], [price]) VALUES (N'Product206', N'Ginkgo Biloba 120mg Trunature', 50, CAST(N'2022-12-03' AS Date), CAST(N'2022-12-10' AS Date), 40000000, 27000000, 14000000)
INSERT [dbo].[Product] ([ProductID], [ProductName], [quantity], [DateDelivery], [DateReceived], [PriceDelivery], [PriceReceived], [price]) VALUES (N'Product207', N'Schiff Glucosamine Plus MSM 1500mg', 150, CAST(N'2022-10-02' AS Date), CAST(N'2022-10-22' AS Date), 32000000, 28000000, 15000000)
GO


INSERT [dbo].[RevenueReport] ([ProductID], [product], [quantityReceived], [quantityDelivery], [DateDelivery], [DateReceived], [PriceDelivery], [PriceReceived], [Profitprice]) VALUES (N'Product201', N'Blackmores Evening', 100, 35, CAST(N'2022-10-10' AS Date), CAST(N'2022-10-22' AS Date), 30000000, 25000000, 5000000)
INSERT [dbo].[RevenueReport] ([ProductID], [product], [quantityReceived], [quantityDelivery], [DateDelivery], [DateReceived], [PriceDelivery], [PriceReceived], [Profitprice]) VALUES (N'Product202', N'Prenatal Multi DHA', 200, 20, CAST(N'2022-09-29' AS Date), CAST(N'2022-10-10' AS Date), 30000000, 15000000, 10000000)
INSERT [dbo].[RevenueReport] ([ProductID], [product], [quantityReceived], [quantityDelivery], [DateDelivery], [DateReceived], [PriceDelivery], [PriceReceived], [Profitprice]) VALUES (N'Product203', N'PURITAN’S PRIDE', 300, 15, CAST(N'2022-10-30' AS Date), CAST(N'2022-11-10' AS Date), 40000000, 35000000, 10000000)
INSERT [dbo].[RevenueReport] ([ProductID], [product], [quantityReceived], [quantityDelivery], [DateDelivery], [DateReceived], [PriceDelivery], [PriceReceived], [Profitprice]) VALUES (N'Product204', N'Kirkland Fish Oil 1000mg', 20, 20, CAST(N'2022-11-11' AS Date), CAST(N'2022-11-20' AS Date), 25000000, 20000000, 10000000)
INSERT [dbo].[RevenueReport] ([ProductID], [product], [quantityReceived], [quantityDelivery], [DateDelivery], [DateReceived], [PriceDelivery], [PriceReceived], [Profitprice]) VALUES (N'Product205', N'Non-GMO Soy Isoflavones', 25, 30, CAST(N'2022-12-01' AS Date), CAST(N'2022-12-11' AS Date), 30000000, 25000000, 5000000)
INSERT [dbo].[RevenueReport] ([ProductID], [product], [quantityReceived], [quantityDelivery], [DateDelivery], [DateReceived], [PriceDelivery], [PriceReceived], [Profitprice]) VALUES (N'Product206', N'Ginkgo Biloba 120mg Trunature', 20, 13, CAST(N'2022-12-03' AS Date), CAST(N'2022-12-10' AS Date), 40000000, 27000000, 7000000)
INSERT [dbo].[RevenueReport] ([ProductID], [product], [quantityReceived], [quantityDelivery], [DateDelivery], [DateReceived], [PriceDelivery], [PriceReceived], [Profitprice]) VALUES (N'Product207', N'Schiff Glucosamine Plus MSM 1500mg', 150, 120, CAST(N'2022-10-02' AS Date), CAST(N'2022-10-22' AS Date), 32000000, 28000000, 5000000)
GO


SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [Email], [Password], [Role]) VALUES (1, N'Admin', N'admin@gmail.com', N'123456', 2)
INSERT [dbo].[User] ([Id], [Name], [Email], [Password], [Role]) VALUES (2, N'ChanhTin', N'chanhtin@gmail.com', N'123456', 1)
INSERT [dbo].[User] ([Id], [Name], [Email], [Password], [Role]) VALUES (3, N'TrungTin', N'TrungTin@gmail.com', N'123456', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO


INSERT [dbo].[LoginManager] ([Username],[Password]) VALUES (N'chanhtin1', N'123456')
INSERT [dbo].[LoginManager] ([Username],[Password]) VALUES (N'chanhtin2', N'123456')
INSERT [dbo].[LoginManager] ([Username],[Password]) VALUES (N'chanhtin3', N'12356')
INSERT [dbo].[LoginManager] ([Username],[Password]) VALUES (N'trungtin1', N'123456')
INSERT [dbo].[LoginManager] ([Username],[Password]) VALUES (N'trungtin2', N'123456')
INSERT [dbo].[LoginManager] ([Username],[Password]) VALUES (N'trungtin3', N'123456')
INSERT [dbo].[LoginManager] ([Username],[Password]) VALUES (N'vana1', N'123456')
Go



