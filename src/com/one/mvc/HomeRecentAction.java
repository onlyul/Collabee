package com.one.mvc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.one.dao.PrivateIdDao;
import com.yr.dao.HomeDao;
import com.yr.dto.HomeRecentDto;
import com.yr.dto.NoneFolderDto;

public class HomeRecentAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HomeDao hDao = new HomeDao();
		HttpSession session= request.getSession();
		int loginId = 0;
		if(session.getAttribute("loginId")==null || (int)session.getAttribute("loginId")==0) { //
			loginId = (int)request.getAttribute("loginId");
			session.setAttribute("loginId", loginId);
		} else {
			loginId = (int)session.getAttribute("loginId");
		}
		ArrayList<HomeRecentDto> listRecent = null;
		ArrayList<NoneFolderDto> listNone = null;
		PrivateIdDao dao = new PrivateIdDao();
		int privateSpaceId = dao.getPrivateId(loginId);
		String name = "";
		String email = "";
		String corName = "";
		int partnerN = 0;
		int corporation_id = 0;
		//int cor_manager = 0;
		String picture = "";
		try {
			listRecent = hDao.getRecent_Connection(loginId);
			listNone = hDao.getHomeWorkspace(loginId);
			name = hDao.showName(loginId);
			email = hDao.showEmail(loginId);
			partnerN = hDao.getCountPartner(loginId);
			corName = hDao.showCorName(loginId);
			corporation_id = hDao.gotCorporation(loginId);
			//System.out.println(corporation_id);
			//cor_manager = hDao.gotManager(1);
			picture = hDao.showPicture(loginId);
			//System.out.println(cor_manager);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("corporation_id", corporation_id);
		request.setAttribute("corName", corName);
		request.setAttribute("workspaceId", privateSpaceId);
		request.setAttribute("loginId", loginId);
		request.setAttribute("partnerN", partnerN);
		request.setAttribute("email", email);
		request.setAttribute("name", name);
		request.setAttribute("list", listRecent);
		request.setAttribute("list2", listNone);
		request.setAttribute("picture", picture);
		request.getRequestDispatcher("0CollabeeHome.jsp").forward(request, response);
	}

}
