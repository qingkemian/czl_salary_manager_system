<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 15/04/2020
  Time: 08:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>recerve</title>
</head>
<body bgcolor="aqua">
<font size="4">
<%!
    int count;
    StringBuffer person;
    public void jige(){
        if (count==0)
            person=new StringBuffer();
    }
    public void addPerson(String p){
        if (count==0){
            person.append(p);
        }
        else {
            person.append(","+p);
        }
        count++;
    }
%>
<%
    String name = request.getParameter("name");
    byte bb[] = name.getBytes("iso-8859-1");
    name = new String(bb);
  if(name.length()==0||name.length()>10){
%>
<jsp:forward page="first.jsp" />
    <%
        }
        jige();
        addPerson(name);
    %>
    <br><b>目前共有<%=count%>人浏览了该页面，他们的名字是：</b>
    <br><%=person%>
    </font>
</body>
</html>
