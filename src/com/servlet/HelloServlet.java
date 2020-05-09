package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HelloServlet extends HttpServlet{
    public void service(HttpServletRequest request,
                        HttpServletResponse response)
            throws ServletException,IOException{
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h3>Hello World!</h3>");
        out.println("</body>");
        out.println("</html>");
    }
}