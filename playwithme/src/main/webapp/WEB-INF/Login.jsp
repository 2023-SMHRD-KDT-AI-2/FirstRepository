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
<style type="text/css">

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

		<div>
			<img src="images/로고2.png" class="logo">
		</div>


		<form action="LoginProgram" id="form" class="form" method="post">
		
			<div class="logofont">
				<h2 style="color:#a0e1f4">Play With Me</h2>
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


			<a href="goJoin">
				<button type="button">계정이 없으가요?&nbsp;&nbsp; <b>회원가입</b></button>
			</a>


			<button id='button3' type="button">
				<a href="goJoin">계정이 없으신가요?&nbsp;&nbsp; 회원가입</a>
			</button>


		</form>
		<a href="javascript:loginWithKakao()"
			class="btn btn-kakao btn-user btn-block"
			style="display: flex; align-items: center; flex-direction: row; justify-content: center;">
			<div style="margin-right: 15px;">
				<i class="fa fa-comment"></i>
				<path
					d="M512 240c0 114.9-114.6 208-256 208c-37.1 0-72.3-6.4-104.1-17.9c-11.9 8.7-31.3 20.6-54.3 30.6C73.6 471.1 44.7 480 16 480c-6.5 0-12.3-3.9-14.8-9.9c-2.5-6-1.1-12.8 3.4-17.4l0 0 0 0 0 0 0 0 .3-.3c.3-.3 .7-.7 1.3-1.4c1.1-1.2 2.8-3.1 4.9-5.7c4.1-5 9.6-12.4 15.2-21.6c10-16.6 19.5-38.4 21.4-62.9C17.7 326.8 0 285.1 0 240C0 125.1 114.6 32 256 32s256 93.1 256 208z" />
			</div>
			<div>
				<strong>카카오 로그인</strong>
			</div>
		</a>
	</div>



	<script src="assets/js/Joinscript.js"></script>


	<!-- 제이쿼리 cdn 스크립트-->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous">
	</script>

	<!-- 카카오 스크립트 -->
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
		integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH"
		crossorigin="anonymous">
	</script>

	<!--  개인 토큰 스크립트-->
	<script>
		Kakao.init('662807c83d8fccc55bc8bf7c650227b4');
	</script>


	<!-- Redirecturl : "http://localhost:8082/goKakaoLog", -->

	<!--------------------------------------------------------------->

	<script>
		//1 카카오 로그인 동작 함수 
	 	function loginWithKakao() {
		    Kakao.Auth.authorize({
		      redirectUri: 'http://localhost:8082/goKakaoLog',
		    });
		  }

		  // 2 아래는 데모를 위한 UI 코드입니다.
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
		  }
		  
		  // 3 토큰 발급
		   function getInfo() {
      			Kakao.API.request({
          		url: '/v2/user/me',
          	success: function (res) {
              console.log(res);
		
		  // 3.1 로그인 정보 받기 
		   var id = res.id;
		   var email = JSON.stringify(res.kakao_account.email);
		   var profile_image = JSON.stringify(res.properties.profile_image);
		   
		   consol.log(id, email, profile_image);
		   
		   $.ajax({
               url:"http://localhost:8082/goKakaoLog",
               data:{"id":id, "email":email, "name":name, "profile_image":profile_image},
               type : "post",
            
            })

             window.location.href='http://localhost:8082/goKakaoLog'

          	},
          	
          	fail:function(error){
          		alret('로그인 실패')}
          	}

      			
		  //로그아웃 함수 
		  function kakaoLogout() {
			  //카카오 서버에 접근하는 어세스 토큰 만료 
		      if (!Kakao.Auth.getAccessToken()) {
		          alert('Not logged in.');
		          return;
		      }
		      Kakao.Auth.logout(function() {
		          alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
		      });
		  }
		  
		 
		  // 현재까지 받은 코드값 : http://localhost:8082/goKakaoLog?code=2AKq0m1e9gEmhQeOUAoiKm68flN4O4d8GYfNpvSIlxo4cKyGe1rQ1ntWX8Tao_KIgwV6cwopyNoAAAGKlMf-EA

				  
	</script>




	<script src="js/jquery-3.7.1.js"></script>

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


	</script>

</body>
</html>