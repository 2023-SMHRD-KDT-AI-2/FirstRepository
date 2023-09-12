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
		<form action="JoinProgram" id="form" class="form">

			<h2>Play With Me</h2>
			<%
			// 1. email 의 형식이 맞는지 확인 (regex (정규표현식) 활용)
			// ************** 2. email 이 존재 여부 확인 ajax 활용
			// 3. 비밀번호의 형식이 맞는지 여부 확인 (regex (정규표현식) 활용)
			// 4. 첫번째 비밀번호 두번째 비밀번호가 동일 여부
			// ************** 5. 성별 여부는 select 나 radio 버튼 활용
			// 6. UerName 체크 : 길이 체크, 한글 여부 확인, 들어가지 말아야 할 문자 확인, 공백 확인
			// ************** 7. MBTI : bootstrap radio | select 활용
			%>
			<div class="form-control">
				<input type="text" id="email" name="member_Id"
					placeholder="이메일 주소 또는 전화번호"> <small>Error message</small>
			</div>

			<div class="form-control">
				<input type="password" id="password" name="pw" placeholder="비밀번호">
				<small>Error message</small>
			</div>

			<div class="form-control">
				<input type="password" id="password2" name="pw2"
					placeholder="비밀번호 확인"> <small>Error message</small>
			</div>

			<div class="form-control">
				<input type="text" id="gneder" name="gender" placeholder="성별">
				<small>Error message</small>
			</div>


			<div class="form-control">
				<input type="text" id="age" name="age" placeholder="나이"> <small>Error
					message</small>
			</div>

			<div class="form-control">
				<input type="text" id="username" name="m_Name" placeholder="사용자 이름">
				<small>Error message</small>

			</div>
			<div class="form-control">
				<input type="text" id="mbti" name="mbti" placeholder="mbti">
				<small>Error message</small>
			</div>

			<button id="joinSubmit" type="submit">회원가입</button>

		</form>
	</div>
	<script src="js/script.js"></script>

	<script>
		
	
	</script>

</body>
</html>