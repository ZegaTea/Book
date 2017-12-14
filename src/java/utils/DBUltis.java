package utils;


import pojo.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author DUC
 */
public class DBUltis {

    public static Connection makeConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/login_FB";
            String username = "root";
            String password = "1234";
            Connection conn = DriverManager.getConnection(url, username, password);

            return conn;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    //NORMAL REG
    public static boolean register(String username, String password, String name) {
        PreparedStatement stm = null;
        Connection conn = null;
        try {
            conn = DBUltis.makeConnection();
            String sql = "INSERT INTO User (Username, Password, name)" + "VALUES (?,?,?)";
            stm = conn.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setString(3, name);
            int row = stm.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }

    //NORMAL LOGIN
    public static User checkLogin(String username, String password) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Connection conn = null;
        try {
            conn = DBUltis.makeConnection();
            String sql = "SELECT * FROM User WHERE Username=? AND Password=?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                String user = rs.getString(2);
                String name = rs.getString(4);

                User userInfo = new User();
                userInfo.setUsername(user);
                userInfo.setName(name);
                return userInfo;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return null;
    }
    
    //REG FB
    public static boolean registerFB(String username, String password, String facebookID) {
        PreparedStatement stm = null;
        Connection conn = null;
        try {
            conn = DBUltis.makeConnection();
            String sql = "INSERT INTO User (Username, Password, FacebookID, FacebookLink)" + "VALUES (?,?,?,?)";
            stm = conn.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setString(3, facebookID);
            
            int row = stm.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }
    
    //FB LOGIN
    public static User checkLogin(String facebookID) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Connection conn = null;
        try {
            conn = DBUltis.makeConnection();
            String sql = "SELECT * FROM User WHERE FacebookID  =?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, facebookID);
            rs = stm.executeQuery();
            if (rs.next()) {
                String user = rs.getString(2);
                String name = rs.getString(4);
                String faceID = rs.getString(5);
                String faceLink = rs.getString(6);
                
                User userInfo = new User();
                userInfo.setUsername(user);
                userInfo.setName(name);
                return userInfo;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return null;
    }
}
