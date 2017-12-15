/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import pojo.CartDetail;
import utils.BookHibernateUtil;

/**
 *
 * @author dovan
 */
public class CartDetailDAO {

    public void saveToCartDetail(int id, CartDetail detail) {
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        
        session.beginTransaction();
        
        session.save(detail);
        
        session.getTransaction().commit();
        
        session.close();
    }
     
     public static List<CartDetail> getCartdetail(Integer cartId) {
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        List<CartDetail> books = null;
        try {
            String sql = "select * from CartDetail where cartId="+cartId.toString();
            books =  session.createSQLQuery(sql).addEntity(CartDetail.class).list();
        } catch (Exception e) {
            
        } finally {
            session.close();
        }
        return books;
    }
}
