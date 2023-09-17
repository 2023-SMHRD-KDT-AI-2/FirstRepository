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
	body {
	position: fixed;
	}
	#clock {
		margin-left: -11px;
		margin-bottom: 5px;
		display: inline-block; /* 시계를 인라인 블록 요소로 설정 */
		vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
		font-weight: BOLD;
		font-size: 15px;
	}
	#fix{
	    position: relative;
	    top: 10px;
	    left:29px;
	    height: 20px;
	    
	}
	#internet{
		height: 19px;
		margin-left: 200px;
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
	 	cursor: pointer;
		border : 0px;
		background-color :#fafafa;
		margin-top : 21px;
		margin-left : 7px;
		
		}
	
	
	.first {
            cursor: pointer;
            background-color: #adabab;
            border-radius: 4px;
            color: #fff;
            font-size: 10px;
		    width: 38px;
		    height: 25px;
		    border-color: #fff !important;
		    
        }
      .second {
            cursor: pointer;
            background-color: #848181;
            border-radius: 4px;
            font-size: 10px;
            border-color: #848181
            width: 38px;
		    height: 25px;
        }
        .collapse.acc2{
        	padding-left:64px;
        }
        .title{
        	    padding-left: 10px;
        }
     #searchInput {
     	width: 90%;
		height: 29px;
	    margin: 0;
	    border-radius: 33px;
	    border: 1px solid gray;
	    margin-bottom: 0px;
	    padding-left: 10px;
	}
	#clearSearch{
		position: relative;
	    cursor: pointer;
	    color: red;
	    z-index: 1;
	    left: -28px;
	    top: 4px;
	}
	.table-wrap {
            max-height: 100%; /* 원하는 최대 높이로 설정하세요. */
            overflow-y: auto; /* 세로 스크롤 활성화 */
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
					<h3 class="h5 mb-4 text-center">${info.get(0).getM_Name()}님의 게시물</h3>
					<input type="text" id="searchInput" placeholder="검색어를 입력하세요"/><span id="clearSearch" class="material-symbols-outlined">
close
</span><BR>
					<span id = sulmyuong>내용을 보실려면 해당 게시글을 클릭해주세요</span>
					<div id="searchResults">
					<div class="table-wrap" class="table-container">
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
		</div>
	
		
<script src="js/jquery-3.7.1.js"></script>
 <script src="assets/js/MyBoardjquery.min.js"></script>
  <script src="assets/js/MyBoardpopper.js"></script>
  <script src="assets/js/MyBoardbootstrap.min.js"></script>
  <script src="assets/js/MyBoardmain.js"></script>
  <script src="assets/js/clock.js"></script>
  <script>
	$('#back').click(function () {
		location.href = 'goProfile';
	})
	
$('.first').hover(
		function() {
		$(this).css('backgroundColor', '#40a9f2');
		},
		function() {
		$(this).css('backgroundColor', ''); // 마우스 아웃 시 배경색 초기화
		}
	);
$('.second').hover(
		function() {
			$(this).css('backgroundColor', '#40a9f2');
		},
		function() {
			$(this).css('backgroundColor', ''); // 마우스 아웃 시 배경색 초기화
		}
		);
$(document).ready(function() {
    // 검색어 입력 시 실행될 함수
    function filterTableRows(query) {
        // 검색어를 소문자로 변환
        query = query.toLowerCase();

        // 모든 행을 숨김
        $("#accordion tbody tr").hide();

        // 검색어와 일치하는 행을 표시
        $("#accordion tbody tr").each(function(index) {
            var rowText = $(this).text().toLowerCase();
            if (rowText.indexOf(query) !== -1) {
                $(this).show();

                // 검색 결과 행부터 다음 행까지도 표시
                var nextRow = $(this).next("tr");
                while (nextRow.length > 0 && !nextRow.is(":visible")) {
                    nextRow.show();
                    nextRow = nextRow.next("tr");
                }
            }
        });
    }

    // 검색어 입력란에 입력이 있을 때 실행
    $("#searchInput").on("input", function() {
        var query = $(this).val();
        filterTableRows(query);
    });

    // 검색 초기화 버튼 클릭 시 검색어 초기화 및 모든 행 표시
    $("#clearSearch").click(function() {
        $("#searchInput").val("");
        $("#accordion tbody tr").show();
    });
});
  </script>
	</body>
</html>