/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.hibernate.Session;
import pojo.Book;
import utils.BookHibernateUtil;

/**
 *
 * @author k3mshiro
 */
public class BookDAO {

    public static List<Book> getAllBooks() {
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        List<Book> books = null;
        try {
            books = session.createQuery("from Book").list();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return books;
    }

    public static Book getBookById(int id) {
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        Book book = new Book();
        try {
            book = (Book) session.get(Book.class, id);
        } catch (Exception e) {

        } finally {
            session.close();
        }

        return book;
    }

    public static List<Book> getRelatedBooks(int categoryId, int bookId) {
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        List<Book> books = new ArrayList<>();
        try {
            String hql = "from Book b where b.categoryId = " + categoryId + " and b.id != " + bookId;
            books = session.createQuery(hql).list();
        } catch (Exception e) {

        } finally {
            session.close();
        }

        return books;
    }

    private static int getNums() {
        return getAllBooks().size();
    }

    public static List<Book> getRandomBooks() {
        List<Book> suggestionBooks = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            Random rd = new Random();
            Book book = getBookById(rd.nextInt(getNums()));
            if (book != null) {
                suggestionBooks.add(book);
            }
        }

        return suggestionBooks;
    }

    public static List<Book> getAllBooks_admin() {
        List<Book> result = new ArrayList<>();
        return result;
    }
}
