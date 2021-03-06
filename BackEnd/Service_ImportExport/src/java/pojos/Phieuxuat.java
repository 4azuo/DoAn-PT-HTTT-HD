package pojos;
// Generated Jun 8, 2017 11:11:57 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Phieuxuat generated by hbm2java
 */
public class Phieuxuat  implements java.io.Serializable {


     private String machungtu;
     private Date ngaylap;
     private Date ngayxuat;
     private Double tongluongsua;
     private Boolean dahuy;
     private String lydo;
     private String manv;
     private String macn;

    public Phieuxuat() {
    }

	
    public Phieuxuat(String machungtu) {
        this.machungtu = machungtu;
    }
    public Phieuxuat(String machungtu, Date ngaylap, Date ngayxuat, Double tongluongsua, Boolean dahuy, String lydo, String manv, String macn) {
       this.machungtu = machungtu;
       this.ngaylap = ngaylap;
       this.ngayxuat = ngayxuat;
       this.tongluongsua = tongluongsua;
       this.dahuy = dahuy;
       this.lydo = lydo;
       this.manv = manv;
       this.macn = macn;
    }
   
    public String getMachungtu() {
        return this.machungtu;
    }
    
    public void setMachungtu(String machungtu) {
        this.machungtu = machungtu;
    }
    public Date getNgaylap() {
        return this.ngaylap;
    }
    
    public void setNgaylap(Date ngaylap) {
        this.ngaylap = ngaylap;
    }
    public Date getNgayxuat() {
        return this.ngayxuat;
    }
    
    public void setNgayxuat(Date ngayxuat) {
        this.ngayxuat = ngayxuat;
    }
    public Double getTongluongsua() {
        return this.tongluongsua;
    }
    
    public void setTongluongsua(Double tongluongsua) {
        this.tongluongsua = tongluongsua;
    }
    public Boolean getDahuy() {
        return this.dahuy;
    }
    
    public void setDahuy(Boolean dahuy) {
        this.dahuy = dahuy;
    }
    public String getLydo() {
        return this.lydo;
    }
    
    public void setLydo(String lydo) {
        this.lydo = lydo;
    }
    public String getManv() {
        return this.manv;
    }
    
    public void setManv(String manv) {
        this.manv = manv;
    }
    public String getMacn() {
        return this.macn;
    }
    
    public void setMacn(String macn) {
        this.macn = macn;
    }




}


