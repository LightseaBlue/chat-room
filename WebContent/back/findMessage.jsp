<%@page import="com.google.gson.Gson"%>
<%@page import="Bean.Message"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Message> list=(List)application.getAttribute("message");
	Gson g=new Gson();
	out.print(g.toJson(list));
	
%>