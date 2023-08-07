<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	UserDAO loginAct = new UserDAO();
	UserDTO dao = loginAct.loginDAO(id, pw);
	
	if(dao.getId() != null){
		session.setAttribute("id", dao.getId());
		session.setAttribute("name", dao.getName());
		session.setAttribute("nick_name", dao.getNick_name());
		session.setAttribute("number_of_login", dao.getNumber_of_login());
		response.sendRedirect("Servlet?command=notice");
	} else {
		request.setAttribute("LoginErrMsg", "<script>alert('아이디 또는 비밀번호를 잘못 입력하셨습니다 .')</script>");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>
