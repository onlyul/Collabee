<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>corporation</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	<script src="js/jquery-3.6.0.min.js"></script>
	<link href="css/0corporation1.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/0corporation1.js?ver=1"></script>
</head>
<body>
	<header>
	<div>
	<button class="btn1 samsung" onClick=""></button><a href=""><h1>샘숭</h1></a>
	</div>
	<div class="menu">
		<div class="menu_item"><a class="menu_item1" href="0help1.jsp" target="_blank">도움말</a></div>
		<div class="menu_item"><a class="menu_item1" href="Controller?command=settingPrice&loginId=4">가격 안내</a></div>
		<div class="menu_item"><a href="Controller?command=Home" class="direct">콜라비로 바로가기</a></div>
	</div>
	</header>
	
	<main>
	<div class="sidebar">
	<div class="profile">
	<button class="btn2 yr" onClick="location.href='Controller?command=option1'"></button>
	<div><a class="nickname" href="Controller?command=option1" style="padding-left:10px;">유라짱짱<br/>
	<span style="color: rgb(204, 153, 0); white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-size: 12px;">샘숭</span></a></div>
	<div style="padding: 10px;">
	</div>
	</div>
	
	<div>
	<ul>
		<li><p class="title">메뉴</p></li>
		<li class="chosen"><a href="0corporation1.jsp">
		<svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M12 7V3H2v18h20V7H12zM6 19H4v-2h2v2zm0-4H4v-2h2v2zm0-4H4V9h2v2zm0-4H4V5h2v2zm4 12H8v-2h2v2zm0-4H8v-2h2v2zm0-4H8V9h2v2zm0-4H8V5h2v2zm10 12h-8v-2h2v-2h-2v-2h2v-2h-2V9h8v10zm-2-8h-2v2h2v-2zm0 4h-2v2h2v-2z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
		회사 정보</a></li>
		<li><a href="0corporation2.jsp">
		<svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M16 11c1.66 0 2.99-1.34 2.99-3S17.66 5 16 5c-1.66 0-3 1.34-3 3s1.34 3 3 3zm-8 0c1.66 0 2.99-1.34 2.99-3S9.66 5 8 5C6.34 5 5 6.34 5 8s1.34 3 3 3zm0 2c-2.33 0-7 1.17-7 3.5V19h14v-2.5c0-2.33-4.67-3.5-7-3.5zm8 0c-.29 0-.62.02-.97.05 1.16.84 1.97 1.97 1.97 3.45V19h6v-2.5c0-2.33-4.67-3.5-7-3.5z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
		동료 관리</a></li>
		<li><a href="0corporation3.jsp">
		<svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
		협업공간 관리</a></li>
		<li><a href="0corporation4.jsp">
		<svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1.41 16.09V20h-2.67v-1.93c-1.71-.36-3.16-1.46-3.27-3.4h1.96c.1 1.05.82 1.87 2.65 1.87 1.96 0 2.4-.98 2.4-1.59 0-.83-.44-1.61-2.67-2.14-2.48-.6-4.18-1.62-4.18-3.67 0-1.72 1.39-2.84 3.11-3.21V4h2.67v1.95c1.86.45 2.79 1.86 2.85 3.39H14.3c-.05-1.11-.64-1.87-2.22-1.87-1.5 0-2.4.68-2.4 1.64 0 .84.65 1.39 2.67 1.91s4.18 1.39 4.18 3.91c-.01 1.83-1.38 2.83-3.12 3.16z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
		결제</a></li>
		<li><p class="title">보안</p></li>
		<li><a href="0corporation5.jsp">
		<svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M20,19 L20,21 L4,21 L4,19 L20,19 Z M15,3.1 C15.4970563,3.1 15.9,3.50294373 15.9,4 L15.9,4 L15.9,9.1 L19,9.1 C19.7653683,9.1 20.1660329,9.98330088 19.7077601,10.5567165 L19.7077601,10.5567165 L19.6363961,10.6363961 L12.6363961,17.6363961 C12.2849242,17.987868 11.7150758,17.987868 11.3636039,17.6363961 L11.3636039,17.6363961 L4.3636039,10.6363961 C3.79663552,10.0694277 4.19818563,9.1 5,9.1 L5,9.1 L8.1,9.1 L8.1,4 C8.1,3.54117882 8.44333667,3.16254822 8.88710591,3.10701228 L8.88710591,3.10701228 L9,3.1 Z M14.1,4.9 L9.9,4.9 L9.9,10 C9.9,10.4588212 9.55666333,10.8374518 9.11289409,10.8929877 L9.11289409,10.8929877 L9,10.9 L7.173,10.9 L12,15.727 L16.826,10.9 L15,10.9 C14.5411788,10.9 14.1625482,10.5566633 14.1070123,10.1128941 L14.1070123,10.1128941 L14.1,10 L14.1,4.9 Z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
		파일 다운로드 이력</a></li>
	</ul>
	<div class="foot">개인정보 처리방침<br/>
		이용 약관<br/>
		collabee Inc. © 2022</div>
	</div>
	</div>
	
	<div class="section1">
	<div class="container1">
	<div class="square">
	<input type="file" style="display: none;" id="cor_picture"/>
	<button class="btn3">
		<span class="spam">변경</span>
	</button>
	</div>
	<div class="container2_0">
	<div class="h2">샘숭</div>
	<div class="container2">
	<span>Free</span>
	<hr style="margin-left: 10px; margin-right: 15px; margin-top: 0px; height: 2vh; width:.1vw; border-width: 0;" color="lightgray" noshade>
	<svg xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#888888" d="M16 11c1.66 0 2.99-1.34 2.99-3S17.66 5 16 5c-1.66 0-3 1.34-3 3s1.34 3 3 3zm-8 0c1.66 0 2.99-1.34 2.99-3S9.66 5 8 5C6.34 5 5 6.34 5 8s1.34 3 3 3zm0 2c-2.33 0-7 1.17-7 3.5V19h14v-2.5c0-2.33-4.67-3.5-7-3.5zm8 0c-.29 0-.62.02-.97.05 1.16.84 1.97 1.97 1.97 3.45V19h6v-2.5c0-2.33-4.67-3.5-7-3.5z"></path></g></svg>
	<span style="margin-left: 5px;">4명 이용 중</span>
	</div>
	<div class="container2_1">
	<button class="btn4">요금제 변경하기</button>
	<button class="btn4" style="margin-left: 10px;">동료 초대하기</button>
	</div>
	</div>
	</div>
	
	</div>
	<div class="section2">
	<div class="section2_1">
		<form style="float: left">
		<label>회사 이름</label><br/>
		<input id="name" type="text" minlength="1" maxlength="100" placeholder="회사 이름을 입력해 주세요." value="샘숭" class="cname">
		</form>
		<div class="btns">
			<button class="btn10_1">취소</button>
			<button class="btn10" id="cor_name_change">수정</button>
		</div>
	</div>
	<div>
	<div class="hidden" id="count0" style="float: left; margin-left: 10px; margin-top: 4px; font-size: 12px; color: rgb(204, 153, 0);">0</div>
	<span class="hidden" id="counter0" style="margin-left: 3px; margin-top: 10px; color: rgb(136, 136, 136); font-size: 12px;">/100</span>
	</div>
	<div style="padding: 10px;">
	</div>
	
	<div>
	<label>회사 규모</label><br/>
	<div style="padding: 5px;">
	</div>
	<select class="selection">
		<option value="1">1~5명</option>
		<option value="2">1~10명</option>
		<option value="3">1~50명</option>
		<option value="4">1~100명</option>
		<option value="5">1~300명 이상</option>
	</select>
	</div>
	
	<div style="padding: 30px;">
	</div>
	
	<div>
	<label>회사 설명</label><br/>
	<div style="padding: 5px;">
	</div>
	<textarea id="textbox" class="area" rows="3" maxlength="100" placeholder="회사 설명을 입력해 주세요.">샘송설계팀</textarea>
	<div style="margin-top: -5px; margin-left: 10px;">
	<span class="hidden" id="count" style="font-size: 12px; color: rgb(204, 153, 0);">0</span>
	<span class="hidden" id="counter" style="color: rgb(136, 136, 136); font-size: 12px;">/100</span></div>
		<div class="btns" style="float:right; margin-top: -20px;" id="btns1">
			<button class="btn10_1">취소</button>
			<button class="btn10" id="cor_expl_change">수정</button>
		</div>
	</div>
	</div>
	</main>
</body>
</html>