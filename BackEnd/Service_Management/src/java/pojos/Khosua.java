package pojos;
// Generated May 30, 2017 5:04:37 PM by Hibernate Tools 4.3.1



/**
 * Khosua generated by hbm2java
 */
public class Khosua  implements java.io.Serializable {


     private String makho;
     private String tenkho;
     private Double succhua;
     private Double luongsuaco;
     private String diachi;
     private Boolean daxoa;
     private String tinhtrang;
     private String machinhanh;

    public Khosua() {
    }

	
    public Khosua(String makho) {
        this.makho = makho;
    }
    public Khosua(String makho, String tenkho, Double succhua, Double luongsuaco, String diachi, Boolean daxoa, String tinhtrang, String machinhanh) {
       this.makho = makho;
       this.tenkho = tenkho;
       this.succhua = succhua;
       this.luongsuaco = luongsuaco;
       this.diachi = diachi;
       this.daxoa = daxoa;
       this.tinhtrang = tinhtrang;
       this.machinhanh = machinhanh;
    }
   
    public String getMakho() {
        return this.makho;
    }
    
    public void setMakho(String makho) {
        this.makho = makho;
    }
    public String getTenkho() {
        return this.tenkho;
    }
    
    public void setTenkho(String tenkho) {
        this.tenkho = tenkho;
    }
    public Double getSucchua() {
        return this.succhua;
    }
    
    public void setSucchua(Double succhua) {
        this.succhua = succhua;
    }
    public Double getLuongsuaco() {
        return this.luongsuaco;
    }
    
    public void setLuongsuaco(Double luongsuaco) {
        this.luongsuaco = luongsuaco;
    }
    public String getDiachi() {
        return this.diachi;
    }
    
    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }
    public Boolean getDaxoa() {
        return this.daxoa;
    }
    
    public void setDaxoa(Boolean daxoa) {
        this.daxoa = daxoa;
    }
    public String getTinhtrang() {
        return this.tinhtrang;
    }
    
    public void setTinhtrang(String tinhtrang) {
        this.tinhtrang = tinhtrang;
    }
    public String getMachinhanh() {
        return this.machinhanh;
    }
    
    public void setMachinhanh(String machinhanh) {
        this.machinhanh = machinhanh;
    }




}


