<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문서기반 협업툴 : 콜라비의 보안</title>
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
		
		.float_right{
			float: right;
			width: 380px;
   			padding-top: 70px;
   			min-height: 350px;
		}
		.img_left{
			position: absolute; 
			float: left;
		}
		
		.float_left{
			float: left;
			width: 380px;
   			padding-top: 70px;
   			min-height: 350px;
		}
		.img_right{
			position: absolute;
			float: right;
			right: 0px;
		}
		
	</style>
</head>
<body>
	<%@ include file="homepage_menu.jspf" %>

	<main id="homepage_des">
		
		<div class = "homepage_des_header" style="margin-top: 70px;">
			<h2><span>콜라비의 보안</span></h2>
			<p><span class = "features_header_p">콜라비팀은 서비스 전반에 걸쳐 데이터 보호를 가장 중요하게 생각하고, 그에 맞는 강력한 데이터 보안 및 비밀유지 정책들을 적용하고 있습니다.</span></p>
		</div>
		
		<div class="clear"></div>		
		
		<div class="content_wrap">
			<div class="float_left" >
				<h3 style="margin-bottom: 16px;"><span class="content_top">데이터 보안</span></h3>
				<p>
					<span class="content_bottom">
						콜라비는 고객님의 데이터 보안을 위해 끊임없는 고민과 노력을 하고 있습니다. 다른 응용프로그램과 완벽히 분리되어 있어 미인증된 접근을 못하도록 방지하며 콜라비팀의 멤버들도 정보들을 열람할 수 없도록 2중 암호화가 되어 있습니다.
					</span>
				</p>
			</div>
			<img class="img_right" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_9_c1.3e06b609.png" width="668" alt="">
		</div>
		
		<div class="clear"></div>
		
		<div class="content_wrap">
			<div class="float_right" >
				<h3 style="margin-bottom: 16px;"><span class="content_top">체계적인 프로세스로<br/>안정된 보안을 보장</span></h3>
				<p>
					<span class="content_bottom">
						시스템의 구성은 강력한 보안 표준의 가장 안정된 버전으로 지속적으로 관리를 하고 있습니다. 시스템의 보안 업데이트가 필요한 경우에는 가장 높은 우선순위로 대응하며 안정테스트를 통해 반영됩니다. 이 과정에서 기존에 사용하던 시스템의 경우 폐기되고 최신 업데이트된 시스템으로 대체되기도 합니다.
					</span>
				</p>
			</div>
			<img class="img_left" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_9_c2.84ac2324.png" width="640" alt="">
		</div>
		
		<div class="clear"></div>
		
		<div class="content_wrap">
			<div class="float_left" >
				<h3 style="margin-bottom: 16px;"><span class="content_top">개인정보 보호</span></h3>
				<p>
					<span class="content_bottom">
						콜라비팀은 사용자의 정보들을 열람할 수 없도록 모든 데이터를 2중 암호화합니다. 또한, 관련 담당자들에게 비밀보호유지 각서를 받고, 교육을 통해 데이터 접근과 보호에 대해 철저하게 관리 및 감독하고 있습니다.
					</span>
				</p>
			</div>
			<img class="img_right" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_9_c3.07e72cf2.png" width="640" alt="">
		</div>
		
		<div class="clear"></div>
		
		<div class="content_wrap">
			<div class="float_right" >
				<h3 style="margin-bottom: 16px;"><span class="content_top">실시간 데이터 백업</span></h3>
				<p>
					<span class="content_bottom">
						네트워크, 서버 장애 등 장애로 인해 데이터 유실을 방지하기 위해 이중화를 두고 항시적으로 백업을 진행하고 있습니다. 또한, 각종 서비스 장애 감지 프로세스를 구축하고 있으며, 언제든지 빠르게 대응할 수 있도록 담당자가 대기하고 있습니다.
					</span>
				</p>
			</div>
			<img class="img_left" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_9_c4.a1db51ce.png" width="640" alt="">
		</div>
		
		<div class="clear"></div>
		
	</main>
	
	<%@ include file="homepage_bottom.jspf"%>
</body>
</html>