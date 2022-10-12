<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>멤버 초대하기</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link href="css/include_InviteMembers.css" rel="stylesheet" type="text/css">
    <script>
    var g_;
    	var workspaceId = <%=request.getParameter("workspaceId")%>;
    	var workspaceName = "<%=request.getParameter("workspaceName")%>";
    	var loginId = 4;
        
    	$(function(){
    	if(loginId==null){
    		alert("loginId null");
    	} else if(workspaceName==null){
    		alert("workspaceName null");
    	} else if(workspaceId==null){
    		alert("workspaceId null");
    	}
        	$.ajax({
				type:"post",
				url:"Controller?command=workspaceInviteList",
        		data:{
        			"workspaceId":workspaceId,
        			"loginId": loginId 
        		},
        		datatype:"json",
        		success:function(data){
        			g_=data;
					$.each(data, function(index, item){ //안그려짐
						var setListMember = "<div class='invite_pt_im'>"
		                    +"<div class='container2_3_im'>"
		                    +"<div class='picture_im'><div class='picture_im_before' style='background-image:url('https://down.collabee.co/userProfile/-1');'></div></div>"
		                    +"<div class='info_im'>"
		                    +"<span class='info_name_im' memberId='"+item.memberId+"'>"+item.name+"</span>"
		                    +"<span class='info_email_im'>"+item.email+"</span>"
		                    +"</div>"
		                    +"</div>"
		                    +"<div class='check_im'><svg viewBox='0 0 24 24' width='20px' height='20px'><path d='M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z' color='#e0ddd9'></path></svg></div>"
		                    +"</div>";
	                    
	                	$("#container2_2_im").append(setListMember);     
					});
					
        		}, error:function(r,s,e){
        			alert("error!");
        		}
        	});
        	
			// 모달 x버튼 누르면 닫히고 초기화
			$(".closing_bnt").click(function(){ 
				$("#invite_member").addClass("hidden");
                $("#search_im").val("");
                    
                $(".invite_pt_im").find(".check_im path").css("fill", "rgb(225, 225, 225)");//체크표시
                $(".picked_member").detach();
                $(".picked_empty").removeClass("none");
                $("#container4_1_im").css({'align-items':"center", 'justify-content':"center"});
                $("#invite_bnt_im").text("멤버 초대하기");
			});
			
			//모달 다른 부분 누르면 
			$(document).click(function(e){
				if($("#invite_member").is(e.target)) {
					$("#invite_member").addClass("hidden");
					$("#search_im").val("");
				
					$("#invite_pt_im").find(".check_im path").css("fill", "rgb(225,225,225)");
					$(".picked_member").detach();
					$(".picked_empty").removeClass("none");
					$("#container4_1_im").css({'align-itens': "center", 'justify-content':"center"});
					$("#invite_bnt_im").text("멤버 초대하기");
			 	}
			});
			
			//멤버초대 누르면
			$("#invite_bnt_im").click(function(){
				$("#invite_member").addClass("hidden");
				$("#search_im").val("");
				
				var listCnt = $("#container4_1_im .picked_member").length;
				if(listCnt>0) { //선택한 멤버 있으면
	    	 		var inviteMember = "";
	    	 		//선택한 멤버 list나 문자열로 넣기
	    	 		$(".picked_member").each(function(index, item) {
	    	 			inviteMember += $(item).attr("memberid")+"_";
	    	 		});
					$.ajax({//mb table 
						type:"post",
						url:"Controller?command=workspaceInviteMember",
						data:{
							"workspaceId" : workspaceId,
							"inviteMember":inviteMember
						},
						datatype:"json",
						success:function(data){
							//선택한 멤버 협업공간에 추가됨  top right멤버 늘어남, 멤버관리에 멤버 추가됨(이건 모달 켜질때)
							var alert_message = $(".alert").html(x+listCnt+"명을 협업공간 멤버로 초대했습니다.");
			                alert_message.fadeIn(function(){
			                    setTimeout(function() {
			                         alert_message.fadeOut(); //3초후에 자동으로 닫힘
			                    }, 2000);
			                });
			              	//글자수에 따라 높이 정하기
				     		var height = alert_message.prop("scrollHeight");
			    	 		alert_message.css("height", height);
						},
						error:function(r,s,e){
							alert("error!");
						}
					});//ajax
				} //if
				$(".invite_pt_im").find(".check_im path").css("fill", "rgb(225, 225, 225)");
				$(".picked_member").detach();
				$(".picked_empty").removeClass("none");
				$("#container4_1_im").css({'align-itens': "center", 'justify-content':"center"});
				$("#invite_bnt_im").text("멤버 초대하기");
			});
        });
    </script>

