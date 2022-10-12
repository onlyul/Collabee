package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.one.dto.MyPostDto;

public class myWorkspacePostDao {
	public ArrayList<MyPostDto> getMyPost(int member_id, int workspace_id) { 
		ArrayList<MyPostDto> list = new ArrayList<MyPostDto>();
		String sql = "SELECT d.document_id, k.kanban_icon_p, d.title, w.workspace_name, to_char(d.edit_date, '\"\"yy\"년 \"mm\"월 \"dd\"일\"') \"edit_date\" " + 
				"FROM document d, workspace w, kanban_icon k WHERE w.workspace_id = d.workspace_id " + 
				"AND k.kanban_icon_id = d.kanban_icon_id AND d.writer_id = ? AND d.workspace_id = ? ORDER BY d.edit_date";
		Connection conn = null;
		try {
			conn = DBConnection.getConnection();//db랑 연결
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, member_id); 
			pstmt.setInt(2, workspace_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int document_id = rs.getInt("document_id");
				String kanban_icon_p = rs.getString("kanban_icon_p");
				String title = rs.getString("title");
				String workspace_name = rs.getString("workspace_name");
				String date = rs.getString("edit_date");
				MyPostDto dto = new MyPostDto(document_id, kanban_icon_p, title, workspace_name, date);
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
