<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="playwithme.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
body {
	background-color: rgb(160, 225, 243);
}

#table {
	height: 100%;
	margin-top: 10%;
	display: flex;
	justify-content: center;
	align-items: center;
	border-collapse: separate;
	border-spacing: 20px;
}

#img {
	flex: none;
	width: 25%;
	height: 25%;
	border-radius: 50%;
	margin-left: 35%;
	margin-top: 2%;
}

#table td {
	width: 2000px;
}

#talbe>tr {
	width: 100%;
	height: 100%;
}

td>button {
	font-size: larger;
	width: 100%;
	height: 60px;
	border-radius: 40px;
}

.graph {
	background: linear-gradient(70deg, blue, #00BCF2, #FABA2C, #F3481A, #FF0909);
	height: 30px;
	border-radius: 40px;
}

.graph1 {
	display: block;
	width: 75%;
	line-height: 10px;
	text-align: right;
	border-radius: 45px;
	box-sizing: border-box;
	font-size: 30px;
	color: black;
	animation: stack 2s 1;
}

@
keyframes stack { 0%{
	width: 0;
	color: rgb(255, 255, 255, 0)
}

50
%
{
}
100
%
{
width
:
75%;
color
:
rgb(
0
,
0
,
0
,
1
)
}
}
#ch {
	display: contents;
	justify-content: right;
	align-items: center;
}

#table2 {
	position: absolute;
	left: 75%;
	bottom: 90%;
	font-size: 25px;
}
</style>
</head>
<body>
	<%
	String id =(String)session.getAttribute("memberid");
	String gender =(String)session.getAttribute("gender");
	String mbti =(String)session.getAttribute("mbti");
	String name =(String)session.getAttribute("name");
	String profile =(String)session.getAttribute("profile");
	int temper =(int)session.getAttribute("temper");
	int age =(int)session.getAttribute("age");
	
	%>
	<div id="profileimg">
		<img src=<%=profile %> alt="" id="img">
		<table id=table2>
			<tr>
				<td><%=mbti %></td>
				<%=profile %>
			</tr>
		</table>
		<br> <br> <br>
	</div>
	<div>
		<span class="graph1"><%=temper%>%</span> <br> <span class="graph1">▼</span>
	</div>
	<div class="graph"></div>
	<table id="table">
		<tr>
			<td><button id="changeImg">프로필 사진 변경</button></td>
		</tr>
		<tr>
			<td><button id="fix">관심사 수정</button></td>
		</tr>
		<tr>
			<td><button id="myText">내 게시물 확인하기</button></td>
		</tr>
		<tr>
			<td><button id="changePw">비밀번호 변경</button></td>
		</tr>
		<tr>
			<td><button id="logout">로그아웃</button></td>
		</tr>
	</table>
	<script src="code.jquery.com_jquery-3.7.1.min.js"></script>
	<script>
		let changeImgBtn = document.querySelector('#changeImg')
		let fixBtn = document.querySelector('#fix')
		let myTextBtn = document.querySelector('#myText')
		let changePwBtn = document.querySelector('#changePw')
		let logoutBtn = document.querySelector('#logout')
		changeImgBtn.addEventListener('click', function() {
			window.location = "goChangeImg"
		})
		fixBtn.addEventListener('click', function() {
			window.location = "goFavorite"
		})
		myTextBtn.addEventListener('click', function() {
			window.location = "https://www.naver.com"
		})
		changePwBtn.addEventListener('click', function() {
			window.location = "https://www.naver.com"
		})
		logoutBtn.addEventListener('click', function() {
			window.location = "https://www.naver.com"
		})
	</script>
</body>
</html>