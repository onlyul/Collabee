<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<style>
	* {
		box-sizing: border-box;
		margin: 0;
   		padding: 0;
   		border: 0;
   		outline: 0;
		font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
	}
	body{
		font-size: 13px;
	}
	button{
		border: none;
	    box-sizing: border-box;
	    font-size: 12px;
	    outline: 0;
	}
	a{
		text-decoration: none;
		color: black;
	}
	.modal-backdrop {
    	background-color: rgba(0,0,0,.86);
    	height: 100%;
	    width: 100%;
	    position: fixed;
	    top: 0;
	    left: 0;
	    position: absolute;
	    z-index: 100;
	}
	.mini_dm2_layout{
		position: fixed;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%,-50%);
	    background-color: #fff;
	    border-radius: 5px;
	    border: 1px solid #777;
	}
	.mini_dm2_layout2{
		display: flex;
    	flex-direction: column;
	    position: relative;
	    margin: auto;
	    z-index: 110;
	    width: 580px;
	    height: 680px;
	    background-color: #fff;
	    border-radius: 4px;
	    font-size: 14px;
	}
	.mini_x{
		position: absolute;
	    top: -7px;
	    right: -43px;
	}
	.mini_x_btn{
		min-width: inherit;
	    min-height: inherit;
	    padding-left: 0px;
	    padding-right: 0px;
	    transition: fill 0.2s ease 0s;
	    cursor: pointer;
	    pointer-events: auto;
	    width: auto;
	    background-color: transparent;
	    text-decoration: none;
	}
	.mini_x_btn_svg{
		display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    transition: fill 0.2s ease 0s;
	    fill: rgb(255, 255, 255);
	}
	.mini_header{
		display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
	    margin: 26px 24px 14px;
	    flex: 0 1 auto;
	}
	.mini_header2{
		flex: 1 1 0%;
	    max-width: 430px;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    position: relative;
	}
	.mini_header_wname{
		max-width: 160px;
	    font-size: 12px;
	    font-weight: bold;
	    line-height: 1.2;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
	    color: rgb(51, 132, 108);
	    padding-right: 6px;
	    transition: color 0.2s ease 0s;
	}
	.mini_header_document{
		width: calc(100% - 160px);
	    font-size: 12px;
	    font-weight: bold;
	    color: rgb(136, 136, 136);
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
	    line-height: 1.2;
	}
	.mini_header3{
		display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    position: relative;
	}
	.mini_header3_btn{
		position: relative;
	    width: 24px;
	    height: 24px;
	    margin-right: 8px;
	    background-color: transparent;
	    cursor: pointer;
	}
	.mini_header3_svg{
		display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgb(117, 114, 111);
	}
	.mini_header3_div{
		position: relative;
	}
	.mini_header3_btn2{
		position: relative;
	    width: 24px;
	    height: 24px;
	    background-color: transparent;
	    cursor: pointer;
	}
	.mini_header3_svg2{
	    display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgb(117, 114, 111);
	}
	.mini_main{
		position: relative;
	    flex: 1 1 auto;
	    padding-left: 20px;
	    height: 572px;
	    overflow-y: auto;
	    padding-bottom: 20px;
	}
	.mini_main_div1{
		display: flex;
	    flex-direction: row;
	    margin-right: 10px;
	}
	.mini_main_svg1{
	    margin-right: 8px;
	    display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgb(193, 193, 193);
	}
	.mini_main_textarea{
		overflow: hidden;
	    overflow-wrap: break-word;
	    height: 32px;
	    display: block;
	    width: 100%;
	    padding-bottom: 0px;
	    padding-left: 0px;
	    padding-right: 10px;
	    border: 0px;
	    cursor: text;
	    color: rgb(34, 34, 34);
	    line-height: 1.45;
	    transition: height 0.2s ease 0s;
	    will-change: font-size, height;
	    background-color: rgb(255, 255, 255);
	    font-size: 22px;
	    outline: none !important;
	    resize: none;
	}
	.mini_main_div2{
		display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    padding-top: 4px;
	    padding-bottom: 36px;
	    padding-left: 35px;
	    margin-right: 20px;
	    border-bottom: 1px solid rgb(225, 225, 225);
	}
	.mini_main_div2_writerName{
		position: relative;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    flex: 0 1 auto;
	    min-width: 50px;
	    height: 32px;
	    border: 1px solid transparent;
	    border-radius: 18px;
	    padding-left: 6px;
	    padding-right: 10px;
	    cursor: pointer;
	    background-color: rgb(242, 242, 242);
	}
	.mini_main_div2_btn{
		flex-shrink: 0;
	    position: relative;
	    width: 20px;
	    height: 20px;
	    border-radius: 50%;
	    padding: 1px;
	    background-color: rgba(0, 0, 0, 0.1);
	    content: "";
	    transition: border-color 0.3s ease 0s;
	    cursor: pointer;
	}
	.mini_main_div2_btn::after{
		position: absolute;
	    display: block;
	    top: 0px;
	    left: 0px;
	    width: 17px;
	    height: 17px;
	    border-radius: 50%;
	    content: "";
	    border: 2px solid rgba(0, 0, 0, 0);
	    transition: border-color 0.3s ease 0s;
	}
	.mini_main_div2_btn:hover::after{
		border-color: rgb(217, 173, 43);
	}
	.mini_main_div2_span{
		font-size: 15px;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
	    color: rgb(34, 34, 34);
	    padding-left: 4px;
	}
	.mini_main_date{
		display: block;
	    border-left: 1px solid rgb(193, 193, 193);
	    padding-left: 12px;
	    margin-left: 12px;
	    margin-right: 12px;
	    font-size: 14px;
	    color: rgb(136, 136, 136);
	}
	.mini_main_div3{
		display: flex;
	    flex-direction: column;
	    padding-right: 20px;
	}
	.mini_main_dm{
		padding-top: 20px;
	    padding-bottom: 20px;
	}
	.mini_main_dm2{
		display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    margin-left: 5px;
	}
	.mini_main_dm2_svg{
	    display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgb(193, 193, 193);
	}
	.mini_main_dm3{
		display: inline-block;
	    padding-left: 12px;
	    padding-right: 12px;
	    font-size: 14px;
	    font-weight: bold;
	    color: rgb(34, 34, 34);
	}
	.mini_main_dm4{
		display: flex;
	    flex-direction: row;
	    cursor: pointer;
	    align-items: center;
	}
	.mini_main_dm5{
		display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    margin-top: 10px;
	    margin-left: 34px;
	    font-size: 14px;
	    color: rgb(34, 34, 34);
	}
	.mini_main_dm5_btn{
		font-size: 14px;
	    margin-left: 24px;
	    padding-top: 5px;
	    padding-bottom: 5px;
	    line-height: 1.5;
	    background-color: transparent;
	    cursor: pointer;
	    transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
	    color: rgb(136, 136, 136);
	    pointer-events: auto;
	}
	.mini_main_dm5_btn2{
		font-size: 14px;
	    margin-left: 24px;
	    padding-top: 5px;
	    padding-bottom: 5px;
	    background-color: transparent;
	    cursor: pointer;
	    transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
	    color: rgb(204, 153, 0);
	    pointer-events: auto;
	}
	.mini_more{
		border-top: 1px solid rgb(225, 225, 225);
	}
	.mini_more_btn{
		margin-top: 20px;
	    margin-left: 35px;
	    background-color: white;
	    cursor: pointer;
	    font-size: 14px;
	    font-weight: bold;
	    line-height: 1.4;
	    color: rgb(136, 136, 136);
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    transition: color 0.2s ease 0s, fill 0.2s ease 0s;
	}
	.mini_more_btn_svg{
	    margin-left: 6px;
	    fill: rgb(136, 136, 136);
	}
	.mini_more_div{
		min-height: 0px;
	    height: auto;
	    transition-duration: 300ms;
	}
	.decisionDetail{
		padding-top: 20px;
	    padding-bottom: 20px;
	}
	.decisionDetail_row1{
		display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    margin-left: 5px;
	}
	.decisionDetail_svg1{
		display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	}
	.decisionDetail1{
		display: inline-block;
	    padding-left: 12px;
	    padding-right: 12px;
	    font-size: 14px;
	    font-weight: bold;
	}
	.decisionDetail_row2{
		display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    margin-top: 10px;
	    margin-left: 34px;
	    font-size: 14px;
	    color: rgb(34, 34, 34);
	}
	.decisionDetail2{
		display: block;
	    margin-right: 12px;
	    font-size: 14px;
	    color: rgb(136, 136, 136);
	    padding-left: 0px;
	    margin-left: 0px;
	    border-left: none;
	}
	</style>
