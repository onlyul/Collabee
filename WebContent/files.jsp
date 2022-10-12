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
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="css/files.css" rel="stylesheet" type="text/css">
    <script>
        $(function() {
            $("#fileBoxBtn").mouseenter(function() {
                $("#fileBoxList").css("display","block");
                $("#fileBoxList").css("box-shadow","1px 1px 1px 1px gray");
            });
            $("#fileBoxList").mouseleave(function() {
                $("#fileBoxList").css("display","none");
            });
            $("#close").on("click",function() {
                window.history.back();
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
                $(".fileName").each(function(index, item){
                	if($(item).text().includes(search)){
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
            $(".file_information").hover(function(){  
                $(this).css("box-shadow","5px 5px 5px gray"); 
            }, function(){
                $(this).css("box-shadow","none"); 
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
            	$("#files").html("");
            	var workspace_id = $("#workspaceListBtn").attr("workspace_id");
            	$.ajax({
            		type: 'get',
            		url: 'Controller?command=FileMeAction',
            		data: {"login_id":<%=loginId%>,"workspace_id" : workspace_id},
            		datatype: "json",
            		success : function(data){
            			$.each(data, function(index, item){
            				$.each(item, function(index, item2){
            					var file = "";
            					if(item2.picture=="img"){
                					file =
            						"<div class='file'>" +
            							"<a class='downloadFile' href='image/upload/"+item2.file_name+"' download>" +
            								"<div class='file_information' file_id='"+item2.file_id+"' style='background-image:url('image/upload/"+item2.file_name+"');'></div>" +
	                					"</a>"+
                                    	"<span class='fileA fileName'>"+item2.file_name+"</span><br/>" +
                                    	"<span class='fileA'>"+item2.workspace_name +"</span>" +
                                	"</div>";
            					} else {
            						file =
            						"<div class='file'>" +
            							"<a class='downloadFile' href='image/upload/"+item2.file_name+"' download>" +
	            							"<div class='file_information' file_id='"+item2.file_id+"'>" +
	            	                            "<img class ='file_img "+item2.picture+"' src='image/file.svg' /><br/>" + 
	            	                            "<span class='extension'>"+item2.picture+"</span>" +
	            	                        "</div>" +
	            	                    "</a>"+   
            	                        "<span class='fileA fileName'>"+item2.file_name+"</span><br/>" +
            	                        "<span class='fileA'>"+item2.workspace_name+"</span>" +
            	                    "</div>";	
            					}	
            					$("#files").append(file);	
            				});
            			});
            		},
            		error : function(r,s,e){
            			
            		}
            	});
            });
            $("#all").click(function(){
            	$("#me").removeClass("on");
            	$(this).addClass("on");
            	$(this).css("color","white");
            	$("#me").css("color","rgb(190, 194, 183)");
            	$("#files").html("");
            	var workspace_id = $("#workspaceListBtn").attr("workspace_id");
            	$.ajax({
            		type: 'get',
            		url: 'Controller?command=FileAllAction',
            		data: {"login_id":<%=loginId%>,"workspace_id" : workspace_id},
            		datatype: "json",
            		success : function(data){
            			$.each(data, function(index, item){
            				$.each(item, function(index, item2){
            					var file = "";
            					if(item2.picture=="img"){
                					file =
            						"<div class='file'>" +
            							"<a class='downloadFile' href='image/upload/"+item2.file_name+"' download>" +
                                    		"<div class='file_information' file_id='"+item2.file_id+"' style=\"background-image:url('image/upload/"+item2.file_name+"');\"></div>" +  
                                    	"</a>" +
                                    	"<span class='fileA fileName'>"+item2.file_name+"</span><br/>" +
                                    	"<span class='fileA'>"+item2.workspace_name +"</span>" +
                                	"</div>";
            					} else {
            						file =
            						"<div class='file'>" +
            							"<a class='downloadFile' href='image/upload/"+item2.file_name+"' download>" +
            	                        	"<div class='file_information' file_id='"+item2.file_id+"'>" +
            	                            	"<img class ='file_img "+item2.picture+"' src='image/file.svg' /><br/>" + 
            	                            	"<span class='extension'>"+item2.picture+"</span>" +
            	                        	"</div>" +
            	                        "</a>" +	
            	                        "<span class='fileA fileName'>"+item2.file_name+"</span><br/>" +
            	                        "<span class='fileA'>"+item2.workspace_name+"</span>" +
            	                    "</div>";	
            					}	
            					$("#files").append(file);	
            				});
            			});
            		},
            		error : function(r,s,e){
            			
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
                var workspace_id = $(this).attr("workspace_id");
                $("#workspaceListBtn").attr("workspace_id",workspace_id);
                $("#files").html("");
                $("#recentlyImg").html("");
                $("#recentlyFile").html("");
                $.ajax({
                	type: 'get',
                	url: 'Controller?command=FileSelectWorkspaceAction',
                	data: {"workspace_id": workspace_id, "login_id" : <%=loginId%>},
                	datatype: "json",
                	success : function(data){
                		$.each(data, function(index, item){
                			if(index==0){
                				$.each(item, function(index, item2){
                					var file = "";
                					if(item2.picture=="img"){
	                					file =
                						"<div class='file'>" +
                							"<a class='downloadFile' href='image/upload/"+item2.file_name+"' download>" +
	                                    		"<div class='file_information' file_id='"+item2.file_id+"' style=\"background-image:url('image/upload/"+item2.file_name+"'); \"></div>" +
	                                    	"</a>" +
	                                    	"<span class='fileA fileName'>"+item2.file_name+"</span><br/>" +
	                                    	"<span class='fileA'>"+item2.workspace_name +"</span>" +
	                                	"</div>";
                					} else {
                						file =
                						"<div class='file'>" +
                							"<a class='downloadFile' href='image/upload/"+item2.file_name+"' download>" +
	                	                        "<div class='file_information' file_id='"+item2.file_id+"'>" +
	                	                            "<img class ='file_img "+item2.picture+"' src='image/file.svg' /><br/>" + 
	                	                            "<span class='extension'>"+item2.picture+"</span>" +
	                	                        "</div>" +
	                	                    "</a>" +    
                	                        "<span class='fileA fileName'>"+item2.file_name+"</span><br/>" +
                	                        "<span class='fileA'>"+item2.workspace_name+"</span>" +
                	                    "</div>";	
                					}	
                					$("#files").append(file);
                				});
                			} else if(index==1){
                				var recentlyImg = "";
                				if(item==""){
                					recentlyImg =
										"<p style='font-size:12px; margin-left:5px;'>최근 올린 이미지가 없습니다.</p>";
                					$("#recentlyImg").append(recentlyImg);
                				} else {
									$.each(item, function(index, item3){
										recentlyImg = 
											"<li class='ImgliImg' file_id='"+item3.file_id+"' style='font-size:14px; margin: 5px 0px 0px 0px;'><img src='image/img.svg'/>"+item3.file_name+"</li>";
										$("#recentlyImg").append(recentlyImg);
	                				});
                				}
                			} else if(index==2){
                				var recentlyFile = "";
                				if(item==""){
                					recentlyFile =
										"<p style='font-size:12px; margin-left:5px;'>최근 올린 파일이 없습니다.</p>";
                					$("#recentlyFile").append(recentlyFile);
                				} else {
	                				$.each(item, function(index, item4){
										recentlyFile =										
											"<li class='fileliImg' file_id='"+item4.file_id+"' style='font-size:14px; margin: 5px 0px 0px 0px;'><img src='image/file.svg'/>"+item4.file_name+"</li>";
										$("#recentlyFile").append(recentlyFile);
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
            $(".file_information").click(function(){
            	$(this).attr("file_id");
            });
            $("#close").hover(function(){
            	$(this).children().css("filter","brightness(0) saturate(100%) invert(68%) sepia(74%) saturate(461%) hue-rotate(2deg) brightness(92%) contrast(87%)");
            },function(){
            	$(this).children().css("filter","brightness(0) saturate(100%) invert(93%) sepia(0%) saturate(1646%) hue-rotate(76deg) brightness(95%) contrast(89%)");
            });
            
            $("#documentwrite").on("click", function(){ 
    			$.ajax({   //-->화면 안에서 변할때 사용. 화면 전환해주지 않음.
    				type:"post",
    				url:"Controller?command=getPrivateId", //프라이빗 공간 찾기
    				data:{
    					"loginId": 4
    				},
    				datatype:"json",
    				success:function(data){
    					location.href="Controller?command=writedocument&loginId=4&workspaceId="+data.workspaceId;
    				},
    				error:function(r,s,e){
    					alert("error!");
    				}
    			}); 			
    		});
        });
        
    </script>
</head>
<body>
	<div id="left">
        <button id="close">
            <img src="image/x.svg"/>
        </button>
    </div>
    <div id="right"> 
        <div id="rooptop">
            <div id="top2"></div>
            <div id="top" >
                <div id="leftTop">
                    <%
                    	FileDao fDao = new FileDao();
                    	ArrayList<WorkspaceListDto> wDto = fDao.getFileWorkspaceList(loginId);
                    %>
                    <p id="mainText">파일 </p>
                    <button id="workspaceListBtn" workspace_id="0">모든 공간</button>
					<svg id="workspaceDownSvg" viewBox="0 0 24 24"  class="svg1"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
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
                        <input id="search" type="search" value="" placeholder="검색"/>
                    </div>
                    <p id="subText"><b>어디서든 Drag&Drop으로 파일을 업로드할 수 있습니다.</b></p>
                    <span id="me">내 파일</span>
                    <span id="all" class="on">전체 파일</span>
                    <span><img class="fileTypeAndFilter fileicon" style="margin-left:14px; margin-top: 2px;" src="image/filter.svg " /></span>
                    <span><img class="fileTypeAndFilter fileicon" src="image/list,gird.svg" style="margin-top: 2px;" /></span>
              	</div>
                <div id="rightTop">
                    <div id="do"><a class="hoverRightTop" href="Controller?command=Todo">할 일</a></div>
                    <div id="decision_making"><a class="hoverRightTop" href="Controller?command=dm2">의사결정</a></div>
                    <div id = "fileBoxBtn" class="hoverRightTop">파일함 <img src="image/down.svg"/></div><br/>
                    <div id = "fileBoxList">
                        <div id="fileBtn"><img src="image/file.svg"/>파일</div>
                        <div id="linkbtn">
                        	<a href="Controller?command=LinksAction">
                        		<img src="image/link.svg"/>링크
                        	</a>
                        </div>
                    </div>
                </div>
        	</div>
        </div>
        <div id="bottom">
            <div id="leftBottom">
                <div id="files">
                    <%
                    	ArrayList<FileDto> allWorkspaceTotalFileArr = fDao.getAllWorkspaceTotalFile(loginId);
                    	for(FileDto allWorkspaceTotalFile : allWorkspaceTotalFileArr) {
                    		if(allWorkspaceTotalFile.getPicture().equals("img")){
                    %>		
                    <div class="file">
                    	<a class='downloadFile' href='image/upload/<%=allWorkspaceTotalFile.getFile_name() %>' download>
                        	<div class="file_information" file_id="<%=allWorkspaceTotalFile.getFile_id() %>" style="background-image:url('image/upload/<%=allWorkspaceTotalFile.getFile_name()%>'); "></div>
                        <a/>
                        <span class="fileA fileName"><%=allWorkspaceTotalFile.getFile_name()%></span><br/>
                        <span class="fileA"><%=allWorkspaceTotalFile.getWorkspace_name() %></span>
                    </div>
                    <% 			
                    		} else {
                    %>
                    <div class="file">
                    	<a class='downloadFile' href="image/upload/<%=allWorkspaceTotalFile.getFile_name() %>" download>
                        	<div class="file_information"  file_id="<%=allWorkspaceTotalFile.getFile_id() %>">
                            	<img class ="file_img <%=allWorkspaceTotalFile.getPicture()%>" src="image/file.svg" /><br/> 
                            	<span class="extension"><%=allWorkspaceTotalFile.getPicture()%></span>
                        	</div>
                        </a>
                        <span class="fileA fileName"><%=allWorkspaceTotalFile.getFile_name() %></span><br/>
                        <span class="fileA"><%=allWorkspaceTotalFile.getWorkspace_name() %></span>
                    </div>	
                    <%		
                    		}
                    	}	
                    %>
                </div>
            </div>
            <div id="rightBottom">
                <div class="recentlyFiles">최근 올린 이미지</div>
                <div id="recentlyImg">
                <%
                	ArrayList<RecentlyImgOrFileDto> allWorkspaceRecentlyImgArr = fDao.getAllWorkspaceRecentlyImg(loginId);
          			if(allWorkspaceRecentlyImgArr.size()==0){
          		%>	
          			<p>최근 올린 이미지가 없습니다.</p>
          		<%		
          			} else {
	                	for(RecentlyImgOrFileDto allWorkspaceRecentlyImg : allWorkspaceRecentlyImgArr){
                %>
               		<li class="ImgliImg" file_id="<%=allWorkspaceRecentlyImg.getFile_id()%>"><img src="image/img.svg"/><%=allWorkspaceRecentlyImg.getFile_name()%></li>
                <%			
 		               	}
          			}
                %>
                </div>		
                <div class="recentlyFiles">최근 올린 파일</div>
                <div id="recentlyFile">
                <%
                	ArrayList<RecentlyImgOrFileDto> allWorkspaceRecentlyFileArr = fDao.getAllWorkspaceRecentlyFile(loginId);
          			if(allWorkspaceRecentlyFileArr.size()==0){
          		%>	
          			<p>최근 올린 파일이 없습니다.</p>
          		<%		
          			} else {
	                	for(RecentlyImgOrFileDto allWorkspaceRecentlyFile :allWorkspaceRecentlyFileArr){
                %>
               		<li class="fileliImg" file_id="<%=allWorkspaceRecentlyFile.getFile_id()%>"><img src="image/file.svg"/><%=allWorkspaceRecentlyFile.getFile_name()%></li>
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