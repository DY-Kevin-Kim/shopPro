<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/cart.css">
<title>장바구니</title>
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">
	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
		style="z-index: 3; width: 300px;" id="mySidebar">
		<br>
		<div class="w3-container">
			<a href="#" onclick="w3_close()"
				class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
				title="close menu"> <i class="fa fa-remove"></i>
			</a>
			<h2 onclick="location.href ='/shopPro/main'">
				<b>쇼핑몰 사이트</b>
			</h2>
		</div>

		<!--메뉴  -->
		<div class="w3-bar-block">
			<c:if test="${login == null}">
				<h4 class="w3-padding">
					<b>로그인</b>
				</h4>
				<form action="/shopPro/loginProcess" class="w3-padding"
					target="_blank" method="post">
					<div class="w3-section">
						<label>아이디</label> <input class="w3-input w3-border" type="text"
							name="id" required>
					</div>
					<div class="w3-section">
						<label>비밀번호</label> <input class="w3-input w3-border" type="text"
							name="pass" required>
					</div>
					<button type="submit" class="btn btn-success">로그인</button>
				</form>
			</c:if>

			<c:if test="${login != null}">
				<p align="left" style="margin-left: 20px; color: blue">${login.id}님
					환영합니다.</p>
			</c:if>

			<a onclick="location.href ='/shopPro/admin/adminPage'"
				class="w3-bar-item w3-button w3-padding">- <b>관리자 페이지</b></a> <a
				onclick="location.href ='/shopPro/MyPage'"
				class="w3-bar-item w3-button w3-padding" style="margin-bottom: 50px">-
				<b>마이 페이지</b>
			</a>
		</div>


		<!-- category -->
		<div class="w3-bar-block">
			<a href="#food" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding">- 식품</a> <a href="#cloth"
				onclick="w3_close()" class="w3-bar-item w3-button w3-padding">-
				패션의류/잡화</a> <a href="#beauty" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding">- 뷰티</a> <a href="#digital"
				onclick="w3_close()" class="w3-bar-item w3-button w3-padding">-
				가전디지털</a> <a href="#office" onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding">- 문구/오피스</a>
		</div>
	</nav>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px">

		<!-- Header -->
		<jsp:include page="/WEB-INF/views/sideView/header.jsp"></jsp:include>

		<!-- !PAGE CONTENT! -->
		<div class="w3-main">

			<hr class="one">
			<table border="1">
				<tr>
					<td width="100" align="center">상품번호</td>
					<td width="500" align="center">상품명</td>
					<td width="200" align="center">개수</td>
					<td width="200" align="center">상품금액</td>
					<td width="200" align="center"></td>
				</tr>
				
				<c:forEach var="list" items="${cartList}">
					<tr>
						<td width="100" align="center"><c:out value="${list.itemid}" /></td>
						<td width="500" align="center"><img src="${list.itemimg }" />
							<c:out value="${list.itemname}" /></td>
						<td width="100" align="center"><c:out
								value="${list.itemcount}" /></td>
						<td width="150" align="center"><c:out value="${list.price}" /></td>
						<td width="100" align="center">
							<form name="cart" method="get">
								<input type="hidden" name="itemid" value="${list.itemid}">
								<button class="w3-button w3-dark-grey w3-padding-large w3-margin-top w3-margin-bottom" formaction="delete">삭제하기</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>


			<!-- Pagination -->
			<div class="w3-center w3-padding-32">
				<div class="w3-bar">
					<a href="#" class="w3-bar-item w3-button w3-hover-black">«</a> <a
						href="#" class="w3-bar-item w3-black w3-button">1</a> <a href="#"
						class="w3-bar-item w3-button w3-hover-black">2</a> <a href="#"
						class="w3-bar-item w3-button w3-hover-black">3</a> <a href="#"
						class="w3-bar-item w3-button w3-hover-black">4</a> <a href="#"
						class="w3-bar-item w3-button w3-hover-black">»</a>
				</div>
			</div>

			<div style="text-align: center">
				<p>
				<form name="order" method="get">
					<button
						class="w3-button w3-dark-grey w3-padding-large w3-margin-top w3-margin-bottom" formaction="inputOrder">
						<i class="w3-margin-center"></i>구매하기
					</button>
				</form>
				</p>
			</div>

			<!-- footer -->
			<jsp:include page="/WEB-INF/views/sideView/footer.jsp"></jsp:include>

		</div>
		<div class="w3-black w3-center w3-padding-24">
			6조 <a href="https://www.w3schools.com/w3css/default.asp"
				title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a>
		</div>
	</div>
</body>
</html>