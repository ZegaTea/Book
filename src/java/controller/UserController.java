/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.LoginDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author dovan
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {
    private String referer = "/";
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletRequest httpServletRequest){
        referer = httpServletRequest.getHeader("Referer");
        return "login";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String checkLogin(@RequestParam(value = "username", required = true) String username
    ,@RequestParam(value = "password", required = true) String password, HttpServletRequest httpServletRequest){
        HttpSession ss = httpServletRequest.getSession();
        int id = LoginDAO.checkUserLogin(username, password);
        if(id != -1){
            ss.setAttribute("userLogin", id);
            return "redirect:" + referer;
        }else{
            return "login";
        }
    }
    
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout( HttpServletRequest httpServletRequest){
        HttpSession ss = httpServletRequest.getSession();
        ss.removeAttribute("userLogin");
        String ref = httpServletRequest.getHeader("Referer");
        return "redirect:" + ref;
    }
}
