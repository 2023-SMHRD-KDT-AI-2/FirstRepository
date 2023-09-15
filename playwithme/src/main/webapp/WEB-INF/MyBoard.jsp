<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page isELIgnored="false"%>
<%@page import="playwithme.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<!doctype html>
<html lang="en">
  <head>
  	<title>Table 08</title>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="assets/css/MyBoardstyle.css">
	<style >
	#clock {
		margin-left: -11px;
		margin-bottom: 5px;
		display: inline-block; /* 시계를 인라인 블록 요소로 설정 */
		vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
		font-weight: BOLD;
	}
	#fix{
	    position: relative;
	    top: 7px;
	    left:28px;
	    height: 20px;
	    
	}
	#internet{
		height: 19px;
		margin-left: 212px;
		margin-bottom: 7px;
	}
	#lte{
		height: 11px;
		margin-bottom: 7px;
	}
	#battery{
		height: 21px;
		margin-bottom: 7px;
	}
	
	
	 #back {
		border : 0px;
		background-color :#fafafa;
		margin-top : 15px;
		margin-left : 10px;
		
		}
	
	
	.first {
            cursor: pointer;
            background-color: #adabab;
            border-radius: 4px;
            color: #fff;
            font-size: 10px;
		    width: 38px;
		    height: 25px;
        }
      .second {
            cursor: pointer;
            background-color: #848181;
            border-radius: 4px;
            font-size: 10px;
            
            width: 38px;
		    height: 25px;
        }
        .collapse.acc2{
        	padding-left:64px;
        }
        .title{
        	    padding-left: 10px;
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
	String memberId = (String) session.getAttribute("memberid");
	BoardDAO brdao = new BoardDAO();
	ArrayList<BoardDTO> myBoard = new ArrayList<>();
	myBoard = brdao.myList(memberId);
	session.setAttribute("myBoard", myBoard);
	
	%>
	<button class="material-symbols-outlined" id ="back" style="color:gray;">
arrow_back_ios
</button>
	
		<div class="container">
			<div class="row justify-content-center">
			</div>
			<div class="row">
				<div class="col-md-12">
					<h3 class="h5 mb-4 text-center"><%=memberId %>님의 게시물</h3>
					<span id = sulmyuong>내용을 보실려면 해당 게시글을 클릭해주세요</span>
					<div class="table-wrap">
						<table class="table myaccordion table-hover" id="accordion">
						  <thead>
						    <tr>
						      <th class="title" style="text-align: left; !important" >&nbsp;&nbsp;제목</th>
						      <th>인원수</th>
						      <th>수정/삭제</th>
						    </tr>
						  </thead>
						  <tbody>
						  
						<%
						if(myBoard != null){
							for(int i = 0 ; i<myBoard.size() ; i++) {
								String timestampString = myBoard.get(i).getB_Date();

								// Timestamp 형식으로 변환
								Timestamp timestamp = Timestamp.valueOf(timestampString);

								// 원하는 형식으로 포맷팅
								SimpleDateFormat outputFormat = new SimpleDateFormat("yy-MM-dd");
								String formattedDate = outputFormat.format(timestamp);
							
							%>
							    <tr data-toggle="collapse" data-target="#collapse<%=i%>" aria-expanded="false" aria-controls="collapse<%=i%>" >
							      
							      <td style="text-align: left; !important"><%=myBoard.get(i).getTitle() %></td>
							      <td><%=myBoard.get(i).getNum_People() %>명</td>
							      <td><button class = "first"><a href ="goFixBoard?num=<%=myBoard.get(i).getBoard_Num()%>" onclick ="return fixOk();">수정</button>
							      <button class = "second"><a href ="BoardDeleteOne?num=<%=myBoard.get(i).getBoard_Num()%>" onclick ="return delOk();">삭제</a></button >
							      </td>
							    </tr>
							    <tr>
							    	<td colspan="1" id="collapse<%=i%>" class="collapse acc"  data-parent="#accordion"style="text-align: left; !important" width= 165px; >
							    		 <%=myBoard.get(i).getB_Content()%>
							    	</td>
							      <td colspan="2" id="collapse<%=i%>" class="collapse acc2" data-parent="#accordion"style="text-align: center;"><%=formattedDate%></td>
							    </tr>
							    <script>
	           						 document.getElementById('collapse<%=i%>'). classList.remove('show');
	       						 </script>
								<%}} %>
						
						
						
						    
						  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	
		
<script src="js/jquery-3.7.1.js"></script>
 <script src="assets/js/MyBoardjquery.min.js"></script>
  <script src="assets/js/MyBoardpopper.js"></script>
  <script src="assets/js/MyBoardbootstrap.min.js"></script>
  <script src="assets/js/MyBoardmain.js"></script>
  <script src="assets/js/clock.js"></script>
  <script >
///////////////////////////////////////////////////////////////////////////////
	// 시계
	function updateClock() {
		const currentDate = new Date();
		const hours = currentDate.getHours();
		const minutes = currentDate.getMinutes();
		
		const hours12 = hours % 12 || 12;
		
		const hoursStr = String(hours12).padStart(2, '0'); 
	    const minutesStr = String(minutes).padStart(2, '0'); 

	    const clockElement = document.getElementById("clock");
	    clockElement.textContent = `${hoursStr}:${minutesStr}`;
	}

	// 1초마다 시간을 업데이트
	setInterval(updateClock, 1000);

	// 초기 로딩 시에도 시간 표시
	updateClock();

	//////////////////////////////////////////////////////////////////////////////// 
  $('#back').click(function () {
		location.href = 'goProfile';
	})
  <script src="assets/js/MyBoardmain.js"></script> 
  <script >
  	$('.first').hover(
		    function() {
		        $(this).css('backgroundColor', '#74bdf0');
		    },
		    function() {
		        $(this).css('backgroundColor', ''); // 마우스 아웃 시 배경색 초기화
		    }
			);
 	$('.second').hover(
		    function() {
		        $(this).css('backgroundColor', '#d92626');
		    },
		    function() {
		        $(this).css('backgroundColor', ''); // 마우스 아웃 시 배경색 초기화
		    }
			);
  </script>
	</body>
</html>