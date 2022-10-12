<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.one.dto.*" %>
<%@ page import="com.one.mvc.*" %>
<%
	int loginId = (Integer)session.getAttribute("loginId");
%>

<!DOCTYPE html>
<html>
<head>
<!-- 22.08.14 수정  by 강지현 -->
<!-- 발행된 게시글 보는 페이지로 문서 북마크, 알림, 담당자, 제목, 내용을 확인할 수 있음. -->
<!-- include_postedDocument.jsp가 include 되어있음 -->
<meta charset="UTF-8">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<title>문서보기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link href="css/postedDocument.css" rel="stylesheet" type="text/css">
</head>
<script>
	var loginId = <%=loginId%>; 
	var documentId = <%=request.getAttribute("documentId")%>;
	var workspaceName="<%=request.getParameter("workspaceName")%>";
	var workspaceId = <%=request.getAttribute("workspaceId")%>;
	
	$(function(){
		var x="<svg viewBox='0 0 24 24' width='24px' height='24px' class='closed'><path fill='rgb(255,255,255)' d='M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z'></path></svg>";
		//fill 색 지정
		var ws = $(".document_ws").text();
		if(ws=='프라이빗 공간') {
			fill = "rgb(217, 173, 43)";
			hover = "rgb(179, 142, 34)";
			
		} else {
			fill = "rgb(51, 132, 108)";
			hover = "background-color: rgb(42, 98, 81)";
		}
		
		if("${alarm }"==1) {//켜있다면
			$("#postAlarm").html("<svg viewBox='0 0 24 24' width='20px' height='20px'><path fill='"+fill+"' d='M11.65 21c.99 0 1.8-.81 1.8-1.8h-3.6c0 .99.81 1.8 1.8 1.8zm5.85-5.4v-4.95A5.848 5.848 0 0 0 13 4.962V4.35C13 3.603 12.397 3 11.65 3c-.747 0-1.35.603-1.35 1.35v.612a5.848 5.848 0 0 0-4.5 5.688v4.95L4 17.4v.9h15.3v-.9l-1.8-1.8z'></path></svg>");	
		} else {
			$("#postAlarm").html("<svg id='noAlarm' width='20px' height='20px' viewBox='0 0 24 24'><path fill='#888888' d='M13.99 19.5c0 .28-.05.54-.15.78-.26.6-.79 1.04-1.44 1.18-.087.02-.173.031-.263.036L12 21.5c-1.06 0-1.919-.82-2.003-1.851L9.99 19.5h4zM4 4.26l1.27-1.27L21 19.22l-1.27 1.27-1.916-1.99H4v-1l2-2v-5c0-1.266.275-2.444.8-3.44L4 4.26zm4.004 5.996L8 10.5v5.828l-.173.172h8.062L8.297 8.615c-.171.492-.271 1.042-.293 1.641zM12 2c.781 0 1.42.593 1.493 1.355l.007.145v.68c2.776.66 4.402 3.1 4.496 6.05l.004.27v2.577l-2-2.063V10.5c0-2.208-1.06-3.822-2.77-4.323l-.193-.051-1.036-.247-.795.189-1.565-1.614c.195-.08.399-.15.609-.21l.25-.064V3.5c0-.781.593-1.42 1.355-1.493L12 2z'></path></svg>");
		}
		if("${bookmark }"==1) {
			$("#postBookmark").html("<svg width='20px' height='20px' viewBox='0 0 24 24'><path fill='"+fill+"' fill-rule='evenodd' d='M17 3H7c-1.1 0-1.99.9-1.99 2L5 21l7-3 7 3V5c0-1.1-.9-2-2-2z'></path></svg>");	
		} else {
			$("#postBookmark").html("<svg id='noBookmark' width='20px' height='20px' viewBox='0 0 24 24'><path fill-rule='evenodd' fill='#888888' d='M17 3c1.05 0 1.918.866 1.994 1.954l.006.157V22l-7-3.167L5 22l.01-16.889c0-1.108.81-2.024 1.841-2.105L7 3h10zm0 2H7c.014 0 .018.004.018.015l-.008.097L7.001 18.9 12 16.639l5 2.261V5.111c0-.06-.017-.092-.012-.105L17 5z'></path></svg>");
		}
		
		
		$(".postBnt2 span").click(function() {
			var title = $(this).attr("id");
			var state = $(this).children().attr("id");
			
			if(title=="postAlarm"){
				if(state=="noAlarm"){//알람 킨거면
					$(this).html("<svg id='onAlarm' viewBox='0 0 24 24' width='20px' height='20px'><path fill='"+fill+"' d='M11.65 21c.99 0 1.8-.81 1.8-1.8h-3.6c0 .99.81 1.8 1.8 1.8zm5.85-5.4v-4.95A5.848 5.848 0 0 0 13 4.962V4.35C13 3.603 12.397 3 11.65 3c-.747 0-1.35.603-1.35 1.35v.612a5.848 5.848 0 0 0-4.5 5.688v4.95L4 17.4v.9h15.3v-.9l-1.8-1.8z'></path></svg>");	
					var alert_message = $(".alert").html(x+"문서 알림이 켜졌습니다.");
	     			alert_message.fadeIn(function(){
	         			setTimeout(function(){
	         				alert_message.fadeOut();
	         			}, 2000);
	     			});
	       			//글자수에 따라 높이 정하기
		     		var height = alert_message.prop("scrollHeight");
	    	 		alert_message.css("height", height);
				} else {//알람 끈거면
					$(this).html("<svg id='noAlarm' width='20px' height='20px' viewBox='0 0 24 24'><path fill='#888888' d='M13.99 19.5c0 .28-.05.54-.15.78-.26.6-.79 1.04-1.44 1.18-.087.02-.173.031-.263.036L12 21.5c-1.06 0-1.919-.82-2.003-1.851L9.99 19.5h4zM4 4.26l1.27-1.27L21 19.22l-1.27 1.27-1.916-1.99H4v-1l2-2v-5c0-1.266.275-2.444.8-3.44L4 4.26zm4.004 5.996L8 10.5v5.828l-.173.172h8.062L8.297 8.615c-.171.492-.271 1.042-.293 1.641zM12 2c.781 0 1.42.593 1.493 1.355l.007.145v.68c2.776.66 4.402 3.1 4.496 6.05l.004.27v2.577l-2-2.063V10.5c0-2.208-1.06-3.822-2.77-4.323l-.193-.051-1.036-.247-.795.189-1.565-1.614c.195-.08.399-.15.609-.21l.25-.064V3.5c0-.781.593-1.42 1.355-1.493L12 2z'></path></svg>");
					var alert_message = $(".alert").html(x+"문서 알림이 꺼졌습니다. 알림을 끄더라도 나를 언급한 할일 등은 알림을 받게 됩니다.");
					alert_message.fadeIn(function(){
	         			setTimeout(function(){
	         				alert_message.fadeOut();
	         			}, 2000);
	     			});
					var height = alert_message.prop("scrollHeight");
	    	 		alert_message.css("height", height);
				}
				
			} else if (title=="postBookmark"){
				if(state=="noBookmark"){//북마크 설정한거면
					$(this).html("<svg id='onBookmark' width='20px' height='20px' viewBox='0 0 24 24'><path fill='"+fill+"' fill-rule='evenodd' d='M17 3H7c-1.1 0-1.99.9-1.99 2L5 21l7-3 7 3V5c0-1.1-.9-2-2-2z'></path></svg>");	
					var alert_message = $(".alert").html(x+"북마크가 설정됐습니다.");
	    	 		
	     			alert_message.fadeIn(function(){
	         			setTimeout(function(){
	         				alert_message.fadeOut();
	         			}, 2000);
	     			});
	       			//글자수에 따라 높이 정하기
		     		var height = alert_message.prop("scrollHeight");
	    	 		alert_message.css("height", height);
				} else {//북마크 해제한거면
					$(this).html("<svg id='noBookmark' width='20px' height='20px' viewBox='0 0 24 24'><path fill-rule='evenodd' fill='#888888' d='M17 3c1.05 0 1.918.866 1.994 1.954l.006.157V22l-7-3.167L5 22l.01-16.889c0-1.108.81-2.024 1.841-2.105L7 3h10zm0 2H7c.014 0 .018.004.018.015l-.008.097L7.001 18.9 12 16.639l5 2.261V5.111c0-.06-.017-.092-.012-.105L17 5z'></path></svg>");
					var alert_message = $(".alert").html(x+"북마크가 해제됐습니다.");
					alert_message.fadeIn(function(){
	         			setTimeout(function(){
	         				alert_message.fadeOut();
	         			}, 2000);
	     			});
					var height = alert_message.prop("scrollHeight");
	    	 		alert_message.css("height", height);
				}
			}
			//북마크 알림 설정
			$.ajax({
				type:"post",
				url:"Controller?command=documentBookmarkAlarm",
				data:{
					"loginId":loginId,
					"documentId":documentId,
					"text":state
				},
				datatype:"json",
				success:function(data){
					
				},
				error:function(r,s,e){
					alert("error");
				}
			});

		});
		
		//안내창 x누르면 닫기
   		$(".closed").click(function(){
   			alert_message.fadeOut();
   		});
		
		//담당자 목록 열고닫기
		$(document).click (function(e){
			if($(e.target).is("#postedBnt1 span, #postedBnt1 img")==false) {
				if($(".picList").has(e.target).length==0) {
					$(".picList").addClass("hidden");
				}
			} else {
				$.ajax({
					type:"post",
					url:"Controller?command=getThisWorkspaceMember",
					data:{
						"workspaceId":workspaceId,
						"loginId":loginId
					},
					datatype:"json",
					success:function(data){
						$(".picList ul").empty().html('<li class="row"><span class="postedImg picture_sch" style="background-image:url(https://down.collabee.co/userProfile/-1)"></span><span title="담당자 없음" style="width:100%;">담당자 없음</span></li>');
						$.each(data, function(index, item) {
							var mList = '<li class="row"><span memberId='+item.member_id+' class="picture_sch" style="background-image:url('+item.picture+')"></span><span email="'+item.email+'">'+item.name+'</span></li>'
							$(".picList ul").append(mList);
						});
					
						$(".picList").removeClass("hidden");
					}, 
					error:function(r,s,e){
						
					}
				});
			}
		});
		
		//담당자 선택하면 값 바뀌기 
		$(document).on("click", ".picList li", function(){
			var name = $(this).text();
			var email = $(this).attr("email");
			var memberId = $(this).find("span").attr("memberid");
			
			$.ajax({
				type:"post",
				url:"Controller?command=documentPic",
				data:{
					"memberId":memberId,
					"documentId":documentId
				}, 
				datatype:"json",
				success:function(data){
					var picture = $(this).find(".picture_sch").css("background-image");
					if(picture=="url(null)") {
						picture="url(https://down.collabee.co/userProfile/-1)";
					}
					
					if(name==="담당자 없음"){
						$(".postedBnt1 span:nth-child(2)").text("담당자");
					} else {
						$(".postedBnt1 span:nth-child(2)").text(name).attr({"email":email, "memberId":memberId});
						$(".postedBnt1 span:nth-child(1)").css("background-image", picture);
						
					}
					$(".picList").addClass("hidden");
				},
				error:function(r,s,e){
					alert("다시 시도해 주세요");
				}
			});
		});
		
		//삭제 열고닫기
	    $(document).on("click", function(e){
	        if($(e.target).is(".postedMore")) {
	          $(".postedDel").removeClass("hidden");
	        } else {
	          $(".postedDel").addClass("hidden");
	        } 
	    });
		
		//삭제 클릭
		$(".postedDel").click(function(){
		if(confirm("문서를 삭제하시겠습니까?")==true){
			var alert_message = $(".alert").html(x+"문서가 삭제되었습니다.");
          	alert_message.fadeIn(function(){
            	setTimeout(function(){
              		alert_message.fadeOut();
            	}, 2000);
           	});
           	$.ajax({
           		type:"post",
           		url:"Controller?command=documentDel",
           		data:{
           			"documentId":documentId,
           			"workspaceId":workspaceId
           		},
           		datatype:"json",
           		success:function(){
		        	location.href="Controller?command=select_Workspace_Index&loginId="+loginId+"&workspaceId="+workspaceId;
           		}
        	});
           	
        	//글자수에 따라 높이 정하기
	        var height = alert_message.prop("scrollHeight");
	        alert_message.css("height", height);
        } else {
        	return;
      	}
		});
		
		$(".posting_bnt").on("hover", function(){
			$(this).css({'background-color': hover, 'border-color': hover});
		});
		
		$(".historyBack").click(function(){
			location.href="Controller?command=select_Workspace_Index&loginId="+loginId+"&workspaceId="+workspaceId;
		}); 
		
		
		
		//ta
		var cnt = 0;
		$("#slideComment").click(function(){
			cnt++;
        	$("#comments").html("");
            $("#comment").animate({width:"toggle"},400);
			if(cnt%2==0){
				$("#right_bar").css("display","block");
			} else {
            	$("#right_bar").css("display","none");
			}
			$.ajax({
				type: 'get',
				url: 'Controller?command=CommentContentAction',
				data: {"documentId": documentId },
				datatype: 'json',
				success: function(data){
					$.each(data,function(index,item){
						var comment = "";
						if(item.file_id==0 && item.link_id==0){
							comment =
								"<div class='comment' message_id='"+item.message_id+"'>" +
			                		"<div><img class='profile' src='image/upload/"+item.picture+"'/></div>" +
			                		"<div>" +
			                    		"<p class='information'><b>"+item.name+"</b><span> * "+item.creation_date+"</span></p>" +
			                    		"<p class ='information'>"+item.content+"</p>" +
			                		"</div>" +
			            		"</div>" ;
						} else if(item.file_id>0 && item.link_id==0){
							var fileName = "";
							$.ajax({
								type:'get',
								url:'Controller?command=CommentGetFileNameAction',
								data:{"file_id":item.file_id},
								datatype:'json',
								async: false,
								success: function(data){
									fileName = data.fileName;
								},
								error: function(r,s,e){
									
								}
							});
							comment =
								"<div class='comment' message_id='"+item.message_id+"'>" +
		                			"<div><img class='profile' src='image/upload/"+item.picture+"'/></div>" +
		                			"<div>" +
		                    			"<p class='information'><b>"+item.name+"</b><span> * "+item.creation_date+"</span></p>" +
		                    			"<p class ='information'><a class='fileA' href='image/upload/"+fileName+"' download><img class='fileImg' src='image/file.svg'/>"+fileName+"</a></p>" +
		                			"</div>" +
		            			"</div>" ;
						} else if(item.link_id>0 && item.file_id==0){
							var linkName = "";
							$.ajax({
								type:'get',
								url:'Controller?command=CommentGetLinkNameAction',
								data:{"link_id":item.link_id},
								datatype:'json',
								async: false,
								success: function(data){
									linkName = data.linkName;
								},
								error: function(r,s,e){
									
								}
							});
							comment = 
								"<div class='comment' message_id='"+item.message_id+"'>" +
	                				"<div><img class='profile' src='image/upload/"+item.picture+"'/></div>" +
	                				"<div>" +
	                    				"<p class='information'><b>"+item.name+"</b><span> * "+item.creation_date+"</span></p>" +
	                    				"<p class ='information'><a class='linkA' href='"+linkName+"'><img class='LinkImg' src='image/link.svg'/>"+linkName+"</a></p>" +
	                				"</div>" +
	            				"</div>" ;
						}
						$("#comments").append(comment);
					});
				},
				error : function(r,s,e){
					
				}
			});
        });
        $("#checkbox").click(function(){
            alert("댓글만보기");
        });
        $(".recommentBtn").click(function(){
            alert("답글쓰기");
        });
        $("#save").click(function(){
        	var message = $("#textbox").val();
        	var documentId = 2;
       		$.ajax({
       			type:'get',
       			url: 'Controller?command=CommentContentWriteAction',
       			data: {"loginId":<%=loginId%>,"message":message,"documentId":documentId},
       			datatype: 'json',
       			success: function(data){
       				$("#comment").css("display","none");
       				$("#textbox").val("");
       			},
       			error : function(r,s,e){
       				alert("실패");
       			}
       		});
        });
        $("#save").mouseenter(function() {
                $("#save").css("background-color","#d9ad2b");
        });
        $("#save").mouseleave(function() {
            $("#save").css("background-color","#d3d3d3");
        });
        $("#recommentXbtn").click(function(){
            $("#clickRecomment").css("display","none")
        });
        $("#textbox").keyup(function(){
        	$(this).attr("value",$(this).val());
        });
        $("#commentFile").change(function(){
			$("#loginIdInput").val(<%=loginId%>);
			var document_id =  documentId; 
			$("#documentIdInput").val(document_id);
        	$("#fileUpload").submit();
		});
		
	});
