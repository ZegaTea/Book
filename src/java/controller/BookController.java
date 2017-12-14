/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.LoginDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author k3mshiro
 */
@Controller
@RequestMapping(value = "/admin")
public class LoginController {
    
    @RequestMapping(value = "/login")
    public String login(){
        return "login";
    }
    
     @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String checkLogin(@RequestParam(value = "username", required = true) String username
    ,@RequestParam(value = "password", required = true) String password){
        boolean isSuccess = LoginDAO.checkLogin(username, password);
        if(isSuccess){
            return "adminhome";
        }else{
            return "login";
        }
    }
}
