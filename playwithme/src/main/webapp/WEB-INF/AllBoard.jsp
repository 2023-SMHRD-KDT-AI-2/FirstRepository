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
<%@page import="com.google.gson.Gson"%>
<!doctype html>
<html lang="en">
<head>
<title>Table 08</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="assets/css/AllBoardstyle.css">
<style>
#pro{
	 width: 32px;
    height: 32px;
    margin-right: 11px;
    position: fixed;
    right: 79px;
    border-radius: 50%;
    bottom: 26px;
    border: 1.8px solid black;
}
#menu {
            display: flex;
    position: absolute;
    top: 675px;
    left: -33px;
    right: 0px;
    width: 392px;
    height: 70px;
    background: #fff;
    overflow: hidden;
    z-index: 2;
        }


        #menu li {
			
           width: 129px;
    display: block;
    /* border-right: 1px solid #acacac; */
    padding: 6px 3%;
    font-size: 10px;
    text-align: center;
    cursor: pointer;
}
        }

        #menu li.on {
            background: #eee;
        }

        #menu li:hover {
            background: #eee;
            margin-left: -1px;
        }

        #menu li:last-child {
            margin-right: 0;
            border-right: 0;
        }

        #menu li span {
            display: block;
            margin: 0 auto 3px;
            width: 27px;
            height: 28px;
        }

        #menu li .menu_bg.new-icon1 {
            margin-top: 7px;
            background: url("images/친구2.png") no-repeat;
            background-size: contain;
                width: 24px;

        }

        #menu li .menu_bg.new-icon2 {
            margin-top: 7px;
            background: url("images/게시판5.png") no-repeat;
            background-size: contain;
                width: 24px;

        }

        #menu li .menu_bg.new-icon3 {
            margin-top: 7px;
            background: url("images/채팅.png") no-repeat;
            background-size: contain;
                width: 24px;

        }

        #menu li .menu_bg.new-icon4 {
            margin-top: 7px;
            background-size: contain;
                width: 1px;

        }
        #menu li .menu_bg.new-icon5 {
            margin-top: 7px;
            background: url("images/지도3.png") no-repeat;
            background-size: contain;
                width: 24px;

        }
	#search{
	width: 17px;
    z-index: 1;
    position: relative;
    bottom: -30px;
    left: 33px;
}

