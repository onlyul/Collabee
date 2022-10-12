<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yr.dto.*" %>
<%@ page import="com.yr.dao.*" %>
<%
	/* int member_id = (Integer)(session.getAttribute("member_id")); */
	int workspaceId = (Integer)request.getAttribute("workspaceId");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>협업툴 콜라비 - 한 장으로 끝! 문서기반 협업툴, 콜라비</title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	<link href="css/0search4.css" rel="stylesheet" type="text/css">
	<script>
	$(function(){
		$("#searchbar").keyup(function(key){
            $(this).attr("value",$(this).val());
            var word = $(this).val();
            /* if(key.keyCode==13){ // 13-> 키보드 엔터키
            	alert($(this).val());
            } */
            $.ajax({
            	type: 'get',
            	url: 'Controller?command=Search4',
            	data: {"searchSchedule" : word, "login_id" : 4},
            	datatype: "json",
            	success: function(d){
            		
            		$("#table *").remove();
            		for(var i in d){
            			var date = d[i].date;
            			var title = d[i].title;
            			var color = d[i].color;
            			var name = d[i].name;
            			var schedule_id = d[i].schedule_id;
            			var count = d[i].count;
            			var str = "<div class='container1'>"
            			+ "<div class='todolist_cell1'>"
            			+ "<div>"
            			+ "<img class='calendar_p' src='https://ifh.cc/g/g9b8a7.png' border='0'>"
            			+ "</div>"
            			+ "</div>"
            			+ "<div class='todolist_cell2'>"
            			+ "<div class='cell2_line1'>"
            			+ "<div class='todo_title'>"+ date +"</div>"
            			+ "</div>"
            			+ "<div class='cell2_line2'>"
            			+ "<button class='workspace_color' style='background-color: "+ color +";'></button>"
            			+ "<a class='todo_document' href='Controller?command=showNewDocument&documentId=" + document_id +"&workspaceId=" + workspace_id + "&workspaceName=" + workspace_name + "&loginId=4' scheduleId='"+ schedule_id +"'>"+ title +"</a>"
            			+ "<span class='search4_span'>참석자 : "+ count +"명</span>"
            			+ "</div>"
            			+ "</div>"
            			+ "</div>";
            			
						$("#table").append(str);
            		}
            	},
            	error: function(r,s,e){
            		alert("error");
            	}
            });
            
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
		
		$('.btn0').click(function(){
			window.history.back();
       }); 
	});
	</script>
</head>
<body>
	<div class="layout">
		<div class="layout2">
			<div class="close">
				<button class="btn0">
				<svg viewBox="0 0 24 24" width="35px" height="35px" class="close2"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg>
				</button>
			</div>
		</div>
		<main>
			<header>
			<div class="header1">
				<h2>통합 검색</h2>
				<div class="top_right">
				<div class="mastersearchbar">
		        <div id="search_icon" class="bnt_base"><svg class="micro" viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg>
		        </div>
		        <input type ="text" id=searchbar placeholder="검색"/>
		    	</div>
		    	<button id="posting_bnt">
	            <svg viewBox="0 0 24 24" width="13px" height="13px" ><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="posting_icon" ></path></svg>
	            <span>문서 작성</span>
	        	</button>
				</div>
			</div>
			<div class="menu">
				<a active="0" class="menu2" href="Controller?command=SearchP1Nothing">문서</a>
				<a active="0" class="menu2" href="Controller?command=SearchP2">댓글</a>
				<a active="0" class="menu2" href="Controller?command=SearchP3">할일</a>
				<a active="1" class="menu1" >일정</a>
				<a active="0" class="menu2" onClick="alert('준비 중입니다.')">의사결정</a>
				<a active="0" class="menu2" onClick="alert('준비 중입니다.')">파일</a>
				<a active="0" class="menu2" onClick="alert('준비 중입니다.')">링크</a>
			</div>
			</header>
			
			<div class="main1">
				<div class="section1">
					<div class="article">
						<div class="taindex" id="table">
						
						
						
						
<!--  <div class='container1'>
<div class='todolist_cell1'>
<div>
<img class='calendar_p' src='https://ifh.cc/g/g9b8a7.png' border='0'>
</div>
</div>
<div class='todolist_cell2'>
<div class='cell2_line1'>
<div class='todo_title'>2022년 4월 14일 목요일 ~ 몇월일요일</div>
</div>
<div class='cell2_line2'>
<button class='workspace_color' style='background-color: gray;'></button>
<a class='todo_document' href='' scheduleId=''>일정</a>
<span class='search4_span'>참석자 : 4명</span>
</div>
</div>
</div>-->

							
						</div>
					</div>
				</div>
			
			
				<div class="aside">
				<%@ include file="../WEB-INF/include/Aside.jsp" %>		
					
					
				</div>
			
			</div>
		</main>
	</div>
</body>
</html>