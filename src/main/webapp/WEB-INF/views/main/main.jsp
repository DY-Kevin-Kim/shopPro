<%@page contentType="text/html; charset=utf-8" 
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="resources/css/main.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
<title>main</title>
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
	    <form action="/shopPro/loginProcess" class="w3-padding" target="_blank" method="post">
	    	<div class="w3-section">
	    		<label>아이디</label>
	    		<input class="w3-input w3-border" type="text" name="id" required>
	    	</div>
	    	<div class="w3-section">
	    		<label>비밀번호</label>
	    		<input class="w3-input w3-border" type="password" name="pass" required>
	    	</div>
	    	<div align=center>
		    	<button type="submit" class="btn btn-success">로그인</button>
		    	<input type="button" value="회원가입" onclick="location.href='signup' ">
	    	</div>

	    </form>
    </c:if>
    
    <c:if test="${login != null}">
    	<p align="left" style="margin-left:20px; color:blue">${login.id}님 환영합니다.</p>
    	<!-- <a onclick="location.href ='/shopPro/main'" class="w3-bar-item w3-button w3-padding" style="margin-bottom:50px">- <b>로그아웃</b> -->
    	<a onclick="location.href ='/shopPro/mypage'" class="w3-bar-item w3-button w3-padding" style="margin-bottom:50px">- <b>마이 페이지</b></a> 
    </c:if>
    
    
    <c:choose>
	    <c:when test=" ${id == 'admin'}">
	    	<p align="left" style="margin-left:20px; color:blue">${login.id}님 환영합니다.</p>
	    	<a onclick="location.href ='/shopPro/admin/adminPage'" class="w3-bar-item w3-button w3-padding">- <b>관리자 페이지</b></a>
	
	    </c:when>
    </c:choose>
    
    
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
  <header id="portfolio">
    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container">

    
    </div>
  </header>

 <div class="w3-container w3-padding-large" style="margin-bottom:32px">
 <h4 id="food"><b>식품</b></h4>
    <div class="w3-row-padding" style="margin:0 -16px">
    
     <c:forEach var="itemList" items="${foodItemList}">
      <c:url value="/productPage?itemid=${itemList.itemid}" var="url"/>
      <div class="w3-third w3-margin-bottom" onclick="location.href='${url}'">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="${itemList.itemimg}"/></li>
          <li class="w3-padding-16">
            <h5>${itemList.itemname}</h5>
            <span class="w3-opacity"> ${itemList.price}원 </span>
          </li>
        </ul>
      </div>
    </c:forEach>  
    </div>
  <!--   <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>햇반 즉석밥 작은공기, 130g, 36개</h5>
            <span class="w3-opacity">28,490원</span>
          </li>
        </ul>
      </div>
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>켈로그 콘푸로스트 시리얼</h5>
            <span class="w3-opacity">4,590원</span>
          </li>
        </ul>
      </div>   
      <div class="w3-third">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>농심 올리브짜파게티 5봉</h5>
            <span class="w3-opacity">4,270원</span>
          </li>
        </ul>
      </div>   
    </div> -->
  </div>
    
  <div class="w3-container w3-padding-large w3-grey">
    <h4 id="cloth"><b>패션의류/잡화</b></h4>
    <div class="w3-row-padding" style="margin:0 -16px">
    
     <c:forEach var="itemList" items="${clothItemList}">
      <c:url value="/productPage?itemid=${itemList.itemid}" var="url"/>
      <div class="w3-third w3-margin-bottom" onclick="location.href='${url}'">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="${itemList.itemimg}"/></li>
          <li class="w3-padding-16">
            <h5>${itemList.itemname}</h5>
            <span class="w3-opacity"> ${itemList.price}원 </span>
          </li>
        </ul>
      </div>
    </c:forEach>  
    </div>

<!--     <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>발락트 남녀공용 오버핏 무지 반팔티셔츠</h5>
            <span class="w3-opacity">9,900원</span>
          </li>
        </ul>
      </div>
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>에이블팩토리 마린 몰랑이 실내화</h5>
            <span class="w3-opacity">8,100원</span>
          </li>
        </ul>
      </div>   
      <div class="w3-third">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>리빙톡 미끄럼방지 욕실 슬리퍼</h5>
            <span class="w3-opacity">9,900원</span>
          </li>
        </ul>
      </div>   
    </div> -->
</div>


  <div class="w3-container w3-padding-large" style="margin-bottom:32px">
  <h4 id="beauty"><b>뷰티</b></h4>
  
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>랑방 에끌라 드 아르페쥬 우먼 오 드 퍼퓸</h5>
            <span class="w3-opacity">36,000원</span>
          </li>
        </ul>
      </div>
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>이니스프리 그린티 씨드 세럼, 80ml</h5>
            <span class="w3-opacity">15,310원</span>
          </li>
        </ul>
      </div>
      
      <div class="w3-third">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>은율 내츄럴 알로에 마스크팩, 50개</h5>
            <span class="w3-opacity">13,900원</span>
          </li>
        </ul>
      </div>   
    </div>    
  </div>  
  
    <!-- Contact Section -->
  <div class="w3-container w3-padding-large w3-grey">
    <h4 id="digital"><b>가전디지털</b></h4>
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off" onclick="location.href ='/productPage'">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>MSI GL65 Leopard 10SFK-062</h5>
            <span class="w3-opacity">890,000원</span>
          </li>
        </ul>
      </div>
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>삼성전자 블루스카이 3000 공기청정기</h5>
            <span class="w3-opacity">209,000원</span>
          </li>
        </ul>
      </div>   
      <div class="w3-third">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>테팔 반자동 에스프레소 머신 콤팩트</h5>
            <span class="w3-opacity">93,890원</span>
          </li>
        </ul>
      </div>   
    </div>
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>삼성전자 4K UHD 108cm Crystal TV</h5>
            <span class="w3-opacity">890,000원</span>
          </li>
        </ul>
      </div>
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>삼성전자 블루스카이 3000 공기청정기</h5>
            <span class="w3-opacity">209,000원</span>
          </li>
        </ul>
      </div>   
      <div class="w3-third">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>테팔 반자동 에스프레소 머신 콤팩트</h5>
            <span class="w3-opacity">93,890원</span>
          </li>
        </ul>
      </div>   
    </div>
  </div>
  
    <div class="w3-container w3-padding-large" style="margin-bottom:32px">
  <h4 id="office"><b>문구/오피스</b></h4>
    <!-- 상품 추천 area -->
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>파카 아이엠 코어 CT 만년필</h5>
            <span class="w3-opacity">44,380원</span>
          </li>
        </ul>
      </div>
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>아트 수채색연필 틴케이스</h5>
            <span class="w3-opacity">19,900원</span>
          </li>
        </ul>
      </div>
      
      <div class="w3-third">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="resources/image/product.jpg"/></li>
          <li class="w3-padding-16">
            <h5>아트조이 DIY 보석 십자수 캔버스형 50X40cm</h5>
            <span class="w3-opacity">18,040원</span>
          </li>
        </ul>
      </div>   
    </div>
  </div> 
  
  <div class="w3-black w3-center w3-padding-24">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div>

<!-- End page content -->
</div>

<script>
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