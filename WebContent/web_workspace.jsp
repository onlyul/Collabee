<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문서기반 협업툴 - 협업공간</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="css/web_workspace.css" rel="stylesheet" type="text/css">
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
</head>
<body>

	<%@ include file="homepage_menu.jspf" %>
        <div class="collabee_backimg_web">
            <div class="collabee_title_web">협업공간</div>
            <div class="collabee_summary_web"><span>팀, 프로젝트 등 목적에 따라 협업할 수 있는 독립된 공간인 협업공간을 만들어 동료와 함께 협업을 진행해 보세요.</span></div>
        </div>

    <section class="ws_section2_web">
        <div class="content_style1 row">
            <div style="width: 380px; padding-top: 70px;">
                <div class="txt_style1">다양한 목적에 따라 만들 수 <br/>있는 협업공간</div>
                <div>
                    <div class="row" style="border-bottom:1px solid rgb(216,216,216); padding:26px 0px;">
                        <div><img src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/ic_3001_1_notice.7a1fc44d.png" style="width:30px; margin-right:20px;"></div>
                        <div class="column">
                            <span class="txt_style3">회사 공지</span>
                            <span class="txt_style2">모든 멤버들에게 회사의 이벤트 또는 전<br/>달사항을 공지해 보세요</span>
                        </div>
                    </div>
                    <div class="row" style="border-bottom:1px solid rgb(216,216,216);  padding:26px 0px;">
                        <div><img src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/ic_3001_1_place.401db08e.png" style="width:30px; margin-right:20px;"></div>
                        <div class="column">
                            <span class="txt_style3">프로젝트 관리</span>
                            <span class="txt_style2">프로젝트를 함께할 멤버들을 초대하여 <br/>프로젝트를 성공적으로 진행해 보세요.</span>
                        </div>
                    </div>
                    <div class="row" style="border-bottom:1px solid rgb(216,216,216); padding:26px 0px;">
                        <div><img src="	https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/ic_3001_1_team.9f487813.png" style="width:30px; margin-right:20px;"></div>
                        <div class="column">
                            <span class="txt_style3">팀(부서)</span>
                            <span class="txt_style2">팀 멤버들에게만 전달할 사항과 보안이 필요한 사항을 공유할 수 있는 공간을 만들어 보세요.</span>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <img src="	https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_1_c1.ae2f71aa.png" class="ws_img1">
            </div>
        </div>
        
        
        <div class="content_style1 row">
            <div><img src="	https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_1_c2.6dc8ac4f.png"></div>
            <div class="column">
                <div class="txt_style1" style="padding: 80px 0px 20px 0px;">초대받은 동료들끼리만 공유<br/>하는 독립된 공간</div>
                <div class="txt_style2">협업공간은 초대된 동료만 참여할 수 있는 공간<br/>입니다.<br/>
                    이 공간에서 함께 업무를 진행할 동료를 초대해 <br/>보세요.</div>
            </div>
        </div>
        
        <div class="content_style1 row">
            <div class="column">
                <div class="txt_style1" style="padding:80px 0px 20px 0px;">협업공간에서 모든 문서를 해<br/>결해 보세요.</div>
                <div class="txt_style2">문서를 작성하여 동료에게 공유해 보세요. 협업<br/>공간에 참여하는 동료들과 함께 업무를 진행할 <br/>수 있습니다.</div>
            </div>
            <div><img src="	https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_1_c3.328c9ca8.png"></div>

        </div>
        
        
        <div class="content_style1 column" style="text-align:center; align-items:center;">
            <div class="txt_style1" style="padding-bottom:70px;">프로젝트를 관리하는 효율적인 방법</div>
            <div class="row">
                <div>
                    <div><img src="	https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_1_c4_kanban.674dec55.png" style="width:348px;"></div>
                    <div class="column">
                        <span class="txt_style3">칸반</span>
                        <span class="txt_style2">협업공간별로 문서들의 진행상황을 <br/>한눈에 확인해 보세요.</span>
                    </div>
                </div>
                <div>
                    <div style="margin: 0px 24px"><img src="	https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_1_c4_gantt.318ed762.png" style="width:348px;"></div>
                    <div class="column">
                        <span class="txt_style3">간트차트</span>
                        <span class="txt_style2">간트차트에서 프로젝트를 계획하고 추적하여 <br/>꼼꼼하게 관리해 보세요.</span>
                    </div>
                </div>
                <div>
                    <div><img src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_1_c4_calendar.3d9dfc91.png" style="width:348px;"></div>
                    <div class="column">
                        <span class="txt_style3">캘린더</span>
                        <span class="txt_style2">공유된 할 일과 일정을 캘린더에서 확인하고 <br/>우선순위별로 일정을 조정해 보세요.</span>
                    </div>
                </div>

            </div>
        </div>
        
        
        <div class="content_style1 column" style="text-align:center;">
            <div class="column"><span class="txt_style1">언제 어디서나</span><span class="txt_style2">근무하는 곳이 아니더라도 모바일로 문서의 진행상황을<br/>
                파악하여 업무를 진행할 수 있습니다.</span></div>
            <div><img src="	https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_everywhere.ac06583d.png" style="width:1112px"></div>
        </div>
    </section>
    
<%@ include file="homepage_bottom.jspf"%>
    






</body>
</html>