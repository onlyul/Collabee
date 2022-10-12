<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.one.dao.*"%>
<%@ page import="com.one.dto.*" %>
<%@ page import="java.util.*" %>

<%
	int loginId = (Integer)session.getAttribute("loginId");
	int corporation_id = (Integer)session.getAttribute("corporation_id");
	int workspaceId = (Integer)request.getAttribute("workspaceId");
	ArrayList<MyPostDto2> postList = (ArrayList<MyPostDto2>)request.getAttribute("postList");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>협업툴 콜라비 - 한 장으로 끝! 문서기반 협업툴, 콜라비</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="css/MyPostCmt.css" rel="stylesheet" type="text/css">
	<script>
	$(function(){
		var workspaceId = <%=workspaceId%>;
		var loginId = <%=loginId%>;
	<%
		for(MyPostDto2 dto : postList) {
	%>		
			var add = "<a href='Controller?command=showNewDocument&documentId=<%=dto.getDocument_id()%>&workspaceId=<%=dto.getWorkspace_id()%>&workspaceName=<%=dto.getWorkspace_name()%>&loginId=<%=loginId%>' class='postbox_mp1 row'>"			
				+"<div class='icon_mp'><img src='<%=dto.getKanban_icon_p()%>' class='kb_icon'/></div>"
				+"<div class='post_info column'>"
				+"<span class='post_title'><%=dto.getTitle()%></span>"
				+"<div class='row'>"
				+"<span class = 'ws_name'><%=dto.getWorkspace_name()%></span>"
				+"<span class ='post_date'><%=dto.getDate()%></span>"
				+"</div>"
				+"</div>"
				+"</a>";
				
			$("#myPostList").append(add);
	<%
		}
	%>
			$("#mypost").css({'border-bottom':"1px solid black", 'font-weight':"bold", color:"black"});
			$("#myPostList").removeClass("none");
			$("#mycomment").css({'border-bottom':"none", 'font-weight':"normal", color:"rgb(136,136,136)"});
			$("#myPostCommentList").addClass("none");
		
		//문서작성 버튼
		$(".posting_bnt").click(function(){
			location.href="Controller?command=writedocument&loginId=<%=loginId%>&workspaceId="+workspaceId;
		});
		
		//내가 작성한 문서 보기
		$("#mypost").on("click", function(){
			$("#mypost").css({'border-bottom':"1px solid black", 'font-weight':"bold", color:"black"});
			$("#myPostList").removeClass("none");
			$("#mycomment").css({'border-bottom':"none", 'font-weight':"normal", color:"rgb(136,136,136)"});
			$("#myPostCommentList").addClass("none");
		});
		
		//내가 작성한 댓글 보기
		$("#mycomment").on("click", function(e){
			$("#mycomment").css({'border-bottom':"1px solid black", 'font-weight':"bold", color:"black"});
			$("#myPostCommentList").removeClass("none");
			$("#mypost").css({'border-bottom':"none", 'font-weight':"normal", color:"rgb(136,136,136)"});
			$("#myPostList").addClass("none");
			
			$.ajax({
				type:"post", 
				url:"Controller?command=MyCmt",
				data:{
					"loginId" : loginId
				},
				datatype:"json",
				success:function(data){//변경사항을 화면에 그려줌
					$.each(data, function(index, item) {
						var add = "<a href='Controller?command=showNewDocument&documentId="+item.documentId+"&workspaceId="+workspaceId+"&workspaceName="+workspaceName+"&loginId=<%=loginId%>' class='postbox_mp2'>"			
							+ "<div class='icon_mp'><svg viewBox='0 0 24 24' width='21px' height='21px'><path d='M5.6 4h12.8c.88 0 1.6.72 1.6 1.6V20l-3.2-3.2H5.6c-.88 0-1.6-.72-1.6-1.6V5.6C4 4.72 4.72 4 5.6 4z' color='#888888'></path></svg></div>"
							+ "<div class='post_info'><span class='post_title'>"+ item.content +"</span>"
							+ "<div><span class ='ws_name'>"+item.workspace_name+"</span><span class='post_name'>"+item.title+"</span>"
							+ "<span class ='post_date'>"+item.creation_date+"</span></div></div></a>";
						$("#myPostCommentList").append(add);
				});
				}
			});
		});
		
		//정렬
		$(".order_svg").click(function(){
			$(this).addClass("checkOrder").removeClass("uncheckOrder");
			alert($(this).attr("class"));
			var order = $(this).parent().parent().parent().find(":nth-child(1) div");
		
			order.addClass("uncheckOrder").removeClass("checkOrder");
		});
		
		//datepicker
		$("#startD, #endD").datepicker({//datepicker호출
			dateFormat:"yy.m.d" ,showOthermonths: true ,showMonthAfterYear:true
			,buttonImageOnly:true ,yearSuffix:"년", monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
			,dayNamesMin:["일", "월","화","수","목","금","토"]
			, showButtonPanel:true, currentText:"오늘", closeText:"닫기"
			,onSelect:function(dataText, inst) {
				var d = dataText;
			
				var arr=d.split(".");
				var year=arr[0]; //연도
				var month=arr[1]; //월
				var day=arr[2]; //일
			}
		});
		
		//현재날짜 가져오기
		$("#startD, #endD").datepicker("setDate", new Date()); 
		
		//finish가 start보다 전이면 start가 선택한 finish 날짜로 변함
		$('#startD').datepicker("option", "onClose", function (selectedDate) {
			$("#endD").datepicker("option", "minDate", selectedDate);
		});
		
		$("#scheT").on("click", function(){
			var start = $("#startD").val();
			var end = $("#endD").val();
			$("#schedule").removeClass("hidden");
			$("#startSche").val(start);
			$("#endSche").val(end);
		});
		
		//검색
		$(".searchbar").keypress(function(e){
    	    if(e.keyCode == 13){
    			var search = $(this).val();
    		    var member_id = loginId;
    		    location.href="Controller?command=SearchP1&search="+search+"&member_id="+loginId;
    		}
		});
		
		$('.tab1_bnt2').mouseenter(function() {
	        $("#div2").css("display","block");
		});
	    $('.tab1_bnt2').mouseleave(function() {
	        $("#div2").css("display","none");
	    });
	    
	    $(document).ready(function(){
			$("#MyWrittenDocument").addClass("chosen");
			$("#MyWrittenDocument2").addClass("bold");
		});

	});
	</script>
