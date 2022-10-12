<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jm.dto.*" %>
<%@ page import = "com.jm.dao.*" %>
<%@ page import = "java.util.ArrayList" %>

<%
	//int member_id = session.getAttribute("member_id");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>칸반</title>
	<link href="css/Kanban.css" rel="stylesheet" type="text/css">
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  
	<script>
	
		$(function() {
			var kanban_id_op;
			
			// 칸반 옵션 버튼
			$(".kanban_options_btn").click(function() {
            	var px = $(this).offset().left;	/* 클릭한 현재위치 가로 */
            	var py = $(this).offset().top+ 25;
            	
            	/* alert("인덱스 : " + $(this).parent().parent().parent().parent().parent().index() ); */
            	kanban_id_op =  $(this).parent().parent().parent().parent().parent().find(".kanban_id").text();
            	
				var index = $(this).parent().parent().parent().parent().parent().index();

				if(index == 0){
					$(".kanban_options_des").css('display', 'block');
				}else{
					$(".kanban_options_des").css('display', 'none');
				}
				
            	$("#kanban_options").css('left',px+'px');
            	$("#kanban_options").css('top',py+'px');
            	
				
				$("#kanban_options").css('display', 'block');
				$("#div_background").css('display', 'block');
				
			});
          	$("#div_background").click(function() {
            	$("#div_background").css('display', 'none');
          		$("#kanban_options").css('display', 'none');
          	});
          	
          	// 문서상태 삭제
          	$("#kanban_option_del").click(function() {
          		//alert(kanban_id_op);
          		$.ajax({
    				type: 'post',
    				url: 'Controller',  
    				data: {"command" : "KanbanDel" , "kanban_id" : kanban_id_op},
    				datatype: "json",	
    				success: function(d){
    					if(d.check==0){
    						alert("문서상태가 삭제되었습니다.");
    						location.href="Controller?command=KanbanList";
    					}else{
    						alert("문서가 있어 문서상태를 삭제할 수 없습니다. 문서를 이동시켜주세요");
    					}
    				},
    				error: function(r,s,e){
    					alert("에러");
    				}
    			});
          	});
          	
          	// 오른쪽 문서상태 추가 버튼
          /* 	$(".kanban_add_btn").click(function() {
            	var px = $(this).offset().left;	
            	var py = $(this).offset().top+ 50;
            	$("#kanban_add").css('left',px+'px');
            	$("#kanban_add").css('top',py+'py');
				
				$("#kanban_add").css('display', 'block');
				$("#div_background").css('display', 'block');
			}); */
          	
          	$("#div_background").click(function() {
            	$("#div_background").css('display', 'none');
          		$("#kanban_add").css('display', 'none');
          	});
          	
          	$(".kanban_add_btn_x").click(function() { 
            	$("#div_background").css('display', 'none');
          		$("#kanban_add").css('display', 'none');
          	}); 
          	
          	$("#kanban_option_add").click(function() {
          		$("#kanban_options").css('display', 'none');
				
				$("#kanban_add").css('display', 'block');
				$("#div_background").css('display', 'block');
				
			});
          	
          	// 오른쪽 고정 문서상태 추가 버튼
          	$(".add_button_right").click(function() {
/*             	var px = $(this).offset().left;	
            	var py = $(this).offset().top+ 50;
            	
            	$("#kanban_add").css('top',py+'px');
            	$("#kanban_add").css('right','37px'); */
				
				$("#kanban_add").css('display', 'block');
				$("#div_background").css('display', 'block');
				
			});
          	$(".kanban_add_content_baselist_li_btn").click(function() {
          		var kanban_icon_id = $(this).parent().find(".kanban_icon_id_div").text();	
          		$(".kanban_icon_id").val(kanban_icon_id);
          		
          		var icon_p = $(this).find(".kanban_add_content_baselist_li_img>img").attr('src');
          		$(".kanban_add_header_input_container>img").attr('src', icon_p);
          	});
          	
          	
          	$(".kanban_title_right_btn").mouseenter(function() {
          		//alert("!");
          		$(this).find("svg").find("path").css('fill','rgb(83, 83, 83)');
          	}).mouseleave(function() {
          		$(this).find("svg").find("path").css('fill','rgb(136, 136, 136)');
          	});
          	

          	
          	// 칸반 드래그
          	$(".kanban_view_drag").sortable({
          		cursor: "grabbing",
          		 start:function(event,ui){
                     // 드래그 시작 시 호출
                 },
                 stop:function(event,ui){
                     // 드래그 종료 시 호출
                     $(this).find(".kanban_list").each(function(index, item) {
                    	//alert( index + " " + $(item).find(".kanban_name").text() ); 
                    	
                    	var index = index;
                    	var kanban_id = $(item).find(".kanban_id").text() ;
                    	
                    	$.ajax({
        					type: 'post',
        					url: 'Controller', 
        					data: {'command' : 'KanbanOrderUpdate', 'index' : index, 'kanban_id' : kanban_id},
        					datatype: "json",	
        					success: function(d){
        						
        					},
        					error: function(r,s,e){
        						alert("에러");
        					}
        				});
                    	
                     });
                     
                 },
          		revert:true
          	});
          	$(".kanban_droppable").sortable({
          		connectWith: "[data-status]",
          		/* connectWith: ".kanban_dropzone", */
          		cursor: "grabbing",
         		 start:function(event,ui){
                    // 드래그 시작 시 호출
                    //alert( $(this).html() );
                },
                stop:function(event,ui){
                    // 드래그 종료 시 호출
                    $(this).find(".kanban_post_container").each(function(index, item){
                    	//alert(index + " " + $(item).find(".kanban_content_post_title").text());
                    	
                    	var index = index;
                    	var kanban_id = $(item).parent().parent().parent().parent().parent().parent().parent().find(".kanban_id").text();
                    	var document_id = $(item).find(".document_id").text() ;
                    	
                    	$.ajax({
        					type: 'post',
        					url: 'Controller', 
        					data: {'command' : 'KanbanDocuOrderUpdate', 'index' : index, 'kanban_id' : kanban_id, 'document_id' : document_id},
        					datatype: "json",	
        					success: function(d){
        						
        						
        					},
        					error: function(r,s,e){
        						alert("에러");
        					}
        				}); 
                    	
                    });
                },
          		revert:true,
          	});

          	
		}); 
		
	</script>
