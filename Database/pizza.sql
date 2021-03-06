USE [master]
GO
/****** Object:  Database [Pizza]    Script Date: 5/12/2022 8:54:27 PM ******/
CREATE DATABASE [Pizza]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pizza', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Pizza.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pizza_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Pizza_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Pizza] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pizza].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pizza] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pizza] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pizza] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pizza] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pizza] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pizza] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pizza] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pizza] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pizza] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pizza] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pizza] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pizza] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pizza] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pizza] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pizza] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pizza] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pizza] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pizza] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pizza] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pizza] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pizza] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pizza] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pizza] SET RECOVERY FULL 
GO
ALTER DATABASE [Pizza] SET  MULTI_USER 
GO
ALTER DATABASE [Pizza] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pizza] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pizza] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pizza] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pizza] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pizza] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pizza', N'ON'
GO
ALTER DATABASE [Pizza] SET QUERY_STORE = OFF
GO
USE [Pizza]
GO
/****** Object:  Table [dbo].[drinks]    Script Date: 5/12/2022 8:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drinks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [money] NULL,
	[image] [nvarchar](max) NULL,
 CONSTRAINT [PK_drinks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_pizzas]    Script Date: 5/12/2022 8:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_pizzas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[pizza_id] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_order_pizzas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 5/12/2022 8:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [nvarchar](50) NULL,
	[customer_address] [nvarchar](500) NULL,
	[customer_phone] [nvarchar](20) NULL,
	[total_price] [money] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pizzas]    Script Date: 5/12/2022 8:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pizzas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[size_id] [int] NULL,
 CONSTRAINT [PK_pizzas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sizes]    Script Date: 5/12/2022 8:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_sizes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[drinks] ON 

INSERT [dbo].[drinks] ([id], [name], [price], [image]) VALUES (1, N'Cola', 15000.0000, N'https://www.myamericanmarket.com/26686-large_default/coca-cola-classic.jpg')
INSERT [dbo].[drinks] ([id], [name], [price], [image]) VALUES (2, N'Fanta', 15000.0000, N'https://www.myamericanmarket.com/2464-large_default/clearance-fanta-grape-soda.jpg')
INSERT [dbo].[drinks] ([id], [name], [price], [image]) VALUES (3, N'Monster Mango', 80000.0000, N'https://www.myamericanmarket.com/31791-large_default/monster-mango-loco-can.jpg')
SET IDENTITY_INSERT [dbo].[drinks] OFF
GO
SET IDENTITY_INSERT [dbo].[order_pizzas] ON 

INSERT [dbo].[order_pizzas] ([id], [order_id], [pizza_id], [quantity]) VALUES (1, 1, 9, 2)
INSERT [dbo].[order_pizzas] ([id], [order_id], [pizza_id], [quantity]) VALUES (2, 1, 7, 2)
INSERT [dbo].[order_pizzas] ([id], [order_id], [pizza_id], [quantity]) VALUES (3, 1, 6, 2)
INSERT [dbo].[order_pizzas] ([id], [order_id], [pizza_id], [quantity]) VALUES (4, 1, 13, 2)
INSERT [dbo].[order_pizzas] ([id], [order_id], [pizza_id], [quantity]) VALUES (5, 1, 8, 2)
INSERT [dbo].[order_pizzas] ([id], [order_id], [pizza_id], [quantity]) VALUES (6, 2, 7, 3)
INSERT [dbo].[order_pizzas] ([id], [order_id], [pizza_id], [quantity]) VALUES (7, 2, 8, 2)
INSERT [dbo].[order_pizzas] ([id], [order_id], [pizza_id], [quantity]) VALUES (8, 2, 13, 1)
INSERT [dbo].[order_pizzas] ([id], [order_id], [pizza_id], [quantity]) VALUES (9, 2, 9, 1)
INSERT [dbo].[order_pizzas] ([id], [order_id], [pizza_id], [quantity]) VALUES (10, 3, 14, 1)
INSERT [dbo].[order_pizzas] ([id], [order_id], [pizza_id], [quantity]) VALUES (11, 3, 13, 1)
INSERT [dbo].[order_pizzas] ([id], [order_id], [pizza_id], [quantity]) VALUES (12, 3, 12, 1)
INSERT [dbo].[order_pizzas] ([id], [order_id], [pizza_id], [quantity]) VALUES (13, 4, 9, 3)
INSERT [dbo].[order_pizzas] ([id], [order_id], [pizza_id], [quantity]) VALUES (14, 4, 8, 2)
SET IDENTITY_INSERT [dbo].[order_pizzas] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [customer_name], [customer_address], [customer_phone], [total_price]) VALUES (1, N'Phan Tiến Anh', N'27 Lê Văn Lương', N'0947411568', 890000.0000)
INSERT [dbo].[orders] ([id], [customer_name], [customer_address], [customer_phone], [total_price]) VALUES (2, N'A', N'A', N'0123456789', 603000.0000)
INSERT [dbo].[orders] ([id], [customer_name], [customer_address], [customer_phone], [total_price]) VALUES (3, N'C', N'A', N'01212489732', 287000.0000)
INSERT [dbo].[orders] ([id], [customer_name], [customer_address], [customer_phone], [total_price]) VALUES (4, N'D', N'D', N'012378', 545000.0000)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[pizzas] ON 

INSERT [dbo].[pizzas] ([id], [name], [description], [image], [size_id]) VALUES (6, N'Pizza Rau Củ(Xốt Bơ Tỏi)', N'Thanh Nhẹ Với Ô Liu Đen Tuyệt Hảo, Cà Chua Bi Tươi Ngon, Nấm, Thơm, Bắp, Hành Tây Và Phô Mai Mozzarella Cho Bạn Bữa Tiệc Rau Củ Tròn Vị', N'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Rau_Cu_400x275.jpg', 1)
INSERT [dbo].[pizzas] ([id], [name], [description], [image], [size_id]) VALUES (7, N'Pizza Gấp Đôi Nhân Phủ Hải Sản Xốt Pesto', N'Pizza Hải Sản Xốt Pesto Với Hải Sản (Tôm, Mực) Nhân Đôi Cùng Với Nấm Trên Nền Xốt Pesto Đặc Trưng, Phủ Phô Mai Mozzarella Từ New Zealand Và Quế Tây.', N'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Gap_Doi_Nhan_Phu_Hai_San_Xot_Pesto_400x275.jpg', 2)
INSERT [dbo].[pizzas] ([id], [name], [description], [image], [size_id]) VALUES (8, N'Pizza Pepperoni', N'Pepperoni Với Phô Mai Mozzarella Tuyệt Hảo', N'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Xuc_Xich_Nuong_400x275.jpg', 3)
INSERT [dbo].[pizzas] ([id], [name], [description], [image], [size_id]) VALUES (9, N'Pizza Pepperoni', N'Pepperoni Với Phô Mai Mozzarella Tuyệt Hảo', N'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Xuc_Xich_Nuong_400x275.jpg', 4)
INSERT [dbo].[pizzas] ([id], [name], [description], [image], [size_id]) VALUES (10, N'Pizza Rau Củ(Xốt Bơ Tỏi)', N'Thanh Nhẹ Với Ô Liu Đen Tuyệt Hảo, Cà Chua Bi Tươi Ngon, Nấm, Thơm, Bắp, Hành Tây Và Phô Mai Mozzarella Cho Bạn Bữa Tiệc Rau Củ Tròn Vị', N'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Rau_Cu_400x275.jpg', 5)
INSERT [dbo].[pizzas] ([id], [name], [description], [image], [size_id]) VALUES (12, N'Pizza Gà Nướng Nấm', N'Pizza Gà Nướng Nấm Trong Cuộc Phiêu Lưu Vị Giác Với Thịt Gà, Nấm, Thơm, Cà Rốt Và Rau Mầm Phủ Xốt Tiêu Đen Thơm Nồng', N'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Ga_Nuong_Nam_400x275.jpg', 6)
INSERT [dbo].[pizzas] ([id], [name], [description], [image], [size_id]) VALUES (13, N'Pizza Gà Nướng Nấm', N'Mang Hương Vị Biển Cả Nhẹ Nhàng Với Cá Ngừ, Thanh Cua, HàNh Tây, Thơm Trên Nền Xốt Pesto', N'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Ca_Ngu_400x275.jpg', 7)
INSERT [dbo].[pizzas] ([id], [name], [description], [image], [size_id]) VALUES (14, N'Pizza Rau Củ (Sốt Cà Chua)', N'Thanh Nhẹ Với Ô Liu Đen Tuyệt Hảo, Cà Chua Bi Tươi Ngon, Nấm, Thơm, Bắp, Hành Tây Và Phô Mai Mozzarella Cho Bạn Bữa Tiệc Rau Củ Tròn Vị', N'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Rau_Cu_400x275.jpg', 8)
INSERT [dbo].[pizzas] ([id], [name], [description], [image], [size_id]) VALUES (15, N'Pizza Bò BBQ Xốt Cay Hàn Quốc', N'Thịt Bò Úc, Thơm Trên Nền Xốt Hàn Quốc Cay Nồng, Phủ Rau Mầm Và Mè Rang', N'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Bo_BBQ_Xot_Cay_Han_Quoc_400x275.jpg', 9)
INSERT [dbo].[pizzas] ([id], [name], [description], [image], [size_id]) VALUES (16, N'Pizza Phô Mai Cao Cấp', N'Với 3 LớP Phô Mai Mozzarella VàNg ÓNg Quyến Rũ', N'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Pho_Mai_Cao_Cap_400x275.jpg', 10)
INSERT [dbo].[pizzas] ([id], [name], [description], [image], [size_id]) VALUES (17, N'Pizza Hải Sản Viền Phô Mai 3 Vị', N'Tôm, Hành Tây, Ớt Chuông Đỏ, Thơm, Ô Liu, Ngò Tây, Phô Mai Mozzarella, Viền Phô Mai Hai Vị, Xốt Bơ Tỏi.', N'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Tom_Vien_Pho_Mai_3_Vi_400x275.jpg', 11)
SET IDENTITY_INSERT [dbo].[pizzas] OFF
GO
SET IDENTITY_INSERT [dbo].[sizes] ON 

INSERT [dbo].[sizes] ([id], [name], [price]) VALUES (1, N'12', 79000.0000)
INSERT [dbo].[sizes] ([id], [name], [price]) VALUES (2, N'12', 79000.0000)
INSERT [dbo].[sizes] ([id], [name], [price]) VALUES (3, N'12', 79000.0000)
INSERT [dbo].[sizes] ([id], [name], [price]) VALUES (4, N'16', 129000.0000)
INSERT [dbo].[sizes] ([id], [name], [price]) VALUES (5, N'12', 79000.0000)
INSERT [dbo].[sizes] ([id], [name], [price]) VALUES (6, N'16', 129000.0000)
INSERT [dbo].[sizes] ([id], [name], [price]) VALUES (7, N'12', 79000.0000)
INSERT [dbo].[sizes] ([id], [name], [price]) VALUES (8, N'12', 79000.0000)
INSERT [dbo].[sizes] ([id], [name], [price]) VALUES (9, N'16', 129000.0000)
INSERT [dbo].[sizes] ([id], [name], [price]) VALUES (10, N'12', 79000.0000)
INSERT [dbo].[sizes] ([id], [name], [price]) VALUES (11, N'16', 129000.0000)
SET IDENTITY_INSERT [dbo].[sizes] OFF
GO
ALTER TABLE [dbo].[order_pizzas]  WITH CHECK ADD  CONSTRAINT [FK_order_pizzas_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_pizzas] CHECK CONSTRAINT [FK_order_pizzas_orders]
GO
ALTER TABLE [dbo].[order_pizzas]  WITH CHECK ADD  CONSTRAINT [FK_order_pizzas_pizzas] FOREIGN KEY([pizza_id])
REFERENCES [dbo].[pizzas] ([id])
GO
ALTER TABLE [dbo].[order_pizzas] CHECK CONSTRAINT [FK_order_pizzas_pizzas]
GO
ALTER TABLE [dbo].[pizzas]  WITH CHECK ADD  CONSTRAINT [FK_pizzas_sizes1] FOREIGN KEY([size_id])
REFERENCES [dbo].[sizes] ([id])
GO
ALTER TABLE [dbo].[pizzas] CHECK CONSTRAINT [FK_pizzas_sizes1]
GO
USE [master]
GO
ALTER DATABASE [Pizza] SET  READ_WRITE 
GO
