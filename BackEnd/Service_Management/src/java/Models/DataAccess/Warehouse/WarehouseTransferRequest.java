/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.DataAccess.Warehouse;

import Models.BodyRequest;

/**
 *
 * @author 19101994
 */
public class WarehouseTransferRequest extends BodyRequest {
    public String From;
    public String To;
    public Double Value;
}
