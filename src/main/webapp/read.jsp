<%@page import="com.astinel.util.mysql.MysqlProc"%>
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
<title>Read</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
<%
	String readNum = request.getParameter("num"); //url get 방식으로 읽을 글 번호를 받아서 변수 저장 ex)url.?num=1 이런 식으로
	
	MysqlProc.dbInit();
	MysqlProc.dbConnect();
	String sql = "select * from board where num="+readNum;
	ResultSet rs = MysqlProc.executeQuery(sql);
	rs.next();
	String num = rs.getString("num");
	String title = rs.getString("title");
	String content = rs.getString("content");
	String id = rs.getString("id");
	
	content = content.replaceAll("\r\n", "<br/>");

	
/* 	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "admin");
		Statement st = con.createStatement();	// Statement는 정적 SQL문을 실행하고 결과를 반환받기 위한 객체다. Statement하나당 한개의 ResultSet 객체만을 열 수있다.
		ResultSet rs = st.executeQuery("select * from board where num="+readNum);
		while(rs.next()){
			String num = rs.getString("num");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String id = rs.getString("id"); */
%>

	글 번호: <%=num %> <br>
	글 제목: <%=title %>&nbsp;&nbsp;&nbsp;&nbsp;작성자: <%=id %><br>
	글 내용: <br>
	<%=content %>
	
	
<%
	MysqlProc.dbDisconnect();	

/* 		}
	}catch(Exception e){
		e.printStackTrace();
	} */
		
%>

<br><a href="list.jsp">글 목록으로</a>
<br><a href="delproc.jsp?num= <%=num %>">글 삭제하기</a>
<br><a href="modify.jsp?num= <%=num %>">글 수정하기</a>

</body>
</html>