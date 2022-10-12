<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.one.dto.*" %>
<%@ page import="com.one.dao.*" %>
<%@ page import="com.one.mvc.*" %>
<%
	int loginId = (Integer)session.getAttribute("loginId");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>문서작성</title>
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <link href="css/Document.css" rel="stylesheet" type="text/css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <link rel="icon" href="images/favicon.ico" type="image/x-icon">
<%
	int documentId = (Integer)request.getAttribute("documentId");
	int workspaceId = (Integer)request.getAttribute("workspaceId");
%>
<script> /*임시저장*/
  	$(function() {
  		var documentId = <%=documentId%>; 
		var workspaceId = <%=workspaceId%>;
    	var x="<svg viewBox='0 0 24 24' width='24px' height='24px' class='closed'><path fill='rgb(255,255,255)' d='M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z'></path></svg>";
    	
		$("textarea.document_title").attr("documentId", documentId);
    	//임시저장 리스트 목록 채우기
        $.ajax({
			type:"post", 
			url:"Controller?command=getDraftsDocument",
			data:{
				"memberId":<%=loginId%>
			},
			datatype:"json",
			success:function(data){ 
				$.each(data, function(index, item){
					$("img").css("background-image", item.kanban_icon_p);
					var box = "<div class='drafts_post' documentId='"+item.document_id+"' workspaceId='"+item.workspace_id+"'>"
			            +"<div class='drafts_title'>"
		                +"<img src='https://down.collabee.co/postStatus/1603707'>"
		                +"<div>"+item.title+"</div>"
		            	+"</div>"
		            	+"<div class='drafts_info'>"
		                +"<span>"+item.date+"</span>"
		                +"<span class='drafts_ws2'>"+item.workspace_name+"</span>"
		            	+"</div>"
		       			+"</div>";
		       			
					$("#drafts_list").append(box);
				});					
			}//success end.
        });
    	
    	//나의 협업공간 목록 채우기
    	$.ajax({
			type:"post", 
			url:"Controller?command=ModalWorkspaceList",
			data:{
				"loginId":<%=loginId%>
			},
			datatype:"json",
			success:function(data){
				$.each(data, function(index, item) {
					var wsList = "<li WorkspaceId='"+item.workspace_id+"'>"
		    			+"<svg viewBox='0 0 24 24' width='16px' height='16px'><path d='M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z'></path>"
				    	+"</svg><span>"+item.workspace_name+"</span>"
				    	+"</li>"; 
					if(item.workspace_id==workspaceId) {
						if(item.workspace_name=="프라이빗 공간"){
							$("#drafts_ws").html(item.workspace_name + "<svg viewBox='0 0 24 24' width='16px' height='16px'><path fill='#d9ad2b' d='M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z'></path></svg>")
							.css({color:"rgb(217, 173, 43)", border:"1px solid rgb(217, 173, 43)"});
							$("#saveButton").css({border:"1px solid rgb(217, 173, 43)", 'background-color':"rgb(217, 173, 43)"});
							$(".document_ws").css({'background-color':"rgb(250, 243, 223)", color:"rgb(204, 153, 0)"});
						} else {
							$("#drafts_ws").html(item.workspace_name + "<svg viewBox='0 0 24 24' width='16px' height='16px'><path fill='#33846c' d='M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z'></path></svg>")
							.css({color:"rgb(51, 132, 108)", border:"1px solid rgb(51, 132, 108)"}); 
				            $("#saveButton").css({border:"1px solid rgb(51, 132, 108)", 'background-color':"rgb(51, 132, 108)"});
							$(".document_ws").css({'background-color':"rgb(234, 242, 240)", color:"rgb(51, 132, 108)"});
						}
						$(".document_ws").html(item.workspace_name);
					}				    	
				    $(".workspace_list ul").append(wsList);  	
				});
			} 
    	});
				
	    //임시저장 문서 누르면 문서 불러옴
	    $(document).on("click",".drafts_post", function(){ 
	    	var drafts_documentId = $(this).attr("documentId");
	      	$("#drafts_list").css("display","none");
	      	$("textarea.document_title").val($(this).find(".drafts_title").text()).attr("documentId", drafts_documentId);
	      	$(".document_ws").val($(this).find(".drafts_ws2").text()).attr("workspaceId", $(this).attr("workspaceId"));
	      	$.ajax({
				type:"post",
				url:"Controller?command=getDraftsDocument",
				data:{
					"documentId":drafts_documentId,
					"memberId":<%=loginId%>
				},
				datatype:"json",
				success:function(data){
					$.each(data, function(index, item){
						if(item.document_id==drafts_documentId){
							$(".document_kanban img").attr("src", item.kanban_icon_p);
							$(".document_title").text(item.title);
							var json_object = JSON.parse(item.content);
							console.log(json_object.blocks);
							//editor.blocks.clear();//block 비우기
							for(var i=0; i<=json_object.blocks.length-1; i++) {
								editor.blocks.insert(json_object.blocks[i].type, json_object.blocks[i].data);
							}
						}
					});
				},
				error:function(r,s,e){
					alert("error!");
				}
	      	});
	    });
    
    //임시저장함 문서 효과
    $(document).on("hover", ".drafts_post", function(){ 
        $(this).css("background-color", "rgb(239, 239, 239)");
    }, function() {
        $(this).css("background-color", "transparent");
    });
    $(".drafts_post").on("click",(function(){
        $(this).css("background-color", "rgb(239, 239, 239)");
	}));
    
	 //임시저장함 열고 닫기
	$(".drafts_bnt").click(function(){
		$("#drafts_list").toggle();
	});
   
     //닫기버튼 누를때
     $("#drafts_close").click(function(){
    	 history.back();
     }); 
    
    //삭제 열고닫기
    $(document).on("click",function(e){
        if($(e.target).is("#drafts_more svg")) {
          $("#drafts_del").css({visibility:"visible", opacity:1});
        } else {
          $("#drafts_del").css({visibility:"hidden", opacity:0});
        } 
    });

    //선택한 문서 삭제 클릭           sql에 document_id fk 제약조건 확인
    $("#drafts_del").click(function(){
        if(confirm("임시저장된 문서를 삭제하시겠습니까?")==true){
           	var del_documentId = $(".document_title").attr("documentid");
        	$.ajax({
            	type:"post",
            	url:"Controller?command=documentDel",
            	data:{
            		"memberId":<%=loginId%>,
            		"drafts":1,
            		"documentId":del_documentId,
            		"workspaceId":workspaceId
            	},
            	datatype:"json",
            	success:function(data){
            		if(data.IsDel==1) {
			        	var alert_message = $(".alert").html(x+"임시저장한 문서가 삭제되었습니다.");
			            alert_message.fadeIn(function(){
			              setTimeout(function(){
			                alert_message.fadeOut();
			              }, 2000);
			            });
			            //글자수에 따라 높이 정하기
			            var height = alert_message.prop("scrollHeight");
			            alert_message.css("height", height);
			            $("#drafts_del").css({visibility:"hidden", opacity:0});
            		}
            		//리스트에서 삭제해주기
            		$(".drafts_post").each(function(index, item) {
						if($(item).attr("documentid")==del_documentId){
	            			$(item).detach();
	            			$(".document_title").val("").attr("documentid",documentId);
	            			editor.blocks.clear();
						}
            		});
            	}
            });
        }//confirm done. 
    });//done.
    
     //리스트 열고 닫음
     $(document).on("click", function(e){
      var ws = $(".document_ws").text();
      if($(e.target).is("#drafts_ws")){
          $(".workspace_list > ul").removeClass("hidden");
          $("#drafts_ws").html("공간 검색").css("color", "rgb(136, 136, 136)");
          $("#drafts_ws svg").css({visibility:"hidden", opacity:0});
      
      } else{
    	  
          $(".workspace_list ul").addClass("hidden");
	      var svg = "<svg viewBox='0 0 24 24' width='16px' height='16px'><path fill='#d9ad2b' d='M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z'></path></svg>";
          if(ws=="프라이빗 공간"){ //프라이빗 선택하면 색 바뀜.
        	  $("#drafts_ws svg path").css("fill","rgb(217, 173, 43)");
              $("#drafts_ws").html(ws+svg).css({color:"rgb(217, 173, 43)", border:"1px solid rgb(217, 173, 43)"});
              $("#saveButton").css({border:"1px solid rgb(217, 173, 43)", 'background-color':"rgb(217, 173, 43)"});
              $(".document_ws").html(ws).css({color:"rgb(204, 153, 0)", 'background-color':"rgb(250, 243, 223)"})
          
          } else{ //다른 공간 선택했을때
        	  
		      var svg = "<svg viewBox='0 0 24 24' width='16px' height='16px'><path fill='#33846c' d='M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z'></path></svg>";
        	  $("#drafts_ws svg path").css("fill","rgb(51, 132, 108)");
        	  $("#drafts_ws").html(ws+svg).css({color:"rgb(51, 132, 108)", border:"1px solid rgb(51, 132, 108)"}); 
              $("#saveButton").css({border:"1px solid rgb(51, 132, 108)", 'background-color':"rgb(51, 132, 108)"});
              $(".document_ws").html(ws).css({color:"rgb(51, 132, 108)", 'background-color':"rgb(234, 242, 240)"});
          }
      }
    });
    
    //리스트 선택하면 그 값으로 바뀌고 리스트 닫힘
    $(".workspace_list ul").on("click", "li", function(){ 
      var workspace = $(this).text();
      var workspaceId = $(this).attr("workspaceId");
      
      if(workspace=="프라이빗 공간"){ //프라이빗 선택하면 색 바뀜.
    	  $("#drafts_ws svg path").css("fill","rgb(217, 173, 43)");
          $("#drafts_ws").html("프라이빗 공간<svg viewBox='0 0 24 24' width='16px' height='16px'><path d='M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z'></path></svg>")
          .css({color:"rgb(217, 173, 43)", border:"1px solid rgb(217, 173, 43)"});
          $("#saveButton").css({border:"1px solid rgb(217, 173, 43)", 'background-color':"rgb(217, 173, 43)"});
          $(".document_ws").html(workspace).css({color:"rgb(204, 153, 0)", 'background-color':"rgb(250, 243, 223)"})
      } else{ //다른 공간 선택했을때
    	  $("#drafts_ws svg path").css("fill","rgb(51, 132, 108)");
          $("#drafts_ws").html(workspace+"<svg viewBox='0 0 24 24' width='16px' height='16px' class='icon_color2'><path d='M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z'></path></svg>")
          .css({color:"rgb(51, 132, 108)", border:"1px solid rgb(51, 132, 108)"}); 
          $("#saveButton").css({border:"1px solid rgb(51, 132, 108)", 'background-color':"rgb(51, 132, 108)"});
          $(".document_ws").html(workspace).css({color:"rgb(51, 132, 108)", 'background-color':"rgb(234, 242, 240)"});
      }
      $("#drafts_ws").attr("workspaceId", workspaceId);
      $(".workspace_list > ul").addClass("hidden");
      $("#drafts_ws svg").css({visibility:"visible", opacity:1});
    });//done.

    $(".workspace_list li").hover(function (){
        $(this).css("background-color", "rgb(242,242,242)");
    }, function(){
        $(this).css("background-color", "rgb(255, 255, 255)");
    });
    
	
    //제목 칸에 맞춰 늘어나기
    $(".document_title").on('keydown', function() {
        var title = $(this).val();
        var height1 = $(this).prop("scrollHeight");
        $(this).css("height", height1);
    
        if(title.length > 150) {
            $(this).val(title.substring(0, 150));
              
            //안내메세지 뜨기
            var alert_message = $(".alert").html("제목은 150자까지 입력할 수 있습니다.");
            alert_message.fadeIn(function(){
                setTimeout(function() {
                  alert_message.fadeOut() //3초후에 자동으로 닫힘
                }, 2000);
            });
            //안내메세지 높이
            var height2 = alert_message.prop("scrollHeight");
            alert_message.css("height", height2);
        } 
    });
	
      //다시 줄어들기
      	$(".document_title").on("keyup", function(){
	        $(this).css("height", "auto"); //다시 오토로 만들고
	        var height = $(this).prop("scrollHeight"); //스크롤 길이 측정
	        $(this).css("height", height); //스타일에 대입
		});

      
		// 칸반 문서상태변경 모달띄우기 / 닫기
		$(".kanban_select_button").click(function() {
        	var px = $(this).offset().left;	/* 클릭한 현재위치 가로 */
        	var py = $(this).offset().top+ 25;
        	$("#kanban_selector").css('left',px+'px');
        	$("#kanban_selector").css('top',py+'px');
			
			$("#kanban_selector").css('display', 'block');
			$("#div_background").css('display', 'block');

			$.ajax({
				type: 'post',
				url: 'Controller?command=KanbanSelector',
				data: {
					'workspace_id' : workspaceId
				},
				datatype: "json",	
				success: function(d){
					$(".kanban_selector_menu").empty();
					for(i=0; i<d.length; i++){
						var kanban_id = d[i].kanban_id;
						var kanban_icon_p = d[i].kanban_icon_p;
						var kanban_name = d[i].kanban_name;
						var str = "<button class='kanban_selector_menu_button'>" +
										"<div class='kanban_id' style='display:none'> "+kanban_id+" </div>" +
										" <img src=' "+ kanban_icon_p +" ' size='20' class='kanban_img'>" +
										" <span class='kanban_selector_name'>"+ kanban_name +"</span>" +
										" </button>";
						$(".kanban_selector_menu").append(str);
					}
				},
				error: function(r,s,e){
					alert("에러");
				}
			});
		});
		
		//검색
		$("#searchbar").keypress(function(e){
    	    if(e.keyCode == 13){
    			var search = $(this).val();
    		    var member_id = <%=loginId%>;
    		    location.href="Controller?command=SearchP1&search="+search+"&member_id="+member_id;
    		}
		});
		
	  	$("#div_background").click(function() {
	    	$("#div_background").css('display', 'none');
	  		$("#kanban_selector").css('display', 'none');
	  	});
	  	$(".kanban_selector_menu_button").click(function(){
	  		var text = $(this).find(".kanban_selector_name").text();
	  		var img = $(this).find(".kanban_img").attr("src");
	  		
			$("#kanban_selector").css("display","none");
	  	});
	}); 