</head>
<body>
	<%@ include file="WEB-INF/include/include_PartnerModal.jspf" %>
<div class="row mydocument">
	<%@ include file="WEB-INF/include/HomeSidebar.jspf"%>
	<div class="alarm_expl">
		<h6>방해금지 모드</h6>
		<div class="alarm_expl2">
			<button class="alarm_btn1">1시간 동안 알림 끄기</button>
			<button class="alarm_btn1">2시간 동안 알림 끄기</button>
			<button class="alarm_btn1">4시간 동안 알림 끄기</button>
			<button class="alarm_btn1">아침까지 알림 끄기 (오전 9시)</button>
		</div>
		<div class="alarm_expl3">
			<a class="alarm_expl4" href="">알림 설정</a>
		</div>
	</div>
	
<section class="left_tab_sec1 column">	<!-- 레프트 빼고 전체-->
	<div class="tab_style1"> <!-- 고정 헤더 -->

	<div id="title_mp" class="row">
		<div id="mypost_title">내가 작성한 문서</div>

		<div class="row">
			<div class="mastersearchbar">
				<div class="search_icon" class="bnt_base"><svg class="micro" viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
				<input type ="text" class="searchbar" placeholder="검색"/>
				<button class="posting_bnt">
					<svg viewBox="0 0 24 24" width="13px" height="13px" ><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="posting_icon" ></path></svg>
					<span style="color:rgb(255,255,255)">문서 작성</span>
				</button>
			</div>
			<div class="topright1">
				<%@ include file="homehead14.jspf" %>
	    	</div>
		</div>
	</div>

	<div id ="minitab_mp" class="row">
		<!-- 미니탭-->
		<div class="row">
			<div id="mypost">
				<input type="radio" id="tab1_mp" name="tab1" checked>
				<label for="tab1_mp">내가 작성한 문서</label>
			</div>
			<div id="mycomment">
				<input type="radio" id="tab2_mp" name="tab2">
				<label for="tab2_mp">내가 작성한 댓글</label>
			</div>
		</div>	
	
		<div class="right_bnt"> 
			<button id="filter_mp" class="bnt_none"></button> 		
			<button class="tab1_bnt"><a href="Controller?command=Todo"><span>할 일</span></a></button>
			<button class="tab1_bnt"><a href="Controller?command=dm2"><span>의사결정</a></span></button>
			<button class="tab1_bnt2"><a href="Controller?command=FilesAction"><span>파일함<svg viewBox="0 0 24 24" width="12px" height="12px"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z" ></path></svg></span></a></button>
		</div>
		<div id="div2">
   			<div class="div2_1"><a href="Controller?command=FilesAction" style="text-decoration:none; color: black;"><img src="image/file.svg" style="filter: opacity(0.5); width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>파일</a></div>
   			<div class="div2_1"><a href="Controller?command=LinksAction" style="text-decoration:none; color: black;"><img src="image/link.svg" style="filter: opacity(0.5); width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>링크</a></div>
		</div>
	</div>
	</div>

	<div style="display:flex; flex-direction:row; margin-top:105px;"> <!--문서목록과 오른쪽탭-->
	
	<section id="myPostList" class="left_tab_sec2"> <!--내가 작성한 문서-->
	</section>
	<section id="myPostCommentList" class="left_tab_sec2"></section>
	<%@ include file="../WEB-INF/include/MyAside.jsp"%> 
</div>
</section>

</div>

<%@ include file="../WEB-INF/include/include_ScheduleModal.jspf" %>
<%@ include file="../WEB-INF/include/include_postedSchedule.jspf" %>
</body>
</html>