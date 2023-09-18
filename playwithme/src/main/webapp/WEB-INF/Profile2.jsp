
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
      margin-bottom: 1px;
      display: inline-block; /* 시계를 인라인 블록 요소로 설정 */
      vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
      margin-right: 3px;
      font-weight: BOLD;
      }
      #fix{
          position: relative;
          top: 3px;
          left: 16px;
          height: 20px;
          
      }
      
      #internet{
         height: 19px;
         margin-left: 206px;
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
		<img src="images/인터넷.png" id="internet">
		<img src="images/LTE.png" id="lte">
		<img src="images/배터리.png" id="battery">
		
		
	</div>
  <%
	
	BoardDTO board=(BoardDTO)request.getAttribute("board"); 
	BoardDAO dao2 = new BoardDAO();
	String id = board.getMember_Id();
  	FavoriteDAO fdao = new FavoriteDAO();
	int fav = fdao.findnum(id);
	ArrayList<FavoriteDTO> favList = fdao.findfav(fav);
	%>
		<button class="material-symbols-outlined" id ="back" style="color:gray;">
arrow_back_ios
</button>
		
		<section class="ftco-section">
		<div class="container">
				<span id ="shap">#</span>
				<span id = "name"><%=board.getM_Name()%><%=board.getMember_Id()%></span>
				<span id = "favorite">
				<%for(int i = 0; i<favList.size(); i++){%>
				<%=favList.get(i).getInterest() %>&nbsp;
				
				<%} %>
				
				
				</span>
			</div>
				<div class="row justify-content-center">

					<div class="col-md-6 d-flex justify-content-center">
						<div class="btn-group show">

						  <img src="images/<%=board.getM_Profile()%>" onerror="this.src='images/default.jpg'" class="btn-img img dropdown-toggle rounded-circle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						  
						  

						  	<div class="dropdown-menu show">
						  		<div>
						  		<h3>게시글</h3>
						  		<p><strong>제목:</strong> <span id="displayTitle3"><%=board.getTitle()%></span></p>
						        <p><strong>인원수:</strong> <span id="displayNumPeople3"><%=board.getNum_People()%></span></p>
						        <p><strong>모임시간:</strong> <span id="displayMeetTime3"><%=board.getMeet_Time()%></span></p>
						        <p><strong>모임장소:</strong> <span id="displayPlace3"><%=board.getPlace()%></span></p>
						        <p><strong>내용:</strong> <span id="displayBContent3"><%=board.getB_Content()%></span></p>
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
<script src="assets/js/clock.js"></script>
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
        const temper = ${board.getTemper()} // temper 값에 따라서 설정하세요.
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