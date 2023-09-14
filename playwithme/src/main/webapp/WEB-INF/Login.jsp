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
</head>
<body>
	<div class="container">

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

			<button id="button2" type="button">
				<a href="#">간편로그인</a>
			</button>
			<button id='button3' type="button">
				<a href="goJoin">계정이 없으신가요?&nbsp;&nbsp; 회원가입</a>
			</button>
		</form>
	</div>

	<script src="js/script.js"></script>
	
	
	
	
	<!-- 카카오 스크립트 -->
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
		integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH"
		crossorigin="anonymous">
	</script>
	<script>Kakao.init('662807c83d8fccc55bc8bf7c650227b4');</script> 

	<a id="kakao-login-btn" href="javascript:loginWithKakao()"> <img
		src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
		width="222" alt="카카오 로그인 버튼" /></a>
	<p id="token-result"></p>


	<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8082/goLoginRediectUri',
    });
  }

  // 아래는 데모를 위한 UI 코드입니다.
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



			</script>

</body>
</html>