<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 커스터마이징 css, js -->
	<link rel="stylesheet" href="WebContent/css/home.css">
	<link rel="stylesheet" href="WebContent/css/detailPage.css">
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
    <img src="/w3images/avatar_g2.jpg" style="width:45%;" class="w3-round"><br><br>
    <h4><b>로그인</b></h4>
    <form action="#" target="_blank">
    	<div class="w3-section">
    		<label>아이디</label>
    		<input class="w3-input w3-border" type="text" name="Name" required>
    	</div>
    	<div class="w3-section">
    		<label>비밀번호</label>
    		<input class="w3-input w3-border" type="text" name="Passwd" required>
    	</div>
    </form>
  </div>
  
  <div class="w3-bar-block">
    <a href="#portfolio" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal">
    	<i class="fa fa-th-large fa-fw w3-margin-right"></i>PORTFOLIO</a> 
    <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
    	<i class="fa fa-user fa-fw w3-margin-right"></i>ABOUT</a> 
    <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
    	<i class="fa fa-envelope fa-fw w3-margin-right"></i>CONTACT</a>
  </div>
  
  <div class="w3-panel w3-large">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">
  
  <!-- Header -->
  <jsp:include page="/view/sideView/header.jsp"></jsp:include>
  
  
  <!-- First Grid-->
  <div class="w3-row-padding w3-padding-16">
    <!-- 상품 전체 이미지 출력 부분 -->
    <div class="w3-col m6">
    	<img src="WebContent/img/MSI.jpg" alt="labtop" style="width:100%">
    </div>
    
    <!-- 이미지 오른쪽 컨텐츠 부분 -->
    <div class="w3-col m6">
    	<!-- 제목, 가격 헤더 -->
    	<div class="w3-container w3-flat-emerald w3-gray">
    		<h1>MSI GL65 Leopard 10SFK-062</h1>
    		<hr style="width:100%; text-align:left; margin-left:0">
    		<h3>1,825,200 원</h3>
    	</div>
    	
    	<!-- 간략 이미지 설명 및 버튼 -->
    	<div class="w3-container w3-flat-emerald w3-white">
    		<h4>노트북 성능 : 상세내용 참조</h4>
    		<h4><i class="fa fa-close"> 적립 불가 상품</i></h4>
    		<h4>상품 번호 : 20210909</h4>
    		<br>
    		<div class="w3-row w3-margin">
    			<div class="w3-col" style="width:100px">
    				<input class="w3-input w3-border" style="width:100%" type="text" placeholder="수량">
    			</div>
    			
    			<div class="w3-rest" align="right">
    				<button class="w3-button w3-black w3-round-large" style="width:150px">장바구니</button>
    				<button class="w3-button w3-black w3-round-large" style="width:150px">바로구매</button>
    			</div>
    		</div>
    	</div>
    </div>
  </div>
  
  <!-- Second Grid-->
  <script type="text/javascript" src="<c:url value="/WebContent/js/detailPage.js"/>"></script>
	  
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
	    <h3>Scroll Down to See The Effect</h3>
	    <p>We have created a "progress bar" to <b>show how far a page has been scrolled</b>.</p>
	    <p>It also <b>works when you scroll back up</b>.</p>
	    <p>It is even <b>responsive</b>! Resize the browser window to see the effect.</p>
	    <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
	    <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
	    <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
	    <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
	    <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
	    <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
	    <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
	    <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
	    <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
	    <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
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
  <div class="w3-row-padding w3-padding-16">
  	<!-- 카드 전체 -->
  	<div class="w3-card-4 w3-round-xlarge">
  		<!-- 카드 헤더 -->
  		<header class="w3-container w3-dark-gray">
  			<h4>지윤이 바보 아니다.</h4>
  			<h5>2021-09-09</h5>
  			<hr style="height:2px;border-width:0;color:black;background-color:gray">
  			<h5>MSI GL65 Leopard 10SFK-062</h5>
  		</header>
  		
  		<!-- 카드 내용 -->
  		<div class="w3-container w3-margin">
  			<div class="w3-col m6">
  				<div class="w3-content w3-display-container">
  					<div class="w3-display-container mySlides">
  						<img src="WebContent/img/1.jpg" style="width:100%; height:300px">
  					</div>
  					
  					<div class="w3-display-container mySlides">
  						<img src="WebContent/img/2.jpg" style="width:100%; height:300px">
  					</div>
  					
  					<div class="w3-display-container mySlides">
  						<img src="WebContent/img/3.jpg" style="width:100%; height:300px">
  					</div>
  					
  					<button class="w3-button w3-display-left w3-black" onclick="plusDivs(-1)">&#10094;</button>
  					<button class="w3-button w3-display-right w3-black" onclick="plusDivs(1)">&#10095;</button>
  				</div>
  				
  				<script type="text/javascript" src="<c:url value="/WebContent/js/detailPage2.js"/>"></script>
  			</div>
  		</div>
  		
  		<!-- 카드 footer -->
  		<footer class="w3-container w3-dark-gray">
  			<h5>고객 상품평 들어가는 자리</h5>
  		</footer>
  	</div>
  </div>
  
	
  <!-- footer -->
  <jsp:include page="/view/sideView/footer.jsp"></jsp:include>
  
</div>
<div class="w3-black w3-center w3-padding-24">6조 <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div>

</body>

</html>