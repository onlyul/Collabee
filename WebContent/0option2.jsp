<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yr.dto.*" %>
<%@ page import="com.yr.dao.*" %>
<%
	/* int member_id = (Integer)(session.getAttribute("member_id")); */
	//int member_id = 4;
	//int corporation_id = 5;
	//int corporation_id = (Integer)session.getAttribute("corporation_id");
	ArrayList<Option2CheckedDto> list1 = (ArrayList<Option2CheckedDto>)request.getAttribute("list1");
	int corporation_id = 5;
	int checked = 0;
	if(list1.get(0).getAll_day().equals("checked")){
		checked = 1;
	}
	int loginId = 4;
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
  	<link href="css/0option2.css" rel="stylesheet" type="text/css">
	<script>
	$(function(){
		$(document).ready(function(){
			$(".home_option_ul").css("padding-left", "57px");
		});
		
		if( <%= checked%>==1 && <%= list1.get(0).getStart_time()%> == 17){
			$("select[name=alarmStart]").val('<%= list1.get(0).getStart_time() %>').prop("selected",true);
			$("select[name=alarmStart]").attr("disabled",true);
		}else{
			$("select[name=alarmStart]").val('<%= list1.get(0).getStart_time() %>').prop("selected",true);	
			$("select[name=alarmStart]").removeAttr("disabled");
		}
		if( <%= checked%>==1 && <%= list1.get(0).getEnd_time()%> == 39){
			$("select[name=alarmEnd]").val('<%= list1.get(0).getEnd_time() %>').prop("selected",true);
			$("select[name=alarmEnd]").attr("disabled",true);
		}else{
			$("select[name=alarmEnd]").val('<%= list1.get(0).getEnd_time() %>').prop("selected",true);	
			$("select[name=alarmEnd]").removeAttr("disabled");
		}
		
		$("#ready1, #ready2").click(function(){
			alert("서비스가 준비 중입니다.");
		});
		
		$("#allDayOn").click(function(){
			if($("#allDayOn").is(":checked")==true){
				$("select[name=alarmStart]").val('17').prop("selected",true);
				$("select[name=alarmEnd]").val('39').prop("selected",true);
				$("select[name=alarmStart]").attr("disabled",true);
				$("select[name=alarmEnd]").attr("disabled",true);
				$.ajax({
					type: 'get',
					url: 'Controller?command=IcandothisAllday',
					data: {"member_id" : 4},
					datatype: "json",
					success: function(d){
						//alert("success");
					},
					error: function(r,s,e){
						alert("error");
					}
				});
			} else{ //if($('.allDayOn').is(":checked")==false)
				$("select[name=alarmStart]").removeAttr("disabled");
				$("select[name=alarmEnd]").removeAttr("disabled");
			}
		});
		
		$("#start").change(function(){
			var value = $(this).val();
			$.ajax({
				type: 'get',
				url: 'Controller?command=StartAlarm',
				data: {"start_time" : value, "member_id" : 4},
				datatyp: "json",
				success: function(d){
					//alert("success");
				},
				error: function(r,s,e){
					alert("error");
				}
			});
		});
		
		$("#end").change(function(){
			var value = $(this).val();
			$.ajax({
				type: 'get',
				url: 'Controller?command=EndAlarm',
				data: {"end_time" : value, "member_id" : 4},
				datatyp: "json",
				success: function(d){
					//alert("success");
				},
				error: function(r,s,e){
					alert("error");
				}
			});
		});
		$("input[type='checkbox']").click(function(){
			var str = $(this).attr('name');
			if(str != "allDayOn"){
				var mon = 0;
				var tue = 0;
				var wed = 0;
				var thu = 0;
				var fri = 0;
				var sat = 0;
				var sun = 0;
				if($("#Mon").is(":checked")){
					mon = 1;
				}
				if($("#Tue").is(":checked")){
					tue = 1;
				}
				if($("#Wed").is(":checked")){
					wed = 1;
				}
				if($("#Thu").is(":checked")){
					thu = 1;
				}
				if($("#Fri").is(":checked")){
					fri = 1;
				}
				if($("#Sat").is(":checked")){
					sat = 1;
				}
				if($("#Sun").is(":checked")){
					sun = 1;
				}
				$.ajax({
					type: 'get',
					url: 'Controller?command=Option2Alarm',
					data: {"mon" : mon, "tue" : tue, "wed" : wed, "thu" : thu, "fri" : fri, "sat" : sat, "sun" : sun, "member_id" : 4},
					datatype: "json",
					success: function(d){
						//alert("success");
					},
					error: function(r,s,e){
						alert("error");
					}
				});
			}
			
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
<body style="overflow-y: hidden; overflow-x: hidden; margin: 0;">
<%@ include file="WEB-INF/include/include_PartnerModal.jspf" %>
<%@ include file="WEB-INF/include/include_NewWorkspaceModal.jspf"%>
<div class="update_layout">
<%@ include file="HomeSidebar2.jspf" %>	
	
	
	<main>
	<header>
		<div class="top">
		<div class="title">
			<div>
			<h1>설정</h1>
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
    		
    	<div class="topright">
    	<%@ include file="homehead12.jspf" %>
    	</div>
    	</div>
    	
    	<div class="header_mid">
    		<nav class="sort">
    			<a class="m" href="Controller?command=option1">내 정보</a>
    			<a class="m selected" href="">알림</a>
    			<a class="m" href="Controller?command=option4">파트너 관리</a>
    			<a class="m" id="ready1">외부 서비스</a>
    			<a class="m" href="Controller?command=settingPrice&loginId=<%=loginId%>">가격 및 결제</a>
    			<a class="m" href="Controller?command=option3">업데이트</a>
    			<a class="m" id="ready2">Webhook &#946;</a>
    		</nav>
    	</div>
	</header>

	<div class="content">
		<div class="content_header">
			<h2>알림 시간 설정</h2>
			<p class="p1">회사의 근무일과 근무시간에 맞춰서 콜라비 알림을 설정하세요. 설정한 시간이 지나면 알림을 받지 않게 됩니다.<br/>
			알림을 받지 않더라도 '새로운 소식'에서 동 소식을 확인할 수 있습니다.</p>
		</div>
	
	<div style="padding-bottom: 40px; border-bottom: 1px solid rgb(225, 225, 225);">
	<div style="margin-top: 28px;">
		<span class="setting_item_subtitle">선택한 요일에 알림받기</span>
		<div class="list_item">
		<label for="Mon" class="checkbox_label">
		<input type="checkbox" id="Mon" name="mon" class="checkbox_input" <%= list1.get(0).getMon() %>/>
		<span class="week">월</span>
		</label>	
		
		<label for="Tue" class="checkbox_label">
		<input type="checkbox" id="Tue" name="tue" class="checkbox_input" <%= list1.get(0).getTue() %>/>
		<span class="week">화</span>
		</label>
		
		<label for="Wed" class="checkbox_label">
		<input type="checkbox" id="Wed" name="wed" class="checkbox_input" <%= list1.get(0).getWed() %>/>
		<span class="week">수</span>
		</label>
		
		<label for="Thu" class="checkbox_label">
		<input type="checkbox" id="Thu" name="thu" class="checkbox_input" <%= list1.get(0).getThu() %>/>
		<span class="week">목</span>
		</label>
		
		<label for="Fri" class="checkbox_label">
		<input type="checkbox" id="Fri" name="fri" class="checkbox_input" <%= list1.get(0).getFri() %>/>
		<span class="week">금</span>
		</label>
		
		<label for="Sat" class="checkbox_label">
		<input type="checkbox" id="sat" name="sat" class="checkbox_input" <%= list1.get(0).getSat() %>/>
		<span class="week">토</span>
		</label>
		
		<label for="Sun" class="checkbox_label">
		<input type="checkbox" id="Sun" name="sun" class="checkbox_input" <%= list1.get(0).getSun() %>"/>
		<span class="week">일</span>
		</label>
		</div>
	</div>

	<div style="margin-top:28px;">
		<span class="setting_item_subtitle">선택한 시간대에 알림 받기</span>
		<div class="list_item">
			<select id="start" name="alarmStart" disabled>
			<option value="17" selected hidden>08:00</option>
				<option value="1">00:00</option>
				<option value="2">00:30</option>
				<option value="3">01:00</option>
				<option value="4">01:30</option>
				<option value="5">02:00</option>
				<option value="6">02:30</option>
				<option value="7">03:00</option>
				<option value="8">03:30</option>
				<option value="9">04:00</option>
				<option value="10">04:30</option>
				<option value="11">05:00</option>
				<option value="12">05:30</option>
				<option value="13">06:00</option>
				<option value="14">06:30</option>
				<option value="15">07:00</option>
				<option value="16">07:30</option>
				<option value="17">08:00</option>
				<option value="18">08:30</option>
				<option value="19">09:00</option>
				<option value="20">09:30</option>
				<option value="21">10:00</option>
				<option value="22">10:30</option>
				<option value="23">11:00</option>
				<option value="24">11:30</option>
				<option value="25">12:00</option>
				<option value="26">12:30</option>
				<option value="27">13:00</option>
				<option value="28">13:30</option>
				<option value="29">14:00</option>
				<option value="30">14:30</option>
				<option value="31">15:00</option>
				<option value="32">15:30</option>
				<option value="33">16:00</option>
				<option value="34">16:30</option>
				<option value="35">17:00</option>
				<option value="36">17:30</option>
				<option value="37">18:00</option>
				<option value="38">18:30</option>
				<option value="39">19:00</option>
				<option value="40">19:30</option>
				<option value="41">20:00</option>
				<option value="42">20:30</option>
				<option value="43">21:00</option>
				<option value="44">21:30</option>
				<option value="45">22:00</option>
				<option value="46">22:30</option>
				<option value="47">23:00</option>
				<option value="48">23:30</option>
				<option value="49">24:00</option>
			</select>
			<span class="tilt">~</span>
			<select id="end" name="alarmEnd" disabled>
			<option value="39" selected hidden>19:00</option>
				<option value="1">00:00</option>
				<option value="2">00:30</option>
				<option value="3">01:00</option>
				<option value="4">01:30</option>
				<option value="5">02:00</option>
				<option value="6">02:30</option>
				<option value="7">03:00</option>
				<option value="8">03:30</option>
				<option value="9">04:00</option>
				<option value="10">04:30</option>
				<option value="11">05:00</option>
				<option value="12">05:30</option>
				<option value="13">06:00</option>
				<option value="14">06:30</option>
				<option value="15">07:00</option>
				<option value="16">07:30</option>
				<option value="17">08:00</option>
				<option value="18">08:30</option>
				<option value="19">09:00</option>
				<option value="20">09:30</option>
				<option value="21">10:00</option>
				<option value="22">10:30</option>
				<option value="23">11:00</option>
				<option value="24">11:30</option>
				<option value="25">12:00</option>
				<option value="26">12:30</option>
				<option value="27">13:00</option>
				<option value="28">13:30</option>
				<option value="29">14:00</option>
				<option value="30">14:30</option>
				<option value="31">15:00</option>
				<option value="32">15:30</option>
				<option value="33">16:00</option>
				<option value="34">16:30</option>
				<option value="35">17:00</option>
				<option value="36">17:30</option>
				<option value="37">18:00</option>
				<option value="38">18:30</option>
				<option value="39">19:00</option>
				<option value="40">19:30</option>
				<option value="41">20:00</option>
				<option value="42">20:30</option>
				<option value="43">21:00</option>
				<option value="44">21:30</option>
				<option value="45">22:00</option>
				<option value="46">22:30</option>
				<option value="47">23:00</option>
				<option value="48">23:30</option>
				<option value="49">24:00</option>
			</select>
		</div>
		<div class="list_item">
		<label for="allDayOn" class="checkbox_label">
		<input type="checkbox" id="allDayOn" name="allDayOn" class="checkbox_input" <%= list1.get(0).getAll_day() %>/>
		<span class="week">하루 종일 알림 받기</span>
		</label>
		</div>
	</div>
	</div>
	
	<div class="mailAlarm_header">
		<h2>메일 알림 설정</h2>
		<div class="mailAlarm_body">
		<p class="p1">모든 활동 소식을 메일로 받아보세요. 뉴스피드를 기준으로 소식을 알려드립니다.<br/>
		단, 메일 인증이 완료된 계정으로만 메일이 발송됩니다.</p>
		<div>
			<div style="float: right; padding-left: 10px; padding-right: 10px;">
			<input type="checkbox" id="toggle" hidden checked>
			<label for="toggle" class="toggleSwitch">
	  		<span class="toggleButton"></span>
			</label>
			</div>
		</div>
		</div>
		
	</div>
	
	<div class="wAlarm_header">
		<h2>협업공간 알림 설정</h2>
		<p class="p1">내가 가입한 협업공간의 알림을 꺼보세요. 협업공간 내 모든 활동의 알림을 받지 않게 됩니다.<br/>
		나를 언급한 멘션, 할 일, 의사결정의 활동알림은 받게 됩니다.</p>
		<ul class="option_w_list">
			<li class="list_li">
				<div class="list_li1">
				<svg class="svg1" viewBox="0 0 24 24" width="23px" height="23px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
				<span>프로젝트</span>
				</div>
				<div>
					<div style="float: right; padding-left: 10px; padding-right: 10px;">
					<input type="checkbox" class="toggle1" id="toggle_w" hidden checked>
					<label for="toggle_w" class="toggleSwitch1">
			  		<span class="toggleButton1"></span>
					</label>
					</div>
				</div>
			</li>
		
		</ul>
	</div>
	
	</div>
	</main>
	</div>
</body>
</html>