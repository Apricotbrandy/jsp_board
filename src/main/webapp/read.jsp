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
	String readNum = request.getParameter("num"); //url get ������� ���� �� ��ȣ�� �޾Ƽ� ���� ���� ex)url.?num=1 �̷� ������
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "admin");
		Statement st = con.createStatement();	// Statement�� ���� SQL���� �����ϰ� ����� ��ȯ�ޱ� ���� ��ü��. Statement�ϳ��� �Ѱ��� ResultSet ��ü���� �� ���ִ�.
		ResultSet rs = st.executeQuery("select * from board where num="+readNum);
		while(rs.next()){
			String num = rs.getString("num");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String id = rs.getString("id");
%>

	�� ��ȣ: <%=num %> 
	�� ����: <%=title %>	�ۼ���: <%=id %><br>
	�� ����: <br>
	<%=content %>
	
	
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
		
%>


<br><a href="delproc.jsp?num=<%=readNum %>">�� �����ϱ�</a>
<br><a href="modify.jsp?num=<%=readNum %>">�� �����ϱ�</a>

</body>
</html>