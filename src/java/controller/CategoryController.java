/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import common.Constant;
import dao.BookDAO;
import dao.CategoryDAO;
import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import pojo.Book;
import pojo.Category;

/**
 *
 * @author k3mshiro
 */
@Controller
@RequestMapping(value = "/admin/category")
public class CategoryController {
    
    @RequestMapping(value = "/categorymanagement")
    public String category_admin(ModelMap model, HttpServletRequest request){
        HttpSession session = request.getSession();
       if(session.getAttribute(Constant.LOGIN_SESSION) == null){
          return "redirect:/admin/loginAdmin"; 
       }
       else{
        model.put("ListCategory", CategoryDAO.getAllCategory());
        
      return "category_admin";
       }
    }
     @RequestMapping(value = "/AddCategory", method = RequestMethod.GET)
    public String themdanhmuc(ModelMap mm, HttpServletRequest request) {
        HttpSession session = request.getSession();
       if(session.getAttribute(Constant.LOGIN_SESSION) == null){
          return "redirect:/admin/loginAdmin"; 
       }
       else{ 
        return "Addcategory_admin";
       }
    }

    @RequestMapping(value = "/AddCategoryPost", method = RequestMethod.POST)
    public String themdanhmuc_post( HttpServletRequest request,ModelMap mm)  { 
        if( request.getParameter("name")==""){
            mm.put("err", "you need to import 'name'");
            return "Addcategory_admin";
        }
        else {
            int check = CategoryDAO.addCategory(request.getParameter("name"));
        }
        
        return "redirect:/admin/category/categorymanagement";
    }
    
     @RequestMapping(value = "/EditCategory-{id}",method = RequestMethod.GET)
    public String suadanhmuc(ModelMap mm ,@PathVariable(value = "id") int id, HttpServletRequest request) {        
       HttpSession session = request.getSession();
       if(session.getAttribute(Constant.LOGIN_SESSION) == null){
          return "redirect:/admin/loginAdmin"; 
       }
       else{
        mm.put("CategoryDetails", CategoryDAO.getCategoryById_Tuandv(id));
        return "Editcategory_admin";
       }
    }

    
    @RequestMapping(value = "/EditCategoryPost", method = RequestMethod.POST)
    public String suadanhmuc_post(HttpServletRequest request,ModelMap mm)  {
       if( request.getParameter("name")==""){
            mm.put("err", "you need to import 'name'");
            return "Editcategory_admin";
        }
        else {           
            int check = CategoryDAO.editCategory(Integer.parseInt( request.getParameter("id")), request.getParameter("name"));
           return "redirect:/admin/category/categorymanagement";
       }
    }
      @RequestMapping("/DeleteCategory/{id}")
    public String deleteCategory(@PathVariable(value = "id") Integer id) {
        int check=CategoryDAO.deleteCategory(id);
        return "redirect:/admin/category/categorymanagement";
    }

}
