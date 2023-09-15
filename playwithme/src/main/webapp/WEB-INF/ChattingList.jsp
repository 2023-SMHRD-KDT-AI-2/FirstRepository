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
<meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>CodePen - Daily UI #013 | Direct Messaging</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css'><link rel="stylesheet" href="assets/css/ChatList.css">
<style>
   #search{
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
   #fix{
       position: relative;
       top: -2px;
       left: 0;
       height: 20px;
       
   }
   #internet{
      height: 19px;
      margin-left: 187px;
      margin-bottom: 2px;
   }
   #lte{
      height: 11px;
      margin-bottom: 5px;
   }
   #battery{
      height: 21px;
   }
   h3{
      padding-left: 7px;
       padding-top: 7px
   }
   #searchButton{
      height: 26px;
       margin-left: 16px;
       position: relative;
       top: 5px;
   }
   #submitButton{
      height: 26px;
       margin-left: 13px;
       position: relative;
        top: 5px;
   }


</style>


</head>
<body class="center">

  <div class="contacts">

<div id=fix>

      <span id="clock"></span>
      <img src="images/인터넷.png" id="internet">
      <img src="images/LTE.png" id="lte">
      <img src="images/배터리.png" id="battery">
      

   </div>
    
    <h3>채팅</h3>
    
    
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
    
    //
    
    %>
    <form action="ChattingListProgram" method="post" id="myForm">
    <input type="text" name="roomTitle" id="search">
    
    
    <img id="searchButton" src="images/검색.png" alt="채팅방 검색"/>
    <img id="submitButton" src="images/채팅방생성.png" alt="채팅방 생성"/>
    
    
   </form>
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
  <script src="assets/js/clock.js"></script>
  <script>
   
</script>
 
</body>

</html>
