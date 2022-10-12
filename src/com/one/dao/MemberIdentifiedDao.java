package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberIdentifiedDao {
	public String MemberPwIdentified(int member_id) {
		String sql = "SELECT pw FROM member WHERE member_id = ?";
		Connection conn = DBConnection.getConnection();
		String pw="";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				pw = rs.getString("pw");	
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pw;
	}
	
	public String MemberNameIdentified(int member_id) {
		String sql = "SELECT name FROM member WHERE member_id = ?";
		Connection conn = DBConnection.getConnection();
		String name="";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString("name");	
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}
}
