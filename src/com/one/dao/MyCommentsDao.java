package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.one.dto.*;

public class MyCommentsDao {
	//내가 작성한 댓글(최신순)
	public ArrayList<MyCommentsDto> getMyComments(int member_id) {
		ArrayList<MyCommentsDto> list = new ArrayList<MyCommentsDto>();
		String sql = "SELECT d.document_id, c.content, w.workspace_name, d.title, to_char(c.creation_date, '\"\"yy\"년 \"mm\"월 \"dd\"일\"') \"creationDate\" FROM comments c, document d, workspace w "
				+ "WHERE c.comment_writer = ? AND c.document_id = d.document_id AND d.workspace_id = w.workspace_id ORDER BY c.creation_date DESC";

		Connection conn = null;
		try {
			conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id); 
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int document_id = rs.getInt("document_id");
				String content = rs.getString("content");
				String workspace_name = rs.getString("workspace_name");
				String title = rs.getString("title");
				String creation_date = rs.getString("creationDate");
				MyCommentsDto dto = new MyCommentsDto(document_id, content, workspace_name, title, creation_date);
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
