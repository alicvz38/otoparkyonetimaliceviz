<%-- 
    Document   : adminSayfa
    Created on : 12.Oca.2022, 11:37:47
    Author     : Ali Ceviz
--%>

<%@page import="DBUser.DBUser"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Kullanicilar.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kişi Bilgileri</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            list-style: none;
            box-sizing: border-box;
        }
        img{
            width: 100%;
            height: 120%;
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
            padding: 20px;
            border-radius: 25px;;
        }
        table{
            text-align: center;
            margin: 25px auto;
        }
        table tr th, table tr td{
            padding: 5px 10px;
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
            text-align: center;
        }
        .admin{
            margin: 15px auto;
            width: 40%;
            padding: 10px 15px;
            box-shadow: 3px 3px 5px 3px rgba(75,0,0,0.5) inset, 3px 3px 5px 3px rgba(75,0,0,0.5);
            background: #fff;
            border-radius: 10px;
        }
        .park{
            background: #fff;
        }
        a{
            text-decoration: none;
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
        form .txt:focus{
            box-shadow: 2px 2px 5px 2px rgba(0,0,0,0.75) inset, 2px 2px 5px 2px rgba(0,0,0,0.75);
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
        .merkez h1{
            text-align: center;
            font-size: 24px;
            color:red;
            
        }
    </style>
</head>
<body>
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
if(kullanici == ""){
    response.sendRedirect("girisSayfasi.jsp");
}
    %>
<img src = "otopark.png"/>
    <p class = "admin" style="color: red; font-size: 24px; text-align: center">Hoş Geldiniz <%=kullanici %></p><br>
<div class = "merkez">
    <p style="color: red; font-size: 24px; text-align: center">Kullanıcılarınızı Buradan Kontrol Edebilirsiniz</p>
    <table border = 1 cellspacing = 0>
        <tr>
            <th class = "park">Park Yeri</th>
            <th>Kullanıcı Adı</th>
            <th>Şifre</th>
            <th>E Posta</th>
            <th>Telefon No</th>
            <th>İşlem</th>
           <%
             
              ResultSet result = db.kullaniciGetir();
              
                while (result.next()) {
                    
                    
                        out.print("<tr>");
                        out.print("<td class = 'park'>" + result.getString("parkYeri")+"</td>");
                        out.print("<td>" + result.getString("Kullanici_adi")+"</td>" );
                        out.print("<td>" + result.getString("sifre")+"</td>");
                        out.print("<td>" + result.getString("eposta")+"</td>");
                        out.print("<td>" + result.getString("telNo")+"</td>");
                       %>  
                       <td><a href="adminSayfa.jsp?kAdi=<%= result.getString("Kullanici_adi")%>#fourth">X</a></td>
                       <%
                        out.print("<tr>");
                        
                    }

                       String sil = request.getParameter("kAdi");
                       if(sil != null){
                       db.kullanicisil(sil);
                        response.sendRedirect("adminSayfa.jsp");
}
              
              
              
              %>
        
    </table>
              <hr><br>
    <h1>Lütfen Eklemek İstediğiniz Kişinin Bilgilerini Giriniz</h1>
     <form action = "" method = post>
        <label for = "park" class = "label">Park Yeri : </label>
        <input type = "text" name = "park" id = "park" class = "txt"/>
        <br>
        <label for = "kAdi" class = "label">Kullanıcı Adı : </label>
        <input type = "text" name = "kAdi" id = "kAdi" class = "txt"/>
        <br>
        <label for = "sifre" class = "label">Şifre : </label>
        <input type = "password" name = "sifre" id = "sifre" class = "txt"/>
        <br>
        <label for = "eposta" class = "label">E Posta : </label>
        <input type = "email" name = "eposta" id = "eposta" class = "txt"/>
        <br>
        <label for = "telNo" class = "label">Telefon No : </label>
        <input type = "text" name = "telNo" id = "telNo" class = "txt"/>
        <br>
    <input type = "submit" name = "ekle" class = "btn" value = "Kullanıcı Ekle"/>
        
        
    </form>
    <hr>
    <form class = "butonlar" action = "" method = "post">
    <input type = "submit" name = "cikis" class = "btn" value = "Çıkış Yap"/>
        
    </form>
</div>
        <%   
        String park = request.getParameter("park");
        String kul = request.getParameter("kAdi");
        String sifre = request.getParameter("sifre");
        String eposta = request.getParameter("eposta");
        String telNo = request.getParameter("telNo");
        String kytbtn = request.getParameter("ekle");
        String cikis = request.getParameter("cikis");
        
        user usr= new user(kul, sifre, eposta, telNo, park);
        DBUser dbuser = new DBUser();
        
        

        if(kytbtn !=null){
            
                dbuser.kisiEkle(usr);
           
            
        }
        if(cikis !=null){
            
            response.sendRedirect("girisSayfasi.jsp");
            
        }
    %>
</body>
</html>
