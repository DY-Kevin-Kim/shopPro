<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	function review_submit(){
		var f = document.f;
		if(f.subject.value==""){
			alert("제목을 입력하세요")
			f.subject.focus();
			return;
		}
		if(f.content.value==""){
			alert("내용을 입력하세요")
			f.content.focus();
			return;
		}
		f.submit();
	}

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
    <p class="w3-text-grey"> 상품 이름 </p>
  </div>
  <div class="w3-bar-block">
    <a href="#portfolio" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>메뉴1</a> 
    <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>메뉴2</a> 
    <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right"></i>메뉴3</a>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>


<div class="w3-main" style="margin-left:330px">
<form action="#" method="post"
	enctype="multipart/form-data" name="f">
	<div class="w3-content">
		<table>
			<caption>리뷰작성</caption>
			<tr><td>제목</td><td><input type="text" name="subject" style="width:100%"></td></tr>
			<tr>
				<td>별점</td>
				<td ><input type="radio"  value="1" name="rate" checked> <label><span>1점</span></label>
					<input type="radio"  value="2"  name="rate" >    <label><span>2점</span></label>
					<input type="radio"  value="3" name="rate">     <label><span>3점</span></label>
					<input type="radio"  value="4"  name="rate" > <label><span>4점</span></label>
					<input type="radio"  value="5"  name="rate" ><label><span>5점</span></label>
			</tr>
			<tr><td>내용</td><td><textarea rows="10" name="content" style="width:100%"></textarea></tr>
			<tr><td>첨부파일</td><td><input type="file" name="file1"></td></tr>
			
		</table>
		<table><tr><td style="text-align:center">
				<a href="javascript:review_submit()" style="margin-left:180px">[리뷰등록]</a></td></tr></table>
		
	</div>
	<br><br><br>
	
	</form>
	</div>
</body>
</html>