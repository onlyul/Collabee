<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int loginId = (Integer)session.getAttribute("loginId");
	int corporation_id = (Integer)session.getAttribute("corporation_id");
	ArrayList<Option2CheckedDto> list1 = (ArrayList<Option2CheckedDto>)request.getAttribute("list1");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가격 및 결제</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
   	<link href="css/setting_price.css" rel="stylesheet" type="text/css">
   	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
   	<style>
   	.home_option_ul {
  		padding: 13px;
  	}
   	</style>
    <script>
    var loginId = <%=loginId%>;  
    
        $(function(){
        	$(".thead_bnt_style2").click(function(){
                $("#payment_b").css({visibility:"visible",opacity:1});
            });
        	
            $(".thead_bnt_style3").click(function(){
                var modal = $(this).attr("class");
                $("#payment_e").css({visibility:"visible",opacity:1});
            });
            
            //기본기능 열고 접기
            $("#price_fold").click(function(){
                var text = $(this).text();
                if(text=="자세히 보기"){
                    $("#price_fold span").html("간략히 보기");
                    $("#price_fold svg").css("transform", "rotate(0deg)")
                } else {
                    $("#price_fold span").html("자세히 보기");
                    $("#price_fold svg").css("transform", "rotate(180deg)")
                }
                $("tr.non").toggle();
            });
            //검색창 hover
            $(".searchbar").hover(function(){ 
                $(".searchbar::placeholder").css("color","rgb(136,136,136)");
                $(".search_icon svg").css("fill","rgb(136,136,136)");
            }, function(){
                $(".searchbar::placeholder").css("color", "rgb(225,225,225)");
                $(".search_icon svg").css("fill", "rgb(225,225,225)");
            });

            //문서작성클릭
            $(".posting_bnt").click(function(){
            	$.ajax({   //-->화면 안에서 변할때 사용. 화면 전환해주지 않음.
    				type:"post",
    				url:"Controller?command=getPrivateId", //프라이빗 공간 찾기
    				data:{
    					"loginId":<%=loginId%>
    				},
    				datatype:"json",
    				success:function(data){
    					location.href="Controller?command=writedocument&loginId=<%=loginId%>&workspaceId="+data.workspaceId;
    				},
    				error:function(r,s,e){
    					alert("error!");
    				}
    			}); 		
            });

            //정기결제 가격 변동
            $("div.bnt1_style").click(function(){
                var text = $(this).css("transform");
                if(text.indexOf(16)>0) {
                    $(this).css("transform", "matrix(1, 0, 0, 1, 2, 0)");
                    $("#price_container2 thead tr td:nth-child(3) .font_weight:nth-child(2)").html("$6");
                    $("#price_container2 thead tr td:nth-child(4) .font_weight:nth-child(2)").html("$12");
                } else if(text.indexOf(2)>0){
                    $(this).css("transform","matrix(1, 0, 0, 1, 16, 0)");
                    $("#price_container2 thead tr td:nth-child(3) .font_weight:nth-child(2)").html("$5");
                    $("#price_container2 thead tr td:nth-child(4) .font_weight:nth-child(2)").html("$10");
                }
            });
            
            //가격정보 버튼 클릭시 페이지 이동(해야됨)
            // $(".thead_bnt_style2").click(function(){
            //     location.href="";
            // });
            // $(".thead_bnt_style3").click(function(){
            //     location.href="";
            // });
            $(".thead_bnt_style4, .price_ask, .price_messenger").click(function(){ 
                alert("서비스 준비중 입니다.");
            });
            
			//검색
    		$(".searchbar").keypress(function(e){
        	    if(e.keyCode == 13){
        			var search = $(this).val();
        		    var member_id = <%=loginId%>;
        		    location.href="Controller?command=SearchP1&search="+search+"&member_id="+member_id;
        		}
    		});
			
			
			
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
<body>
<%@ include file="WEB-INF/include/include_PartnerModal.jspf" %>
<%@ include file="WEB-INF/include/include_NewWorkspaceModal.jspf"%>
<div style="z-index:20; position:absolute;">
<%@ include file="payment.jsp"%>
</div>
<div id="setting_price">

<%@ include file="HomeSidebar2.jspf" %>
    
<section id="price_container1"> 
    <header>
		<div class="setting_top">
            <div class="title">
            <div><h1>설정</h1></div>
			<div>
                <div class="mastersearchbar">
                    <div class="search_icon" class="bnt_base"><svg class="micro" viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
                    <input type ="text" class=searchbar placeholder="검색"/>
                    <button class="posting_bnt">
                        <svg viewBox="0 0 24 24" width="13px" height="13px" ><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="posting_icon" ></path></svg>
                        <span style="color:rgb(255,255,255)">문서 작성</span>
                    </button>
                </div>
        	</div>
        </div>
    	<div class="topright">
    		<%@ include file="homehead11.jspf" %>
    	</div>	
        </div>
    	
    	<div class="header_mid">
    		<nav class="sort">
    			<a class="m" href="Controller?command=option1">내 정보</a>
    			<a class="m" href="Controller?command=option2">알림</a>
    			<a class="m" href="Controller?command=option4">파트너 관리</a>
    			<a class="m" id="ready1">외부 서비스</a>
    			<a class="m selected" href="">가격 및 결제</a>
    			<a class="m" href="Controller?command=option3">업데이트</a>
    			<a class="m" id="ready2">Webhook &#946;</a>
    		</nav>
    	</div>
	</header>
<div>   
    <div id="price_container2">
    <div id="price_head">
        <div>
            <span style="font-size:18px;" class="font_weight">가격정보</span>
            <p style="color:rgb(136, 136, 136); font-size:12px;">한 페이지 안에서 할 일, 파일, 의사결정, 일정 및 커뮤니케이션을 모두 담아 이슈를 해결해 보세요.
                <br/>동료들과 함께 무료로 시작해보세요.</p>
        </div>
        <div style="margin:30px; display:flex;">
            <span id="price_monthly">월간 정기 결제</span>
            <label for="price_bnt1" id="price_bnt1_label"><input type="checkbox" id="price_bnt1"><div class="bnt1_style"></div></label>
            <span id="price_daily">일간 정기 결제</span>
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <td class="price_table1"></td>
                <td class="price_table1 price_table6">
                    <div class="font_weight price_thead_title price_thead_title">Free</div>
                    <div class="font_weight" style="font-size: 40px;">$0</div>
                    <button class="price_thead_bnt thead_bnt_style1">사용 중</button>
                </td>
                <td class="price_table1 price_table6">
                    <div class="font_weight price_thead_title" style="background-color: rgb(250, 243, 223); color: rgb(204, 153, 0);">Business</div>
                    <div class="font_weight" style="font-size: 40px;">$6</div>
                    <label for="">월간<br/>1인 기준 이용요금</label>
                    <button class="price_thead_bnt thead_bnt_style2">변경하기</button>
                </td>
                <td class="price_table1 price_table6">
                    <div class="font_weight price_thead_title" style="background-color: rgb(229, 241, 238); color: rgb(0, 115, 94);">Enterprise</div>
                    <div class="font_weight" style="font-size: 40px;">$12</div>
                    <label for="">월간<br/>1인 기준 이용요금</label>
                    <button class="price_thead_bnt thead_bnt_style3">변경하기</button>

                </td>
                <td class="price_table1">
                    <div class="font_weight price_thead_title" style="background-color: rgb(229, 241, 238); color: rgb(0, 115, 94);">구축형</div>
                    <div><svg width="53px" height="53px" viewBox="0 0 56 56"><path d="M7 48V21a3 3 0 013-3h1v-3c0-2.21 1.79-4 4-4h.5V8.5a1.5 1.5 0 013 0V11h.5c2.21 0 4 1.79 4 4v3h1a3 3 0 013 3v5h4V13.315a3 3 0 014.045-2.813l12 4.457A3.002 3.002 0 0149 17.772V48H7zm17-27.5H10a.5.5 0 00-.492.41L9.5 21v24.5H18V29a3 3 0 013-3h3.5v-5a.5.5 0 00-.41-.492L24 20.5zm11 8H21a.5.5 0 00-.492.41L20.5 29v16.5h15V29a.5.5 0 00-.41-.492L35 28.5zm-1-15.685a.5.5 0 00-.492.41l-.008.09L33.499 26H35a3 3 0 013 3v16.5h8.5V17.772a.5.5 0 00-.246-.431l-.08-.038-12-4.457a.519.519 0 00-.174-.031zM24 31a1 1 0 011 1v8a1 1 0 01-2 0v-8a1 1 0 011-1zm4 0a1 1 0 011 1v8a1 1 0 01-2 0v-8a1 1 0 011-1zm4 0a1 1 0 011 1v8a1 1 0 01-2 0v-8a1 1 0 011-1zM19 13.5h-4a1.5 1.5 0 00-1.493 1.356L13.5 15v3h7v-3a1.5 1.5 0 00-1.356-1.493L19 13.5z" fill="#222" fill-rule="nonzero"></path></svg></div>
                    <label for="">On-premise<br/>Private SaaS</label>
                    <button class="price_thead_bnt thead_bnt_style4">도입문의</button>
                </td>
            </tr>
        </thead>
        
        <tbody>
            <th>
                기본 기능
            </th>
            <th class="price_table6"></th>
            <th class="price_table6"></th>
            <th class="price_table6"></th>
            <th></th>
            <tr>
                <td class="price_table2">알림을 받을 수 있는 협업
                    공간</td>
                <td class="price_table3 price_table6"><span class="font_weight" style="font-size:14px;">3개</span><br/>
                    <span style="color:rgb(134, 134, 134); font-size:13px;">회사 생성 시 공용공간 1개 추가</span></td>
                <td class="price_table3 font_weight price_table6">무제한</td>
                <td class="price_table3 font_weight price_table6">무제한</td>
                <td class="price_table3 font_weight">무제한</td>
            </tr>
            <tr>
                <td class="price_table2">완료된 협업공간</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3">무제한</td>
            </tr>
            <tr>
                <td class="price_table2">1회 업로드 용량</td>
                <td class="price_table3 price_table6">50MB</td>
                <td class="price_table3 price_table6">300MB</td>
                <td class="price_table3 price_table6">500MB</td>
                <td class="price_table3">무제한</td>
            </tr>
            <tr class="non">
                <td class="price_table2">퇴사자 관리</td>
                <td class="price_table3 price_table6">-</td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#d9ad2b" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
            </tr>
            <tr class="non">
                <td class="price_table2">회사/팀 통합 관리 (준비 중)</td>
                <td class="price_table3 price_table6">-</td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#d9ad2b" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
            </tr> 
            <tr class="non">
                <td class="price_table2">협업공간 관리 (준비 중)</td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#d9ad2b" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#d9ad2b" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
            </tr> 
            <tr class="non">
                <td class="price_table2">공용공간 관리 (준비 중)</td>
                <td class="price_table3 price_table6">-</td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#d9ad2b" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
            </tr>
            <tr class="non">
                <td class="price_table2">멤버 수</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3">무제한</td>
            </tr>
            <tr class="non">
                <td class="price_table2">외부 협업자 수</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3">무제한</td>
            </tr>
            <tr class="non">
                <td class="price_table2">CS (1:1 채팅상담)</td>
                <td class="price_table3 price_table6">-</td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#d9ad2b" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
            </tr>
            <tr class="non">
                <td class="price_table2">외부 서비스 연동 (준비 중)</td>
                <td class="price_table3 price_table6">5개</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3">무제한</td>
            </tr>
            <tr class="non">
                <td class="price_table2">이메일 연동 (준비 중)</td>
                <td class="price_table3 price_table6">-</td>
                <td class="price_table3 price_table6">-</td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
            </tr>
        </tbody>
    </table>

    <div style="display: flex; justify-content: center;"><button id="price_fold"><span>자세히 보기</span><svg viewBox="0 0 24 24" width="20px" height="20px" style="transform: rotate(180deg);"><path d="M19 15H5l7-7z" color="#222222"></path></svg></button></div>
       
    <table style="padding-bottom:40px;">
        <th colspan="5">
            부가 서비스 <span style="font-weight:normal;">*월간, 1인 기준 이용요금</span>
        </th>
        <tr>
            <td class="price_table4">대용량 파일 업로드<span class="price_span_style1">$4</span></td>
            <td class="price_table5 price_table6">-</td>
            <td class="price_table5 price_table6">준비 중 <span class="price_ask">문의하기</span></td>
            <td class="price_table5 price_table6">준비 중 <span class="price_ask">문의하기</span></td>
            <td class="price_table5">무제한</td>
        </tr>
        <tr>
            <td class="price_table4">콜라비 메신저 <span class="price_span_style1">$4</span></td>
            <td colspan="4" class="price_table5">*현재 무료로 이용 가능 <button class="price_messenger">콜라비 메신저로 이동<span><svg viewBox="0 0 24 24" width="16px" height="16px"><path fill="rgb(217, 173, 43)" d="M12 4l-1.41 1.41L16.17 11H4v2h12.17l-5.58 5.59L12 20l8-8z" color="#D9AD2B"></path></svg></span></button></td>
        </tr>
        <tr>
            <th colspan="5">
            </th>
        </tr>
    </table>
    </div>
</div>
</section>

</div>
</body>
</html>