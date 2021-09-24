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
    <a href="#mypageUpdate" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>내 정보 수정</a> 
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

   <!-- Contact Section -->
  <div class="w3-container w3-padding-large w3-grey">
    <h4><b>내 정보 수정</b></h4>
    <form action="/shopPro/Changefinish" target="_blank">
      <div class="w3-section">
        <label><b>인증하기</b></label>
        <input class="w3-input w3-border" type="text" name="updatePS" placeholder="비밀번호를 입력하세요" required>
      </div>
      <div class="w3-section">
        <a onclick="location.href ='/shopPro/UpdateMeminfo'" style="text-align:center">비밀번호가 기억이 나지 않으세요?</a>
      </div>
      <button type="submit" class="w3-button w3-black w3-margin-bottom">인증하기</button>
    </form>
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
