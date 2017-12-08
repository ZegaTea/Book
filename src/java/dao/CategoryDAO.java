/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import pojo.Book;
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
    
    public static List<Category> getAllCategory(){
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        List<Category> cats = null;
        try {
            cats = session.createQuery("from Category").list();
        } catch (Exception e) {
            
        } finally {
            session.close();
        }
        return cats;
    }
 

}
