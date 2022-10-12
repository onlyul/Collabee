<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jm.dto.*" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>새  할 일</title>
	<link href="css/Todo_modal.css" rel="stylesheet" type="text/css">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script>
		$(function () {
		   
            $("#todo_start_date_picker_btn, #todo_finish_date_picker_btn").datepicker("setDate", new Date());
            $("#todo_start_date_picker_btn, #todo_finish_date_picker_btn").click(function() { 
            	$("#todo_start_date_picker_btn, #todo_finish_date_picker_btn").datepicker({
            		dateFormat:"yy.m.d" ,showOthermonths: true ,showMonthAfterYear:true
                    ,buttonImageOnly:true ,yearSuffix:"년", monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
                    ,dayNamesMin:["일", "월","화","수","목","금","토"]
                    , showButtonPanel:true, currentText:"오늘", closeText:"닫기"
            	});
            	//finish가 start보다 전이면 start가 선택한 finish 날짜로 변함(보류)            
            });

		
			//협업공간 리스트 뜨기
		    $(".new_todo_projectdropdowncontainer").click(function() {
            	var px = $(this).offset().left;	/* 클릭한 현재위치 가로 */
            	var py = $(this).offset().top+ 35;
            	$(".workspace_list").css('left',px+'px');
            	$(".workspace_list").css('top',py+'px');
				
				$(".workspace_list").css('display', 'block');
				$("#div_background").css('display', 'block');
		        $(".new_todo_projectdropdown_workspace>span").html("공간 검색").css("color", "rgb(136, 136, 136)");
		        $(".icon3_sch svg").css({visibility:"hidden", opacity:0});
			});
          	$("#div_background").click(function() {
            	$("#div_background").css('display', 'none');
          		$(".workspace_list").css('display', 'none');
          	});
		  
		    
		    $(".workspace_list > ul > li ").click(function(){ //리스트 선택하면 그값으로 바뀌고 리스트 닫힘
		        
		        // .input_workspace_name 에 workspace_name 넣기
		        var workspace1 = $(this).find("span").text();
		        //$(".input_workspace_name").val(workspace1);
		        
		        // workspace_id input에 넣기
		        var workspace_id = $(this).find(".workspace_id_Todo_modal").text();
		        $(".input_workspace_id_Todo_modal").val(workspace_id);
		        
		        //var workspace = $(this).text();
		        if(workspace1=="프라이빗 공간"){ //프라이빗 선택하면 색 바뀜. 
		           $(".new_todo_projectdropdown_workspace>span").html("프라이빗 공간").css('color', 'rgb(217, 173, 43)');
		           $(".new_todo_projectdropdowncontainer1").css('border', "1px solid rgb(217, 173, 43)");
		           $(".new_todo_save_btn").css({border:"1px solid rgb(217, 173, 43)", 'background-color':"rgb(217, 173, 43)"});
		           $("#workspace_container_arrow").css("fill","rgb(217, 173, 43)");
		        } else{
		        	$(".new_todo_projectdropdown_workspace>span").html(workspace1).css('color', 'rgb(51, 132, 108)');
		        	$(".new_todo_projectdropdowncontainer1").css('border', "1px solid rgb(51, 132, 108)");
		            $(".new_todo_save_btn").css({border:"1px solid rgb(51, 132, 108)", 'background-color':"rgb(51, 132, 108)"});
		            $("#workspace_container_arrow").css("fill","rgb(51, 132, 108)");
		        }
		        
		        $("#div_background").css('display', 'none');
          		$(".workspace_list").css('display', 'none');
		        $("#workspace_container_arrow").css({visibility:"visible", opacity:1});
		    });
		    $(".workspace_list li").hover(function (){
		        $(this).css("background-color", "rgb(242,242,242)");
		    }, function(){
		        $(this).css("background-color", "rgb(255, 255, 255)");
		    });
		    
		    
		  // 담당자 선택
	        $("#assgin_sel_todo").on("focus", function (){
	           	$(this).attr("placeholder","담당자 이름 검색").css({width: '400px', color:"rgb(136, 136, 136)", border:"1px solid rgb(217, 173, 43)", 'box-shadow': "0 0 4px rgb(247,239,213)", 'padding-right':"200px", cursor:"text"});
	           	$("#assign_sch").css('border-color', 'transparent');
           	
	           	$(".assign_list").css('display', 'block'); //리스트 열기
	        });
	        
		
	        //클릭하면 아래에 추가
	        $(document).on("click",".assign_list ul li", function(){
	            var name = $(this).text();//선택한 멤버 이름
	            var email = $(this).attr("email");  // 선택한 멤버 이메일
	            var assign_member_id = $(this).parent().find(".member_id_todo_modal").text();
				var img = $(this).parent().find(".picture_todo_modal").css('background-image');
	            
	            $(".assign_list").addClass("hidden");
	            $(this).parent().parent().detach();//고른 멤버 리스트에서 삭제.
	            
	                
	            var setPickedMember = "<div class='selected_assign' email='"+email+"'><span>"+name+"</span><div class='member_id_picked_assign' style='display: none; background-image: "+img+"' value='"+assign_member_id+"'></div></div>";
	            $(".picked_assign").append(setPickedMember);
	            
	            
	            $(".assign_list").css('display', 'none'); //리스트 닫기

	            $("#assgin_sel_todo").removeAttr("style");
	            $("#assgin_sel_todo").attr("placeholder","담당자 추가")
	            $("#assign_sch").css('border-color', 'rgb(230, 230, 230)');
	        });
	        
	        //클릭하면 사라짐
	        $(document).on("click",".selected_assign", function(){
	        	var name = $(this).find("span").text();//선택한 멤버 이름
	            var email = $(this).attr("email");  // 선택한 멤버 이메일
	            var member_id = $(this).find(".member_id_picked_assign").attr("value");
	            var img = $(this).parent().find(".member_id_picked_assign").css('background-image');
	            alert(member_id);
	            
	            
	            $(this).detach();
	            
	            
	            var setPickedMember = "<div><div class='todo_modal_assign_conatiner'><div class='picture_todo_modal' style=background-image:"+img+"'></div><div class='member_id_todo_modal' style='display: none'>"+member_id+"</div><li email='"+email+"'>"+name+"</li></div></div>"
	            $(".assign_list ul").append(setPickedMember);

	        });	
	        
	        // 담당자 아이디 submit 하기전 input 에 넣기
	        $(".new_todo_save_btn").click(function() {
		        var assign_list_str = "";
	        	$(".selected_assign > div").each(function(index, item) {
		        	
		        	var member_id = $(item).attr('value');

		        	assign_list_str += member_id + "_";
	        	});

	        	$(".assign_member_id_list").val(assign_list_str);
	        });
	        
	        // 파트너 이름 검색
            $("#assgin_sel_todo").keyup(function(key){
                var search = $(this).val();
                $(".todo_modal_assign_conatiner li").each(function(index, item){
                	if($(item).text().includes(search)){
						$(item).parent().parent().css("display","block");                		
                	} else {
						$(item).parent().parent().css("display","none");
                	}
                });
            });

		});
		
