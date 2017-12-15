/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Category;
import utils.BookHibernateUtil;

/**
 *
 * @author k3mshiro
 */
public class CategoryDAO {

    public static String getCategoryById(int categoryId) {
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        Category category = new Category();
        try {
            category = (Category) session.get(Category.class, categoryId);
        } catch (Exception e) {

        } finally {
            session.close();
        }

        return category.getName();
    }

    public static List<Category> get5Category() {
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        List<Category> categories = new ArrayList<>();
        try {
            String hql = "SELECT  DISTINCT  FROM    Category ORDER BY  id LIMIT 5";
            categories = session.createQuery(hql).list();
        } catch (Exception e) {

        } finally {
            session.close();
        }

        return categories;
    }
    public static List<Category> getAllCategory() {
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        List<Category> categories = new ArrayList<>();
        try {
         
            categories = session.createQuery("FROM Category ORDER BY  name").list();
        } catch (Exception e) {

        } finally {
            session.close();
        }

        return categories;
    }
     public static Category getCategoryById_Tuandv(int id) {
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        Category c = new Category();
        try {
            c = (Category) session.get(Category.class, id);
        } catch (Exception e) {

        } finally {
            session.close();
        }

        return c;
    }
     public static int addCategory(String name){
        int check = 0;
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        try {
            Category b = new Category(name);                     
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
    public static int editCategory(Integer id,String name){
        int check = 0;
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        try {
            Category b = new Category(name);                
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
     public static int deleteCategory (int id) {
        int check = 0;
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        try {
            BookDAO.deleteBookByCategory(id);
            Category b = new Category();
            b = getCategoryById_Tuandv(id);
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
}
