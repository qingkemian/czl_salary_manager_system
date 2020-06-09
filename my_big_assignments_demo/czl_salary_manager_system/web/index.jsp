<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 08/06/2020
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <title>主页</title>
  <style type="text/css">
    *{
      padding: 0;
      margin: 0;
    }

    html{
      height: 100%;
    }

    body{
      height: 100%;
      background-image: url(img/back.jpg);
    }

    #wrap{
      height: 95%;
    }

    #pagefooter{
      font-size: 10px;
      margin-left: 20px;
    }

    a{
      text-decoration: none;
      color: white;
      margin: 15px;
      text-transform: uppercase;
    }

    li{
      color: white;
    }

    #top{
      background: rgba(0,0,0,0.3);
      width: 100%;
      height: 70px;
      line-height: 70px;
    }

    #mainnav ul{
      display: flex;
      justify-content: right;
      list-style: none;
      margin-right: 5%;
      float: right;
    }

    #sitename a{
      margin-top: 0;
      margin-left: 10%;
      font-weight: bold;
      font-size: 35px;
      float: left;
    }

    #page{
      font-size: 30px;
      color: white;
      background: rgba(0,0,0,0.3);
      height: 500px;
      width: 50%;
      text-align: center;
      line-height: 500px;
      position: absolute;
      top: 50%;
      left: 50%;
      -webkit-transform: translate(-50%, -50%);
      -moz-transform: translate(-50%, -50%);
      -ms-transform: translate(-50%, -50%);
      -o-transform: translate(-50%, -50%);
      transform: translate(-50%, -50%);
    }

  </style>
</head>
<body>
<div id="wrap">

  <section id="top">
    <nav id="mainnav">
      <h1 id="sitename" class="logotext">
        <a href="#">工资管理系统</a>
      </h1>
      <ul>
        <li class="active"><a href="index.jsp"><span>主页</span></a></li>
        <li><a href="/showAllStaffList"><span>员工</span></a></li>
        <li><a href="/showAllDeptList"><span>部门</span></a></li>
        <li><a href="salaryinfoManager.jsp"><span>工资</span></a></li>
        <c:choose>
          <c:when test="${!empty user}">
            <li>欢迎您：${user.username}</li>
            <li><a href="/logout"><span>注销</span></a></li>
          </c:when>
          <c:otherwise>
            <li><a href="login.jsp"><span> 登录</span></a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </nav>
  </section>
  <section id="page">
    <header id="pageheader" class="homeheader">

    </header>

    <section id="contents">

      <div class="index-text">欢迎使用工资管理系统！</div>

    </section>

    <div class="clear"></div>

    <div class="clear"></div>
  </section>
</div>
<footer id="pagefooter">
  <div id="f-content">
    <div id="social-links">

    </div>
    <div id="credits">
      <a class="sitecredit" href="#">陈泽龙、谢小文、陈海桦、田渊明</a>

    </div>
  </div>

</footer>
</body>
</html>
