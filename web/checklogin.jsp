<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/15
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>checklogin</title>
</head>
<body>
<%
    if (request.getParameter("username").equals("tom")  && request.getParameter("psd").equals("123")){
        out.println("登录成功");
    }
    else{
        out.println("登录失败" );
    }
%>
</body>
</html>
