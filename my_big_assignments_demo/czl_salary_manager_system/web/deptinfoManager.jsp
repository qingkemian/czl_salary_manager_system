<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 08/06/2020
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>部门</title>
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

        #contents{
            width: 700px;
            height: 400px;
            background: rgba(0,0,0,0.3);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: auto ;
            /*添加边框圆角*/
            border-radius: 10px;

            /*添加边距挤下去*/
            padding: 50px 0;
            box-sizing: border-box;
            /*添加阴影*/
            box-shadow: 0 0 5px 5px rgba(0,0,0,0.4);
        }

        table{
            color: white;
        }
        .staff-table{
            margin-left: 200px;
        }
        .table-title{
            text-align: center;
            color: white;
            font-size: 25px;
            margin-bottom: 20px;
        }
        .staff-new{
            margin-top: 30px;
            margin-left: 330px;
        }

        .staff-new a{
            color: #FF7373;
        }

        .staff-table table tr td a{
            color: #FF7373;
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
                <li><a href="index.jsp"><span>主页</span></a></li>
                <li><a href="/showAllStaffList"><span>员工</span></a></li>
                <li class="active"><a href="/showAllDeptList"><span>部门</span></a></li>
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
            <div class="staff-contains">
                <div class="staff-table">
                    <c:choose>
                        <c:when test="${!empty error}">
                            <p>${error}</p>
                        </c:when>
                        <c:otherwise>
                            <table border="1">
                                <caption class="table-title">部门列表</caption>
                                <tr>
                                    <th>
                                        部门号
                                    </th>
                                    <th>
                                        部门名称
                                    </th>
                                    <th>
                                        工资信息
                                    </th>
                                    <c:choose>
                                        <c:when test="${!empty user}">
                                            <th>
                                                修改
                                            </th>
                                            <th>
                                                删除
                                            </th>
                                        </c:when>
                                    </c:choose>
                                </tr>
                                <c:forEach items="${deptList}" var="dept" >
                                    <tr>
                                        <td>
                                                ${dept.deptID}
                                        </td>
                                        <td>
                                                ${dept.deptName}
                                        </td>
                                        <td>
                                            <a href="/showDeptSalaryTable?deptID=${dept.deptID}">查看详情</a>
                                        </td>
                                        <c:choose>
                                            <c:when test="${!empty user && dept.deptName!='无'}">
                                                <td>
                                                    <a href="/showEditDept?deptID=${dept.deptID}">修改</a>
                                                </td>
                                                <td>
                                                    <a href="/deleteDept?deptID=${dept.deptID}">删除</a>
                                                </td>
                                            </c:when>
                                        </c:choose>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="staff-new">
                    <c:choose>
                        <c:when test="${!empty user}">
                            <a href="/showEditDept?deptID=-1">新增部门</a>
                        </c:when>
                    </c:choose>
                </div>
            </div>
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
