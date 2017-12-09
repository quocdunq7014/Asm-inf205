
package model;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class CustomersModel {

    public CustomersModel() {
    }
    public boolean checkLogin(String user, String pass){
        try{
            Connection conn = DBConnect.getConnection();
            String sql = "select * from Customers where Username=? and Password=?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            boolean exist =false;
            exist = rs.next();
            rs.close();stm.close();conn.close();
            if(exist){
                return true;
            }           
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    //.............
}
