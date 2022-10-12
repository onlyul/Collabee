<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <title>협업툴 콜라비 - 한 장으로 끝! 문서기반 협업툴, 콜라비</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<link href="css/homepage_main.css" rel="stylesheet" type="text/css">
    <script>
    	$(function() {
    		// 로그인 모달창
    		$("#login_btn").click(function() {
				$("#login").css('display', 'block');
				$("#email").val("yu60@gmail.com");
	    		$("#password").val("8989898");
	    		$(".button_login").css("opacity",1);
			});
    		// 로그인
    		$("#login_btn").click(function() {
				$("#login").css('display', 'block');
			});
    		$(".button_x_class").click(function() { 
          		$("#login").css('display', 'none');
          	}); 
          	$(".button_x").mouseenter(function() {
          		$(this).find("svg").find("path").css('fill', 'rgb(83, 83, 83)');
          	}).mouseleave(function() {
          		$(this).find("svg").find("path").css('fill', 'rgb(136, 136, 136)');
          	});
          	
          	$("#reset_pw_btn").click(function() {
				$("#login").css('display', 'none');
				$("#resetPW").css('display', 'block');
			});
          	$(".button_x_class2").click(function() { 
          		$("#resetPW").css('display', 'none');
          	}); 
          	$(".button_go_login").click(function() {
          		$("#signUp1").css('display', 'none');
				$("#resetPW").css('display', 'none');
				$("#login").css('display', 'block');
			});
          	
          	//비밀번호 재설정
          	var rPWemail ="";
          	$(".button_for_resetPW").click(function() {
          		rPWemail = $(".resetPW_input_email").val();
          		
          		$.ajax({
          			type:'post',
          			url: 'Controller',
          			data: {'command' : 'SignUpCheckEmail', 'email' : rPWemail},
          			datatype: 'json',
          			success: function(d){
          				if(d.result==1){
          					
          					$.ajax({
          						type:'post',
          						url: 'Controller',
          						data: {'command' : 'ResetPW', 'email' : rPWemail},
          						datatype: 'json',
          						success: function(d){
          							alert(rPWemail + " 로 비밀번호 재설정 메일을 발송했습니다. 메일을 확인 해 주세요.");
          							//alert(d.cert);
          							$(".resetPW_btn_cert").css('display', 'block');
          							$(".resetPW_input_container").css('display', 'block');
          							
          							$(".resetPW_btn_cert").click(function() {
          								var input_PWcert = $(".resetPW_input_cert").val();
          								if(d.cert == input_PWcert){
          									$("#resetPW1").css('display', 'block');
          									$("#resetPW").css('display', 'none');
          								}else{
          									alert("일치하지 않는 인증번호 입니다");
          								}
          								
          							});
          						},
          						error: function(r,s,e){
          							alert("에러");
          						}
          					});
          					
          				}else if(d.result==0){
          					alert("가입되지 않은 이메일 주소입니다.");
          					$(".resetPW_input_email").focus();
          				}
          			},
          			error: function(r,s,e){
          				alert("에러");
          			}
          		});
          		
          	});
          	
          	$(".resetPW1_x_btn").click(function () {
          		$("#resetPW1").css('display', 'none');
          	});
          	
          	// 비밀번호 재설정 유효성 검사
           	$(".resetPW1_input1").change(function () {
	          	var str = $(this).val;
	          	function chkPwd(str){
	          		 var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	          		 if(!reg_pwd.test(str)){
	          		  return false;
	          		 }
	          		 return true;
	          	}
	          	if(!chkPwd( $.trim($('.resetPW1_input1').val()))){ 
	         		alert('비밀번호를 확인하세요. (영문,숫자를 혼합하여 6~20자 이내)');    
	          		$('.resetPW1_input1').val('');
	          		$('.resetPW1_input1').focus(); return false;
	          	}          		
          	}); 
          	
          	$("#resetPW1_btn_cert").click(function() {
          		var n_pw = $(".resetPW1_input2").val()
          		if($(".resetPW1_input1").val() == n_pw){
          			$.ajax({
          				type: 'post',
          				url: 'Controller',
          				data: {'command' : 'ResetPW1', 'email' : rPWemail, 'n_pw' : n_pw},
          				datatype: 'json',
          				success: function(d){
          					if(d.result==1){
          						alert("비밀번호가 변경되었습니다.");
          						$("#resetPW1").css('display', 'none');
          					}else{
          						alert("비밀번호 변경 실패.");
          					}
          				},
          				error: function(r,s,e){
          					alert("에러");
          				}
          				
          			});
          		}else{
          			alert("변경할 비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인해 주세요.")
          		}
          	});
          	
          	
          	//mini_menu
          	$("#collabee_modal_mini_menu>li").mouseenter(function() {
          		$(this).find(".mini_menu_bold").css('color', 'rgb(217, 173, 43)');
          	}).mouseleave(function() {
          		$(this).find(".mini_menu_bold").css('color', '#666666');
          	}); 
          	
			//slider 정신없어서 잠깐 멈춰놓음
            $( document ).ready( function() {
              $( '.slider' ).bxSlider({
            	  auto: true,
            	  pause: 3000
              });
            }); 
    	});
    	
    	$(function () {
    		
          	// 회원가입
          	$("#signUp_btn").click(function() {
				$("#signUp").css('display', 'block');
			});
          	$(".signUp_header_btn").click(function() { 	// X 버튼
          		if(confirm("회원가입을 완료하지 않고 나가시겠습니까?")){
	          		$("#signUp").css('display', 'none');          			
          		} else { }
          	}); 
          	$(".signUp_header_btn").mouseenter(function() {
          		$(this).find("svg").find("path").css('fill', 'rgb(83, 83, 83)');
          	}).mouseleave(function() {
          		$(this).find("svg").find("path").css('fill', 'rgb(136, 136, 136)');
          	});
          	$(".signUp_footer_btn").click(function() {
				$("#signUp").css('display', 'none');
				$("#login").css('display', 'block');
			});
          	
          	// 회원가입외 장소에서 네이버 로그인 눌렀을때
          	$(".login_other_btn_naver, .section_intro_01_social_login_btn_naver").click(function() {
          		$(".signUp_header_h2").text("로그인");
          		$(".signUp_naver_t").text("네이버로 로그인");
          		$("#signUp").css('display', 'block');
          	});
          	
          	// 이메일주소로 가입하기 버튼
          	$(".signUp_body_btn").click(function() {
				$("#signUp").css('display', 'none');
				$("#signUp1").css('display', 'block');
			});
          	
          	// signUp1 이메일 입력
          	$(".signUp1_btn").click(function() {		// X버튼
          		if(confirm("회원가입을 완료하지 않고 나가시겠습니까?")){
					$("#signUp1").css('display', 'none');
          		} else { }	
			});
          	
          	
          	var cert;
          	var email;
          	//계속하기 버튼
          	$("#signUp1_btn1").click(function() { 
          		email = $(this).parent().parent().find(".input_for_request_email").val();
          		
          	  	var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
	          	  if(!regExp.test(email)){
					$("#signUp1").find(".request_email_error_m").css('display','block');
					$("#signUp1").find(".input_for_request_email").focus();
	          	  }else{
	          		  
	            		// 이메일주소 중복 확인
	             		$.ajax({
	            			type: 'post',
	            			url: 'Controller?command=SignUpCheckEmail',
	            			data: {'email' : email},
	            			datatype: "json",	
	            			success: function(d){
	            				if(d.result==0){
	            					$.ajax({
	            						type: 'post',
	            						url: 'Controller?command=SignUpSendEmail',
	            						data: { 'email' : email },
	            						datatype: "json",
	            						success: function(d){
	            							cert = d.cert;
	            						},
	            						error: function(r,s,e){
	            							alert("이메일 전송 ajax 에러");
	            						}
	            					})
	            					
	  			          		alert("인증 메일을 발송하였습니다. 인증 코드를 확인해 주세요.");
	  			          		$("#signUp1").css('display', 'none');
	  			          		$("#signUp2").css('display', 'block');    				
	  			          		
	  			          		$("#signUp2").find(".span_for>b").html(email);
	      					}else{
	      						alert("입력한 이메일은 이미 가입되어 있습니다 로그인을 해주세요.")
	      						$("#signUp1").css('display', 'none');
	      						$("#login").css('display', 'block');
	      						
	      					}
	      				},
	      				error: function(r,s,e){
	      					alert("에러");
	      				}
	            		}) 
	          		  
	          	  }
          		
          	}); 
          	
          	
         	
          	// 인증번호 입력창 x 버튼
          	$(".signUp2_btn").click(function() {
				if(confirm("회원가입을 완료하지 않고 나가시겠습니까?")){
					$("#signUp2").css('display', 'none');
          		} else { }	
			});
          	// 이메일 주소변경 버튼
          	$(".go_signUp1_btn").click(function() { 
          		$("#signUp2").css('display', 'none');
          		$("#signUp1").css('display', 'block');
          	}); 
          	
          	// 인증번호 입력창 인증하기 버튼
          	$("#signUp2_next_btn").click(function() { 
          		var input_cert = $("#signUp2").find(".input_for_request_email").val();
          		if(cert==input_cert){
	          		$("#signUp2").css('display', 'none');
	          		$("#signUp3").css('display', 'block'); 
	          		
	          		$("#signUp3").find(".input_for_request_email").val(email);
          		} else{
          			$("#signUp2").find(".request_email_error_m").css('display','block');
          		}
          	}); 
          	
          	$(".signUp3_btn").click(function() {
				$("#signUp3").css('display', 'none');
			});
          	
          	// 회원 가입 Action 만들기
          	$("#start_collabee").click(function() {
          		var pw = $("#signUp3_request_pw").val();
          		var name = $("#signUp3_request_name").val();
          		
          		$.ajax({
          			type: 'post',
          			url: 'Controller',
          			data: { "command" : "SignUp", "email" : email,  "pw" : pw, "cert": cert,"name" : name},
          			datatype: "json",
          			success: function(d){
          				alert("회원가입이 완료되었습니다!");
          				location.href="Controller?command=LoginCheck&email="+email;
          			},
          			error: function(r,s,e){
          				alert("에러");
          			}
          		}); 
          		
          	});
          	
          	
          	// 입력한 글자 없으면 에러메세지 숨기기
          	$("#signUp1").find(".input_for_request_email").keyup(function() {
          		
          		var error_check = $(this).val().length;
          		if(error_check==0){
          			$("#signUp1").find(".request_email_error_m").css('display','none');
          		}
          	});
			$("#signUp2").find(".input_for_request_email").keyup(function() {
          		
          		var error_check = $(this).val().length;
          		if(error_check==0){
          			$("#signUp2").find(".request_email_error_m").css('display','none');
          		}
          	});
			
			//로그인
			$(".button_login").click(function() {
				var email = $("#email").val();
				var pw = $("#password").val();
				
				$.ajax({
					type: 'post',
					url: 'Controller',
					data: {'command' : 'LoginAccountCheck', 'email' : email, 'pw' : pw},
					datatype: 'json',
					success: function(d){
						if(d.result==1){
							//alert("로그인 성공");
							location.href="Controller?command=LoginCheck&email="+email;   
							
						}else{
							alert("잘못된 아이디 혹은 패스워드 입니다. ")
						}
					},
					error: function(r,s,e){
						alert("에러");
					}
				});
				
			});
          	
			// homepage_top
			$(".section_intro_01_goLogin_btn").click(function() {
				$("#login").css('display', 'block');
			});
			
			$(".section_intro_01_signUp_btn").click(function () {
				var email_input= $(".emailForm_input").val();
				//alert(email_input);
				
           	  	var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
	          	  if(!regExp.test(email_input)){
					alert("올바른 이메일 형식이 아닙니다");
	          	  }else{
	          		  
	            		// 이메일주소 중복 확인
	             		$.ajax({
	            			type: 'post',
	            			url: 'Controller?command=SignUpCheckEmail',
	            			data: {'email' : email_input},
	            			datatype: "json",	
	            			success: function(d){
	            				if(d.result==0){
	            					$.ajax({
	            						type: 'post',
	            						url: 'Controller?command=SignUpSendEmail',
	            						data: { 'email' : email_input },
	            						datatype: "json",
	            						success: function(d){
	            							cert = d.cert;
	            						},
	            						error: function(r,s,e){
	            							alert("이메일 전송 ajax 에러");
	            						}
	            					})
	            					
	  			          		alert("인증 메일을 발송하였습니다. 인증 코드를 확인해 주세요.");
	  			          		$("#signUp1").css('display', 'none');
	  			          		$("#signUp2").css('display', 'block');    				
	  			          		
	  			          		$("#signUp2").find(".span_for>b").html(email_input);
	      					}else{
	      						alert("입력한 이메일은 이미 가입되어 있습니다 로그인을 해주세요.")
	      						$("#signUp1").css('display', 'none');
	      						$("#login").css('display', 'block');
	      						
	      					}
	      				},
	      				error: function(r,s,e){
	      					alert("에러");
	      				}
	            		});  
	          	  }		 
			});
			
    	});
    </script>
    
    <script>
    	// homepage_bottom
    	$(function () {
			$(".start_login_bnt").click(function () {
				$("#login").css('display', 'block');
			});
    		
    	});
