<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session.removeAttribute("");
	session.invalidate();// 모든 세션 만료
	response.sendRedirect("Servlet?command=main");
%>
