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
    <title>登录</title>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        /*更改默认值*/
        html,body{
            width: 100%;
            height: 100%;
        }
        /*添加背景图片*/
        body{
            background-image: url(img/back.jpg);
        }
        /*让输入框居中*/
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
        /*改变盒子下方的输入框位置*/
        #contents > form > div{
            width: 350px;
            height: 50px;
            margin: 40px auto;
            /*改变字体颜色*/
            color: white;
        }

        /*改变标题居中, 并且改颜色*/
        #contents > p{
            text-align: center;
            color: white;
            font-size: 25px;
        }

        /*改变输入框文字*/
        #contents > div span{
            display: inline-block;
            cursor: pointer;
            font-size: 20px;
        }

        /*改变输入框样式*/
        #contents > form > div input{
            width: 100%;
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
        }
        /*改变点击登录按钮样式*/
        #contents  .form-submit{
            margin-left: 70px;
            width: 200px;
            height: 50px;
            /*添加圆角*/
            border-radius: 50px;
            /*设置背景颜色  渐变*/
            background-image: linear-gradient(to right ,#c979d4,#fa719d);
            text-align: center;
            box-sizing: border-box;
            font-size: 20px;
            border:none;
        }

        /*给登录按钮添加 鼠标放上效果 */
        #contents  .form-submit:hover{
            box-shadow: 0 0 10px rgba(0,0,0,0.5) inset;
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
    </style>
</head>
<body>

<c:choose>
    <c:when test="${!empty error}">
        <p> ${error}</p>
    </c:when>
</c:choose>

<div id="wrap">

    <section id="top">
        <nav id="mainnav">
            <h1 id="sitename" class="logotext">
                <a href="#">工资管理系统</a>
            </h1>
            <ul>
                <li><a href="index.jsp"><span>主页</span></a></li>
                <li><a href="/showAllStaffList"><span>员工</span></a></li>
                <li><a href="/showAllDeptList"><span>部门</span></a></li>
                <li><a href="salaryinfoManager.jsp"><span>工资</span></a></li>
                <c:choose>
                    <c:when test="${!empty user}">
                        <li>欢迎您：${user.username}</li>
                        <li class="active"><a href="/logout"><span>注销</span></a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="active"><a href="login.jsp"><span> 登录</span></a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </section>
    <section id="page">
        <header id="pageheader" class="homeheader">

        </header>
        <!--登录框-->
        <section id="contents">
            <!--标题-->
            <p class="loginTitle">Login</p>

            <form   class="FormContain" method="post" action="/login">
                <!--用户名-->
                <div class="form-usernameContain">
                <span>
                    <svg t="1586505199980" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1153" width="20" height="20"><path d="M902.073578 843.004763c-21.37789-54.960753-52.02591-104.361883-91.082438-146.82602-39.269375-42.694381-85.068468-76.247568-136.134517-99.737562-9.700943-4.459568-19.513426-8.513908-29.426193-12.168134 21.951965-12.276604 42.351574-27.578102 60.673871-45.680389 53.16178-52.53654 82.434477-122.382305 82.434477-196.678428 0-74.2951-29.271674-144.139841-82.434477-196.671265C652.941498 92.707448 582.261739 63.775512 507.078409 63.775512c-75.181283 0-145.861042 28.931936-199.022823 81.468476-53.157687 52.5304-82.435501 122.376165-82.435501 196.671265 0 74.296123 29.277814 144.141888 82.435501 196.678428 18.323321 18.101263 38.727023 33.403784 60.672848 45.680389-9.912767 3.65832-19.723204 7.707542-29.42517 12.168134-51.066049 23.489994-96.865141 57.043181-136.133493 99.737562-39.058574 42.469254-71.332628 91.272773-91.083461 146.82602-16.479323 46.352701-14.757099 92.137467-15.594163 113.518427l66.207911 0c-2.185782-152.698774 144.750755-331.47139 344.379375-331.47139 199.63169 0 350.428138 185.315636 351.007329 331.47139l66.207911 0C923.113777 915.197992 924.141176 899.734812 902.073578 843.004763L902.073578 843.004763zM291.845393 341.915253c0-117.2801 96.554056-212.695217 215.234039-212.695217 118.68203 0 215.236086 95.415117 215.236086 212.695217 0 117.281123-96.554056 212.697263-215.236086 212.697263C388.399449 554.612517 291.845393 459.196377 291.845393 341.915253L291.845393 341.915253zM291.845393 341.915253" p-id="1154" fill="#ffffff"></path></svg>

                </span>
                    <span>用户名</span>
                    <input class="form-input" type="text" name="username" placeholder="   UserName"/>
                </div>
                <!--密码-->
                <div class="form-passwadContain">
					<span>

						<svg t="1586505236680" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1983" width="20" height="20"><path d="M522.368 10.3936c-144.1536 0-252.9024 114.6624-252.9024 266.752l0 93.7472-8.192 0c-75.776 0-137.4464 63.3088-137.4464 141.0816l0 360.5248c0 77.7728 61.6704 141.1072 137.4464 141.1072l524.3392 0c75.776 0 137.4464-63.3344 137.4464-141.1072L923.0592 511.9744c0-77.7728-61.6704-141.0816-137.4464-141.0816l-4.5056 0c-1.2032-0.4352-2.4576-0.5632-3.712-0.768l0-93.0048C777.4464 125.0816 667.8016 10.3936 522.368 10.3936L522.368 10.3936zM522.368 52.224c123.52 0 213.248 94.592 213.248 224.9472l0 92.3648L311.3216 369.536l0-92.3648C311.3216 146.816 400.0768 52.224 522.368 52.224L522.368 52.224zM881.28 511.9744l0 360.5248c0 54.7328-42.9312 99.2768-95.616 99.2768L261.2992 971.776c-52.736 0-95.616-44.544-95.616-99.2768L165.6832 511.9744c0-54.7072 42.88-99.2512 95.616-99.2512l50.0224 0 0-1.3824 424.2688 0 0 1.3824 50.048 0C838.3488 412.7488 881.28 457.2672 881.28 511.9744L881.28 511.9744zM881.28 511.9744M518.8608 568.0384c-33.5104 0-60.672 28.0064-60.672 62.5664 0 23.1168 12.2368 43.3408 30.336 54.1696l0 102.1952c0 17.2544 13.568 31.3088 30.336 31.3088 16.7424 0 30.336-14.0544 30.336-31.3088L549.1968 684.8c18.0992-10.8288 30.3104-31.0272 30.3104-54.1696C579.456 596.0704 552.32 568.0384 518.8608 568.0384L518.8608 568.0384zM518.8608 568.0384" p-id="1984" fill="#ffffff"></path></svg>
					</span>
                    <span>密码</span>
                    <input class="form-input" type="password" name="password" placeholder="   PassWord"/>
                </div>
                <div><input class="form-submit" type="submit" value="登   录"/></div>
            </form>

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

