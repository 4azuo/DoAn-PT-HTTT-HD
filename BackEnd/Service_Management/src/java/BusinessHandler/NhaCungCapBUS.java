/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BusinessHandler;

import DAO.CounterAdapter;
import Models.DataAccess.Provider.InsertProviderRequest;
import Models.DataAccess.Provider.InsertProviderResponse;
import Models.DataAccess.Provider.UpdateProviderRequest;
import Models.DataAccess.Provider.UpdateProviderResponse;

/**
 *
 * @author Ut Hieu
 */
public class NhaCungCapBUS {
     public static boolean insertValidate(InsertProviderRequest request, InsertProviderResponse response){
        if (request.Data.getTen() == null || request.Data.getTen().isEmpty()){
            response.NameErrors.add("Tên không được để trống!");
            response.IsError = true;
        }
        if (CounterAdapter.getAreaCounter(request.AreaId) == null){
            response.Errors.add("Khu vực cung cấp không hợp lệ!");
            response.IsError = true;
        }
        return !response.IsError;
    }
    
    public static boolean updateValidate(UpdateProviderRequest request, UpdateProviderResponse response){
        if (request.Data.getTen() == null || request.Data.getTen().isEmpty()){
            response.NameErrors.add("Tên không được để trống!");
            response.IsError = true;
        }
        return !response.IsError;
    }
}
