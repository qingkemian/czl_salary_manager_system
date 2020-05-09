<%@ page import="com.sun.org.apache.xpath.internal.operations.String" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 15/04/2020
  Time: 08:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>input</title>
</head>
<body bgcolor="aqua">
<font size="4">
    <form action="second.jsp" method="get" name="form">
        <b>请输入姓名：</b><input type="text" name="name">
        <br><input type="submit" value="提交" name="submit">
    </form>
</font>
</html>
