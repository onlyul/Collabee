package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchP1Action implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int member_id = Integer.parseInt(request.getParameter("member_id"));
		String search = request.getParameter("search");
		request.setAttribute("search", search);
		request.getRequestDispatcher("0search1.jsp").forward(request, response);
	}
}
