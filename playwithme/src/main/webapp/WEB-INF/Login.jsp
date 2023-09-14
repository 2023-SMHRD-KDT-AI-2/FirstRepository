<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
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
			<button id="button2" type="button" ><a href="#">간편로그인</a></button>
			<button id='button3' type="button" ><a href="goJoin">계정이 없으신가요?&nbsp;&nbsp;  회원가입</a></button>
		</form>
	</div>
	
		<!--카카오 간편 로그인 기능 js 파일 만들기-->


<script src="js/script.js"></script>
			<!-- 카카오 스크립트 -->
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script>
				Kakao.init('662807c83d8fccc55bc8bf7c650227b4'); //발급받은 키 중 javascript키를 사용해준다.
				console.log(Kakao.isInitialized()); // 초기화여부판단
				//카카오로그인
				function kakaoLogin() {
					Kakao.Auth.login({
						success : function(response) {
							Kakao.API.request({
								url : '/v2/user/me',
								success : function(response) {
									console.log(response)
								},
								fail : function(error) {
									console.log(error)
								},
							})
						},
						fail : function(error) {
							console.log(error)
						},
					})
				}
				//카카오로그아웃  
				function kakaoLogout() {
					if (Kakao.Auth.getAccessToken()) {
						Kakao.API.request({
							url : '/v1/user/unlink',
							success : function(response) {
								console.log(response)
							},
							fail : function(error) {
								console.log(error)
							},
						})
						Kakao.Auth.setAccessToken(undefined)
					}
				}
			</script>
	
</body>
</html>