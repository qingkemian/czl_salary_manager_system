<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 08/06/2020
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>部门员工工资表</title>
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

        .staff-salary-cal{
            margin-top: 20px;
            margin-left: 500px;
        }

        .staff-salary-table{
            margin-left: 100px;
        }

        .staff-name{
            margin-left: 30px;
        }
        .table-title{
            text-align: center;
            color: white;
            font-size: 18px;
            margin-bottom: 20px;
        }

        th{
            color:white;
        }

        td{
            color:white;
        }

        .staff-salary-table{
            margin-left: 400px;
        }

        .submit-txt{
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

            <c:choose>
                <c:when test="${!empty error}">
                    ${error}
                </c:when>
                <c:when test="${empty salaryStaffList}">
                    <div class="staff-no-salary">该部门的员工工资信息未录入!</div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${salaryStaffList}" var="salaryList">
                        <div class="staff-salary-contain">
                            <p class="staff-name">员工姓名:${salaryList[0].staffName}</p>
                            <table class="staff-salary-table" border="1">
                                <caption class="table-title">员工工资表</caption>
                                <tr>
                                    <th>
                                        年份
                                    </th>
                                    <th>
                                        月份
                                    </th>
                                    <th>
                                        销售金额
                                    </th>
                                    <th>
                                        奖金
                                    </th>
                                    <th>
                                        总工资
                                    </th>
                                    <c:choose>
                                        <c:when test="${!empty user}">
                                            <th>
                                                操作
                                            </th>
                                        </c:when>
                                    </c:choose>

                                </tr>
                                <c:forEach items="${salaryList}" var="salary">
                                    <tr>
                                        <td>
                                                ${salary.salaryYear}
                                        </td>
                                        <td>
                                                ${salary.salaryMonth}
                                        </td>
                                        <td>
                                                ${salary.saleSalary}

                                        </td>
                                        <c:choose>
                                            <c:when test="${salary.flag==0}">
                                                <td>
                                                    未计算
                                                </td>
                                                <td>
                                                    未计算
                                                </td>
                                                <c:choose>
                                                    <c:when test="${!empty user}">
                                                        <td>
                                                            无
                                                        </td>
                                                    </c:when>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <td>
                                                        ${salary.bonus}
                                                </td>
                                                <td>
                                                        ${salary.salaryTotal}
                                                </td>
                                                <c:choose>
                                                    <c:when test="${!empty user}">
                                                        <c:choose>
                                                            <c:when test="${salary.salaryMonth==12}">
                                                                <td>
                                                                    <a href="/updateYearSalary?staffID=${salary.staffID}&salaryYear=${salary.salaryYear}&type=2">更新</a>
                                                                </td>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <td>
                                                                    无
                                                                </td>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                </c:choose>

                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            <div class="staff-salary-cal">
                <c:choose>
                    <c:when test="${!empty user && !empty salaryStaffList}">
                        <a class="submit-txt" href="/calaDeptSalary?deptID=${deptID}">计算所有员工工资</a>
                    </c:when>
                </c:choose>
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
