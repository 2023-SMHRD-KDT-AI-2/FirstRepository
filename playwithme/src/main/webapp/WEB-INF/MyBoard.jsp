<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
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
  	<title>Table 08</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="assets/css/MyBoardstyle.css">

	</head>
	<body>
	<%
	String memberId = (String) session.getAttribute("memberid");
	BoardDAO dao = new BoardDAO();
	ArrayList<BoardDTO> myBoard = new ArrayList<>();
	myBoard = dao.myList(memberId);
	session.setAttribute("myBoard", myBoard);
	%>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-4">
					<h2 class="heading-section">내 게시글</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h3 class="h5 mb-4 text-center"><%=myBoard.get(0).getMember_Id() %>님의 게시물</h3>
					<div class="table-wrap">
						<table class="table myaccordion table-hover" id="accordion">
						  <thead>
						    <tr>
						      <th>#</th>
						      <th>작성자명</th>
						      <th>제목</th>
						      <th>작성시간</th>
						      <th>내용 더보기/숨기기</th>
						    </tr>
						  </thead>
						  <tbody>
						<%for(int i = 0 ; i<myBoard.size() ; i++) {%>
						    <tr data-toggle="collapse" data-target="#collapse<%=i%>" aria-expanded="false" aria-controls="collapse<%=i%>" >
						      <th scope="row"><%=i +1 %></th>
						      
						      <td><%=myBoard.get(i).getMember_Id() %></td>
						      <td><%=myBoard.get(i).getTitle() %></td>
						      <td><%=myBoard.get(i).getB_Date() %></td>
						      <td>
						      	<i class="fa" aria-hidden="true"></i>
				        	</td>
						    </tr>
						    <tr>
						    	<td colspan="5" id="collapse<%=i%>" class="collapse acc" data-parent="#accordion">
						    		<p><%=myBoard.get(i).getB_Content() %></p>
						    	</td>
						    </tr>
						    <script>
           						 document.getElementById('collapse<%=i%>'). classList.remove('show');
       						 </script>
							<%} %>
						    
						  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

 <script src="assets/js/MyBoardjquery.min.js"></script>
  <script src="assets/js/MyBoardpopper.js"></script>
  <script src="assets/js/MyBoardbootstrap.min.js"></script>
  <script src="assets/js/MyBoardmain.js"></script>
	</body>
</html>