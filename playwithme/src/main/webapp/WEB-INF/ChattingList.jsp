<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %><!-- core 라이브러리 연결 -->
<%@page import="playwithme.model.*"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodePen - Daily UI #013 | Direct Messaging</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css'><link rel="stylesheet" href="assets/css/ChatList.css">
</head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<body class="center">
  
  <div class="contacts">
    <i class="fas fa-bars fa-2x"></i>

    
    <h2>Contacts</h2>
    <%
    String id = (String) session.getAttribute("memberid");
    MemberDAO dao = new MemberDAO();
    ArrayList<MemberDTO> info = new ArrayList<>();
    info = dao.getmember(id);
    session.setAttribute("info", info);
    String memberId = info.get(0).getMember_Id();
    ChattingListDAO Chatdao = new ChattingListDAO();
    ArrayList<ChattingListDTO> chatList = new ArrayList<>();
    
    chatList = Chatdao.chatlist(memberId);
    %>
    
    <div>
      <input type="text" id="roomTitle" placeholder="채팅방 제목을 입력하세요">
      <button id="createRoomButton">채팅방 생성</button>
  </div>
    <%for(int i=0; i<chatList.size(); i++){ %>
    <div class="contact" onclick="location.href='<%= "goChat?room=" + chatList.get(i).getChatting_Room_num()%>'">
      <div class="pic">
      <%
      ArrayList<MemberDTO> info_master = new ArrayList<>();
      info_master=dao.getmember(chatList.get(i).getMember_Id());
      %>
         <img class="pic" src="file/<%=info_master.get(0).getM_Profile()%>" onerror="this.src='images/default.jpg'" >
      </div>
      <div class="badge">
        <!-- 안 읽은 채팅수  -->
      </div>
      <div class="name">
        <!-- 채팅방 이름을 클릭하면 해당 채팅방으로 이동 -->
        <%=chatList.get(i).getChatting_Room_title() %>
      </div>
      <div class="message">
       <%String lastchat=Chatdao.lastCaht(Integer.parseInt(chatList.get(i).getChatting_Room_num()));     
       if(lastchat!=null){%>
        <%=lastchat %>
        <%}else{%>
        대화가 없습니다
        <%} %>
       </div>
    </div>  
    <%} %>

  </div>

  <script>
    $(document).ready(function() {
        $('#createRoomButton').on('click', function() {
            var roomTitle = $('#roomTitle').val();
            $.ajax({
                url: 'ChattingListProgram',
                type: 'GET', 
                data: {
                    roomTitle: roomTitle
                },
                success: function(response) {

                    console.log('서버 응답:', response);
                    alert('채팅방 success');
                    window.location = 'goChattingList'; 
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('Request failed: ' + textStatus + ', ' + errorThrown);
                    alert('채팅방 fail');
                }
            });
        });
    });
    </script>
</body>

</html>

