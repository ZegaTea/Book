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
import pojo.Book;

/**
 *
 * @author k3mshiro
 */
@Controller
@RequestMapping(value = "/detail")
public class DetailController {
    
     @RequestMapping(value = "/book-{bookId}",method = RequestMethod.GET)
    public String getBookDetails(ModelMap mm, @PathVariable(value = "bookId") int bookId) {
        
        //Selected Book Details
        Book book = BookDAO.getBookById(bookId);
        mm.put("BookDetails", book);
        
        //Related Books
        List<Book> relatedBooks = BookDAO.getRelatedBooks(book.getCategoryId(), bookId);
        mm.put("RelatedBooks", relatedBooks);
        
        //Category Name
        String categoryName = CategoryDAO.getCategoryById(book.getCategoryId());
        mm.put("CategoryName", categoryName);
        
        //Suggestion Books
        List<Book> suggestionBooks = BookDAO.getRandomBooks();
        mm.put("SuggestionBooks", suggestionBooks);
        return "detail";
    }
}
