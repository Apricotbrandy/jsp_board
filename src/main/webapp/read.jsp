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
<title>Read</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
<%
	String readNum = request.getParameter("num"); //url get 방식으로 읽을 글 번호를 받아서 변수 저장 ex)url.?num=1 이런 식으로
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "admin");
		Statement st = con.createStatement();	// Statement는 정적 SQL문을 실행하고 결과를 반환받기 위한 객체다. Statement하나당 한개의 ResultSet 객체만을 열 수있다.
		ResultSet rs = st.executeQuery("select * from board where num="+readNum);
		while(rs.next()){
			String num = rs.getString("num");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String id = rs.getString("id");
%>

	글 번호: <%=num %> 
	글 제목: <%=title %>	작성자: <%=id %><br>
	글 내용: <br>
	<%=content %>
	
	
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
		
%>


<br><a href="delproc.jsp?num=<%=readNum %>">글 삭제하기</a>
<br><a href="modify.jsp?num=<%=readNum %>">글 수정하기</a>

</body>
</html>