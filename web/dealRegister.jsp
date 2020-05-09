<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/15
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  session="true" %>
<html>
<head>
    <title>dealregister</title>
</head>
<body>
<%
    String Username=request.getParameter("RegistUserName");
    String password=request.getParameter("Registpassword");

    session.setAttribute("User",Username);
    session.setAttribute("Psw",password);

    response.sendRedirect("loginone.html");
%>
</body>
</html>
