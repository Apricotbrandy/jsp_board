package com.astinel.util.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MysqlProc {
	static public String TABLE_BOARD = "board";
	static public int BOARD_LIST_AMOUNT = 10;
	static public Connection con = null;
	static public Statement st = null;
	
	static public void dbInit() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	static public void dbConnect() {
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project ","root", "admin");
			st = con.createStatement();
			System.out.println("==== DB CONNECTION SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	static public ResultSet executeQuery(String sql) {
		try {
			return st.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	static public int executeUpdate(String sql) {
		try {
			return st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -100;  //??????
	}
	
	static public void dbDisconnect() {
		try {
			if(st != null) {
				st.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	static public int getDataCount() {
		dbConnect();
		ResultSet rs = executeQuery("select count(*) from "+TABLE_BOARD);
		try {
			rs.next();
			int count = Integer.parseInt(rs.getString("count(*)"));
			dbDisconnect();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		}
		dbDisconnect();
		return 0;
	}
}
