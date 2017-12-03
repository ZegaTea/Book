/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

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
}
