<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 커스터마이징 css, js -->
	<link rel="stylesheet" href="resources/css/home.css">
	<link rel="stylesheet" href="resources/css/detailPage.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Home</title>
</head>

<body class="w3-light-grey w3-content" style="max-width:1600px">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <h2 onclick="location.href ='/shopPro/main'"><b>쇼핑몰 사이트</b></h2>
  </div>
  
 
    <!--메뉴  -->
  <div class="w3-bar-block"> 
    <c:if test="${login == null}">
    	<h4 class="w3-padding"><b>로그인</b></h4>
	    <form action="/shopPro/loginProcess" class="w3-padding" target="_blank" method="post">
	    	<div class="w3-section">
	    		<label>아이디</label>
	    		<input class="w3-input w3-border" type="text" name="id" required>
	    	</div>
	    	<div class="w3-section">
	    		<label>비밀번호</label>
	    		<input class="w3-input w3-border" type="text" name="pass" required>
	    	</div>
	    	<button type="submit" class="btn btn-success">로그인</button>
	    </form>
    </c:if>
    
    <c:if test="${login != null}">
    	<p align="left" style="margin-left:20px; color:blue">${login.id}님 환영합니다.</p>
    </c:if>
    
    <a onclick="location.href ='/shopPro/admin/adminPage'" class="w3-bar-item w3-button w3-padding">- <b>관리자 페이지</b></a>
    <a onclick="location.href ='/shopPro/mypage'" class="w3-bar-item w3-button w3-padding" style="margin-bottom:50px">- <b>마이 페이지</b></a> 
    <a onclick="location.href ='/shopPro/reviewWrite?itemid=${ItemInfo.itemid}'" class="w3-bar-item w3-button w3-padding" style="margin-bottom:50px">- <b>리뷰 쓰기</b></a> 
  </div>

  </div>  
  
  <!-- category -->
  <div class="w3-bar-block">   
    <a href="#food" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">- 식품</a> 
    <a href="#cloth" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">- 패션의류/잡화</a> 
	<a href="#beauty" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">- 뷰티</a> 
	<a href="#digital" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">- 가전디지털</a> 
	<a href="#office" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">- 문구/오피스</a> 
  </div>
