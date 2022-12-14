package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.one.dao.NewWorkspaceDao;
import com.one.dto.NewWorkspaceDto;

public class NewWorkspaceAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String summary = request.getParameter("summary");
		int loginId = Integer.parseInt(request.getParameter("loginId"));

		ArrayList<String> colorList = new ArrayList<String>();
		colorList.add("rgb(191, 128, 255)");
		colorList.add("rgb(254, 109, 109)");
		colorList.add("rgb(27, 137, 242)");
		colorList.add("rgb(19, 217, 123)");
		colorList.add("rgb(73, 182, 197)");
		colorList.add("rgb(241, 150, 183)");
		colorList.add("rgb(250, 164, 119)");
		colorList.add("rgb(46, 122, 83)");
		int r = (int)(Math.random()*8);
		String color = colorList.get(r);//협업공간 색
		
		NewWorkspaceDao dao = new NewWorkspaceDao();
		dao.setWorkspace(new NewWorkspaceDto(title, color, summary, "", loginId));//협업공간 생성
		int workspace_id = dao.getNewWorkspace_id(title);//새로 만든 공간 id
		dao.setWorkspaceMember(loginId, workspace_id);//협업공간 멤버 테이블 삽입
		dao.connectWorkspace(loginId, workspace_id);//최근 접속한 협업공간에 추가
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		JSONObject obj = new JSONObject();
		obj.put("workspaceId", workspace_id);
		obj.put("workspace_name", title);
		out.println(obj);
	}
}