</style>
</head>
<body>
	<div id=fix>

		<span id="clock"></span> <img src="images/인터넷.png" id="internet">
		<img src="images/LTE.png" id="lte"> <img src="images/배터리.png"
			id="battery">


	</div>
	<%
	String memberId = (String) session.getAttribute("memberid");
	BoardDAO brdao = new BoardDAO();
	ArrayList<BoardDTO> AllBoard = new ArrayList<>();
	AllBoard = brdao.list();
	session.setAttribute("myBoard", AllBoard);
	
	String id = (String) session.getAttribute("memberid");
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> info = new ArrayList<>();
	info = dao.getmember(id);
	session.setAttribute("info", info);
	String memberId2 = info.get(0).getMember_Id();
	ChattingListDAO Chatdao = new ChattingListDAO();
	ArrayList<ChattingListDTO> chatList = new ArrayList<>();

	chatList = Chatdao.chatlist(memberId);
	
	%>
	<button class="material-symbols-outlined" id="back"
		style="color: gray;">arrow_back_ios</button>

	<div class="container">
	
		<div class="row justify-content-center"></div>
		<div class="row">
			<div class="col-md-12">
				<h3 class="h5 mb-4 text-center">전체 모임</h3>
				<img src="images/검색.png" id="search">
				<input type="text" id="searchInput" placeholder="검색어를 입력하세요" /><span
					id="clearSearch" class="material-symbols-outlined">close</span><Br>
				<span id=sulmyuong>내용을 보실려면 해당 게시글을 클릭해주세요</span>
				<div id="searchResults">
					<div class="table-wrap" class="table-container">
						<table class="table myaccordion table-hover" id="accordion">
							<thead>
								<tr id="top">
                           <th class="title" >&nbsp;&nbsp;제목</th>
                           <th>인원수</th>
                           <th class ="dfix">수정/삭제</th>
                        </tr>
							</thead>
							<tbody>

								<%
								if (AllBoard != null) {
									for (int i = 0; i < AllBoard.size(); i++) {
										String timestampString = AllBoard.get(i).getB_Date();

										// Timestamp 형식으로 변환
										Timestamp timestamp = Timestamp.valueOf(timestampString);

										// 원하는 형식으로 포맷팅
										SimpleDateFormat outputFormat = new SimpleDateFormat("yy-MM-dd HH:mm");
										String formattedDate = outputFormat.format(timestamp);
								%>
								<tr data-toggle="collapse" data-target="#collapse<%=i%>"
									aria-expanded="false" aria-controls="collapse<%=i%>">

									<td class="title"><%=AllBoard.get(i).getTitle()%></td>
									<td class="meeting-time"><%=AllBoard.get(i).getParti_num() %>/<%=AllBoard.get(i).getNum_People() %>명</td>
									<td><button class="first">
											<a href="goChat?room=<%=AllBoard.get(i).getChat_room_num()%>">채팅참여</a>
											<!-- 채팅 참여 버튼 -->
										</button> <%
 											int partiNum = AllBoard.get(i).getParti_num();
											int numPeople = AllBoard.get(i).getNum_People();

 											// 조건에 따라 버튼을 표시하거나 숨깁니다.
 											if (partiNum < numPeople) {
 											%>
										<button class="second">
											<a href="BoardPartiUp?num=<%=AllBoard.get(i).getBoard_Num()%>">참가</a>
										</button> <%
 										}
 										%></td>
								</tr>
								<tr>
									<td colspan="1" id="collapse<%=i%>" class="collapse acc"
										data-parent="#accordion" style="text-align: left; !important"
										width=165px;><%=AllBoard.get(i).getB_Content()%></td>
									<td colspan="2" id="collapse<%=i%>" class="collapse acc2" data-parent="#accordion"style="text-align: center;"><%=formattedDate%></td>
								</tr>
								<script>
	           						 document.getElementById('collapse<%=i%>
									').classList
											.remove('show');
								</script>
								<%
								}
								}
								%>




							</tbody>
						</table>
					</div>
				</div>
			</div>
		
		<ul id="menu">
			<li id="A1" data-order="0"><span id="friendLink"
				class="menu_bg new-icon1"></span> 친구</li>
			<li id="A2" data-order="1"><span id="boardLink"
				class="menu_bg new-icon2"></span>게시판</li>
			<li id="A3" data-order="2"><span id="chatLink"
				class="menu_bg new-icon3"></span> 채팅</li>
			<li id="A4" data-order="3"><span class="menu_bg new-icon4"><img id="pro" src="images/<%=info.get(0).getM_Profile()%>" ></span>
				마이</li>
			<li id="A5" data-order="4"><span class="menu_bg new-icon5"></span>
				지도</li>
		</ul>
		</div>
	</div>


	<script src="js/jquery-3.7.1.js"></script>
	<script src="assets/js/MyBoardjquery.min.js"></script>
	<script src="assets/js/MyBoardpopper.js"></script>
	<script src="assets/js/MyBoardbootstrap.min.js"></script>
	<script src="assets/js/MyBoardmain.js"></script>
	<script src="assets/js/clock.js"></script>
	<script src="assets/js/menuFix.js"></script>
	
	<script>
		$('#back').click(function() {
			  window.history.back(); // 뒤로 가기
		})

		$('.first').hover(function() {
			$(this).css('backgroundColor', '#40a9f2');
		}, function() {
			$(this).css('backgroundColor', ''); // 마우스 아웃 시 배경색 초기화
		});
		$('.second').hover(function() {
			$(this).css('backgroundColor', '#40a9f2');
		}, function() {
			$(this).css('backgroundColor', ''); // 마우스 아웃 시 배경색 초기화
		});
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

		// 페이지 로딩 시 한 번 호출하여 초기 스타일 적용
		function applyRowStyles() {
			var currentTime = new Date();

			// 각 행을 확인하면서 모임 시간과 비교
			$("#accordion tbody tr").each(function(index) {
				var meetingTimeStr = $(this).find(".meeting-time").text();
				var meetingTime = new Date(meetingTimeStr.replace(/-/g, '/'));
				console.log(currentTime)
				console.log(meetingTimeStr)
				// 모임 시간이 현재 시간을 넘어갔을 경우
				if (meetingTime < currentTime) {
					$(this).css({
						"background-color" : "#ccc", // 짙은 회색 배경색
						"color" : "white" // 흰색 글자색
					});
				}
			});
		}
		// 페이지 로딩 시 한 번 호출하여 초기 스타일 적용
		applyRowStyles();

		// 1분마다 현재 시간을 확인하여 스타일 업데이트
		setInterval(applyRowStyles, 60000); // 1분(60,000밀리초)마다 업데이트
	</script>
</body>
</html>