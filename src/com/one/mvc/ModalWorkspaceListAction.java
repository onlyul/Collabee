package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.jm.dao.ModalWorkspaceListDao;
import com.jm.dto.KanbanSelectorDto;
import com.jm.dto.ModalWorkspaceListDto;
import com.jm.dto.PartnerListDto;

public class ModalWorkspaceListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * HttpSession session = request.getSession(); int member_id =
		 * (Integer)session.getAttribute("member_id");
		 */
		int loginId = Integer.parseInt(request.getParameter("loginId"));
		ModalWorkspaceListDao mWDao = new ModalWorkspaceListDao();
		ArrayList<ModalWorkspaceListDto> mWList = mWDao.workspaceList(loginId);
		
//		request.setAttribute("mWList", mWList);
//		request.getRequestDispatcher("Todo_modal2.jsp").forward(request, response);
		
		response.setCharacterEncoding("UTF-8");	
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONArray array = new JSONArray();
		for(ModalWorkspaceListDto dto : mWList) {
			JSONObject obj = new JSONObject();
			obj.put("workspace_id", dto.getWorkspace_id());
			obj.put("workspace_name", dto.getWorkspace_name());
			array.add(obj);
		}
		
		out.println(array);
		
	}

}
