<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문서기반 협업툴 : 문서</title>
	<style>
		*{
			box-sizing: border-box;
		}
		body{
			font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
		}
		#homepage_des h2{
			font-size: 36px;
   			font-weight: bold;
    		line-height: 1.11;
			color: rgb(255, 255, 255);
 		    margin: 0px;
		}
		#homepage_des h3{
			display: block;
    		margin-block-start: 1em;
    		margin-block-end: 1em;
    		margin-inline-start: 0px;
    		margin-inline-end: 0px;
		}
		
		.homepage_des_header{
			box-sizing: border-box;
			min-height: 240px;
			background: url(https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/bg-3001-top.f559b0a0.png) center top no-repeat;
			text-align: center;
			display : flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			/* padding: 20px 0px; */
		}
		.features_header_p{
			font-size: 18px;
			line-height: 1.33;
			color: rgb(255, 241, 201);
		}
		
		.content_wrap{
			position: relative;
  		 	padding: 75px 0px;
  		 	width: 1100px;
    		margin: 0px auto;
    		overflow: hidden;
		}
		.float_right{
			float: right;
			width: 380px;
   			padding-top: 70px;
   			min-height: 500px;
		}
		.content_top{
			font-size: 28px;
   			line-height: 1.43;
   			font-weight: normal;
		}
		.content_bottom{
			font-size: 18px;
    		line-height: 1.56;
    		color: rgb(102, 102, 102);
		}
		.img_left{
			/* position: absolute; */
			float: left;
			left: -30px;
		}
		
		.float_left{
			float: left;
			width: 380px;
   			padding-top: 70px;
   			min-height: 500px;
		}
		.img_right{
			/* position: absolute; */
			float: right;
		}
		
		.clear{
			clear: both;
		}
	</style>
	
</head>
<body>
	<%@ include file="homepage_menu.jspf" %>
	
	<main id="homepage_des">
	
		<div class = "homepage_des_header" style="margin-top: 70px;">
			<h2><span>문서 : 실시간 동시편집 문서</span></h2>
			<p><span class = "features_header_p">문서에서 파일, 할 일, 일정, 의사결정을 공유하고 댓글로 의견을 주고 받으며 결과물을 완성할 수 있습니다.</span></p>
		</div>
		
		<div class="clear"></div>
		
		<div class="content_wrap">
			<div class="float_right">
				<h3><span class="content_top">실시간 동시편집</span></h3>
				<p><span class="content_bottom">실시간으로 동료와 함께 문서를 편집하여 결과물을 빠르게 완성해 보세요.</span><p>
				<img width="350" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_2_c1_info.b3eaca54.png"  alt="">
			</div>
			<img class="img_left" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_2_c1.ecacf6b1.png"  alt="" width="710">
		</div>
		
		<div class="clear"></div>
		
		<div class="content_wrap">
			<div class="float_left">
				<h3><span class="content_top">@ 앳박스</span></h3>
				<p>
					<span class="content_bottom">
						@ 만 입력하면, 업무에 필요한 컨텐츠를 담을 수<br/>
						있습니다. 할 일, 일정, 파일과 같은 업무에 필요한<br/>
						컨텐츠를 첨부하여 이슈를 동료와 함께 해결해 보세요.
					</span>
				</p>
			</div>
			<img class="img_right" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_2_c2.326a45c7.png" alt="" width="710">
		</div>
		
		<div class="clear"></div>
		
		<div class="content_wrap">
			<div class="float_right">
				<h3><span class="content_top">진행 과정을 한눈에</span></h3>
				<p>
					<span class="content_bottom">
						문서만 보면 주고 받은 일정, 할 일, 의사결정,<br/>
						파일이 모두 담겨져 있어 업무의 진행 과정을 한눈에 파악할 수 있어요.
					</span>
				</p>
			</div>
			<img class="img_left" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_2_c3.124cc2d6.png" alt="" width="710">
		</div>
		
		<div class="clear"></div>
		
		<div class="content_wrap">
			<div class="float_left">
				<h3><span class="content_top">실시간 커뮤니케이션</span></h3>
				<p>
					<span class="content_bottom">
						문서에서 댓글로 커뮤니케이션 해보세요.<br/>
						답변쓰기와 관련 컨텐츠를 참조하여 댓글을 작성할 수 있어 진행과정을 단번에 파악할 수 있습니다.
					</span>
				</p>
				<img width="350" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_2_c4_info.6cfca7d5.png" alt="">
			</div>
			<img class="img_right" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_2_c4.79e6d1fc.png" alt="" width="710">
		</div>
		
		<div class="clear"></div>
		
		<div class="content_wrap">
			<div class="float_right">
				<h3><span class="content_top">언제나 최신사항을 함께</span></h3>
				<p>
					<span class="content_bottom">
						업무가 진행되면서, 새로운 업데이트 소식을 찾기 위해 일일히 찾아보지 않아도 돼요. 빠르게 업데이트 된 소식을 확인해 보세요.
					</span>
				</p>
			</div>
			<img class="img_left" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_2_c5.1b2d9dc7.png" alt="" width="710">
		</div>
		
		<div class="clear"></div>
		
	</main>
	
	<%@ include file="homepage_bottom.jspf"%>
</body>
</html>