</nav> 

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">
  
  <!-- Header -->
  <jsp:include page="/WEB-INF/views/sideView/header.jsp"></jsp:include>
  
  
  <!-- First Grid-->
  <div class="w3-row-padding w3-padding-16">
    <!-- 상품 전체 이미지 출력 부분 -->
    <div class="w3-col m6">
    	<img src="${ItemInfo.itemimg}" alt="not found img" style="width:100%">
    </div>
    
    <!-- 이미지 오른쪽 컨텐츠 부분 -->
    <div class="w3-col m6">
    	<!-- 제목, 가격 헤더 -->
    	<div class="w3-container w3-flat-emerald w3-gray">
    		<h1> ${ItemInfo.itemname} </h1>
    		<hr style="width:100%; text-align:left; margin-left:0">
    		<h3> ${ItemInfo.price} 원</h3>
    	</div>
    	
    	<!-- 간략 이미지 설명 및 버튼 -->
    	<div class="w3-container w3-flat-emerald w3-white">
    		<h4>현재 재고 수량 : ${ItemInfo.stored} </h4>
    		<h4>상품 번호 : ${ItemInfo.itemid} </h4>
    		<br>
    		<div class="w3-row w3-margin">
    		<form id="buy" method="POST">
    		<div class="w3-col" style="width:100px">
    				<input class="w3-input w3-border" style="width:100%" type="text" name="itemcount" placeholder="수량">
    				<input type="hidden" name="itemid" value="${ItemInfo.itemid}">
    			</div>
    			
    			<div class="w3-rest" align="right">
    				<button class="w3-button w3-black w3-round-large" style="width:150px" formaction="cart">장바구니</button>
    				<button class="w3-button w3-black w3-round-large" style="width:150px" formaction="pay">바로구매</button>
    			</div>
    		</form>
    		</div>
    	</div>
    </div>
  </div>
  
  <!-- Second Grid-->
  <script type="text/javascript" src="<c:url value="/resources/js/detailPage.js"/>"></script>
	  
  <div class="w3-row-padding w3-padding-16">
  		<!-- 헤더 -->
	   <div class="header w3-padding-32">
		  <h2>More information</h2>
		  <div class="progress-container">
		    <div class="progress-bar" id="myBar"></div>
		    </div>  
  	   </div>

		<!-- 내용 -->
	  <div class="content">
	  	<c:if test="${ItemDetail.content != null}">
	    	<p>${ItemDetail.content}</p>
	    </c:if>
	    
	    <c:if test="${ItemDetail.itemimage1 != null}">
	    	<img src="${ItemDetail.itemimage1}" style="width:100%">
	    </c:if>
	    
	    <c:if test="${ItemDetail.itemimage2 != null}">
	    	<img src="${ItemDetail.itemimage2}" style="width:100%">
	    </c:if>
	    
	    <c:if test="${ItemDetail.itemimage3 != null}">
	    	<img src="${ItemDetail.itemimage3}" style="width:100%">
	    </c:if>
	  </div>
	  
  </div>
  
  <hr style="height:3px;border-width:0;color:white;background-color:white"><br>
  
  <!-- Third Grid -->
  <div class="w3-row-padding w3-padding-16 w3-cursive w3-round-xlarge" align="center">
  	<div class="w3-container w3-light-gray">
  		<h2 class="w3-wide">상품평</h2>
  	</div>
  </div>
  
  <!-- Forth Grid -->
  <c:forEach var="ItemReviewList" items="${ItemReviewList}">
	  <div class="w3-row-padding w3-padding-16">
	  	<!-- 카드 전체 -->
	  	<div class="w3-card-4 w3-round-xlarge">
	  		<!-- 카드 헤더 -->
	  		<header class="w3-container w3-dark-gray">
	  			<h3>제목 : ${ItemReviewList.subject} </h3>
	  			<h4>작성자 : ${ItemReviewList.memid}</h4>
	  			<h5>평점 : ${ItemReviewList.rate}</h5>
	  			<hr style="height:2px;border-width:0;color:black;background-color:gray">
	  			<h5>상품 : ${ItemInfo.itemname}</h5>
	  		</header>
	  		
	  		<!-- 카드 내용 -->
	  		<div class="w3-container w3-margin">
	  			<div class="w3-col m6">
	  				<div class="w3-content w3-display-container">
	  					<c:if test="${ItemReviewList.reviewimg1 != null}">
		  					<div class="w3-display-container mySlides">
		  						<img src="${ItemReviewList.reviewimg1}" style="width:100%; height:300px">
		  					</div>
	  					</c:if>
	  					
	  					<c:if test="${ItemReviewList.reviewimg1 != null}">
		  					<div class="w3-display-container mySlides">
		  						<img src="${ItemReviewList.reviewimg2}" style="width:100%; height:300px">
		  					</div>
	  					</c:if>
	  					
	  					<c:if test="${ItemReviewList.reviewimg1 != null}">
		  					<div class="w3-display-container mySlides">
		  						<img src="${ItemReviewList.reviewimg3}" style="width:100%; height:300px">
		  					</div>
	  					</c:if>
	  					<button class="w3-button w3-display-left w3-black" onclick="plusDivs(-1)">&#10094;</button>
	  					<button class="w3-button w3-display-right w3-black" onclick="plusDivs(1)">&#10095;</button>
	  				</div>
	  				
	  				<script type="text/javascript" src="<c:url value="/resources/js/detailPage2.js"/>"></script>
	  			</div>
	  		</div>
	  		
	  		<!-- 카드 footer -->
	  		<footer class="w3-container w3-dark-gray">
	  			<h5>리뷰 : ${ItemReviewList.content}</h5>
	  		</footer>
	  	</div>
	  </div>
  </c:forEach>
  
  
	
  <!-- footer -->
  <jsp:include page="/WEB-INF/views/sideView/footer.jsp"></jsp:include>
  
</div>
<div class="w3-black w3-center w3-padding-24">6조 <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div>

</body>

</html>