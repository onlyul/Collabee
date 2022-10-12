package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.one.dto.MyPostDto;
import com.one.dto.MyPostDto2;

public class MyPostDao {
	//내가 작성한 문서
	public ArrayList<MyPostDto2> getMyPost(int fl, int member_id) { 
		ArrayList<MyPostDto2> list = new ArrayList<MyPostDto2>();//데이터 담을 리스트
		String sql = "SELECT d.document_id, k.kanban_icon_p, d.title, w.workspace_name, w.workspace_id, to_char(d.edit_date, '\"\"yy\"년 \"mm\"월 \"dd\"일\"') \"edit_date\" " + 
				"FROM document d, workspace w, kanban_icon k WHERE w.workspace_id = d.workspace_id " + 
				"AND k.kanban_icon_id = d.kanban_icon_id AND d.writer_id = ?  ORDER BY d.edit_date";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, member_id); 
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int document_id = rs.getInt("document_id");
				String kanban_icon_p = rs.getString("kanban_icon_p");
				String title = rs.getString("title");
				String workspace_name = rs.getString("workspace_name");
				int workspace_id = rs.getInt("workspace_id");
				String date = rs.getString("edit_date");
				MyPostDto2 dto = new MyPostDto2(kanban_icon_p, title, workspace_name,workspace_id, date, document_id);
				list.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	} 
}
