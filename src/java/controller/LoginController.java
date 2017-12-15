/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.Constant;
import dao.LoginDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    

    @RequestMapping(value = "/loginAdmin")
    public String login_admin() {
        return "login_admin";
    }

    @RequestMapping(value = "/loginAdmin", method = RequestMethod.POST)
    public String checkLogin_admin(@RequestParam(value = "username", required = true) String username,
             @RequestParam(value = "password", required = true) String password, HttpServletRequest request) {
        boolean isSuccess = LoginDAO.checkLogin(username, password);
        if (isSuccess) {
            HttpSession session = request.getSession();
            session.setAttribute(Constant.LOGIN_SESSION, true);
            return "redirect:/admin/book/bookmanagement";
        } else {
            return "login_admin";
        }
    }
}
