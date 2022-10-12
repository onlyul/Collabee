package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.DocumentSaveDao;

public class SaveDocumentAction implements Action{//문서 저장

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int workspace_id = Integer.parseInt(request.getParameter("workspaceId"));
		int document_id = Integer.parseInt(request.getParameter("documentId"));
		
		try {
			DocumentSaveDao dao = new DocumentSaveDao();
			dao.saveDocument(title, content, document_id, workspace_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
