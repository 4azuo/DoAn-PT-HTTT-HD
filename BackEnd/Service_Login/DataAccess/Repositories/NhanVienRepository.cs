﻿using DomainData;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories
{
    public class NhanVienRepository : DataAccessOrigin<NhanVien>
    {
        #region Singleton
        private NhanVienRepository() { }
        private static NhanVienRepository _singleton;
        public static NhanVienRepository GetInstance()
        {
            if (_singleton == null)
                _singleton = new NhanVienRepository();
            return _singleton;
        }
        #endregion

        public NhanVien IsExistAndGet(string username, string password)
        {
            NhanVien result = null;
            try
            {
                result = DataProvider.ExecuteReaderOne((SqlDataReader row) =>
                {
                    return new NhanVien()
                    {
                        MaNV = row.GetValueDefault<string>(0),
                        HoTen = row.GetValueDefault<string>(1),
                        TenTaiKhoan = row.GetValueDefault<string>(2),
                        Email = row.GetValueDefault<string>(3),
                        CapPQ = row.GetValueDefault<int>(4),
                    };
                }, string.Format("select top 1 nv.manv, nv.hoten, nv.tentaikhoan, nv.email, nv.cappq from nhanvien nv where nv.tentaikhoan = '{0}' and nv.matkhau = '{1}'", username, password));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public NhanVien GetUserByEmail(string email)
        {
            NhanVien result = null;
            try
            {
                result = DataProvider.ExecuteReaderOne((SqlDataReader row) =>
                {
                    return new NhanVien()
                    {
                        MaNV = row.GetValueDefault<string>(0),
                        HoTen = row.GetValueDefault<string>(1),
                        TenTaiKhoan = row.GetValueDefault<string>(2),
                        Email = row.GetValueDefault<string>(3),
                        CapPQ = row.GetValueDefault<int>(4),
                    };
                }, string.Format("select top 1 nv.manv, nv.hoten, nv.tentaikhoan, nv.email, nv.cappq from nhanvien nv where nv.email = '{0}'", email));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int Add(NhanVien obj)
        {
            int result = -1;
            try
            {
                result = DataProvider.ExecuteNonQuery(string.Format("insert into nhanvien(manv, tentaikhoan, matkhau, cappq, email, hoten) values ('{0}', '{1}', '{2}', '{3}', '{4}', N'{5}')", obj.MaNV, obj.TenTaiKhoan, obj.MatKhau, obj.CapPQ, obj.Email, obj.HoTen));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int Update(NhanVien obj)
        {
            int result = -1;
            try
            {
                result = DataProvider.ExecuteNonQuery(string.Format("update nhanvien set tentaikhoan = '{1}', matkhau = '{2}', cappq = '{3}', email = '{4}', hoten = N'{5}' where manv = '{0}'", obj.MaNV, obj.TenTaiKhoan, obj.MatKhau, obj.CapPQ, obj.Email, obj.HoTen));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int Delete(string id)
        {
            int result = -1;
            try
            {
                result = DataProvider.ExecuteNonQuery(string.Format("delete from nhanvien where manv = '{0}'", id));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int ChangePass(string id, string oldp, string newp)
        {
            int result = -1;
            try
            {
                var is_exist = DataProvider.ExecuteReaderOne((SqlDataReader row) =>
                {
                    return new NhanVien();
                }, string.Format("select top 1 nv.manv from nhanvien nv where nv.manv = '{0}' and nv.matkhau = '{1}'", id, oldp));
                if (is_exist != null)
                {
                    result = DataProvider.ExecuteNonQuery(string.Format("update nhanvien set matkhau = '{1}' where manv = '{0}'", id, newp));
                }
                else
                {
                    result = 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        public int ChangePass(string id, string newp)
        {
            int result = -1;
            try
            {
                result = DataProvider.ExecuteNonQuery(string.Format("update nhanvien set matkhau = '{1}' where manv = '{0}'", id, newp));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
    }
}
