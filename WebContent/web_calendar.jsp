<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캘린더 : 일정, 할 일 기한 관리</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="css/web_calendar.css" rel="stylesheet" type="text/css">
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <script>
        $(function() {
            $(".menu_tab li:nth-child(1)").hover(function(){
                $("#collabee_modal_web").css("visibility", "visible");
            },function() {
                $("#collabee_modal_web").css("visibility", "hidden");
            });
        });


    </script>
</head>
<body>
    <%@ include file="homepage_menu.jspf" %>
<div>    

	<div class="collabee_backimg_web">
	    <div class="collabee_title_web">캘린더 : 일정, 할 일 기한 관리</div>
	    <div class="collabee_summary_web"><span>매일 아침을 새로 요청 받은 할 일과 미팅 일정을 정리하며 하루를 시작해 보세요.</span></div>
	</div>

  <div class="content_style1 column div_style4">
    <div class="column div_style2">
        <span class="txt_style1">참여된 모든 공간의 ‘일정’이 담긴 캘린더</span>
        <span class="txt_style2" style="padding:15px;">내가 참여된 모든 공간에 동료의 일정이 모두 담겨 있어 스케쥴을 쉽게 관리할 수 있어요.</span>
    </div>
    <div><img src="	https://cdn.collabee.co/front/collabee.co/hornet/530/static/media/img_3001_5_c1.9f52ec61.png" style="width:1150px"></div>
</div>

<div class="content_style1 column div_style4">
    <div class="column div_style2">
        <span class="txt_style1">문서에 담긴 할 일, 일정도 모두 캘린더에서</span>
        <span class="txt_style2" style="padding:15px;">문서에 등록한 할 일, 일정은 모두 캘린더에서 확인할 수 있습니다.</span>
    </div>
    <div><img src="	https://cdn.collabee.co/front/collabee.co/hornet/530/static/media/img_3001_5_c2.ac43183d.png" style="width:1284px"></div>
  </div>

  <div class="content_style1 column div_style3">
    <div class="column div_style2">
        <span class="txt_style1">언제 어디서나</span>
        <span class="txt_style2">근무하는 곳이 아니더라도 모바일로 문서의 진행상황을<br/>
        파악하여 업무를 진행할 수 있습니다.</span>
    </div>
    <div><img src="	https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_everywhere.ac06583d.png" style="width:1112px"></div>
  </div>

</div>

<%@ include file="homepage_bottom.jspf"%>

</body>
</html>