</script>
    
<body>
<div class="alert"></div>
<!-- 헤더  -->
<div class="row postedHeader">
	<div class="display_inherit">
		<a class="historyBack arrow"></a>
		<div class="colum">
			<div class="row">
				<span class="postedTitle"></span>
				<div class="postBnt2">
					<span id="postAlarm"><svg id="noAlarm" width="20px" height="20px" viewBox="0 0 24 24"><path fill="#888888" d="M13.99 19.5c0 .28-.05.54-.15.78-.26.6-.79 1.04-1.44 1.18-.087.02-.173.031-.263.036L12 21.5c-1.06 0-1.919-.82-2.003-1.851L9.99 19.5h4zM4 4.26l1.27-1.27L21 19.22l-1.27 1.27-1.916-1.99H4v-1l2-2v-5c0-1.266.275-2.444.8-3.44L4 4.26zm4.004 5.996L8 10.5v5.828l-.173.172h8.062L8.297 8.615c-.171.492-.271 1.042-.293 1.641zM12 2c.781 0 1.42.593 1.493 1.355l.007.145v.68c2.776.66 4.402 3.1 4.496 6.05l.004.27v2.577l-2-2.063V10.5c0-2.208-1.06-3.822-2.77-4.323l-.193-.051-1.036-.247-.795.189-1.565-1.614c.195-.08.399-.15.609-.21l.25-.064V3.5c0-.781.593-1.42 1.355-1.493L12 2z"></path></svg></span>
					<span id="postBookmark"><svg id="noBookmark" width="20px" height="20px" viewBox="0 0 24 24"><path fill-rule="evenodd" fill="#888888" d="M17 3c1.05 0 1.918.866 1.994 1.954l.006.157V22l-7-3.167L5 22l.01-16.889c0-1.108.81-2.024 1.841-2.105L7 3h10zm0 2H7c.014 0 .018.004.018.015l-.008.097L7.001 18.9 12 16.639l5 2.261V5.111c0-.06-.017-.092-.012-.105L17 5z"></path></svg></span>
				</div>
			</div>
			<div class="row postedSecondTitle">
				<button id="postDate" class="postedBnt1">시작일 ~ 종료일</button><div id="startPost"></div><div id="endPost"></div>
				<div class="postedSection" style="height:16px;"></div>
				<button id="postedBnt1" class="postedBnt1"><span class="postedImg picture_sch" style="background-image:url(https://down.collabee.co/userProfile/-1);"/></span><span>담당자</span></button>
			</div>
		</div>
	</div>
	
	<div class="display_inherit">
		<button class="postedMore" title="문서삭제로 바꿈"></button>
		<div class="postedDel hidden">삭제</div>
		<div class="postedSection" style="height:32px;"></div>
		<div>
		<button id="editButton" class="posting_bnt" style="margin-right:0px;">
			<svg viewBox='0 0 24 24' width='13px' height='13px'><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="posting_icon"></path></svg>
			<span style="color:rgb(255,255,255)">문서 작성</span>
		</button>
		</div>
	</div>
