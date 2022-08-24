package com.one.mvc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yr.dao.HomeDao;
import com.yr.dao.OptionDao;
import com.yr.dto.NoneFolderDto;
import com.yr.dto.Option2CheckedDto;
import com.yr.dto.Option2Dto;

public class Option2Action implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HomeDao hDao = new HomeDao();
		OptionDao o = new OptionDao();
		HttpSession session= request.getSession();
		//int member_id = (Integer)session.getAttribute("member_id");
		int member_id = 4;
		ArrayList<NoneFolderDto> listNone = null;
		String name = "";
		int partnerN = 0;
		String email = "";
		String corName = "";
		String picture = null;
		ArrayList<Option2Dto> list = null;
		try {
			listNone = hDao.getHomeWorkspace(member_id);
			name = hDao.showName(member_id);
			partnerN = hDao.getCountPartner(member_id);
			picture = hDao.showPicture(member_id);
			//System.out.println(cor_manager);
			email = hDao.showEmail(member_id);
			corName = hDao.showCorName(member_id);
			list = o.showWeekAlarm(member_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ArrayList<Option2CheckedDto> list1 = new ArrayList<Option2CheckedDto>();
		String mon = "";
		String tue = "";
		String wed = "";
		String thu = "";
		String fri = "";
		String sat = "";
		String sun = "";
		String all_day = "";
		int start_time = list.get(0).getStart_time();
		int end_time = list.get(0).getEnd_time();
		if(list.get(0).getMon()==1) {
			mon = "checked";
		}
		if(list.get(0).getTue()==1) {
			tue = "checked";
		}
		if(list.get(0).getWed()==1) {
			wed = "checked";
		}
		if(list.get(0).getThu()==1) {
			thu = "checked";
		}
		if(list.get(0).getFri()==1) {
			fri = "checked";
		}
		if(list.get(0).getSat()==1) {
			sat = "checked";
		}
		if(list.get(0).getSun()==1) {
			sun = "checked";
		}
		if(list.get(0).getAll_day()==1) {
			all_day = "checked";
			start_time = 17;
			end_time = 39;
		}
		Option2CheckedDto dto = new Option2CheckedDto(mon, tue, wed, thu, fri, sat, sun, start_time, end_time, all_day);
		list1.add(dto);
		
		request.setAttribute("list1", list1);
		request.setAttribute("email", email);
		request.setAttribute("corName", corName);
		request.setAttribute("list2", listNone);
		request.setAttribute("partnerN", partnerN);
		request.setAttribute("name", name);
		if(picture != null) {
			if(!picture.startsWith("http"))
				picture = "image/upload/" + picture;
			request.setAttribute("picture", picture);
		}
		request.getRequestDispatcher("0option2.jsp").forward(request, response);
	}
}
