<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/style.css">
<title>로그인 창</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
	#clock {
		margin-left: 4px;
		margin-bottom: 13px;
		display: inline-block; /* 시계를 인라인 블록 요소로 설정 */
		vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
		margin-right: 3px;
		font-weight: BOLD;
		font-size: 15px;
	}
	#fix{
		position: relative;
	    margin-top: 7px;
	    margin-left: 14px;
	    height: 20px;
	    
	}
	
	#internet{
		height: 19px;
		margin-left: 197px;
		margin-bottom: 2px;
	}
	#lte{
		height: 11px;
		margin-bottom: 5px;
	}
	#battery{
		height: 21px;
	}

</style>

</head>
<body>
	<div class="container">
		<div id=fix>

			<span id="clock"></span> <img src="images/인터넷.png" id="internet">
			<img src="images/LTE.png" id="lte"> <img src="images/배터리.png"
				id="battery">


		</div>

		<form action="LoginProgram" id="form" class="form" method="post">

			<div id="logoimg">
				<h2>Play With Me</h2>
			</div>

			<div class="form-control">
				<input type="text" name="memberid" id="email"
					placeholder="사용자 이메일 주소"> <small>Error message</small>
			</div>

			<div class="form-control">
				<input type="password" name="pw" id="password" placeholder="비밀번호"
					autocomplete="current-password"> <small>Error
					message</small>
			</div>

			<button type="submit" id="loginSubmit">로그인</button>


			<button id='button3' type="button">
				<a href="goJoin">계정이 없으신가요?&nbsp;&nbsp; 회원가입</a>
			</button>

		</form>
				<!-- 카카오 버튼이 생기는 a태그 -->
    <a id="kakao-login-btn"></a>
</div>
	<script src="js/jquery-3.7.1.js"></script>

<script type='text/javascript'>
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('b050e9e0efc9c8e1f1202b4635c53089');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
          
          //로그인 성공시, kakao API를 호출한다.(카카오에 있는 데이터 불러옴)
          Kakao.API.request({
              url: '/v2/user/me',
              success: function(res){
                  console.log(res);
                  console.log(res.id);
                  console.log(JSON.stringify(res.properties.nickname));
                  console.log(JSON.stringify(res.kakao_account.email));
                  console.log(JSON.stringify(res.kakao_account.gender));
                 $.ajax({
                    url:"http://localhost:8082/aa/KakaoLogin",
                    data:{"id":JSON.stringify(res.kakao_account.email), "name":JSON.stringify(res.properties.nickname)},
                    Type:"post",
                    success:function(data){
                        //성공적으로 하고나면 이동할 url
                        location.href=data;
                    }
                    
                 });
              },
              fail: function(error){
                  alert(JSON.stringify(error));
              }
          });
         //접속된 회원의 토큰값 출력됨
        //alert(JSON.stringify(authObj));
        
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
</script> 


	<script>
		///////////////////////////////////////////////////////////////////////////////
		// 시계
		function updateClock() {
			const currentDate = new Date();
			const hours = currentDate.getHours();
			const minutes = currentDate.getMinutes();

			const hours12 = hours % 12 || 12;

			const hoursStr = String(hours12).padStart(2, '0');
			const minutesStr = String(minutes).padStart(2, '0');

			const clockElement = document.getElementById("clock");
			clockElement.textContent = `${hoursStr}:${minutesStr}`;

		}

		// 1초마다 시간을 업데이트
		setInterval(updateClock, 1000);

		// 초기 로딩 시에도 시간 표시
		updateClock();

		////////////////////////////////////////////////////////////////////////////////     

		/* // 아래는 데모를 위한 UI 코드입니다.
		displayToken()
		function displayToken() {
		  var token = getCookie('authorize-access-token');

		  if(token) {
		    Kakao.Auth.setAccessToken(token);
		    Kakao.Auth.getStatusInfo()
		      .then(function(res) {
		        if (res.status === 'connected') {
		          document.getElementById('token-result').innerText
		            = 'login success, token: ' + Kakao.Auth.getAccessToken();
		        }
		      })
		      .catch(function(err) {
		        Kakao.Auth.setAccessToken(null);
		      });
		  }
		} */
	</script>

</body>
</html>