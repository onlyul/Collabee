<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="css/comment.css" rel="stylesheet" type="text/css">
	<script>
	    $(function(){
	        $("#slideComment").click(function(){
	            $("#comment").animate({width:"toggle"},400);
	
	        });
	        $("#checkbox").click(function(){
	            alert("댓글만보기");
	        });
	        $(".recommentBtn").click(function(){
	            alert("답글쓰기");
	        });
	        $("#save").click(function(){
	            alert("저장");
	        });
	        $("#save").mouseenter(function() {
	                $("#save").css("background-color","#d9ad2b");
	        });
	        $("#save").mouseleave(function() {
	            $("#save").css("background-color","#d3d3d3");
	        });
	        $("#recommentXbtn").click(function(){
	            $("#clickRecomment").css("display","none")
	        });
	    });
	</script>
</head>
<body>
	<div id="comment">
        <div id="comments">
            <div style="margin-bottom: 20px;">
                <div><img class="profile" src="image/+.svg"/></div>
                <div>
                    <p class="information"><b>이름</b><span> * 5월 8일 오후 5:15</span></p>
                    <p class ="information">내용</p>
                    <button class="recommentBtn">답글쓰기</button>
                </div>
            </div>
            <div style="margin-bottom: 20px;">
                <div><img class="profile" src="image/+.svg"/></div>
                <div>
                    <p class="information"><b>이름</b><span> * 5월 8일 오후 5:15</span></p>
                    <p class ="information">내용</p>
                    <button class="recommentBtn">답글쓰기</button>
                </div>
            </div>
            <div style="margin-bottom: 20px;">
                <div><img class="profile" src="image/+.svg"/></div>
                <div>
                    <p class="information"><b>이름</b><span> * 5월 8일 오후 5:15</span></p>
                    <p class ="information">내용</p>
                    <button class="recommentBtn">답글쓰기</button>
                </div>
            </div>
            <div style="margin-bottom: 20px;">
                <div><img class="profile" src="image/+.svg"/></div>
                <div>
                    <p class="information"><b>이름</b><span> * 5월 8일 오후 5:15</span></p>
                    <p class ="information">내용</p>
                    <button class="recommentBtn">답글쓰기</button>
                </div>
            </div>
            <div style="margin-bottom: 20px;">
                <div><img class="profile" src="image/+.svg"/></div>
                <div>
                    <p class="information"><b>이름</b><span> * 5월 8일 오후 5:15</span></p>
                    <p class ="information">내용</p>
                    <button class="recommentBtn">답글쓰기</button>
                </div>
            </div>
            <div style="margin-bottom: 20px;">
                <div><img class="profile" src="image/+.svg"/></div>
                <div>
                    <p class="information"><b>이름</b><span> * 5월 8일 오후 5:15</span></p>
                    <p class ="information">내용</p>
                    <button class="recommentBtn">답글쓰기</button>
                </div>
            </div>
            <div style="margin-bottom: 20px;">
                <div><img class="profile" src="image/+.svg"/></div>
                <div>
                    <p class="information"><b>이름</b><span> * 5월 8일 오후 5:15</span></p>
                    <p class ="information">내용</p>
                    <button class="recommentBtn">답글쓰기</button>
                </div>
            </div>
            <div style="margin-bottom: 20px;">
                <div><img class="profile" src="image/+.svg"/></div>
                <div>
                    <p class="information"><b>이름</b><span> * 5월 8일 오후 5:15</span></p>
                    <p class ="information">내용</p>
                    <button class="recommentBtn">답글쓰기</button>
                </div>
            </div>
            <div style="margin-bottom: 20px;">
                <div><img class="profile" src="image/+.svg"/></div>
                <div>
                    <p class="information"><b>이름</b><span> * 5월 8일 오후 5:15</span></p>
                    <p class ="information">내용</p>
                    <button class="recommentBtn">답글쓰기</button>
                </div>
            </div>
            <div style="margin-bottom: 20px;">
                <div><img class="profile" src="image/+.svg"/></div>
                <div>
                    <p class="information"><b>이름</b><span> * 5월 8일 오후 5:15</span></p>
                    <p class ="information">내용</p>
                    <button class="recommentBtn">답글쓰기</button>
                </div>
            </div>
            <div style="margin-bottom: 20px;">
                <div><img class="profile" src="image/+.svg"/></div>
                <div>
                    <p class="information"><b>이름</b><span> * 5월 8일 오후 5:15</span></p>
                    <p class ="information">내용</p>
                    <button class="recommentBtn">답글쓰기</button>
                </div>
            </div>
           

        </div>
        <div id="commentWrite">
            <div style=" border: 1px solid #d3d3d3;border-radius: 5px; padding: 10px 5px 0px 10px; width:330px; margin-left: 17px; background-color: white; margin-top: 10px;">
                <div id="clickRecomment">
                    <p class="recommentContent">참석자 변경 9시 미팅<button id="recommentXbtn"><img id="buttonImg" src="image/x.svg"/></button></p>
                    <p class="recommentContent">2022</p>
                </div>
                <input id="textbox" type="text" placeholder="여기에 입력하세요"/>
                <button id="save">저장</button>
            </div>
        </div>
        <input type="checkbox" id="checkbox"/><span class="checkboxCotent"> 댓글만 보기</span>
    </div>
    <button id="slideComment" style="float: right; margin-top: 80px;"><img src="image/comment.svg" style="width:20px; vertical-align: bottom;"/></button>
</body>
</html>