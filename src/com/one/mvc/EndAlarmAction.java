package com.one.mvc;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yr.dao.OptionDao;

public class EndAlarmAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int member_id = Integer.parseInt(request.getParameter("member_id"));
		int end_time = Integer.parseInt(request.getParameter("end_time"));
		OptionDao o = new OptionDao();
		try {
			o.setEndAlarm(end_time, member_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
