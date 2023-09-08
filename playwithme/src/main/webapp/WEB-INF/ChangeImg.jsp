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
    <style>
        body{
            background-color: rgb( 160, 225, 243);
        }
        #profileimg{
            display: flex;
            align-items: center;
            justify-content: center; 
        }
        #img{
            flex: none;
            width: 60%;
            height: 60%;
            border-radius: 50%;
            margin-top: 20%;
        }
        #changeImg{
            width: 200px;
            height: 50px;
        }
    </style>
</head>
<body>   
        <div id="profileimg">
        
            <img src="file/${info.get(0).getM_Profile() }" alt="" id ="img">    
        </div>
    <form action="ChangeImg" method="post" enctype ="multipart/form-data">
   
        <input type="file" name = "filename">이미지 선택
		<input type="submit" value ="확인">    
    
    </form>
</body>
</html>