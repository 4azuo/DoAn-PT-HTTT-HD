/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import DAO.NhanVienAdapter;
import Models.ChangePasswordRequest;
import Models.UpdatePersonnelRequest;
import Models.UpdatePersonnelResponse;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.UnsupportedEncodingException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.*;
import pojos.Nhanvien;


/**
 * REST Web Service
 *
 * @author Shin-Desktop
 */
@Path("NhanVien")
public class NhanVienAPIs {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of NhanVienAPIs
     */
    public NhanVienAPIs() {
    }

    @GET
    @Path("getAll")
    @Produces("application/json")
    public String getAll(){
        return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(NhanVienAdapter.getAll());
    }
    
    @POST
    @Path("getSingle")
    @Produces("application/json")
    @Consumes("application/json")
    public String getSingle(String json){
        Nhanvien req = new Gson().fromJson(json, Nhanvien.class);
        return new Gson().toJson(NhanVienAdapter.getSingle(req.getManhanvien()));
    }
    
    @POST
    @Path("add")
    @Produces("application/json")
    @Consumes("application/json")
    public String addNhanVien(String json) throws UnsupportedEncodingException {
        Gson gson = new Gson();
        Nhanvien req = gson.fromJson(json, Nhanvien.class);   
        return NhanVienAdapter.addNhanVien(req);
    }
    
    @POST
    @Path("delete")
    @Produces("application/json")
    @Consumes("application/json")
    public String deleteNhanVien(String json) {
        Gson gson = new Gson();
        Nhanvien req = gson.fromJson(json, Nhanvien.class);   
        return NhanVienAdapter.deleteNhanVien(req);
    }
    
    @POST
    @Path("update")
    @Produces("application/json")
    @Consumes("application/json")
    public UpdatePersonnelResponse updateNhanVien(String json) {
        UpdatePersonnelRequest request = new Gson().fromJson(json, UpdatePersonnelRequest.class);
        UpdatePersonnelResponse response = new UpdatePersonnelResponse();
        try{
            if (BusinessHandler.TokenChecker.tokenCheck(request, response)){
                if (BusinessHandler.NhanVienAPIsChecker.updateNhanVienChecker(request, response)){
                    boolean result = NhanVienAdapter.updateNhanVien(request.Data);
                    if (result){
                        response.Data = "Cập nhật thành công!";
                    }else{
                        response.Errors.add("Cập nhật thất bại!");
                        response.IsError = true;
                    }
                }
            }
        } catch (Exception ex) {
            response.Errors.add("Lỗi hệ thống!");
            response.IsError = true;
        }
        return response;
    }
    
    @POST
    @Path("sync")
    @Produces("application/json")
    @Consumes("application/json")
    public String syncPassword(String json) {
        Gson gson = new Gson();
        ChangePasswordRequest req = gson.fromJson(json, ChangePasswordRequest.class);   
        return gson.toJson(NhanVienAdapter.syncPassword(req));
    }
}