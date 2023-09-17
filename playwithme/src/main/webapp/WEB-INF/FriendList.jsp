<!-- 
박기원
2023.09.15
친구 리스트 + 친구 추가
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %><!-- core 라이브러리 연결 -->
<%@page import="playwithme.model.*"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend List</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css'><link rel="stylesheet" href="assets/css/ChatList.css">
</head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<body class="center">
  
  <div class="contacts">
    <i class="fas fa-bars fa-2x"></i>

    
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
      <input type="text" id="friend_name_test" placeholder="친구 이름 입력">
      <button id="friendAddButton">친구 추가</button>
  </div>
  

<%
if (friendList != null && !friendList.isEmpty()) {
    for(int i=0; i<friendList.size(); i++){ 
%>
        <div class="contact" onclick="window.location.href='goChat?room=<%=Allfriend.get(i).getFriendchat_room_num()%>'">
            <div class="pic">
                <% 
                String friendId = friendList.get(i);
                ArrayList<MemberDTO> info_friend = dao.getmember(friendId);
                if (!info_friend.isEmpty()) {
                    String profileImage = info_friend.get(0).getM_Profile();
                %>
                <img class="pic" src="file/<%= profileImage %>" onerror="this.src='images/default.jpg'" >
                <% } else { %>
                <img class="pic" src="images/default.jpg">
                <% } %>
            </div>
            <div class="name">
                <%= friendId %>
            </div>
            <div class="message">
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
        $('#friendAddButton').on('click', function() {
            let friend_name_test = $('#friend_name_test').val();
            $.ajax({
                url: 'FriendAddProgram',
                type: 'GET', 
                data: {
                	friend_name_test: friend_name_test
                },
                success: function(response) {

                    console.log('서버 응답:', response);
                    alert('친구 추가 success');
                    window.location.href = 'goFriendList.java';

                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('Request failed: ' + textStatus + ', ' + errorThrown);
                    alert('친구 추가 success');
                }
            });
        });
    });
    </script>
    
    
    
    <script>
    //친구방 만들기
    /*
function createChatRoom(friendId) {
    $.ajax({
        url: 'ChattingListProgram',
        type: 'GET',
        data: {
            roomTitle: friendId // 친구 ID를 방 제목으로 사용하거나, 적절한 방 제목을 설정해주세요.
        },
        success: function(response) {
            console.log('서버 응답:', response);
            alert('채팅방 생성 success');
           window.location = 'goChattingList'; // 채팅 방 목록 페이지로 이동
           // window.location = 'chat.jsp?room=' + friendId; // 채팅 방으로 이동
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Request failed: ' + textStatus + ', ' + errorThrown);
            alert('채팅방 생성 fail');
        }
    });
}
    */
</script>


    

</body>

</html>
