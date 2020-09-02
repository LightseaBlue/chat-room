<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name=request.getParameter("name");
	String age=request.getParameter("age");
	
	Map<String,String> map=new HashMap<String,String>();
	map.put("name",name);
	map.put("age", age);
	
	Gson gs=new Gson();
	out.print(gs.toJson(map));
%>