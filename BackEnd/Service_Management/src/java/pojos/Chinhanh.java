package pojos;
// Generated May 30, 2017 5:04:37 PM by Hibernate Tools 4.3.1



/**
 * Chinhanh generated by hbm2java
 */
public class Chinhanh  implements java.io.Serializable {


     private String machinhanh;
     private String tenchinhanh;
     private String sodt;
     private String diachi;
     private String tinhtrang;
     private Boolean daxoa;
     private String quanly;
     private String khotam;

    public Chinhanh() {
    }

	
    public Chinhanh(String machinhanh) {
        this.machinhanh = machinhanh;
    }
    public Chinhanh(String machinhanh, String tenchinhanh, String sodt, String diachi, String tinhtrang, Boolean daxoa, String quanly, String khotam) {
       this.machinhanh = machinhanh;
       this.tenchinhanh = tenchinhanh;
       this.sodt = sodt;
       this.diachi = diachi;
       this.tinhtrang = tinhtrang;
       this.daxoa = daxoa;
       this.quanly = quanly;
       this.khotam = khotam;
    }
   
    public String getMachinhanh() {
        return this.machinhanh;
    }
    
    public void setMachinhanh(String machinhanh) {
        this.machinhanh = machinhanh;
    }
    public String getTenchinhanh() {
        return this.tenchinhanh;
    }
    
    public void setTenchinhanh(String tenchinhanh) {
        this.tenchinhanh = tenchinhanh;
    }
    public String getSodt() {
        return this.sodt;
    }
    
    public void setSodt(String sodt) {
        this.sodt = sodt;
    }
    public String getDiachi() {
        return this.diachi;
    }
    
    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }
    public String getTinhtrang() {
        return this.tinhtrang;
    }
    
    public void setTinhtrang(String tinhtrang) {
        this.tinhtrang = tinhtrang;
    }
    public Boolean getDaxoa() {
        return this.daxoa;
    }
    
    public void setDaxoa(Boolean daxoa) {
        this.daxoa = daxoa;
    }
    public String getQuanly() {
        return this.quanly;
    }
    
    public void setQuanly(String quanly) {
        this.quanly = quanly;
    }
    public String getKhotam() {
        return this.khotam;
    }
    
    public void setKhotam(String khotam) {
        this.khotam = khotam;
    }




}


