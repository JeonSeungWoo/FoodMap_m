<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

 <!--css -->
    <link rel="stylesheet" href="/resources/css/woo.css">
    
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
    <!--카카오 로그인  -->
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

    <!--js ---------------------------------------------------------------------------->

 
<body>
   <script type='text/javascript'>
 
    var form = $("#form");
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('56cc765b1e454d414955fbff315efb51');
    
    // 카카오 로그인 Start------------------------------------------------------------------------
    var res = "";
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
            // 로그인 성공시, API를 호출합니다.
            Kakao.API.request({
              url: '/v2/user/me',
              success: function(res) {
               /*  alert(JSON.stringify(res)); */
             /*    Kakao.Auth.setAccessToken(); */
              //아이디 체크
                ckeckId(res);
              
              },
              fail: function(error) {
                alert(JSON.stringify(error));
              }
            });
          },
          fail: function(err) {
            alert(JSON.stringify(err));
          }
        });
        
        
        function ckeckId(res){	
            var kakaoData = {
                  id:  res.id,
                  usernm: res.properties.nickname,
                  gender: res.kakao_account.gender,
                  birthday: res.kakao_account.birthday,
                  loginconf: "kakao"	
            }
        	 $.ajax({
                url:"/login/login",
                method:"POST",
                type:'json',
                contentType : "application/json; charset=UTF-8",
                data: JSON.stringify(kakaoData),
                success:function(data){
                	 form.attr("action","/login/loginSuccess").attr("method","get").submit();
                },
                error:function(error){
                	alert("실패");
                }
            }); 
            
            
        }
        
/*         function logout(){
        	
        	
        	Kakao.Auth.logout();
        	alert("로그 아웃");
        	form.attr("action","/login/logout").attr("method","get").submit();
              
        } */
        
       
      //로그아웃 시작
		function logout(){
			$.ajax({
				dataType:'jsonp',
				jsonpCallback: "callback",
				url: "http://developers.kakao.com/logout",
				success :function(data){
					alert("성공?");
					form.attr("action","/login/logout").attr("method","get").submit();
				}
				
			});
				
			
		}
		//로그아웃 끝

        // 카카오 로그인 End------------------------------------------------------------------------
       /*  Kakao.Auth.logout(); */
    </script>
    <!-- header start ------------------------------------------------------------------>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#myPage">logo</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#myPage">HOME</a></li>
                   <!--로그인 before  ----------------------------------------------------------------> 
                   <c:if test="${empty login.id}">
                    <li><a href="#contact" data-toggle="modal" data-target="#loginModal">로그인</a></li>
                   
                   </c:if>
                   <!--르그인 after  ------------------------------------------------------------------->
                   <c:if test="${!empty login.id}">
                    <li><a href="#web">알림</a></li>
                    <li><a href="#class">내 활동</a></li>
                    <li><a href="#resource">찜목록</a></li>
                    <li> <a href="/login/logout" onclick="logout()">로그 아웃</a> </li>
                   
                   </c:if>
               

                </ul>
            </div>
        </div>
    </nav>
    
       <!-- The Login Modal ------------------------------------------------------------->
    <div id="loginModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                   <div id="newTilte">
                    <div id="loginTitle">
                            <h4 >로그인</h4>
                    </div>

                     <div>
                     <a id="kakao-login-btn"></a>
                     
                     </div>
                  </div>


                </div>
              
             
            </div>

        </div>
    </div>
    <!-- The Modal END-->