/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.Other;

import Models.BodyRequest;

/**
 *
 * @author Shin'sLaptop
 */
public class ChangePasswordRequest extends BodyRequest {
    public String UserId;
    public String NewPass;
}
