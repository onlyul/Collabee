<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yr.dto.*" %>
<%@ page import="com.yr.dao.*" %>
<%@ page import="com.jm.dto.*" %>
<%@ page import="com.jm.dao.*" %>
<%
	/* int member_id = (Integer)(session.getAttribute("member_id")); */
	ArrayList<IncludingDto> list = (ArrayList<IncludingDto>)request.getAttribute("list");
	ArrayList<MyWorkspaceDto> list2 = (ArrayList<MyWorkspaceDto>)request.getAttribute("list2");
	int workspaceId = (Integer)request.getAttribute("workspaceId");
	int loginId = (Integer)session.getAttribute("loginId");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>의사결정2</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	<script src="js/jquery-3.6.0.min.js"></script>
	<link href="css/0dm2.css" rel="stylesheet" type="text/css">
	<script>
	$(function(){
		$("#dm_ready").click(function(){
			alert("준비 중입니다.");
		});
		
		$("#dmdiv1").mouseenter(function() {
            $("#dmdiv2").css("display","block");
		});
        $("#dmdiv2").mouseleave(function() {
            $("#dmdiv2").css("display","none");
        });
		
       //협업공간 리스트 뜨기
      $(".dm2_workspace_sel").on("click", function(){ 
    	  var px = $(this).offset().left + 10;	// 클릭한 현재위치 가로 
	      var py = $(this).offset().top+ 25;
	      $(".workspace_list").css('left',px+'px');
	      $(".workspace_list").css('top',py+'px'); 
    	  $(".workspace_list").css("display", "block");
          $(".dm2_workspace_sel").html("공간 검색").css("color", "rgb(255, 255, 255)");
          $(".dm2_svg1").css("display", "none");
       });
       
       $(document).click(function(e){
	       	if(e.target.id != 'dmworkspace_sel') {  
		       	if($(".workspace_list").has(e.target).length==0) {
		       		$(".workspace_list").css("display", "none");
		       	}
	       	}
       });
       $(".workspace_list > ul > li ").click(function(){ //리스트 선택하면 그값으로 바뀌고 리스트 닫힘
           var workspace = $(this).find("span").text();
           $(".dm2_workspace_sel").html(workspace);
           $(".workspace_list").css('display', 'none');
           $(".dm2_svg1").css("display", "block");
       });
       
       
       $(".workspace_list li").hover(function (){
           $(this).css("background-color", "rgb(242,242,242)");
       }, function(){
           $(this).css("background-color", "rgb(255, 255, 255)");
       });
       
       
       $('.dm2_btn0').click(function(){
    	   window.history.back();
       }); 
       
       $('.dm2_decision_making').click(function(){
    	   var decision_making_id = $(this).attr("decisionMakingId");
    	   $('.mini_main_dm3').text("대기");
			$("#waiting_mark").css("display", "block");
    	   var workspace_id = $(this).attr("workspaceId");
    	   $('.mini_del2').attr("decisionMakingId", decision_making_id);
    	   $('.mini_main_textarea').attr("decisionMakingId", decision_making_id);
    	   $('.admit').attr("decisionMakingId", decision_making_id);
    	   $('.reject').attr("decisionMakingId", decision_making_id);
    	   $('.next_dm_btn2').attr("decisionMakingId", decision_making_id);
    	   $('.mini_more_div').css("display", "none");
    	   $('.mini_more_btn_svg').css("transform", "scaleY(1)");
    	   $.ajax({
    		   type: 'get',
    		   url: 'Controller?command=Dm2Mini',
    		   data: {'decision_making_id' : decision_making_id, 'member_id' : 4, 'workspace_id' : workspace_id},
    		   datatype: 'json',
    		   success: function(d){
    			   var writer_picture = "url(" + d.writer_picture + ")";
    			   $('.mini_header_wname').text(d.workspace_name);
    			   $('.mini_header_wname').attr("workspaceId", d.workspace_id);
    			   $('.mini_header_document').text(d.document_title);
    			   $('.mini_header_document').attr("documentId", d.document_id);
    			   $('.mini_main_textarea').text(d.dm_title);
    			   $('.mini_main_div2_btn').css("background-image", writer_picture);
    			   $('.mini_main_div2_span').text(d.writer_name);
    			   $('.mini_main_date').text(d.edit_date);
    			   $('.admit').attr("max", d.max);
    			   $('.reject').attr("max", d.max);
    			   $('.next_dm_btn2').attr("max", d.max);
    			   var l = d.array.length;
    			   $("#num").text(l);
    			   $("#mini_ul *").remove();
    			   if(l != 0){
    				   $("#mini_more").css("display", "block");
    				   for(var i in d.array){
        				   var decision_icon_p = d.array[i].p_decision_icon_p;
        				   var decision_making_cur = d.array[i].p_decision_making_cur;
        				   var name = d.array[i].p_name;
        				   var picture = d.array[i].p_picture;
        				   var edit_date = d.array[i].p_edit_date;
        				   var decision = d.array[i].p_decision;
						   var color = "rgb(163, 163, 163);";
						   if(decision == 0){
							   color = "rgb(189, 2, 25);";
						   }else if(decision == 1){
							   color = "rgb(0, 110, 184);";
						   }
        				   
    	    			   var past = "<div class='decisionDetail'>"
    						+"<div class='decisionDetail_row1'>"
    						+"<svg viewBox='0 0 24 24' width='18px' height='18px' class='decisionDetail_svg1'>"+ decision_icon_p +"</svg>"
    						+"<span class='decisionDetail1' style='color: "+ color +"'>"+ decision_making_cur +"</span>"
    						+"<div class='mini_main_dm4'>"
    						+"<button class='mini_main_div2_btn' style='background-image: url("+ picture +")'></button>"
    						+"<span class='mini_main_div2_span'>"+ name +"</span>"
    						+"</div>"
    						+"</div>"
    						+"<div class='decisionDetail_row2'>"
    						+"<span class='decisionDetail2'>"+ edit_date +"</span>"
    						+"</div>"
    						+"</div>";
    						
    						$("#mini_ul").append(past);
        			   }
    			   }else{
    				   $("#mini_more").css("display", "none");
    			   }
    			   $("#dm2_selectpic *").remove();
    			   for(var i in d.array2){
    				   var next_member_id = d.array2[i].next_member_id;
    				   var next_picture = d.array2[i].next_picture;
    				   var next_name = d.array2[i].next_name;
    				   if(next_picture == null){
    					   next_picture = "https://down.collabee.co/userProfile/1";
    				   }
    				   var next = "<div class='dm2_list' memberId='"+ next_member_id +"'>"
   			   			+ "<button class='dm2_pi' style='background-image : url("+ next_picture +")'></button><span class='dm22_name'>"+ next_name +"</span>"
   				   		+	"</div>";
    				   $("#dm2_selectpic").append(next);
    			   }
    		   },
    		   error: function(r,s,e){
    			   alert("에러");
    		   }
    	   });
    	   $('.modal-backdrop').css("display", "block");
       });
       
       $(document).on("click", '.dm2_list', function(){ //리스트 선택하면 그값으로 바뀌고 리스트 닫힘
			var name = $(this).text();
			var picture = $(this).find('.dm2_pi').attr("style");
			var memberId = $(this).attr("memberId");
			$("#dm2_pic_sel").removeClass("dm2_hidden");
			$("#dm2_pic_sel").attr("style", picture);
			$("#dm2_pic_sel").css("display", "block");
			$("#dm2_pic_sel").attr("memberId", memberId);
			$('.dm2_pic_btn').html(name).css("color", "rgb(0, 0, 0)");
			$('.dm2_select_pic').css('display', 'none');
			$("#dm2_svg111").css("display", "block");
		});
	   	
	   	$(document).on("click", '.dm2_pic_btn', function (e){
	   		if($('.dm2_select_pic').css('display')=='none') {
	        	$('.dm2_select_pic').css('display', 'block');
	        	$('.dm2_pic_btn').html("결정자 선택").css("color", "rgb(193, 193, 193)");
	        	$("#dm2_svg111").css("display", "none");
	        	$("#dm2_pic_sel").addClass("dm2_hidden");
	   		} else {
	       		$('.dm2_select_pic').css('display','none');
	   		}
		});
       
       
       $('.mini_x_btn').click(function(){
    	   $('.modal-backdrop').css("display", "none");
    	   $("#next_dm").css("display", "none");
    	   $("#dm_moment").css("display", "none");
    	   $("#dm2_selectpic").css("display", "none");
    	   $("#dm2_pic_sel").css("background-image", "");
    	   $('.dm2_pic_btn').html("결정자 선택").css("color", "rgb(193, 193, 193)");
    	   $("#dm2_svg111").css("display", "none");
    	   $("#dm2_pic_sel").attr("memberId", "");
       });
       
       $('.mini_header3_btn2').click(function(){
    	   $('.mini_del').toggle();
       });
       
       $('.mini_del2').click(function(){
    	   var decision_making_id = $(this).attr("decisionMakingId");
    	   $.ajax({
    		   type: 'get',
    		   url: 'Controller?command=Dm2Delete',
    		   data: { 'decision_making_id' : decision_making_id},
    		   datatype: 'json',
    		   succcess: function(d){
    			   alert("의사결정이 삭제되었습니다.");
    			   location.href="Controller?command=dm2"
    		   },
    		   error: function(r,s,e){
    			   alert("error");
    		   }
    	   });
       });
       
       $('.mini_main_textarea').focusout(function(){
    	   var title = $(this).val();
    	   var decision_making_id = $(this).attr("decisionMakingId");
    	   $.ajax({
    		   type: 'get',
    		   url: 'Controller?command=Dm2Edit',
    		   data: {'title' : title, 'decision_making_id' : decision_making_id},
    		   datatype: 'json',
    		   success: function(d){
    			   alert("의사결정 제목이 수정되었습니다.");
    		   },
    		   error: function(r,s,e){
    			   alert("error");
    		   }
    	   });
       });
       
       $('.mini_more_btn').click(function(){
    	   $('.mini_more_div').toggle();
    	   if($('.mini_more_div').css("display")=="none"){
    		   $('.mini_more_btn_svg').css("transform", "scaleY(1)");
    	   }else{
    		   $('.mini_more_btn_svg').css("transform", "scaleY(-1)");
    	   }
       });
       
       $("#dmsearchbar").keypress(function(e){
    	   if(e.keyCode == 13){
    		   var search = $(this).val();
    		   var member_id = 4;
    		   location.href="Controller?command=SearchP1&search="+search+"&member_id="+member_id;
    	   }
       });
       
       $("#dmposting_bnt").on("click", function(){ 
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
		<div class="workspace_list" id="workspace_list">
             <ul class="dm2_left-bar icon_color">
                 <li>공간 검색</li>
			      	<%
						for(int i = 0; i<list2.size(); i++){
					%>
					<li>
						<svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg>
						<span><%=list2.get(i).getWorkspace_name() %></span>
						<div style="display: none;"><%=list2.get(i).getWorkspace_id() %></div>
					</li>
					<%
						}
					%>
             </ul>
        </div>
           
           
	<div class="dm2_layout">
		<div class="dm2_layout2">
			<div class="dm2_close">
				<button class="dm2_btn0">
				<svg viewBox="0 0 24 24" width="35px" height="35px" class="dm2_close2"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg>
				</button>
			</div>
		</div>
		<main class="dm2_main">
			<header class="dm2_header">
			<div class="dm2_header1">
			<div class="dm2_header0">
			<div class="dm2_header2">
			<div class="dm2_header3">
				<button class="dm2_btn1">의사결정</button>
				<div>
				<div class="dm2_workspace">
					<div class="dm2_workspace2">
						<div class="dm2_workspace3">
							<div class="dm2_workspace4">
								<button class="dm2_workspace_sel" id="dmworkspace_sel">모든 공간</button>
								<svg viewBox="0 0 24 24" width="16px" height="16px" class="dm2_svg1"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z"></path></svg>
							</div>
							<div class="dm2_s_workspace">
								<div class="dm2_s_workspace2">
									<input class="dm2_input1" type="text"/>
									<div class="dm2_s_workspace3"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>
			</div>
			
			
			
			<div class="dm2_top_right">
			<div class="dm2_mastersearchbar">
		        <div id="dmsearch_icon" class="dm2_bnt_base"><svg class="dm2_micro" viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
		        <input type ="text" id="dmsearchbar" placeholder="검색"/>
		    </div>
		    <button id="dmposting_bnt">
	            <svg viewBox="0 0 24 24" width="13px" height="13px" ><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="dmposting_icon" ></path></svg>
	            <span>문서 작성</span>
	        </button>
			</div>
			</div>
			
			<p class="dm2_subtitle">의사결정은 문서에서만 요청할 수 있습니다.</p>
			<div class="dm2_under">
				<div class="dm2_under2">
				<a active="1" class="dm2_under2_1 dm2_white" href="">받은 의사결정</a>
				<a active="0" class="dm2_under2_1" id="dm_ready">요청한 의사결정</a>
				</div>
				<div class="dm2_under3">
				<button class="dm2_btn2">
					<svg class="dm2_svg10" xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 20 20"><g fill="none" fill-rule="evenodd"><path fill="#888888" d="M3 18h6v-2H3v2zM3 6v2h18V6H3zm0 7h12v-2H3v2z"></path></g></svg>
				</button>
				</div>
			</div>
			</div>
			</div>
			
			<div class="dm2_subheader_right3">
				<div class="dm2_subheader_right3_menu">
				<a href="Controller?command=Todo" class="dm2_subheader_right3_menu2">할 일</a>
				<a herf="" class="dm2_subheader_right3_menu2">의사결정</a>
				<div style="position: relative; margin-top: -5px;">
					<a class="dm2_file1" href="Controller?command=FilesAction" id="dmdiv1">파일함
					<svg viewBox="0 0 24 24" width="12px" height="12px" class="dm2_svg5"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z"></path></svg><br/>
					</a>
				</div>
				</div>
				<div id="dmdiv2">
       				<div class="dm2_div2_1"><a href="Controller?command=FilesAction" style="text-decoration:none; color: black;"><img src="image/file.svg" style="filter: opacity(0.5); width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>파일</a></div>
       				<div class="dm2_div2_1"><a href="Controller?command=LinksAction" style="text-decoration:none; color: black;"><img src="image/link.svg" style="filter: opacity(0.5); width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>링크</a></div>
    			</div>
			</div>
			
			</header>
		
			<div class="dm2_class_main">
			<div class="dm2_section1">
				<div class="dm2_section1_1">
				<div taindex="0">
<%
	for(int i=0; i<=list.size()-1; i++){
		ArrayList<DmBarDto> listDmbar = list.get(i).getListDm();
		for( DmBarDto dto : listDmbar){
%>				
					<div class="dm2_container1">
						<div class="dm2_container2">
							<svg class="dm2_svg20" viewBox="0 0 24 24" width="24px" height="24px"><path d="M2.833 4h13.75c.633 0 1.128.32 1.458.807L23 12.25l-4.96 7.434c-.33.486-.888.816-1.52.816H2.832A1.839 1.839 0 0 1 1 18.667V5.833C1 4.825 1.825 4 2.833 4zm11.917 9.625c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375zm-4.583 0c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375s-1.375.614-1.375 1.375c0 .76.614 1.375 1.375 1.375zm-4.584 0c.761 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375z" color="#c1c1c1"></path></svg>
						</div>
						<div class="dm2_container3">
							<a class="dm2_decision_making" workspaceId="<%= dto.getWorkspace_id()%>" decisionMakingId="<%= dto.getDecision_making_id()%>"><%= dto.getDecision_making_title() %></a>
							<a class="dm2_decision_making2">
								<div>
									<span class="dm2_present"><%= dto.getDecision_making_cur()%></span>
									<span class="dm2_name"><%= dto.getName()%></span>
									<span class="dm2_waiting">의사결정 기다리는 중</span>
								</div>
							</a>
							<a class="dm2_wname" href="Controller?command=select_Workspace_Index&workspaceId=<%= dto.getWorkspace_id() %>&workspaceName=<%= dto.getWorkspace_name()%>&loginId=4" workspaceId="<%= dto.getWorkspace_id()%>"><%= dto.getWorkspace_name()%></a>
							<a class="dm2_dname" href="Controller?command=showNewDocument&documentId=<%= list.get(i).getDocument_id()%>&workspaceId=<%= dto.getWorkspace_id() %>&workspaceName=<%= dto.getWorkspace_name()%>" documentId="<%= list.get(i).getDocument_id()%>"><%= dto.getTitle()%></a>
						</div>
						<div class="dm2_container4">
							<div>
								<button size="20" class="dm2_avatar_c" style="background-image: url(<%= list.get(i).getWriter_picture() %>);"></button>
							</div>
							<svg viewBox="0 0 24 24" width="12px" height="12px" class="dm2_svg30"><path d="M8 5v14l7-7z" color="#888888"></path></svg>
							<div>
								<button size="20" class="dm2_avatar_c" style="background-image: url(<%= dto.getPicture1()%>);"></button>
							</div>
						</div>
					</div>
<%
		}
	}
%>					

				<div class="dm2_last">
				<svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path fill="#c1c1c1" fill-rule="evenodd" d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm3.5-9c.83 0 1.5-.67 1.5-1.5S16.33 8 15.5 8 14 8.67 14 9.5s.67 1.5 1.5 1.5zm-7 0c.83 0 1.5-.67 1.5-1.5S9.33 8 8.5 8 7 8.67 7 9.5 7.67 11 8.5 11zm3.5 6.5c2.33 0 4.31-1.46 5.11-3.5H6.89c.8 2.04 2.78 3.5 5.11 3.5z"></path></svg>
				<div>마지막 컨텐츠입니다</div>
				</div>
				
				</div>
				</div>
			</div>
			
			
			<div class="dm2_aside">
			<%@ include file="../WEB-INF/include/Aside.jsp" %>	
	
				
			</div>
			</div>
		</main>
	</div>
	
	
	
<div class="modal-backdrop" id="modal-backdrop">
	<div class="mini_dm2_layout">
		<div class="mini_x">
			<button class="mini_x_btn">
			<svg viewBox="0 0 24 24" width="35px" height="35px" class="mini_x_btn_svg"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg>
			</button>
		</div>
		<div class="mini_dm2_layout2" id="mini_dm2_layout2">
			<input type="file" class="mini_file" style="display: none;"/>
			<header class="mini_header">
				<div class="mini_header2">
					<a class="mini_header_wname" href="" workspaceId="">프로젝트</a>
					<a class="mini_header_document" documentId="">의사</a>
				</div>
				<div class="mini_header3">
					<button class="mini_header3_btn">
						<svg viewBox="0 0 24 24" width="20px" height="20px" class="mini_header3_svg" title="파일 추가"><path d="M16.5 6v11.5c0 2.21-1.79 4-4 4s-4-1.79-4-4V5a2.5 2.5 0 0 1 5 0v10.5c0 .55-.45 1-1 1s-1-.45-1-1V6H10v9.5a2.5 2.5 0 0 0 5 0V5c0-2.21-1.79-4-4-4S7 2.79 7 5v12.5c0 3.04 2.46 5.5 5.5 5.5s5.5-2.46 5.5-5.5V6h-1.5z"></path></svg>
					</button>
					<div class="mini_header3_div">
						<button class="mini_header3_btn2">
							<svg viewBox="0 0 24 24" width="19px" height="19px" class="mini_header3_svg2"><path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path></svg>
						</button>
						<div class="mini_del">
							<div class="mini_del2" decisionMakingId = "">의사결정 삭제</div>
						</div>
					</div>
				</div>
			</header>
			
			<main class="mini_main">
				<div class="mini_main_div1">
					<svg viewBox="0 0 24 24" width="32px" height="32px" class="mini_main_svg1"><path d="M2.833 4h13.75c.633 0 1.128.32 1.458.807L23 12.25l-4.96 7.434c-.33.486-.888.816-1.52.816H2.832A1.839 1.839 0 0 1 1 18.667V5.833C1 4.825 1.825 4 2.833 4zm11.917 9.625c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375zm-4.583 0c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375s-1.375.614-1.375 1.375c0 .76.614 1.375 1.375 1.375zm-4.584 0c.761 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375z" color="#c1c1c1" ></path></svg>
					<textarea class="mini_main_textarea" maxlength="1000" rows="1" decisionMakingId="">문서제목</textarea>
				</div>
				<div class="mini_main_div2">
					<div class="mini_main_div2_writerName">
						<button class="mini_main_div2_btn"></button>
						<span class="mini_main_div2_span">유라짱</span>
					</div>
					<span class="mini_main_date">2022.07.21...</span>
				</div>
				<div class="mini_main_div3">
					<div class="mini_main_dm">
						<div class="mini_main_dm2">
							<svg viewBox="0 0 24 24" width="18px" height="18px" class="mini_main_dm2_svg"><path d="M2.833 4h13.75c.633 0 1.128.32 1.458.807L23 12.25l-4.96 7.434c-.33.486-.888.816-1.52.816H2.832A1.839 1.839 0 0 1 1 18.667V5.833C1 4.825 1.825 4 2.833 4zm11.917 9.625c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375zm-4.583 0c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375s-1.375.614-1.375 1.375c0 .76.614 1.375 1.375 1.375zm-4.584 0c.761 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375z" color="#c1c1c1"></path></svg>
							<span class="mini_main_dm3">대기</span>
							<div class="mini_main_dm4">
								<button class="mini_main_div2_btn"></button>
								<span class="mini_main_div2_span">유라짱</span>
							</div>
						</div>
						<div class="mini_main_dm5">
							<div id="waiting_mark">의사결정 기다리는 중</div>
							<div style="margin-right: 30px;">
								<button class="mini_main_dm5_btn">결정자 변경</button>
								<button class="mini_main_dm5_btn2">결정하기</button>
							</div>
						</div>
					</div>
					
					<div class="mini_main_dm" id="dm_moment">
						<div class="dm_moment1">다음 결정자를 선택하기 전까지 결정 변경이 가능합니다.</div>
						<div class="dm_moment2">
							<button class="admit" decision="1" decisionMakingId="" max="">
								<svg viewBox="0 0 24 24" width="16px" height="16px" class="admit_svg"><path d="M2.833 4h13.75c.633 0 1.128.32 1.458.807L23 12.25l-4.96 7.434c-.33.486-.888.816-1.52.816H2.832A1.839 1.839 0 0 1 1 18.667V5.833C1 4.825 1.825 4 2.833 4zm1.201 8.223l4.63 4.638 7.782-7.774-1.412-1.42-6.37 6.37-3.218-3.217-1.412 1.402z" color="#888888"></path></svg>
								<span>승인</span>
							</button>
							<button class="reject" decision="0" decisionMakingId="" max="">
								<svg viewBox="0 0 24 24" width="16px" height="16px" class="reject_svg"><path d="M21.167 4H7.417c-.633 0-1.128.32-1.458.807L1 12.25l4.96 7.434c.33.486.824.816 1.457.816h13.75A1.839 1.839 0 0 0 23 18.667V5.833A1.839 1.839 0 0 0 21.167 4zm-2.75 11.54l-1.293 1.293-3.29-3.29-3.291 3.29-1.293-1.292 3.29-3.291-3.29-3.29 1.293-1.293 3.29 3.29 3.291-3.29 1.293 1.292-3.291 3.291 3.29 3.29z" color="#888888"></path></svg>
								<span>반려</span>
							</button>
						</div>
					</div>
					
					<div class="mini_main_dm" id="next_dm">
						<div class="dm_momenet1">변경할 결정자를 선택해 주세요.</div>
						<div class="dm2_modal_mid">
				      	<div class="dm2_pii" id="dm2_pic_sel">
				      	</div>
				      	<div>
				      		<button type="button" class="dm2_pic_btn" id="dm2_pic_btn" memberId="">결정자 선택</button>
				      	</div>
				      	<div class="dm2_svg_box">
				      		<svg viewBox="0 0 24 24" width="16px" height="16px" id="dm2_svg111"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z"></path></svg>
				      	</div>
				      	</div>
				      <div class="dm2_select_pic" id="dm2_selectpic">
						<!-- 여기에 이제 사람이름리스트가 들어오는것임 -->		
						</div>
						<div class="next_dm_class">
							<button class="next_dm_btn">취소</button>
							<button class="next_dm_btn2" max="" decisionMakingId="">결정</button>
						</div>
						</div>
					
					<div class='mini_more' id='mini_more'>
					<button class='mini_more_btn'>
					<span>이전 의사결정( <span id="num">2</span> )접기</span>
					<svg xmlns='http://www.w3.org/2000/svg' width='8' height='4' viewBox='0 0 8 4' class='mini_more_btn_svg'><path d="M0 0l4 4 4-4z" fill="#888888" fill-rule="evenodd"></path></svg>
					</button>
					<div class='mini_more_div'>
					<div style='width: 100%; display: flex;'>
							<ul id="mini_ul">
							</ul>
					</div>
					</div>
					</div>
					
				</div>
			</main>
		</div>
	</div>
</div>	
<script>
	$(function(){
		$('.next_dm_btn').click(function(){
			$("#next_dm").css("display", "none");
		});
		
		$('.next_dm_btn2').click(function(){
			var member_id = $("#dm2_pic_sel").attr("memberId");
			var max = $(this).attr("max");
			var decision_making_id = $(this).attr("decisionMakingId");
			if(member_id == undefined){
				alert("결정자를 선택해주세요.");
				$('.dm2_select_pic').css("display", "block");
			}else{
				$.ajax({
					type: 'get',
					url: 'Controller?command=Dm2ChangeDecisionMaker',
					data: {"member_id" : member_id, "max" : max, "decision_making_id" : decision_making_id},
					datatype: 'json',
					success: function(d){
						alert("결정자가 변경되었습니다.");
						$("#next_dm").css("display", "none");
						$('.mini_main_dm3').text("결정자 변경완료");
						$("#waiting_mark").css("display", "none");
					},
					error: function(r,s,e){
						alert("error");
					}
				});
			}
		});
		
		$('.mini_main_dm5_btn').click(function(){
			$("#next_dm").toggle();
		});
		$('.mini_main_dm5_btn2').click(function(){
			$("#dm_moment").toggle();
		});
		
		$('.admit').click(function(){
			var decision = $(this).attr("decision");
			var decision_making_id = $(this).attr("decisionMakingId");
			var max = $(this).attr("max");
			$.ajax({
				type: 'get',
				url: 'Controller?command=Dm2Decision',
				data: { 'decision' : decision, 'decision_making_id' : decision_making_id, 'max' : max},
				datatype: 'json',
				success: function(d){
					alert("의사결정이 완료되었습니다. 다음 결정자를 고르실 수 있습니다.");
					$("#dm_moment").css("display", "none");
					$('.mini_main_dm3').text("의사결정완료");
					$("#waiting_mark").css("display", "none");
				},
				error: function(r,s,e){
					alert("error");
				}
			});
		});
		$('.reject').click(function(){
			var decision = $(this).attr("decision");
			var decision_making_id = $(this).attr("decisionMakingId");
			var max = $(this).attr("max");
			$.ajax({
				type: 'get',
				url: 'Controller?command=Dm2Decision',
				data: { 'decision' : decision, 'decision_making_id' : decision_making_id, 'max' : max},
				datatype: 'json',
				success: function(d){
					alert("의사결정이 완료되었습니다. 다음 결정자를 고르실 수 있습니다.");
					$("#dm_moment").css("display", "none");
					$('.mini_main_dm3').text("의사결정완료");
					$("#waiting_mark").css("display", "none");
				},
				error: function(r,s,e){
					alert("error");
				}
			});
		});
		
		
	});
</script>

</body>
</html>