/* 			$(".free_start_bnt").click(function() {
				
				var email1 = $(".emailVal").val();
				alert(email1);
				
          	  	var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
	          	  if(!regExp.test(email)){
					alert("올바른 이메일 형식이 아닙니다");
	          	  }else{
	          		  
	            		// 이메일주소 중복 확인
	             		$.ajax({
	            			type: 'post',
	            			url: 'Controller?command=SignUpCheckEmail',
	            			data: {'email' : email},
	            			datatype: "json",	
	            			success: function(d){
	            				if(d.result==0){
	            					$.ajax({
	            						type: 'post',
	            						url: 'Controller?command=SignUpSendEmail',
	            						data: { 'email' : email },
	            						datatype: "json",
	            						success: function(d){
	            							cert = d.cert;
	            						},
	            						error: function(r,s,e){
	            							alert("이메일 전송 ajax 에러");
	            						}
	            					})
	            					
	  			          		alert("인증 메일을 발송하였습니다. 인증 코드를 확인해 주세요.");
	  			          		$("#signUp1").css('display', 'none');
	  			          		$("#signUp2").css('display', 'block');    				
	  			          		
	  			          		$("#signUp2").find(".span_for>b").html(email);
	      					}else{
	      						alert("입력한 이메일은 이미 가입되어 있습니다 로그인을 해주세요.")
	      						$("#signUp1").css('display', 'none');
	      						$("#login").css('display', 'block');
	      						
	      					}
	      				},
	      				error: function(r,s,e){
	      					alert("에러");
	      				}
	            		});
	          		  
	          	  }
			});   */  	
    </script>
    
    <script>
		$(function(){
			$('.f_btn1').click(function(){
				if($('.language').css('display')=='none'){
					/* if($('.language').css('display')!='none') {
	            		$('.language').css('display', 'none');
	          		} */
	        		$('.language').css('display','block');
	        		$('.f_btn1').addClass('clicked');
	        	} else {
	        		$('.language').css('display','none');
	        		$('.f_btn1').removeClass('clicked');
	        		
	        	}
			});
			
			$('.l_detail').click(function(){
				$('.language').css("display", "none");
			});
			
			$("#en").click(function(){
				alert("준비 중입니다.");
			});
			
		});
    </script>
    
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

    
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
    	$(function() {
    		$(".social_btn_kakao, .login_other_kakao, .section_intro_01_social_login_btn_kakao").click(function () {
    			Kakao.init('e72732e76a557126533ba844c5bc494d');
    			console.log(Kakao.isInitialized());
    			
    		    Kakao.Auth.login({
    		      success: function (response) {
    		        Kakao.API.request({
    		          url: '/v2/user/me',
    		          success: function (response) {
    		        	  console.log(response)
    		        	  var kakao_id = "K" + (response.id);
    		        	  //alert(kakao_id);
    		        	  var name = response.properties.nickname;
    		        	  var picture = response.properties.profile_image;
    		        	  
    		        	  $.ajax({	// 가입되어있는지 확인
    		        		type: 'post',
    		        		url: 'Controller',
    		        		data: {'command' : 'SignUpCheckEmail', 'email' : kakao_id},
    		        	  	datatype: 'json',
    		        	  	success: function(d){
    		        	  		if(d.result == 1){	// 로그인

									alert("로그인 되었습니다");
									location.href="Controller?command=LoginCheck&email="+kakao_id;

    		        	  		}else{		//카카오 회원가입
    		        	  			$.ajax({
    		        	  				type: 'post',
    		        	  				url: 'Controller',
    		        	  				data: {'command' : 'SignUpKakao', 'email' : kakao_id, 'name' : name, 'picture' : picture},
    		        	  				datatype: 'json',
    		        	  				success: function(d){
    		        	  					if(d.result==1){
	    		        	  					alert("회원가입이 완료되었습니다!");
	    		                  				location.href="Controller?command=LoginCheck&email="+kakao_id;    		        	  						
    		        	  					}else{
    		        	  						alert("카카오 api 회원가입 실패");
    		        	  					}
    		        	  					
    		        	  				},
    		        	  				error: function(r,s,e){
    		        	  					alert("회원가입 실패");
    		        	  				}
    		        	  				
    		        	  			});
    		        	  		}
    		        	  	},
    		        	  	error: function(r,s,e){
    		        	  		alert("에러");
    		        	  	}
    		        	  });
    		        	  
    		          },
    		          fail: function (error) {
    		            console.log(error)
    		          },
    		        })
    		      },
    		      fail: function (error) {
    		        console.log(error)
    		      },
    		    })
    		  
    		});
    		

    	});
    </script>
    
