package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class kisiEkle_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    <title>Kişi Ekle</title>\n");
      out.write("    <style>\n");
      out.write("        *{\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            list-style: none;\n");
      out.write("            box-sizing: border-box;\n");
      out.write("        }\n");
      out.write("        img{\n");
      out.write("            width: 100%;\n");
      out.write("            height: 100%;\n");
      out.write("            position: absolute;\n");
      out.write("            z-index: -10;\n");
      out.write("            margin-top: -50px;\n");
      out.write("            opacity: 0.75;\n");
      out.write("        }\n");
      out.write("        h1{\n");
      out.write("            text-align: center;\n");
      out.write("            margin: 50px;\n");
      out.write("            color: blue;\n");
      out.write("            font-family: arial;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("        .merkez{\n");
      out.write("            width: 750px;\n");
      out.write("            height: 400px;\n");
      out.write("            margin: 50px auto;\n");
      out.write("            border: 3px solid blue;\n");
      out.write("            background: #ccc;\n");
      out.write("            padding: 50px;\n");
      out.write("            border-radius: 25px;\n");
      out.write("        }\n");
      out.write("        form{\n");
      out.write("            width: 50%;\n");
      out.write("            text-align: center;\n");
      out.write("            margin: 50px auto;\n");
      out.write("            line-height: 35px;\n");
      out.write("        }\n");
      out.write("        form label{\n");
      out.write("            float: left;\n");
      out.write("            font-family: arial;\n");
      out.write("        }\n");
      out.write("        form .txt{\n");
      out.write("            float: right;\n");
      out.write("            width: 200px;\n");
      out.write("            height: 25px;\n");
      out.write("            text-align: center;\n");
      out.write("            border: none;\n");
      out.write("            outline: none;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            box-shadow: 2px 2px 5px 2px rgba(0,0,0,0.25) inset, 2px 2px 5px 2px rgba(0,0,0,0.25);\n");
      out.write("            transition: 300ms;\n");
      out.write("        }\n");
      out.write("        form .txt:focus{\n");
      out.write("            box-shadow: 2px 2px 5px 2px rgba(0,0,0,0.75) inset, 2px 2px 5px 2px rgba(0,0,0,0.75);\n");
      out.write("        }\n");
      out.write("        .btn{\n");
      out.write("            margin: 25px;\n");
      out.write("            padding: 10px 15px;\n");
      out.write("            color: #333;\n");
      out.write("            background: white;\n");
      out.write("            border: 1px solid #333;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            cursor: pointer;\n");
      out.write("            transition: 300ms;\n");
      out.write("        }\n");
      out.write("        .btn:hover{\n");
      out.write("            color:white;\n");
      out.write("            background: #333;\n");
      out.write("            border-color: white;\n");
      out.write("        }\n");
      out.write("        .butonlar{\n");
      out.write("            width: auto;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<img src = \"otopark.png\"/>\n");
      out.write("    <h1>Lütfen Eklemek İstediğiniz Kişinin Bilgilerini Giriniz</h1>\n");
      out.write("<div class = \"merkez\">\n");
      out.write("    <form action = \"\" method = post>\n");
      out.write("        <label for = \"park\" class = \"label\">Park Yeri : </label>\n");
      out.write("        <input type = \"text\" id = \"park\" class = \"txt\"/>\n");
      out.write("        <br>\n");
      out.write("        <label for = \"kAdi\" class = \"label\">Kullanıcı Adı : </label>\n");
      out.write("        <input type = \"text\" id = \"kAdi\" class = \"txt\"/>\n");
      out.write("        <br>\n");
      out.write("        <label for = \"sifre\" class = \"label\">Şifre : </label>\n");
      out.write("        <input type = \"password\" id = \"sifre\" class = \"txt\"/>\n");
      out.write("        <br>\n");
      out.write("        <label for = \"eposta\" class = \"label\">E Posta : </label>\n");
      out.write("        <input type = \"email\" id = \"eposta\" class = \"txt\"/>\n");
      out.write("        <br>\n");
      out.write("        <label for = \"telNo\" class = \"label\">Telefon No : </label>\n");
      out.write("        <input type = \"text\" id = \"telNo\" class = \"txt\"/>\n");
      out.write("        <br>\n");
      out.write("        <label for = \"kTipi\" class = \"label\">Kullanıcı Tipi : </label>\n");
      out.write("        <select id = \"kTipi\" class = \"txt\">\n");
      out.write("            <option>Admin</option>\n");
      out.write("            <option>Kullanıcı</option>\n");
      out.write("        </select>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </form>\n");
      out.write("    <hr>\n");
      out.write("        <div class = \"butonlar\">\n");
      out.write("            <input type = \"button\" class = \"btn\" value = \"Geri\"/>\n");
      out.write("            <input type = \"submit\" class = \"btn\" value = \"Ekle\"/>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
