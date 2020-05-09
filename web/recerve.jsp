<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>recerve</title>
	<style type="text/css">
		div{background-color:rgb(0, 255, 255)}
	</style>
</head>
<body>
	<div>
		您的姓名:
		<% String name = request.getParameter("text"); %>
		<%=name%>
		<br>
		您的性别:
		<% String sex = request.getParameter("sex");%>
		<%=sex%>
		<br>
   	 	您喜欢的歌手:
    	<% String singer[] = request.getParameterValues("singer");
			if(singer!=null)
			{
				for(int a=0;a<singer.length;a++)
				{
					out.print(singer[a]+" ");
				}
			}
		%>
    </div>
</body>
</html>