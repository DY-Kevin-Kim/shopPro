<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
label span{
	display:inline-block;
	margin-left:10px;
	margin-right:10px;
}
</style>

<title>Insert title here</title>
<script>
</script>
</head>
<body class="w3-light-grey w3-content" style="max-width:1600px">

<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <!-- <img src="/w3images/avatar_g2.jpg" style="width:45%;" class="w3-round"> --><br><br>
    <h4><b>Review</b></h4>
    <p class="w3-text-grey">${ItemInfo.itemname}</p>
  </div>
  <div class="w3-bar-block">
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>


<div class="w3-main" style="margin-left:330px">
<form action="/shopPro/reviewWritepro" method="post">
	<div class="w3-content" align=center>
		<input type="hidden" name="itemid" value="${ItemInfo.itemid}">
		<input type="hidden" name="memid" value="${login.id}">
		<input type="hidden" name="orderid" value="${ItemInfo.itemid}">
		<table>
			<caption>리뷰작성</caption>
			<tr><td>제목</td><td><input type="text" name="subject" style="width:100%"></td></tr>
			<tr>
				<td>별점</td>
				<td ><input type="radio"  value="${1}" name="rate" checked> <label><span>1점</span></label>
					<input type="radio"  value="${1.5}"  name="rate" >    <label><span>1.5점</span></label>
					<input type="radio"  value="${2}"  name="rate" >    <label><span>2점</span></label>
					<input type="radio"  value="${2.5}"  name="rate" >    <label><span>2.5점</span></label>
					<input type="radio"  value="${3}" name="rate">     <label><span>3점</span></label>
					<input type="radio"  value="${3.5}"  name="rate" >    <label><span>3.5점</span></label>
					<input type="radio"  value="${4}"  name="rate" > <label><span>4점</span></label>
					<input type="radio"  value="${4.5}"  name="rate" >    <label><span>4.5점</span></label>
					<input type="radio"  value="${5}"  name="rate" ><label><span>5점</span></label>
			</tr>
			<tr><td>내용</td><td><textarea rows="10" name="content" style="width:100%"></textarea></tr>
			<tr><td>첨부파일1</td><td><input type="file" name="reviewimg1"></td></tr>
			<tr><td>첨부파일2</td><td><input type="file" name="reviewimg2"></td></tr>
			<tr><td>첨부파일3</td><td><input type="file" name="reviewimg3"></td></tr>
		</table>
		<dl>
			<dd><input type="submit" name="submit" value="[리뷰 등록]"></dd>
		</dl>
	</div>
	<br><br><br>
	
	</form>
	</div>
</body>
</html>