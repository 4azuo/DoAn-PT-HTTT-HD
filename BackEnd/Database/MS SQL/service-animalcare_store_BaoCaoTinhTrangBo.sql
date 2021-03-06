USE [Service_AnimalCare]
GO
/****** Object:  StoredProcedure [dbo].[db_ReportTinhTrangBo]    Script Date: 6/11/2017 2:53:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[db_ReportTinhTrangBo] @macn varchar(10) , @ngaybatdau date
As
	if @macn is null
	begin
		select t.NgayGhiNhan, avg(t.cannang) as cannang, avg(t.chieucao) as chieucao, t.MaChiNhanh
		from
		(
		select a.NgayGhiNhan, b.CanNang, b.ChieuCao, a.MaChiNhanh
		from ChamSoc a, TinhTrangBo b
		where b.ThoiGianGhiNhan = 
			(
				select max(temp.ThoiGianGhiNhan)
				from TinhTrangBo temp 
				where temp.MaChamSoc = b.MaChamSoc
			) and
			a.MaChamSoc = b.MaChamSoc and
			DATEDIFF(DAY, @ngaybatdau, b.ThoiGianGhiNhan) < 14 and
			DATEDIFF(DAY, @ngaybatdau, b.ThoiGianGhiNhan) >= 0
		group by a.NgayGhiNhan, b.CanNang, b.ChieuCao, a.MaChiNhanh
		) t
		group by t.NgayGhiNhan, t.MaChiNhanh
		order by t.NgayGhiNhan
	end
	else
	begin
		select t.NgayGhiNhan, avg(t.cannang) as cannang, avg(t.chieucao) as chieucao, @macn
		from
		(
		select a.NgayGhiNhan, b.CanNang, b.ChieuCao
		from ChamSoc a, TinhTrangBo b
		where a.MaChiNhanh = @macn and
			b.ThoiGianGhiNhan = 
			(
				select max(temp.ThoiGianGhiNhan)
				from TinhTrangBo temp 
				where temp.MaChamSoc = b.MaChamSoc
			) and
			a.MaChamSoc = b.MaChamSoc and
			DATEDIFF(DAY, @ngaybatdau, b.ThoiGianGhiNhan) < 14 and
			DATEDIFF(DAY, @ngaybatdau, b.ThoiGianGhiNhan) >= 0
		group by a.NgayGhiNhan, b.CanNang, b.ChieuCao
		) t
		group by t.NgayGhiNhan
		order by t.NgayGhiNhan
	end