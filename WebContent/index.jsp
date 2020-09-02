<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>聊天室</title>
</head>
<body>
<div>
<form action="dologin.jsp" method="post">
请输入昵称：<input type="text" name="name"><br>
请输入验证码：<input type="text" name="code"><img  src="back/code.jsp">
<input type="submit">
</form>
</div>
</body>
</html>