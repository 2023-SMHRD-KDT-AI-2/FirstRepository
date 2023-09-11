<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page isELIgnored="false"%>
<%@page import="playwithme.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
  	<title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">
		<link rel="stylesheet" href="assets/css/style.css">
		<style >
		.graph {
	background: linear-gradient(70deg, blue, #00BCF2, #FABA2C, #F3481A, #FF0909);
	height: 15px;
	border-radius: 40px;
	width : 80%;
	margin-left: 10%
}

.graph1 {

	display: block;
	width: 0;
	line-height: 1px;
	text-align: center;
	border-radius: 45px;
	box-sizing: border-box;
	font-size: 20px;
	color: black;
	animation: stack 2s 1;
	margin-left: 10%
}


@keyframes stack { 0%{
	width: 0;
	color: rgb(255, 255, 255, 0)}
}
		</style>
  </head>
  <body>
  <%
	String id = (String) session.getAttribute("memberid");
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> info = new ArrayList<>();
	info = dao.getmember(id);
	session.setAttribute("info", info);
	%>
		
		<section class="ftco-section">
		
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
					
						<h2 class="heading-section mb-5 pb-md-4"></h2>
					</div>
					
				</div>
				
				<div class="row justify-content-center">

					<div class="col-md-6 d-flex justify-content-center">
						<div class="btn-group show">
						  <img src="file/${info.get(0).getM_Profile()}" onerror="this.src='images/default.jpg'" class="btn-img img dropdown-toggle rounded-circle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						  <div class="dropdown-menu show">
						  <div>
						    <a class="dropdown-item d-flex align-items-center" href="goChangeImg">
								프로필 사진 변경
						    </a>
						    <a class="dropdown-item d-flex align-items-center " href="goMyBoard">
								내 게시물 확인
							</a>
						    <a class="dropdown-item d-flex align-items-center" href="goChangepPw">
						    	비밀번호 변경
						    </a>
						    <a class="dropdown-item d-flex align-items-center" href="goFavorite">
						    	관심사 수정
						    </a>
						    <a class="dropdown-item d-flex align-items-center" href="goMain">
								홈
						    </a>
						    <a class="dropdown-item d-flex align-items-center" href="Logout">
								로그아웃
						    </a>
						  </div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<span class="graph1" id = "hi">${info.get(0).getTemper()}</span> <br> <span
			class="graph1">▼</span>
	</div>
	<div class="graph"></div>
		<script src="js/jquery-3.7.1.js"></script>
	<script >

	$('.graph1').css("width", `${info.get(0).getTemper()}%`);
	$('body > span:nth-child(2)').text(`${info.get(0).getTemper()}℃`);
	</script>
  </body>
</html>