</div>

    <div class="picList hidden"><!-- 참석자 목록 -->
        <ul></ul>
    </div>
    
     <div id="comment">
        <div id="comments">
            <div class="comment">
                <div><img class="profile" src="image/+.svg"/></div>
                <div>
                    <p class="information"><b>이름</b><span> * 5월 8일 오후 5:15</span></p>
                    <p class ="information">내용</p>
                </div>
            </div>

        </div>
        <div id="commentWrite">
            <div style=" border: 1px solid #d3d3d3;border-radius: 5px; padding: 10px 5px 0px 10px; width:330px; margin-left: 17px; background-color: white; margin-top: 10px;">
                <input id="textbox" type="text" placeholder="여기에 입력하세요"/>
                 <form id="fileUpload" action="Controller?command=CommnetFileUploadAction" method="post" enctype="multipart/form-data">
	            	<label for="commentFile">
	            		<img src="image/fileIcon.svg"/>
	            	</label>
	                <input type="file" id="commentFile" name="commentFile"/>
					<input type="hidden" id="loginIdInput" name="loginId" value=""/>
                	<input type="hidden" id="documentIdInput" name="documentId" value=""/>
            	</form>
                <button id="save">저장</button>
            </div>
        </div>
        <input type="checkbox" id="checkbox"/><span class="checkboxCotent"> 댓글만 보기</span>
    </div>
    <button id="slideComment" style="float: right; margin-top: 80px;"><img src="image/comment.svg" style="width:20px; vertical-align: bottom; border-radius: 5px; background-color: white;"/></button>
    
    	
		    	
    	
    <div class="row" style="justify-content: center;">
    	<div style="position:absolute;">
			<%@ include file="WEB-INF/include/include_postedDocument.jspf"%>
    	</div>
		<div style="position:absolute; right:0; top:230px;">
			<%@ include file="WEB-INF/include/include_rightBar_document.jspf"%>
		</div>
    </div>

</body>
</html>