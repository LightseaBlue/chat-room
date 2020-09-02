<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="dobottom.jsp" id="myform">
		<textarea style="width: 99%; height: 113px;" name="text" id="oo"
			onkeydown="key()"></textarea>
		<input type="button" onclick=dosend() value="发布" />
	</form>



	<script type="text/javascript">
		function key() {
			if (event.keyCode == 13) {
				var text = document.getElementById('oo').value;
				document.getElementById('myform').submit();
			}
		}

		var xmlHttp;
		function createXMLHttpRequest() {
			if (window.XMLHttpRequest) { // 如果可以取得XMLHttpRequest
				xmlHttp = new XMLHttpRequest(); // Mozilla、Firefox、Safari 
			} else if (window.ActiveXObject) { // 如果可以取得ActiveXObject
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
			}
		}

		function dosend() {
			createXMLHttpRequest();
			//获取输入内容
			var text = document.getElementById('oo').value;
			console.log(text == "");
			if (text == "") {
				alert('发出内容不能为空！')
				return;
			}

			xmlHttp.onreadystatechange = handleStateChange; // 設定callback函式

			xmlHttp.open("POST", "dobottom.jsp?ajax=1", true); // 開啟連結
			xmlHttp.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xmlHttp.send("text=" + text); // 傳送請求

		}

		function handleStateChange() { // 在這邊處理非同步回應
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					//alert("已响应" + xmlHttp.responseText);
					//装换成gson对象
					var z = eval("(" + xmlHttp.responseText + ")");

					//填写数据
					var str = "";
					for (var i = z.length - 1; i > 0; i--) {
						var x = z[i];
						//console.log(x.date);
						str += "<div>";
						str += "时间:" + x.date + "<br>";
						str += x.name + ":" + x.text;
						str += "</div>";
						str+="<hr>"
					}

					document.getElementById("left").innerHTML = str;
					document.getElementById("oo").value="";
				}
			}
		}
	</script>
</body>
</html>