<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify process</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
<%
	String editNum = request.getParameter("num");
	String title = request.getParameter("title"); 
	String content = request.getParameter("content"); 
	String id = request.getParameter("id"); 
	
	request.setCharacterEncoding("UTF-8");	// 이거 안하면 한글 깨짐.
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "admin");
		Statement st = con.createStatement();
		
		//update board set title = 'title', content = 'content test', id = 'id' where num = 2;
		String sql = "update board set title = '"+title+"', content = '"+content+"', id = '"+id+"' where num = "+editNum;
		
		System.out.println("==== send sql:" + sql);		
		
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