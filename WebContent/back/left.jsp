<%@page import="Bean.Message"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript">

		setInterval("start()", 1000);
		function start() {
			createXMLHttpRequest(); // 建立非同步請求物件
			xmlHttp.onreadystatechange = handleState; // 設定callback函式
			xmlHttp.open("POST", "findMessage.jsp"); // 開啟連結
			xmlHttp.send(null); // 傳送請求
		}

		function handleState() { // 在這邊處理非同步回應
			if (xmlHttp.status == 200) {
				if (xmlHttp.readyState == 4) {
					var data = xmlHttp.responseText;
					//把data的gson字符串，装换为对象
					var z = eval("(" + data + ")");

					var str2="";
					if(z!=null&&z.length>0){
					for (var i = z.length - 1; i > 0; i--) {
						var x = z[i];
						//console.log(x.date);
						str2 += "<div>";
						str2 += "时间:" + x.date + "<br>";
						str2 += x.name + ":" + x.text;
						str2 += "</div>";
						str2 += "<hr>"
					}
					}
					document.getElementById("left").innerHTML=(str2);
				}
			}
		}
	</script>
	<div id="left">
		<%
			List<Message> message = (List<Message>) application.getAttribute("message");
			if (message != null) {
				for (Message m : message) {
		%>
		<div>
			时间：<%=m.getDate()%><br>
			<%=m.getName()%>：<%=m.getText()%>
		</div>
		<hr>
		<%
			}
			}
		%>
	</div>
</body>
</html>