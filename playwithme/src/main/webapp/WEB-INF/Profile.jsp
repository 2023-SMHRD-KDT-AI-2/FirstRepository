
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
		<link rel="stylesheet" href="assets/css/Profilestyle.css">
  </head>
  <body>
  <div id=fix>

		<span id="clock"></span>
		<img src="images/인터넷.png" id="internet">
		<img src="images/LTE.png" id="lte">
		<img src="images/배터리.png" id="battery">
		
		
	</div>
  <%
	String id = (String) session.getAttribute("memberid");
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> info = new ArrayList<>();
	info = dao.getmember(id);
	session.setAttribute("info", info);
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

				<span id ="myid"><%=info.get(0).getMember_Id() %></span>
				<span id ="shap">#</span>
				<span id = "name"><%=info.get(0).getM_Name() %></span>
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

						  <img src="images/${info.get(0).getM_Profile()}" onerror="this.src='images/default.jpg'" class="btn-img img dropdown-toggle rounded-circle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						  
						  

						  	<div class="dropdown-menu show">
						  		<div>
						    		<a class="dropdown-item d-flex align-items-center" href="goChangeImg">
									프로필 사진/닉네임 변경
						    		</a>
						    		<a class="dropdown-item d-flex align-items-center " href="goMyBoard">
									내 게시물 확인
									</a>
						    		<a class="dropdown-item d-flex align-items-center" href="goChangepPw">
						    		비밀번호 변경
						    		</a>
						    		<a class="dropdown-item d-flex align-items-center" href="goFavorite">
						    		관심사 수정
						    		</a>
						    		<a class="dropdown-item d-flex align-items-center" href="goMain">
									홈
						    		</a>
						    		<a class="dropdown-item d-flex align-items-center" href="Logout">
									로그아웃
						    		</a>
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
<script src="assets/js/Profile.js"></script>
  <script >
  // temper 값을 사용하여 그래프 업데이트
  
  let temper = ${info.get(0).getTemper()}; // temper 값에 따라서 설정하세요.
  updateGraph(temper);
  </script>
   
</body>
</html>