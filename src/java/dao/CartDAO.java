/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import org.hibernate.Session;
import pojo.Cart;
import utils.BookHibernateUtil;

/**
 *
 * @author dovan
 */
public class CartDAO {
    public int saveToCart(Cart cart){
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        int id = (int) session.save(cart);
        session.getTransaction().commit();
        session.close();
        return id;
    }
}
