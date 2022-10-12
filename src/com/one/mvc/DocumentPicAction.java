package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.DocumentUpdateDao;

public class DocumentPicAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int member_id = Integer.parseInt(request.getParameter("memberId"));
		int document_id = Integer.parseInt(request.getParameter("documentId"));
		
		DocumentUpdateDao dao = new DocumentUpdateDao();
		dao.updateDocumentPic(member_id, document_id);
		
	}
}
