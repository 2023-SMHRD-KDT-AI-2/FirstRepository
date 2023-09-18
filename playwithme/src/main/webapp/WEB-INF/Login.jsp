<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
<style>
#clock {
	margin-left: 4px;
	margin-bottom: 13px;
	display: inline-block; /* 시계를 인라인 블록 요소로 설정 */
	vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
	margin-right: 3px;
	font-weight: BOLD;
	font-size: 14px;
}

#fix {
	position: relative;
	margin-top: 10px;
	margin-left: 23px;
	height: 20px;
}

#internet {
	height: 19px;
	margin-left: 191px;
	margin-bottom: 2px;
}

#lte {
	height: 11px;
	margin-bottom: 5px;
}

#battery {
	height: 21px;
}

a {
	text-decoration-line: none;
}

#kakao {
	margin: auto;
	display: block;
	width: 94%;
	transform: translate(-117%, 530%)
}

.logo {
	display: block;
	margin: auto;
	transform: translate(0, 75%);
}

.logofont {
	display:block;
	margin:auto;
	trnsform:translate(0,100%);
	font-color: #7cc4f5;
	display: block;
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
				<input type="password" name="pw" id="password" placeholder="비밀번호">
				<small>Error message</small>
			</div>

			<button type="submit" id="loginSubmit">로그인</button>

			<a href="goJoin">
				<button type="button">계정이 없으가요?&nbsp;&nbsp; <b>회원가입</b></button>
			</a>

		</form>
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

	<!-- 카카오 로그인 버튼 태그 -->
	<a id="kakao-login-btn" href="javascript:loginWithKakao()"> <img
		src="images/카카오로그인와이드.png" / id="kakao">
	</a>

	<p id="token-result"></p>

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



	<script>
		///////////////////////////////////////////////////////////////////////////////
		// 시계
		function updateClock() {
			const currentDate = new Date();
			const hours = currentDate.getHours();
			const minutes = currentDate.getMinutes();
			const hours12 = hours % 12 || 12;

			const hoursStr = hours12 < 10 ? `0${hours12}` : hours12;
			const minutesStr = minutes < 10 ? `0${minutes}` : minutes;

			const clockElement = document.getElementById("clock");
			clockElement.textContent = `${hours}:${minutes}`;
		}

		// 1초마다 시간을 업데이트
		setInterval(updateClock, 1000);

		// 초기 로딩 시에도 시간 표시
		updateClock();

		////////////////////////////////////////////////////////////////////////////////     

	</script>

</body>
</html>