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
    System.out.println(friendList.get(0));
    %>
    
    <%for(int i=0; i<friendList.size(); i++){ %>
    <div class="contact">
      <div class="pic">
      <%
      ArrayList<MemberDTO>info_friend=dao.getmember(friendList.get(i));
      %>
         <img class="pic" src="file/<%=info_friend.get(i).getM_Profile()%>" onerror="this.src='images/default.jpg'" >
      </div>
      <div class="name">
        <%=friendList.get(i) %>
      </div>
       <div class="message">
       </div>
    </div>  
    <%} %>

  </div>

</body>

</html>
