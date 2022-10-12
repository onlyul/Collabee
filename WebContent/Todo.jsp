<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jm.dto.*" %>
<%@ page import = "com.jm.dao.*" %>
<%@ page import = "java.util.ArrayList" %>
<%
	// int member_id = session.getAttribute("member_id");
	int workspaceId = (Integer)request.getAttribute("workspaceId");
	int loginId = (Integer)session.getAttribute("loginId");
%> 
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	<link href="css/Todo.css" rel="stylesheet" type="text/css">
	<title>협업툴 콜라비 - 한 장으로 끝! 문서기반 협업툴, 콜라비</title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script>

	$(function() {
		var todo_id;
		var this_todo_content1_button_g;
		
		// 할일 설렉터 모달 열기
		$(".todo_content1_button").click(function() {
        	var px = $(this).offset().left;	/* 클릭한 현재위치 가로 */
        	var py = $(this).offset().top+ 25;
        	$("#todo_cur_selector").css('left',px+'px');
        	$("#todo_cur_selector").css('top',py+'px');
			
			$("#todo_cur_selector").css('display', 'block');
			$("#div_background1").css('display', 'block'); 
			
			todo_id = $(this).parent().parent().parent().find(".todo_id").text();
			alert(todo_id);
			this_todo_content1_button_g = $(this).find(".g");
		});
      	$("#div_background1").click(function() {
        	$("#div_background1").css('display', 'none');
      		$("#todo_cur_selector").css('display', 'none');
      	});	
      	
    	 // 할일 상태 변경
      	$(".todo_cur_selector_button").click(function() {
	      	var todo_cur_id_str = $(this).text();
      		$.ajax({
				type: 'post',
				url: 'Controller', 
				data: {'command' : 'TodoCurSelectorAction', 'todo_cur_id_str' : todo_cur_id_str, 'todo_id' : todo_id },
				datatype: "json",	
				success: function(d){
					alert("할 일 상태가 변경되었습니다.");
					location.href="Controller?command=Todo";
				},
				error: function(r,s,e){
					alert("에러");
				}
			});
      		
      	});
      	
      	// 파일함 모달
      	$("#div1").mouseenter(function() {
            $("#div2").css("display","block");
		});
        $("#div2").mouseleave(function() {
            $("#div2").css("display","none");
        });
        
        // x버튼
        $(".todo_modal_close_button").mouseenter(function() {
            $(".button_x_path").css('fill', 'rgb(217, 173, 43)');
		});
        $(".todo_modal_close_button").mouseleave(function() {
            $(".button_x_path").css('fill', 'rgb(255, 255, 255)');
        });

      	//협업공간 선택
        $("#todo_space_select").click(function() {
        	var px = $(this).offset().left;	/* 클릭한 현재위치 가로 */
        	var py = $(this).offset().top+ 35;
        	$(".workspace_list").css('left',px+'px');
        	$(".workspace_list").css('top',py+'px');
			
			$(".workspace_list").css('display', 'block');
			$("#div_background").css('display', 'block');
	        $("#todo_space_select1>span").html("공간 검색").css("color", "rgb(255, 255, 255)");
	        $(".todo_space_select_svg").css({visibility:"hidden", opacity:0});
		});
      	$("#div_background").click(function() {
        	$("#div_background").css('display', 'none');
      		$(".workspace_list").css('display', 'none');
      	});

	    
	    $(".workspace_list > ul > li ").click(function(){ //리스트 선택하면 그값으로 바뀌고 리스트 닫힘
	        var workspace = $(this).text();
	        $("#todo_space_select1>span").html(workspace).css("color", "rgb(255, 255, 255)");
	        $(".todo_space_select_svg").css({visibility:"visible", opacity:1});
	        $("#div_background1").css('display', 'none');
      		$(".workspace_list").css('display', 'none');
	    });
	    $(".workspace_list li").hover(function (){
	        $(this).css("background-color", "rgb(242,242,242)");
	    }, function(){
	        $(this).css("background-color", "rgb(255, 255, 255)");
	    });
	    
	    // 달력피커
        $("#todo_start_date_picker_btn, #todo_finish_date_picker_btn").datepicker("setDate", new Date());
        $("#todo_start_date_picker_btn, #todo_finish_date_picker_btn").click(function() { 
        	$("#todo_start_date_picker_btn, #todo_finish_date_picker_btn").datepicker({
        		dateFormat:"yy.m.d" ,showOthermonths: true ,showMonthAfterYear:true
                ,buttonImageOnly:true ,yearSuffix:"년", monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
                ,dayNamesMin:["일", "월","화","수","목","금","토"]
                , showButtonPanel:true, currentText:"오늘", closeText:"닫기"
        	});
        	//finish가 start보다 전이면 start가 선택한 finish 날짜로 변함(보류)            
        });

        
	}); 
	
	</script>
	<script>
		
		var todo_id = -1;
		// 할일 디테일 모달
		$(function () {
		    // 할일 디테일 띄우기
		    $(".todo_content2_title_a").click(function () {
		    	todo_id = $(this).parent().parent().parent().find(".todo_id").text();
		    	
		    	$.ajax({
		    		type: 'post',
		    		url: 'Controller',
		    		data: { 'command' : 'TodoDetail', 'todo_id' : todo_id },
		    		datatype: 'json',
		    		success: function(d){

		    			$("#todo_modal .TodoDetailselector_btn g").html(d.todo_cur_p);
		    			$("#todo_modal .edit_title_input").val(d.content);
		     			$("#todo_modal #todo_start_date_picker_btn").val(d.start_date);
		    			$("#todo_modal #todo_finish_date_picker_btn").val(d.finish_date);
		    			$("#todo_modal .edit_des_textarea").val(d.des);
		    			$("#todo_modal #todo_detail_writer_avatar").css('background-image', d.writer_p);
		    			$("#todo_modal #todo_detail_writer_name").text(d.writer_name);
		    			$("#todo_modal #todo_detail_pic_avatar").css('background-image', d.writer_p);
		    			$("#todo_modal #todo_detail_pic_name").text(d.pic_name); 

		    		},
		    		error: function(r,s,e){
		    			alert("에러");
		    		}
		    		
		    		
		    	});
		    	$("#todo_modal").css('display', 'block');
		    });
		    
		    // 할일 수정
		    $("#todo_detail_btn_edit").click(function () {
		    	var content = $("#todo_modal .edit_title_input").val();
		    	var start_date = $("#todo_modal #todo_start_date_picker_btn").val();
		    	var finish_date = $("#todo_modal #todo_finish_date_picker_btn").val();
		    	var des = $("#todo_modal .edit_des_textarea").val();
		    	
		    	$.ajax({
		    		type: 'post',
		    		url: 'Controller',
		    		data: { 'command' : 'TodoDetailEdit', 'todo_id' : todo_id, 'content' : content, 'start_date' : start_date, 'finish_date' : finish_date, 'des' : des },
		    		datatype: 'json',
		    		success: function(d){
		    			alert("할 일이 수정되었습니다.");
		    		},
		    		error: function(r,s,e){
		    			alert("에러");
		    		}
		    	});
		    });
		    
		    // 할일 삭제
		    $("#todo_detail_btn_del").click(function () {
		    	
		    	$.ajax({
		    		type: 'post',
		    		url: 'Controller',
		    		data: { 'command' : 'TodoDetailDel', 'todo_id' : todo_id },
		    		datatype: 'json',
		    		success: function(d){
		    			if(d.result==1){
			    			alert("할 일을 삭제하였습니다.");	
			    			location.href="Controller?command=Todo";
		    			}else{
		    				alert("할 일 삭제 실패.")
		    			}
		    			
		    		},
		    		error: function(r,s,e){
		    			alert("에러");
		    		}
		    	});
		    	
		    });
		    
		    $(".todo_modal_close_button").click(function() {
		    	location.href= "Controller?command=Home";
		    });
		    
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
		    
		    $("#searchbar").keypress(function(e){
	    	   if(e.keyCode == 13){
	    		   var search = $(this).val();
	    		   var member_id = 4;
	    		   location.href="Controller?command=SearchP1&search="+search+"&member_id="+member_id;
	    	   }
		    });
		    
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
</head>
<body>
	
	<div id="overlay">
		<div id="todo_modal_close">
				<button  title="닫기" class="todo_modal_close_button">
					<svg viewBox="0 0 24 24" width="35px" height="35px" class="button_x_svg">
						<path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="button_x_path"></path>
					</svg>
				</button>
		</div>
		
		<div id="todo_modal_content">
			<header id="todo_header">
				<div class="todo_header_left">
					<div>
						<div class="todo_header_left_top">
							<div class="todo_header_left_topleft">
								<div class="todo_title">할 일</div>
								
								<div id="todo_space_select">
									<div id="todo_space_select1">
										<span>모든 공간</span>
										<svg viewBox="0 0 24 24" width="16px" height="16px" class="todo_space_select_svg">
											<path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z" class="todo_space_select_path"></path>
										</svg>
									</div>	
								</div>
								
							</div>
							
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
					</div>
					<div class="todo_header_left_bottom">
						<div id="todo_menu">
							<li>
								<a id="todo_menu_style_active1" href="Controller?command=Todo"><span>내 할 일</span></a>
							</li>
							<li>
								<a id="todo_menu_style_active0" onclick="alert('준비중 입니다.');"><span>요청한 할 일</span></a>
							</li>
						</div>
					</div>

				</div>
				
				<div id="todo_header_right">
					<div id="todo_header_submenu">
						<a class="todo_header_submenu_link" href="Controller?command=Todo">할 일</a>
						<a class="todo_header_submenu_link" href="Controller?command=dm2">의사결정</a>
						<a class="todo_header_submenu_link" href="Controller?command=FilesAction" id="div1">파일함
							<svg viewBox="0 0 24 24" width="12px" height="12px" class="svg5"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z"></path></svg><br/>
						</a>
					</div>
					<div id="div2">
	       				<div class="div2_1"><a href="" style="text-decoration:none; color: black;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g fill="currentColor" fill-rule="evenodd"><path fill="currentColor" d="M6 2c-1.1 0-1.99.9-1.99 2L4 20c0 1.1.89 2 1.99 2H18c1.1 0 2-.9 2-2V8l-6-6H6zm7 7V3.5L18.5 9H13z"/></g></svg>파일</a></div>
	       				<div class="div2_1"><a href="" style="text-decoration:none; color: black;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="currentColor" fill-rule="evenodd" d="M3.9 12c0-1.71 1.39-3.1 3.1-3.1h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-1.9H7c-1.71 0-3.1-1.39-3.1-3.1zM8 13h8v-2H8v2zm9-6h-4v1.9h4c1.71 0 3.1 1.39 3.1 3.1 0 1.71-1.39 3.1-3.1 3.1h-4V17h4c2.76 0 5-2.24 5-5s-2.24-5-5-5z"/></svg>링크</a></div>
	    			</div>
				</div>
				

			</header>
			
			<main id="todo_main">
				<section id="todo_main_left">
					<article id="todo_article">
						
					<%
						ArrayList<TodoListDto> tDtoList = (ArrayList<TodoListDto>)request.getAttribute("tDtoList");
						for (int i = 0; i<tDtoList.size(); i++){
							
					%>
						<div>	<!-- (할일1개당) 시작 -->
							<div class="todo_content_list">
								<div style="display: none;" class="todo_id"><%=tDtoList.get(i).getTodo_id() %></div>
								
								<div class="todo_content1">
									<div>
										<button class="todo_content1_button">
											<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" _title="할 일 상태 변경">
												<g fill="none" fill-rule="evenodd">
													<%= tDtoList.get(i).getTodo_cur_p() %>
												</g>
											</svg>
										</button>
									</div>
								</div>
								<div class="todo_content2">
									<div class="todo_content2_title">
										<a class="todo_content2_title_a"><%= tDtoList.get(i).getContent() %></a>
										<span class="todo_content2_date"><%= tDtoList.get(i).getDate() %></span>
									</div>
									<div class="todo_content2_space">
										<a class="todo_content2_space_a"><%= tDtoList.get(i).getWorkspace_name() %></a>
									</div>
								</div>
								<div class="todo_content3">
									<div>
										<button size="20" class="avatar_container" name="">
											<div class="todo_avatar" style="background-image: url(<%= tDtoList.get(i).getWriter_p() %>)"></div>
										</button>
									</div>
									<svg xmlns="http://www.w3.org/2000/svg" width="5.5" height="7" viewBox="0 0 11 14" style="margin-top: 10px; margin-left: 7px; margin-right: 7px;"><path fill="#888888" fill-rule="evenodd" d="M0 0v14l11-7z"></path></svg>
									<div>
										<button size="20" class="avatar_container" name="" >
											<div class="todo_avatar" style="background-image: url(<%= tDtoList.get(i).getPic_p() %>)"></div>
										</button>
									</div>
								</div>
							</div>
						</div>	<!-- 끝 -->
					<%
						}
					%>
					</article>
				</section>
				
				
				<aside class="todo_aside_container">
					<h6 class="todo_aside_filtertitle">마감이 임박한 내 할 일</h6>
					<ul>
					<%
					ArrayList<TodoListDto> todoListW = (ArrayList<TodoListDto>)request.getAttribute("todoListW");
					for(int i = 0; i<todoListW.size(); i++){
					%>
						<li class="todo_aside_item">	<!-- 마감임박할일 시작 -->
							<div style="display: none;"><%= todoListW.get(i).getTodo_id() %></div>
							<div>
								<button class="todo_aside_iten_btn">
									<svg xmlns="http://www.w3.org/2000/svg" width="17px" height="17px" viewBox="0 0 24 24" _><g fill="none" fill-rule="evenodd"><%= todoListW.get(i).getTodo_cur_p() %></g></svg>
								</button>
							</div>
							<a class="todo_aside_item_link" href="">
								<span class="todo_aside_item_title"><%= todoListW.get(i).getContent() %></span>
								<span class="todo_aside_item_name"><%= todoListW.get(i).getWriter_p() %></span>
							</a>
						</li> <!-- 마감임박할일 끝 -->
					<%
						}
					%>
					</ul>
				</aside>
			</main>
		</div>
	</div>
	
	<div id="todo_cur_selector" role="tooltip">
		<div id="todo_cur_selector_container">
			<span id="todo_cur_selector_title">할 일 상태 변경</span>
			<button class="todo_cur_selector_button">
				<svg class="todo_cur_selector_svg" xmlns="http://www.w3.org/2000/svg" width="21px" height="21px" viewBox="0 0 24 24" title="">
					<g fill="none" fill-rule="evenodd">
						<path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z" fill="#C1C1C1"></path>
					</g>
				</svg>할당됨
			</button>
			<button class="todo_cur_selector_button">
				<svg class="todo_cur_selector_svg" xmlns="http://www.w3.org/2000/svg" width="21px" height="21px" viewBox="0 0 24 24" title=""><g fill="none" fill-rule="evenodd"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 14.5v-9l6 4.5-6 4.5z" fill="#038EDA"></path></g></svg>
				진행 중
			</button>
			<button class="todo_cur_selector_button">
				<svg class="todo_cur_selector_svg" xmlns="http://www.w3.org/2000/svg" width="21px" height="21px" viewBox="0 0 24 24" title=""><g fill="none" fill-rule="evenodd"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 14H9V8h2v8zm4 0h-2V8h2v8z" fill="#F1AA00"></path></g></svg>
				일시중지
			</button>
			<button class="todo_cur_selector_button">
				<svg class="todo_cur_selector_svg" xmlns="http://www.w3.org/2000/svg" width="21px" height="21px" viewBox="0 0 24 24" title=""><g fill="none" fill-rule="evenodd"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z" fill="#3DA200"></path></g></svg>
				완료
			</button>
			<button class="todo_cur_selector_button">
				<svg class="todo_cur_selector_svg" xmlns="http://www.w3.org/2000/svg" width="21px" height="21px" viewBox="0 0 24 24" title=""><g fill="none" fill-rule="evenodd"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z" fill="#009481"></path></g></svg>
				확인 요청
			</button>
		</div>
		
	</div>
	
	<div id="div_background"></div>
	<div id="div_background1"></div>
	
	<div class="workspace_list">
		<ul class="left-bar icon_color" >
			<li>공간 검색</li>
			<li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg><span>프로젝트</span></li>
			<li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg><span>코드공유 공간</span></li>
			<li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg><span>프라이빗 공간</span></li>
			<li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.39z"></path></svg><span>모두의 공간</span></li>
			<li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg><span>Test</span></li>
		</ul>
	</div>
	
	<!-- todo detail 모달 -->
	<div id="todo_modal" class="todo_layout_container">
		<div class="modal_overlay" aria-hidden="true" style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"></div>
		
		<div class="todo_modal1">
			<div class="todo_modal2">
				
				<form action="" method="post">
				<div id="new_todo">
					<div class="new_todo_container" style="height: 550px;">
						<header class="new_todo_header">
							<button color="mono3Grey" title="닫기" class="new_todo_btn_x" style="margin-left: 510px;">
								<svg viewBox="0 0 24 24" width="24px" height="24px" class="btn_x_svg"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="btn_x_path"></path></svg>
							</button>
						</header>

						<div>
						
							<div class="TodoDetailModal_title_container">
								<div>
									<button type="button" class="TodoDetailselector_btn"><svg xmlns="http://www.w3.org/2000/svg" width="32px" height="32px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z" fill="#C1C1C1"></path></g></svg></button>
								</div>
								<div class="edit_title_container">
									<textarea maxlength="101" placeholder="제목을 입력해 주세요." spellcheck="false" class="edit_title_input"></textarea>
								</div>
							</div>
				
							<div class="todo_detail_assign_container">
								<div class="todo_detail_assign_writer">
									<div class="todo_modal_avatar_container">
										<div class="todo_modal_avatar" id="todo_detail_writer_avatar"></div>
									</div>
									<span class="todo_modal_writer_name" id="todo_detail_writer_name"></span>
								</div>
								<svg viewBox="0 0 24 24" width="12px" height="12px" class="todo_detail_assign_svg"><path d="M4 0v24l18-12z" color="#D3D3D3" class="todo_detail_assign_path"></path></svg>
								<div class="todo_detail_assign_pic">
									<div class="todo_modal_avatar_container">
										<div class="todo_modal_avatar" id="todo_detail_pic_avatar"></div>
									</div>
									<span class="todo_modal_writer_name" id="todo_detail_pic_name"></span>
								</div>
							</div>
							
							<div class="new_todo_datecontainer">
								<div class="todo_date_picker_container">
								
									<div class="todo_date_picker_icon_area">
										<svg viewBox="0 0 24 24" width="20px" height="20px" class="btn_x_svg"><path d="M11.99,2 C17.52,2 22,6.48 22,12 C22,17.52 17.52,22 11.99,22 C6.47,22 2,17.52 2,12 C2,6.48 6.47,2 11.99,2 Z M12,4 C7.58,4 4,7.58 4,12 C4,16.42 7.58,20 12,20 C16.42,20 20,16.42 20,12 C20,7.58 16.42,4 12,4 Z M12.5,7 L12.5,12.25 L17,14.92 L16.25,16.15 L11,13 L11,7 L12.5,7 Z" class="todo_date_picker_icon_path"></path></svg>
									</div>
									
									<div class="todo_date_picker">
										<div class="todo_date_picker_datecontainer">
											<div>
												<!-- <button id="todo_start_date_picker_btn" class="todo_picker_date_btn" >시작일 추가</button> -->
												<input name="todo_startd" type='text' id="todo_start_date_picker_btn" class="todo_picker_date_btn"  value='시작일 추가'/>
											</div>
											
											<span class="todo_date_picker_devide" style="padding: 0px 10px 0px 6px;">~</span>
											
											<div>
												<!-- <button id="todo_finish_date_picker_btn" class="todo_picker_date_btn">완료일 추가</button> -->
												<input name="todo_finishd" type='text' id="todo_finish_date_picker_btn" class="todo_picker_date_btn"  value='완료일 추가'/>
												
											</div>
										</div>
									</div>
									
								</div>
							</div>
							
						</div>

						<div class="new_todo_edit_des_container">
								<div class="edit_des_iconcontainer">
									<svg viewBox="0 0 24 24" width="21px" height="21px" class="btn_x_svg"><path d="M5 1h13.6a2 2 0 0 1 2 2v18a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zm.467 1.467a1 1 0 0 0-1 1v17.066a1 1 0 0 0 1 1h12.666a1 1 0 0 0 1-1V3.467a1 1 0 0 0-1-1H5.467zm1.444 8.555V9.556h9.778v1.466H6.91zm0-3.666V5.889h9.778v1.467H6.91z" class="btn_x_path"></path></svg>
								</div>
								
								<textarea name="todo_des" maxlength="501" placeholder="할 일 설명 추가" spellcheck="false" class="edit_des_textarea"></textarea>
							</div>
						
						<footer class="new_todo_footer">
							<div class="new_todo_footercell"  style="margin-top: 170px;  margin-left: 400px;">
								<button type="button" color="primary" class="todo_detail_btn" id="todo_detail_btn_del" style="margin-right: 10px;">삭제</button>
								<button type="button" color="primary" class="todo_detail_btn" id="todo_detail_btn_edit">수정</button>
							</div>
						</footer>

					</div>
				</div>
				</form>
				
			</div>
		</div>
	</div>
	
</body>
</html>