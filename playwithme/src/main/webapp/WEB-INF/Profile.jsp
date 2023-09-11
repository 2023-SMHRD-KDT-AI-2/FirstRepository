<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page isELIgnored="false" %>
<%@page import="playwithme.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

.graph1{
            display: block;
            width: 0;
            line-height: 10px;
            text-align: right;
            border-radius: 45px;
            box-sizing: border-box;
            font-size: 30px;
            color: black; animation: stack 2s 1;
        }
        body > div:nth-child(2) > span:nth-child(1){
            margin-left: 15px;
        }
        @keyframes stack{
            0%{ width:0; color:rgb(255,255,255,0)}
            
           
            
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
	
	<div id="profileimg">
		<img src="file/${info.get(0).getM_Profile()}" alt="" id="img">
		
		${info.get(0).getAge()}
		<table id=table2>
			<tr>
				<td></td>

			</tr>
		</table>
		<br> <br> <br>
	</div>
	<div>
		<span class="graph1">${info.get(0).getTemper()}</span> <br> <span class="graph1">▼</span>
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
	<script src="js/jquery-3.7.1.js"></script>
	<script>
	 	let graphnum = document.querySelector("body > div:nth-child(2) > span:nth-child(1)")
     	console.log(graphnum.textContent);
    	$('.graph1').css("width",`${info.get(0).getTemper()}%`);
     	$('body > div:nth-child(2) > span:nth-child(1)').text(`${info.get(0).getTemper()}℃`);
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
			window.location = "goChangepPw"
		})
		logoutBtn.addEventListener('click', function() {
			window.location = "Logout"
		})
	</script>
</body>
</html>