<%-- 
    Document   : kullaniciSayfa
    Created on : 12.Oca.2022, 11:38:05
    Author     : Ali Ceviz
--%>

<%@page import="Kullanicilar.user"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBUser.DBUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hoş Geldiniz</title>
    <style>
          *{
            margin: 0;
            padding: 0;
            list-style: none;
            box-sizing: border-box;
        }
        img{
            width: 100%;
            height: 100%;
            position: absolute;
            z-index: -10;
            margin-top: -50px;
            opacity: 0.75;
        }
        .merkez{
            width: 750px;
            margin: 50px auto;
            border: 3px solid blue;
            background: #ccc;
            padding: 50px;
            border-radius: 25px;;
        }
        form{
            width: 50%;
            text-align: center;
            margin: 50px auto;
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
        h1{
            text-align: center;
            margin: 50px;
            color: blue;
            font-family: arial;
            font-weight: bold;
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
        .butonlar{
            width: auto;
            text-align: center;
        }
        .kullanici{
            margin: 15px auto;
            width: 40%;
            padding: 10px 15px;
            box-shadow: 3px 3px 5px 3px rgba(75,0,0,0.5) inset, 3px 3px 5px 3px rgba(75,0,0,0.5);
            background: #fff;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<img src = "otopark.png"/>
<%
        
        Cookie [] cookies = request.getCookies();
        DBUser db = new DBUser();
        HttpSession oturum = request.getSession();
               String kullanici = "";
               boolean d = oturum.getAttribute("kullanici") != null;
               if(d){
                   kullanici =oturum.getAttribute("kullanici").toString();
               }
if(cookies != null){
    for(int i = 0; i < cookies.length; i++){
        if(cookies[i].getName().equals("Kullanici_adi")){
            kullanici = cookies[i].getValue();
            break;
        }
    }
}
    %>
    
    <p class = "kullanici" style="color: red; font-size: 24px; text-align: center">Hoş Geldiniz <%=kullanici %></p><br>
    <div class = "merkez">
        <form action = "" method = "post">
            <%
                ResultSet result = db.kullaniciGetir();
                while (result.next()) {
                    if(result.getString("Kullanici_adi") == kullanici){
                        String sifre = result.getString("sifre");
                        String eposta = result.getString("eposta");
                        String telNo = result.getString("telNo");
                        String parkYeri = result.getString("parkYeri");
                    }else{
                        break;
                    }
                }
            %>
            <label for = "park" class = "label">Park Yeri : </label>
            <input type = "text" name = "park" id = "park" class = "txt"/>
            <br>
            <label for = "kAdi">Kullanıcı Adı : </label>
            <input type = "text" name = "kAdi" id = "kAdi" class = "txt" value = "<%=kullanici%>"/>
            <br>
            <label for = "sifre">Şifre : </label>
            <input type = "password" name = "sifre" id = "sifre" class = "txt"/>
            <br>
            <label for = "eposta" class = "label">E Posta : </label>
            <input type = "email" name = "eposta" id = "eposta" class = "txt"/>
            <br>
            <label for = "telNo" class = "label">Telefon No : </label>
            <input type = "text" name = "telNo" id = "telNo" class = "txt"/>
            <br>
        <div class = "butonlar">
            <input type = "submit" name = "guncelle" class = "btn" value = "Bilgilerimi Güncelle"/>
            <input type = "submit" name = "cikis" class = "btn" value = "Çıkış Yap"/>

        </div>
            
        </form>
        
    </div>
           <%
               
                String park = request.getParameter("park");
                String kul = request.getParameter("kAdi");
                String sifre = request.getParameter("sifre");
                String eposta = request.getParameter("eposta");
                String telNo = request.getParameter("telNo");
                String guncelle = request.getParameter("guncelle");
                String cikis = request.getParameter("cikis");
        
        user usr= new user(kul, sifre, eposta, telNo, park);
        DBUser dbuser = new DBUser();
        user us = new user();
        if(guncelle != null){
           dbuser.kullanici_guncelle(us, kul);
                response.sendRedirect("girisSayfasi.jsp");
        }
            if(cikis !=null){
                response.sendRedirect("girisSayfasi.jsp");
            }
           %>
</body>
</html>
