/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Config.Configs;
import Models.Other.ChangePasswordRequest;
import Ultility.HibernateUtil;
import Ultility.Security;
import java.util.Date;
import java.util.List;
import pojos.*;

/**
 *
 * @author Shin-Desktop
 */
public class NhanVienAdapter {
    public static void getNewID(Nhanvien obj) {
        if (CounterAdapter.updateCounter("indexNhanvien")){
            obj.setManhanvien(String.format("%s%s%05d", Configs.AREA_ID, "NV", CounterAdapter.getAreaCounter().getIndexNhanvien()));
        }
    }
    
    public static void getNewID(String areaid, Nhanvien obj) {
        if (CounterAdapter.updateCounter(areaid, "indexNhanvien")){
            obj.setManhanvien(String.format("%s%s%05d", areaid, "NV", CounterAdapter.getAreaCounter().getIndexNhanvien()));
        }
    }

    public static boolean checkEmail(String email) {
        return HibernateUtil.getSingle("from Nhanvien where email = :p0", new Object[]{email}).size() <= 0;
    }

    public static Nhanvien getSingle(Object MaNV) {
        List<Nhanvien> list = HibernateUtil.getSingle("from Nhanvien where manhanvien = :p0", new Object[]{MaNV});
        if (list.size() > 0) {
            Nhanvien nhanvien = list.get(0);
            nhanvien.setTentaikhoan(null);
            nhanvien.setMatkhau(null);
            return nhanvien;
        }
        return null;
    }

    public static Nhanvien getSingleFullInfo(Object MaNV) {
        List<Nhanvien> list = HibernateUtil.getSingle("from Nhanvien where manhanvien = :p0", new Object[]{MaNV});
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    public static List<Nhanvien> getAll(Object MaCN) {
        List<Nhanvien> list = HibernateUtil.getList("from Nhanvien where machinhanh = :p0 and maphanquyen = :p1", new Object[]{MaCN, "PQ001"});
        for (Nhanvien nhanvien : list) {
            nhanvien.setTentaikhoan(null);
            nhanvien.setMatkhau(null);
        }
        return list;
    }

    public static boolean addNhanVien(Nhanvien obj) {
        getNewID(obj);
        obj.setNgayvaolam(new Date());
        obj.setMaphanquyen("PQ001");
        obj.setDaxoa(false);
        obj.setTentaikhoan(obj.getEmail());
        obj.setMatkhau(Security.Encrypt(obj.getTentaikhoan()));
        return HibernateUtil.save(obj);
    }

    public static int delete(Object userid) {
        return HibernateUtil.execute("update Nhanvien set daxoa = :p1 where manhanvien = :p0", new Object[]{userid, true});
    }

    public static int recover(Object userid) {
        return HibernateUtil.execute("update Nhanvien set daxoa = :p1 where manhanvien = :p0", new Object[]{userid, false});
    }

    public static boolean update(Nhanvien obj) {
        Nhanvien nv = getSingleFullInfo(obj.getManhanvien());
        nv.setHoten(obj.getHoten());
        nv.setGioitinh(obj.getGioitinh());
        nv.setNgaysinh(obj.getNgaysinh());
        nv.setSodt(obj.getSodt());
        nv.setDiachi(obj.getDiachi());
        return HibernateUtil.update(nv);
    }

    public static int changePassword(ChangePasswordRequest obj) {
        return HibernateUtil.execute("update Nhanvien set matkhau = :p1 where manhanvien = :p0", new Object[]{obj.UserId, obj.NewPass});
    }
    
    public static List<Nhanvien> getStaffOfAgency(Object MaCN) {
        List<Nhanvien> list = HibernateUtil.getList("from Nhanvien where machinhanh = :p0", new Object[]{MaCN});
        for (Nhanvien nhanvien : list) {
            nhanvien.setTentaikhoan(null);
            nhanvien.setMatkhau(null);
        }
        return list;
    }
}
