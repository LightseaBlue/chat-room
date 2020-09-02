<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");

	List<String> lname = new ArrayList<String>();

	if (application.getAttribute("lname") != null) {
		lname = (List<String>) application.getAttribute("lname");
	}

	for (String x : lname) {
		if (x.equals(name)) {
			out.print("<script>alert('该名已存在！！！'); location.href='index.jsp';</script>");
			return;
		}
	}

	lname.add(name);

	application.setAttribute("lname", lname);
	session.setAttribute("uname", name);

	response.sendRedirect("back/main.jsp");
%>