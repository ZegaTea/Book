/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BookDAO;
import dao.CategoryDAO;
import dao.LoginDAO;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Book;
import pojo.Category;

/**
 *
 * @author k3mshiro
 */
@Controller
@RequestMapping(value = "/admin/book")
public class BookController {
    
    @RequestMapping(value = "/bookmanagement")
    public String book_admin(ModelMap model){
       List<Book> books = BookDAO.getAllBooks_admin();
        model.put("ListBook", books);
      return "book_admin";
    }
    
     
}
