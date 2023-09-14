<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">
		<link rel="stylesheet" href="assets/css/style.css">
		 <style>
        /* 그래프 스타일 */
        .graph-container {
        	background-color : #ded1d18f;
        	border-radius : 45px;
            width: 75%;
            height: 14px;
            border: 1px solid #ccc;
            position: relative;
            display: flex;
            margin-left: 12%;
            margin-top: 10%;
             /* 그래프를 가로로 뒤집음 */
        }
        .graph-bar {
        	border-radius : 45px;
            width: 0;
            background-color: #67b7ee;
            transition: width 0.5s;
        }
        .graph-label {
        	position :relative;
        	top : -30px;
        	left : -10px;
            width: 0;
   			margin-bottom: 20px;
   			font-size: 5px;
        }
        .arrow {
        	position :relative;
        	left : -7px;
        	top : -20px; 
            width: 0;
    		font-size: 5px;
        }
   
        #back {
		border : 0px;
		background-color :#fafafa;
		margin-top : 15px;
		margin-left : 10px;
		
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
		<button class="material-symbols-outlined" id ="back" style="color:gray;">
arrow_back_ios
</button>
		<section class="ftco-section">
		
			<div class="container">
				<div class="row">
					
					
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
		  <div class="graph-container">
        <!-- Graph bar that will animate -->
        <div class="graph-bar" style="width: 0%;"></div>
        <!-- Label for the graph -->
        <span class="graph-label"></span>
        <!-- Arrow icon -->
        <span class="arrow">▼</span>
    </div>


<script src="js/jquery-3.7.1.js"></script>
   <script>
        // JavaScript로 그래프를 업데이트하는 함수
        function updateGraph(percentage) {
            const graphBar = document.querySelector(".graph-bar");
            const graphLabel = document.querySelector(".graph-label");
            const arrow = document.querySelector(".arrow");
            
            // 그래프 바 업데이트
            graphBar.style.width = percentage + "%";
            
            // 그래프 라벨와 화살표의 너비와 위치를 그래프 바에 맞게 설정
            
            // 그래프 라벨 업데이트
            graphLabel.textContent =percentage +"℃";
        }
        
        // temper 값을 사용하여 그래프 업데이트
        const temper = ${info.get(0).getTemper()}; // temper 값에 따라서 설정하세요.
        updateGraph(temper);
        $('#back').click(function () {
			location.href = 'goMain';
		})
	

    </script>
   
</body>
</html>