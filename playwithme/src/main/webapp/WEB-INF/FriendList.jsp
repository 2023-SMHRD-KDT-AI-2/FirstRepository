<!-- 
박기원

2023.09.18
친구 리스트 + 친구 추가 + 1:1 채팅 추가 + 버튼 누를때 마다 새로고침+ 삭제 버튼 파란색
문제점 : @입력하면 안먹히는 것 친구 추가 안됨?
 
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- core 라이브러리 연결 -->

<%@page import="playwithme.model.*"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Friend List</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css'>
<link rel="stylesheet" href="assets/css/ChatList.css">
</head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
#search {
	height: 34px;
	margin: 0;
	border-radius: 33px;
	border: 1px solid gray;
	font-weight: 1000;
	margin-bottom: 29px;
	padding-left: 10px;
}

#clock {
	margin-left: 2px;
	margin-bottom: 10px;
	display: inline-block; /* 시계를 인라인 블록 요소로 설정 */
	vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
	margin-right: 3px;
	font-weight: BOLD;
	font-size: 15px;
}

#fix {
	position: relative;
	top: -2px;
	left: 0;
	height: 20px;
}

#internet {
	height: 19px;
	margin-left: 187px;
	margin-bottom: 2px;
}

#lte {
	height: 11px;
	margin-bottom: 5px;
}

#battery {
	height: 21px;
}

h3 {
	padding-left: 7px;
	padding-top: 7px
}

#searchButton {
	height: 26px;
	margin-left: 16px;
	position: relative;
	top: 5px;
}

#friendAddButton {
	height: 26px;
	margin-left: 13px;
	position: relative;
	top: 5px;
}

/* 삭제 버튼 스타일 */
.deleteFriendButton {
    background-color: #3498db;
    color: #fff; 
    border: none; 
    border-radius: 5px;
    padding: 5px 10px; 
    cursor: pointer; 
    transition: background-color 0.3s;
}



/* 삭제 버튼에 클릭시 스타일 변경  */
.deleteFriendButton:hover {
    background-color: #87CEFA;
}



</style>

<body class="center">
	<div class="contacts">
		<div id="fix">
			<span id="clock"></span> <img src="images/인터넷.png" id="internet">
			<img src="images/LTE.png" id="lte"> <img src="images/배터리.png"
				id="battery">
		</div>
		<h2>Friends</h2>
		<%
		String id = (String) session.getAttribute("memberid");
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> info = new ArrayList<>();
		info = dao.getmember(id);
		session.setAttribute("info", info);
		String memberId = info.get(0).getMember_Id();
		FriendListDAO friendDao = new FriendListDAO();
		ArrayList<String> friendList = friendDao.friendlist(memberId);

		ChattingListDAO Chatdao = new ChattingListDAO();
		ArrayList<ChattingListDTO> chatList = new ArrayList<>();
		chatList = Chatdao.chatlist(memberId);

		ArrayList<FriendListDTO> Allfriend = new ArrayList<>();
		FriendListDAO frdao = new FriendListDAO();
		Allfriend = frdao.friendlist();
		%>

			<div>
	
				<input type="text" name="friend_name_test" id="search"> 
				<img
					id="searchButton" src="images/검색.png" alt="친구 검색" /> 
					<img
					id="friendAddButton" src="images/채팅방생성.png" alt="친구 추가" />
			</div>




		<%
		if (friendList != null && !friendList.isEmpty()) {
			for (int i = 0; i < friendList.size(); i++) {
		%>
		<div class="contact"
			onclick="window.location.href='goChat?room=<%=Allfriend.get(i).getFriendchat_room_num()%>'">
			<div class="pic">
				<%
				String friendId = friendList.get(i);
				ArrayList<MemberDTO> info_friend = dao.getmember(friendId);
				if (!info_friend.isEmpty()) {
					String profileImage = info_friend.get(0).getM_Profile();
				%>
				<img class="pic" src="file/<%=profileImage%>"
					onerror="this.src='images/default.jpg'">
				<%
				} else {
				%>
				<img class="pic" src="images/default.jpg">
				<%
				}
				%>
			</div>
			<div class="name">
				<%=friendId%>
			</div>
			<div class="message">
				<button class="deleteFriendButton" data-friend="<%=friendId%>">삭제</button>
			</div>
		</div>
		<%
		}
		} else {
		%>
		<p>친구가 없습니다.</p>
		<%
		}
		%>

	</div>

	<script>
		$(document).ready(function() {
							$('#friendAddButton').on(
											'click',
											function() {
												let friend_name_test = $('#search').val();
												$.ajax({
													url : 'FriendAddProgram',
													type : 'GET',
													data : {
														friend_name_test : friend_name_test
															},
															success : function(response) {

																console.log('서버 응답:',response);
																alert('친구 추가 success');
																window.location.href = 'goFriendList.java';
																location.reload(); // 페이지 새로 고침
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																console
																		.error('Request failed: '
																				+ textStatus
																				+ ', '
																				+ errorThrown);
																alert('친구 추가 success');
																location
																		.reload(); // 페이지 새로 고침
															}
														});
											});
						});
	</script>

	<script>
		//친구 삭제 버튼
		$(document).ready(
				function() {
					$('.deleteFriendButton').on(
							'click',
							function() {
								let friendId = $(this).data('friend');
								if (confirm('친구를 삭제하시겠습니까?')) {
									$.ajax({
										url : 'FriendDeleteProgram',
										type : 'POST', // POST 방식으로 변경
										data : {
											friendId : friendId
										},
										success : function(response) {
											console.log('서버 응답:', response);
											alert('친구 삭제 success');
											location.reload(); // 페이지 새로 고침
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											console.error('Request failed: '
													+ textStatus + ', '
													+ errorThrown);
											alert('친구 삭제 실패');
										}
									});
								}
							});
				});
	</script>



  
   
</body>

</html>
