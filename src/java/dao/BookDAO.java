/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
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
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        List<Book> books = null;
        try {
            String sql = "select * from Book";
            books =  session.createSQLQuery(sql).addEntity(Book.class).list();
        } catch (Exception e) {
            
        } finally {
            session.close();
        }
        return books;
    }
    public static int addBook(
     
      String title,
      Float price,
      String author,
      String publisher,
      String description,
      Integer categoryId,
      String imageLink,
      Integer chapterNum,
      Integer numOfBooks  ){
        int check = 0;
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        try {
            Book b = new Book(                
                 title,
                 price,
                 author,
                 publisher,
                 description,
                 categoryId,
                 imageLink,
                 chapterNum,
                 numOfBooks 
            );
            
            session.save(b);
            tran.commit();
            check = 1;
        } catch (Exception e) {
            tran.rollback();

        } finally {
            session.close();
        }
        return check;
    }
    public static int editBook(
      Integer id,
      String title,
      Float price,
      String author,
      String publisher,
      String description,
      Integer categoryId,
      String imageLink,
      Integer chapterNum,
      Integer numOfBooks  ){
        int check = 0;
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        try {
            Book b = new Book(
                   
                 title,
                 price,
                 author,
                 publisher,
                 description,
                 categoryId,
                 imageLink,
                 chapterNum,
                 numOfBooks 
            );
            b.setId(id);
            
            session.update(b);
            tran.commit();
            check = 1;
        } catch (Exception e) {
            tran.rollback();

        } finally {
            session.close();
        }
        return check;
    }
     public static int deleteBook (int id) {
        int check = 0;
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        try {
            Book b = new Book();
            b = getBookById(id);
            session.delete(b);
            tran.commit();
            check = 1;
        } catch (Exception e) {
            tran.rollback();
        } finally {
            session.close();
        }
        return check;
    }
       public static List<Book> getBooksByCategoryId(int categoryId) {
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        List<Book> books = new ArrayList<>();
        try {
            String hql = "from Book b where b.categoryId = " + categoryId ;
            books = session.createQuery(hql).list();
        } catch (Exception e) {

        } finally {
            session.close();
        }

        return books;
    }
     public static int deleteBookByCategory (int id) {
        int check = 0;
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        try {
            for(Book b: getBooksByCategoryId(id)){
              session.delete(b);  
            }         
            tran.commit();
            check = 1;
        } catch (Exception e) {
            tran.rollback();
        } finally {
            session.close();
        }
        return check;
    }

     public List<Book> getListBook(int offset){
         List<Book> lst = new ArrayList<>();
         Session session = BookHibernateUtil.getSessionFactory().openSession();
         Criteria criteria = session
                 .createCriteria(Book.class)
                 .addOrder(Order.desc("price"))
                 .setFirstResult(offset * 3)
                 .setMaxResults(3);
         lst =(ArrayList<Book>) criteria.list();
         return lst;
     }
     
}
