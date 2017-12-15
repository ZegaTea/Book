/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BookDAO;
import dao.CategoryDAO;
import java.sql.Array;
import java.util.ArrayList;
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

    @RequestMapping(value = "/item-page={page}", method = RequestMethod.GET)
    public String item(ModelMap model, @PathVariable(value = "page") int page) {
        BookDAO bookDAO = new BookDAO();
        List<Book> lst = bookDAO.getListBook(page - 1);
        int si = BookDAO.getAllBooks().size();

        int prev = page - 1;
        int next = page + 1;
        int lastPage = si / 3;
        if (!(lastPage * 3 == si)) {
            lastPage++;
        }
        if (prev < 1) {
            prev = 1;
        }
        if (next > lastPage) {
            next = lastPage;
        }
        model.put("BookCart", lst);
        model.put("prev", prev);
        model.put("next", next);
        model.put("current", page);
        model.put("lastPage", lastPage);
        return "shop";
    }
}
