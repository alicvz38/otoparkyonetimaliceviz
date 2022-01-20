/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Kullanicilar;

/**
 *
 * @author Ali Ceviz
 */
public class user {
    private String Kullanici_adi;
    private String sifre;
    private String eposta;
    private String telNo;
    private String parkYeri;
    
    public user(){
        
    }
    
    public user(String Kullanici_adi, String sifre, String eposta, String telNo, String parkYeri){
        this.Kullanici_adi = Kullanici_adi;
        this.sifre = sifre;
        this.eposta = eposta;
        this.telNo = telNo;
        this.parkYeri = parkYeri;
    }
    
    public void setKullanici_adi(String Kullanici_adi){
        this.Kullanici_adi = Kullanici_adi;
    }
    
    public String getKullanici_adi(){
        return Kullanici_adi;
    }
    public void setSifre(String sifre){
        this.sifre = sifre;
    }
    
    public String getSifre(){
        return sifre;
    }
    public void setEposta(String eposta){
        this.eposta = eposta;
    }
    
    public String getEposta(){
        return eposta;
    }
    public void setTelNo(String telNo){
        this.telNo = telNo;
    }
    
    public String getTelNo(){
        return telNo;
    }
    public void setParkYeri(String parkYeri){
        this.parkYeri = parkYeri;
    }
    
    public String getParkYeri(){
        return parkYeri;
    }
}
