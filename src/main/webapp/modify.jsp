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
<title>modify</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
<%
	String editNum = request.getParameter("num");

	MysqlProc.dbInit();
	MysqlProc.dbConnect();
	
	//수정할 글 하나 읽어오기
	String sql = "select * from board where num = "+editNum;
	ResultSet rs = MysqlProc.executeQuery(sql); 
	
	//글 하나 꺼내서 작업대에 올리기
	rs.next(); 
	String title =rs.getString("title");
	String content =rs.getString("content");
	String id =rs.getString("id");

	
	
	
/* 	String editNum = request.getParameter("num");
	String title = null;
	String content = null;
	String id = null;
	request.setCharacterEncoding("UTF-8");	// 이거 안하면 한글 깨짐.
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "admin");
		Statement st = con.createStatement();
		String sql = "select * from board where num = "+editNum;
		System.out.println("==== send sql:" + sql);		
		ResultSet rs = st.executeQuery(sql); //수정할 글 하나 읽어오기
		
		rs.next(); //글 하나 꺼내서 작업대에 올리기
		
		title =rs.getString("title");
		content =rs.getString("content");
		id =rs.getString("id");
		
	} catch (Exception e) {		
		e.printStackTrace();
	} 
*/
%>

글 번호: <%=editNum %><br>

	<form action="modifyproc.jsp" method="get">
		<input name="num" type="hidden" value=<%=editNum %>>
		<input name="title" value=<%=title %>><br>
		<textarea name="content" rows="3" cols="50" ><%=content %></textarea>
		<input name="id" value=<%=id %>><br>
		<input type="submit" value="수정하기">
	</form>


</body>
</html>