</head>
<body>

	<div style="display: flex; flex-direction: row;">
	<div>
	<%@ include file="../WEB-INF/include/HomeSidebar.jsp"%>
	</div>

    <section id="space_main_wi"> <!--화면 전체  스크롤바 설정, 제이쿼리, 왼쪽상단, 하단 -->
        <header>
            <div id="head1_wi" style="white-space:nowrap;">
                <div id="bnt3_wi">
                    <div id="title_wi"><a href="https://www.collabee.co/project/127728/issue" style="color:#fff">코드공유 공간</a></div>
                    <div id="bnt1_wi">
                        <button><svg viewBox="0 0 24 24" width="20px" height="20px" class="icon2_color"><path d="M11.65 21c.99 0 1.8-.81 1.8-1.8h-3.6c0 .99.81 1.8 1.8 1.8zm5.85-5.4v-4.95A5.848 5.848 0 0 0 13 4.962V4.35C13 3.603 12.397 3 11.65 3c-.747 0-1.35.603-1.35 1.35v.612a5.848 5.848 0 0 0-4.5 5.688v4.95L4 17.4v.9h15.3v-.9l-1.8-1.8z" ></path></svg></button>
                        <button><svg viewBox="0 0 24 24" width="20px" height="20px" class="icon2_color"><path d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg></button>
                    </div>
                    <!-- 레이아웃이 비슷한 HTML코드는 서로서로 물어봐서 참고하세요 -->
                    <input type ="text" id="searchbar_wi" placeholder="검색"/>
                </div>
                <div id="textarea_wi"><textarea id="summary_wi">협업공간에 대한 간단한 설명을 입력하세요.</textarea></div>
                <div id="bnt2_wi">
                    <button id="bnt2_1"><svg viewBox="0 0 24 24" width="18px" height="18px" class="icon2_color"><path d="M12 1.5C6.204 1.5 1.5 6.204 1.5 12S6.204 22.5 12 22.5 22.5 17.796 22.5 12 17.796 1.5 12 1.5zM9.9 17.25L4.65 12l1.48-1.48 3.77 3.758 7.97-7.969L19.35 7.8 9.9 17.25z"></path></svg><span>할 일</span></button>
                    <button id="bnt2_2"><svg viewBox="0 0 24 24" width="18px" height="18px" class="icon2_color"><path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19a2 2 0 0 0 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path></svg><span>일정</span></button>
                    <button id="bnt2_3"><svg viewBox="0 0 24 24" width="18px" height="18px" class="icon2_color"><path d="M16.5 6v11.5c0 2.21-1.79 4-4 4s-4-1.79-4-4V5a2.5 2.5 0 0 1 5 0v10.5c0 .55-.45 1-1 1s-1-.45-1-1V6H10v9.5a2.5 2.5 0 0 0 5 0V5c0-2.21-1.79-4-4-4S7 2.79 7 5v12.5c0 3.04 2.46 5.5 5.5 5.5s5.5-2.46 5.5-5.5V6h-1.5z"></path></svg><span>파일</span></button>
                    <button id="bnt2_4"><svg viewBox="0 0 24 24" width="18px" height="18px" class="icon2_color"><path d="M2.833 4h13.75c.633 0 1.128.32 1.458.807L23 12.25l-4.96 7.434c-.33.486-.888.816-1.52.816H2.832A1.839 1.839 0 0 1 1 18.667V5.833C1 4.825 1.825 4 2.833 4zm11.917 9.625c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375zm-4.583 0c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375s-1.375.614-1.375 1.375c0 .76.614 1.375 1.375 1.375zm-4.584 0c.761 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375z"></path></svg><span>의사결정</span></button>
                    <button id="document_bnt_wi"><svg viewBox="0 0 24 24" width="18px" height="18px" class="icon2_color"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"></path></svg><span>문서 작성</span></button>
                </div>
            </div>
            <div id="head2_wi" style="display:none"></div>
        
        </header>
   
        <div id="tab_wi">
            <div id="container1_wi">
                <button><a href="https://www.collabee.co/project/127728/issue"><span>협업공간 문서</span></a></button>
                <button><a href="https://www.collabee.co/project/127728/kanban"><span>칸반</span></a><svg width="24px" height="24px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path d="M0 0h14v14H0z"></path><path fill="#888888" d="M6.417 9.917h1.166v-3.5H6.417v3.5zM7 1.167C3.78 1.167 1.167 3.78 1.167 7S3.78 12.833 7 12.833 12.833 10.22 12.833 7 10.22 1.167 7 1.167zm0 10.5A4.674 4.674 0 012.333 7 4.674 4.674 0 017 2.333 4.674 4.674 0 0111.667 7 4.674 4.674 0 017 11.667zM6.417 5.25h1.166V4.083H6.417V5.25z"></path></g></svg></button>
                <button><a href="https://www.collabee.co/project/127728/gantt"><span>간트차트</span></a></button>
                <button><a href="https://www.collabee.co/project/127728/calendar"><span>캘린더</span></a></button>
                <button><a href="https://www.collabee.co/project/127728/myissue"><span>내가 작성한 문서</span></a></button>
            </div>
            <div id="container3_wi">
                <button><svg viewBox="0 0 24 24" width="19px" height="19px" class="container3_bnt1_wi icon1_color"><path d="M13.056 16h-3L9.5 21h-2l.556-5H5.5v-2h2.778l.444-4H6.5V8h2.444L9.5 3h2l-.556 5h3l.556-5h2l-.556 5H18.5v2h-2.778l-.444 4H17.5v2h-2.444l-.556 5h-2l.556-5zm.222-2l.444-4h-3l-.444 4h3z" ></path></svg></button>
                <button><svg viewBox="0 0 24 24" width="19px" height="19px" class="container3_bnt2_wi icon1_color"><path d="M3 18h6v-2H3v2zM3 6v2h18V6H3zm0 7h12v-2H3v2z"></path></svg></button>
            </div>
            <div id="container2_wi">
                <button class="tab1_bnt"><a><span>할 일</span></a></button>
                <button class="tab1_bnt"><a><span>의사결정</a></span></button>
                <button class="tab1_bnt2"><a><span>파일함<svg viewBox="0 0 24 24" width="12px" height="12px"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z" ></path></svg></span></a></button>
            </div>
        </div> 
        
		<div class="layouts_body">
			<section class="kanban_section">
				<button class="add_button_right">
					<div class="add_button_name">
						<svg viewBox="0 0 24 24" width="15px" height="15px" class="kanban_add_btn_svg" style="margin-top: 1px; margin-right: 1px;"><path d="M10.286 10.286V18H7.714v-7.714H0V7.714h7.714V0h2.572v7.714H18v2.572z" color="#ffffffa6" class="Beecon__Path-sc-3x6pq4-1 iXjnzl" style="fill: rgba(255, 255, 255, 0.65);"></path></svg>
						문서상태 추가
					</div>
				</button>
			
				<div id="kanban_container">
				
					<div class="kanban_view_drag">	<!-- 드래그 가능한 영역 -->
					
					<%
						ArrayList<KanbanListDto> kList = (ArrayList<KanbanListDto>) request.getAttribute("kList");
						for(int i = 0; i<kList.size(); i++){
							
					%>
						<div class="kanban_list">	<!-- 칸반1 시작 -->
							<div class="kanban_id" style="display: none;"><%= kList.get(i).getKanban_id() %></div>
							<div class="kanban_list_content">	<!-- 회색칸 -->
							
								<div id="kanban_header_id_1" class="kanban_list_header">	<!-- 헤더 -->
									<div class="kanban_list_title_container">	
									
										<div class="kanban_icon">	<!-- 아이콘 -->
											<img src="<%= kList.get(i).getKanban_icon_p() %>" size="20" class="kanban_icon_img" data-status-value="10">
										</div>
										
										<div class="kanban_title">
											<div class="kanban_name"> <!-- 칸반이름 -->
												<%= kList.get(i).getKanban_name() %>
											</div>
											<%-- <span>(<%= kList.get(i).getKanban_docu_num() %>)</span> --%>
										</div>
										
										<div class="kanban_title_right">
											<button color="mono3grey" class="kanban_title_right_btn" title="새 문서 작성">
												<svg viewBox="0 0 24 24" width="16px" height="16px" class="kanban_title_right_btn_svg"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="kanban_title_right_btn_path"></path></svg>
											</button>
											<button color="mono3grey" class="kanban_title_right_btn kanban_options_btn" title="메뉴">
												<svg viewBox="0 0 24 24" width="16px" height="16px" class="kanban_title_right_btn_svg"><path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z" class="kanban_title_right_btn_path"></path></svg>
											</button>
										</div>
										
									</div>
								</div>	<!-- 헤더 끝 -->
								
								<div class="kanban_postArea">
									<div class="kanban_postArea_wrapper">
										<div class="kanban_dropzone" >
											<div style="overflow:visible;">
												<div class="kanban_droppable" data-status="10">
													
													<%
														KanbanDocuListByOrderDao kdDao = new KanbanDocuListByOrderDao();
														ArrayList<KanbanDocuDto> kdList = kdDao.KanbanDocuByOrder(kList.get(i).getKanban_id());
														for(int j = 0; j<kdList.size(); j++) {
													%>
													
													<div class="kanban_post_container">		<!-- 칸반안에 파일1개 -->
														<div style="display: none;"class="document_id"><%=kdList.get(j).getDocument_id() %></div>
														<div class="kanban_icon_post">
															<div class="kanban_icon_post_area">
																<img src="<%= kList.get(i).getKanban_icon_p() %>" size="24" class="kanban_icon_post_area_img" data-status-value="50">
															</div>
														</div>
														
														<div class="kanban_content_post">
															<div class="kanban_content_post_title"><%= kdList.get(j).getTitle()  %></div>
														</div>
													</div>	<!-- 칸반안에 파일1개 끝 -->
													
													<%
														}
													%>
													
												</div>
											</div>
										</div>
									</div>
								</div>
								
							</div>
						</div>	<!-- 칸반1 끝 -->					
					<%
						}
					%>
						
					</div>
					
					<!-- <div class="kanban_view_right"> 오른쪽에 문서상태 추가 칸
						<button id="add_column" class="kanban_add_btn">
							<svg viewBox="0 0 24 24" width="20px" height="20px" class="kanban_add_btn_svg"><path d="M10.286 10.286V18H7.714v-7.714H0V7.714h7.714V0h2.572v7.714H18v2.572z" color="#888888" class="kanban_add_btn_path"></path></svg>
							<div class="kanban_add_column_name">문서상태 추가</div>
						</button>
					</div> -->
				</div>
			</section>
		</div>
        
	</section>
	
	<div role="tooltip" id="kanban_options">
		<div class="kanban_options_container" style="padding-top: 0px;">
			<div class="kanban_options_des">문서작성 시, 이 문서상태가 기본으로 지정됩니다.</div>
			<button class="kanban_options_inner_btn">이름 변경</button>
			<button class="kanban_options_inner_btn" id="kanban_option_del">문서상태 삭제</button>
			<hr class="kanban_oprions_line"/>
			<button class="kanban_options_inner_btn" id="kanban_option_add">새 문서상태 추가</button>
		</div>
	</div>
	
	<div role="tooltip" id="kanban_add">
		<form action="Controller" method="post">
			<input type="hidden" name="workspace_id" value="8"/> 	<!-- value에 workspace id 파라미터로 가져와서 꽂기 -->
			<div class="kanban_add_container">
				<section class="kanban_add_header">
					<div class="kanban_add_header_title_container">
						<h6 class="kanban_add_header_title">새 문서상태 추가</h6>
						<button color="gray700" class="kanban_add_btn_x" type="button">
							<svg viewBox="0 0 24 24" width="16px" height="16px" class="kanban_add_btn_svg"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="kanban_add_btn_path"></path></svg>
						</button>
					</div>
					
					<div class="kanban_add_header_input_container">
						<img src="https://down.collabee.co/postStatus/1603707" size="20" class="kanban_icon_img" data-status-value="10">
						<input name="kanban_name" value="" maxlength="20" placeholder="스프린트2, 백로그" class="kanban_add_header_input" >
					</div>
				</section>
				<section class="kanban_add_content">
					<input type="hidden" class="kanban_icon_id" name="kanban_icon_id" value=""/>
					<div class="kanban_add_content_basecategory">
						<span>기본 아이콘</span>
					</div>
					<%
					ArrayList<KanbanIconListDto> kIList = (ArrayList<KanbanIconListDto>)request.getAttribute("kIList");
					%>
					<ul class="kanban_add_content_baselist">
					<%
						for(int i=0; i<4; i++){
					%>
						<li class="kanban_add_content_baselist_li">
							<div class="kanban_icon_id_div" style="display: none;"><%= kIList.get(i).getKanban_icon_id() %></div>
							<button class="kanban_add_content_baselist_li_btn" type="button">
								<span class="kanban_add_content_baselist_li_img"><img src="<%= kIList.get(i).getKanban_icon_p() %>"></span>
							</button>
						</li>
					<%
						}
					%>
					</ul>
					
					<div class="kanban_add_content_basecategory">
						<span>이모티콘</span>
					</div>
					<ul class="kanban_add_content_baselist">
					<%
						for(int i =4; i<28; i++){
					%>
						<li class="kanban_add_content_baselist_li">
							<div class="kanban_icon_id_div" style="display: none;"><%= kIList.get(i).getKanban_icon_id() %></div>
							<button class="kanban_add_content_baselist_li_btn" type="button">
								<span class="kanban_add_content_baselist_li_img"><img src="<%= kIList.get(i).getKanban_icon_p() %>" style="width: 20px;"></span>
							</button>
						</li>
					<%
						}
					%>
					</ul>
				</section>
				<div class="kanban_add_footer">
					<input type="hidden" name="command" value="KanbanInsert"/>
					<button type="submit" class="kanban_add_save_btn"><span class="kanban_add_save_span">저장</span></button>
				</div>
			</div>
		</form>
	</div>
	
	<div id="div_background"></div>
	</div>
	
</body>
</html>