</head>
<body>
    <section class="section1_web row">
        <div class="menubar_web row">
            <div style="padding-top:18px; padding-right:200px;">
                <a href="homepage_main.jsp" style="cursor:pointer;"><svg width="134.4" height="32.4" viewBox="0 0 800 188" version="1.1"><title>Collabee</title><g id="collabee" stroke="none" stroke-width="1" fill="#d9ad2b" fill-rule="evenodd"><g id="collabee_logo" transform="translate(-2199.000000, -306.000000)" fill="#d9ad2b"><g id="Group-2" transform="translate(1900.000000, 0.000000)"><path d="M394.31736,411.192678 L417.772183,434.563735 C431.409272,448.147302 431.409272,470.20286 417.772183,483.79636 C404.271464,497.265165 382.447985,497.399853 368.790516,484.200424 L368.37917,483.79636 L330.119875,445.663888 C335.495266,451.009544 355.591986,449.437092 369.215732,436.194694 L369.62657,435.789832 L394.31736,411.192678 Z M958.789528,358 C972.762337,358 983.522145,361.558521 990.919865,368.785622 C998.141831,375.841021 1001.80953,385.861327 1001.99287,398.676013 L1002,400.068742 L1001.96144,404.945938 L1001.93,407.761854 C1000.22947,407.918136 997.711771,408.003156 994.376916,408.016913 C994.020503,408.018384 993.490522,408.019787 992.809816,408.021116 L992.333934,408.021991 C991.919175,408.022711 991.459464,408.023407 990.958717,408.024078 L990.338374,408.024872 C990.018605,408.025262 989.684627,408.025644 989.337286,408.026016 L988.625039,408.026747 C988.503445,408.026867 988.380429,408.026986 988.256022,408.027103 L987.287029,408.027973 C986.789723,408.028398 986.273584,408.028807 985.740315,408.029199 L984.651445,408.029961 C984.096097,408.03033 983.524756,408.030683 982.939128,408.031019 L981.141092,408.031971 L980.833804,408.032119 L980.833804,408.032119 L979.267568,408.032815 C979.055584,408.032903 978.842391,408.032988 978.628053,408.033071 L976.005067,408.03397 L975.670671,408.034068 L975.670671,408.034068 L971.917492,408.034921 C971.686564,408.03496 971.455123,408.034997 971.223231,408.035031 L961.392174,408.035042 L961.044317,408.034987 L961.044317,408.034987 L957.274365,408.034114 C957.049716,408.034046 956.825879,408.033976 956.602919,408.033902 L954.621625,408.033164 C954.404488,408.033073 954.188416,408.032979 953.973472,408.032883 L952.697858,408.03227 C952.487681,408.032162 952.278758,408.032051 952.071154,408.031937 L950.841848,408.031218 C950.639768,408.031093 950.439133,408.030964 950.240004,408.030832 L949.063829,408.030005 C948.225368,408.029379 947.417791,408.028694 946.646288,408.027951 L945.738132,408.027029 C943.364331,408.024495 941.381196,408.021342 939.958826,408.01751 C940.022181,411.542318 941.702566,415.234262 945.378473,417.846532 C949.05438,420.458802 955.681971,423.549841 963.527798,423.549841 C971.79489,423.549841 978.541852,422.700011 983.495419,421.057128 C987.517595,419.723146 991.333122,417.875032 994.604438,415.78136 L994.604859,434.581126 C992.937836,435.593133 990.896711,436.632681 988.415131,437.615306 C982.727235,439.867528 973.650163,442 964.823689,442 C955.997215,442 946.949276,440.787809 939.956585,437.934714 C932.805324,435.019982 924.735595,430.268372 920.456361,424.131336 C916.13993,417.937166 914,410.275826 914,401.224578 C914,387.29112 917.91971,376.500379 925.832175,369.054325 C933.690649,361.656092 944.723719,358 958.789528,358 Z M1055.78953,358 C1069.76234,358 1080.52214,361.558521 1087.91987,368.785622 C1095.14183,375.841021 1098.80953,385.861327 1098.99287,398.676013 L1099,400.068742 L1098.96144,404.945938 L1098.93,407.761854 C1097.22947,407.918136 1094.71177,408.003156 1091.37692,408.016913 C1091.0205,408.018384 1090.49052,408.019787 1089.80982,408.021116 L1089.33393,408.021991 C1088.91918,408.022711 1088.45946,408.023407 1087.95872,408.024078 L1087.33837,408.024872 C1087.0186,408.025262 1086.68463,408.025644 1086.33729,408.026016 L1085.62504,408.026747 C1085.50344,408.026867 1085.38043,408.026986 1085.25602,408.027103 L1084.28703,408.027973 C1083.78972,408.028398 1083.27358,408.028807 1082.74032,408.029199 L1081.65145,408.029961 C1081.0961,408.03033 1080.52476,408.030683 1079.93913,408.031019 L1078.14109,408.031971 L1077.8338,408.032119 L1077.8338,408.032119 L1076.26757,408.032815 C1076.05558,408.032903 1075.84239,408.032988 1075.62805,408.033071 L1073.00507,408.03397 L1072.67067,408.034068 L1072.67067,408.034068 L1068.91749,408.034921 C1068.68656,408.03496 1068.45512,408.034997 1068.22323,408.035031 L1058.39217,408.035042 L1058.04432,408.034987 L1058.04432,408.034987 L1054.27436,408.034114 C1054.04972,408.034046 1053.82588,408.033976 1053.60292,408.033902 L1051.62163,408.033164 C1051.40449,408.033073 1051.18842,408.032979 1050.97347,408.032883 L1049.69786,408.03227 C1049.48768,408.032162 1049.27876,408.032051 1049.07115,408.031937 L1047.84185,408.031218 C1047.63977,408.031093 1047.43913,408.030964 1047.24,408.030832 L1046.06383,408.030005 C1045.22537,408.029379 1044.41779,408.028694 1043.64629,408.027951 L1042.73813,408.027029 C1040.36433,408.024495 1038.3812,408.021342 1036.95883,408.01751 C1037.02218,411.542318 1038.70257,415.234262 1042.37847,417.846532 C1046.05438,420.458802 1052.68197,423.549841 1060.5278,423.549841 C1068.79489,423.549841 1075.54185,422.700011 1080.49542,421.057128 C1084.5176,419.723146 1088.33312,417.875032 1091.60444,415.78136 L1091.60486,434.581126 C1089.93784,435.593133 1087.89671,436.632681 1085.41513,437.615306 C1079.72724,439.867528 1070.65016,442 1061.82369,442 C1052.99721,442 1043.94928,440.787809 1036.95658,437.934714 C1029.80532,435.019982 1021.7356,430.268372 1017.45636,424.131336 C1013.13993,417.937166 1011,410.275826 1011,401.224578 C1011,387.29112 1014.91971,376.500379 1022.83217,369.054325 C1030.69065,361.656092 1041.72372,358 1055.78953,358 Z M838.290203,339 L838.288276,364.559952 L838.874395,364.200045 C840.805068,363.047969 842.879018,362.056406 845.094001,361.225292 L846.213235,360.823106 L847.211798,360.493128 C852.484469,358.819822 858.1,357.986006 864.051579,357.986006 C872.040986,357.986006 879.237636,359.764568 885.596484,363.331581 C891.978042,366.911333 896.994379,371.918 900.601213,378.309028 C904.20455,384.691148 906,391.986392 906,400.145571 C906,408.407933 904.204349,415.730693 900.596169,422.066232 C896.982907,428.414924 891.956395,433.348879 885.56268,436.824953 C879.210543,440.278422 872.026156,442 864.051579,442 C857.452369,442 851.716345,441.105452 846.845706,439.291702 C844.125935,438.278902 841.469434,436.907542 838.876688,435.181457 L837.907397,434.517556 L837.67136,434.348687 L837.673112,440 L813,440 L813,339 L838.290203,339 Z M762.228768,358 C768.80678,358 774.46643,358.553722 779.221413,359.675087 C784.113902,360.828069 788.200743,362.628219 791.455785,365.098567 C794.807784,367.640016 797.267738,370.936354 798.799986,374.933093 C800.176231,378.524376 800.899942,382.674684 800.99032,387.379044 L801,388.3956 L801,440 L777.861413,440 L777.860877,435.320792 L777.635758,435.452876 C775.666824,436.569192 773.38088,437.646087 770.700931,438.769555 L768.811734,439.543783 C764.46089,441.287981 759.601097,442 753.495282,442 L752.592885,441.997228 L750.886471,441.974001 C746.775313,441.88472 743.780251,441.552583 740.878265,440.781092 C736.936723,439.730138 733.491796,438.155705 730.557742,436.047153 C727.54528,433.882252 725.189409,431.176574 723.520106,427.955626 C721.832818,424.706444 721,420.961464 721,416.758128 C721,412.16806 722.068588,408.100907 724.221479,404.624065 C726.358833,401.169663 729.512016,398.350325 733.622011,396.16964 C737.587969,394.063845 742.441623,392.530495 748.185852,391.546555 C753.438778,390.646303 759.448905,390.168984 766.222007,390.109343 L767.685066,390.102953 L777.860877,390.101587 C777.846597,388.254385 777.766522,386.926757 777.62065,386.118702 C777.401843,384.906619 776.724942,383.398904 775.734159,382.604347 C774.743376,381.80979 773.569277,380.944377 770.72613,380.108291 C767.882982,379.272205 764.183274,378.804101 760.581054,378.804101 C756.978833,378.804101 753.975156,379.163396 750.67578,379.828022 C747.376403,380.492649 741.086683,382.580122 737.826344,384.157673 C735.652785,385.209373 733.210043,386.483274 730.498119,387.979376 L730.671609,364.934662 L733.286091,363.818251 L734.956755,363.130281 C737.445056,362.127557 739.825941,361.270624 741.724334,360.751904 C744.696726,359.939318 747.920628,359.279204 751.392657,358.771412 C754.89907,358.256896 758.511398,358 762.228768,358 Z M588.5,358 C597.610493,358 605.669636,359.69868 612.647815,363.118631 C619.702382,366.574517 625.214658,371.493118 629.130086,377.844946 C633.047866,384.199054 635,391.605065 635,399.99929 C635,408.593202 633.050102,416.100867 629.130423,422.459592 C625.208498,428.823499 619.683812,433.697719 612.614904,437.049071 C605.643787,440.357006 597.596467,442 588.5,442 C579.402293,442 571.354932,440.357074 564.384361,437.049399 C557.314972,433.69709 551.789438,428.822464 547.86832,422.459866 C543.949029,416.10177 542,408.594492 542,399.99929 C542,391.610492 543.92197,384.211023 547.781185,377.861805 C551.645398,371.500283 557.166612,366.574052 564.280213,363.114792 C571.308748,359.697636 579.390814,358 588.5,358 Z M500.553774,358 C512.585353,358 522.324314,360.376937 529.730212,365.206167 L529.730212,365.206167 L531.074122,366.082503 L531.074122,388.82923 L526.480214,385.601196 C520.326242,381.276942 512.374029,379.088557 502.558661,379.088557 C495.284852,379.088557 489.649129,380.847617 485.539475,384.300802 C481.59592,387.613225 479.585103,392.81295 479.585103,400.152543 C479.585103,407.383052 481.589492,412.501074 485.524958,415.76371 C489.640828,419.175906 495.178592,420.910024 502.249563,420.910024 C512.088664,420.910024 520.479358,418.611616 527.488589,414.034986 L527.488589,414.034986 L532,411.089291 L532,433.444216 L530.673368,434.322722 C526.690844,436.95998 522.199726,438.902023 517.211096,440.152056 C512.289594,441.38751 506.634353,442 500.246093,442 C491.206971,442 483.209197,440.38481 476.278951,437.133978 C469.244953,433.835194 463.745563,429.012495 459.842262,422.699464 C455.939479,416.387864 454,408.849911 454,400.152543 C454,391.450095 455.966396,383.885836 459.92296,377.522331 C463.874769,371.168944 469.39152,366.30028 476.4148,362.950823 C483.351217,359.642002 491.404005,358 500.553774,358 Z M711,340 L711,440 L686,440 L686,340 L711,340 Z M670,340 L670,440 L645,440 L645,340 L670,340 Z M358.420773,375.75774 L358.833922,376.161635 L383.624733,400.750275 L358.82392,425.368716 C345.146822,438.957959 322.947972,438.957959 309.270875,425.368716 C308.413555,424.534289 307.604818,423.641679 306.856092,422.720687 C295.633785,409.051975 296.431092,388.898003 309.270875,376.161635 C322.811201,362.69845 344.703697,362.563818 358.420773,375.75774 Z M778.333972,408.349946 C768.823424,408.38309 763.359884,408.415179 761.943351,408.44621 C759.818553,408.492758 757.893421,408.587913 754.811182,408.865258 C751.728944,409.142603 749.677839,410.020133 748.343937,410.775791 C747.124181,411.467238 746.304537,412.234192 745.820058,413.074348 C745.325469,413.930449 745.073302,414.932391 745.073302,416.135196 C745.073302,417.685936 746.1287,419.532685 748.288273,420.757862 C750.447845,421.983038 755.803965,422.516663 758.786797,422.516663 C761.769629,422.516663 766.469926,421.989625 769.204071,421.257959 C773.020038,420.236794 776.583297,418.794412 778.333972,416.466924 C778.332917,415.876062 778.332143,415.250361 778.331651,414.589821 L778.331651,410.801898 C778.332143,410.01942 778.332917,409.202103 778.333972,408.349946 Z M588.5,379.088557 C582.009111,379.088557 577.054758,380.925901 573.455067,384.568556 C569.857391,388.209193 568.036369,393.293225 568.036369,399.99929 C568.036369,406.299164 569.880852,411.296503 573.569425,415.160536 C577.225727,418.991988 582.136817,420.910024 588.5,420.910024 C594.861917,420.910024 599.772936,418.991895 603.429819,415.159835 C607.118291,411.297208 608.962205,406.300568 608.962205,399.99929 C608.962205,393.293225 607.141184,388.209193 603.543513,384.568562 C599.943901,380.925988 594.989625,379.088557 588.5,379.088557 Z M859.268059,379.078076 C854.295377,379.078076 849.909008,380.409416 846.030089,383.082175 C842.402497,385.581389 839.874744,388.818682 838.39086,392.862086 L838.288276,393.152711 L838.288276,406.957272 L838.388732,407.22812 C839.865266,411.048981 842.215777,414.133058 845.479572,416.534212 L846.102246,416.976439 C849.928629,419.59891 854.290038,420.90651 859.268059,420.90651 C865.528284,420.90651 870.558258,418.990059 874.519234,415.147837 C878.448305,411.336527 880.400542,406.401972 880.400542,400.145571 C880.400542,393.879473 878.440983,388.881828 874.49504,384.966287 C870.534613,381.035141 865.514934,379.078076 859.268059,379.078076 Z M958.86933,377.259139 C952.409234,377.259139 948.172734,378.737559 944.69436,381.979409 C942.101016,384.397342 940.616183,386.901255 940.027711,390.130031 L939.925487,390.754586 L977.510593,390.754586 L977.495877,390.609769 C977.050768,387.132523 975.780586,384.530721 973.513413,382.163422 L973.12629,381.770933 C970.114377,378.802492 965.413394,377.259139 958.86933,377.259139 Z M1055.86933,377.259139 C1049.40923,377.259139 1045.17273,378.737559 1041.69436,381.979409 C1039.10102,384.397342 1037.61618,386.901255 1037.02771,390.130031 L1036.92549,390.754586 L1074.51059,390.754586 L1074.49588,390.609769 C1074.05077,387.132523 1072.78059,384.530721 1070.51341,382.163422 L1070.12629,381.770933 C1067.11438,378.802492 1062.41339,377.259139 1055.86933,377.259139 Z M417.775041,316.198674 C431.402128,329.803527 431.41213,351.839217 417.775041,365.434137 L394.310216,388.806613 L369.627998,364.198106 C355.999482,350.593253 335.549563,348.914464 330.119875,354.343918 L368.380599,316.187321 C382.017689,302.602335 404.127949,302.602335 417.775041,316.198674 Z"></path></g></g></g></svg></a>
            </div>
            <div>
	            <ul class="menu_tab">
	                <li id="collabee_modal_mini_menu_btn" style="width:150px; height:70px;">문서기반 협업툴
	                    <svg viewBox="0 0 24 24" width="12px" height="12px"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z" color="#222222"></path></svg>    
	                	
						<div id="collabee_modal_mini_menu_container">
			                <ul id="collabee_modal_mini_menu">
			                	<li><a href="web_workspace.jsp"><span class="mini_menu_bold">협업공간</span><span>동료와 함께하는 공간</span></a></li>
			                	<li><a href="homepage_1.jsp"><span class="mini_menu_bold">문서</span><span>협업을 시작하는 실시간 동시편집 문서</span></a></li>
			                	<li><a href="web_thread.jsp"><span class="mini_menu_bold">실시간 대화</span><span>모든 문서, 할 일, 파일에서 나누는 실시간 커뮤니케이션</span></a></li>
			                	<li><a href="homepage_2.jsp"><span class="mini_menu_bold">이슈 업데이트</span><span>나에게 필요한 소식을 문서별<br/>로 일려주는 알림 리스트</span></a></li>
			                	<li><a href="web_calendar.jsp"><span class="mini_menu_bold">캘린더</span><span>나와 동료의 일정/할 일 파악 및 스케쥴 관리</span></a></li>
			                	<li><a href="homepage_3.jsp"><span class="mini_menu_bold">칸반</span><span>문서 진행상황 파악 및 관리</span></a></li>
			                	<li><a href="web_ganttchart.jsp"><span class="mini_menu_bold">간트차트</span><span>쉽고 빠른 일정 추적과 관리</span></a></li>
			                	<li><a href="homepage_4.jsp"><span class="mini_menu_bold">컨텐츠 모음</span><span>파일, 할 일, 의사결정, 링크를 쉽고 빠르게 찾을 수 있는 공간</span></a></li>
			                	<li style="margin-right: 150px;"><a href="web_admin.jsp"><span class="mini_menu_bold">관리자 기능</span><span>동료 관리, 협업공간 관리</span></a></li>
				                <div class="collabee_modal_mini_menu_line"></div>
			                	<li style="width: 315px;">
			                		<a href="homepage_5.jsp"><span class="mini_menu_bold">콜라비의 보안</span><span>최우선적인 데이터 보호, 개인정보보호 유지</span></a>
			                	</li> 
			               	</ul>
						</div>

					</li>
	                <li onclick="alert('서비스가 준비중입니다.')">메신저형 협업툴</li>
	                <li onclick="alert('서비스가 준비중입니다.')" style="width:80px;">다운로드</li>
	                <li onclick="alert('서비스가 준비중입니다.')" style="width:60px;">가격</li>
	                <li onclick="alert('서비스가 준비중입니다.')" style="width:84px;">도입문의</li>
	                <li id="login_btn" style="width:80px;">로그인</li>
	                <li id="signUp_btn" style="width:150px;"><button class="login_bnt_sec1"><span>무료로 시작하기</span></button></li>
	            </ul>
            </div>
        </div>
        

	</section>
    
    <!-- 로그인 -->
		<div id="login">
			<div class="overlay">
				<div class="white_box">
					<div class="white_box_center">
					
						<div id=title_and_x style="position: relative;">
							<div >
								<h2 style="font-size: 16px; line-height: 24px;">로그인</h2>
							</div>
							
							<button class="button_x_class button_x">
								<svg viewBox="0 0 24 24" width="24px" height="24px" style="vertical-align: middle;">
									<path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="button_x"></path>
								</svg>
							</button>
							
							<div class="login_other">
								<button class="login_other_button login_other_btn_naver">
									<div class="signUp_body_btn_iconcontainer" style="margin-right: 80px; margin-bottom: -3px;">
			   							<img src="images/naver.png" style="border-radius: 0px;"/>
			   						</div>
			   						<div>Naver</div>
								</button>
								<button class="login_other_button login_other_kakao">
									<img src="images/kakao.png" style="margin-right:5px; width: 30px; height: 30px;"/>
									<div>Kakao</div>
								</button>
							</div>
							
							<div class="login_line">
								<div class="login_line2">또는</div>
							</div>
							

								<div style="margin-top: 33px;">
								
									<div class="input_line_wrap">
										<h3 class="input_line_wrap_h3">
											<label for="email" class="input_line_wrap_label">
												<span>이메일 주소</span>
											</label>
										</h3>
										<input readonly type="text" id="email" name="userEmail" placeholder="name@example.com" autocomplete="off" class="input_line" value="" required="">
									</div>
									<span class="validate"></span>
									
									<div class="input_line_wrap" style="margin-top: 16px;">
										<h3 class="input_line_wrap_h3">
											<label for="password" class="input_line_wrap_label">
												<span>비밀번호</span>
											</label>
										</h3>
										<input readonly type="password" id="password" name="userPwd" placeholder="숫자, 영문 조합 최소 6자 이상" autocomplete="off" class="input_line" value="">
										<span class="validate"></span>
									</div>
									
									<div class="login_help">
										<label style="display: none">
											<input type="checkbox"  style="display: none;" checked>
											<svg viewBox="0 0 24 24" width="18px" height="18px" class="auto_login">
												<path d="M17,3 C19.209139,3 21,4.790861 21,7 L21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 L3,7 C3,4.790861 4.790861,3 7,3 L17,3 Z M16.59,7.58 L10,14.17 L7.41,11.59 L6,13 L10,17 L18,9 L16.59,7.58 Z" color="#D9AD2B" class="auto_login_checkbox"></path>
											</svg>
											<span>자동 로그인</span>
										</label>
										
										<button id="reset_pw_btn" type="button" class="button_text" style="margin-left: 310px;">
											<span>
												비밀번호가 생각나지 않으세요?
											</span>
										</button>
									</div>
									
								</div>
							
								<div style="margin-top: 24px;">
									<button class="button_login" type="button">
										<span>로그인</span>
									</button>
								</div>
							
						</div>
						
					</div>
				</div>
			</div>
		</div>


		<div id=resetPW>
			<div class="overlay">
				<div class="white_box">
						<div class="white_box_center">
						
							<button class="button_x_class2">
								<svg viewBox="0 0 24 24" width="24px" height="24px" style="vertical-align: middle;">
									<path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="button_x"></path>
								</svg>
							</button>
							
							<header class="header_for">
								<h2 class="h2_for">비밀번호 재설정</h2>
								<span class="span_for">콜라비 계정을 입력하여 인증메일을 발송해 주세요. 인증메일은 30분간 유효합니다.</span>
							</header>
							
							
							<div class="request_email">
								<div class="request_email_container">
									<label class="label_for_request_email">
										이메일 주소
									</label>
									<div class="inputBox_for_request_email">
										<input name="resetPW_input_email" type="email" placeholder="name@example.com" autocomplete="off" maxlength="50" class="input_for_request_email resetPW_input_email" value="">
										<button type="button" class="button_for_resetPW">인증메일 발송</button>
									</div>
								</div>
								
								<div class="request_email_container resetPW_input_container">
									<label class="label_for_request_email">
										인증번호
									</label>
									<div class="inputBox_for_request_email">
										<input  type="text" placeholder="메일에 있는 코드를 입력해 주세요." autocomplete="off" maxlength="50" class="input_for_request_email resetPW_input_cert" value="" required>
									</div>
								</div>
							</div>
							
							
							<footer class="footer_for_resetPW">
								<button type="button" class="resetPW_btn_cert">인증하기</button>
							</footer>
							
						</div>
				</div>
			</div>
		</div>
	

	<div id=resetPW1>
		<div class="overlay">
			<div class="white_box">
				<div class="white_box_center">
						
					<button class="button_x_class2 resetPW1_x_btn">
						<svg viewBox="0 0 24 24" width="24px" height="24px" style="vertical-align: middle;">
							<path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="button_x"></path>
						</svg>
					</button>
							
					<header class="header_for">
						<h2 class="h2_for">비밀번호 변경</h2>
						<span class="span_for">새 비밀번호를 설정해 주세요.</span>
					</header>
							
							
					<div class="request_email">
						<div class="request_email_container">
							<label class="label_for_request_email">
								새 비밀번호
							</label>
							<div class="inputBox_for_request_email">
								<input name="resetPW1_input1" type="password" placeholder="숫자, 영문 조합 최소 6자 이상" autocomplete="off" maxlength="50" class="input_for_request_email resetPW1_input1" value="">
							</div>
						</div>
								
						<div class="request_email_container resetPW_input_container">
							<label class="label_for_request_email">
								새 비밀번호 확인
							</label>
							<div class="inputBox_for_request_email">
								<input  name="resetPW1_input2" type="password" placeholder="비밀번호를 다시 한 번 입력해주세요." autocomplete="off" maxlength="50" class="input_for_request_email resetPW1_input2" value="">
							</div>
						</div>
					</div>
							
							
					<footer class="footer_for_resetPW">
						<button type="button" id="resetPW1_btn_cert">비밀번호 변경하기</button>
					</footer>
							
				</div>
			</div>
		</div>
	</div>

	<div id=signUp>
		<div class="overlay">
			<div class="white_box">
				<div class="white_box_center_signUp">
					
					<header class="signUp_header">
						<h2 class="signUp_header_h2">회원 가입</h2>
						<button class="signUp_header_btn">
							<svg viewBox="0 0 24 24" width="24px" height="24px" class="signUp_header_btn_svg"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="signUp_header_btn_path"></path></svg>
						</button>
					</header>
					
					<div class="signUp_body">
						<button class="signUp_body_social_btn social_btn_naver" type="button">
							<div id="naver_id_login" style="padding-top: 2px; padding-left: 2px;"></div>
							<div style="margin-right: 36px;"class="signUp_naver_t">Naver로 가입하기</div>
						</button>
						
							<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
						  	<script type="text/javascript">
							  	
									// 네이버아디디로로그인 초기화 Script
									var naver_id_login = new naver_id_login("poEf92BJ2xNwHBiybXyc", "http://localhost:9090/CollabeeWeb/homepage_main.jsp");
									var state = naver_id_login.getUniqState();
									naver_id_login.setButton("transparent", 1,33);
									naver_id_login.setDomain(".service.com");
									naver_id_login.setState(state);
									naver_id_login.init_naver_id_login();
									
									// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
									var email = null;
									function naverSignInCallback() {
									
										email = naver_id_login.getProfileData('email');
										location.href="Controller?command=SignUpNaver&email=" + email;
										//alert(email);
									}
									// 네이버 사용자 프로필 조회
									if(naver_id_login.is_callback == true){
										naver_id_login.get_naver_userprofile("naverSignInCallback()");	
									}									
							 	</script>
						
						<button class="signUp_body_social_btn social_btn_kakao">
							<div class="signUp_body_btn_iconcontainer">
								<img src="images/kakao.png" style="margin-top: 2px;"/>	
							</div>
							<div>KaKao로 가입하기</div>
						</button>
						
						<div class="signUp_body_divider">
							<div class="signUp_body_divider_text">또는 가입</div>
						</div>
						
						<button class="signUp_body_btn">이메일주소로 가입하기</button>
					</div>
					
					<footer class="signUp_footer" style="margin-top: 12px;">
						<div class="signUp_footer_message">
							<span class="signUp_footer_span">이미 가입하셨나요?</span>
							<button class="signUp_footer_btn">로그인하기</button>
						</div>
					</footer>
				</div>
			</div>
		</div>
	</div>

	<div id="signUp1">
		<div class="overlay">
			
			<div class="signUp1_modal">
				<div class="signUp1_wrapper">
					<button type="button" color="mono3Grey" class="signUp_btn_x signUp1_btn">
						<svg viewBox="0 0 24 24" width="24px" height="24px" class="signUp_header_btn_svg"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="signUp_header_btn_path"></path></svg>
					</button>
					
					<div class="signUp1_content">
						<header class="header_for">
							<h2 class="h2_for">회원 가입</h2>
							<span class="span_for">가입할 이메일 주소를 입력하여 인증을 해주세요.</span>
						</header>
						
						<div class="request_email">
							<div class="request_email_container">
								<label class="label_for_request_email">
									이메일 주소
								</label>
								<div class="inputBox_for_request_email">
									<input type="email" placeholder="name@example.com" autocomplete="off" maxlength="50" class="input_for_request_email" value="" >
								</div>
								<div class="request_email_error_m">
									<span>올바르지 않은 형식의 이메일 주소입니다.</span>
								</div>
							</div>
							
						</div>
						
						<footer class="signUp_footer">
							<div class="signUp1_message">
								<span>이미 가입하셨나요?</span>
								<button type="button" class="button_go_login" style="margin-left: 4px;">로그인하기</button>
							</div>
							
							<button type="button" id="signUp1_btn1" class="signUp1_btn1_class">계속하기</button>
						</footer>
					</div>
				</div>			
			</div>
			
		</div>
	</div>

	<div id="signUp2">
		<div class="overlay">
			<div class="signUp1_modal">
				<div class="signUp1_wrapper">
					<button color="mono3Grey" class="signUp_btn_x signUp2_btn">
						<svg viewBox="0 0 24 24" width="24px" height="24px" class="signUp_header_btn_svg"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="signUp_header_btn_path"></path></svg>
					</button>
					
					<div class="signUp1_content">
						<header class="header_for">
							<h2 class="h2_for">가입 인증메일이 발송되었습니다.</h2>
							<span class="span_for">
								<b>anest_@naver.com</b>
								로 메일이 발송되었습니다. 인증번호를 확인해 주세요.
							</span>
						</header>
						
						<div class="request_email">
							<div class="request_email_container">
								<label class="label_for_request_email">
									인증번호
								</label>
								<div class="inputBox_for_request_email">
									<input type="text" placeholder="메일에 있는 번호를 입력해 주세요." autocomplete="off" maxlength="50" class="input_for_request_email" value="">
								</div>
								
								<div class="request_email_error_m">
									<span>올바르지 않은 인증번호 입니다</span>
								</div>
							</div>
						</div>
						
						<footer class="signUp_footer">
							<button class="go_signUp1_btn">이메일주소 변경</button>
							<button id="signUp2_next_btn" class="signUp1_btn1_class">인증하기</button>
						</footer>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="signUp3">
		<div class="overlay">
			<div class="signUp1_modal">
				<button type="button" color="mono3Grey" class="signUp_btn_x signUp3_btn">
						<svg viewBox="0 0 24 24" width="24px" height="24px" class="signUp_header_btn_svg"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="signUp_header_btn_path"></path></svg>
				</button>
				
				<div class="signUp3_content">
					<header class="header_for">
							<h2 class="h2_for">회원 가입</h2>	
					</header>
					
					<div class="signUp3_body">
						<div class="request_email">
							<div class="request_email_container">
								<label class="label_for_request_email">이메일 주소</label>
								<div class="inputBox_for_request_email">
									<input type="text" readonly disabled autocomplete="off" maxlength="50" class="input_for_request_email" value="anest_@naver.com">
								</div>
							</div>
						</div>
						
						<div class="request_email">
							<div class="request_email_container">
								<label class="label_for_request_email">비밀번호</label>
								<div class="inputBox_for_request_email">
									<input id="signUp3_request_pw" type="password" placeholder="비밀번호를 입력해 주세요." autocomplete="off" maxlength="30" class="input_for_request_email" >
								</div>
							</div>
						</div>
						
						<div class="request_email">
							<div class="request_email_container">
								<label class="label_for_request_email">이름</label>
								<div class="inputBox_for_request_email">
									<input id="signUp3_request_name" type="text" placeholder="이름을 입력해 주세요." autocomplete="off" maxlength="20" class="input_for_request_email" >
								</div>
							</div>
						</div>
					</div>
					
					<footer class="signUp3_footer">
						<button type="button" id="start_collabee" class="signUp1_btn1_class" style="font-weight:bold;">콜라비 시작하기</button>
						<span class="signUp3_span">
							'콜라비 시작하기' 버튼을 클릭하면 &nbsp; 
							<a class="signUp3_a"> 이용약관 </a>  &nbsp;및&nbsp; 
							<a class="signUp3_a"> 개인정보 처리방침 </a>
							에 동의합니다.
						</span>
					</footer>
					
					</div>
			</div>
		</div>
	</div>

	<section class="section_intro_01">
		<div class="section_intro_01_img">
			
		</div>
   		<div class="section_intro_01_container">
   			<div class="left_cell">
   				<h2>
   					<span>
   						한 장으로 끝!<br/>문서기반 협업툴, 콜라비
   					</span>
   				</h2>
   				<p>
   					<span>일정, 할 일, 파일, 결재까지 한 장으로 정리되는 협업툴.</span>
   				</p>
   				<div class="section_intro_01_signUp_container">
	   				<div class="emailForm">
	   					<input type="email" placeholder="email@company.com" class="emailForm_input" autocomplete="off"/>
	   					<button type="button" class="section_intro_01_signUp_btn"><span>무료로 시작하기</span></button>
	   				</div>
	   				<div class="section_intro_01_divider">
	   					<div>또는 가입</div>
	   				</div>
	   				<div class="section_intro_01_social_login">
	   					<button type="button" class="section_intro_01_social_login_btn section_intro_01_social_login_btn_naver">
	   						<div class="signUp_body_btn_iconcontainer" style="margin-right: 93px; margin-bottom: 6px;">
	   							<img src="images/naver.png" style="border-radius: 0px;"/>
	   						</div>
	   						<div>Naver</div>
	   					</button>
	   					<button type="button" class="section_intro_01_social_login_btn section_intro_01_social_login_btn_kakao">
	   						<div class="signUp_body_btn_iconcontainer" style="margin-right: 93px; margin-bottom: 10px;">
								<img src="images/kakao.png" style="margin-top: 2px;"/>	
							</div>
							<div>Kakao</div>
	   					</button>
	   				</div>
	   				<div class="section_intro_01_goLogin">
	   					<span>이미 가입하셨나요?</span>
	   					<button class="section_intro_01_goLogin_btn"><span>로그인하기</span></button>
	   				</div>
   				</div>
   			</div>
   		</div>
   </section>     


