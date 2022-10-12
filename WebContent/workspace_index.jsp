<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.one.dto.*" %>
<%@ page import="com.one.dao.*" %>
<%@ page import="com.one.mvc.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import = "com.jm.dto.*" %>
	
<!--
	1. 작성자 : 강지현(다른 팀원 코드는 주석에 표기)
	2. 파일의 역할 : 협업공간 메인(index) 페이지
 -->

<%

	MyWorkspaceListDto wDto = (MyWorkspaceListDto)request.getAttribute("workspaceIndex");
	int corporation_id = (Integer)session.getAttribute("corporation_id");
	int loginId =(Integer)session.getAttribute("loginId");
	int workspaceId = wDto.getWorkspace_id();
	String workspaceName = wDto.getWorkspace_name();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
	<link href="css/workspace_index.css" rel="stylesheet" type="text/css">
    <title><%=wDto.getWorkspace_name()%></title>
	
	<script>
	var g_d;
	
	function getPostList(){
		$("#post_sec").empty().removeClass("none");
		$("#kanban_sec").addClass("none");
    	//메인 문서 리스트 출력
    	$.ajax({
			type:"post", 
			url:"Controller?command=workspacePostList",
			data:{
				"workspaceId" : workspaceId
			},
			datatype:"json",
			success:function(data){
				if(data.length==0){ //데이터 없을때
					$("#container4_wi .nonPost").css("display","flex");	
				} else {
					
					$("#container4_wi .nonPost").css("display","none");
					$.each(data, function(index, item) { 
	         			var box = "<a href='Controller?command=showNewDocument&documentId="+item.document_id+"&workspaceId="+workspaceId+"&loginId="+loginId+"'>"
	         			+ "<div class='post_wi'>"
	         			+ "<div class='post_writer_wi'>"+item.name+"</div>" //칸반 아이콘!
	                    + "<div class='post_title_wi'><span class='back_img_wi'><span class='emoji2_wi'><span class='emoji1_wi' style='background-position: 55.3571% 60.7143%;'></span></span></span>"+item.title+"</div>"
	                    + "<div class='post_date_wi'>"+item.edit_date+"</div>"
	                	+ "</div></a>";
	                	
		                $("#post_sec").append(box); 
					});
				}
			},
			error:function(r,s,e) {
				alert("error!");	
			}
   	 	});  //post ajax
	}
	
    $(function(){
		var loginId = <%=loginId%>;
		var workspaceName = "<%=wDto.getWorkspace_name()%>";
		var workspaceId = <%=wDto.getWorkspace_id()%>;
		$("#title_wi").text(workspaceName);
		
		//사이드바 현재 위치
		$(".folder1").find(".f_container").css("background-color", "transparent");;
		$(".folder1").find(".name").css({color : "black", "font-weight":"normal"});
		
		$(".folder1 > .f_container").each(function (index, item){
			if($(item).find(".name").text()==workspaceName){
				$(item).css("background-color", "rgba(51, 132, 108, 0.1)");
				$(item).find(".name").css({color : "rgb(51, 132, 108)", "font-weight":"bold"});
			}
		});
		
		//문서 로딩되면
		//협업공간 id, 설명, 완료여부
		if(workspaceName=="프라이빗 공간") {
			$("#space_main_wi > header").css("background-color","rgb(94, 85, 65)");
            $("#bnt1_wi").addClass("hidden");//알림, 설정 없어지기
            $("#summary_wi").val("나만을 위한 공간에서 아이디어를 마음껏 펼쳐 보세요. 특정 파트너에게 나의 문서를 공유할 수도 있습니다.");//readonly
            $("#container1_wi").addClass("hidden");
            $("#container1_pi").removeClass("hidden");
            $("#document_bnt_wi").css("background-color", "rgb(217, 173, 43)");
		
		} else if(workspaceName=="모두의 공간"){//모두의 공간
			$("#summary_wi").val("<%=wDto.getSummary()%>");
			$("#space_main_wi > header").css("background-color","rgb(44, 87, 129)");
			$("#container1_wi").removeClass("hidden");
			$("#container1_pi").addClass("hidden");
			$("#document_bnt_wi").css("background-color", "rgb(51, 132, 108)");
			$("#bnt1_wi").removeClass("hidden");
		
		} else { //일반 협업공간
			$("#summary_wi").val("<%=wDto.getSummary()%>");
			$("#space_main_wi > header").css("background-color","rgb(42, 88, 74)");
            $("#container1_wi").removeClass("hidden");
            $("#container1_pi").addClass("hidden");
            $("#document_bnt_wi").css("background-color", "rgb(51, 132, 108)");
			$("#bnt1_wi").removeClass("hidden");
            
			//대외비 여부에 따라 설정
			if(<%=wDto.getConfidential()%>==1){
				$("#confidential").css("transform","translateX(100%)");
	            $("#confidential").siblings(".off_sel").css("color","rgb(255, 255, 255)");
	            $("#confidential").siblings(".on_sel").css("color","rgb(193, 193, 193)");
	        } else {
	            $("#confidential").css("transform","translateX(0px)");
	            $("#confidential").siblings(".on_sel").css("color","rgb(255, 255, 255)");
	            $("#confidential").siblings(".off_sel").css("color","rgb(193, 193, 193)");
	        } 
	        
			//완료공간 여부에 따라 설정
            if(<%=wDto.getComplete()%>==1) {
               	$("#complete").css("transform","translateX(100%)");
               	$("#complete").siblings(".off_sel").css("color","rgb(255, 255, 255)");
               	$("#complete").siblings(".on_sel").css("color","rgb(193, 193, 193)");
               	$("#alarm_wi").addClass("uncheck_alarm").removeClass("check_alarm");
               	$("#space_main_wi > header").css("background-color","rgb(83, 83, 83)");
            } else{
               	$("#complete").css("transform","translateX(0px)");
               	$("#complete").siblings(".on_sel").css("color","rgb(255, 255, 255)");
               	$("#complete").siblings(".off_sel").css("color","rgb(193, 193, 193)");
               	$("#alarm_wi").addClass("check_alarm").removeClass("uncheck_alarm");
               	$("#space_main_wi > header").css("background-color","rgb(42, 88, 74)");
	        } 
	        
            //모달에 정보 삽입
	 		$("#invite_link_mws").val("<%=request.getRequestURL()%>");
            $("#setname_mws").val("<%=wDto.getWorkspace_name()%>");
            $("#setsummary_mws").val("<%=wDto.getSummary()%>");
		 	
	 		//매니저 여부에 따라 협업공간 설정 숨기기
            if(<%=request.getAttribute("manager")%> == 1){
            	$("#setting_wi").removeClass("hidden");
            } else {
           		$("#setting_wi").addClass("hidden")
            }
	 		
	 		//알람 여부에 따라 표시
	 		if(<%=wDto.getWorkspace_alarm()%>==1){
	 			$("#alarm_wi").addClass("check_alarm").removeClass("uncheck_alarm");
	 		} else {
	 			$("#alarm_wi").addClass("uncheck_alarm").removeClass("check_alarm");
	 		}
             
		}//else 
		
   	 	//알람창 아이콘
        var x = "<svg viewBox='0 0 24 24' width='24px' height='24px' class='closed'><path fill='rgb(255,255,255)' d='M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z'></path></svg>";
        
        //협업공간 알림
        $("#alarm_wi").click(function(){
            //아이콘 바꾸기
            var text = $(this).attr("class");
            
            if(text=="icon2_color check_alarm"){
               	//알람 update
				$.ajax({
					type:"get", 
					url:"Controller?command=workspace_Alarm",
					data:{
						"loginId":loginId,
						"onAlarm":0,//꺼진 알람
						"workspace_id":workspaceId
					},
					datatype:"json",
					success: function(data) {
						if(data==1) {
			                //안내메세지 뜨기
			                var alert_message = $(".alert").html(x+workspaceName+" 협업공간의 알림이 꺼졌습니다. 할 일/의사결정 등은 알려드립니다.");
		                    alert_message.fadeIn(function(){
		                        setTimeout(function() {
		                            alert_message.fadeOut() //3초후에 자동으로 닫힘
		                        }, 2000);
		                        //안내메세지 높이
		                        var height = alert_message.prop("scrollHeight");
		                        alert_message.css("height", height);
		                    });
						}
					},
					error: function(r,s,e) {
						alert("error");
					}
				});					                	
            } else{
            	$.ajax({
					type:"post", 
					url:"Controller?command=workspace_Alarm",
					data:{
						"loginId":loginId,
						"onAlarm":1,//켜진 알람
						"workspace_id":workspaceId
					},
					datatype:"json",
					success:function(data){
						if(data==1){
		                	//안내메세지 뜨기
			                var alert_message = $(".alert").html(x+workspaceName+" 협업공간의 알림이 켜졌습니다. 이제부터 모든 알림을 받을 수 있습니다.");
		                    alert_message.fadeIn(function(){
		                        setTimeout(function() {
		                            alert_message.fadeOut(); //3초후에 자동으로 닫힘
		                        }, 2000);
		                        //안내메세지 높이
		                        var height = alert_message.prop("scrollHeight");
		                        alert_message.css("height", height);
		                    });
						}
					}
				});
            }//else
            $(this).toggleClass("check_alarm, uncheck_alarm");
        }); //done.
        
        //협업공간 타이틀 클릭
        $("#title_wi").click(function(){
            location.href="Controller?command=select_Workspace_Index&workspaceId="+workspaceId+"&loginId="+loginId;;
        });
        
        //협업공간 문서 클릭
        $("#container1_wi button:nth-child(1)").click(function(){
        	getPostList();
        });
        
        //칸반 버튼 클릭
        $("#container1_wi button:nth-child(2)").click(function(){
            $("#post_sec").addClass("none");
            $("#kanban_sec").removeClass("none");
        }); 
        
        //간트차트 클릭
        $("#container1_wi button:nth-child(3)").click(function(){
        	alert("준비중입니다.");
        }); 
        
        //캘린더 클릭
        $("#container1_wi button:nth-child(4)").click(function(){
        	alert("준비중입니다.");
        }); 
        
        //내가 작성한 문서만 보기 클릭
		$(document).on("click", "#mypost", function(){
			$("#kanban_sec").addClass("none");
			$("#post_sec").empty().removeClass("none");
			
			$.ajax({
				type:"post",
				url:"Controller?command=myWorkspacePost",
				data:{
					"loginId":loginId,
					"workspaceId":workspaceId
				},
				datatype:"json",
				success:function(data){
					g_d=data;
					$.each(data, function(index, item) {
						var add = "<a href='Controller?command=showNewDocument&documentId="+item.document_id+"&workspaceId=<%=workspaceId%>&workspaceName="+item.workspace_name+"&loginId=<%=loginId%>' class='postbox_mp1 row'>"			
							+"<div class='icon_mp' style='padding-top: 7px;'><img src='"+item.kanban_icon_p+"' class='kb_icon'></div>"
							+"<div class='post_info column'>"
							+"<span class='post_title'>"+item.title+"</span>"
							+"<div class='row'>"
							+"<span class = 'ws_name'>"+item.workspace_name+"</span>"
							+"<span class ='post_date'>"+item.date+"</span>"
							+"</div>"
							+"</div>"
							+"</a>";
							
						$("#post_sec").append(add);
					});
				}
			});
		});
        
        //중앙탭 클릭하면 현재 어디인지 표시
        $("#container1_wi button, #container1_pi button").click(function(){
            $(this).addClass("click_tab");
            $(this).siblings().removeClass("click_tab");//본문도 바뀜
        });
        
        //해시태그 클릭
        $("#container3_wi button:nth-child(1)").click(function(){
            alert("서비스 준비중입니다.");
        });

        //필터 열고 닫기
        $("#container3_wi button:nth-child(2)").click(function(){
            $("#click_filter").toggle();
        }); 
		
        //전체선택
        $(".scroll_bar2 > div").click(function() {
	        if($("#checkAll").is(":checked")) {
	        	$("input[name=chkbox]").prop("checked", true);
	        } else {
	        	$("input[name=chkbox]").prop("checked", false);
	        }
        });
        
        $(".scroll_bar2 > div").click(function(){
        	var box = $("input[name=chkbox]").length;
        	var chkOn = $("input[name=chkbox]:checked").length;
  
        	if(box == chkOn) {
        		$("#checkAll").prop("checked", true);
        	} else {
        		$("#checkAll").prop("checked", false);
        	}
        });
        
        // 할일 클릭 모달
		$("#bnt2_1").on("click", function(){
			$("#todo_modal_include").css('display', 'block');
        }); 
		$(".new_todo_btn_x").click(function() {
			$("#todo_modal_include").css('display', 'none');
		});
        
        //일정버튼 클릭 모달
        $("#bnt2_2").on("click", function(){
        	$("#schedule").removeClass("hidden");
        });
        
        //문서작성버튼    
		$(document).on("click", "#document_bnt_wi", function(){ 
			location.href="Controller?command=writedocument&workspaceId="+workspaceId+"&loginId="+loginId;
		});
		
		/* 김유라 */
		//의사결정모달 띄우기
        $(document).on("click","#bnt2_4", function(){    
    		$("#dm1_modal_include").css('display', 'block');
    	    $("#myModal").css('display', 'block');
		});
      	
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
	    
	    //검색
		$(".searchbar").keypress(function(e){
    	    if(e.keyCode == 13){
    			var search = $(this).val();
    		    location.href="Controller?command=SearchP1&search="+search+"&member_id="+loginId;
    		}
		});
	    
		/* 강태안 */
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

<body onload="getPostList()">
	<%@ include file="WEB-INF/include/include_PartnerModal.jspf" %>

	<%@ include file="WEB-INF/include/include_NewWorkspaceModal.jspf"%>
	
	<%@ include file="WEB-INF/include/include_SettingWorkspace.jspf"%>
	
	<%@ include file="WEB-INF/include/include_InviteMembers.jspf"%>
	
    <div class="alert"></div>
	<div id="todo_modal_include" style="display: none"> 
		<%@ include file="../WEB-INF/include/Todo_modal.jspf"%>
	</div>
	<div id="dm1_modal_include" style="display: none"> 
		<%@ include file="0dm11.jspf" %>
	</div>
    
	<div id="workspace_index">
		<%@ include file="WEB-INF/include/include_ScheduleModal.jspf"%>
	<div>
		<%@ include file="WEB-INF/include/HomeSidebar.jspf"%>
	</div>
    <!-- 메인페이지 -->
    <section id="space_main_wi"> 
        <header>
			<div id="head1_wi" style="white-space:nowrap;">
                <div id="bnt3_wi" class="row">
                    <div class="row">
                        <div id="title_wi" style="color:#fff"><%=wDto.getWorkspace_name()%></div>
                        <div id="bnt1_wi">
                            <button type="button" id="alarm_wi" class="icon2_color check_alarm"></button>
                            <button type="button" class="icon2_color"><svg id="setting_wi" viewBox="0 0 24 24" width="20px" height="20px"><path d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg></button>
                        </div>
                       </div> 
                    <div>
                        <div class="search_icon" class="bnt_base"><svg class="micro" style="margin-top:6px;" viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
                        <input type ="text" class="searchbar" placeholder="검색"/>
                    </div>
                </div>
                <div id="textarea_wi"><textarea id="summary_wi" placeholder="협업공간에 대한 간단한 설명을 입력하세요."></textarea></div>
                <div id="bnt2_wi">
                    <button type="button" id="bnt2_1"><svg viewBox="0 0 24 24" width="18px" height="18px" class="icon2_color"><path d="M12 1.5C6.204 1.5 1.5 6.204 1.5 12S6.204 22.5 12 22.5 22.5 17.796 22.5 12 17.796 1.5 12 1.5zM9.9 17.25L4.65 12l1.48-1.48 3.77 3.758 7.97-7.969L19.35 7.8 9.9 17.25z"></path></svg><span>할 일</span></button>
                    <button type="button" id="bnt2_2"><svg viewBox="0 0 24 24" width="18px" height="18px" class="icon2_color"><path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19a2 2 0 0 0 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path></svg><span>일정</span></button>
                    <button type="button" id="bnt2_3"><svg viewBox="0 0 24 24" width="18px" height="18px" class="icon2_color"><path d="M16.5 6v11.5c0 2.21-1.79 4-4 4s-4-1.79-4-4V5a2.5 2.5 0 0 1 5 0v10.5c0 .55-.45 1-1 1s-1-.45-1-1V6H10v9.5a2.5 2.5 0 0 0 5 0V5c0-2.21-1.79-4-4-4S7 2.79 7 5v12.5c0 3.04 2.46 5.5 5.5 5.5s5.5-2.46 5.5-5.5V6h-1.5z"></path></svg><span>파일</span></button>
                    <button type="button" id="bnt2_4"><svg viewBox="0 0 24 24" width="18px" height="18px" class="icon2_color"><path d="M2.833 4h13.75c.633 0 1.128.32 1.458.807L23 12.25l-4.96 7.434c-.33.486-.888.816-1.52.816H2.832A1.839 1.839 0 0 1 1 18.667V5.833C1 4.825 1.825 4 2.833 4zm11.917 9.625c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375zm-4.583 0c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375s-1.375.614-1.375 1.375c0 .76.614 1.375 1.375 1.375zm-4.584 0c.761 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375z"></path></svg><span>의사결정</span></button>
                    <button type="button" id="document_bnt_wi"><svg viewBox="0 0 24 24" width="18px" height="18px" class="icon2_color"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"></path></svg><span>문서 작성</span></button>
                </div>
			</div>
          
        <div class="topright1" style="display:flex; flex-direction:column;">
			<%@ include file="WEB-INF/include/homehead4.jspf" %>
	   		<div class="subheader_right3">
				<div class="subheader_right3_menu"></div>
			</div>
   	    </div>
        </header>

        <div id="tab_wi">
            <div id="container1_wi"> <!-- 협업공간탭 -->
                <button type="button" class="click_tab"><span>협업공간 문서</span></button>
                <button type="button"><span>칸반</span><svg width="24px" height="24px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path d="M0 0h14v14H0z"></path><path fill="#888888" d="M6.417 9.917h1.166v-3.5H6.417v3.5zM7 1.167C3.78 1.167 1.167 3.78 1.167 7S3.78 12.833 7 12.833 12.833 10.22 12.833 7 10.22 1.167 7 1.167zm0 10.5A4.674 4.674 0 012.333 7 4.674 4.674 0 017 2.333 4.674 4.674 0 0111.667 7 4.674 4.674 0 017 11.667zM6.417 5.25h1.166V4.083H6.417V5.25z"></path></g></svg></button>
                <button type="button"><span>간트차트</span></button>
                <button type="button"><span>캘린더</span></button>
                <button type="button" id="mypost"><span>내가 작성한 문서</span></button>
            </div>
            
            <div id="container1_pi" class="hidden"> <!-- 프라이빗탭 -->
                <button type="button" class="click_tab"><span>프라이빗 문서</span></button>
                <button type="button" onclick="alert('준비중 입니다.')"><span>캘린더</span></button>
            </div>
            
            <div id="container3_wi">
                <button type="button"><svg viewBox="0 0 24 24" width="19px" height="19px" class="container3_bnt1_wi icon1_color"><path d="M13.056 16h-3L9.5 21h-2l.556-5H5.5v-2h2.778l.444-4H6.5V8h2.444L9.5 3h2l-.556 5h3l.556-5h2l-.556 5H18.5v2h-2.778l-.444 4H17.5v2h-2.444l-.556 5h-2l.556-5zm.222-2l.444-4h-3l-.444 4h3z" ></path></svg></button>
                <button type="button"><svg viewBox="0 0 24 24" width="19px" height="19px" class="container3_bnt2_wi icon1_color"><path d="M3 18h6v-2H3v2zM3 6v2h18V6H3zm0 7h12v-2H3v2z"></path></svg></button>
            </div>
			
            <div id="container2_wi">
                <button onclick="locaiton.href='Controller?command=Todo'" class="tab1_bnt"><span>할 일</span></button>
                <button onclick="locaiton.href='Controller?command=dm2'" class="tab1_bnt"><span>의사결정</span></button>
                <button onclick="locaiton.href='Controller?command=FilesAction'" class="tab1_bnt2"><span>파일함<svg viewBox="0 0 24 24" width="12px" height="12px"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z" ></path></svg></span></button>
            </div>
        </div>

        <section id="space_body_wi" class="scroll_bar">
            <div id="container4_wi" class="scroll_bar">
	            <div class="nonPost column">
	            	<div>
	            		<svg width="71px" height="71px" viewBox="0 0 24 24"><path fill="#e1e1e1" fill-rule="evenodd" d="M14.4 6L14 4H5v17h2v-7h5.6l.4 2h7V6z"></path></svg>
	            	</div>
	            	<p style="text-align: center;">협업공간에서 관련된 문서를 작성해 보세요.<br/>멤버를 초대하면 커뮤니케이션 할 수 있고, 문서를 공유받을 수 있어요.</p>
	            </div>
	            <div id="post_sec" class="none"></div>
	            <div id="kanban_sec" class="none"><%@ include file="Kanban_modal.jsp" %></div>
            	
            </div>
            <div>
				<%@ include file="WEB-INF/include/Aside.jspf"%>
            </div>
            <%@ include file="WEB-INF/include/include_postedSchedule.jspf" %>
        </section>
    </section>

</div>
</body>
</html>