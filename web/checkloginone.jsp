<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16/04/2020
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>checkloginone</title>
</head>
<body>
<%
    Object user = session.getAttribute("User");
    Object psw = session.getAttribute("Psw");
    if (request.getParameter("username").equals(user)  && request.getParameter("psd").equals(psw)){
        out.println("登录成功");
    }
    else{
        out.println("登录失败" );
    }
%>
</body>
</html>
