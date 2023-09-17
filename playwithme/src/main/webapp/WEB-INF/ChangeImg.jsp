
<%@page import="java.util.ArrayList"%>
<%@page import="javax.print.attribute.HashPrintRequestAttributeSet"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="playwithme.model.*" %>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="stylesheet" href="assets/css/ChangeImg.css" />
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
		<span id ="ci">변경하실려면 사진을 눌러주세요</span>
	<button class="material-symbols-outlined" id ="back" style="color:gray;">
	arrow_back_ios
	</button>

     <form action="ChangeImg" method="post" enctype="multipart/form-data">
        <div id="profileimg">
            <label for="changeImg" id="changeImgLabel"> <!-- Label to trigger file input -->
                <img src="file/${info.get(0).getM_Profile()}" onerror="this.src='images/default.jpg'" id="img">
            </label>
            <input type="file" id="changeImg" name="filename"> <!-- Hidden file input -->
        </div>
        <div>
       
        <input id ="chn" name="changeName" type="text" value ="${info.get(0).getM_Name()}" > <span id ="icon" class="material-symbols-outlined">
		edit
		</span>
        </div>
        <div id="submitButtonContainer">
            <input type="submit" id="submitButton" value="변경하기"> <!-- Submit button -->
        </div>
    </form>
    <script src="js/jquery-3.7.1.js"></script>
    <script src="assets/js/clock.js"></script>
    <script src="assets/js/ChangeImg.js"></script>
</body>
</html>