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
    <title>编辑员工信息</title>
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
            padding: 50px 200px;
            box-sizing: border-box;
            /*添加阴影*/
            box-shadow: 0 0 5px 5px rgba(0,0,0,0.4);

            color: white;
        }

        .title-txt{
            text-align: center;
            color: white;
            font-size: 25px;
            margin-bottom: 20px;
        }

        .staff-edit-in > div > input{
            width: 50%;
            height: 30px;
            /*透明色*/
            background: transparent;
            /*清除默认边框*/
            border: none;
            /*添加底部边框*/
            border-bottom: 1px solid white;
            /*清除蓝色点击框*/
            outline: none ;
            /*改变文字颜色*/
            color: white;
            margin-left: 10px;
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
            <div class="staff-edit-contain">
                <div class="title-txt">员工信息编辑</div>
                <form method="post" action="/editStaff">
                    <c:choose>
                        <c:when test="${staff.staffID==-1}">
                            <div class="staff-edit-in">

                                <input type="hidden" value="-1" name="staffID"/>
                                <div class="staff-edit-row">员工姓名：<input type="text" name="staffName"><br/></div>
                                <div class="staff-edit-row">基础工资：<input type="text" name="basicSalary"><br/></div>
                                <div class="staff-edit-row">保险费用：<input type="text" name="safeSalary"><br/></div>
                                <div class="staff-edit-row">员工等级：<select name="staffGrade">
                                    <option value ="0">员工</option>
                                    <option value ="1">经理</option>
                                </select><br/></div>
                                <div class="staff-edit-row">员工部门：<select name="deptID">
                                    <c:forEach items="${deptList}" var="dept">
                                        <option value ="${dept.deptID}">${dept.deptName}</option>
                                    </c:forEach>
                                </select><br/></div>
                            </div>
                            <div class="staff-edit-submit">
                                <input class="submit-txt" type="submit" value="添加员工信息"/>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <div class="staff-edit-in">
                                <input type="hidden" value="${staff.staffID}" name="staffID"/>
                                <div class="staff-edit-row">员工姓名：<input type="text" name="staffName" value="${staff.staffName}"><br/></div>
                                <div class="staff-edit-row">基础工资：<input type="text" name="basicSalary" value="${staff.basicSalary}"><br/></div>
                                <div class="staff-edit-row">保险费用：<input type="text" name="safeSalary" value="${staff.safeSalary}"><br/></div>
                                <div class="staff-edit-row">员工等级：<select name="staffGrade">
                                    <c:choose>
                                        <c:when test="${staff.staffGrade=='0'}">
                                            <option value ="0" selected = "selected">员工</option>
                                            <option value ="1">经理</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value ="0">员工</option>
                                            <option value ="1" selected = "selected">经理</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select><br/></div>
                                <div class="staff-edit-row">员工部门：<select name="deptID">
                                    <c:forEach items="${deptList}" var="dept">
                                        <option value ="${dept.deptID}" <c:if test="${staff.deptID==dept.deptID}">selected = "selected"</c:if>>${dept.deptName}</option>
                                    </c:forEach>
                                </select><br/></div>
                            </div>
                            <div class="staff-edit-submit">
                                <input class="submit-txt" type="submit" value="修改员工信息"/>
                            </div>
                        </c:otherwise>
                    </c:choose>


                </form>
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

