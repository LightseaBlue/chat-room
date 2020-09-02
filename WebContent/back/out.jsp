<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name=(String)session.getAttribute("uname");
	out.print(name);
	List<String> list=(List)application.getAttribute("lname");
	for(int i=0;i<list.size();i++){
		if(list.get(i).equals(name)){
			list.remove(i);
			session.removeAttribute("uname");
			out.print("<script>alert('注销成功');location.href='../index.jsp'</script>");
		}
	}
%>