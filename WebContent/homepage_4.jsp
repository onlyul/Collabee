<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문서기반 협업툴 : 컨텐츠모음</title>
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
		.clear{
			clear: both;
		}
		
		.content_text{
			    text-align: center;
		}
		.content_top{
			font-size: 28px;
    		line-height: 1.43;
   			font-weight: normal;
   			color: rgb(34, 34, 34);
		}
		.content_bottom{
			font-size: 18px;
   			line-height: 1.56;
   			color: rgb(102, 102, 102);
		}
		.img1{
			position: relative;
    		width: 1100px;
		}
		
		.float_right{
			float: right;
			width: 380px;
   			padding-top: 70px;
   			min-height: 500px;
		}
		.img_left{
			position: absolute; 
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
			position: absolute;
			float: right;
		}
		
	</style>
</head>
<body>
	<%@ include file="homepage_menu.jspf" %>

	<main id="homepage_des">
		
		<div class = "homepage_des_header" style="margin-top: 70px;">
			<h2><span>컨텐츠 모음 : 자료를 찾는 가장 빠른 방법</span></h2>
			<p><span class = "features_header_p">할 일 / 파일 / 의사결정 / 링크가 종류별로 모아져 있어 빠르게 찾을 수 있습니다.</span></p>
		</div>
		
		<div class="clear"></div>
		
		<div class="content_wrap">
			<div class="content_text" >
				<h3><span class="content_top">몇 번의 스크롤로 찾을 수 있는 할 일, 파일</span></h3>
				<p style="margin-bottom: 50px;">
					<span class="content_bottom">
						파일명, 할 일 제목이 기억나지 않더라도 관련된 문서에서 찾아보세요.<br/>
						몇 번의 스크롤로 할 일과 파일의 모든 과정을 파악하실 수 있어요.
					</span>
				</p>
			</div>
			<div class="img1">
				<img width="1140" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_7_c4.5977d9d4.png" alt="">
			</div>
		</div>
		
		<div class="clear"></div>
		
		<div class="content_wrap">
			<div class="float_right" style="min-height: 420px;">
				<h3><span class="content_top">내 할 일과 동료의 할 일을 한눈에</span></h3>
				<p><span class="content_bottom">내 할 일의 우선순위를 쉽게 Drag&amp;Drop으로 관리하고, 동료에게 요청한 할 일이 어떻게 진행되고 있는지 한눈에 확인해 보세요.</span><p>
			</div>
			<img class="img_left" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_7_c1.a85fa8e1.png" alt="" width="700">
		</div>
		
		<div class="clear"></div>
		
		<div class="content_wrap">
			<div class="float_left"  style="min-height: 670px;">
				<h3><span class="content_top">몇 번의 스크롤로 원하는<br/>파일과 링크를</span></h3>
				<p>
					<span class="content_bottom">
						공유한 파일과 링크가 한 곳에 모아져 있어<br/>
						빠르게 찾아볼 수 있어요.
					</span>
				</p>
			</div>
			<img class="img_right" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_7_c2.c72b93bc.png" alt="" width="721">
		</div>
		
		<div class="clear"></div>
		
		<div class="content_wrap">
			<div class="float_right" style="min-height: 420px;">
				<h3><span class="content_top">의사결정, 동료가 준<br/>의사결정을 빠르게</span></h3>
				<p><span class="content_bottom">동료가 준 의사결정의 진행상태별로 확인하여 결정을 빠르게 진행할 수 있으며 최종으로 의사결정이 어떻게 진행됐는지 한눈에 파악할 수 있어요.</span><p>
			</div>
			<img class="img_left" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_7_c3.55a6774d.png" alt="" width="700">
		</div>
		
		<div class="clear"></div>
	</main>
	
	<%@ include file="homepage_bottom.jspf"%>
</body>
</html>