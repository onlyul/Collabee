package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.yr.dao.DmDao;
import com.yr.dto.DmWorkspaceMemberDto;

public class WorkspaceMemberAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int workspace_id = Integer.parseInt(request.getParameter("workspace_id"));
		DmDao d = new DmDao();
		ArrayList<DmWorkspaceMemberDto> list1 = null;
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json"); 
		PrintWriter out = response.getWriter();
		JSONArray array = new JSONArray();
		try {
			list1 = d.getWorkspaceMember(workspace_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for(DmWorkspaceMemberDto dto : list1) {
			JSONObject obj = new JSONObject();
			obj.put("member_id", dto.getMember_id());
			obj.put("picture", dto.getPicture());
			obj.put("name", dto.getName());
			array.add(obj);
		}
		
		out.println(array);
	}

}
