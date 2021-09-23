<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<title>마이페이지</title>
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

 <div class="w3-container w3-padding-large" style="margin-bottom:32px">
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
				<td style="text-align:center; background-color: #008080; border: solid #444444;" width="11%"  height="50px">구매취소여부</td>	
				<td style="text-align:center; background-color: #008080; border: solid #444444;" width="11%" height="50px">주문 취소</td>		
				<td style="text-align:center; background-color: #008080; border: solid #444444;" width="11%" height="50px">리뷰 등록</td>	
		</tr>
		<tr>
				<td style="text-align:center;" width="8%"  height="50px">1</td>
				<td style="text-align:center;" width="30%" height="50px" >강화유리 머그컵</td>
				<td style="text-align:center;;" width="8%"  height="50px">7000원</td>
				<td style="text-align:center;" width="17%" height="50px">경기도 수원시..</td>
				<td style="text-align:center;" height="50px">2021/08/17</td>
				<td style="text-align:center;"  height="50px">x</td>	
				<td style="text-align:center;" height="50px"><button class="w3-button w3-teal w2-padding w3-hover-red" style="text-align:center">주문 취소</button></td>		
				<td style="text-align:center;%" height="50px"><button class="w3-button w3-teal w2-padding w3-hover-red" style="text-align:center">리뷰 등록</button></td>
		</tr>
		<tr>
				<td style="text-align:center;" width="8%"  height="50px">2</td>
				<td style="text-align:center;" width="30%" height="50px" >[한국후지필름정품]/폴라로이드 카메라/즉석 카메라</td>
				<td style="text-align:center;;" width="8%"  height="50px">100,170원</td>
				<td style="text-align:center;" width="17%" height="50px">서울특별시 중구..</td>
				<td style="text-align:center;" height="50px">2019/11/22</td>
				<td style="text-align:center;"  height="50px">x</td>	
				<td style="text-align:center;" height="50px"><button class="w3-button w3-teal w2-padding w3-hover-red" style="text-align:center">주문 취소</button></td>		
				<td style="text-align:center;%" height="50px"><button class="w3-button w3-teal w2-padding w3-hover-red" style="text-align:center">리뷰 등록</button></td>
		</tr>
		<tr>
				<td style="text-align:center;" width="8%"  height="50px">3</td>
				<td style="text-align:center;" width="30%" height="50px" >[네파키즈] FW오픈/플리스/책가방/운동화</td>
				<td style="text-align:center;;" width="8%"  height="50px">15000원</td>
				<td style="text-align:center;" width="17%" height="50px">서울특별시 영등포구..</td>
				<td style="text-align:center;" height="50px">2019/08/31</td>
				<td style="text-align:center;"  height="50px">x</td>	
				<td style="text-align:center;" height="50px"><button class="w3-button w3-teal w2-padding w3-hover-red" style="text-align:center">주문 취소</button></td>		
				<td style="text-align:center;%" height="50px"><button class="w3-button w3-teal w2-padding w3-hover-red" style="text-align:center">리뷰 등록</button></td>
		</tr>
		<tr>
				<td style="text-align:center;" width="8%"  height="50px">4</td>
				<td style="text-align:center;" width="30%" height="50px" >Razer 헌츠맨 토너먼트 에디션 TKL 텐키리스 게이밍 키보드</td>
				<td style="text-align:center;;" width="8%"  height="50px">172,500원</td>
				<td style="text-align:center;" width="17%" height="50px">서울특별시 종로구..</td>
				<td style="text-align:center;" height="50px">2017/02/27</td>
				<td style="text-align:center;"  height="50px">x</td>	
				<td style="text-align:center;" height="50px"><button class="w3-button w3-teal w2-padding w3-hover-red" style="text-align:center">주문 취소</button></td>		
				<td style="text-align:center;%" height="50px"><button class="w3-button w3-teal w2-padding w3-hover-red" style="text-align:center">리뷰 등록</button></td>
		</tr>
		<tr>
				<td style="text-align:center;" width="8%"  height="50px">5</td>
				<td style="text-align:center;" width="30%" height="50px" >레이저 크라켄 X 초경량 게이밍 헤드셋: 7.1 서라운드 사운드</td>
				<td style="text-align:center;;" width="8%"  height="50px">39,540원</td>
				<td style="text-align:center;" width="17%" height="50px">서울특별시 강서구..</td>
				<td style="text-align:center;" height="50px">2015/06/09</td>
				<td style="text-align:center;"  height="50px">x</td>	
				<td style="text-align:center;" height="50px"><button class="w3-button w3-teal w2-padding w3-hover-red" style="text-align:center">주문 취소</button></td>		
				<td style="text-align:center;%" height="50px"><button class="w3-button w3-teal w2-padding w3-hover-red" style="text-align:center">리뷰 등록</button></td>
		</tr>
		
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
  <h4><b>이런 상품은 어때요?</b></h4>
    <!-- 상품 추천 area -->
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="/shopPro/image/camera1.jpg"/></li>
          <li class="w3-padding-16">
            <h1>케이스+2종선물/폴라로이드카메라</h1>
            <span class="w3-opacity">127,500원</span>
          </li>
          <li class="w3-light-grey w3-padding-24">
            <button class="w3-button w3-teal w3-padding-large w3-hover-red">바로 구매하러 가기</button>
          </li>
        </ul>
      </div>
      
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="/shopPro/image/running-tshirts.jpg"/></li>
          <li class="w3-padding-16">
            <h1>런닝 머슬 반팔 티셔츠 모음전 S-7XL</h1>
            <span class="w3-opacity">6,500원</span>
          </li>
          <li class="w3-light-grey w3-padding-24">
            <button class="w3-button w3-teal w3-padding-large w3-hover-red">바로 구매하러 가기</button>
          </li>
        </ul>
      </div>
      
      <div class="w3-third">
        <ul class="w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off">
          <li class="w3-padding-16"><img src="/shopPro/image/t-shirt.jpg"/></li>
          <li class="w3-padding-16">
            <h1>아웃도어 아웃도어바지 등산티셔츠</h1>
            <span class="w3-opacity">15,600원</span>
          </li>
          <li class="w3-light-grey w3-padding-24">
            <button class="w3-button w3-teal w3-padding-large w3-hover-red">바로 구매하러 가기</button>
          </li>
        </ul>
      </div>
    </div>
  </div>
  
  <!-- Contact Section -->
  <div class="w3-container w3-padding-large w3-grey">
    <h4 id="mypageUpdate"><b>내 정보 수정</b></h4>
    <form action="/action_page.php" target="_blank">
      <div class="w3-section">
        <label>Name</label>
        <input class="w3-input w3-border" type="text" name="Name" required>
      </div>
      <div class="w3-section">
        <label>Email</label>
        <input class="w3-input w3-border" type="text" name="Email" required>
      </div>
      <button type="submit" class="w3-button w3-black w3-margin-bottom">수정하기</button>
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
