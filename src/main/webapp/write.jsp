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
<title>Write</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
	<form action="writeproc.jsp" method="get">
		<h1><input name="title" placeholder="제목"><br></h1>
		
		<textarea name="content" placeholder="내용을 입력하세요." rows="5" cols="50" ></textarea><br>
		<input name="id" placeholder="작성자의 id를 입력하세요."><br>
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>