</head>
<body>
<div id="invite_member" class="modal_im hidden"> <!--전체 화면-->
<div>
    <div id="container1_im" class="modal_content_im"><!--모달창-->
        <header>
            <div>
                <span id="title_im">멤버 초대</span>
                <p id="summary_im">더 많은 사람을 초대하여 원활한 의사소통으로 업무를 효율적으로 처리해보세요.<br/>
                            회사 동료뿐만 아니라 외부 협업자도 파트너로 초대할 수 있습니다.</p>
            </div>
            <svg viewBox="0 0 24 24" width="24px" height="24px" class="closing_bnt"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg>
        </header>
        
        <section id="section1_im">
        <div id="container2_im"><!--왼쪽-->
            <div>파트너 또는 이메일주소로 초대</div>
            <div id="container2_1_im">
                <input type="text" id="search_im" placeholder="이름, 이메일 주소 검색"/>
                <div class="scr">
                <!-- <div class="sec_im">회사 동료</div> -->
                <div id="container2_2_im">
                
                   <!--  <div class="invite_pt_im">
                    <div class="container2_3_im">
                        <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/-1');"></div></div>
                        <div class="info_im">
                            <span class="info_name_im" memberId="3">강지현</span>
                            <span class="info_email_im">chilsdk@gmail.com</span>
                        </div>    
                    </div>
                    <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div>
                    
                   <div class="invite_pt_im">
                        <div class="container2_3_im">
                            <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/-1');"></div></div>
                            <div class="info_im">
                                <span class="info_name_im">강태안</span>
                                <span class="info_email_im">dsafg_2@gmail.com</span>
                            </div>    
                        </div>
                        <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div>
                    <div class="invite_pt_im">
                        <div class="container2_3_im">
                            <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/-1');"></div></div>
                            <div class="info_im">
                                <span class="info_name_im">깡</span>
                                <span class="info_email_im">jrdxv@gmail.com</span>
                            </div>    
                        </div>
                        <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div>
                </div>
                
                <div class="sec_im">외부협업자</div>
                <div id="container3_im">
                    <div class="invite_pt_im">
                    <div class="container2_3_im">
                        <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/-1');"></div></div>
                        <div class="info_im">
                            <span class="info_name_im">김유라</span>
                            <span class="info_email_im">jdsfhbsde@gmail.com</span>
                        </div>
                    </div>
                    <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div>
                     <div class="invite_pt_im">
                        <div class="container2_3_im">
                            <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/-1');"></div></div>
                            <div class="info_im">
                                <span class="info_name_im">김꼬리</span>
                                <span class="info_email_im">udfgsdf7@gmail.com</span>
                            </div>
                        </div>
                        <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div>
                    <div class="invite_pt_im">
                        <div class="container2_3_im">
                            <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/-1');"></div></div>
                            <div class="info_im">
                                <span class="info_name_im">김뭉뭉</span>
                                <span class="info_email_im">hewing@gmail.com</span>
                            </div>
                        </div>
                        <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div> 
                    <div class="invite_pt_im">
                        <div class="container2_3_im">
                            <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/-1');"></div></div>
                            <div class="info_im">
                                <span class="info_name_im">정민</span>
                                <span class="info_email_im">yrxfgsc34@gmail.com</span>
                            </div>
                        </div>
                        <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div>
                    <div class="invite_pt_im">
                        <div class="container2_3_im">
                            <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/-1');"></div></div>
                            <div class="info_im">
                                <span class="info_name_im">이영걸</span>
                                <span class="info_email_im">iojsdnfoa11@gmail.com</span>
                            </div>
                        </div>
                        <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div> -->
                </div>
                </div>
            </div>

            <div>
                <div>
                    <label for="invite_link_im">초대 링크 (가입 시 관리자 승인 필요)</label>
                    <input type="text" id="invite_link_im" value="https://www.collabee.co/invite/GZfjYyBhb0" readonly/><!-- 주소는 sql에서 불러옴 -->
                </div>
            </div>
        </div>
        <div id="container4_im"><!--오른쪽-->
            <div>초대 리스트</div>
            <div id="container4_1_im" class="scr">
                    <div class="picked_empty">
                        <svg width="40px" height="40px" viewBox="0 0 24 24" style="margin-left:77px;"><path fill="#bdbab7" fill-rule="evenodd" d="M20 4c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2l.01-12c0-1.1.89-2 1.99-2h16zM4 6v12h16V6H4zm15 3l-7 4-7-4V7l7 4 7-4v2z"></path></svg>
                        <div class="sec_im">초대 메시지를 보낼 상대를<br/>여기에서 확인할 수 있습니다.</div>
                    </div>
    <script>
        $(function(){
            //클릭하면 초대리스트에 추가
            $(document).on("click", ".invite_pt_im", function(){ //중복 방지함. 
                var name = $(this).find(".info_name_im").text();//선택한 멤버 이름
                var url = $(this).find(".picture_im_before").css("background-image");//프로필사진주소
                var email = $(this).find('.info_email_im').text();  // 선택한 멤버 이메일
                var memberId = $(this).find(".info_name_im").attr("memberid");
                alert(memberId);
                
                $(this).find(".check_im path").css("fill","rgb(51, 132, 108)");//체크표시
                $(".picked_empty").addClass("none");
                $("#container4_1_im").css({'align-items':"flex-start", 'justify-content':"normal"});
                    
                var setPickedMember = 
                "<div email='" + email + "' memberId='"+memberId+"' class='picked_member'>" //email속성 추가
                +"<div class='picked_picture'><div class='picked_picture_before' style='background-image:"+url+"'></div></div>"
                +"<div class='info_name_im'>"+name+"</div>"
                +"<div class='closing_bnt'><svg viewBox='0 0 24 24' width='16px' height='16px' style='transform:translateY(1px); transition: fill 0.2s ease 0s;cursor: pointer;'><path d='M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z'></path></svg></div>"
                +"</div>";
            
                $("#container4_1_im").append(setPickedMember);
               
                var listCnt = $("#container4_1_im .picked_member").length;
                if(listCnt!=0){
                	$("#invite_bnt_im").text(listCnt+"명의 멤버 초대하기").css({cursor:"pointer", opacity:1});
                }
                
            });
            
            //x 누르면 초대리스트에서 삭제 
            $("#invite_member").on("click", ".picked_member .closing_bnt", function(){ //append 뒤에 클릭 이벤트 이 형식으로
                var del = $(this).parent(".picked_member");//선택한 멤버
                var delName = $(this).siblings(".info_name_im").text();
                var delEmail = $(this).parent().attr("email");//선택한 멤버의 이메일속성 찾아옴.
                //var delUrl = $(this).siblings().find(".picked_picture_before").css("background-image");
                $(".invite_pt_im .info_email_im").each(function (index, item) { //제이쿼리의 for-each문. item을 주로 쓰고 index는 필요시에 씀.
                    //파트너 리스트의 각 이메일과 선택한 멤버의 이메일 비교. 동일하면 체크표시 색 바꿈.
                    // $(item).text() -> email
                    if($(item).text() == delEmail) { //$(item)이 이메일을 담고있는 span임. 
                        //체크표시 없애기
                        $(item).parent().parent().parent().find(".check_im path").css("fill", "rgb(225, 225, 225)");
                    }
                });	
                del.detach();//html 지우기

                //초대리스트에 아무도 없으면 invite_empty 뜨기
                var listCnt = $("#container4_1_im .picked_member").length;
                if(listCnt==0){
                    $(".picked_empty").removeClass("none");
                    $("#container4_1_im").css({'align-items':"center", 'justify-content':"center"});
                    $("#invite_bnt_im").text("멤버 초대하기").css({cursor:"not-allowed", opacity:0.6});
                } 
            });
                                
            
            
            
        });
        
        </script>
                        
          </div> 
          <button id="invite_bnt_im">멤버 초대하기</button>
        	
        </div>
        </section>
        <script>
            var x="<svg viewBox='0 0 24 24' width='24px' height='24px' class='closed'><path fill='rgb(255,255,255)' d='M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z'></path></svg>"
       	$(function(){
       		//초대링크 누르면 복사하고 안내창 뜨기
       		$("#invite_link_im").on("click", function(){
       			var url=$("#invite_link_im").select();
       			document.execCommand("copy");
       		  	
       			//3초후에 닫기
       			var alert_message = $(".alert").html(x+"복사되었습니다.");
     			alert_message.fadeIn(function(){
         			setTimeout(function(){
         				alert_message.fadeOut();
         			}, 3000);
     			});
       			
       			//글자수에 따라 높이 정하기
	     		var height = alert_message.prop("scrollHeight");
    	 		alert_message.css("height", height);

    	 		//안내창 x누르면 닫기
	       		$(".closed").on("click",function(){
	       			alert_message.fadeOut();
	       		});
       		});
       	});
        </script>
    </div>
</div>
    </div>
        <div class="alert"></div>	
</body>
</html>