</head>
<body>
<div class="modal-backdrop">
	<div class="mini_dm2_layout">
		<div class="mini_x">
			<button class="mini_x_btn">
			<svg viewBox="0 0 24 24" width="35px" height="35px" class="mini_x_btn_svg"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg>
			</button>
		</div>
		<div class="mini_dm2_layout2">
			<input type="file" class="mini_file" style="display: none;"/>
			<header class="mini_header">
				<div class="mini_header2">
					<a class="mini_header_wname" href="">프로젝트</a>
					<a class="mini_header_document">의사</a>
				</div>
				<div class="mini_header3">
					<button class="mini_header3_btn">
						<svg viewBox="0 0 24 24" width="20px" height="20px" class="mini_header3_svg" title="파일 추가"><path d="M16.5 6v11.5c0 2.21-1.79 4-4 4s-4-1.79-4-4V5a2.5 2.5 0 0 1 5 0v10.5c0 .55-.45 1-1 1s-1-.45-1-1V6H10v9.5a2.5 2.5 0 0 0 5 0V5c0-2.21-1.79-4-4-4S7 2.79 7 5v12.5c0 3.04 2.46 5.5 5.5 5.5s5.5-2.46 5.5-5.5V6h-1.5z"></path></svg>
					</button>
					<div class="mini_header3_div">
						<button class="mini_header3_btn2">
							<svg viewBox="0 0 24 24" width="19px" height="19px" class="mini_header3_svg2"><path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path></svg>
						</button>
					</div>
				</div>
			</header>
			
			<main class="mini_main">
				<div class="mini_main_div1">
					<svg viewBox="0 0 24 24" width="32px" height="32px" class="mini_main_svg1"><path d="M2.833 4h13.75c.633 0 1.128.32 1.458.807L23 12.25l-4.96 7.434c-.33.486-.888.816-1.52.816H2.832A1.839 1.839 0 0 1 1 18.667V5.833C1 4.825 1.825 4 2.833 4zm11.917 9.625c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375zm-4.583 0c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375s-1.375.614-1.375 1.375c0 .76.614 1.375 1.375 1.375zm-4.584 0c.761 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375z" color="#c1c1c1" ></path></svg>
					<textarea class="mini_main_textarea" maxlength="1000" rows="1">문서제목</textarea>
				</div>
				<div class="mini_main_div2">
					<div class="mini_main_div2_writerName">
						<button class="mini_main_div2_btn"></button>
						<span class="mini_main_div2_span">유라짱</span>
					</div>
					<span class="mini_main_date">2022.07.21...</span>
				</div>
				<div class="mini_main_div3">
					<div class="mini_main_dm">
						<div class="mini_main_dm2">
							<svg viewBox="0 0 24 24" width="18px" height="18px" class="mini_main_dm2_svg"><path d="M2.833 4h13.75c.633 0 1.128.32 1.458.807L23 12.25l-4.96 7.434c-.33.486-.888.816-1.52.816H2.832A1.839 1.839 0 0 1 1 18.667V5.833C1 4.825 1.825 4 2.833 4zm11.917 9.625c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375zm-4.583 0c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375s-1.375.614-1.375 1.375c0 .76.614 1.375 1.375 1.375zm-4.584 0c.761 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375z" color="#c1c1c1"></path></svg>
							<span class="mini_main_dm3">대기</span>
							<div class="mini_main_dm4">
								<button class="mini_main_div2_btn"></button>
								<span class="mini_main_div2_span">유라짱</span>
							</div>
						</div>
						<div class="mini_main_dm5">
							<div>의사결정 기다리는 중</div>
							<div style="margin-right: 30px;">
								<button class="mini_main_dm5_btn">결정자 변경</button>
								<button class="mini_main_dm5_btn2">결정하기</button>
							</div>
						</div>
					</div>
					<div class="mini_more">
						<button class="mini_more_btn">
							<span>이전 의사결정( <span>2</span> )접기</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="8" height="4" viewBox="0 0 8 4" class="mini_more_btn_svg"><path d="M8 4L4 0 0 4z" fill="#888888" fill-rule="evenodd"></path></svg>
						</button>
						<div class="mini_more_div">
							<div style="width: 100%; display: flex;">
								<ul>
									<div class="decisionDetail">
										<div class="decisionDetail_row1">
											<svg viewBox="0 0 24 24" width="18px" height="18px" class="decisionDetail_svg1"><path style="fill: rgb(189, 2, 25);" d="M21.167 4H7.417c-.633 0-1.128.32-1.458.807L1 12.25l4.96 7.434c.33.486.824.816 1.457.816h13.75A1.839 1.839 0 0 0 23 18.667V5.833A1.839 1.839 0 0 0 21.167 4zm-2.75 11.54l-1.293 1.293-3.29-3.29-3.291 3.29-1.293-1.292 3.29-3.291-3.29-3.29 1.293-1.293 3.29 3.29 3.291-3.29 1.293 1.292-3.291 3.291 3.29 3.29z" color="#BD0219"></path></svg>
											<span class="decisionDetail1" style="color: rgb(189, 2, 25);">반려</span>
											<div class="mini_main_dm4">
												<button class="mini_main_div2_btn"></button>
												<span class="mini_main_div2_span">유라짱</span>
											</div>
										</div>
										<div class="decisionDetail_row2">
											<span class="decisionDetail2">2022.8.3...</span>
										</div>
									</div>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
</div>
</body>
</html>