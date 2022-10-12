package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.yr.dao.DmDao;
import com.yr.dto.MyWorkspaceDto;

public class WorkspaceListYRAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		int loginId = (int)session.getAttribute("loginId");
		ArrayList<MyWorkspaceDto> list2 = null;
		DmDao d = new DmDao();
		try {
			list2 = d.getWorkspace(loginId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");	
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONArray array = new JSONArray();
		for(MyWorkspaceDto dto : list2) {
			JSONObject obj = new JSONObject();
			obj.put("workspace_id", dto.getWorkspace_id());
			obj.put("workspace_name", dto.getWorkspace_name());
			array.add(obj);
		}
		
		out.println(array);
	}

}
