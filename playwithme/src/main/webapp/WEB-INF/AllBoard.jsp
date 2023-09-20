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
   ArrayList<BoardDTO> AllBoard = new ArrayList<>();
   AllBoard = brdao.list();
   session.setAttribute("myBoard", AllBoard);
   %>
   <button class="material-symbols-outlined" id="back"
      style="color: gray;">arrow_back_ios</button>

   <div class="container">
      <div class="row justify-content-center"></div>
      <div class="row">
         <div class="col-md-12">
            <h3 class="h5 mb-4 text-center">전체 모임</h3>
            <img alt="" id="search" src="images/검색.png">
            <input type="text" id="searchInput" placeholder="검색어를 입력하세요" /><span
               id="clearSearch" class="material-symbols-outlined">close</span><Br>
            <span id=sulmyuong>내용을 보실려면 해당 게시글을 클릭해주세요</span>
            <div id="searchResults">
               <div class="table-wrap" class="table-container">
                  <table class="table myaccordion table-hover" id="accordion">
                     <thead>
                        <tr id="top">
                           <th class="title" >&nbsp;&nbsp;제목</th>
                           <th id="metime">모임시간</th>
                           <th class ="dfix">채팅/참여</th>
                        </tr>
                     </thead>
                     <tbody>

                        <%
                        if (AllBoard != null) {
                           for (int i = 0; i < AllBoard.size(); i++) {
                              String timestampString = AllBoard.get(i).getMeet_Time();

                              // Timestamp 형식으로 변환

                              // 원하는 형식으로 포맷팅
                        %>
                        <tr data-toggle="collapse" data-target="#collapse<%=i%>"
                           aria-expanded="false" aria-controls="collapse<%=i%>">

                           <td class="title"><%=AllBoard.get(i).getTitle()%></td>
                           <td class="meeting-time"><%=AllBoard.get(i).getMeet_Time()%></td>
                           <td><button class="first">
                                 <a href="goChat?room=<%=AllBoard.get(i).getChat_room_num()%>">채팅</a>
                                 <!-- 채팅 참여 버튼 -->
                              </button> <%
                                  int partiNum = AllBoard.get(i).getParti_num();
                                 int numPeople = AllBoard.get(i).getNum_People();

                                  // 조건에 따라 버튼을 표시하거나 숨깁니다.
                                  if (partiNum < numPeople) {
                                  %>
                              <button class="second">
                                 <a
                                    href="BoardPartiUp?num=<%=AllBoard.get(i).getBoard_Num()%>">참가</a>
                              </button> <%
                               }
                               %></td>
                        </tr>
                        <tr>
                           <td colspan="2" id="collapse<%=i%>" class="collapse acc"
                              data-parent="#accordion" style="text-align: left; !important"
                              width=200px;><%=AllBoard.get(i).getB_Content()%></td>
                           <td colspan="2" id="collapse<%=i%>" class="collapse acc" data-parent="#accordion"style="text-align: center;"><%=AllBoard.get(i).getParti_num() %>/<%=AllBoard.get(i).getNum_People() %>명</td>
                        
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
   <script>
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
   
      $('#back').click(function() {
         location.href = 'goMain';
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
      
      
   </script>
</body>
</html>