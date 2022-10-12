<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ta.dto.*" %>
<%@ page import="com.ta.dao.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	/* session.setAttribute("id",2); */
	int loginId = (Integer)session.getAttribute("loginId");
	int workspaceId = (Integer)request.getAttribute("workspaceId");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	<link href="css/links.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
        $(function() {
        	$(".linkName").hover(function(){
        		$(this).css("cursor","pointer");
        	});
            $("#fileBoxBtn").mouseenter(function() {
                $("#fileBoxList").css("display","block");
                $("#fileBoxList").css("box-shadow","1px 1px 1px 1px gray");
            });
            $("#fileBoxList").mouseleave(function() {
                $("#fileBoxList").css("display","none");
            });
            $("#close").click(function() {
            	window.history.back();;
            });
            $("#close").hover(function(){
                $("#close").find("img").css("fillter","brightness(0) saturate(100%) invert(56%) sepia(77%) saturate(393%) hue-rotate(8deg) brightness(105%) contrast(96%)");
            });
            $("#documentwrite").click(function(){
                alert("문서작성");
            });
            $("#documentwrite").hover(function(){
                $("#documentwrite").css("background-color","rgb(179,142,34)"); 
                $("#documentwrite").css("cursor","pointer");
            },function(){
                $("#documentwrite").css("background-color","rgb(217,173,43)");
            });
            $(".hoverRightTop").hover(function(){
                $(this).css("color","#dee0db");
            },function(){
                $(this).css("color","white");
            });
            $("#search").focusin(function(){
                $(".search_bar").width("268px");
                $("#search").width("233px");
                $("#documentwrite").css("display","none");
                $(this).css("outline","none");
            });
            $("#search").focusout(function(){
                $(".search_bar").width("143px");
                $("#search").width("100px");
                $("#documentwrite").css("display","block");
            });
            $("#search").keyup(function(key){
                $(this).attr("value",$(this).val());
                var search =  $(this).val();
                $(".linkComment").each(function(index, item){
                	if($(item).find(".linkTitle").text().includes(search)||$(item).find(".linkName").text().includes(search)){
						$(item).parent().css("display","block");                		
                	} else {
						$(item).parent().css("display","none");
                	}
                });
            });
            $(".fileTypeAndFilter").hover(function(){
                $(this).css("filter","opacity(0.4) drop-shadow(0 0 0 white)"); 
            },function(){
                $(this).css("filter","opacity(0.6) drop-shadow(0 0 0 white)"); 
            });
            $("#all").mouseenter(function(){
            	if($(this).attr("class")!="on"){
	                $(this).css("color","white");
            	}
                $(this).css("cursor","pointer");
            }); 
            $("#all").mouseleave(function(){
            	if($(this).attr("class")!="on"){
            		$(this).css("color","rgb(190,194,183)");
            }
            });
            $("#me").mouseenter(function(){
            	if($(this).attr("class")!="on"){
	                $(this).css("color","white");
            	}
                $(this).css("cursor","pointer");
            }); 
            $("#me").mouseleave(function(){
            	if($(this).attr("class")!="on"){
            		$(this).css("color","rgb(190,194,183)");
            }
            });
            $("#me").click(function(){
            	$("#all").removeClass("on");
            	$(this).addClass("on");
            	$(this).css("color","white");
            	$("#all").css("color","rgb(190, 194, 183)");
            	var workspace_id = $("#workspaceListBtn").attr("workspace_id");
            	$("#links").html("");
            	$.ajax({
            		type: 'get',
            		url: 'Controller?command=LinkMeAction',
            		data: {"login_id": <%=loginId%>, "workspace_id": workspace_id},
            		datatype: 'json',
            		success: function(data){
            			$.each(data,function(index,item){
            				var link =
	            				"<div class='link'>" +
	                    			"<a class='linkImg' target='_blank' href='"+item.link_name+"' style='background-image:url("+item.link_picture+"); '></a>" +
	                    			"<div class='pictureImg'>" +
	                        			"<img src='image/upload"+item.picture+"'/>" +
	                    			"</div>" +
	                    			"<div class='linkComment'>" +
	                        			"<h4 class='linkTitle'>"+item.link_title+"</h4>" +
	                        			"<p>"+item.link_explanation+"</p>" +
	                        			"<div>" +
	                            			"<a class='linkName'>"+item.link_name+"</a>" +
	                        			"</div>" +
	                        			"<span>"+item.workspace_name+"</span>" +
	                        			"<span class='documentName'> "+item.title+"</span>" +
	                    			"</div>" +
	                			"</div>";
	                		$("#links").append(link);	
            			});
            		},
            		error: function(r,s,e){
            			
            		}
            	});
            });
            $("#all").click(function(){
            	$("#me").removeClass("on");
            	$(this).addClass("on");
            	$(this).css("color","white");
            	$("#me").css("color","rgb(190, 194, 183)");
            	var workspace_id = $("#workspaceListBtn").attr("workspace_id");
            	$("#links").html("");
            	$.ajax({
            		type: 'get',
            		url: 'Controller?command=LinkAllAction',
            		data: {"login_id": <%=loginId%>, "workspace_id": workspace_id},
            		datatype: 'json',
            		success: function(data){
            			$.each(data,function(index,item){
            				var link =
	            				"<div class='link'>" +
	                    			"<a class='linkImg' target='_blank' href='"+item.link_name+"' style='background-image:url("+item.link_picture+"); '></a>" +
	                    			"<div class='pictureImg'>" +
	                        			"<img src='image/upload/"+item.picture+"'/>" +
	                    			"</div>" +
	                    			"<div class='linkComment'>" +
	                        			"<h4 class='linkTitle'>"+item.link_title+"</h4>" +
	                        			"<p>"+item.link_explanation+"</p>" +
	                        			"<div>" +
	                            			"<a class='linkName'>"+item.link_name+"</a>" +
	                        			"</div>" +
	                        			"<span>"+item.workspace_name+"</span>" +
	                        			"<span class='documentName'> "+item.title+"</span>" +
	                    			"</div>" +
	                			"</div>";
	                		$("#links").append(link);	
            			});
            		},
            		error: function(r,s,e){
            			
            		}
            	});
            });
            
            $("#workspaceListBtn").click(function(){ 
                $("#workspace_list").children().css("display","block");
                $("#workspaceListBtn").html("공간 검색").css("color", "rgb(255, 255, 255)");
                
            });
            $(".li").click(function(){
                var workspace = $(this).text();
                $("#workspaceListBtn").html(workspace);
                $("#workspace_list").children().css("display","none");
            	$("#workspaceListBtn").attr("workspace_id",$(this).attr("workspace_id"))   
            	var workspace_id = $("#workspaceListBtn").attr("workspace_id");
            	$("#links").html("");
            	$("#recentlyLink").html("");
            	$.ajax({
            		type: 'get',
            		url: 'Controller?command=LinkSelectWorkspaceAction',
            		data: {"login_id":<%=loginId%>,"workspace_id":workspace_id},
            		datatype: "json",
            		success: function(data){
            			$.each(data,function(index, item){
            				if(index==0){
            					$.each(item,function(index,item2){
            						var link =
            							"<div class='link'>" +
                                    		"<a class='linkImg' target='_blank' href='"+item2.link_name+"' style='background-image:url("+item2.link_picture+"); '></a>" +
                                    		"<div class='pictureImg'>" +
                                        		"<img src='image/upload"+item2.picture+"'/>" +
                                    		"</div>" +
                                    		"<div class='linkComment'>" +
                                        		"<h4 class='linkTitle'>"+item2.link_title+"</h4>" +
                                        		"<p>"+item2.link_explanation+"</p>" +
                                        		"<div>" +
                                            		"<a class='linkName'>"+item2.link_name+"</a>" +
                                        		"</div>" +
                                        		"<span>"+item2.workspace_name+"</span>" +
                                        		"<span class='documentName'> "+item2.title+"</span>" +
                                    		"</div>" +
                                		"</div>";
                                	$("#links").append(link);
            					});
            				} else {
            					var recentlyLink = "";
            					if(item.length==""){
            						recentlyLink =
            							"<p id='recentlyNotExistenceText'>최근 올린 링크가 없습니다.</p>";
            						$("#recentlyLink").append(recentlyLink);
            					} else {
	            					$.each(item,function(index,item3){
	            						recentlyLink = 
	            							"<li class='liImg'><a href='"+item3.link_name+"' target='_blank' link_id='"+item3.link_id+"''><img src='image/link.svg'/>"+item3.link_title+"</a></li>"
	            						$("#recentlyLink").append(recentlyLink);	
	            					});
            					}
            				}
            			});
            		},
            		error : function(r,s,e){
            			
            		}
            	});
            });
            $(".li").hover(function (){
                $(this).css("background-color", "rgb(242,242,242)");
                $(this).css("cursor","pointer");
            }, function(){
                $(this).css("background-color", "rgb(255, 255, 255)");
            });
            $("#close").hover(function(){
            	$(this).children().css("filter","brightness(0) saturate(100%) invert(68%) sepia(74%) saturate(461%) hue-rotate(2deg) brightness(92%) contrast(87%)");
            },function(){
            	$(this).children().css("filter","brightness(0) saturate(100%) invert(93%) sepia(0%) saturate(1646%) hue-rotate(76deg) brightness(95%) contrast(89%)");
            });
            $(".linkImg").hover(function(){
            	$(this).css("border","1px solid rgb(193,193,193)");
            },function(){
            	$(this).css("border","1px solid rgb(225,225,225)");
            });
        });
    </script>
