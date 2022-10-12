package com.ta.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {
	private static Connection conn = null; //getConnection메소드로만 접근할 수 있음
	public static Connection getConnection() {
		if(conn != null) { //이미 접속한 경우
			return conn;
		}else { //새롭게 접속을 해야하는 경우
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "PROJECT7";
			String dbPW = "369369";
			
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, dbID, dbPW);
			} catch(Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
	}
	
	public static void getClose(PreparedStatement pstmt, ResultSet rs) {
		try {
			pstmt.close();
			rs.close();
			System.out.println("닫힘");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void pstmtClose(PreparedStatement pstmt) {
		try {
			pstmt.close();
			System.out.println("닫힘");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