</script>
</head>
<body>
  <div class="alert"></div>

<div id="postDocument"> <!--문서 전체-->
  <div id="drafts"> <!--임시저장-->
    <header>
        <div class="drafts_tab1">
            <button class="drafts_bnt"></button>
            <label>임시저장 중..</label>
        </div>
       	<input type="hidden" name="input_hidden_data"/>
        <div class="drafts_tab2">
            <button id="drafts_more"><svg viewBox="0 0 24 24" width="24px" height="24px" class='icon_color'><path d="M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path></svg></button>
            <div id="drafts_del" class="hidden">삭제</div>
            <div class="drafts_sec"></div>
            <button id="drafts_ws"><svg viewBox="0 0 24 24" width="16px" height="16px" class='icon_color2'><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z"></path></svg></button>
            <button id="saveButton">저장</button> 
            <div class="drafts_sec"></div>
            <div id="drafts_close"><svg viewBox="0 0 24 24" width="22px" height="22px" class="icon_color"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></div>
        </div>
    </header>

    <div class="workspace_list">
      <ul class="icon_color hidden">
          <li style="cursor:none;">공간 검색</li>
      </ul>
	</div>

    <div id="drafts_list" class="drafts_scrollbar" style="display:none;">
        <div id="drafts_cnt">임시저장함</div>
    </div>
