<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jm.dto.*" %>
<%@ page import = "com.jm.dao.*" %>
<%@ page import = "java.util.ArrayList" %>
<%
	/* request.getRequestDispatcher("Controller?command=bookmark").forward(request, response); */
    //session.setAttribute("member_id", 1);
	int corporation_id = 5;
	int loginId = (Integer)session.getAttribute("loginId");
	int workspaceId = (Integer)request.getAttribute("workspaceId");
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>협업툴 콜라비 - 한 장으로 끝! 문서기반 협업툴, 콜라비</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	<link href="css/bookmark2.css" rel="stylesheet" type="text/css">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
	
		$(function() {
			var member_id = 4;
			var bookmark_id = 0;
			$(document).ready(function(){
				$("#bookmark_menu_tag").addClass('chosen');
				$("#bookmark_name_tag").addClass('bold');
			});
			
			// 문서상태변경 모달띄우기 / 닫기
			$(".kanban_select_button").click(function() {
            	var px = $(this).offset().left;	/* 클릭한 현재위치 가로 */
            	var py = $(this).offset().top+ 25;
            	$("#kanban_selector").css('left',px+'px');
            	$("#kanban_selector").css('top',py+'px');
				
				$("#kanban_selector").css('display', 'block');
				$("#div_background").css('display', 'block');
				
				bookmark_id = $(this).parent().parent().find(".b_id").text();
				//var workspace_name = $(this).parent().parent().find(".bookmark_view_document_info1").text();
				
				$.ajax({
					type: 'post',
					url: 'Controller', 
					data: {'command' : 'KanbanSelector', 'bookmark_id' : bookmark_id},
					datatype: "json",	
					success: function(d){
						$(".kanban_selector_menu").empty();
						for(i=0; i<d.length; i++){
							var kanban_id = d[i].kanban_id;
							var kanban_icon_p = d[i].kanban_icon_p;
							var kanban_name = d[i].kanban_name;
							var str = "<button class='kanban_selector_menu_button'>" +
											"<div class='kanban_id' style='display:none'> "+kanban_id+" </div>" +
											" <img src=' "+ kanban_icon_p +" ' size='20' class='kanban_img'>" +
											" <span class='kanban_selector_name'>"+ kanban_name +"</span>" +
											" </button>";
							$(".kanban_selector_menu").append(str);
						}
						
					},
					error: function(r,s,e){
						alert("에러");
					}
				});
				
			});
          	$("#div_background").click(function() {
            	$("#div_background").css('display', 'none');
          		$("#kanban_selector").css('display', 'none');
          	});
          	
          	// 문서 상태 변경 
           	/* $(".kanban_selector_menu_button").click(function() { */
           	$(document).on("click", ".kanban_selector_menu_button", function() {
          		
				var kanban_id = $(this).find('.kanban_id').text();
				alert(kanban_id);
				$.ajax({ 
					type: 'post',
					url: 'Controller',
					data: {'command' : 'KanbanSelectorChange', 'bookmark_id' : bookmark_id, 'kanban_id' : kanban_id},
					datatype: 'json',
					success: function(d){
						alert("문서 상태가 변경되었습니다.");
					},
					error: function(r,s,e){
						alert("에러");
					}
				});
          		
          	});  
          	
          	// 북마크 해제
          	$(".bookmark_button").click(function() {
          		
          		var bookmark_id = $(this).parent().parent().find(".b_id").text();
          		
          		if(confirm("북마크를 해제하시겠습니까?")){
         			
           			$.ajax({
          				type: 'post',
          				url: 'Controller',
          				data: { 'command' : 'BookmarkDel' , "bookmark_id" : bookmark_id },
          				datatype: "json",
          				success: function(data){
          					if(data.result==1){
	           					$(".b_id").each(function(index, item){
	           						console.log(index);
	          						if($(item).text()==bookmark_id){
	          							$(item).parent().find(".bookmark_view1").css('display', 'none');
	          							$(item).parent().find(".bookmark_view2").css('display', 'none');
	          							$(item).parent().find(".bookmark_view3").css('display', 'none');
	          						}
	          					});       						
          					}else {
          						alert("북마크 해제 실패");
          					}
          				},
          				error: function(r,s,e){
          					alert("에러");
          				}
          				
          			}); 
          			
          		} else { }
          	});
          	
          //통합검색으로 넘어감
        	$("#searchbar").keypress(function(e){
         	   if(e.keyCode == 13){
         		   var search = $(this).val();
         		   var member_id = 4;
         		   location.href="Controller?command=SearchP1&search="+search+"&member_id="+member_id;
         	   }
            });	
          //문서작성버튼
    		$("#posting_bnt").on("click", function(){ 
    			$.ajax({   //-->화면 안에서 변할때 사용. 화면 전환해주지 않음.
    				type:"post",
    				url:"Controller?command=getPrivateId", //프라이빗 공간 찾기
    				data:{
    					"loginId": 4
    				},
    				datatype:"json",
    				success:function(data){
    					location.href="Controller?command=writedocument&loginId=4&workspaceId="+data.workspaceId;
    				},
    				error:function(r,s,e){
    					alert("error!");
    				}
    			}); 			
    		});
		}); 
		
	</script>
	<!-- 태안부분 추가한거 -->
	<script>
	
	$(function(){
		$(".home_btn21").on("click", function(){
			$("#partnerInviteBox").css("display","block");
			$('.homehead_background1').css('display', 'block');
		});
		
		$('.homehead_background1').click(function(){
			var result = confirm('파트너 초대를 그만하고 나가시겠습니까?');
			if(result){
				$("#partnerInviteBox").css("display","none");
		        $('.homehead_background1').css("display", "none");
			}
		});
		
		$("#invitePartner").click(function(){
		    $("#partnerInviteBox").css("display","block");
		    $('.homehead_background1').css("display", "block");
		});
		
		$("#inviteXbtn").click(function(){
		    $("#partnerInviteBox").css("display","none");
		    $('.homehead_background1').css("display", "none");
		    $("#inviteMails").html("");
		});
		
		$(document).ready(function(){
			$("#bookmark").addClass("chosen");
			$("#bookmark2").addClass("bold");
		});
	});
	
	</script>
