<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
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
<title>List</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
<%
	
	//==== paging
	String pageNum = request.getParameter("page");
	int currentPageNum = 1;
	if(pageNum != null){
		currentPageNum = Integer.parseInt(pageNum);
	}
	
	MysqlProc.dbInit();
	
	int dataCount = MysqlProc.getDataCount();
	int pageMaxNum = (int)Math.ceil((double) dataCount / MysqlProc.BOARD_LIST_AMOUNT);
	
	MysqlProc.dbConnect();
	
	int currentDataIndex = 0;
	currentDataIndex = (currentPageNum - 1) * MysqlProc.BOARD_LIST_AMOUNT;
	
	try{
	String sql = "select * from board limit "+currentDataIndex+","+MysqlProc.BOARD_LIST_AMOUNT;
	ResultSet rs = MysqlProc.executeQuery(sql);
		while(rs.next()){
			String num = rs.getString("num");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String id = rs.getString("id");
	
%>
	<%-- <%=num %> | <%=title %> | <%=content %> | <%=id %><br> --%>
	<%=num %>&nbsp;&nbsp;&nbsp;&nbsp;<a href="read.jsp?num=<%=num %>"><%=title %></a>&nbsp;&nbsp;&nbsp;&nbsp;<%=id %><br>
	
<%
	}
	MysqlProc.dbDisconnect();
%>

<br>

<!-- 하단에 페이징 숫자 나타내기 -->
<%
	for(int i=1; i<=pageMaxNum; i++){
		if(currentPageNum == i){
%>			
			<%=i %>
<%		
		}else{
%>			
			<a href="list.jsp?page=<%=i %>"><%=i %></a>
<%
		}
	}
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
<br>
<a href="write.jsp">글 쓰기</a>
<a href="index.jsp">HOME</a>

</body>
</html>