package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yr.dao.HomeDao;

public class AddOrderAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int loginId = Integer.parseInt(request.getParameter("loginId"));
		int workspace_id = Integer.parseInt(request.getParameter("workspace_id"));
		HomeDao h = new HomeDao();
		int max = h.WorkspaceOrderMax(loginId);
		h.updateWorkspaceOrder(max+1, loginId, workspace_id);
	}

}