<section class="section_intro2">
<div class="intro_content_wrap">
<img src="https://cdn.collabee.co/front/collabee.co/hornet/543/static/media/ico-landing-section02-h.0f1c352a.png" width="64" class="icon-h">
<div class="intro2_h3">
<a class="btn_detail" href="homepage_1.jsp">
	<span class="intro2_span1">문서 - 업무흐름을 한 눈에 캐치업</span>
	<i class="intro2_icon">
		<svg viewBox="0 0 24 24" width="20px" height="20px" class="intro2_svg1"><path d="M12 4l-1.41 1.41L16.17 11H4v2h12.17l-5.58 5.59L12 20l8-8z" color="#D9AD2B"></path></svg>
	</i>
</a>
</div>

		<div class="welcomeStyles__IntroIssueWorkFlow-sc-16jh61p-1 kKpncP" style="margin: 0 auto;">
				<div class="welcomeStyles__BodyContent-sc-16jh61p-2 kHgNYe">
					<div class="ani_01">
						<div class="animated fadeIn" style="animation-duration: 1s;">
							<img src="https://cdn.collabee.co/front/collabee.co/hornet/543/static/media/img_main_con1_img1.929c8840.png" width="588">
						</div>
					</div>
					<div class="ani_02">
						<div class="animated fadeIn" style="animation-duration: 1s;">
							<img src="https://cdn.collabee.co/front/collabee.co/hornet/543/static/media/img_main_con1.3c16da07.gif" width="600">
						</div>
					</div>
					<div class="ani_03">
						<div class="animated fadeIn" style="animation-duration: 1s;">
							<img src="https://cdn.collabee.co/front/collabee.co/hornet/543/static/media/img_main_con1_img2.a96f24cf.png" width="588">
						</div>
					</div>
					<div class="ani_09">
						<div class="animated fadeIn" style="animation-duration: 1s;">
							<img src="https://cdn.collabee.co/front/collabee.co/hornet/543/static/media/img_main_con1_guide1.898ccdf5.png" width="331">
						</div>
					</div>
					<div class="ani_04">
						<div class="animated fadeIn" style="animation-duration: 1s;">
							<img src="https://cdn.collabee.co/front/collabee.co/hornet/543/static/media/img_main_con1_img3.34bd1d14.png" width="588">
						</div>
					</div>
					<div class="ani_05">
						<div class="animated fadeIn" style="animation-duration: 1s;">
							<img src="https://cdn.collabee.co/front/collabee.co/hornet/543/static/media/img_main_con1_img4.77af8f5c.png" width="588">
						</div>
					</div>
					<div class="animated fadeIn" style="animation-duration: 0s;"></div>
					<div class="ani_06">
						<div class="animated fadeIn" style="animation-duration: 1s;">
							<img src="https://cdn.collabee.co/front/collabee.co/hornet/543/static/media/img_main_con1_guide2.43022a4c.png" width="308">
						</div>
					</div>
				</div>
				<div class="welcomeStyles__History-sc-16jh61p-3 kmtroP">
					<div class="ani_07">
						<div class="animated fadeIn" style="animation-duration: 4s;">
							<img src="https://cdn.collabee.co/front/collabee.co/hornet/543/static/media/img_main_con1_img5.43ca9529.png" style="margin-top: 88px; margin-left: 57px; vertical-align: middle;" width="390">
						</div>
					</div>
					<div class="ani_08">
						<div class="animated fadeIn" style="animation-duration: 1s;">
							<img src="https://cdn.collabee.co/front/collabee.co/hornet/543/static/media/img_main_con1_guide3.9267fbc9.png" width="360">
						</div>
					</div>
				</div>
			</div>
