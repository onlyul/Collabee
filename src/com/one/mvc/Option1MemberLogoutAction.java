package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Option1MemberLogoutAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그아웃
		HttpSession session = request.getSession();
		/*
		 if(session.getAttribute("member_id") != null) {
		 session.removeAttribute("member_id"); }
		 */
		session.invalidate();
		
	}

}
