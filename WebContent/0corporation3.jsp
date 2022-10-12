<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>corporation3</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	<script src="js/jquery-3.6.0.min.js"></script>
	<link href="css/0corporation3.css" rel="stylesheet" type="text/css">
	<script src="js/0corporation3.js"></script>
</head>
<body>
<div id="div_background"></div>
	<header>
<div>
<button class="cor1_btn1 samsung" onClick="location.href='0corporation1.jsp'"></button><a href=""><h1>샘숭</h1></a>
</div>
<div class="cor_menu">
	<div class="menu_item"><a class="menu_item1" href="0help1.jsp" target="_blank">도움말</a></div>
	<div class="menu_item"><a class="menu_item1" href="Controller?command=settingPrice&loginId=4">가격 안내</a></div>
	<div class="menu_item"><a href="Controller?command=Home" class="direct">콜라비로 바로가기</a></div>
</div>
</header>
	<main>
		<div class="selection divToggle" id="divToggle1">
			<button class="menubar">기본 협업공간 설정
			<svg viewBox="0 0 24 24" width="20px" height="20px" class="menubar_svg1"><path d="M11.992 2C16.416 2 20 5.584 20 10a7.966 7.966 0 0 1-2 5.288V22l-6-2-6 2v-6.706A7.975 7.975 0 0 1 4 10c0-4.416 3.576-8 7.992-8zM16.6 20.058v-3.514A7.976 7.976 0 0 1 11.992 18a7.95 7.95 0 0 1-4.593-1.452l.001 3.51 4.6-1.534 4.6 1.534v-3.514 3.514zM11.992 3.4A6.596 6.596 0 0 0 5.4 10c0 3.645 2.951 6.6 6.592 6.6A6.605 6.605 0 0 0 18.6 10c0-3.644-2.958-6.6-6.608-6.6zm.003 2.1A4.503 4.503 0 0 1 16.5 10c0 2.484-2.016 4.5-4.505 4.5A4.498 4.498 0 0 1 7.5 10c0-2.484 2.011-4.5 4.495-4.5zm0 .9A3.597 3.597 0 0 0 8.4 10c0 1.988 1.61 3.6 3.595 3.6A3.603 3.603 0 0 0 15.6 10c0-1.987-1.614-3.6-3.605-3.6z" color="#D9AD2B"></path></svg>
			</button>
		</div>
	<div class="sidebar">
	<div class="profile">
	<button class="cor1_btn2 yr" onClick="location.href='Controller?command=option1'"></button>
	<div><a class="nickname" href="Controller?command=option1" style="padding-left:10px;">유라짱짱<br/>
	<span style="color: rgb(204, 153, 0); white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-size: 12px;">샘숭</span></a></div>
	<div style="padding: 10px;">
	</div>
	</div>
	
	<div>
	<ul>
		<li><p class="cor1_title">메뉴</p></li>
		<li><a href="0corporation1.jsp">
		<svg viewBox="0 0 24 24" width="16px" height="16px" ><path d="M12 7V3H2v18h20V7H12zM6 19H4v-2h2v2zm0-4H4v-2h2v2zm0-4H4V9h2v2zm0-4H4V5h2v2zm4 12H8v-2h2v2zm0-4H8v-2h2v2zm0-4H8V9h2v2zm0-4H8V5h2v2zm10 12h-8v-2h2v-2h-2v-2h2v-2h-2V9h8v10zm-2-8h-2v2h2v-2zm0 4h-2v2h2v-2z" ></path></svg>
		회사 정보</a></li>
		<li><a href="0corporation2.jsp">
		<svg viewBox="0 0 24 24" width="16px" height="16px" ><path d="M16 11c1.66 0 2.99-1.34 2.99-3S17.66 5 16 5c-1.66 0-3 1.34-3 3s1.34 3 3 3zm-8 0c1.66 0 2.99-1.34 2.99-3S9.66 5 8 5C6.34 5 5 6.34 5 8s1.34 3 3 3zm0 2c-2.33 0-7 1.17-7 3.5V19h14v-2.5c0-2.33-4.67-3.5-7-3.5zm8 0c-.29 0-.62.02-.97.05 1.16.84 1.97 1.97 1.97 3.45V19h6v-2.5c0-2.33-4.67-3.5-7-3.5z"></path></svg>
		동료 관리</a></li>
		<li class="chosen"><a href="0corporation3.jsp">
		<svg viewBox="0 0 24 24" width="16px" height="16px" ><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg>
		협업공간 관리</a></li>
		<li><a href="0corporation4.jsp">
		<svg viewBox="0 0 24 24" width="16px" height="16px" ><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1.41 16.09V20h-2.67v-1.93c-1.71-.36-3.16-1.46-3.27-3.4h1.96c.1 1.05.82 1.87 2.65 1.87 1.96 0 2.4-.98 2.4-1.59 0-.83-.44-1.61-2.67-2.14-2.48-.6-4.18-1.62-4.18-3.67 0-1.72 1.39-2.84 3.11-3.21V4h2.67v1.95c1.86.45 2.79 1.86 2.85 3.39H14.3c-.05-1.11-.64-1.87-2.22-1.87-1.5 0-2.4.68-2.4 1.64 0 .84.65 1.39 2.67 1.91s4.18 1.39 4.18 3.91c-.01 1.83-1.38 2.83-3.12 3.16z"></path></svg>
		결제</a></li>
		<li><p class="cor1_title">보안</p></li>
		<li><a href="0corporation5.jsp">
		<svg viewBox="0 0 24 24" width="16px" height="16px" ><path d="M20,19 L20,21 L4,21 L4,19 L20,19 Z M15,3.1 C15.4970563,3.1 15.9,3.50294373 15.9,4 L15.9,4 L15.9,9.1 L19,9.1 C19.7653683,9.1 20.1660329,9.98330088 19.7077601,10.5567165 L19.7077601,10.5567165 L19.6363961,10.6363961 L12.6363961,17.6363961 C12.2849242,17.987868 11.7150758,17.987868 11.3636039,17.6363961 L11.3636039,17.6363961 L4.3636039,10.6363961 C3.79663552,10.0694277 4.19818563,9.1 5,9.1 L5,9.1 L8.1,9.1 L8.1,4 C8.1,3.54117882 8.44333667,3.16254822 8.88710591,3.10701228 L8.88710591,3.10701228 L9,3.1 Z M14.1,4.9 L9.9,4.9 L9.9,10 C9.9,10.4588212 9.55666333,10.8374518 9.11289409,10.8929877 L9.11289409,10.8929877 L9,10.9 L7.173,10.9 L12,15.727 L16.826,10.9 L15,10.9 C14.5411788,10.9 14.1625482,10.5566633 14.1070123,10.1128941 L14.1070123,10.1128941 L14.1,10 L14.1,4.9 Z"></path></svg>
		파일 다운로드 이력</a></li>
	</ul>
	<div class="foot">개인정보 처리방침<br/>
		이용 약관<br/>
		collabee Inc. © 2022</div>
	</div>
	</div>
	<div class="section1">
	<div class="top">
	<div style="float: left">
	<h2>협업공간 관리</h2>
	<p class="expl">회사에 소속된 협업공간을 관리할 수 있습니다.</p>
	</div>
	</div>
	</div>
	<div class="section2">
	<input type="text" placeholder="이름 또는 이메일 주소로 동료 검색" autocomplete="off" class="search"/>
	<table>
		<tr>
			<th style="width: 20px;"></th>
			<th style="width: 270px;">이름</th>
			<th style="width: 120px;">관리자</th>
			<th style="width: 110px;">진행 상태</th>
			<th style="width: 70px;">멤버</th>
			<th style="width: 100px;">생성일</th>
			<th style="width: 36px;"></th>
		</tr>
			
		<tr>
			<td><svg fill="rgb(136, 136, 136)" viewBox="0 0 24 24" width="17px" height="17px" class="Beecon__Svg-sc-3x6pq4-0 ePKcza beecon"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z" color="#888888"></path></svg></td>
			<td>[샘플] 서비스 배포(웹/모바일)</td>
			<td>깡</td>
			<td>진행 중</td>
			<td>1</td>
			<td>2022.5.24</td>
			<td>
			<button class="btn3">
			<svg viewBox="0 0 24 24" width="22px" height="22px"><path d="M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path></svg>
			</button>
			</td>
		</tr>
		
		<tr>
			<td><svg fill="rgb(136, 136, 136)" viewBox="0 0 24 24" width="17px" height="17px" class="Beecon__Svg-sc-3x6pq4-0 ePKcza beecon"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z" color="#888888"></path></svg></td>
			<td>[샘플] 경영지원팀</td>
			<td>유라짱짱</td>
			<td>진행 중</td>
			<td>1</td>
			<td>2022.5.19</td>
			<td>
			<button class="btn3">
			<svg viewBox="0 0 24 24" width="22px" height="22px"><path d="M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path></svg>
			</button>
			</td>
		</tr>
		
		<tr>
			<td><svg fill="rgb(136, 136, 136)" viewBox="0 0 24 24" width="17px" height="17px" class="Beecon__Svg-sc-3x6pq4-0 ePKcza beecon"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z" color="#888888"></path></svg></td>
			<td>연봉111조</td>
			<td>강지현</td>
			<td>진행 중</td>
			<td>3</td>
			<td>2022.4.11</td>
			<td>
			<button class="btn3">
			<svg viewBox="0 0 24 24" width="22px" height="22px"><path d="M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path></svg>
			</button>
			</td>
		</tr>
		
		<tr>
			<td><svg fill="rgb(136, 136, 136)" viewBox="0 0 24 24" width="17px" height="17px" class="Beecon__Svg-sc-3x6pq4-0 ePKcza beecon"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z" color="#888888"></path></svg></td>
			<td>프로젝트</td>
			<td>정민 외 2명</td>
			<td>진행 중</td>
			<td>4</td>
			<td>2022.4.6</td>
			<td>
			<button class="btn3">
			<svg viewBox="0 0 24 24" width="22px" height="22px"><path d="M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path></svg>
			</button>
			</td>
		</tr>
		
		<tr>
			<td><svg fill="rgb(136, 136, 136)" viewBox="0 0 24 24" width="17px" height="17px" class="Beecon__Svg-sc-3x6pq4-0 ePKcza beecon"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z" color="#888888"></path></svg></td>
			<td>[샘플] 상품기획팀</td>
			<td>강태안</td>
			<td>진행 중</td>
			<td>1</td>
			<td>2022.4.6</td>
			<td>
			<button class="btn3">
			<svg viewBox="0 0 24 24" width="22px" height="22px"><path d="M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path></svg>
			</button>
			</td>
		</tr>
	</table>
	</div>
	</main>
</body>
</html>