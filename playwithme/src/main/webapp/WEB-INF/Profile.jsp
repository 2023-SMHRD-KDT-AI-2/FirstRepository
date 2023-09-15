<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        	cursor :pointer;
			border : 0px;
			background-color :#fafafa;
			margin-top : 15px;
			margin-left : 10px;
		
		}
on
		.manner-temperature {
		    position: absolute;
		    top: -25px; /* 그래프 위에 위치하도록 조절 */
		    font-size: 11px;
		    z-index: 1; /* 다른 요소 위에 표시되도록 조절 */
		}
		#name {
		position: fixed;
   		margin-left: 161px;
   		margin-top: 19px;
   		color: #504e4e;
   		font-weight: bold;
		}
		#favorite {
		width: 170px;
		position: fixed;
   		margin-left: 145px;
   		margin-top: 45px;
		}
		#shap{
		position: fixed;
		color: #504e4e;
   		margin-left: 145px;
   		margin-top: 19px;
		}
		#shap{
		position: fixed;
   		margin-left: 145px;
   		margin-top: 19px;
		}
		#myid{
		position: fixed;
   		margin-left: 216px;
   		margin-top: 23px;
		font-size : xx-small;
		}
		

		#clock {
		margin-left: 10px;
		margin-bottom: 10px;
		display: inline-block; /* 시계를 인라인 블록 요소로 설정 */
		vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
		margin-right: 3px;
		font-weight: BOLD;
		}
		#fix{
		    position: relative;
		    top: 0;
		    left: 0;
		    height: 20px;
		    
		}
		#navi{
			height: 14px;
			margin-bottom: 8px;
		}
		#internet{
			height: 19px;
			margin-left: 180px;
			margin-bottom: 2px;
		}
		#lte{
			height: 11px;
			margin-bottom: 3px;
		}
		#battery{
			height: 21px;
			margin-bottom: 3px;
		}

    </style>
  </head>
  <body>
  <div id=fix>

		<span id="clock"></span>
		<img src="images/네비.png" id="navi">
		<img src="images/인터넷.png" id="internet">
		<img src="images/LTE.png" id="lte">
		<img src="images/배터리.png" id="battery">
		
		
	</div>
  <%
	String id = (String) session.getAttribute("memberid");
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> info = new ArrayList<>();
	info = dao.getmember(id);
	session.setAttribute("info", info);
	FavoriteDAO fdao = new FavoriteDAO();
	int fav = fdao.findnum(id);
	ArrayList<FavoriteDTO> favList = fdao.findfav(fav);
	%>
		<button class="material-symbols-outlined" id ="back" style="color:gray;">
arrow_back_ios
</button>
		<section class="ftco-section">
		
			<div class="container">
				<span id ="myid"><%=info.get(0).getMember_Id() %></span>
				<span id ="shap">#</span>
				<span id = "name"><%=info.get(0).getM_Name() %></span>
				<span id = "favorite">
				<%for(int i = 0; i<favList.size(); i++){%>
				<%=favList.get(i).getInterest() %>&nbsp;
				
				<%} %>
				
				</span>
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
   
///////////////////////////////////////////////////////////////////////////////
	// 시계
	function updateClock() {
		let currentDate = new Date();
		let hours = currentDate.getHours();
		let minutes = currentDate.getMinutes();
		
		let hoursStr = hours < 10 ? `0${hours}` : hours;
		let minutesStr = minutes < 10 ? `0${minutes}` : minutes;
		
		let clockElement = document.getElementById("clock");
		clockElement.textContent = `${hours}:${minutes}`;
	}

	// 1초마다 시간을 업데이트
	setInterval(updateClock, 1000);
	// 초기 로딩 시에도 시간 표시
	updateClock();

	////////////////////////////////////////////////////////////////////////////////
   
   
   
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
        
     // "매너온도" 문구 추가
        const mannerTemperature = document.createElement("span");
        mannerTemperature.className = "manner-temperature";
        mannerTemperature.textContent = "매너온도";
        document.querySelector(".graph-container").appendChild(mannerTemperature);
        
        $('#back').click(function () {
			location.href = 'goMain';
		})
	

    </script>
   
</body>
</html>