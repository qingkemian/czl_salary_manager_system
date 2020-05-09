<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>input</title>
	<style type="text/css">
		div{background-color:rgb(0, 255, 255)}
	</style>
</head>
<body>
	<div>
		<form action="recerve.jsp" method="get">
			<p>请输入下列信息：</p>
			<p>请输入您的姓名：<input type="text" name="text" /></p>
			选择性别：
			男<input name="sex" type="radio" value="男" />
			女<input name="sex" type="radio" value="女" />
			<br>
			选择您喜欢的歌手:
			<input type="checkbox" name="singer" value="张歌手"/><label>张歌手</label>
			<input type="checkbox" name="singer" value="刘歌手"/><label>刘歌手</label>
			<input type="checkbox" name="singer" value="王歌手"/><label>王歌手</label>
			<input type="checkbox" name="singer" value="李歌手"/><label>李歌手</label>
			</br>
			<input type="submit" value="提交" />
		</form>
	</div>
</body>
</html>