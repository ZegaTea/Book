/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TestDAO;

import dao.BookDAO;
import java.util.List;
import pojo.Book;

/**
 *
 * @author k3mshiro
 */
public class JUnitTest {
    
    public void getAllBooksTest(){
         List<Book> books = BookDAO.getAllBooks();
        System.out.println("Book " + books.size());
    }
    
     public void getBookByIdTest(int bookId){
         Book book = BookDAO.getBookById(bookId);
        System.out.println("Book " + book.getTitle());
    }


    public static void main(String[] args) {
       JUnitTest jUnitTest = new JUnitTest();
    }
}
