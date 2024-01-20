USE [banhang]
GO
/****** Object:  Table [dbo].[hang]    Script Date: 18/01/2024 5:46:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hang](
	[mahang] [nvarchar](50) NOT NULL,
	[tenhang] [nvarchar](50) NOT NULL,
	[soluongton] [bigint] NOT NULL,
	[gia] [bigint] NOT NULL,
	[anh] [nvarchar](50) NOT NULL,
	[chatlieu] [nvarchar](50) NOT NULL,
	[maloai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_hang] PRIMARY KEY CLUSTERED 
(
	[mahang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 18/01/2024 5:46:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[makh] [bigint] IDENTITY(1,1) NOT NULL,
	[tenkh] [nvarchar](50) NOT NULL,
	[diachi] [nvarchar](50) NOT NULL,
	[sdt] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[tendn] [nvarchar](50) NOT NULL,
	[mk] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_khachhang] PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chitiethd]    Script Date: 18/01/2024 5:46:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitiethd](
	[machitiet] [bigint] IDENTITY(1,1) NOT NULL,
	[mahang] [nvarchar](50) NOT NULL,
	[soluongmua] [bigint] NOT NULL,
	[damua] [bit] NOT NULL,
	[mahd] [bigint] NOT NULL,
 CONSTRAINT [PK_chitiethd] PRIMARY KEY CLUSTERED 
(
	[machitiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 18/01/2024 5:46:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[mahd] [bigint] IDENTITY(1,1) NOT NULL,
	[ngaymua] [date] NOT NULL,
	[damua] [bit] NOT NULL,
	[makh] [bigint] NOT NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[mahd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VLichSuMuaHang]    Script Date: 18/01/2024 5:46:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VLichSuMuaHang]
AS
SELECT dbo.hang.mahang, dbo.hang.tenhang, dbo.chitiethd.soluongmua, dbo.hang.gia, dbo.khachhang.makh, dbo.hang.gia * dbo.chitiethd.soluongmua AS thanhtien, dbo.chitiethd.damua, dbo.hoadon.ngaymua, dbo.hoadon.mahd
FROM     dbo.hoadon INNER JOIN
                  dbo.khachhang ON dbo.hoadon.makh = dbo.khachhang.makh INNER JOIN
                  dbo.chitiethd ON dbo.hoadon.mahd = dbo.chitiethd.mahd INNER JOIN
                  dbo.hang ON dbo.chitiethd.mahang = dbo.hang.mahang
GO
/****** Object:  View [dbo].[VAdminXacNhan]    Script Date: 18/01/2024 5:46:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VAdminXacNhan]
AS
SELECT dbo.chitiethd.machitiet, dbo.khachhang.tenkh, dbo.hang.tenhang, dbo.hang.gia, dbo.chitiethd.soluongmua, dbo.chitiethd.soluongmua * dbo.hang.gia AS thanhtien, dbo.hoadon.ngaymua, dbo.hoadon.mahd, dbo.chitiethd.damua
FROM     dbo.hoadon INNER JOIN
                  dbo.khachhang ON dbo.hoadon.makh = dbo.khachhang.makh INNER JOIN
                  dbo.chitiethd ON dbo.hoadon.mahd = dbo.chitiethd.mahd INNER JOIN
                  dbo.hang ON dbo.chitiethd.mahang = dbo.hang.mahang
WHERE  (dbo.chitiethd.damua = 0)
GO
/****** Object:  Table [dbo].[loai]    Script Date: 18/01/2024 5:46:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai](
	[maloai] [nvarchar](50) NOT NULL,
	[tenloai] [nvarchar](50) NOT NULL,
	[nhacungcap] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_loai] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nvquanly]    Script Date: 18/01/2024 5:46:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nvquanly](
	[manv] [nvarchar](50) NOT NULL,
	[tennv] [nvarchar](50) NOT NULL,
	[diachi] [nvarchar](50) NOT NULL,
	[sdt] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[chucvu] [nvarchar](50) NOT NULL,
	[tendn] [nvarchar](50) NOT NULL,
	[mk] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_nvquanly] PRIMARY KEY CLUSTERED 
(
	[manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[chitiethd] ON 

INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (1, N'f1', 1, 1, 1)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (2, N'i5', 2, 1, 1)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (3, N'm5', 1, 1, 1)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (4, N'm1', 1, 1, 1)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (5, N'i5', 1, 1, 2)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (6, N'm1', 1, 1, 2)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (7, N'm2', 1, 0, 3)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (8, N'm6', 2, 0, 3)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (9, N'r4', 1, 0, 3)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (10, N'm5', 1, 0, 3)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (11, N'i5', 1, 1, 4)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (12, N'f3', 1, 1, 4)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (13, N'i1', 1, 0, 5)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (14, N'f1', 1, 0, 5)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (15, N'f2', 1, 0, 5)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (16, N'i5', 1, 0, 5)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (17, N'm3', 1, 1, 6)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (18, N's4', 1, 1, 6)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (19, N'f1', 1, 0, 7)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (20, N'i5', 1, 0, 7)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (21, N'i4', 1, 0, 7)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (22, N'r3', 1, 0, 8)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (23, N's4', 1, 0, 8)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (24, N'm6', 1, 0, 8)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (25, N'f1', 4, 1, 9)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (26, N'f2', 2, 1, 9)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (27, N'i4', 1, 1, 9)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (28, N's2', 1, 0, 10)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (29, N'f2', 2, 0, 10)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (30, N'm5', 1, 0, 11)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (31, N'f1', 1, 0, 11)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (32, N'i5', 1, 0, 11)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (33, N'i3', 1, 1, 12)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (34, N'i4', 1, 1, 12)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (35, N'f1', 1, 1, 12)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (36, N'i4', 1, 0, 13)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (37, N'i3', 5, 0, 13)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (38, N'f3', 2, 0, 13)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (39, N'c1', 3, 0, 13)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (40, N'f3', 1, 0, 14)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (41, N'f1', 3, 0, 14)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (42, N'f2', 1, 0, 14)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (43, N'm1', 4, 0, 14)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (44, N'f3', 1, 1, 15)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (45, N'c1', 1, 1, 15)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (46, N'f1', 1, 1, 15)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (47, N'i4', 1, 1, 15)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (48, N'i1', 8, 1, 16)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (49, N'f1', 1, 0, 17)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (50, N'i5', 2, 0, 17)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (51, N'i4', 1, 0, 17)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (52, N'i1', 1, 1, 18)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (53, N'i4', 1, 1, 18)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (54, N'c1', 6, 1, 19)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (55, N'i4', 2, 1, 19)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (56, N'm5', 5, 0, 20)
INSERT [dbo].[chitiethd] ([machitiet], [mahang], [soluongmua], [damua], [mahd]) VALUES (57, N'i3', 1, 0, 20)
SET IDENTITY_INSERT [dbo].[chitiethd] OFF
GO
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'c1', N'castrol power 1', 20, 111111, N'image-hang-them/c1.jpg', N'bantonghop', N'c')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'f1', N'fuchs sikolene scoot sport', 50, 200000, N'image-hang/f1.jpg', N'bantonghop', N'f')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'f2', N'fuchs pro4', 20, 275000, N'image-hang/f2.jpg', N'tonghop', N'f')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'f3', N'fuchs comp4', 30, 180000, N'image-hang/f3.jpg', N'bantonghop', N'f')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'i1', N'ipone stroke 4 racing', 30, 495000, N'image-hang/i1.jpg', N'tonghop', N'i')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'i2', N'ipone katana', 50, 385000, N'image-hang/i2.jpg', N'tonghop', N'i')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'i3', N'ipone scoot', 70, 200000, N'image-hang/i3.jpg', N'bantonghop', N'i')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'i4', N'ipone katana scoot', 50, 330000, N'image-hang/i4.jpg', N'tonghop', N'i')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'i5', N'ipone 10.4', 150, 180000, N'image-hang/i5.jpg', N'bantonghop', N'i')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'm1', N'motul 3100 gold', 100, 115000, N'image-hang/m11.jpg', N'bantonghop', N'm')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'm2', N'motul 300v', 50, 400000, N'image-hang/m22.jpg', N'tonghop', N'm')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'm3', N'hotul h-tech 100', 200, 260000, N'image-hang/m33.jpg', N'tonghop', N'm')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'm4', N'motul scooter power', 100, 165000, N'image-hang/m44.jpg', N'bantonghop', N'm')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'm5', N'motul scooter expert', 50, 120000, N'image-hang/m55.jpg', N'gockhoang', N'm')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'm6', N'motul scooter LE', 100, 95000, N'image-hang/m66.jpg', N'gockhoang', N'm')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'r1', N'repsol smarter scooter', 50, 200000, N'image-hang/r1.jpg', N'bantonghop', N'r')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'r2', N'repsol racing', 100, 280000, N'image-hang/r2.jpg', N'tonghop', N'r')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'r3', N'repsol mxr platinum', 20, 170000, N'image-hang/r3.jpg', N'bantonghop', N'r')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'r4', N'repsol smarter synthetic', 40, 250000, N'image-hang/r4.jpg', N'tonghop', N'r')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N's1', N'shell advance ultra', 50, 250000, N'image-hang/s1.jpg', N'tonghop', N's')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N's2', N'shell advance scooter', 100, 100000, N'image-hang/s2.jpg', N'bantonghop', N's')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N's3', N'shell advance 4T', 50, 130000, N'image-hang/s3.jpg', N'bantonghop', N's')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N's4', N'shell motocycle', 20, 80000, N'image-hang/s4.jpg', N'gockhoang', N's')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'y1', N'yamaha xeso', 49, 98000, N'image-hang-them/y1.jpg', N'gockhoang', N'y')
INSERT [dbo].[hang] ([mahang], [tenhang], [soluongton], [gia], [anh], [chatlieu], [maloai]) VALUES (N'y2', N'yamaha xeso 2', 2, 100000, N'image-hang-them/y2.jpg', N'bantonghop', N'y')
GO
SET IDENTITY_INSERT [dbo].[hoadon] ON 

INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (1, CAST(N'2023-08-14' AS Date), 0, 2)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (2, CAST(N'2023-08-14' AS Date), 0, 2)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (3, CAST(N'2023-08-14' AS Date), 0, 1)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (4, CAST(N'2023-08-14' AS Date), 0, 1)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (5, CAST(N'2023-08-14' AS Date), 0, 9)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (6, CAST(N'2023-08-14' AS Date), 0, 9)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (7, CAST(N'2023-08-14' AS Date), 0, 9)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (8, CAST(N'2023-08-14' AS Date), 0, 9)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (9, CAST(N'2023-08-14' AS Date), 0, 4)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (10, CAST(N'2023-08-14' AS Date), 0, 4)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (11, CAST(N'2023-08-17' AS Date), 0, 2)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (12, CAST(N'2023-08-18' AS Date), 0, 12)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (13, CAST(N'2023-08-18' AS Date), 0, 2)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (14, CAST(N'2023-08-18' AS Date), 0, 15)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (15, CAST(N'2023-08-18' AS Date), 0, 15)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (16, CAST(N'2023-08-18' AS Date), 0, 27)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (17, CAST(N'2023-08-19' AS Date), 0, 2)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (18, CAST(N'2023-09-07' AS Date), 0, 2)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (19, CAST(N'2023-11-18' AS Date), 0, 15)
INSERT [dbo].[hoadon] ([mahd], [ngaymua], [damua], [makh]) VALUES (20, CAST(N'2023-11-27' AS Date), 0, 15)
SET IDENTITY_INSERT [dbo].[hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[khachhang] ON 

INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt], [email], [tendn], [mk]) VALUES (1, N'Lê abc', N'Sịa', N'4323', N'abc@gmail.com', N'abc', N'123')
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt], [email], [tendn], [mk]) VALUES (2, N'zed', N'Huế', N'2011', N'zed@gmail.com', N'zed', N'555')
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt], [email], [tendn], [mk]) VALUES (3, N'Lê Nguyễn', N'Đà Nẵng', N'22222', N'g@gmail.com', N'ggg', N'123')
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt], [email], [tendn], [mk]) VALUES (4, N'garen', N'Sịa', N'5555555', N'garen@gmail.com', N'garen', N'123')
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt], [email], [tendn], [mk]) VALUES (9, N'jessss', N'van can', N'22222', N'gg@gmail.com', N'hh', N'456')
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt], [email], [tendn], [mk]) VALUES (10, N'thi1405', N'abcd', N'12265656', N'ggg@gmail.com', N'thi123', N'1234')
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt], [email], [tendn], [mk]) VALUES (12, N'hhhh', N'hh', N'123', N'hhh@gmail.com', N'hhh', N'123')
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt], [email], [tendn], [mk]) VALUES (13, N'le van b', N'hue', N'151515', N'b@gmail.com', N'leb', N'123')
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt], [email], [tendn], [mk]) VALUES (14, N'darius ', N'hhhhh', N'456798', N'dd@gmail.com', N'darius', N'123')
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt], [email], [tendn], [mk]) VALUES (15, N'thi le', N'tthue', N'1122224444', N'thi@gmail.com', N'thi', N'123')
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt], [email], [tendn], [mk]) VALUES (27, N'k', N'sia', N'123', N'k@gmail.com', N'kk', N'123')
SET IDENTITY_INSERT [dbo].[khachhang] OFF
GO
INSERT [dbo].[loai] ([maloai], [tenloai], [nhacungcap]) VALUES (N'c', N'castrol', N'castrol')
INSERT [dbo].[loai] ([maloai], [tenloai], [nhacungcap]) VALUES (N'f', N'fuchs', N'fuchs')
INSERT [dbo].[loai] ([maloai], [tenloai], [nhacungcap]) VALUES (N'i', N'ipone', N'ipone')
INSERT [dbo].[loai] ([maloai], [tenloai], [nhacungcap]) VALUES (N'm', N'motul', N'motul')
INSERT [dbo].[loai] ([maloai], [tenloai], [nhacungcap]) VALUES (N'r', N'repsol', N'repsol')
INSERT [dbo].[loai] ([maloai], [tenloai], [nhacungcap]) VALUES (N's', N'shell', N'shell')
INSERT [dbo].[loai] ([maloai], [tenloai], [nhacungcap]) VALUES (N'y', N'yamaha', N'yamaha')
GO
INSERT [dbo].[nvquanly] ([manv], [tennv], [diachi], [sdt], [email], [chucvu], [tendn], [mk]) VALUES (N'nv1', N'Nguy?n Thành', N'Hu?', N'012555', N'thanh@gmail.com', N'quanlyhang', N'thanh444', N'123')
INSERT [dbo].[nvquanly] ([manv], [tennv], [diachi], [sdt], [email], [chucvu], [tendn], [mk]) VALUES (N'nv2', N'Nguy?n Van A', N'Ðà N?ng', N'05555554', N'azz@gmail.com', N'quanlyhang', N'a123456', N'444')
INSERT [dbo].[nvquanly] ([manv], [tennv], [diachi], [sdt], [email], [chucvu], [tendn], [mk]) VALUES (N'nv3', N'Lê H?u B', N'Hu?', N'012554168', N'lehuub@gmail.com', N'quanlyhoadon', N'huub123', N'789')
INSERT [dbo].[nvquanly] ([manv], [tennv], [diachi], [sdt], [email], [chucvu], [tendn], [mk]) VALUES (N'nv4', N'Nguy?n Van C', N'tphcm', N'4521131', N'cccc@gmail.com', N'quanlykhachhang', N'c754', N'123456')
GO
ALTER TABLE [dbo].[chitiethd]  WITH CHECK ADD  CONSTRAINT [FK_chitiethd_hang] FOREIGN KEY([mahang])
REFERENCES [dbo].[hang] ([mahang])
GO
ALTER TABLE [dbo].[chitiethd] CHECK CONSTRAINT [FK_chitiethd_hang]
GO
ALTER TABLE [dbo].[chitiethd]  WITH CHECK ADD  CONSTRAINT [FK_chitiethd_hoadon] FOREIGN KEY([mahd])
REFERENCES [dbo].[hoadon] ([mahd])
GO
ALTER TABLE [dbo].[chitiethd] CHECK CONSTRAINT [FK_chitiethd_hoadon]
GO
ALTER TABLE [dbo].[hang]  WITH CHECK ADD  CONSTRAINT [FK_hang_loai] FOREIGN KEY([maloai])
REFERENCES [dbo].[loai] ([maloai])
GO
ALTER TABLE [dbo].[hang] CHECK CONSTRAINT [FK_hang_loai]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_khachhang] FOREIGN KEY([makh])
REFERENCES [dbo].[khachhang] ([makh])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_khachhang]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "hang"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "khachhang"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "chitiethd"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VAdminXacNhan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VAdminXacNhan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "khachhang"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "chitiethd"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "hang"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VLichSuMuaHang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VLichSuMuaHang'
GO