</head>
<body>
<%@ include file="WEB-INF/include/include_PartnerModal2.jspf" %>
<%@ include file="WEB-INF/include/include_NewWorkspaceModal.jspf"%>
 	<div class="RootLayout">
		<%-- <%@ include file="../WEB-INF/include/HomeSidebar.jsp"%> --%>
		<%@ include file="HomeSidebar2-1.jsp"%>

		<main class=main_layout>
			<div id="bookmark_body">
			
				<header class="header_default">
					<div class=top_header>
						<div class="top_header_left">
							<span class="top_header_title">북마크</span>
							<div class="search_write_btn">
								  <div id="bnt1_cal">
							        <div id="search_icon" class="bnt_base"><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
							        <input type ="text" id=searchbar placeholder="검색"/>
							        <button id="posting_bnt">
							            <svg viewBox="0 0 24 24" width="13px" height="13px" ><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="posting_icon" ></path></svg>
							            <span>문서 작성</span>
							        </button>
							    </div>
							</div>
						</div>
						
						<div class="common_top_header_right">
							<%@ include file="homehead15.jspf" %>
						</div>
					</div>
					
					<div class="sub_header">
						<div class="sub_header_left">
							<div class="sub_header_bookmark">
								중요한 문서는 북마크하여 모아보세요.
							</div>
							
						</div>
						
						<div class="sub_header_right">
							<div class="subheader_right3_menu">
								<a href="Controller?command=Todo" class="subheader_right3_menu2">할 일</a> <!-- 컨트롤러로 연결해야함 -->
								<a href="Controller?command=dm2" class="subheader_right3_menu2">의사결정</a>
								<div style="position: relative;">
									<a class="file1" href="Controller?command=FilesAction">파일함
									<svg viewBox="0 0 24 24" width="12px" height="12px" class="svg5"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
									</a>
								</div>
							</div>
							<div id="div2">
				      			<div class="div2_1"><a href="Controller?command=FilesAction" style="text-decoration:none; color: black;"><img src="Images/file.svg" style="filter: opacity(0.5); width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>파일</a></div>
				      			<div class="div2_1"><a href="COntroller?command=LinksAction" style="text-decoration:none; color: black;"><img src="Images/link.svg" style="filter: opacity(0.5); width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>링크</a></div>
					   		</div>
						</div >
							
						<div class="after_line"></div>
					</div>
				</header>
				
				<div class="body_default">
					<div class="body_left">
						<div style=" min-width: 0px; width: 100%; ">
							
							<%
								ArrayList<BookmarkDto> bDtoList = (ArrayList<BookmarkDto>) request.getAttribute("bList");
																								if(bDtoList==null) {
							%>
								<script>
								alert("bDtoList is null");
								</script>
								<%
							}
								for(int i = bDtoList.size()-1; i>=0; i--){
									
							%>
							<div class="bookmark_view"> <!-- 북마크 하나당 -->
								<div style="display: none" class="b_id"><%=bDtoList.get(i).getBookmark_id() %></div>
							
								<div class="bookmark_view1">
									<button type="button" class="kanban_select_button">
										<img src='<%=bDtoList.get(i).getKanban_icon_p() %>' size="20" class="kanban_select_src">
									</button>
								</div>
								
								<div class="bookmark_view2">
									<a href="" class="bookmark_view_document_link"><%= bDtoList.get(i).getTitle() %></a>
									<div class="bookmark_view_document_info">
										<div class="bookmark_view_document_info1"><%= bDtoList.get(i).getWorkspace_name() %></div>
											<div class="bookmark_view_document_info2"><%= bDtoList.get(i).getName() %></div>
									</div>
								</div>
								
								<div class="bookmark_view3">
									<button class="bookmark_button">
										<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" >
											<path class="bookmark_on_color" fill="#888888" fill-rule="evenodd" d="M17 3H7c-1.1 0-1.99.9-1.99 2L5 21l7-3 7 3V5c0-1.1-.9-2-2-2z"></path>
										</svg>
									</button>
								</div>
							</div> <!-- 북마크 하나 끝 -->
							<%
								}
							%>
							
							
						</div>
					</div>
					
					<div class="body_right">
					<%@ include file="../WEB-INF/include/Aside.jsp" %>
					</div>
				</div>
				
			</div>
		</main>
	</div>
	
	<div id="kanban_selector" role="tooptip" >
		<div class="kanban_selector_center">
			
			<h6 class="kanban_selector_title">문서상태변경</h6>
			
			<div class="kanban_selector_menu">
<!-- 			<button class="kanban_selector_menu_button">
					<img src="https://down.collabee.co/postStatus/1603707" size="20" class="kanban_img">
					<span class="kanban_selector_name">발의됨</span>
				</button>
				
				<button class="kanban_selector_menu_button">
					<img src="https://down.collabee.co/postStatus/1603708" size="20" class="kanban_img">
					<span class="kanban_selector_name">진행중</span>
				</button> -->
				
				
			</div>
			
		</div>
	</div>
	
	<div id="div_background"></div>
	
</body>
</html>