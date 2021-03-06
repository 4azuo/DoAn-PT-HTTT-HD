USE [master]
GO
/****** Object:  Database [Service_Login]    Script Date: 6/12/2017 4:59:31 PM ******/
CREATE DATABASE [Service_Login]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Service_Login', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS_2012\MSSQL\DATA\Service_Login.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Service_Login_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS_2012\MSSQL\DATA\Service_Login_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Service_Login] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Service_Login].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Service_Login] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Service_Login] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Service_Login] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Service_Login] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Service_Login] SET ARITHABORT OFF 
GO
ALTER DATABASE [Service_Login] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Service_Login] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Service_Login] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Service_Login] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Service_Login] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Service_Login] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Service_Login] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Service_Login] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Service_Login] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Service_Login] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Service_Login] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Service_Login] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Service_Login] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Service_Login] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Service_Login] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Service_Login] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Service_Login] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Service_Login] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Service_Login] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Service_Login] SET  MULTI_USER 
GO
ALTER DATABASE [Service_Login] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Service_Login] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Service_Login] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Service_Login] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Service_Login]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/12/2017 4:59:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[TenTaiKhoan] [varchar](100) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[CapPQ] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[MaCN] [varchar](10) NOT NULL,
	[MaPQ] [varchar](10) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00001', N'Test01', N'001@gmail.com', N'ehh339662332334498465131354686356656', 3, N'001@gmail.com', N'HCMCN001', N'PQ003')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00002', N'Test02', N'002@gmail.com', N'ehh339662332334498465131354686356656', 2, N'002@gmail.com', N'HCMCN001', N'PQ002')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00003', N'Test03', N'003@gmail.com', N'ehh339662332334498465131354686356656', 1, N'003@gmail.com', N'HCMCN001', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00004', N'Test04', N'004@gmail.com', N'ehh339662332334498465131354686356656', 1, N'004@gmail.com', N'HCMCN001', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00005', N'Test05', N'005@gmail.com', N'ehh339662332334498465131354686356656', 1, N'005@gmail.com', N'HCMCN001', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00006', N'Test06', N'006@gmail.com', N'ehh339662332334498465131354686356656', 1, N'006@gmail.com', N'HCMCN001', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00007', N'Test07', N'007@gmail.com', N'ehh339662332334498465131354686356656', 1, N'007@gmail.com', N'HCMCN001', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00008', N'Test08', N'008@gmail.com', N'ehh339662332334498465131354686356656', 1, N'008@gmail.com', N'HCMCN001', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00009', N'Test09', N'009@gmail.com', N'ehh339662332334498465131354686356656', 1, N'009@gmail.com', N'HCMCN001', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00010', N'Test10', N'010@gmail.com', N'ehh339662332334498465131354686356656', 2, N'010@gmail.com', N'HCMCN002', N'PQ002')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00011', N'Test11', N'011@gmail.com', N'ehh339662332334498465131354686356656', 1, N'011@gmail.com', N'HCMCN002', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00012', N'Test12', N'012@gmail.com', N'ehh339662332334498465131354686356656', 1, N'012@gmail.com', N'HCMCN002', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00013', N'Test13', N'013@gmail.com', N'ehh339662332334498465131354686356656', 1, N'013@gmail.com', N'HCMCN002', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00014', N'Test14', N'014@gmail.com', N'ehh339662332334498465131354686356656', 1, N'014@gmail.com', N'HCMCN002', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00015', N'Test15', N'015@gmail.com', N'ehh339662332334498465131354686356656', 1, N'015@gmail.com', N'HCMCN002', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00016', N'Test16', N'016@gmail.com', N'ehh339662332334498465131354686356656', 1, N'016@gmail.com', N'HCMCN002', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HCMNV00017', N'Test17', N'017@gmail.com', N'ehh339662332334498465131354686356656', 1, N'017@gmail.com', N'HCMCN002', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HNNV00001', N'Test18', N'018@gmail.com', N'ehh339662332334498465131354686356656', 2, N'018@gmail.com', N'HNCN001', N'PQ002')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HNNV00002', N'Test19', N'019@gmail.com', N'ehh339662332334498465131354686356656', 1, N'019@gmail.com', N'HNCN001', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HNNV00003', N'Test20', N'020@gmail.com', N'ehh339662332334498465131354686356656', 1, N'020@gmail.com', N'HNCN001', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HNNV00004', N'Test21', N'021@gmail.com', N'ehh339662332334498465131354686356656', 1, N'021@gmail.com', N'HNCN001', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HNNV00005', N'Test22', N'022@gmail.com', N'ehh339662332334498465131354686356656', 1, N'022@gmail.com', N'HNCN001', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HNNV00006', N'Test23', N'023@gmail.com', N'ehh339662332334498465131354686356656', 1, N'023@gmail.com', N'HNCN001', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HNNV00007', N'Test24', N'024@gmail.com', N'ehh339662332334498465131354686356656', 1, N'024@gmail.com', N'HNCN001', N'PQ001')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [TenTaiKhoan], [MatKhau], [CapPQ], [Email], [MaCN], [MaPQ]) VALUES (N'HNNV00008', N'Test25', N'025@gmail.com', N'ehh339662332334498465131354686356656', 1, N'025@gmail.com', N'HNCN001', N'PQ001')
SET ANSI_PADDING ON

GO
/****** Object:  Index [TenTaiKhoan_Unique]    Script Date: 6/12/2017 4:59:31 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [TenTaiKhoan_Unique] ON [dbo].[NhanVien]
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Service_Login] SET  READ_WRITE 
GO
