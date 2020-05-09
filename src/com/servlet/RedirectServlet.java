package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RedirectServlet extends HttpServlet{
    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws IOException,ServletException{

        // 此处添加若干代码
        String  username = request.getParameter("username");
        String  pwd = request.getParameter("password");
        if (username.trim().equals("admin")&&pwd.trim().equals("admin")){
            response.sendRedirect("welcome.html");
        }else {
            response.sendRedirect("error.html");
        }
    }
}