    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Config.Configs;
import Models.Other.SyncRequest;
import Models.Other.SyncResponse;
import Ultility.HibernateUtil;
import com.google.gson.Gson;
import java.util.List;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import pojos.Nhacungcap;

/**
 *
 * @author Shin'sLaptop
 */
public class NhaCungCapAdapter {
    public static List<Nhacungcap> getAll(){
        return HibernateUtil.getList("from Nhacungcap order by manhacungcap asc", null);
    }

    public static boolean isValidName(String name) {
        if (HibernateUtil.count("select count(*) from Nhacungcap where ten = '" + name + "'") == 0) {
            return true;
        }
        return false;
    }
    private static void getNewID(Nhacungcap obj) {
        
          List<Nhacungcap> list = HibernateUtil.getSingle("from Nhacungcap order by manhacungcap desc",null);//lay ds chinhanh tu duoi len
        String machu= "";
         if (list.size()>0) {
            Nhacungcap cn = list.get(list.size()-1);
            machu = cn.getManhacungcap().substring(3);//NCC00001 -> 00001
         }
         else
         {
              machu = "0";
         }
        int maso = Integer.parseInt(machu);
        obj.setManhacungcap(String.format("NCC%03d", maso + 1));
    }
    public static boolean add(Nhacungcap obj) {
        getNewID(obj);
        return HibernateUtil.save(obj);
    }   
     public static Nhacungcap getSingle(Object id){
        List<Nhacungcap> list = HibernateUtil.getSingle("from Nhacungcap where manhacungcap = :p0", new Object[]{ id });
        if (list.size()>0) {
            Nhacungcap ncc = list.get(0);
            return ncc;
        }
        return null;
    }
    public static boolean update(Nhacungcap obj) {
        Nhacungcap ncc = getSingle(obj.getManhacungcap());
        if(!obj.getTen().equals(""))
            ncc.setTen(obj.getTen());
        if(!obj.getDiachi().equals(""))
            ncc.setDiachi(obj.getDiachi());
        if(!obj.getTinhtrang().equals(""))
            ncc.setTinhtrang(obj.getTinhtrang());
        return HibernateUtil.update(ncc);
    }
}
