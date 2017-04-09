CREATE DATABASE [DrinkSmile]
GO
USE [DrinkSmile]
GO
/****** Object:  Table [dbo].[Bo]    Script Date: 20/03/2017 16:44:10  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bo](
	[ID] [int] NOT NULL,
	[MaBo] [int] NOT NULL,
	[MaChip] [varchar](10) NOT NULL,
	[MauSac] [nvarchar](10) NULL,
	[CoDiTat] [bit] NULL,
	[NhanDang] [nvarchar](50) NULL,
	[IDChuongTrai] [int] NOT NULL,
	[TinhTrang] [nvarchar](50) NOT NULL,
	[DaXoa] [bit] NOT NULL,
 CONSTRAINT [PK_Bo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChamSoc]    Script Date: 20/03/2017 16:44:10  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChamSoc](
	[ID] [int] NOT NULL,
	[IDPhanCong] [int] NOT NULL,
	[NgayGhiNhan] [date] NOT NULL,
	[IDBo] [int] NOT NULL,
	[LuongSuaVat] [real] NOT NULL,
	[DaDonVeSinh] [bit] NOT NULL,
	[DaChoAn] [bit] NOT NULL,
	[DaVatSua] [bit] NOT NULL,
	[TinhTrang] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChamSoc_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ChamSoc] UNIQUE NONCLUSTERED 
(
	[IDPhanCong] ASC,
	[NgayGhiNhan] ASC,
	[IDBo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 20/03/2017 16:44:10  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[ID] [int] NOT NULL,
	[MaChiNhanh] [int] NOT NULL,
	[TenChiNhanh] [nvarchar](50) NOT NULL,
	[SDT] [varchar](15) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[IDNhanVienQL] [int] NOT NULL,
	[TinhTrang] [nvarchar](50) NOT NULL,
	[DaXoa] [bit] NOT NULL,
 CONSTRAINT [PK_ChiNhanh] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietPhieuXuat]    Script Date: 20/03/2017 16:44:10  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuXuat](
	[IDPhieuXuat] [int] NOT NULL,
	[IDKhoSua] [int] NOT NULL,
	[LuongSua] [real] NOT NULL,
 CONSTRAINT [PK_ChiTietPhieuXuat] PRIMARY KEY CLUSTERED 
(
	[IDPhieuXuat] ASC,
	[IDKhoSua] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChuongTrai]    Script Date: 20/03/2017 16:44:10  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuongTrai](
	[ID] [int] NOT NULL,
	[MaChuong] [int] NOT NULL,
	[TenChuong] [nvarchar](50) NOT NULL,
	[SucChua] [int] NOT NULL,
	[IDChiNhanh] [int] NOT NULL,
	[TinhTrang] [nvarchar](50) NOT NULL,
	[DaXoa] [bit] NOT NULL,
 CONSTRAINT [PK_ChuongTrai] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhoSua]    Script Date: 20/03/2017 16:44:10  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoSua](
	[ID] [int] NOT NULL,
	[MaKho] [int] NOT NULL,
	[TenKho] [nvarchar](50) NOT NULL,
	[SucChua] [real] NOT NULL,
	[LuongSuaTon] [real] NOT NULL,
	[IDChiNhanh] [int] NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[TinhTrang] [nvarchar](50) NOT NULL,
	[DaXoa] [bit] NOT NULL,
 CONSTRAINT [PK_KhoSua] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 20/03/2017 16:44:10  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[ID] [int] NOT NULL,
	[MaNCC] [int] NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[TinhTrang] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 20/03/2017 16:44:10  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[ID] [int] NOT NULL,
	[MaNV] [int] NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](10) NOT NULL,
	[NgaySinh] [date] NULL,
	[SDT] [varchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[TenTaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[TinhTrang] [nvarchar](50) NOT NULL,
	[DaXoa] [bit] NOT NULL,
	[IDChiNhanh] [int] NOT NULL,
	[IDQuyen] [int] NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 20/03/2017 16:44:10  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[ID] [int] NOT NULL,
	[NgayBD] [date] NOT NULL,
	[NgayKT] [date] NOT NULL,
	[IDNhanVien] [int] NOT NULL,
	[IDChuongTrai] [int] NOT NULL,
	[NgayTrongTuan] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_PhanCong_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_PhanCong] UNIQUE NONCLUSTERED 
(
	[NgayBD] ASC,
	[NgayKT] ASC,
	[IDNhanVien] ASC,
	[IDChuongTrai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 20/03/2017 16:44:10  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[ID] [int] NOT NULL,
	[TenPhanQuyen] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhapBo]    Script Date: 20/03/2017 16:44:10  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhapBo](
	[ID] [int] NOT NULL,
	[NgayLap] [date] NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[SoLuongBo] [int] NOT NULL,
	[IDNhaCungCap] [int] NOT NULL,
	[IDNhanVien] [int] NOT NULL,
	[IDChiNhanh] [int] NOT NULL,
	[DaHuy] [bit] NOT NULL,
 CONSTRAINT [PK_PhieuNhapBo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuXuat]    Script Date: 20/03/2017 16:44:10  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuat](
	[ID] [int] NOT NULL,
	[NgayLap] [date] NOT NULL,
	[NgayXuat] [date] NOT NULL,
	[TongLuongSua] [real] NOT NULL,
	[IDNhanVien] [int] NOT NULL,
	[DaHuy] [bit] NOT NULL,
	[LyDo] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhieuXuat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinhTrangBo]    Script Date: 20/03/2017 16:44:10  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrangBo](
	[IDChamSoc] [int] NOT NULL,
	[ThoiGianGhiNhan] [datetime] NOT NULL,
	[ChieuCao] [int] NOT NULL,
	[CanNang] [int] NOT NULL,
 CONSTRAINT [PK_TinhTrangBo] PRIMARY KEY CLUSTERED 
(
	[IDChamSoc] ASC,
	[ThoiGianGhiNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Bo]  WITH CHECK ADD  CONSTRAINT [FK_Bo_ChuongTrai] FOREIGN KEY([IDChuongTrai])
REFERENCES [dbo].[ChuongTrai] ([ID])
GO
ALTER TABLE [dbo].[Bo] CHECK CONSTRAINT [FK_Bo_ChuongTrai]
GO
ALTER TABLE [dbo].[ChamSoc]  WITH CHECK ADD  CONSTRAINT [FK_ChamSoc_Bo] FOREIGN KEY([IDBo])
REFERENCES [dbo].[Bo] ([ID])
GO
ALTER TABLE [dbo].[ChamSoc] CHECK CONSTRAINT [FK_ChamSoc_Bo]
GO
ALTER TABLE [dbo].[ChamSoc]  WITH CHECK ADD  CONSTRAINT [FK_ChamSoc_PhanCong] FOREIGN KEY([IDPhanCong])
REFERENCES [dbo].[PhanCong] ([ID])
GO
ALTER TABLE [dbo].[ChamSoc] CHECK CONSTRAINT [FK_ChamSoc_PhanCong]
GO
ALTER TABLE [dbo].[ChiNhanh]  WITH CHECK ADD  CONSTRAINT [FK_ChiNhanh_NhanVien] FOREIGN KEY([IDNhanVienQL])
REFERENCES [dbo].[NhanVien] ([ID])
GO
ALTER TABLE [dbo].[ChiNhanh] CHECK CONSTRAINT [FK_ChiNhanh_NhanVien]
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuXuat_KhoSua] FOREIGN KEY([IDKhoSua])
REFERENCES [dbo].[KhoSua] ([ID])
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat] CHECK CONSTRAINT [FK_ChiTietPhieuXuat_KhoSua]
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuXuat_PhieuXuat] FOREIGN KEY([IDPhieuXuat])
REFERENCES [dbo].[PhieuXuat] ([ID])
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat] CHECK CONSTRAINT [FK_ChiTietPhieuXuat_PhieuXuat]
GO
ALTER TABLE [dbo].[ChuongTrai]  WITH CHECK ADD  CONSTRAINT [FK_ChuongTrai_ChiNhanh] FOREIGN KEY([IDChiNhanh])
REFERENCES [dbo].[ChiNhanh] ([ID])
GO
ALTER TABLE [dbo].[ChuongTrai] CHECK CONSTRAINT [FK_ChuongTrai_ChiNhanh]
GO
ALTER TABLE [dbo].[KhoSua]  WITH CHECK ADD  CONSTRAINT [FK_KhoSua_ChiNhanh] FOREIGN KEY([IDChiNhanh])
REFERENCES [dbo].[ChiNhanh] ([ID])
GO
ALTER TABLE [dbo].[KhoSua] CHECK CONSTRAINT [FK_KhoSua_ChiNhanh]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChiNhanh] FOREIGN KEY([IDChiNhanh])
REFERENCES [dbo].[ChiNhanh] ([ID])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChiNhanh]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhanQuyen] FOREIGN KEY([IDQuyen])
REFERENCES [dbo].[PhanQuyen] ([ID])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_PhanQuyen]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_ChuongTrai] FOREIGN KEY([IDChuongTrai])
REFERENCES [dbo].[ChuongTrai] ([ID])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_ChuongTrai]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_NhanVien] FOREIGN KEY([IDNhanVien])
REFERENCES [dbo].[NhanVien] ([ID])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_NhanVien]
GO
ALTER TABLE [dbo].[PhieuNhapBo]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapBo_ChiNhanh] FOREIGN KEY([IDChiNhanh])
REFERENCES [dbo].[ChiNhanh] ([ID])
GO
ALTER TABLE [dbo].[PhieuNhapBo] CHECK CONSTRAINT [FK_PhieuNhapBo_ChiNhanh]
GO
ALTER TABLE [dbo].[PhieuNhapBo]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapBo_NhaCungCap] FOREIGN KEY([IDNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([ID])
GO
ALTER TABLE [dbo].[PhieuNhapBo] CHECK CONSTRAINT [FK_PhieuNhapBo_NhaCungCap]
GO
ALTER TABLE [dbo].[PhieuNhapBo]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapBo_NhanVien] FOREIGN KEY([IDNhanVien])
REFERENCES [dbo].[NhanVien] ([ID])
GO
ALTER TABLE [dbo].[PhieuNhapBo] CHECK CONSTRAINT [FK_PhieuNhapBo_NhanVien]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuat_NhanVien] FOREIGN KEY([IDNhanVien])
REFERENCES [dbo].[NhanVien] ([ID])
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PhieuXuat_NhanVien]
GO
ALTER TABLE [dbo].[TinhTrangBo]  WITH CHECK ADD  CONSTRAINT [FK_TinhTrangBo_ChamSoc] FOREIGN KEY([IDChamSoc])
REFERENCES [dbo].[ChamSoc] ([ID])
GO
ALTER TABLE [dbo].[TinhTrangBo] CHECK CONSTRAINT [FK_TinhTrangBo_ChamSoc]
GO
