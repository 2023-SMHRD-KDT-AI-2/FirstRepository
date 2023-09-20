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

<link rel="stylesheet" href="assets/css/MyBoardstyle.css">
<style>
#search{
   width: 17px;
    z-index: 1;
    position: relative;
    bottom: -30px;
    left: 33px;
}
.meeting-passed {
    background-color: #ddd !important;/* Gray background color for passed meetings */
  }
  #metime{
  width: 96px;
    text-align: right;
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
   ArrayList<BoardDTO> myBoard = new ArrayList<>();
   myBoard = brdao.myList(memberId);
   session.setAttribute("myBoard", myBoard);
   %>
   <button class="material-symbols-outlined" id="back"
      style="color: gray;">arrow_back_ios</button>

   <div class="container">
      <div class="row justify-content-center"></div>
      <div class="row">
         <div class="col-md-12">
            <h3 class="h5 mb-4 text-center">${info.get(0).getM_Name()}님의
               게시물</h3>
               <img src="images/검색.png" id="search">
            <input type="text" id="searchInput" placeholder="검색 또는 URL입력" /><span
               id="clearSearch" class="material-symbols-outlined"> close </span><BR>
            <span id=sulmyuong>내용을 보실려면 해당 게시글을 클릭해주세요</span>
            <div id="searchResults">
               <div class="table-wrap" class="table-container">
                  <table class="table myaccordion table-hover" id="accordion">
                     <thead>
                        <tr id="top">
                           <th class="title" >&nbsp;&nbsp;제목</th>
                           <th id="metime">모임시간</th>
                           <th class ="dfix">수정/삭제</th>
                        </tr>
                     </thead>
                     <tbody>

                        <%
                        if (myBoard != null) {
                           for (int i = 0; i < myBoard.size(); i++) {
                              
                        %>
                        <tr data-toggle="collapse" data-target="#collapse<%=i%>"
                           aria-expanded="false" aria-controls="collapse<%=i%>">

                           <td class="title"><%=myBoard.get(i).getTitle()%></td>
                           <td class="meeting-time"><%=myBoard.get(i).getMeet_Time()%></td>
                           <td><button class="first">
                                 <a href="goFixBoard?num=<%=myBoard.get(i).getBoard_Num()%>" onclick="return fixOk();">수정</a>
                              </button>
                              <button class="second">
                                 <a href="BoardDeleteOne?num=<%=myBoard.get(i).getBoard_Num()%>"
                                    onclick="return delOk();">삭제</a>
                              </button></td>
                        </tr>
                        <tr>
                           <td colspan="2" id="collapse<%=i%>" class="collapse acc"
                              data-parent="#accordion" style="text-align: left; !important"
                              width=165px;><%=myBoard.get(i).getB_Content()%></td>
                           <td colspan="2" id="collapse<%=i%>" class="collapse acc"
                              data-parent="#accordion" style="text-align: center;"><%=myBoard.get(i).getNum_People()%>명</td>
                        </tr>
                        <script>
                                 document.getElementById('collapse<%=i%>').classList.remove('show');
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
      </div>
   </div>


   <script src="js/jquery-3.7.1.js"></script>
   <script src="assets/js/MyBoardjquery.min.js"></script>
   <script src="assets/js/MyBoardpopper.js"></script>
   <script src="assets/js/MyBoardbootstrap.min.js"></script>
   <script src="assets/js/MyBoardmain.js"></script>
   <script src="assets/js/clock.js"></script>
   <script >
   $(document).ready(function() {
        var doubleClick = false; // 더블 클릭 여부를 나타내는 변수 추가
        var clickedRow = null; // 클릭된 행을 저장할 변수 추가

        // Function to format a date in the 'YYYY/MM/DD HH:mm' format
        function formatDate(date) {
          var year = date.getFullYear();
          var month = ('0' + (date.getMonth() + 1)).slice(-2);
          var day = ('0' + date.getDate()).slice(-2);
          var hours = ('0' + date.getHours()).slice(-2);
          var minutes = ('0' + date.getMinutes()).slice(-2);
          return year + month + day + hours + minutes;
        }

        // Function to apply the "meeting-passed" class to rows with past meeting times
        function applyRowStyles() {
          var currentTime = new Date();
          var currentFormattedTime = formatDate(currentTime); // 현재 시간을 숫자 형식으로 변환
          console.log("현재 시간(숫자 형식): " + currentFormattedTime);

          // Iterate through all table rows
          $("#accordion tbody tr").each(function(index) {
            var meetingTimeStr = $(this).find(".meeting-time").text();
            console.log("Meeting Time String:", meetingTimeStr); // 디버깅용 메시지
            meetingTimeStr = meetingTimeStr.replace(/\//g, '').replace(/ /g, '').replace(/:/g, ''); // 모임 시간을 숫자 형식으로 변환
            console.log("Meeting Time (숫자 형식): " + meetingTimeStr); // 디버깅용 메시지
            var meetingTime = Number(meetingTimeStr); // parseInt 대신 Number 사용

            // Compare meeting time with current time
            if (meetingTime <= currentFormattedTime) {
              if (doubleClick && clickedRow === this) {
                $(this).removeClass("meeting-passed");
              } else {
                $(this).addClass("meeting-passed");
              }
            }
          });
        }

        // Initial call to applyRowStyles
        applyRowStyles();

        // Call applyRowStyles again when the page is loaded
        $(window).on('load', applyRowStyles);

        // Double-click event handler for rows to toggle color change
        $("#accordion tbody tr").on('dblclick', function() {
          doubleClick = !doubleClick; // 더블 클릭 여부를 토글
          clickedRow = this; // 클릭된 행 저장
          applyRowStyles(); // 스타일을 다시 적용
        });
      });
   
   </script>
</body>
</html>