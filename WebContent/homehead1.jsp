<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ta.dto.*" %>
<%@ page import="com.ta.dao.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	//session.setAttribute("id",4);
	//int loginId = (int)(session.getAttribute("id"));
	int loginId = 4;
	/* int member_id = (Integer)(session.getAttribute("member_id")); */
	//HomeDao hDao = new HomeDao();
	//int member_id = 4;
	int corporation_id = 5;
	//int corporation_id = (Integer)session.getAttribute("corporation_id");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>homehead1</title>
	<link rel="icon" href="Images/favicon.ico" type="image/x-icon">
	<link href="css/homehead1.css" rel="stylesheet" type="text/css">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		$("#makingsample, #language").click(function(){
			alert("준비 중입니다.");
		});
		
		$('.home_btn11').click(function (){
        	var px = $(this).offset().left - 250;
        	var py = $(this).offset().top + 30;
        	if($('.home_option').css('display')=='none') {
        		$('.home_option').css('display','block');
        		$('.home_option').css('left',px+'px');
            	$('.home_option').css('top',py+'px');
        		$('.homehead_background2').css('display', 'block');
        	} else {
        		$('.home_option').css('display','none');
        		$('.homehead_background2').css('display', 'none');
        	}
       });
		
		$('.homehead_background2').click(function() {
        	$('.homehead_background2').css('display', 'none');
      		if($('.home_option').css('display')!='none'){
       			$('.home_option').css('display','none');
      		}else if($('.alarm_expl').css('display')!='none'){
      			$('.alarm_expl').css('display','none');
      		}else if($('.folder_selection0').css('display')!='none'){
      			$('.folder_selection0').css('display','none');
      		}
      	});
		
		$( document ).ready( function() {
       	   //$('.btn11').attr("title", "${name}");
       	   $('.home_btn11').attr({
       		   title : "${name}",
       		   style: "background-image: url(${picture});"
       	   });
	       	$('.home_option_btn1').attr({
	    		   title : "${name}",
	    		   style: "background-image: url(${picture});"
	    	});
       	});
       	
       	$("#logout").click(function(){
			var result2 = confirm("로그아웃을 진행하시겠습니까?");
			if(result2){
				$.ajax({
					type: 'get',
					url: 'Controller?command=Option1MemberLogout',
					success: function(d){
						location.href="homepage_main.jsp";
					},
					error: function(r,s,e){
						alert("error");
					}
				});
			}
		});
	});
	</script>
</head>

<body>
<div class="home_option">
		<div class="home_option2">
			<div class="home_option3">
				<div class="home_option_header">
					<button class="home_option_btn1" onClick="location.href='Controller?command=option1'"></button>
					<ul class="home_option_ul">
						<li>
							<button class="home_option_btn2" onClick="location.href='Controller?command=option1'">${name }</button>
						</li>
						<li class="home_option_li">${email }</li>
						<li class="home_option_li" style="color: rgb(204, 153, 0);">${corName }</li>
					</ul>
				</div>
				<div class="home_option_container">
					<a class="home_option_container2" href="Controller?command=option1">설정</a>
					<a class="home_option_container2" href="0option2.jsp">알림</a>
				 	<%
					if (corporation_id != 0){
					%>
					<a class="home_option_container2" href="0corporation1.jsp">회사 관리</a>
					<%
					}else{
					%>
					<a class="home_option_container2" href="Controller?command=option1">회사 찾기 및 만들기</a>
					<% 
					}
					%>
					<a class="home_option_container2" href="partner_management.jsp">파트너 관리</a>
				</div>
				<div class="home_option_container">
					<a class="home_option_container2" href="setting_price.jsp">가격 및 결제</a>
					<button class="home_option_btn3" id="makingsample">샘플 공간, 문서 만들기</button>
					<a class="home_option_container2" href="0help1.jsp" target="_blank">사용 가이드</a>
					<a class="home_option_container2" onclick="alert('준비 중입니다.')">데스크탑 앱 다운로드</a>
				</div>
				<div class="home_option_container">
					<button class="home_option_btn3" id="language">Language</button>
				</div>
				<div class="home_option_container">
					<button class="home_option_btn3" id="logout">로그아웃</button>
				</div>
			</div>
		</div>
	</div>
	
	
<div class="home_topright">
		<button title="" class="home_btn11"></button>
		<button title="파트너 초대" class="home_btn21">
		<svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path fill="#888888" fill-rule="evenodd" d="M15 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm-9-2V7H4v3H1v2h3v3h2v-3h3v-2H6zm9 4c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg>
		</button>
		<button class="home_btn31">
		<span>파트너</span>
		<span class="home_number">${partnerN }</span>
		</button>
 </div>
 
 <div class="homehead_background2"></div>
 
</body>
</html>