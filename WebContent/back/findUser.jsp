<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> list=(List)application.getAttribute("lname");
	Gson g=new Gson();
	out.print(g.toJson(list));
%>