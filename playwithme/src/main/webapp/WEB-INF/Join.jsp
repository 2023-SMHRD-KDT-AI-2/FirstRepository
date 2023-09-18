<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonObject" %>

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
@charset "EUC-KR";

@import
	url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');

:root {
	--success-color: #2ecc71;
	--error-color: #e74c3c;
}

* {
	box-sizing: border-box;
}

body {
	background-color: #f9fafb;
	font-family: 'Open Sans', sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}

.container {
	background: #fff;
	border-radius: 5px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
	width: 360px;
	height: 740px;
}

#div {
	padding-bottom: 40px;
}

h2 {
	text-align: center;
	margin: 0 0 40px;
}

.form {
	padding: 30px 40px;
	margin-top: 40px;
}

.form-control {
	margin-bottom: 10px;
	padding-bottom: 20px;
	position: relative;
}

.form-control label {
	color: #777;
	display: block;
}

.form-control input {
	border: 2px solid #f0f0f0;
	border-radius: 4px;
	display: block;
	width: 100%;
	padding: 10px;
	font-size: 11px;
}

.form-control input:focus {
	outline: 0;
	border-color: #777;
}

.form-control.success input {
	border-color: var(--success-color);
}

.form-control.error input {
	border-color: var(--error-color);
}

.form-control small {
	color: var(--error-color);
	position: absolute;
	bottom: 0;
	left: 0;
	visibility: hidden;
}

.form-control.error small {
	visibility: visible;
}

.form button {
	cursor: pointer;
	background-color: #7cc4f5;
	border: 2px solid #7cc4f5;
	border-radius: 4px;
	color: #fff;
	display: block;
	font-size: 12px;
	padding: 10px;
	margin-top: 20px;
	width: 100%;
}

.label2 {
	width: 280px;
	height: 36px;
	border: 2px solid #f0f0f0;
}

a {
	text-decoration-line: none;
}

.label {
	font-size: 12px;
}

.logo {
	display: block;
	margin: auto;
	transform: translate(0, -10%);
}
</style>
</head>
<body>

<%
String name = (String)session.getAttribute("kakaoName");
String id = (String)session.getAttribute("kakaoId");




%>
	<div class="container">
		<form action="JoinProgram" id="form" class="form">


	<div class="container">
		<form action="JoinProgram" id="form" class="form" method="post">

			<div>
				<img src="images/로고2.png" class="logo">
			</div>

			<h2 style="color:#a0e1f4">Play With Me</h2>

			<div class="form-control">

				<input type="text" id="email" name="member_Id"
					placeholder="이메일 주소 또는 전화번호" > <small>Error message</small>

			</div>

			<div class="form-control">
				<input type="password" id="password" name="pw" placeholder="비밀번호 (6자리 이상 입력하세요)"> 
				<small>Error message</small>
			</div>

			<div class="form-control">
				<input type="password" id="password2" name="pw2" placeholder="비밀번호 확인"> 
				<small>Error message</small>
			</div>

			<div class="form-control">


				<label class="label" for="gender">성별 선택</label> 
				<select class="label2" name="gender" class="form-select form-select-lg mb-3"
					aria-label="Large select example">
					<option value="men">남성</option>
					<option value="women">여성</option>

				</select>
			</div>

			<div class="form-control">



				<input type="text" id="age" name="age" placeholder="나이"> 

				<small>Error message</small>

			</div>

			<div class="form-control">
				<input type="text" id="username" name="m_Name" placeholder="사용자 이름">
				<small>Error message</small>
			</div>

			<div class="form-control">

				<label class="label" for="mbti">MBTI 선택</label> <select
					class="label2" name="mbti" class="form-select form-select-lg mb-3"
					aria-label="Large select example">
					<option value="ISTJ">ISTJ</option>
					<option value="ISTJ">ISFJ</option>
					<option value="INFJ">INFJ</option>
					<option value="INTJ">INTJ</option>
					<option value="ISTP">ISTP</option>
					<option value="ISFP">ISFP</option>
					<option value="INFP">INFP</option>
					<option value="INTP">INTP</option>
					<option value="ESTP">ESTP</option>
					<option value="ESFP">ESFP</option>
					<option value="ENFP">ENFP</option>
					<option value="ENTP">ENTP</option>
					<option value="ESTJ">ESTJ</option>
					<option value="ESFJ">ESFJ</option>
					<option value="ENFJ">ENFJ</option>
					<option value="ENTJ">ENTJ</option>

				</select>
			</div>

			<button id="joinSubmit" >회원가입</button>

		</form>
	</div>
	<script src="js/script.js"></script>
	<script src="js/jquery-3.7.1.js"></script>

	<script>
		if(<%=name%>!=null){
			$("#username").attr('value', <%=name%>);
		}
		if(<%=id%>!=null){
			$("#email").attr('value', <%=id%>);
		}
	</script>

	<script src="assets/js/Joinscript.js"></script>


</body>
</html>