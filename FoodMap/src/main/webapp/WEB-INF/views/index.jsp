<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

 <!--css -->
    <link rel="stylesheet" href="/resources/css/woo.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <!--카카오 로그인  -->
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<body>

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
    <!-- header end -->
    <form id="form">
    <div id="container">
    
    <!--  HeadMenu ----------------------------------------------------->
        <div class="jumbotron jumbo-he-2">
            <h2><span style="color: #1564f9;">현재 동네</span>의 맛집은 어디 일까요?</h2>
            <p> 현재 위치 하신 곳을 입력해 주세요~</p>
              <!-- Actual search box -->
             <div id="searchDiv">
             <div class="form-group has-feedback has-search">
               <span class="glyphicon glyphicon-search form-control-feedback"></span>
               <input type="text" class="form-control" placeholder="Search">
               <button type="button" class="btn btn-primary">검색</button>
             </div>
             </div>
         </div>
         
      <!--로그인 후 맛집 등록  ------------------------------------------------------------->
      <c:if test="${!empty login.id}">
          <div class="info">
          <div id="infoDetail">
               <div class="jumbotron jumbo-he-3">
               
               <h3>맛집을 등록 해보세요. <a href="/main/insertPage" >등록하러 가기</a></h3>
               
              </div>
              
              <h4 style="font-weight: bold;">※ 등록 현황 </h4>
         </div>
              
              <!--이미지 스타트  -->
              <div class="infoBox">
                   <div class="infoImg"></div>
                   <div class="infoContentDetail"><h3>detail</h3></div>
                   <div class="infoContent"><h4 style="margin-top: 18px;">content</h4></div>
              </div>
              
         </div>
      </c:if>
         
         
      <!-- many info -------------------------------------------------------->  
       <div class="info">
          <div id="infoDetail">
               <div class="jumbotron">
               <h3>인기 맛집 찾기</h3>
               <h4>오늘 약속 장소는 어디에?</h4>
              </div>
         </div>
              
              <!--이미지 스타트  -->
              <div class="infoBox">
                   <div class="infoImg"></div>
                   <div class="infoContentDetail"><h3>detail</h3></div>
                   <div class="infoContent"><h4 style="margin-top: 18px;">content</h4></div>
              </div>
              
              <div class="infoBox">
                   <div class="infoImg"></div>
                   <div class="infoContentDetail"><h3>detail</h3></div>
                   <div class="infoContent"><h4 style="margin-top: 18px;">content</h4></div>
              </div>
              
               <div class="infoBox">
                   <div class="infoImg"></div>
                   <div class="infoContentDetail"><h3>detail</h3></div>
                   <div class="infoContent"><h4 style="margin-top: 18px;">content</h4></div>
              </div>
         
         </div>
         
         <!--manyInfo End  -->
     </div>
        







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
</form>


    <!-- Footer ---------------------------------------------------->
    <footer class="text-center">
        <p>© Apptizen. All rights reserved.</p>
    </footer>



    <!--js ---------------------------------------------------------------------------->

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
</body>

</html>