/* 		function () {
			if(str == null){
				
				return true;
			}else{
				alert("담당자를 선택해 주세요!");
				return false;
			}
		} */
	</script>
	
</head>
<body>
	<form action="Controller?command=TodoInsert"  method="post">
	<div id="todo_modal" class="todo_layout_container">
		<div class="modal_overlay" aria-hidden="true" style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"></div>
		
		<div class="todo_modal1">
			<div class="todo_modal2">
				
				<div id="new_todo">
					<div class="new_todo_container">
						<header class="new_todo_header">
							<h6 class="new_todo_h6">새 할 일</h6>
							
							<button type="button" color="mono3Grey" title="닫기" class="new_todo_btn_x">
								<svg viewBox="0 0 24 24" width="24px" height="24px" class="btn_x_svg"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="btn_x_path"></path></svg>
							</button>
						</header>
						
						<div>
						
							<div class="new_todo_inputcontainer">
								<svg viewBox="0 0 24 24" width="30px" height="30px" class="btn_x_svg"><path d="M12 1.5C6.204 1.5 1.5 6.204 1.5 12S6.204 22.5 12 22.5 22.5 17.796 22.5 12 17.796 1.5 12 1.5zM9.9 17.25L4.65 12l1.48-1.48 3.77 3.758 7.97-7.969L19.35 7.8 9.9 17.25z" color="#E1E1E1" class="new_todo_path"></path></svg>
								<textarea name="content" maxlength="101" placeholder="햄스터 조사 @이정민대리 ~ 6/13" class="new_todo_input" style="overflow-wrap: break-word; flex: 0 0 auto; white-space: break-spaces !important; height: 32px;" required></textarea>
							</div>
							
							<div class="new_todo_assign">
								<div class="user_manage"> <!-- 담당자 -->
										
										<%
										ArrayList<PartnerListDto> pL = (ArrayList<PartnerListDto>)request.getAttribute("pL");
										%>
										 
							                <div id="assign_sch">
							                    <div class="icon_sch"><svg viewBox="0 0 24 24" width="20px" height="20px" class="icon_color"><path d="M9 11.75a1.25 1.25 0 1 0 0 2.5 1.25 1.25 0 0 0 0-2.5zm6 0a1.25 1.25 0 1 0 0 2.5 1.25 1.25 0 0 0 0-2.5zM12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8 0-.29.02-.58.05-.86 2.36-1.05 4.23-2.98 5.21-5.37a9.974 9.974 0 0 0 10.41 3.97c.21.71.33 1.47.33 2.26 0 4.41-3.59 8-8 8z" color="#C1C1C1" class="Beecon__Path-sc-3x6pq4-1 dBeMQs"></path></svg></div>
							                    
							                    <input type="text" id="assgin_sel_todo" class="icon2_sch" placeholder="담당자 추가"/>
							                    
							                    <div class="assign_list" style="display: none"><!-- 담당자 목록 -->
							                        <ul>
							                        <%
							                        	for(int i = 0; i<pL.size(); i++){ 
							                        %>
							                        	<div>
								                            <div class="todo_modal_assign_conatiner">
								                            	<div class="picture_todo_modal" style="background-image:<%=pL.get(i).getPicture()%>"></div>
								                            	<div class="member_id_todo_modal" style="display: none"><%= pL.get(i).getMember_id() %></div>
								                            	<li email="<%=pL.get(i).getEmail() %>">
								                            		 <%=pL.get(i).getName() %>
								                            	</li>
								                            </div>
							                        	</div>
													<%
							                        	}													
													%>
							                        </ul>
							                    </div>
							                							
							                </div>
								            <!-- 선택된 멤버들 div -->
								            <div class="row picked_assign"></div>		
								            <input type="hidden" name="assign_member_id" class="assign_member_id_list"/>		            

								</div>
							</div>
							
							<div class="new_todo_datecontainer">
								<div class="todo_date_picker_container">
								
									<div class="todo_date_picker_icon_area">
										<svg viewBox="0 0 24 24" width="20px" height="20px" class="btn_x_svg"><path d="M11.99,2 C17.52,2 22,6.48 22,12 C22,17.52 17.52,22 11.99,22 C6.47,22 2,17.52 2,12 C2,6.48 6.47,2 11.99,2 Z M12,4 C7.58,4 4,7.58 4,12 C4,16.42 7.58,20 12,20 C16.42,20 20,16.42 20,12 C20,7.58 16.42,4 12,4 Z M12.5,7 L12.5,12.25 L17,14.92 L16.25,16.15 L11,13 L11,7 L12.5,7 Z" class="todo_date_picker_icon_path"></path></svg>
									</div>
									
									<div class="todo_date_picker">
										<div class="todo_date_picker_datecontainer">
											<div>
												<!-- <button id="todo_start_date_picker_btn" class="todo_picker_date_btn" >시작일 추가</button> -->
												<input name="todo_startd" type='text' id="todo_start_date_picker_btn" class="todo_picker_date_btn"  value='시작일 추가'/>
											</div>
											
											<span class="todo_date_picker_devide" style="padding: 0px 10px 0px 6px;">~</span>
											
											<div>
												<!-- <button id="todo_finish_date_picker_btn" class="todo_picker_date_btn">완료일 추가</button> -->
												<input name="todo_finishd" type='text' id="todo_finish_date_picker_btn" class="todo_picker_date_btn"  value='완료일 추가'/>
											</div>
										</div>
									</div>
									
								</div>
							</div>
							
							<div class="new_todo_edit_des_container">
								<div class="edit_des_iconcontainer">
									<svg viewBox="0 0 24 24" width="21px" height="21px" class="btn_x_svg"><path d="M5 1h13.6a2 2 0 0 1 2 2v18a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zm.467 1.467a1 1 0 0 0-1 1v17.066a1 1 0 0 0 1 1h12.666a1 1 0 0 0 1-1V3.467a1 1 0 0 0-1-1H5.467zm1.444 8.555V9.556h9.778v1.466H6.91zm0-3.666V5.889h9.778v1.467H6.91z" class="btn_x_path"></path></svg>
								</div>
								
								<textarea name="todo_des" maxlength="501" placeholder="할 일 설명 추가" spellcheck="false" class="edit_des_textarea"></textarea>
							</div>
							
							<footer class="new_todo_footer">
								<div class="new_todo_footercell"  style="margin-left: 300px;">
									<div class="new_todo_projectdropdowncontainer">
										<div>
											<div class="new_todo_projectdropdowncontainer1">
												<div class="new_todo_projectdropdowncontainer2">
													<div class="new_todo_projectdropdown_componet">
														<div class="new_todo_projectdropdown_workspace">
															<span>협업공간 선택</span>
															<svg viewBox="0 0 24 24" width="16px" height="16px" class="btn_x_svg" style="margin-left: 8px; margin-right: 8px;"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z" style="fill: rgb(217, 173, 43)" id="workspace_container_arrow" ></path></svg>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
	
									<button type="submit" color="primary" class="new_todo_save_btn">저장</button>
								</div>
							</footer>
						</div>
						

						
						<input class="input_workspace_id_Todo_modal" name="workspace_id" type="hidden" />
					</div>
				</div>
				
			</div>
		</div>
	</div>
	</form>
	
	<div id="div_background"></div>
	
<!-- 	<div> -->
	
	</div>
	
	
	<div class="workspace_list">
		<ul class="left-bar icon_color" >
			<li style="margin-bottom: 0px;">공간 검색</li>
			<%
				ArrayList<ModalWorkspaceListDto> mWList = (ArrayList<ModalWorkspaceListDto>)request.getAttribute("mWList");
				for(int i = 0; i<mWList.size(); i++){
			%>
			<li>
				<svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg>
				<span><%=mWList.get(i).getWorkspace_name() %></span>
				<div style="display: none;" class="workspace_id_Todo_modal"><%=mWList.get(i).getWorkspace_id() %></div>
			</li>
			<%
				}
			%>
		</ul>
	</div>
	
	
</body>
</html>