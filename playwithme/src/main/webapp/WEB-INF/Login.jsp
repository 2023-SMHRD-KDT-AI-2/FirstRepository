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
<title>로그인 창</title>
<style>
	body{
	
	}
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

		<span id="clock"></span>
		<img src="images/인터넷.png" id="internet">
		<img src="images/LTE.png" id="lte">
		<img src="images/배터리.png" id="battery">
		
		
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
				<input type="password" name="pw" id="password" placeholder="비밀번호">
				<small>Error message</small>
			</div>

			<button type="submit" id="loginSubmit">로그인</button>

			
			<button id='button3' type="button">
				<a href="goJoin">계정이 없으신가요?&nbsp;&nbsp; 회원가입</a>
			</button>
	<a id="kakao-login-btn" href="javascript:loginWithKakao()"> <img
		src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
		width="222" alt="카카오 로그인 버튼" /></a>
	<p id="token-result"></p>
		</form>
	</div>

	
	
	<script src="js/script.js"></script>
	
	
	<!-- 카카오 스크립트 -->
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
  integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH" crossorigin="anonymous"></script>
<script>
  Kakao.init('7346a61533c9bd3cf2f11f5f00313917'); // 사용하려는 앱의 JavaScript 키 입력
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
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8090/KakaoLogin',
    });
  }
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

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }



			</script>

</body>
</html>