</head>
<body>
	<div id="left">
        <button id="close">
            <img src="image/x.svg" style="width:35px; height:35px; margin:0px; padding: 0px; "/>
        </button>
    </div>
    <div id="right"> 
        <div id="rooptop">
            <div id="top2"></div>
            <div id="top" >
                <div style="float:left;" id="leftTop" >
                	<%
                    	FileDao fDao = new FileDao();
                    	ArrayList<WorkspaceListDto> wDto = fDao.getFileWorkspaceList(loginId);
                    %>
                    <p id="mainText">링크 </p>
                    <button id="workspaceListBtn" workspace_id="0">모든 공간</button>
					<svg id="workspaceDownSvg" viewBox="0 0 24 24" class="svg1"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
                    <div id="workspace_list">
                		<ul>
                    		<li class="li">공간 검색</li>
                    		<li class="li" workspace_id="0">모든 공간</li>
                    <%
                    	for(WorkspaceListDto workspaceList : wDto){
                    %>
                    		<li class="li" workspace_id="<%=workspaceList.getWorkspaceId()%>"><span><%=workspaceList.getWorkspaceName()%></span></li>
					<%
                    	}
					%>
		                </ul>
           			</div>
                    <button id="documentwrite">
                        <img src="image/pen.svg"/>
                        <span>문서 작성</span>
                    </button>
                    <div class="search_bar">
                        <img src="image/magnifier.svg" id="search_img"/>
                        <input id="search" type="search" placeholder="검색"/>
                    </div>
                    <p id="subText"><b>업로드한 링크를 관리할 수 있습니다.</b></p>
                    <span id="me">내 링크</span>
                    <span id="all" class="on">전체 링크</span>
                    <span id="filter"><img class="fileTypeAndFilter fileicon" src="image/filter.svg "/></span>
                </div>
                    <div id="rightTop">
                        <div id="do"><a class="hoverRightTop" href="Controller?command=Todo">할 일</a></div>
                        <div id="decision_making"><a class="hoverRightTop" href="Controller?command=dm2">의사결정</a></div>
                        <div class="hoverRightTop" id="fileBoxBtn">파일함 <img src="image/down.svg"/></div><br/>
                        <div id = "fileBoxList">
                            <div id="fileBtn"><a href="Controller?command=FilesAction"><img src="image/file.svg"/>파일</a></div>
                            <div id="linkBtn"><img src="image/link.svg"/>링크</div>
                        </div>
                    </div>
                </div>
        </div>
        <div id="bottom">
            <div id="leftBottom">
                <div id="links">
                <%
                	LinkDao lDao = new LinkDao();
                	ArrayList<LinkDto> AllWorkspaceTotalLink = lDao.getAllWorkspaceTotalLink(loginId);
                	
                	for(LinkDto link : AllWorkspaceTotalLink){
                %>
                	<div class="link">
                        <a class="linkImg" target="_blank" href="<%=link.getLink_name() %>" style="background-image:url(<%=link.getLinkPicture()%>); "></a>
                        <div class="pictureImg">
                            <img src="image/upload/<%=link.getPicture()%>"/>
                        </div>
                        <div class="linkComment">
                            <h4 class="linkTitle"><%=link.getLink_title() %></h4>
                            <p><%=link.getLink_explanation() %></p>
                            <div>
                                <a class="linkName"><%=link.getLink_name() %></a>
                            </div>
                            <span><%=link.getWorkspace_name() %></span>
                            <span class='documentName'><%=link.getTitle() %></span>
                        </div>
                    </div>
                <%		
                	}
                %>
                </div>
            </div>
            <div id="rightBottom">
                <div id="recentlyLinks">최근 올린 링크</div>
                <div id="recentlyLink">
				<%
                	ArrayList<RecentlyLinkDto> AllWorkspaceRecentlyLink = lDao.getAllWorkspaceRecentlyLink(loginId);
                	if(AllWorkspaceRecentlyLink.size()==0){
                %>
                	<p id="recentlyNotExistenceText">최근 올린 링크가 없습니다.</p>
                <%	
                	} else {
                		for(RecentlyLinkDto recentlyLink : AllWorkspaceRecentlyLink){
                %>
                	<li class="liImg"><a href="<%=recentlyLink.getLink_name() %>" target="_blank" link_id="<%=recentlyLink.getLink_id() %>"><img src="image/link.svg"/><%=recentlyLink.getLink_title() %></a></li>
                <%			
                		}		
                	}
                %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>