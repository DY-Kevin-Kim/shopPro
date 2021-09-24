<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>
<body class="w3-light-grey w3-content" style="max-width:1600px">
  
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <h4><b>마이페이지</b></h4>
  </div>
  <div class="w3-bar-block">
    <a href="#orderlist" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>구매 내역 확인</a> 
    <a href="#" onclick="location.href ='/shopPro/UpdateMeminfo'" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>내 정보 수정</a> 
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">  

  <!-- Header -->
  <header id="portfolio">
    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container">
    <h1 onclick="location.href ='/shopPro/main'"><b>쇼핑몰</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    
      <button class="w3-button w3-white w3-hide-small">마이페이지</button>
      <button class="w3-button w3-white w3-hide-small">장바구니</button>
      <button class="w3-button w3-white w3-hide-small">주문하기</button>
      <button class="w3-button w3-white w3-hide-small">상품리뷰</button>
    </div>
    </div>
  </header>

 <div class="w3-container w3-padding-large" style="margin-bottom:32px">
 <h4><p>${mypageinfo.id}님 반갑습니다!</p></h4>
  <h4 id="orderlist"><b>구매내역 확인</b></h4>
  <!--구매 내역 확인-->
 <table  id="OrderedItemList" style="width:1250px;">
		
		<tr><td colspan="8" style="text-align:center"></td></tr>
		<tr>
				<td style="text-align:center; background-color: #008080; border: solid #444444;" width="5%"  height="50px">번호</td>
				<td style="text-align:center; background-color: #008080; border: solid #444444;" width="30%" height="50px" >주문 상품 정보</td>
				<td style="text-align:center; background-color: #008080; border: solid #444444;" width="8%"  height="50px">상품금액</td>
				<td style="text-align:center; background-color: #008080; border: solid #444444;" width="17%" height="50px">배송지</td>
				<td style="text-align:center; background-color: #008080; border: solid #444444;" width="11%" height="50px">주문일자</td>
				<td style="text-align:center; background-color: #008080; border: solid #444444;" width="11%"  height="50px">현재상태</td>	
				<td style="text-align:center; background-color: #008080; border: solid #444444;" width="11%" height="50px">주문 취소</td>		
				<td style="text-align:center; background-color: #008080; border: solid #444444;" width="11%" height="50px">리뷰 등록</td>	
		</tr>
		
		<c:forEach var="orderlist"  items="${mpvo}" varStatus="status">
			<tr>
				<td style="text-align:center;" width="5%"  height="50px"><c:out value="${orderlist.orderid }"/></td>
				<td style="text-align:center;" width="30%" height="50px"><c:out value="${itemnamelist[status.index]}"/></td>
				<td style="text-align:center;" width="8%"  height="50px"><c:out value="${orderlist.price}"/></td>
				<td style="text-align:center;" width="17%"  height="50px"><c:out value="${mypageinfo.address}"/></td>
				<td style="text-align:center;" width="11%"  height="50px"><c:out value="${orderlist.date}"/></td>
				<td style="text-align:center;" width="11%"  height="50px"><c:out value="${orderlist.curstate}"/></td>
				<td style="text-align:center;" height="50px"><button class="w3-button w3-teal w2-padding w3-hover-red" style="text-align:center">주문 취소</button></td>		
				<td style="text-align:center;" height="50px"><button class="w3-button w3-teal w2-padding w3-hover-red" style="text-align:center">리뷰 등록</button></td>
			</tr>
		</c:forEach>
		
		
	</table>
	</div>
	
  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
  </div>
  
  <div class="w3-container w3-padding-large" style="margin-bottom:32px">
  <h4><b>내 정보 확인</b></h4>
  <!--구매 내역 확인-->
 <table style="width:1250px;">
		
		<tr><td colspan="8" style="text-align:center"></td></tr>
		<tr>
				<td style="text-align:center; background-color: #008080; border: solid #444444;" width="10%"  height="50px">현재 아이디</td>
				<td style="text-align:center; background-color: #008080; border: solid #444444;" width="10%" height="50px" >현재 비밀번호</td>
				<td style="text-align:center; background-color: #008080; border: solid #444444;" width="80%"  height="50px">현재 배송지</td>
		</tr>
		
		
			<tr>
				<td style="text-align:center;" width="5%"  height="50px"><c:out value="${mypageinfo.id}"/></td>
				<td style="text-align:center;" width="30%" height="50px"><c:out value="${mypageinfo.pass}"/></td>
				<td style="text-align:center;" width="8%"  height="50px"><c:out value="${mypageinfo.address}"/></td>
			</tr>
		
		
		
	</table>
	</div>
  
  <div class="w3-black w3-center w3-padding-24">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div>

<!-- End page content -->
</div>

<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>

</body>
</html>