</div>
	

<div style="margin-top:100px;"> <!--제목과 문서 에디터-->
  
  	<div class="document_header column"> 
	    <div class="row">
	      <button type="button" class="document_kanban kanban_select_button"><img src="https://down.collabee.co/postStatus/1603707" style="width:18px; height:18px;"/><span>발의됨</span><svg width="8" height="4" viewBox="0 0 8 4"><path d="M0 0l4 4 4-4z" fill="#888888" fill-rule="evenodd"></path></svg></button>
	      <div class="document_ws"></div>
	    </div>
	    <textarea placeholder="제목을 입력해 주세요." class="document_title" maxlength="150" rows="1"></textarea>
  	</div>
  
	<div id="kanban_selector" role="tooptip" >
		<div class="kanban_selector_center">
		<h6 class="kanban_selector_title">문서상태변경</h6>
		<!-- <a>칸반으로 이동 (톱니바퀴모양 이미지)</a> -->
		<div class="kanban_selector_menu">

		</div>
		</div>
	</div>
	
	<div id="div_background"></div>


<!-- 문서 에디터-->
<div class="row" style="justify-content:center;">
	<%@ include file="WEB-INF/include/include_editor.jspf"%>
	
	<div style="position: absolute; right:0; top: 230px;">
		<%@ include file="WEB-INF/include/Aside.jspf"%>
	</div>
	<%@ include file="WEB-INF/include/include_postedSchedule.jspf" %>
</div>            
  </div>    
</div>  
</body>
</html>
