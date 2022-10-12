package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.PrivateIdDao;

public class LinksAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrivateIdDao dao = new PrivateIdDao();
		int privateSpaceId = dao.getPrivateId(4);
		request.setAttribute("workspaceId", privateSpaceId); 
		
		request.getRequestDispatcher("links.jsp").forward(request, response);
	}
}
