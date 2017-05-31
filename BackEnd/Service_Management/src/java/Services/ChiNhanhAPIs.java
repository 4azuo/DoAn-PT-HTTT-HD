/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import BusinessHandler.ChiNhanhBUS;
import DAO.ChiNhanhAdapter;
import Models.DataAccess.Agency.DeleteAgencyRequest;
import Models.DataAccess.Agency.DeleteAgencyResponse;
import Models.DataAccess.Agency.InsertAgencyRequest;
import Models.DataAccess.Agency.InsertAgencyResponse;
import Models.DataAccess.Agency.UpdateAgencyRequest;
import Models.DataAccess.Agency.UpdateAgencyResponse;
import Models.DataAccess.SelectRequest;
import Models.DataAccess.SelectResponse;
import com.google.gson.Gson;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;

/**
 *
 * @author Ut Hieu
 */
@Path("ChiNhanh")
public class ChiNhanhAPIs {
     @Context
    private UriInfo context;
     
    public ChiNhanhAPIs() {
    }
    @POST
    @Path("getAll")
    @Produces("application/json")
    @Consumes("application/json")
    public String get(String json){
        Gson gson = new Gson();
        SelectRequest request = gson.fromJson(json, SelectRequest.class);
        SelectResponse response = new SelectResponse();
        if (BusinessHandler.TokenBUS.tokenCheck(request, response, 3)){
            if (true){
                try{
                    response.Data = ChiNhanhAdapter.getAll();
                }catch(Exception ex){
                    response.Errors.add("Lỗi hệ thống.");
                    response.IsError = true;
                }
            }
        }
        return gson.toJson(response);
    }
    @POST
    @Path("getSingle")
    @Produces("application/json")
    @Consumes("application/json")
    public String getSingle(String json){
        Gson gson = new Gson();
        SelectRequest request = gson.fromJson(json, SelectRequest.class);
        SelectResponse response = new SelectResponse();
        if (BusinessHandler.TokenBUS.tokenCheck(request, response, 3)){
            if (true){
                try{
                    response.Data = ChiNhanhAdapter.getSingle(request.Predicates[0]);
                }catch(Exception ex){
                    response.Errors.add("Lỗi hệ thống.");
                    response.IsError = true;
                }
            }
        }
        return gson.toJson(response);
    }
    
    @POST
    @Path("add")
    @Produces("application/json")
    @Consumes("application/json")
    public String add(String json) {
        Gson gson = new Gson();
        InsertAgencyRequest request = gson.fromJson(json, InsertAgencyRequest.class);
        InsertAgencyResponse response = new InsertAgencyResponse();
        if (BusinessHandler.TokenBUS.tokenCheck(request, response, 3)){
            if (ChiNhanhBUS.insertValidate(request, response)){
                try{
                    String result = ChiNhanhAdapter.add(request.Data);
                    if (result != null){ 
                        response.Data = result;
                    }else{
                        response.Errors.add("Thêm thất bại.");
                        response.IsError = true;
                    }
                }catch(Exception ex){
                    response.Errors.add("Lỗi hệ thống.");
                    response.IsError = true;
                }
            }
        }
        return gson.toJson(response);
    }
    
    @POST
    @Path("delete")
    @Produces("application/json")
    @Consumes("application/json")
    public String delete(String json) {
        Gson gson = new Gson();
        DeleteAgencyRequest request = gson.fromJson(json, DeleteAgencyRequest.class);   
        DeleteAgencyResponse response = new DeleteAgencyResponse();
        if (BusinessHandler.TokenBUS.tokenCheck(request, response, 3)){
            if (ChiNhanhBUS.deleteValidate(request, response)){
                try{
                    int result = ChiNhanhAdapter.delete(request.Data);
                    if (result != 1){
                        response.Errors.add("Xóa chi nhánh thất bại.");
                        response.IsError = true;
                    }else{
                        response.Data = "Xóa chi nhánh thành công.";
                    }
                }catch(Exception ex){
                    response.Errors.add("Lỗi hệ thống.");
                    response.IsError = true;
                }
            }
        }
        return gson.toJson(response);
    }
    
    @POST
    @Path("recover")
    @Produces("application/json")
    @Consumes("application/json")
    public String recover(String json) {
        Gson gson = new Gson();
        DeleteAgencyRequest request = gson.fromJson(json, DeleteAgencyRequest.class);   
        DeleteAgencyResponse response = new DeleteAgencyResponse();
        if (BusinessHandler.TokenBUS.tokenCheck(request, response, 3)){
            if (ChiNhanhBUS.deleteValidate(request, response)){
                try{
                    int result = ChiNhanhAdapter.recover(request.Data);
                    if (result != 1){
                        response.Errors.add("Khôi phục chi nhánh thất bại.");
                        response.IsError = true;
                    }else{
                        response.Data = "Khôi phục chi nhánh thành công.";
                    }
                }catch(Exception ex){
                    response.Errors.add("Lỗi hệ thống.");
                    response.IsError = true;
                }
            }
        }
        return gson.toJson(response);
    }
    
    @POST
    @Path("update")
    @Produces("application/json")
    @Consumes("application/json")
    public String update(String json) {
        Gson gson = new Gson();
        UpdateAgencyRequest request = gson.fromJson(json, UpdateAgencyRequest.class);
        UpdateAgencyResponse response = new UpdateAgencyResponse();
        if (BusinessHandler.TokenBUS.tokenCheck(request, response, 3)){
            if (BusinessHandler.ChiNhanhBUS.updateValidate(request, response)){
                try{
                    if (ChiNhanhAdapter.update(request.Data)){
                        response.Data = "Cập nhật thành công!";
                    }else{
                        response.Errors.add("Cập nhật thất bại!");
                        response.IsError = true;
                    }
                }catch(Exception ex){
                    response.Errors.add("Lỗi hệ thống.");
                    response.IsError = true;
                }
            }
        }
        return gson.toJson(response);
    }
}
