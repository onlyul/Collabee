<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문서기반 협업툴 : 칸반</title>
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
	</style>
</head>
<body>
	<%@ include file="homepage_menu.jspf" %>

	<main id="homepage_des">
		
		<div class = "homepage_des_header" style="margin-top: 70px;">
			<h2><span>칸반 : 쉬운 문서관리 방법</span></h2>
			<p><span class = "features_header_p">문서상태별로 구분된 칸반에서 진행상황을 한눈에 확인해 보세요.</span></p>
		</div>
		
		<div class="clear"></div>
		
		<div class="content_wrap">
			<div class="content_text" >
				<h3><span class="content_top">협업공간 진행상황이 한눈에</span></h3>
				<p style="margin-bottom: 50px;">
					<span class="content_bottom">
						칸반으로 한눈에 진행상태를 보고, 쉽게 관리할 수 있습니다.<br/>
						Drag&amp;Drop으로 손쉽게 문서상태를 변경해 보세요.
					</span>
				</p>
			</div>
			<img class="img1" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_6_c1.7a080fd4.png" width="1022" alt="">
		</div>
		
		<div class="clear"></div>
		
	</main>
	
	<%@ include file="homepage_bottom.jspf"%>
</body>
</html>