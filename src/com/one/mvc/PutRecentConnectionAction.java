package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yr.dao.HomeDao;

public class PutRecentConnectionAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HomeDao hDao = new HomeDao();
		int workspace_id = Integer.parseInt(request.getParameter("workspace_id"));
		int loginId = Integer.parseInt(request.getParameter("loginId"));
		hDao.setRecent_Connection(loginId, workspace_id);
	}
}
