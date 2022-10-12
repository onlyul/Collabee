<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
   <!--  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
    <script src="js/jquery-3.6.0.min.js"></script>
    <!-- <link href='main.css' rel='stylesheet'/> -->
    <link href="css/Entire_Calendar.css" rel="stylesheet" type="text/css">
    <script src='main.js'></script>
    <script>
    $(function() {
    	//calendar element 취득
        var calendarEl = document.getElementById('calendar');
    	//calendar 생성하기
        var calendar = new FullCalendar.Calendar(calendarEl, {
	        initialView:'dayGridMonth', //초기 로드될때 보이는 캘린더 
	        //initialDate: "2022-02-02" 초기날짜 설정 (설정 안하묜 오늘날짜)
        	expandRows : true, //화면에 맞게 높이 재설정
        	slotMinTime:"8:00", //day 캘린더에서 시작 시간
        	slotmaxTime:"20:00", //종료시간 
            headerToolbar: {
                left: 'prev title next today dayGridMonth listMonth',
                center:"",
                right: ""
            },
            //height:"700px", 안되는디;
			editable:true,//수정가능
			dayMaxEvents:true,//일정 오버되면 높이 제한
			locale:"ko",
			eventAdd:function(obj){
				//일정 추가되면 할거
			},
			eventChange:function(obj) {
				//일정 수정되면 할거
			},
			eventRempve:function(obj) {
				//일정 삭제되면 할거
			},
			select : function(arg) {
				//드래그로 일정 만들기??
				var title = prompt("입력할 일정:");
				// title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
				if(title) {
					calendar.addEvent({
						title:title,
						start:arg.start,
						end:arg.end,
						allDay:arg.allDay,
						color: "rgb(217, 173, 43)"
					})
				}
				calendar.unselect()	
			},
			eventClick:function(arg){
				//있는 일정 클릭시
				location.href="schedule.jsp";
				calendar.getEventSources();
			},
            //eventlimit: true,
            //eventlimit: true  allow more when too many events
            buttonText:{
                today:"오늘"
            },
            
            events: [ 
            	/*
            	JSON feed
            	{
					url: '/myfeed.php',
					color: 'yellow',   // an option!
					textColor: 'black' // an option!
					
				}
            	
            	*/
                {            
                    title: 'All Day Event',     //이벤트에 표시될 제목       
                    start: '2022-07-01',        //시작일  
                    end: '2022-07-10',
                    color:"rgb(136,136,136)"
                    //종료일
                    // allDay:t/f 일정이 하루전체인지 여부
                    // 또 종일여부를 결정짓는 변수인 allDay라는 변수가 있는데 이게 아주 가관이었다.
                    // 2021.09.29~2021.09.30로 구간이벤트로 잡혀있으면 종료일자는 당연히 2021.09.30인데
                    // 종일이벤트로 변경하면 2021.10.01로 수정해줘야 정상적으로 화면에 출력됐다
                },          
                {            
                    title: 'Long Event',            
                    start: '2022-07-07',            
                    end: '2022-07-11',
                    color:"rgb(217, 173, 43)"
                }
            ]

        });
    	//calendar 렌더링
        calendar.render();
    	
        $(".fc .fc-daygrid-day-frame").click(function (){ //날짜 누르면 일정창 켜짐
            $("#schedule").css("display","flex");
        });
    	
        $("#posting_bnt").click(function(){
        	location.href="Document.jsp";
        });
    
    
    });
</script>

    <title>전체 캘린더</title>

<script>
    $(function(){
        $("#my_sche_view, .calendar_checkbox").click(function(){
            var color = $(".calendar_checkbox path").css("fill");
            if(color=="rgb(189, 186, 183)"){
                $(".calendar_checkbox").html("<svg width='20px' height='20px' viewBox='0 0 24 24'><path fill='#D9AD2B' fill-rule='evenodd' d='M17,3 C19.209139,3 21,4.790861 21,7 L21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 L3,7 C3,4.790861 4.790861,3 7,3 L17,3 Z M16.59,7.58 L10,14.17 L7.41,11.59 L6,13 L10,17 L18,9 L16.59,7.58 Z'></path></svg>");
            } else if(color=="rgb(217, 173, 43)"){
               $(".calendar_checkbox").html("<svg width='20px' height='20px' viewBox='0 0 24 24'><path fill='#bdbab7' fill-rule='evenodd' d='M17,3 C19.209139,3 21,4.790861 21,7 L21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 L3,7 C3,4.790861 4.790861,3 7,3 L17,3 Z M17,5 L7,5 C5.9456382,5 5.08183488,5.81587779 5.00548574,6.85073766 L5,7 L5,17 C5,18.0543618 5.81587779,18.9181651 6.85073766,18.9945143 L7,19 L17,19 C18.0543618,19 18.9181651,18.1841222 18.9945143,17.1492623 L19,17 L19,7 C19,5.9456382 18.1841222,5.08183488 17.1492623,5.00548574 L17,5 Z'></path></svg>");
            }

        });
    });
    
