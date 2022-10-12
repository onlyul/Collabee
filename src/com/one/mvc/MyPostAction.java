package com.one.mvc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.MyPostDao;
import com.one.dao.PrivateIdDao;
import com.one.dto.MyPostDto2;
import com.yr.dao.HomeDao;
import com.yr.dto.NoneFolderDto;

public class MyPostAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int loginId = Integer.parseInt(request.getParameter("loginId"));
		
		MyPostDao dao = new MyPostDao();
		PrivateIdDao pao = new PrivateIdDao();
		HomeDao hDao = new HomeDao();
		
		ArrayList<NoneFolderDto> listNone = null;
		String name = "";
		int partnerN = 0;
		String picture = null;
		String email="";
		String corporationN="";
		try {
			listNone = hDao.getHomeWorkspace(loginId);
			name = hDao.showName(loginId);
			partnerN = hDao.getCountPartner(loginId);
			picture = hDao.showPicture(loginId);
			email = hDao.showEmail(loginId);
			corporationN = hDao.showCorName(loginId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("list2", listNone);
		request.setAttribute("partnerN", partnerN);
		request.setAttribute("name", name);
		request.setAttribute("email", email);
		request.setAttribute("corName", corporationN);
		if(picture != null) {
			if(!picture.startsWith("http"))
				picture = "image/upload/" + picture;
			request.setAttribute("picture", picture);
		}
		request.setAttribute("postList", dao.getMyPost(1, loginId));
		request.setAttribute("workspaceId", pao.getPrivateId(loginId));
		request.getRequestDispatcher("MyPostCmt.jsp").forward(request, response);

		
	}
}
