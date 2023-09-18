<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="playwithme.model.*"%>
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

			<div class="form-control">
				<input type="text" id="email" name="member_Id"
					placeholder="이메일 주소 또는 전화번호" > <small>Error message</small>
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
				<select>
					<obtion value="" disabled selected>성별</obtion>
					<obtion value="men">남자</obtion>
					<obtion value="women">여자</obtion>
				</select>
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
				<select>
					<option value="" disabled selected>MBTI</obtion>
					<option value="mbti">ISTJ</option>
					<option value="mbti">ISFJ</option>
					<option value="mbti">INFJ</option>
					<option value="mbti">INTJ</option>
					<option value="mbti">ISTP</option>
					<option value="mbti">ISFP</option>
					<option value="mbti">INFP</option>
					<option value="mbti">INTP</option>
					<option value="mbti">ESTP</option>
					<option value="mbti">ESFP</option>
					<option value="mbti">ENFP</option>
					<option value="mbti">ENTP</option>
					<option value="mbti">ESTJ</option>
					<option value="mbti">ESFJ</option>
					<option value="mbti">ENFJ</option>
					<option value="mbti">ENTJ</option>
				</select>
			</div>

			<button id="joinSubmit" type="submit">회원가입</button>

		</form>
		<button class="api-btn" onclick="requestUserInfo()" >사용자 정보 가져오기</button>
	</div>

</body>
</html>