/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import pojo.Category;
import pojo.User;
import utils.BookHibernateUtil;

/**
 *
 * @author k3mshiro
 */
public class LoginDAO {
    public static boolean checkLogin(String username, String password){
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        List<User> lst = new ArrayList<User>();
        try {
            String hql = " from User where username =  '"+username+"' and password = '"+password+"'";
            lst = session.createQuery(hql).list();
        } catch (Exception e) {

        } finally {
            session.close();
        }

        if(lst.size() == 1){
            return true;
        } else {
            return  false;
        }
    }
    
    
    public static int checkUserLogin(String username, String password){
        Session session = BookHibernateUtil.getSessionFactory().openSession();
        List<User> lst = new ArrayList<User>();
        try {
            String hql = " from User where username =  '"+username+"' and password = '"+password+"'";
            lst = session.createQuery(hql).list();
        } catch (Exception e) {

        } finally {
            session.close();
        }

        if(lst.size() == 1){
            return lst.get(0).getId();
        } else {
            return  -1;
        }
    }
    

}
