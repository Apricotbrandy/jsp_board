<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
<%
	String delNum = request.getParameter("num");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "admin");
		Statement st = con.createStatement();
		String sql = "delete from board where num = " + delNum;
		
		System.out.println("==== delete sql:" + sql);
		int resultCount = st.executeUpdate(sql);	// 글쓰기 sql 전송
		if(resultCount == 1){
			System.out.println("==== success");
		} else {
			System.out.println("==== Failed");
		}
	} catch (Exception e) {		
		e.printStackTrace();
	}
	
	response.sendRedirect("list.jsp");	// 글리스트 화면으로 강제 이동
%>
</body>
</html>