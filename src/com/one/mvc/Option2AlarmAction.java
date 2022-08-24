package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yr.dao.OptionDao;

public class Option2AlarmAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mon = Integer.parseInt(request.getParameter("mon"));
		int tue = Integer.parseInt(request.getParameter("tue"));
		int wed = Integer.parseInt(request.getParameter("wed"));
		int thu = Integer.parseInt(request.getParameter("thu"));
		int fri = Integer.parseInt(request.getParameter("fri"));
		int sat = Integer.parseInt(request.getParameter("sat"));
		int sun = Integer.parseInt(request.getParameter("sun"));
		int member_id = Integer.parseInt(request.getParameter("member_id"));
		OptionDao o = new OptionDao();
		o.setWeek_alarm(mon, tue, wed, thu, fri, sat, sun, member_id);
	}

}
