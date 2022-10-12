<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jm.dto.*" %>
<%@ page import = "java.util.ArrayList" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="css/chattingRoom.css" rel="stylesheet" type="text/css">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
		$(function () {
			$("#nc").click(function () {
				$(".ncr_search").css('display', 'block');	
			});

	        //멤버선택
 	        $(document).on("click",".ncr_search>ul>div>li", function(){ 
	            var name = $(this).find(".nc_select_name").text();
	            var email = $(this).find(".nc_select_email").text();  
	            var select_member_id = $(this).parent().find(".member_id_nc_modal").text();
				var img = $(this).parent().find(".picture_nc_modal").css("background-image");
	            
				
	            $(".ncr_search").css('display', 'none');
	            $(this).parent().detach();
	                
	            var setPickedMember = "<div class='selected_nc' email='"+email+"'><div class='picture_nc_modal' style='"+img+"' ></div><span style='margin-left: 35px;'>"+name+"</span><div class='member_id_picked_nc' style='display: none;' value='"+select_member_id+"'></div></div>";
	            $(".nc_people").append(setPickedMember);
	            

	        }); 
	        
	        //멤버해제
	        $(document).on("click",".selected_nc", function(){
	        	var name = $(this).find("span").text();
	            var email = $(this).attr("email");  
	            var member_id = $(this).find(".member_id_picked_nc").attr("value");
	            var img = $(this).find(".picture_nc_modal").css('background-image');
	            
	            $(this).detach();
	            
	            var setPickedMember = "<div><div class='picture_nc_modal' style='background-image:"+img+"'></div><div class='member_id_nc_modal' style='display: none'>"+member_id+"</div><li><span style='color: black;'class='nc_select_name'>"+name+"</span><span class='nc_select_email'>"+email+"</span></li></div>";
	            $(".ncr_search ul").append(setPickedMember);

	        });	
	        
	        $(".ncr_btn").click(function() {
	        	var nc_list_str = "";
	        	var chattingRoom_id;
	        	$(".selected_nc > .member_id_picked_nc").each(function(index, item) {
		        	
		        	var member_id = $(item).attr('value');

		        	nc_list_str += member_id + "_";
	        	});

	        	$.ajax({
	        		type: 'post',
	        		url: 'Controller',
	        		data: {'command' : 'NewChattingRoomInsert', 'list' : nc_list_str},
	        		datatype: 'json',
	        		success: function(d){
	        			alert(d.nc_id);
	        		},
	        		error: function(r,s,e){
	        			alert("에러");
	        		}
	        	});
	        });
	        
            $(".ncr_input").keyup(function(key){
                $(this).attr("value",$(this).val());
                var search = $(this).val();
                $(".nc_select_name").each(function(index, item){
                	if($(item).text().includes(search)){
						$(item).parent().parent().css("display","block");                		
                	} else {
						$(item).parent().parent().css("display","none");
                	}
                });
            });
			
		});
	</script>
</head>
<body>
	<div id="new_chatting_room" class="overlay">
		<div>
			<form action="Controller?command=TodoInsert"  method="post">
				<div class="new_chatting_room_container">
					<button class="button_x_ncr" type="button">
						<svg viewBox="0 0 24 24" width="24px" height="24px" style="vertical-align: middle;">
							<path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="button_x"></path>
						</svg>
					</button>
				
					<header class="header_for_resetPW">
						<h2 class="h2_for_resetPW">채팅방 만들기</h2>
						<span class="span_for_resetPW">대화상대를 선택하여 그룹대화를 만들어보세요. 그룹대화는 '나'를 포함하여 최대 8명까지 선택할 수 있습니다.</span>
					</header>
					
					<div>
						<input type="text" id="nc" class="ncr_input" placeholder="이름을 입력하여 검색" />
						<button class="ncr_btn" type="button">대화하기</button>
					</div>
					<div class="ncr_search">
						<ul>
							<%
								ArrayList<PartnerListDto> pL = (ArrayList<PartnerListDto>)request.getAttribute("pL");
								for(int i = 0; i<pL.size(); i++){
							%>
						
								<div>
										<div class="picture_nc_modal" style="background-image:<%=pL.get(i).getPicture() %>"></div>
										<div class="member_id_nc_modal" style="display: none"><%=pL.get(i).getMember_id() %></div>
										<li>
											<span style="color: black;"class="nc_select_name"><%=pL.get(i).getName() %></span>
											<span class="nc_select_email"><%=pL.get(i).getEmail() %></span>
								         </li>
								</div>
							<%
								}
							%>
						</ul>
					</div>
					<div>
						<div class="nc_people">	
							<input type="hidden" class=""/>
							
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>