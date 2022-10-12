package com.one.mvc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.one.dao.WorkspaceFindManagerDao;
import com.one.dto.WorkspaceFindManagerDto;
import com.yr.dao.HomeDao;
import com.yr.dto.HomeRecentDto;
import com.yr.dto.NoneFolderDto;
import com.jm.dao.KanbanIconListDao;
import com.jm.dao.KanbanListDao;
import com.jm.dto.KanbanIconListDto;
import com.jm.dto.KanbanListDto;
import com.one.dao.MyWorkspaceListDao;
import com.one.dto.MyWorkspaceListDto;

public class MyWorkspaceIndexAction implements Action{//협업공간 메인 출력

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//협업공간 클릭 설명, 알림, 대외비, 완료
		int member_id = Integer.parseInt(request.getParameter("loginId"));
		int workspace_id = Integer.parseInt(request.getParameter("workspaceId"));
		
		MyWorkspaceListDao dao = new MyWorkspaceListDao();
		WorkspaceFindManagerDao fdao = new WorkspaceFindManagerDao();
		ArrayList<MyWorkspaceListDto> list = new ArrayList<MyWorkspaceListDto>();
		ArrayList<WorkspaceFindManagerDto> fList = new ArrayList<WorkspaceFindManagerDto>();
		
		HomeDao hDao = new HomeDao();
		ArrayList<HomeRecentDto> listRecent = null;
		ArrayList<NoneFolderDto> listNone = null;
		String name = "";
		String email = "";
		String corName = "";
		int partnerN = 0;
		int corporation_id = 0;
		String picture = "";
		try {
			listRecent = hDao.getRecent_Connection(member_id);
			listNone = hDao.getHomeWorkspace(member_id);
			name = hDao.showName(member_id);
			email = hDao.showEmail(member_id);
			partnerN = hDao.getCountPartner(member_id);
			corName = hDao.showCorName(member_id);
			corporation_id = hDao.gotCorporation(member_id);
			picture = hDao.showPicture(member_id);
			
			list = dao.getMyWorkspace_List(member_id);//내가 가입한 협업공간 목록
			fList = fdao.findManager(workspace_id);//해당 공간의 매니저 목록
			
			for(WorkspaceFindManagerDto fDto : fList) {
				if(fDto.getMember_id()==member_id) {
					request.setAttribute("manager", 1);
				} 
			}
			
			for(MyWorkspaceListDto dto : list ) {
				int workspaceId = dto.getWorkspace_id();
				if(workspace_id==workspaceId){
					String workspaceName = dto.getWorkspace_name();
					String color = dto.getColor();
					String summary = dto.getSummary();
					String inviteUrl = dto.getInvite_url();
					int confidential = dto.getConfidential();
					int complete = dto.getComplete();
					String Date = dto.getCreation_date();
					int workspaceAlarm = dto.getWorkspace_alarm();
					
					request.setAttribute("workspaceIndex", new MyWorkspaceListDto(workspaceId, workspaceName, color, summary, inviteUrl,
							confidential, complete, Date, workspaceAlarm));
				}
			}
			
			KanbanListDao kDao = new KanbanListDao();
			ArrayList<KanbanListDto> kList = kDao.kanbanList(workspace_id);
			
			KanbanIconListDao kIDao = new KanbanIconListDao();
			ArrayList<KanbanIconListDto> kIList = kIDao.KanbanIconList();
			
			request.setAttribute("kList", kList);
			request.setAttribute("kIList", kIList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("corporation_id", corporation_id);
		request.setAttribute("corName", corName);
		request.setAttribute("partnerN", partnerN);
		request.setAttribute("email", email);
		request.setAttribute("name", name);
		request.setAttribute("list", listRecent);
		request.setAttribute("list2", listNone);
		request.setAttribute("picture", picture);
		
		request.getRequestDispatcher("workspace_index.jsp").forward(request, response);
	}
}
