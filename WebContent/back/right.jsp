<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		List<String> list = (List<String>) application.getAttribute("lname");
		String name2 = (String) session.getAttribute("uname");
	%>
	<script type="text/javascript">

		setInterval("stardt()", 2000);
		function stardt() {
			createXMLHttpRequest(); // 建立非同步請求物件
			xmlHttp.onreadystatechange = handleStateChan; // 設定callback函式
			xmlHttp.open("POST", "findUser.jsp"); // 開啟連結
			xmlHttp.send(null); // 傳送請求
		}

		function handleStateChan() { // 在這邊處理非同步回應
			if (xmlHttp.status == 200) {
				if (xmlHttp.readyState == 4) {
					var data1 = xmlHttp.responseText;
					//把data的gson字符串，装换为对象
					var z1= eval("(" + data1 + ")");

					var str1 = "欢迎<%=name2%><br>";
					str1 += "在线人数： <img src='images/" + z1.length + ".gif'><br>";
					if(z1!=null&&z1.length>0){
					for (var i1 = z1.length - 1; i1 >= 0; i1--) {
						var x1 = z1[i1];
						//console.log(x);
						//console.log(x.date);
						str1 += x1+"<br>";
					}
				}
					document.getElementById("right").innerHTML = (str1);
				}
			}
		}
	</script>
	<div id="right">
	欢迎：<%=name2%><br>
	<%
		if (list != null && list.size() > 0) {
	%>
	在线人数：
	<%!private String getImg(int num) {
		String img = "";
		String i = num + "";
		for (int j = 0; j < i.length(); j++) {
			String x = i.substring(j, j + 1);
			img += "<img src='images/" + x + ".gif'>";
		}
		return img;
	}%>
	<%=getImg(list.size())%>
	<br>
	<%
		for (String x : list) {
	%>
	<%=x%><br>
	<%
		}
		}
	%>
	</div>
</body>
</html>