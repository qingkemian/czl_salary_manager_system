<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 08/06/2020
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工</title>
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
            width: 1300px;
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

            color: white;

            overflow: scroll;
        }

        #contents::-webkit-scrollbar {
            width: 4px;
        }

        #contents::-webkit-scrollbar-thumb {
            background-color: #d9d9d9;
        }

        th{
            color:white;
        }

        td{
            color:white;
        }

        .staff-table{
            margin-left: 300px;
        }
        .table-title{
            text-align: center;
            color: white;
            font-size: 25px;
            margin-bottom: 20px;
        }
        .staff-new{
            margin-top: 30px;
            margin-left: 550px;
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
                <li class="active"><a href="/showAllStaffList"><span>员工</span></a></li>
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
            <div class="staff-contains">
                <div class="staff-table">
                    <c:choose>
                        <c:when test="${!empty error}">
                            <p>${error}</p>
                        </c:when>
                        <c:otherwise>
                            <table border="1">
                                <caption class="table-title">员工列表</caption>
                                <tr>
                                    <th>
                                        员工号
                                    </th>
                                    <th>
                                        员工名称
                                    </th>
                                    <th>
                                        员工等级
                                    </th>
                                    <th>
                                        部门名称
                                    </th>
                                    <th>
                                        基础工资
                                    </th>
                                    <th>
                                        保险费用
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
                                <c:forEach items="${staffList}" var="staff" >
                                    <tr>
                                        <td>
                                                ${staff.staffID}
                                        </td>
                                        <td>
                                                ${staff.staffName}
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${staff.staffGrade == '0'}">
                                                    员工
                                                </c:when>
                                                <c:when test="${staff.staffGrade == '1'}">
                                                    经理
                                                </c:when>
                                                <c:otherwise>
                                                    未知
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                                ${staff.deptName}
                                        </td>
                                        <td>
                                                ${staff.basicSalary}
                                        </td>
                                        <td>
                                                ${staff.safeSalary}
                                        </td>
                                        <td>
                                            <a href="/showStaffSalaryTable?staffID=${staff.staffID}">查看详情</a>
                                        </td>
                                        <c:choose>
                                            <c:when test="${!empty user}">
                                                <td>
                                                    <a href="/showEditStaff?staffID=${staff.staffID}">修改</a>
                                                </td>
                                                <td>
                                                    <a href="/deleteStaff?staffID=${staff.staffID}">删除</a>
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
                            <a href="/showEditStaff?staffID=-1">新增员工</a>
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
