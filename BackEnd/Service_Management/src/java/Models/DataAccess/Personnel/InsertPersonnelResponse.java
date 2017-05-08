/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.DataAccess.Personnel;

import Models.DataAccess.InsertResponse;
import java.util.ArrayList;

/**
 *
 * @author 19101994
 */
public class InsertPersonnelResponse extends InsertResponse {
    public ArrayList<String> NameErrors;
    public ArrayList<String> EmailErrors;
    
    public InsertPersonnelResponse(){
        NameErrors = new ArrayList<>();
        EmailErrors = new ArrayList<>();
    }
}