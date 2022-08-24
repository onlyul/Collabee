package com.yr.ajax;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yr.dao.DmDao;

@WebServlet("/Dm2DeleteServlet")
public class Dm2DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int decision_making_id = Integer.parseInt(request.getParameter("decision_making_id"));
		DmDao d = new DmDao();
		d.deldm(decision_making_id);
		d.delapp(decision_making_id);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
