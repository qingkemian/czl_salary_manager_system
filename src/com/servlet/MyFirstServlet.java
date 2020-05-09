package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * servlet
 * 开发者不会去new MyFirstServlet
 */
public class MyFirstServlet extends HttpServlet {
    // 覆盖doGet() / doPost() 方法

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 向浏览器输出内容
        // 设置编码
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("hello, 这是我的第一个Servlet...");
        response.getWriter().write("当前系统时间是："+new Date());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}