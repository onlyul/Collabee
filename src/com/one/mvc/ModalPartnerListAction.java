package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.jm.dao.PartnerListDao;
import com.jm.dto.KanbanSelectorDto;
import com.jm.dto.PartnerListDto;

public class ModalPartnerListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * HttpSession session = request.getSession(); int member_id =
		 * (Integer)session.getAttribute("member_id");
		 */
		int member_id = 1;
		
		PartnerListDao pLDao = new PartnerListDao();
		ArrayList<PartnerListDto> pL = pLDao.partnerList(member_id);

		//request.setAttribute("pL", pL);
		//request.getRequestDispatcher("Controller?command=ModalWorkspaceList").forward(request, response);
		
		response.setCharacterEncoding("UTF-8");	
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONArray array = new JSONArray();
		for(PartnerListDto dto : pL) {
			JSONObject obj = new JSONObject();
			obj.put("member_id", dto.getMember_id());
			obj.put("picture", dto.getPicture());
			obj.put("name", dto.getName());
			obj.put("email", dto.getEmail());
			array.add(obj);
		}
		
		out.println(array);
		
	}

}
