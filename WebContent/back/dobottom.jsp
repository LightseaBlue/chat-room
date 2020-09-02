<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Message"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = (String) session.getAttribute("uname");
	String text = request.getParameter("text");

	//判断是否使用ajax
	String op = request.getParameter("ajax");

	DateFormat format = new SimpleDateFormat("YYYY年MM月dd日   HH：mm：ss");
	String date = format.format(new Date());

	Message po = new Message();
	po.setName(name);
	po.setText(text);
	po.setDate(date);

	List<Message> bean = new ArrayList<Message>();
	if (application.getAttribute("message") != null) {
		bean = (List<Message>) application.getAttribute("message");
	}

	bean.add(po);

	application.setAttribute("message", bean);

	if ("1".equals(op)) {
		Gson g = new Gson();
		g.toJson(bean);
		out.print(g.toJson(bean));
	} else {
		response.sendRedirect("main.jsp");
	}
%>