</script>
</head>
<body>
 

<!-- 페이지 구성요소 -->
<!-- <div style="background-color:silver; width:234px; height:1500px; float:left; display:fixed;">사이드메뉴바</div> -->
<div class="row">
<%@ include file="../WEB-INF/include/include_HomeSidebar.jspf"%>
<div>
<header>
    <div id="title_cal">
        <button id="calendar_bnt"><a href="">전체 캘린더</a></button>
    </div>
    <!--검색창과 문서작성 버튼-->
    <div id="bnt1_cal">
        <div id="search_icon" class="bnt_base"><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
        <input type ="text" id=searchbar placeholder="검색"/>
        <button id="posting_bnt">
            <svg viewBox="0 0 24 24" width="13px" height="13px" ><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="posting_icon" ></path></svg>
            <span>문서 작성</span>
        </button>
    </div>
</header>

	<div class="menubar_cal">
    <div id="bnt2_cal" class="menubar_cal">
        <div class="calendar_checkbox"><svg width="20px" height="20px" viewBox="0 0 24 24"><path fill="#bdbab7" fill-rule="evenodd" d="M17,3 C19.209139,3 21,4.790861 21,7 L21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 L3,7 C3,4.790861 4.790861,3 7,3 L17,3 Z M17,5 L7,5 C5.9456382,5 5.08183488,5.81587779 5.00548574,6.85073766 L5,7 L5,17 C5,18.0543618 5.81587779,18.9181651 6.85073766,18.9945143 L7,19 L17,19 C18.0543618,19 18.9181651,18.1841222 18.9945143,17.1492623 L19,17 L19,7 C19,5.9456382 18.1841222,5.08183488 17.1492623,5.00548574 L17,5 Z"></path></svg></div>
        <label for="myschedule">
            <input type="checkbox" id="myschedule" readonly/>
            <span id="my_sche_view">내 일정만 보기</span>
            
        </label>
        <div id="date_filter">
            <label><div class="picked_date">시작일 ~ 종료일<svg width="8" height="4" viewBox="0 0 8 4"><path d="M0 0l4 4 4-4z" fill="#222222" fill-rule="evenodd"></path></svg></div></label>
            <input type="datepicker" id="start_date" class="calendar_dateFilter"/>
            <input type="datepicker" id="finish_date" class="calendar_dateFilter"/>
          <!--   <script>
                $(function(){ //2개 받아야함.(해야됨)
                    //datepicker
                    $(".calendar_dateFilter").datepicker({
                        dateFormat:"yy.m.d" ,showOthermonths: true ,showMonthAfterYear:true
                        ,buttonImageOnly:true ,yearSuffix:"년", monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
                        ,dayNamesMin:["일","월","화","수","목","금","토"]
                        , showButtonPanel:true, currentText:"초기화", closeText:"적용"
                        ,numberOfMonths:2, showButtonPanel:true
                        ,onClose:function(selectedDate){
                            $("#finish").datepicker("option","minDate",selectedDate);
                        }
                    });
                    $("#start_date, #finish_date").datepicker("setDate", new Date());
                    
                    var dateFormat = "yy.m.d"
                    ,from = $("#start_date").datepicker({
                        changeMonth:true, numberOfMonths:2 }).on("change", function(){
                        to.datepicker("option", "minDate", getDate(this));
                    })
                    ,to = $("#finish_date").datepicker({
                        changeMonth:true, numberOfMonth:2 }).on("change", function(){
                        from.datepicker("option", "maxDate", getDate(this));
                    });
                    
                    function getDate(element) {
                        var date;
                        try{
                            date = $.datepicker.parseDate(dateFormat, element.value);
                        } catch(error){
                            date = null;
                        }
                        return date;
                    }
                    https://nowonbun.tistory.com/368
                    

                    $("#start_date")

                });

            </script> -->
            <div></div>
        </div>    
    </div>    
	</div>

	<!-- 캘린더 -->
    <section class="row" style="justify-content: space-between;">
        <div id="calendar"></div>
    	<%@ include file="../WEB-INF/include/include_rightBar.jspf"%>
    </section>
</div>
</div>    
</body>
</html>