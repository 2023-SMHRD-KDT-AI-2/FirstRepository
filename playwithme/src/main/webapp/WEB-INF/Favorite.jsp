<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관심사 수정</title>
<style>
</style>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/Favorite.css" />
</head>
<body>
	<div id=fix>

		<span id="clock"></span> <img src="images/인터넷.png" id="internet">
		<img src="images/LTE.png" id="lte"> <img src="images/배터리.png"
			id="battery">

	</div>

	<button class="material-symbols-outlined" id="back"
		style="color: gray;">arrow_back_ios</button>

	<div id="fav3">관심사를 3개이상 선택해주세요 :)</div>

	<form action="SetFavProgram" id='form'>
		<table>
			<tr>
				<td><label for="chk"> <i
						class="fa fa-cutlery fa-3x traval1" aria-hidden="true">🛫</i>
				</label><br> <input type="checkbox" id="chk" class="traval check"
					name="favorite" value="🛫"> <br>여행</td>

				<td><label for="chk1"> <i
						class="fa fa-cutlery fa-3x sports1" aria-hidden="true">🚴‍♀️</i>
				</label><br> <input type="checkbox" id="chk1" class="sports check"
					name="favorite" value="🚴‍♀️"><br>운동</td>
				<td><label for="chk2"> <i
						class="fa fa-cutlery fa-3x book1" aria-hidden="true">📚</i>
				</label><br> <input type="checkbox" id="chk2" class="book check"
					name="favorite" value="📚"><br>인문학/책</td>
			</tr>
			<tr>
				<td><label for="chk3"> <i
						class="fa fa-cutlery fa-3x culture1" aria-hidden="true">🎊</i>
				</label><br> <input type="checkbox" id="chk3" class="culture check"
					name="favorite" value="🎊"><br>공연/축제</td>
				<td><label for="chk4"> <i
						class="fa fa-cutlery fa-3x music1 " aria-hidden="true">🎧</i>
				</label><br> <input type="checkbox" id="chk4" class="music check"
					name="favorite" value="🎧"><br>음악/악기</td>
				<td class='onlyCSS'><label for="chk5"> <i
						class="fa fa-cutlery fa-3x make1" aria-hidden="true">🛠</i>
				</label><br> <input type="checkbox" id="chk5" class="make check"
					name="favorite" value="🛠"><br>공예/만들기</td>
			</tr>
			<tr>
				<td><label for="chk6"> <i
						class="fa fa-cutlery fa-3x cook1" aria-hidden="true">🍽</i>
				</label><br> <input type="checkbox" id="chk6" class="cook check"
					name="favorite" value="🍽"><br>요리</td>
				<td><label for="chk7"> <i
						class="fa fa-cutlery fa-3x picture1" aria-hidden="true">📷</i>
				</label><br> <input type="checkbox" id="chk7" class="picture check"
					name="favorite" value="📷"><br>사진/영상</td>
				<td class='onlyCSS'><label for="chk8"> <i
						class="fa fa-cutlery  fa-3x car1" aria-hidden="true">🚗</i>
				</label><br> <input type="checkbox" id="chk8" class="car check"
					name="favorite" value="🚗"><br>차/오토바이</td>
			</tr>
			<tr>
				<td><label for="chk9"> <i
						class="fa fa-cutlery fa-3x pet1" aria-hidden="true">🐈</i>
				</label><br> <input type="checkbox" id="chk9" class="pet check"
					name="favorite" value="🐈"><br>반려동물</td>
				<td><label for="chk10"> <i
						class="fa fa-cutlery fa-3x look1" aria-hidden="true">⚾</i>
				</label><br> <input type="checkbox" id="chk10" class="look check"
					name="favorite" value="⚾"><br>야구</td>
				<td><label for="chk11"> <i
						class="fa fa-cutlery fa-3x people1" aria-hidden="true">👨‍👩‍👦‍👦</i>
				</label><br> <input type="checkbox" id="chk11" class="people check"
					name="favorite" value="‍👩"><br>사교/인맥</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td><input type="submit" id='button' value='수정'></td>
			</tr>
		</table>

	</form>
	<script src="js/jquery-3.7.1.js"></script>
	<script src="assets/js/Favorite.js"></script>
</body>
</html>