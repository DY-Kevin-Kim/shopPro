<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <!-- <img src="/w3images/avatar_g2.jpg" style="width:45%;" class="w3-round"> --><br><br>
    <h4><b>Review</b></h4>
    <p class="w3-text-grey"> 상품 이름 </p>
  </div>
  <div class="w3-bar-block">
    <a href="#portfolio" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>PORTFOLIO</a> 
    <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>ABOUT</a> 
    <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right"></i>CONTACT</a>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:330px">

  
	<table  id="board">
		<caption>${boardName }</caption>
		
		<c:if test="${boardcount != 0 }">
			<!--  <tr>
				<td colspan="6" style="text-align: left">리뷰개수:${boardcount}</td>
			</tr>-->
			<tr>
				<th width="10%">번호</th>
				<th width="20%">제목</th>
				<th width="10%">작성자</th>
				<th width="10%">등록일</th>
				<th width="10%">조회수</th>
			</tr>
		</c:if>
		<c:forEach var="board" items="${list}">
			<tr>
				<td width="10%">${boardnum}</td>
				<c:set var="boardnum" value="${boardnum-1 }"/>
				<td width="20%"      id="left">
				<c:if test="${board.reflevel >0 }">
				<!-- 기존 코드 : <img src="<%=request.getContextPath() %>image/level.gif" width="${5*board.reflevel }px">  -->
				<img src="resources/image/level.gif" width="${5*board.reflevel }px">
				<!-- <img src="<%=request.getContextPath() %>/image/re.gif"> -->
				</c:if>
				<a href="info?num=${board.num}">${board.subject }
				</a>
				
				</td>
				<td width="10%">${board.name }</td>
				<td width="10%">${board.regdate }</td>
				</td>
				<td width="10%">${board.readcnt }</td>
			</tr>
		</c:forEach>
		<c:if test="${boardcount == 0 }">
			<tr>
				<td colspan="5">등록된 리뷰가 없습니다.</td>
			</tr>
		</c:if>
		
		<tr>
			<td colspan="6"><c:if test="${startpage<=bottomLine }"><!--[이전1]  --></c:if>
				<c:if test="${startpage > bottomLine }">
					<a href="list?pageNum=${startpage - bottomLine }">[이전]</a>
				</c:if>
				<c:forEach var="a" begin="${startpage }" end="${endpage }">
					<c:if test="${a==pageNum }"><!-- [${a }] --></c:if>
					<c:if test="${a!=pageNum }">
							<a href="list?pageNum=${a }"><!-- [${a }] --></a>
					</c:if>						
				</c:forEach>
					<c:if test="${endpage >= maxpage }"><!--[다음1]  --></c:if>
					<c:if test="${endpage <maxpage }">
						<a href="list?pageNum=${startpage+bottomLine }">[다음]</a>
					</c:if></td>
				</tr>
		<tr>
			<td colspan="6" style="text-align: right"><a href="/shopPro/ReviewWrite">[리뷰쓰기]</a></td>
		</tr>
	</table>
	
	<br><br>
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