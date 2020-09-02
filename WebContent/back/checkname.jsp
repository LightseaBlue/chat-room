<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = (String) session.getAttribute("uname");
	if (name == null) {
		out.print("<script>alert('未登录！！！');  location.href='../index.jsp';</script>");
	}
%>