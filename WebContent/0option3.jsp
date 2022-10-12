<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yr.dto.*" %>
<%@ page import="com.yr.dao.*" %>
<%
	Collabee_newinfoDao infoDao = new Collabee_newinfoDao();
	ArrayList<Collabee_newinfoDto> listAll = infoDao.getAllBoardList();
	int corporation_id = 5;
	int loginId = 4;
	/*ArrayList<NoneFolderDto> listNone = (ArrayList<NoneFolderDto>)request.getAttribute("list2");*/
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>협업툴 콜라비 - 한 장으로 끝! 문서기반 협업툴, 콜라비</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  	<link href="css/0option3.css" rel="stylesheet" type="text/css">
	<script>
	$(function(){
		
		
		$("#ready1, #ready2").click(function(){
			alert("서비스가 준비 중입니다.");
		});
		
		$('.updatebox').mouseenter(function() {
            $(this).find('.updatespan1').css("color","rgb(83, 83, 83)");
		});
        $('.updatebox').mouseleave(function() {
        	$(this).find('.updatespan1').css("color","rgb(136, 136, 136)");
        });
        $('.updatebox').click(function() {
        	var order = $(this).attr("title");
        	$.ajax({
        		type: 'get',
        		url: 'Controller?command=Board',
        		data: { "newinfo" : order},
        		datatype: "json",
        		success: function(d){
        			$('.modal_background').css("display", 'block');
        			var title = d.title;
        			var content = d.content;
        			var creation_date = d.creation_date;
        			//alert(title + ' / ' + content + ' / ' + creation_date);
        			//제이쿼리셀렉터.text(title);
        			$("#title").text(title);
        			$("#content").text(content);
        			$("#date").text(creation_date);
        		},
        		error: function(r,s,e){
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
<body style="overflow-y: hidden; overflow-x: hidden;">
<%@ include file="WEB-INF/include/include_PartnerModal.jspf" %>
<%@ include file="WEB-INF/include/include_NewWorkspaceModal.jspf"%>
<div class="update_layout">
<%@ include file="HomeSidebar2.jspf" %>		
	
	
	<main class="infoupdate_main">
		<header class="infoupdate_header">
		<div class="infoupdate_top">
		<div class="infoupdate_title">
			<div>
			<h1 class="h1">설정</h1>
			</div>
			<div>
    		<div class="mastersearchbar">
		        <div id="search_icon" class="bnt_base"><svg class="micro" viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
		        <input type ="text" id=searchbar placeholder="검색"/>
		        <button id="posting_bnt">
		            <svg viewBox="0 0 24 24" width="13px" height="13px" ><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="posting_icon" ></path></svg>
		            <span>문서 작성</span>
		        </button>
        	</div>
        	</div>
    	</div>
    		
    	<div class="infoupdate_topright">
    	<%@ include file="homehead13.jspf" %>
    		<!-- <button class="infoupdate_btn1"></button>
    		<button class="infoupdate_btn2">
    		<svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path fill="#888888" fill-rule="evenodd" d="M15 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm-9-2V7H4v3H1v2h3v3h2v-3h3v-2H6zm9 4c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg>
    		</button>
    		<button class="infoupdate_btn3">
    		<span>파트너</span>
    		<span class="infoupdate_number">4</span>
    		</button> -->
    	</div>
    	</div>
    	
    	<div class="header_mid">
    		<nav class="sort">
    			<a class="m" href="Controller?command=option1">내 정보</a>
    			<a class="m" href="Controller?command=option2">알림</a>
    			<a class="m" href="Controller?command=option4">파트너 관리</a>
    			<a class="m" id="ready1">외부 서비스</a>
    			<a class="m" href="Controller?command=settingPrice&loginId=<%=loginId%>">가격 및 결제</a>
    			<a class="m selected" href="">업데이트</a>
    			<a class="m" id="ready2">Webhook &#946;</a>
    		</nav>
    	</div>
		</header>
		
		<div class="content">
		<div class="content_header">
			<h2 class="h2">업데이트</h2>
			<p class="p1">콜라비의 업데이트 소식을 알려드립니다.</p>
		</div>
		<div class="content_body">
		<div class="divtable">
		
<%
	for(Collabee_newinfoDto dto : listAll){
%>		
			<div class="updatebox" title="<%= dto.getCollabee_newinfo_id()%>">
			<div class="updatecontent">
				<span class="nowrap"><%= dto.getTitle() %></span>
				<span class="updatespan1"> <%= dto.getContent() %></span>
			</div>
			<span class="updatespan2"><%= dto.getCreation_date() %></span>
			</div>
	
<%
	}
%>					
		</div>
		</div>
		</div>
	</main>
</div>	
	<div class="modal_background">
		<div class="update_modal">
			<div class="update_modal_body">
				<div class="update_modal_header">
					<span class="update_modal_title">업데이트</span>
					<span class="close">&times;</span>
				</div>
				<div class="update_modal_content">
					<p class="update_modal_content_title" id="title"></p>
					<span class="update_modal_date">
						<span id="date"></span>
					</span>
					<div class="modal_content_text">
						<p id="content"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var modal_background = document.getElementsByClassName("modal_background")[0];
		var close = document.getElementsByClassName("close")[0];
		
		close.onclick = function(e){
	        modal_background.style.display = "none";
	    }
		window.onclick = function(e){
			if(e.target == modal_background){
				modal_background.style.display = "none";
			}
		}
	</script>	
		  
</body>
</html>