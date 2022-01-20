/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Kullanicilar;

import java.io.Serializable;

/**
 *
 * @author Ali Ceviz
 */
public class admin implements Serializable{
    private String Kullanici_adi;
    private String sifre;
    private String eposta;
    private String telNo;
    
    public admin(){
        
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
}
