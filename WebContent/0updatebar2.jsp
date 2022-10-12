<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yr.dto.*" %>
<%@ page import="com.yr.dao.*" %>
<%
	//UpdatebarDao uDao = new UpdatebarDao();
	//ArrayList<ArticleDto> list = uDao.setChecked(4);
	ArrayList<ArticleDto> list = (ArrayList<ArticleDto>)request.getAttribute("list");
	int corporation_id = 5;
	int loginId = 4;
	int workspaceId = (Integer)request.getAttribute("workspaceId");
	/* ArrayList<NoneFolderDto> listNone = (ArrayList<NoneFolderDto>)request.getAttribute("list2"); */
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>협업툴 콜라비 - 한 장으로 끝! 문서기반 협업툴, 콜라비</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  	<link href="css/0updatebar2.css" rel="stylesheet" type="text/css">
	<script>
	$(function(){
       	$('.file1').mouseenter(function() {
       	    $("#div2").css("display","block");
       	});
       	$('.file1').mouseleave(function() {
       	    $("#div2").css("display","none");
       	});
       	
    	$( document ).ready( function() {
       	   $('.btn1').attr("title", "${name}");
       	   $('.btn1').attr({
       		   title : "${name}",
       		   style: "background-image: url(${picture});"
       	   });
	       	$('.home_option_btn1').attr({
    		   title : "${name}",
    		   style: "background-image: url(${picture});"
	    	});
       	});
    	
    	$("#searchbar").keypress(function(e){
     	   if(e.keyCode == 13){
     		   var search = $(this).val();
     		   var member_id = 4;
     		   location.href="Controller?command=SearchP1&search="+search+"&member_id="+member_id;
     	   }
        });
    	
    	$(".header_menu5").on("click", function(){ 
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
    	
    	$(document).on("click","button[title='파일']", function(){
			alert("서비스 준비중입니다.");
		});
    	//의사결정모달 띄우기
        $(document).on("click","button[title='의사결정']", function(){    
     	   $("#dm1_modal_include").css('display', 'block');
     	   $("#myModal").css('display', 'block');
 		});
	});
	</script>
	<!-- 지현부분 추가 -->
	<script>
	$(document).on("click","button[title='일정']", function(){
		$("#schedule").removeClass("hidden");
	});
	</script>
	<!-- 정민부분 추가한 거 -->
	<script>
	$(function () {
		$(document).on("click","button[title='할 일']", function(){
			$("#todo_modal_include").css('display', 'block');
		});
		
		$(".new_todo_btn_x").click(function() {
			$("#todo_modal_include").css('display', 'none');
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
	});
	
	</script>
</head>
<body>
<%@ include file="WEB-INF/include/include_PartnerModal.jspf" %>	
<div id="todo_modal_include" style="display: none"> 
	<%@ include file="../WEB-INF/include/Todo_modal.jspf"%>
</div>
<div id="dm1_modal_include" style="display: none"> 
	<%@ include file="0dm11.jspf" %>
</div>
<div class="row">	
	<div>
		<%@ include file="../WEB-INF/include/HomeSidebar2.jsp" %>
	</div>	
	<main class="layout">
	<header>
	<div class="top_header">
	<div class="top_left">
	<div class="top_header_title">
		<a class="update_title" href="">업데이트</a>
		<div class="mastersearchbar">
	        <div id="search_icon" class="bnt_base"><svg class="micro" viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
	        <input type ="text" id=searchbar placeholder="검색"/>
	    </div>
	</div>
	<div class="header_menu">
	<div class="header_menu2">
		<button type="button" title="할 일" class="header_menu3">
		<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg1"><path d="M12 1.5C6.204 1.5 1.5 6.204 1.5 12S6.204 22.5 12 22.5 22.5 17.796 22.5 12 17.796 1.5 12 1.5zM9.9 17.25L4.65 12l1.48-1.48 3.77 3.758 7.97-7.969L19.35 7.8 9.9 17.25z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
		<span class="header_menu4">할 일</span>
		</button>
		
		<button type="button" title="일정" class="header_menu3">
		<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg1"><path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19a2 2 0 0 0 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
		<span class="header_menu4">일정</span>
		</button>
		
		<button type="button" title="파일" class="header_menu3">
		<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg1"><path d="M16.5 6v11.5c0 2.21-1.79 4-4 4s-4-1.79-4-4V5a2.5 2.5 0 0 1 5 0v10.5c0 .55-.45 1-1 1s-1-.45-1-1V6H10v9.5a2.5 2.5 0 0 0 5 0V5c0-2.21-1.79-4-4-4S7 2.79 7 5v12.5c0 3.04 2.46 5.5 5.5 5.5s5.5-2.46 5.5-5.5V6h-1.5z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
		<span class="header_menu4">파일</span>
		</button>
		
		<button type="button" title="의사결정" class="header_menu3">
		<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg1"><path d="M2.833 4h13.75c.633 0 1.128.32 1.458.807L23 12.25l-4.96 7.434c-.33.486-.888.816-1.52.816H2.832A1.839 1.839 0 0 1 1 18.667V5.833C1 4.825 1.825 4 2.833 4zm11.917 9.625c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375zm-4.583 0c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375s-1.375.614-1.375 1.375c0 .76.614 1.375 1.375 1.375zm-4.584 0c.761 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
		<span class="header_menu4">의사결정</span>
		</button>
		
		<div style="flex: 1 1 auto;">
	<button title="문서 작성" class="header_menu5">
	<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg2"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" color="#fff" class="Beecon__Path-sc-3x6pq4-1 jdeJZe"></path></svg>
	<span style="margin-left: 4px; font-size: 13px;">문서 작성</span>
	</button>
	</div>
	</div>
	</div>
	</div>
	
	<div class="topright1">
	<%@ include file="homehead14.jspf" %>
	</div>
	</div>
	
	
	<div class="subheader1">
	<div class="subheader2">
	<nav class="nav1">
	<a label href="Controller?command=updatebar1" class="subheader3">
	이슈 업데이트
	</a>
	<div style="position: relative;">
		<button class="new"><span class="subheader4">뉴스피드</span></button> <!-- onClick="location.href='updatebar1.html'" -->
	</div>
	<a class="call" label href="">
	<span class="position: relative;">@호출됨</span>
	</a>
	</nav>
	<div class="subheader_right1">
		<button title="뱃지 알림(@)" class="subheader_right2">
		<svg xmlns="http://www.w3.org/2000/svg" width="16px" height="16px" viewBox="0 0 24 24"><path fill="#888888" d="M11.722 22C5.748 22 2 18.88 2 12.955 2 7.151 5.942 2 12.883 2c5.369 0 8.924 3.386 8.924 8.343 0 4.595-2.322 7.11-5.708 7.11-1.644 0-2.563-.604-2.878-1.475h-.096c-.653.726-1.645 1.427-2.95 1.427-1.96 0-3.387-1.257-3.387-3.87 0-3.99 1.814-6.674 4.91-6.674 1.136 0 2.031.339 2.563.774h.097l.145-.58h2.709l-1.33 7.11c-.146.798-.049 1.354.75 1.354 1.813 0 2.974-1.814 2.974-5.006 0-4.015-2.153-6.65-6.82-6.65-5.466 0-8.561 3.893-8.561 9.044 0 4.788 2.66 7.207 7.521 7.207 2.37 0 4.426-.484 5.707-.92v1.67C16.027 21.491 14.068 22 11.722 22zm-.58-6.675c.75 0 1.305-.362 1.74-.798l.92-5.15c-.266-.315-.87-.606-1.645-.606-1.693 0-2.394 2.08-2.394 4.692 0 1.282.435 1.862 1.378 1.862z"></path></svg>
		</button>
		<button title="안 읽음" class="subheader_right2">
		<svg class="svg5" width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><polygon points="0 0 24 0 24 24 0 24"></polygon><path d="M11,17 L11,19.2 L3,19.2 L3,17 L11,17 Z M15,11 L19,15.8288889 L19,11 L21,11 L21,19.2 L19,19.2 L15,14.3711111 L15,19.2 L13,19.2 L13,11 L15,11 Z M11,11 L11,13.2 L3,13.2 L3,11 L11,11 Z M21,5 L21,7.2 L3,7.2 L3,5 L21,5 Z" fill="#888888"></path></g></svg>
		</button>
	</div>
	</div>
	
	<div class="subheader_right3">
		<div class="subheader_right3_menu">
		<a href="Controller?command=Todo" class="subheader_right3_menu2">할 일</a>
		<a href="Controller?command=dm2" class="subheader_right3_menu2">의사결정</a>
	<div style="position: relative;">
		<a class="file1" href="Controller?command=FilesAction">파일함
		<svg viewBox="0 0 24 24" width="12px" height="12px" class="svg5"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z"></path></svg>
		</a>
	</div>
		</div>
		<div id="div2">
      		<div class="div2_1"><a href="Controller?command=FilesAction" style="text-decoration:none; color: black;"><img src="image/file.svg" style="filter: opacity(0.5); width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>파일</a></div>
      		<div class="div2_1"><a href="Controller?command=LinksAction" style="text-decoration:none; color: black;"><img src="image/link.svg" style="filter: opacity(0.5); width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>링크</a></div>
   		</div>
	</div>
	</div>
	</header>
	
	
	
<div class="layout_body">
	<div class="main_section">
	<!-- <div class="updatebar2_container"></div> -->
		<div class="taindex">
		
		
		
		
		
<%
	for(ArticleDto dto : list){
		ArrayList<ArticleCommentDto> listComment = dto.getListComment();
%>		
		
		
	<div class="feedlist1">
		<a href="Controller?command=showNewDocument&documentId=<%= dto.getId()%>&workspaceId=<%= dto.getW_id()%>&workspaceName=<%= dto.getWname()%>&loginId=4" class="feedlist2" documentId="<%= dto.getId() %>"><%= dto.getTitle() %></a> 
		<ul>
		
<%
	for( ArticleCommentDto dto2 : listComment ){
%>			
			<li class="feedlist_li">
			<div class="li_1">
				<!-- <button size="20" class="avatar_c"></button> -->
				<img class="avatar_c" src='https://ifh.cc/g/Xrorvw.png' border='0'>
			</div>
			<div class="li_2">
				<div class="li_2_1">
					<span class="comment"><%= dto2.getContent() %></span>
				</div>
				<div class="li_2_2">
					<span><%= dto2.getName()%></span>
					<span class="date"><%= dto2.getCreation_date() %></span>
				</div>
			</div>
			</li>
<%
	}
%>			 
			
		</ul>
		
		<!-- <button class="more">
		<span class="more2">1개의 소식 더보기</span>
		<svg style="margin-left: 4px; fill: rgb(193, 193, 193);" xmlns="http://www.w3.org/2000/svg" width="8" height="4" viewBox="0 0 8 4"><path d="M0 0l4 4 4-4z" fill="#888888" fill-rule="evenodd"></path></svg>
		</button> -->
		
		<div class="feedfooter">
			<div class="feedfooter1">
				<span>
				<span class="document" title="">
				<span class="emoji1">
				<span class="emoji2">
				<img class="comment_img" src='https://ifh.cc/g/oTMzzg.png' border='0'>
				</span>
				</span>
				<span class="document2"><%= dto.getKanban() %></span> 
				</span>
				</span>
				<a isprivate="1" class="wname" href="Controller?command=select_Workspace_Index&workspaceId=<%= dto.getW_id()%>&workspaceName=<%= dto.getWname()%>&loginId=4" workspaceId="<%= dto.getW_id()%>"><%= dto.getWname() %></a> 
			</div>
		</div>
	</div>
<%
	}
%>

	
	</div>
	</div>
	<div class="aside">
	<%@ include file="../WEB-INF/include/Aside.jsp" %>
	</div>
	
	</div>

	</main>
	
</div>	
<%@ include file="WEB-INF/include/include_NewWorkspaceModal.jspf"%>
<%@ include file="WEB-INF/include/include_ScheduleModal.jspf"%> 
	<script>
		var dm1_modal_include = document.getElementById('dm1_modal_include');
		var modal = document.getElementById('myModal');
	    var span = document.getElementsByClassName("dm1_close")[0];
	    var piclist = document.getElementById("selectpic");
	    var filelist = document.getElementById("dm1_selection");
	    
	    span.onclick = function(e){
	        dm1_modal_include.style.display = "none";
	    	modal.style.display = "none";
	        piclist.style.display = "none";
	        filelist.style.display = "none";
	    }
	    window.onclick = function(event) {
	        if (event.target == modal) {
	        	alert("수정 중인 의사결정을 저장하지 않고 나가시겠습니까?");
	        	dm1_modal_include.style.display = "none";
	        	modal.style.display = "none";
	            piclist.style.display = "none";
	            filelist.style.display = "none";
	        }
	    }
	</script>
</body>
</html>
