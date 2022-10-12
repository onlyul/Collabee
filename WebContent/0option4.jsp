<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yr.dto.*" %>
<%@ page import="com.yr.dao.*" %>
<%
	Collabee_newinfoDao infoDao = new Collabee_newinfoDao();
	ArrayList<Collabee_newinfoDto> listAll = infoDao.getAllBoardList();
	/*ArrayList<NoneFolderDto> listNone = (ArrayList<NoneFolderDto>)request.getAttribute("list2");*/
	int loginId = 4;
	int corporation_id = 5;
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
  	<link href="css/0option4.css" rel="stylesheet" type="text/css">
	<script>
	$(function(){
		$("#btn1").click(function(){
			alert("준비중입니다.")
		});
		$("#btn2").click(function(){
			alert("준비중입니다.")
		});
		$(".btn").mouseenter(function(){
			$(this).css("color","gray");
		});
		$(".btn").mouseleave(function(){
			$(this).css("color","black");
		});
		$("#btn3").click(function(){
            $("#hidePartnerManagementOn").css("display","block");
            $.ajax({
            	type: 'get',
            	url: 'Controller?command=PartnerHiddenAction',
            	data: {"login_id":<%=loginId%>},
            	datatype: 'json',
            	success: function(data){
            		$.each(data, function(idex,item){
            			var hiddenPartentInformation =
            				"<div class='hidePartnerBox' loginId='"+item.member_id+"'>" +
                        		"<div><img src='image/"+item.picture+"'/></div>" +
                       			"<div class='hiddenMemberDiv'>" +
                           			"<p class='memberName'>"+item.name+"</p>" +
                            		"<p class='memberMail'>"+item.email+"</p>" +
                        		"</div>" +
                        		"<form action='PartnerBlockServlet' method='post'>" +
                        			"<input type='button' class='partnerBlockBtn' value='숨김 해제'/>" +
                        			"<input type='hidden' class='loginId' name='loginId'/>" +
                        			"<input type='hidden' class='memberId' name='memberId'/>" +
                        		"</form>" +
                    		"</div>";
                    	$("#hidePartnerList").append(hiddenPartentInformation);
            		});
            	},
            	error: function(r,s,e){
            		
            	}
            });
        });
        $(document).on("click",".partnerBlockBtn",function(){
            $(this).parent().parent().remove();
            var member_id = $(this).parent().parent().attr("loginId");
            $(this).parent().parent().find(".loginId").val(loginId);
            $(this).parent().parent().find(".memberId").val(member_id);
            alert($(this).parent().html());
            $(this).parent().submit();
        });
		
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
			    	</div>
		    	</div>
		    	<div class="header_mid">
		    		<nav class="sort">
		    			<a class="m" href="Controller?command=option1">내 정보</a>
		    			<a class="m" href="Controller?command=option2">알림</a>
		    			<a class="m selected" href="">파트너 관리</a>
		    			<a class="m" id="ready1">외부 서비스</a>
		    			<a class="m" href="Controller?command=settingPrice&loginId=<%=loginId%>">가격 및 결제</a>
		    			<a class="m" href="Controller?command=option3">업데이트</a>
		    			<a class="m" id="ready2">Webhook &#946;</a>
		    		</nav>
		    	</div>
		    	<div id="partnerManagementCategory"> 
			        <button class="btn" id="btn1">협업공간 일괄 초대</button>
			        <button class="btn" id="btn2">멤버 일괄 탈퇴</button>
			        <button class="btn" id="btn3"> 숨긴 파트너 관리</button>
		    	</div>
			</header>
			<div id="hidePartnerManagementOn">
        		<div id="hidePartnerManagement">
		            <h3>숨긴 파트너 관리</h3>
		            <p>파트너를 '숨김 해제' 하면, 프라이빗 공간 내 문서에서 해당 파트너를 공유자로 추가할 수 있습니다.</p>
		        </div>
		        <div id="hidePartnerList">
		            <!-- <div class="hidePartnerBox">
		                <div><img src="image/bell.svg"/></div>
		                <div class="hiddenMemberDiv">
		                    <p class="memberName">강지현</p>
		                    <p class="memberMail">twekyaak@gmail.com</p>
		                </div>
		                <form action="PartnerBlockServlet" method="post">
			                <button class="partnerBlockBtn">숨김 해제</button>
		                </form
		            </div> -->
		        </div>
		    </div>
		</main>
	</div>	
</body>
</html>