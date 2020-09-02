<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>聊天室</title>
</head>
<body>
<%@ include file="checkname.jsp" %>
<div style="width: 1024px; margin: 0 auto; border: 1px solid red" >

<object type="application/x-shockwave-flash" width="100%"  height="300px"  wmode="transparent" data="flvplayer.swf?file=111.flv">
			<param name="movie" value="flvplayer.swf?file=111.flv">
			<param name="movie" value="transparent">
</object>

<div style="width:78%; height:500px; overflow:auto; border: 1px solid black; float: left; ">
<%@ include file="left.jsp"  %>
</div>

<div style="width: 21%; height:500px; border: 1px solid yellow; float: right; ">
<%@ include file="right.jsp"  %>

<button onclick="location.href='out.jsp'">注销</button>
</div>

<div style="width: 100%; height: 150px; border: 1px solid purple; clear: both;">
<%@ include file="bottom.jsp"  %>
</div>

</div>

<script type="text/javascript">
window.onbeforeunload = function() {
	<%
	session.removeAttribute("name");
%>
}
</script>
</body>
</html>