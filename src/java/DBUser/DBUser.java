/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBUser;

import Kullanicilar.user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
/**
 *
 * @author Ali Ceviz
 */
public class DBUser {
    user user1 = new user();
    public static final String DB_URL = "jdbc:mysql://localhost:3306/otopark";
    public static final String USER="root";
    public static final String PASSWORD="root";
    public static boolean entry = false;
    public static boolean entry2 = false;
    public String kul ;
    public String sif ;        
    public String epos;        
    public String tel;        
    public String park;
    public void kisiEkle(user us) {
        Connection con =null;
        PreparedStatement psnt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            String sql ="INSERT INTO user(Kullanici_adi, sifre, eposta, telNo, parkYeri) VALUES(?, ?, ?, ?, ?)";
            psnt = con.prepareStatement(sql);
            psnt.setString(1,us.getKullanici_adi());
            psnt.setString(2,us.getSifre());
            psnt.setString(3,us.getEposta());
            psnt.setString(4,us.getTelNo());
            psnt.setString(5,us.getParkYeri());
            psnt.executeUpdate();
           psnt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("HATA :  "+ e);
        }
    }
    public  void veriAl(String kul, String sifre){
    Connection con =null;
    Statement st = null;
    ResultSet rs=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();
            String sql ="SELECT * FROM user";
            rs = st.executeQuery(sql);
            while(rs.next()) {
                if( kul.equals(rs.getString("Kullanici_adi")) && sifre.equals(rs.getString("sifre"))    ){
                    entry =true;
                    
                    System.out.println("BAŞARILI");
                    break;
                }else{
                    entry=false;
                }
            }
        }catch(Exception e){
            System.out.println(" HATA2 : " + e);
        }
}
    public  void veriAl2(String kul, String sifre){
    Connection con =null;
    Statement st = null;
    ResultSet rs=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();
            String sql ="SELECT * FROM admin";
            rs = st.executeQuery(sql);
            while(rs.next()) {
                if( kul.equals(rs.getString("Kullanici_adi")) && sifre.equals(rs.getString("sifre"))){
                    entry2 =true;
                 
                    break;
                }else{
                    entry2=false;
                }
            }
        }catch(Exception e){
            e.printStackTrace();
            System.out.println(" HATA2 : ");
        }
    }
    public  ResultSet veriUser(String kul) {
        Connection con =null;
        Statement st = null;
        ResultSet rs=null;
        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();  
            String sql ="SELECT * FROM user WHERE Kullanici_adi='" + kul + "'";
            rs = st.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : " );
        }
        return rs;
    }
    public  ResultSet veriAdmin(String kul) {
        Connection con =null;
        Statement st = null;
        ResultSet rs=null;
        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();  
            String sql ="SELECT * FROM admin WHERE Kullanici_adi='" + kul + "'";
            rs = st.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : " );
        }
        return rs;
    }
    
        
    public  void kullanici_guncelle(user us, String kullanici){
        Connection con =null;
    Statement st = null;
    ResultSet rs=null;
   
    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();
            String sql ="UPDATE user set Kullanici_adi='" + us.getKullanici_adi()+ "', sifre='" + us.getSifre() + 
                            "', eposta='"+ us.getEposta()+ "', telNo='" + us.getTelNo() + "' WHERE Kullanici_adi='" + kullanici +"'";
            
            
            
            st.executeUpdate(sql);
      
        }catch(Exception e){
            System.out.println(" HATA2 : " + e);
        }
    }
     public  ResultSet kullaniciGetir() {
        Connection con =null;
        Statement st = null;
        ResultSet rs=null;
        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();  
            String sql ="SELECT * FROM user";
            rs = st.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : " );
        }
        return rs;
    }
    public  void kullanicisil(String kullanici){
        Connection conn = null;  
        PreparedStatement sorgu = null;
        try {
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
             
             sorgu = conn.prepareStatement("DELETE   FROM user WHERE Kullanici_adi='" + kullanici + "'");
             sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();       
        }
    }
}