
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page isELIgnored="false"%>
<%@page import="playwithme.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
     <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">
      <link rel="stylesheet" href="assets/css/style.css">
      <link rel="stylesheet" href="assets/css/Profilestyle2.css">
       <style>
        
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
   
   BoardDTO board=(BoardDTO)request.getAttribute("board"); 
   BoardDAO dao2 = new BoardDAO();
   String id = board.getMember_Id();
   FavoriteDAO fdao = new FavoriteDAO();
   FavoriteDTO fdto = new FavoriteDTO();
   fdto.setMember_id(id);
   FavoriteDTO inc =fdao.incheck(fdto);
   %>
      <button class="material-symbols-outlined" id ="back" style="color:gray;">
arrow_back_ios
</button>
      
      <section class="ftco-section">
      <div class="container">
            <span id ="myid"><%=board.getMember_Id()%></span>
				<span id ="shap">#</span>
				<span id = "name"><%=board.getM_Name()%></span>
				<span id = "favorite">
            <%if(inc!=null){ 
               int fav = fdao.findnum(id);
               ArrayList<FavoriteDTO> favList = fdao.findfav(fav);
            %>
            <%for(int i = 0; i<favList.size(); i++){%>
            <%=favList.get(i).getInterest() %>&nbsp;
            
            <%}} %>
            
            
            </span>
         </div>
            <div class="row justify-content-center">

               <div class="col-md-6 d-flex justify-content-center">
                  <div class="btn-group show">

                    <img src="images/<%=board.getM_Profile()%>" onerror="this.src='images/default.jpg'" class="btn-img img dropdown-toggle rounded-circle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    
                    

                       <div class="dropdown-menu show">
                          <div class="custom-box">
                          <h4>게시글</h4>
                          <p><strong>제목 :</strong> <span id="displayTitle3"><%=board.getTitle()%></span></p>
                          <p><strong>인원수 :</strong> <span id="displayNumPeople3"><%=board.getNum_People()%></span></p>
                          <p><strong>모임시간 :</strong> <span id="displayMeetTime3"><%=board.getMeet_Time()%></span></p>
                          <p><strong>모임장소 :</strong> <span id="displayPlace3"><%=board.getPlace()%></span></p>
                          <div class="data-box">
                             <!--    <p><strong>내용 :</strong></p> -->
                                <p> <span id="displayBContent3"><%=board.getB_Content()%></span></p>
                          
                          </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
      </section>
      
      
      
        <div class="graph-container">
        <!-- Graph bar that will animate -->
        <div class="graph-bar" style="width: 0%;"></div>
        <!-- Label for the graph -->
        <span class="graph-label"></span>
        <!-- Arrow icon -->
        <span class="arrow">▼</span>
    </div>


<script src="js/jquery-3.7.1.js"></script>
<script src="assets/js/clock.js"></script>
<script src="assets/js/Profile2.js"></script>
   <script>
        // JavaScript로 그래프를 업데이트하는 함수
        // temper 값을 사용하여 그래프 업데이트
        const temper = ${board.getTemper()} // temper 값에 따라서 설정하세요.
        updateGraph(temper);
        
      
   
   

    </script>
   
</body>
</html>