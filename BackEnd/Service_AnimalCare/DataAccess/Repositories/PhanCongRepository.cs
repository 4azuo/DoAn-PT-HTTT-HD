﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DomainData;
using System.Data.SqlClient;

namespace DataAccess.Repositories
{
    public class PhanCongRepository : DataAccessOrigin<PhanCong>
    {
        public static bool createIDAssignment(PhanCong pc){
            try
            {
                if (CounterRepository.updateCounter("index_phancong"))
                {
                    var index = CounterRepository.getIndex("index_phancong");
                    if (index != -1)
                    {
                        pc.MaPhanCong = string.Format("{0}{1}{2:D7}", Configs.AREA_ID, "", index);
                        return true;
                    }
                    return false;
                }
            }
            catch (Exception ex) { }
            return false;
        }

        public static int Insert(PhanCong pc)
        {
            //thêm mới phân công
            int result = -1;
            if (createIDAssignment(pc)){
                try
                {
                    result = DataProvider.ExecuteNonQuery(string.Format("insert into phancong(maphancong,ngaybatdau,ngayketthuc,ngaytrongtuan,manv,machuong) values ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}')", pc.MaPhanCong, pc.NgayBatDau, pc.NgayKetThuc, pc.NgayTrongTuan, pc.MaNV, pc.MaChuong));
                }
                catch (Exception ex)
                {
                    return result;
                }
            }
            return result;
        }

        public static int Update(PhanCong pc)
        {
            int result = -1;
            try
            {
                result = DataProvider.ExecuteNonQuery(string.Format("update phancong set ngaybatdau='{0}',ngayketthuc='{1}',ngaytrongtuan='{2}',manv='{3}',machuong='{4}' where maphancong='{5}'", pc.NgayBatDau, pc.NgayKetThuc, pc.NgayTrongTuan, pc.MaNV, pc.MaChuong, pc.MaPhanCong));
            }
            catch (Exception ex)
            {
                return result;
            }
            return result;
        }
        public static List<PhanCong> GetAllFromNhanVien(PhanCong pc)
        {
            List<PhanCong> result=null;
            try
            {
                result = DataProvider.ExecuteReader((SqlDataReader row) =>
                {
                    return new PhanCong()
                    {
                        MaPhanCong = row.GetValueDefault<string>(0),
                        NgayBatDau = row.GetValueDefault<DateTime>(1),
                        NgayKetThuc = row.GetValueDefault<DateTime>(2),
                        NgayTrongTuan = row.GetValueDefault<string>(3),
                        MaNV = row.GetValueDefault<string>(4),
                        MaChuong = row.GetValueDefault<string>(5)
                    };
                }, string.Format("select * from phancong where manv = '{0}' and '{1}' between NgayBatDau and NgayKetThuc", pc.MaNV,DateTime.Now));
            }
            catch (Exception)
            {
                return result;
            }
            return result;
        }
        public static PhanCong GetOneFromPhanCong(PhanCong pc)
        {
            PhanCong result = null;
            try
            {
                result = DataProvider.ExecuteReaderOne((SqlDataReader row) =>
                {
                    return new PhanCong()
                    {
                        MaPhanCong = row.GetValueDefault<string>(0),
                        NgayBatDau = row.GetValueDefault<DateTime>(1),
                        NgayKetThuc = row.GetValueDefault<DateTime>(2),
                        NgayTrongTuan = row.GetValueDefault<string>(3),
                        MaNV = row.GetValueDefault<string>(4),
                        MaChuong = row.GetValueDefault<string>(5)
                    };
                }, string.Format("select top 1 * from phancong where maphancong = {0}", pc.MaPhanCong));
            }
            catch (Exception)
            {
                return result;
            }
            return result;
        }
        public static List<PhanCong> GetAllFromChuongTrai(PhanCong pc)
        {
            List<PhanCong> result = null;
            try
            {
                result = DataProvider.ExecuteReader((SqlDataReader row) =>
                {
                    return new PhanCong()
                    {
                        MaPhanCong = row.GetValueDefault<string>(0),
                        NgayBatDau = row.GetValueDefault<DateTime>(1),
                        NgayKetThuc = row.GetValueDefault<DateTime>(2),
                        NgayTrongTuan = row.GetValueDefault<string>(3),
                        MaNV = row.GetValueDefault<string>(4),
                        MaChuong = row.GetValueDefault<string>(5)
                    };
                }, string.Format("select * from phancong where machuong = '{0}' and '{1}' between NgayBatDau and NgayKetThuc", pc.MaChuong,DateTime.Now));
            }
            catch (Exception)
            {
                return result;
            }
            return result;
        }

        public static List<PhanCong> GetAllFromAgency(string condition)
        {
            List<PhanCong> result = null;
            try
            {
                result = DataProvider.ExecuteReader((SqlDataReader row) =>
                {
                    return new PhanCong()
                    {
                        MaPhanCong = row.GetValueDefault<string>(0),
                        NgayBatDau = row.GetValueDefault<DateTime>(1),
                        NgayKetThuc = row.GetValueDefault<DateTime>(2),
                        NgayTrongTuan = row.GetValueDefault<string>(3),
                        MaNV = row.GetValueDefault<string>(4),
                        MaChuong = row.GetValueDefault<string>(5)
                    };
                }, string.Format("select * from phancong where {0} and '{1}' between NgayBatDau and NgayKetThuc order by MaNV", condition, DateTime.Now));
            }
            catch (Exception)
            {
                return result;
            }
            return result;
        }

        public static PhanCong CheckValidate(PhanCong pc)
        {
            PhanCong result = null;
            try
            {
                result = DataProvider.ExecuteReaderOne((SqlDataReader row) =>
                {
                    return new PhanCong()
                    {
                        MaPhanCong = row.GetValueDefault<string>(0),
                        NgayBatDau = row.GetValueDefault<DateTime>(1),
                        NgayKetThuc = row.GetValueDefault<DateTime>(2),
                        NgayTrongTuan = row.GetValueDefault<string>(3),
                        MaNV = row.GetValueDefault<string>(4),
                        MaChuong = row.GetValueDefault<string>(5)
                    };
                }, string.Format("select top 1 * from phancong where (NgayBatDau between '{0}' and '{1}' or NgayKetThuc between '{0}' and '{1}' or (NgayBatDau<'{0}' and NgayKetThuc>'{1}')) and MaNV='{2}' and MaChuong='{3}'", pc.NgayBatDau, pc.NgayKetThuc, pc.MaNV, pc.MaChuong));
            }
            catch (Exception)
            {
                return result;
            }
            return result;
        }
    }
}
