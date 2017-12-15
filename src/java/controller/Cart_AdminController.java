/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BookDAO;
import dto.BookCartDTO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pojo.Book;
import common.*;
import dao.CartDAO;
import dao.CartDetailDAO;
import dao.CategoryDAO;
import java.util.stream.Collectors;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Cart;
import pojo.CartDetail;

/**
 *
 * @author dovan
 */
@Controller
@RequestMapping(value = "/admin/cart")
public class Cart_AdminController {

    @RequestMapping(value = "/cartmanagement")
    public String book_admin(ModelMap model, HttpServletRequest request){
        HttpSession session = request.getSession();
       if(session.getAttribute(Constant.LOGIN_SESSION) == null){
          return "redirect:/admin/loginAdmin"; 
       }
       else{
          List<Book> books = BookDAO.getAllBooks_admin();      
        model.put("ListCart", new CartDAO().getAllCarts_admin());
        model.put("ListStatus", CartDAO.getAllStatus_admin());
        model.put("ListUser", CartDAO.getAllUser_Tuandv());
        
      return "cart_admin"; 
       }
       
    }
    
     @RequestMapping(value = "/CartDetail-{id}",method = RequestMethod.GET)
    public String suasanpham(ModelMap mm ,@PathVariable(value = "id") int id, HttpServletRequest request) {
        HttpSession session = request.getSession();
       if(session.getAttribute(Constant.LOGIN_SESSION) == null){
          return "redirect:/admin/loginAdmin"; 
       }
       else{ 
       
        mm.put("ListCartDetail", CartDetailDAO.getCartdetail(id));
        mm.put("ListBook", BookDAO.getAllBooks()); 
        return "cartDetail_admin";
       }
    }

     @RequestMapping("/UpdateCart/{id}")
    public String updateCart(@PathVariable(value = "id") Integer id) {
        int check=CartDAO.updateStatus_admin(id);
        return "redirect:/admin/cart/cartmanagement";
    }
    
    
   
}
