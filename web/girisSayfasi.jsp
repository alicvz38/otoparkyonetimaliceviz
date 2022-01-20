<%-- 
    Document   : girisSayfasi
    Created on : 12.Oca.2022, 11:38:58
    Author     : Ali Ceviz
--%>

<%@page import="DBUser.DBUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Otopark Yönetim Sistemi</title>
    <style>
        img{
            width: 100%;
            height: 100%;
            position: absolute;
            z-index: -10;
            margin-top: -50px;
            opacity: 0.75;
        }
        *{
            margin: 0;
            padding: 0;
            list-style: none;
            box-sizing: border-box;
            
        }
        h1{
            text-align: center;
            margin: 50px;
            color: blue;
            font-family: arial;
            font-weight: bold;
        }
        .merkez{
            width: 750px;
            height: 400px;
            margin: 50px auto;
            border: 3px solid blue;
            background: #ccc;
            padding: 50px;
            border-radius: 50%;
        }
        form{
            width: 50%;
            text-align: center;
            margin: 75px auto;
            line-height: 35px;
        }
        form label{
            float: left;
            font-family: arial;
        }
        form .txt{
            float: right;
            width: 200px;
            height: 25px;
            text-align: center;
            border: none;
            outline: none;
            border-radius: 5px;
            box-shadow: 2px 2px 5px 2px rgba(0,0,0,0.25) inset, 2px 2px 5px 2px rgba(0,0,0,0.25);
            transition: 300ms;
        }
        form .txt:focus{
            box-shadow: 2px 2px 5px 2px rgba(0,0,0,0.75) inset, 2px 2px 5px 2px rgba(0,0,0,0.75);
        }
        #hatirla{
            float: left;
            margin: 7px;
            width: 15px;
            height: 15px;
        }
        .btn{
            margin: 25px;
            padding: 10px 15px;
            color: #333;
            background: white;
            border: 1px solid #333;
            border-radius: 5px;
            cursor: pointer;
            transition: 300ms;
        }
        .btn:hover{
            color:white;
            background: #333;
            border-color: white;
        }
    </style>
</head>
<body>
<img src ='otopark.png'></img>

    <h1>Otopark Yönetim Sistemi'ne Hoş Geldiniz<br>Kullanıcı Adınızı ve Şifrenizi Girerek Giriş Yapınız</h1>
<div class = "merkez">
    <form action = "" method = "post">
        <label for = "kAdi" class = "label">Kullanıcı Adı : </label>
        <input type = "text" name = "kAdi" id = "kAdi" class = "txt" placeholder = "Kullanıcı adınızı giriniz"/>
        <br>
        <label for = "sifre" class = "label">Şifre : </label>
        <input type = "password" name = "sifre" id = "sifre" class = "txt" placeholder = "Şifrenizi giriniz"/>
        <br>
        <input type = "checkbox" id = "hatirla"/>
        <label for = "hatirla" name = "hatirla" class = "label">Oturumu Açık Tut</label>
        <br>
        <input type = "submit" name = "giris" id = "giris" class = "btn" value = "Giriş Yap"/>
        <div class = "kontrol">
           
        </div>
    </form>
</div>
     <% 
    String kullanici = request.getParameter("kAdi");
    String sifre = request.getParameter("sifre");
    String giris = request.getParameter("giris"); 
    
        Cookie ckKullanici = null;
        Cookie ckSifre = null;
        Cookie ckDurum = null;
        String name = "";
        String pass = "";
        boolean durum = request.getParameter("hatirla") != null;
   
    DBUser db =  new DBUser();

    HttpSession oturum = request.getSession(true);
    oturum.setAttribute("Kmail", kullanici);
        oturum.setAttribute("kullanici", kullanici);

 %> 
    <%  
if(kullanici !=null && sifre !=null && giris !=null){
    db.veriAl(kullanici, sifre);
    db.veriAl2(kullanici, sifre);
    
    
             ckDurum = new Cookie("durum", "true");
             ckKullanici = new Cookie("kullanici", kullanici);
             ckSifre = new Cookie("sifre", sifre);
    
    
    
    Cookie[] allCookies = request.getCookies();
         if (allCookies != null) {
                 for(Cookie cook: allCookies){
                     if(cook.getName().equalsIgnoreCase("kullanici")){
                         name = cook.getValue();
                     }
                     else if(cook.getName().equalsIgnoreCase("sifre")){
                         pass = cook.getValue();
                     }
                 }
             }
         
         if(allCookies != null){
             for(int i = 0; i < allCookies.length; i++){
             if(allCookies[i].getValue().contains("true")){
                 
                        if(DBUser.entry){
                      response.sendRedirect(request.getContextPath() + "/kullaniciSayfa.jsp");
                      break;
                        }else if(DBUser.entry2){
                      response.sendRedirect(request.getContextPath() + "/adminSayfa.jsp");
                      break;
        }
                  }
             else{
                 System.out.println("bulunamadi");
             }
         }
         }
         if(giris != null && !kullanici.equals("") && !sifre.equals("")){
    db.veriAl(kullanici, sifre);
    db.veriAl2(kullanici, sifre);
            if(DBUser.entry){
                if(durum){
                         ckDurum.setMaxAge(1000);
                         response.addCookie(ckDurum);
                         ckKullanici.setMaxAge(1000);
                         response.addCookie(ckKullanici);
                         ckSifre.setMaxAge(1000);
                         response.addCookie(ckSifre);
                }
                response.sendRedirect("kullaniciSayfa.jsp");
            }else if(DBUser.entry2){
                if(durum){
                         ckDurum.setMaxAge(1000);
                         response.addCookie(ckDurum);
                         ckKullanici.setMaxAge(1000);
                         response.addCookie(ckKullanici);
                         ckSifre.setMaxAge(1000);
                         response.addCookie(ckSifre);
                }
                        response.sendRedirect("adminSayfa.jsp");
            }
            
    
    
}
}
%>  
    
    
</body>
</html>
