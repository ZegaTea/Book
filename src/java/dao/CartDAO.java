/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Cart;
import pojo.Status;
import pojo.User;
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
    //tuan_dv
     public static int updateStatus_admin(
             Integer id
             
              ){
        int check = 0;
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        Transaction tran = session.beginTransaction();
        try {
            Cart b =new CartDAO().getAllCarts_admin().stream().filter(x->x.getId()==id).findFirst().get();
               
            b.setId(id); 
            if(b.getStatus()==1){
                b.setStatus(2);
            }
            
            else if(b.getStatus()==2){
                b.setStatus(3);
                /*String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = sdf.parse(timeStamp);
                long millis = date.getTime();*/
                long currentDateTime = System.currentTimeMillis();
                
                b.setDeliveryDate(currentDateTime);
            }
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
     public  List<Cart> getAllCarts_admin() {
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        List<Cart> books = null;
        try {
            String sql = "select * from Cart";
            books =  session.createSQLQuery(sql).addEntity(Cart.class).list();
        } catch (Exception e) {
            
        } finally {
            session.close();
        }
        return books;
    }
     public static List<Status> getAllStatus_admin() {
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        List<Status> books = null;
        try {
            String sql = "select * from Status";
            books =  session.createSQLQuery(sql).addEntity(Status.class).list();
        } catch (Exception e) {
            
        } finally {
            session.close();
        }
        return books;
    }
      public static List<User> getAllUser_Tuandv() {
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        List<User> books = null;
        try {
            String sql = "from User";
            books =  session.createQuery("from User").list();
        } catch (Exception e) {
            
        } finally {
            session.close();
        }
        return books;
    }
     
}
