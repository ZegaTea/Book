/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BookDAO;
import dao.CategoryDAO;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
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
@RequestMapping(value = "/home")
public class HomeController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String home(ModelMap model) {
        List<Book> books = BookDAO.getAllBooks();
        model.put("ListBook", books);

        List<Category> categories = CategoryDAO.get5Category();
        model.put("ListCategory", categories);

        return "index";
    }
}
