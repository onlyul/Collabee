<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jm.dto.*" %>
<%@ page import = "com.jm.dao.*" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="css/Kanban.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>

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
<body>
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
											<span>(<%= kList.get(i).getKanban_docu_num() %>)</span>
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
</body>
</html>