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
<title>Write</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
	<form action="writeproc.jsp" method="get">
		title: <input name="title"><br>
		<textarea name="content" rows="5" cols="50" ></textarea><br>
		id: <input name="id"><br>
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>