</div>
</section>	

	<section class="section_intro_kanban">
			<div class="welcomeStyles_carouselBg_right"></div>
			<div class="content_wrap">
				<h3>
					<a class="btn_detail" href="homepage_3.jsp">
						<span>문서가 칸반으로!</span>
						<i class="icon"><svg viewBox="0 0 24 24" width="20px" height="20px" ><path d="M12 4l-1.41 1.41L16.17 11H4v2h12.17l-5.58 5.59L12 20l8-8z" color="#D9AD2B"></path></svg></i>
					</a>
				</h3>
				
				<div class="kanban_subtitle">
					<span class="kanban_subtitle_span"> 프로젝트의 <span style="font-weight:bold; color:#cc9900">업무별 진행상황을 한 눈에</span> 확인할 수 있습니다. <br>동료에게 진행상황을 물어보지 않아도 업무 진행상황을 확인할 수 있습니다.</span>
				</div>
				
				<div class="kanban_carousel">
					<div class="Brainhub_container">
						<div class="BrainhubCarousel">
							
							<div class="BrainhubCarousel_trackContainer" style="width: 1140px;">
								<div class="slider">
									<div><img src="https://cdn.collabee.co/front/collabee.co/hornet/530/static/media/main_kanban_1.aa744228.png"/></div>
									<div><img src="https://cdn.collabee.co/front/collabee.co/hornet/530/static/media/main_kanban_2.e178cd20.png"/></div>
									<div><img src="https://cdn.collabee.co/front/collabee.co/hornet/530/static/media/main_kanban_3.e4ba22c8.png"/></div>
									<div><img src="https://cdn.collabee.co/front/collabee.co/hornet/530/static/media/main_kanban_4.95157699.png"/></div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			<div class="welcomeStyles_carouselBg_left"></div>
		</section>     
	


	<main>
		<div class="section3">
			<div>
			<a href="web_ganttchart.jsp">
				<h2>문서가 간트차트로!
					<span>
						<svg style="margin-top: -10px; margin-left: -10px; border: 1px solid #cc9900; fill: #cc9900; border-radius: 50%; display: inline-block; vertical-align: middle;" viewBox="0 0 24 24" width="30px" height="30px"><path d="M12 4l-1.41 1.41L16.17 11H4v2h12.17l-5.58 5.59L12 20l8-8z" color="#D9AD2B" class="Beecon__Path-sc-3x6pq4-1 dieHWW"></path></svg>
					</span>
				</h2>
			</a>
			<br/>
			<div class="explanation">팀/프로젝트의 <span style="color: #cc9900; font-weight: bold;">일정관리도 한 눈에</span> 파악하고 관리할 수 있습니다.<br/>
				간트차트에서 프로젝트를 계획하고 추적하여 꼼꼼하게 관리해 보세요.</div>
			<div>
			<img style="vertical-align: middle;" src="https://cdn.collabee.co/front/collabee.co/hornet/527/static/media/img_main_gantt_con1.5444314f.png" width="1140" alt="">
			</div>
		</div>
	</div>
	
	<div class="section4">
	<div>
	<a href="homepage_4.jsp">
	<h2 style="font-size: 50px;">스크롤 한두 번에 찾을 수 있는 파일
	<span>
	<svg style="margin-top: -10px; margin-left: -10px; border: 1px solid #cc9900; fill: #cc9900; border-radius: 50%; display: inline-block; vertical-align: middle;" viewBox="0 0 24 24" width="30px" height="30px"><path d="M12 4l-1.41 1.41L16.17 11H4v2h12.17l-5.58 5.59L12 20l8-8z" color="#D9AD2B" class="Beecon__Path-sc-3x6pq4-1 dieHWW"></path></svg>
	</span>
	</h2>
	</a>
	<br/>
	</div>
	<div class="explanation">문서에 포함된 <b>할 일 / 일정 / 파일 / 의사결정 / 링크</b>를 따로 모아볼 수 있습니다.<br/>
		파일명이나 할 일 제목이 기억나지 않더라도 스크롤 한두 번에 찾을 수 있습니다.</div>
	<div class="section4_1">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 780 560" width="780" height="560" class="lottie" preserveAspectRatio="xMidYMid meet" style="transform: translate3d(0px, 0px, 0px); content-visibility: visible;"><defs><clipPath id="__lottie_element_30"><rect width="780" height="560" x="0" y="0"></rect></clipPath></defs><g clip-path="url(#__lottie_element_30)"><g transform="matrix(4,0,0,4,356,338)" opacity="1" style="display: block;"><g opacity="1" transform="matrix(1,0,0,1,0,0)"><path stroke-linecap="butt" stroke-linejoin="miter" fill-opacity="0" stroke-miterlimit="4" stroke-dasharray=" 1" stroke-dashoffset="1.1217290163040161" stroke="rgb(255,206,30)" stroke-opacity="1" stroke-width="0.5" d=" M-87.875,-83.125 C-86.5,-79.75 -71.625,-57.625 -28.125,-59"></path></g><g opacity="1" transform="matrix(1,0,0,1,0,0)"><path stroke-linecap="butt" stroke-linejoin="miter" fill-opacity="0" stroke-miterlimit="4" stroke-dasharray=" 1" stroke-dashoffset="0.8782709836959839" stroke="rgb(255,206,30)" stroke-opacity="1" stroke-width="0.5" d=" M-27.5,-41.75 C-61.5,-41 -83.5,-21.75 -83.75,10"></path></g><g opacity="1" transform="matrix(1,0,0,1,0,0)"><path stroke-linecap="butt" stroke-linejoin="miter" fill-opacity="0" stroke-miterlimit="4" stroke-dasharray=" 1" stroke-dashoffset="1.1217290163040161" stroke="rgb(255,206,30)" stroke-opacity="1" stroke-width="0.5" d=" M91.75,-84 C90.5,-42.25 67,-19.75 31,-20.25"></path></g><g opacity="1" transform="matrix(1,0,0,1,0,0)"><path stroke-linecap="butt" stroke-linejoin="miter" fill-opacity="0" stroke-miterlimit="4" stroke-dasharray=" 1" stroke-dashoffset="1.1778154373168945" stroke="rgb(255,206,30)" stroke-opacity="1" stroke-width="0.5" d=" M99.5,53 C99.25,37.625 94.25,30.5 66.25,29.5"></path></g></g></g></svg>
	</div>
	</div>
	
	<div class="section5">
		<h3 style="text-align: center;"><p class="title2"><strong class="title">100,598개</strong><br/><span style="margin-top: -30px;">이상의 회사/팀이 사용 중 입니다.&nbsp;</span></p></h3>
		<img style="width: 1080px; height: auto; margin-top: 40px;" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/partners-logo-v202111.243e18ea.jpg">
			<div class="section5_1">
			<h3 style="font-size: 32px; line-height: 52px;">무신사 1위 브랜드, '커버낫' 같은 스타트업도!</h3>
			<img style="width: 1086px; height: auto; margin-top: 16px;" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/partners-logo-startup.2dfddc6b.jpg">
			</div>
	</div>	
	
	<div class="section6">
	<div class="container1">
		<img style="nertical-align: middle;" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/ico-landing-security-h.b8754386.png" width="64"/>
		<h3 style="margin-top: 8px; font-size: 48px;">2중 암호화로
		<span style="color: rgb(52, 199, 111);">가장 완벽한 보안</span></h3>
		<div class="section6_1">
			<div class="section6_2" style="box-shadow: rgb(217 173 43 / 35%) 0px 5px 20px 0px;">
				<h4 style="background-color: rgba(217, 173, 43, 0.1);">
					가입 후 바로 사용
					<span class="expl2">가입 후 사용하는 Public SaaS</span>
				</h4>
				<ul>
					<li class="li_1"> Amazon Web Service의 강력한 보안 시스템</li>
					<li class="li_1"> + 콜라비팀 자체의 암호화로 2중 암호화</li>
					<li class="li_1"> 콜라비팀 개발자도 열람 불가</li>
				</ul>
				<button onclick="alert('서비스가 준비중입니다.')" id="btn11" class="btn1" style="background-color: rgb(217, 173, 43);">무료로 시작하기</button>
			</div>
			<div class="section6_2" style="box-shadow: rgb(51 132 108 / 30%) 0px 5px 20px 0px;">
				<h4 style="background-color: rgba(51, 132, 108, 0.1);">구축형 솔루션
				<span class="expl2">기업이 원하는 서버에 별도로 구축<br/>
				On-premise / Private SaaS - 300명 이상</span>
				</h4>
				<ul>
					<li class="li_2"> 내부망 구축형 솔루션으로 외부접속 차단</li>
					<li class="li_2"> 2-Factor 인증</li>
					<li class="li_2"> 파일 다운로드 이력/차단</li>
					<li class="li_2"> 계정 접속 차단</li>
				</ul>
				<button onclick="alert('서비스가 준비중입니다.')" id="btn21" class="btn1" style="background-color: rgb(51, 132, 108);">도입 문의</button>
			</div>
		</div>
	</div>
	</div>
	
	<div class="section7">
		<div class="container2">
		<h3 style="text-align: center;"><span class="title3">모든 팀의 업무 프로세스를 함께할 수 있어요</span></h3>
		<p class="subtitle">한 가지 업무 방식이 아닐거에요. 다양한 팀과 함께 일하는 프로세스를 콜라비와 함께 하세요.</p>
		<a class="go" onclick="alert('서비스가 준비중입니다.')">자세히 보러가기</a>
		<ul class="ul1">
			<li onclick="alert('서비스가 준비중입니다.')" class="li_3"><a class="section7_1" href=""><img class="img30" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_main_con4_ic1.ca055904.png" width="92" alt="">서비스 개발</a></li>
			<li onclick="alert('서비스가 준비중입니다.')" class="li_3"><a class="section7_1" href=""><img class="img30" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_main_con4_ic2.711fff3a.png" width="92" alt="">제품 마케팅</a></li>
			<li onclick="alert('서비스가 준비중입니다.')" class="li_3"><a class="section7_1" href=""><img class="img30" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_main_con4_ic3.b6de0dcc.png" width="92" alt="">품질 관리</a></li>
			<li onclick="alert('서비스가 준비중입니다.')" class="li_3"><a class="section7_1" href=""><img class="img30" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_main_con4_ic4.80276a22.png" width="92" alt="">채용 및 인사관리</a></li>
			<li onclick="alert('서비스가 준비중입니다.')" class="li_3"><a class="section7_1" href=""><img class="img30" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_main_con4_ic5.8801a6f8.png" width="92" alt="">회의 및 협업</a></li>
		</ul>
		</div>
	</div>
	
	  <section class="section3_web">
	    <div style="padding:83px 0px 0px 4px;"><div class="title_sec4"><span>무료로 시작해 보세요.</span></div>
	        <input type ="text" class="emailVal" placeholder="email@company.com"/>
	        <input type="button" class="free_start_bnt" value="무료로 시작하기"/><!--공란이면 안넘어감-->
	        <br/>
	        <div class="summary_sec4"><span >이미 가입하셨나요?</span>
	            <span class="start_login_bnt">로그인하기</span>
	        </div>
	    </div>
	  </section>

	
	<div class="section9">
		<span class="section9_1">
			콜라비 앱을 다운로드 받아보세요.<br/>
			언제 어디서나 PC와 모바일로 동료와 함께 협업할 수 있습니다.
		</span>
		<div class="section9_2">
		<a herf="https://www.collabee.co/api/electron/collabee/download" target="" class="downroad">
		<img style="border-style: none;" src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/btn_down_desktop_nor.74c7d1aa.png" alt="Desktop App Download" width="150">
		</a>
		<a herf="https://apps.apple.com/app/id1072564257" target="" class="downroad">
		<img src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/btn_down_ios_nor.f1f454d1.png" alt="iOS App Download" width="150">
		</a>
		<a herf="https://play.google.com/store/apps/details?id=collabee.android.app" target="" class="downroad">
		<img src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/btn_down_android_nor.4530fece.png" alt="Android App Download" width="150">
		</a>
		</div>
	</div>
	
	<div class="section10">
		<div class="container10">
			<h6>
				<a class="welcome" href="homepage_main.jsp">
				<svg xmlns="http://www.w3.org/2000/svg" width="159.04" height="38.339999999999996" viewBox="0 0 800 188" version="1.1"><title>Collabee</title><g id="collabee" stroke="none" stroke-width="1" fill="#d9ad2b" fill-rule="evenodd"><g id="collabee_logo" transform="translate(-2199.000000, -306.000000)" fill="#d9ad2b"><g id="Group-2" transform="translate(1900.000000, 0.000000)"><path d="M394.31736,411.192678 L417.772183,434.563735 C431.409272,448.147302 431.409272,470.20286 417.772183,483.79636 C404.271464,497.265165 382.447985,497.399853 368.790516,484.200424 L368.37917,483.79636 L330.119875,445.663888 C335.495266,451.009544 355.591986,449.437092 369.215732,436.194694 L369.62657,435.789832 L394.31736,411.192678 Z M958.789528,358 C972.762337,358 983.522145,361.558521 990.919865,368.785622 C998.141831,375.841021 1001.80953,385.861327 1001.99287,398.676013 L1002,400.068742 L1001.96144,404.945938 L1001.93,407.761854 C1000.22947,407.918136 997.711771,408.003156 994.376916,408.016913 C994.020503,408.018384 993.490522,408.019787 992.809816,408.021116 L992.333934,408.021991 C991.919175,408.022711 991.459464,408.023407 990.958717,408.024078 L990.338374,408.024872 C990.018605,408.025262 989.684627,408.025644 989.337286,408.026016 L988.625039,408.026747 C988.503445,408.026867 988.380429,408.026986 988.256022,408.027103 L987.287029,408.027973 C986.789723,408.028398 986.273584,408.028807 985.740315,408.029199 L984.651445,408.029961 C984.096097,408.03033 983.524756,408.030683 982.939128,408.031019 L981.141092,408.031971 L980.833804,408.032119 L980.833804,408.032119 L979.267568,408.032815 C979.055584,408.032903 978.842391,408.032988 978.628053,408.033071 L976.005067,408.03397 L975.670671,408.034068 L975.670671,408.034068 L971.917492,408.034921 C971.686564,408.03496 971.455123,408.034997 971.223231,408.035031 L961.392174,408.035042 L961.044317,408.034987 L961.044317,408.034987 L957.274365,408.034114 C957.049716,408.034046 956.825879,408.033976 956.602919,408.033902 L954.621625,408.033164 C954.404488,408.033073 954.188416,408.032979 953.973472,408.032883 L952.697858,408.03227 C952.487681,408.032162 952.278758,408.032051 952.071154,408.031937 L950.841848,408.031218 C950.639768,408.031093 950.439133,408.030964 950.240004,408.030832 L949.063829,408.030005 C948.225368,408.029379 947.417791,408.028694 946.646288,408.027951 L945.738132,408.027029 C943.364331,408.024495 941.381196,408.021342 939.958826,408.01751 C940.022181,411.542318 941.702566,415.234262 945.378473,417.846532 C949.05438,420.458802 955.681971,423.549841 963.527798,423.549841 C971.79489,423.549841 978.541852,422.700011 983.495419,421.057128 C987.517595,419.723146 991.333122,417.875032 994.604438,415.78136 L994.604859,434.581126 C992.937836,435.593133 990.896711,436.632681 988.415131,437.615306 C982.727235,439.867528 973.650163,442 964.823689,442 C955.997215,442 946.949276,440.787809 939.956585,437.934714 C932.805324,435.019982 924.735595,430.268372 920.456361,424.131336 C916.13993,417.937166 914,410.275826 914,401.224578 C914,387.29112 917.91971,376.500379 925.832175,369.054325 C933.690649,361.656092 944.723719,358 958.789528,358 Z M1055.78953,358 C1069.76234,358 1080.52214,361.558521 1087.91987,368.785622 C1095.14183,375.841021 1098.80953,385.861327 1098.99287,398.676013 L1099,400.068742 L1098.96144,404.945938 L1098.93,407.761854 C1097.22947,407.918136 1094.71177,408.003156 1091.37692,408.016913 C1091.0205,408.018384 1090.49052,408.019787 1089.80982,408.021116 L1089.33393,408.021991 C1088.91918,408.022711 1088.45946,408.023407 1087.95872,408.024078 L1087.33837,408.024872 C1087.0186,408.025262 1086.68463,408.025644 1086.33729,408.026016 L1085.62504,408.026747 C1085.50344,408.026867 1085.38043,408.026986 1085.25602,408.027103 L1084.28703,408.027973 C1083.78972,408.028398 1083.27358,408.028807 1082.74032,408.029199 L1081.65145,408.029961 C1081.0961,408.03033 1080.52476,408.030683 1079.93913,408.031019 L1078.14109,408.031971 L1077.8338,408.032119 L1077.8338,408.032119 L1076.26757,408.032815 C1076.05558,408.032903 1075.84239,408.032988 1075.62805,408.033071 L1073.00507,408.03397 L1072.67067,408.034068 L1072.67067,408.034068 L1068.91749,408.034921 C1068.68656,408.03496 1068.45512,408.034997 1068.22323,408.035031 L1058.39217,408.035042 L1058.04432,408.034987 L1058.04432,408.034987 L1054.27436,408.034114 C1054.04972,408.034046 1053.82588,408.033976 1053.60292,408.033902 L1051.62163,408.033164 C1051.40449,408.033073 1051.18842,408.032979 1050.97347,408.032883 L1049.69786,408.03227 C1049.48768,408.032162 1049.27876,408.032051 1049.07115,408.031937 L1047.84185,408.031218 C1047.63977,408.031093 1047.43913,408.030964 1047.24,408.030832 L1046.06383,408.030005 C1045.22537,408.029379 1044.41779,408.028694 1043.64629,408.027951 L1042.73813,408.027029 C1040.36433,408.024495 1038.3812,408.021342 1036.95883,408.01751 C1037.02218,411.542318 1038.70257,415.234262 1042.37847,417.846532 C1046.05438,420.458802 1052.68197,423.549841 1060.5278,423.549841 C1068.79489,423.549841 1075.54185,422.700011 1080.49542,421.057128 C1084.5176,419.723146 1088.33312,417.875032 1091.60444,415.78136 L1091.60486,434.581126 C1089.93784,435.593133 1087.89671,436.632681 1085.41513,437.615306 C1079.72724,439.867528 1070.65016,442 1061.82369,442 C1052.99721,442 1043.94928,440.787809 1036.95658,437.934714 C1029.80532,435.019982 1021.7356,430.268372 1017.45636,424.131336 C1013.13993,417.937166 1011,410.275826 1011,401.224578 C1011,387.29112 1014.91971,376.500379 1022.83217,369.054325 C1030.69065,361.656092 1041.72372,358 1055.78953,358 Z M838.290203,339 L838.288276,364.559952 L838.874395,364.200045 C840.805068,363.047969 842.879018,362.056406 845.094001,361.225292 L846.213235,360.823106 L847.211798,360.493128 C852.484469,358.819822 858.1,357.986006 864.051579,357.986006 C872.040986,357.986006 879.237636,359.764568 885.596484,363.331581 C891.978042,366.911333 896.994379,371.918 900.601213,378.309028 C904.20455,384.691148 906,391.986392 906,400.145571 C906,408.407933 904.204349,415.730693 900.596169,422.066232 C896.982907,428.414924 891.956395,433.348879 885.56268,436.824953 C879.210543,440.278422 872.026156,442 864.051579,442 C857.452369,442 851.716345,441.105452 846.845706,439.291702 C844.125935,438.278902 841.469434,436.907542 838.876688,435.181457 L837.907397,434.517556 L837.67136,434.348687 L837.673112,440 L813,440 L813,339 L838.290203,339 Z M762.228768,358 C768.80678,358 774.46643,358.553722 779.221413,359.675087 C784.113902,360.828069 788.200743,362.628219 791.455785,365.098567 C794.807784,367.640016 797.267738,370.936354 798.799986,374.933093 C800.176231,378.524376 800.899942,382.674684 800.99032,387.379044 L801,388.3956 L801,440 L777.861413,440 L777.860877,435.320792 L777.635758,435.452876 C775.666824,436.569192 773.38088,437.646087 770.700931,438.769555 L768.811734,439.543783 C764.46089,441.287981 759.601097,442 753.495282,442 L752.592885,441.997228 L750.886471,441.974001 C746.775313,441.88472 743.780251,441.552583 740.878265,440.781092 C736.936723,439.730138 733.491796,438.155705 730.557742,436.047153 C727.54528,433.882252 725.189409,431.176574 723.520106,427.955626 C721.832818,424.706444 721,420.961464 721,416.758128 C721,412.16806 722.068588,408.100907 724.221479,404.624065 C726.358833,401.169663 729.512016,398.350325 733.622011,396.16964 C737.587969,394.063845 742.441623,392.530495 748.185852,391.546555 C753.438778,390.646303 759.448905,390.168984 766.222007,390.109343 L767.685066,390.102953 L777.860877,390.101587 C777.846597,388.254385 777.766522,386.926757 777.62065,386.118702 C777.401843,384.906619 776.724942,383.398904 775.734159,382.604347 C774.743376,381.80979 773.569277,380.944377 770.72613,380.108291 C767.882982,379.272205 764.183274,378.804101 760.581054,378.804101 C756.978833,378.804101 753.975156,379.163396 750.67578,379.828022 C747.376403,380.492649 741.086683,382.580122 737.826344,384.157673 C735.652785,385.209373 733.210043,386.483274 730.498119,387.979376 L730.671609,364.934662 L733.286091,363.818251 L734.956755,363.130281 C737.445056,362.127557 739.825941,361.270624 741.724334,360.751904 C744.696726,359.939318 747.920628,359.279204 751.392657,358.771412 C754.89907,358.256896 758.511398,358 762.228768,358 Z M588.5,358 C597.610493,358 605.669636,359.69868 612.647815,363.118631 C619.702382,366.574517 625.214658,371.493118 629.130086,377.844946 C633.047866,384.199054 635,391.605065 635,399.99929 C635,408.593202 633.050102,416.100867 629.130423,422.459592 C625.208498,428.823499 619.683812,433.697719 612.614904,437.049071 C605.643787,440.357006 597.596467,442 588.5,442 C579.402293,442 571.354932,440.357074 564.384361,437.049399 C557.314972,433.69709 551.789438,428.822464 547.86832,422.459866 C543.949029,416.10177 542,408.594492 542,399.99929 C542,391.610492 543.92197,384.211023 547.781185,377.861805 C551.645398,371.500283 557.166612,366.574052 564.280213,363.114792 C571.308748,359.697636 579.390814,358 588.5,358 Z M500.553774,358 C512.585353,358 522.324314,360.376937 529.730212,365.206167 L529.730212,365.206167 L531.074122,366.082503 L531.074122,388.82923 L526.480214,385.601196 C520.326242,381.276942 512.374029,379.088557 502.558661,379.088557 C495.284852,379.088557 489.649129,380.847617 485.539475,384.300802 C481.59592,387.613225 479.585103,392.81295 479.585103,400.152543 C479.585103,407.383052 481.589492,412.501074 485.524958,415.76371 C489.640828,419.175906 495.178592,420.910024 502.249563,420.910024 C512.088664,420.910024 520.479358,418.611616 527.488589,414.034986 L527.488589,414.034986 L532,411.089291 L532,433.444216 L530.673368,434.322722 C526.690844,436.95998 522.199726,438.902023 517.211096,440.152056 C512.289594,441.38751 506.634353,442 500.246093,442 C491.206971,442 483.209197,440.38481 476.278951,437.133978 C469.244953,433.835194 463.745563,429.012495 459.842262,422.699464 C455.939479,416.387864 454,408.849911 454,400.152543 C454,391.450095 455.966396,383.885836 459.92296,377.522331 C463.874769,371.168944 469.39152,366.30028 476.4148,362.950823 C483.351217,359.642002 491.404005,358 500.553774,358 Z M711,340 L711,440 L686,440 L686,340 L711,340 Z M670,340 L670,440 L645,440 L645,340 L670,340 Z M358.420773,375.75774 L358.833922,376.161635 L383.624733,400.750275 L358.82392,425.368716 C345.146822,438.957959 322.947972,438.957959 309.270875,425.368716 C308.413555,424.534289 307.604818,423.641679 306.856092,422.720687 C295.633785,409.051975 296.431092,388.898003 309.270875,376.161635 C322.811201,362.69845 344.703697,362.563818 358.420773,375.75774 Z M778.333972,408.349946 C768.823424,408.38309 763.359884,408.415179 761.943351,408.44621 C759.818553,408.492758 757.893421,408.587913 754.811182,408.865258 C751.728944,409.142603 749.677839,410.020133 748.343937,410.775791 C747.124181,411.467238 746.304537,412.234192 745.820058,413.074348 C745.325469,413.930449 745.073302,414.932391 745.073302,416.135196 C745.073302,417.685936 746.1287,419.532685 748.288273,420.757862 C750.447845,421.983038 755.803965,422.516663 758.786797,422.516663 C761.769629,422.516663 766.469926,421.989625 769.204071,421.257959 C773.020038,420.236794 776.583297,418.794412 778.333972,416.466924 C778.332917,415.876062 778.332143,415.250361 778.331651,414.589821 L778.331651,410.801898 C778.332143,410.01942 778.332917,409.202103 778.333972,408.349946 Z M588.5,379.088557 C582.009111,379.088557 577.054758,380.925901 573.455067,384.568556 C569.857391,388.209193 568.036369,393.293225 568.036369,399.99929 C568.036369,406.299164 569.880852,411.296503 573.569425,415.160536 C577.225727,418.991988 582.136817,420.910024 588.5,420.910024 C594.861917,420.910024 599.772936,418.991895 603.429819,415.159835 C607.118291,411.297208 608.962205,406.300568 608.962205,399.99929 C608.962205,393.293225 607.141184,388.209193 603.543513,384.568562 C599.943901,380.925988 594.989625,379.088557 588.5,379.088557 Z M859.268059,379.078076 C854.295377,379.078076 849.909008,380.409416 846.030089,383.082175 C842.402497,385.581389 839.874744,388.818682 838.39086,392.862086 L838.288276,393.152711 L838.288276,406.957272 L838.388732,407.22812 C839.865266,411.048981 842.215777,414.133058 845.479572,416.534212 L846.102246,416.976439 C849.928629,419.59891 854.290038,420.90651 859.268059,420.90651 C865.528284,420.90651 870.558258,418.990059 874.519234,415.147837 C878.448305,411.336527 880.400542,406.401972 880.400542,400.145571 C880.400542,393.879473 878.440983,388.881828 874.49504,384.966287 C870.534613,381.035141 865.514934,379.078076 859.268059,379.078076 Z M958.86933,377.259139 C952.409234,377.259139 948.172734,378.737559 944.69436,381.979409 C942.101016,384.397342 940.616183,386.901255 940.027711,390.130031 L939.925487,390.754586 L977.510593,390.754586 L977.495877,390.609769 C977.050768,387.132523 975.780586,384.530721 973.513413,382.163422 L973.12629,381.770933 C970.114377,378.802492 965.413394,377.259139 958.86933,377.259139 Z M1055.86933,377.259139 C1049.40923,377.259139 1045.17273,378.737559 1041.69436,381.979409 C1039.10102,384.397342 1037.61618,386.901255 1037.02771,390.130031 L1036.92549,390.754586 L1074.51059,390.754586 L1074.49588,390.609769 C1074.05077,387.132523 1072.78059,384.530721 1070.51341,382.163422 L1070.12629,381.770933 C1067.11438,378.802492 1062.41339,377.259139 1055.86933,377.259139 Z M417.775041,316.198674 C431.402128,329.803527 431.41213,351.839217 417.775041,365.434137 L394.310216,388.806613 L369.627998,364.198106 C355.999482,350.593253 335.549563,348.914464 330.119875,354.343918 L368.380599,316.187321 C382.017689,302.602335 404.127949,302.602335 417.775041,316.198674 Z" id="Combined-Shape"></path></g></g></g></svg>
				</a>
			</h6>
			<div class="container10_1">
				<dl>
					<dt>
					<span>콜라비</span>
					</dt>
						<dd>
						<a class="dd" href="homepage_main.jsp">홈
						</a>
						</dd>
						<dd>
						<a class="dd" onclick="alert('서비스가 준비중입니다.')">메신저</a>
						</dd>
						<dd>
						<a class="dd" onclick="alert('서비스가 준비중입니다.')">가격</a>
						</dd>
						<dd>
						<a class="dd" href="0help1.jsp" target='_blank'>콜라비 도움말
						</a>
						</dd>
				</dl>
				<dl>
					<dt>
					<span>세부기능</span>
					</dt>
					<dd>
						<a class="dd" href="web_workspace.jsp">협업공간
						</a>
					</dd>
					<dd>
						<a class="dd" href="homepage_1.jsp">문서
						</a>
					</dd>
					<dd>
						<a class="dd" href="web_thread.jsp">실시간 대화
						</a>
					</dd>
					<dd>
						<a class="dd" href="homepage_2.jsp">이슈 업데이트
						</a>
					</dd>
					<dd>
						<a class="dd" href="web_calendar.jsp">캘린더
						</a>
					</dd>
					<dd>
						<a class="dd" href="homepage_3.jsp">칸반
						</a>
					</dd>
					<dd>
						<a class="dd" href="web_ganttchart.jsp">간트차트
						</a>
					</dd>
					<dd>
						<a class="dd" href="homepage_4.jsp">컨텐츠 모음
						</a>
					</dd>
					<dd>
						<a class="dd" href="web_admin.jsp">관리자 기능
						</a>
					</dd>
					<dd>
						<a class="dd" href="homepage_5.jsp">콜라비의 보안
						</a>
					</dd>
				</dl>
				<dl>
					<dt>
					<span>사용사례</span>
					</dt>
					<dd>
						<a class="dd" onclick="alert('서비스가 준비중입니다.')">서비스 개발
						</a>
					</dd>
					<dd>
						<a class="dd" onclick="alert('서비스가 준비중입니다.')">제품 마케팅
						</a>
					</dd>
					<dd>
						<a class="dd" onclick="alert('서비스가 준비중입니다.')">품질 관리
						</a>
					</dd>
					<dd>
						<a class="dd" onclick="alert('서비스가 준비중입니다.')">채용 및 인사관리
						</a>
					</dd>
					<dd>
						<a class="dd" onclick="alert('서비스가 준비중입니다.')">회의 및 협업
						</a>
					</dd>
				</dl>
				<dl>
					<dt>
					<span>회사</span>
					</dt>
					<dd>
						<a class="dd" href="web_aboutUs.jsp">회사소개
						</a>
					</dd>
				</dl>
			</div>
		</div>
	</div>

	</main>
	
	<div class="footer">
	<div class="footer1"><i>©2021 collabee Team Inc. All rights reserved. &nbsp|&nbsp Privacy Policy&Terms of Service.</i>
	</div>
	<div class="footer2">
		<button class="f_btn1">Language</button>
		<ul class="language">
			<li><a id="en"  data-type="en" class="l_detail" onclick="alert('서비스가 준비중입니다.')">English</a></li>
			<li class="active"><a data-type="ko" class="l_detail" onclick="alert('서비스가 준비중입니다.')">한국어</a></li>
		</ul>
		<button class="f_btn2">
		<img src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/btn_footer_facebook_nor.fca56580.png" alt="콜라비 Facebook으로 이동" width="44">
		</button>
		<button class="f_btn2">
		<img src="https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/btn_footer_blog_nor.6d51d6b9.png" alt="콜라비 Blog로 이동" width="44">
		</button>
	</div>
	</div>

</body>
</html>