package dao;


import utils.DBUltis;
import pojo.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author DUC
 */
@WebServlet("/AccountServlet")

public class AccountServlet extends HttpServlet{
    
    @Override
    public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
    	doGet(req , res); 
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String redirectPage = "newjsp.jsp";

            String username = request.getParameter("txtUser");
            String password = request.getParameter("txtPass");
            String action = request.getParameter("btnAction");

            if (action.equals("Login")) {
                User userInfo = DBUltis.checkLogin(username, password);
                if (userInfo == null) {
                    request.setAttribute("message", "Wrong Username or Password");
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", userInfo);
                    redirectPage = "logined.jsp";
                }
            } else if (action.equals("Register")) {
                String name = new String(request.getParameter("txtName").getBytes("iso-8859-1"), "UTF-8");
                
                DBUltis.register(username, password, name);
                request.setAttribute("message", "Register successful");
            }
            else if(action.equals("Logout"))
            {
                HttpSession session = request.getSession();
                session.setAttribute("user", null);
            }
            
            RequestDispatcher rd = request.getRequestDispatcher(redirectPage);
            rd.forward(request, response);
        }
        finally {
            out.close();
        }
    }

}
