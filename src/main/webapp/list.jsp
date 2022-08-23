<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>List</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "admin");
		Statement st = con.createStatement();	// Statement는 정적 SQL문을 실행하고 결과를 반환받기 위한 객체다. Statement하나당 한개의 ResultSet 객체만을 열 수있다.
		ResultSet rs = st.executeQuery("select * from board");
		while(rs.next()){
			String num = rs.getString("num");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String id = rs.getString("id");
%>

	<%-- <%=num %> | <%=title %> | <%=content %> | <%=id %><br> --%>
	<a href="read.jsp?num=<%=num %>"><%=title %></a>&nbsp;&nbsp;&nbsp;&nbsp;<%=id %><br>
	
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
		
%>

<a href="write.jsp">글 쓰기</a>

</body>
</html>