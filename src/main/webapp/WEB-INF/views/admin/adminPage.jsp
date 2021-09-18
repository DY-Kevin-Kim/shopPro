<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 수정  -->
<!-- 차트 부분-->
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="X-UA-Compatible" content="ie=edge">



<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<!-- 차트 링크 --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>



<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
hr {
  height: 0.5px;
  background-color: gray;
}
</style>
<body class="w3-light-grey w3-content" style="max-width:1600px">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <h2 onclick="location.href ='/shopPro/main'"><b>쇼핑몰 사이트</b></h2>
    <p class="w3-text-grey">Market Info</p>
  </div>
  <div class="w3-bar-block">
    <a href="#portfolio" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>admin Info</a> 
    <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>ABOUT</a> 
    <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right"></i>CONTACT</a>
  </div>

</nav>



<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">

  <!-- Header -->
  <!-- 
  <header id="portfolio">
    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container">
    
    <h1><b>관리자 페이지</b></h1>
	<br>
    </div>
    
  </header>
   -->
   
   <!-- 관리자 페이지 헤더 -->
  <jsp:include page="/WEB-INF/views/sideView/adminHeader.jsp"></jsp:include>

  <div class="w3-container w3-padding-large" style="margin-bottom:32px;">

    
    <h4><b>방문자 수</b></h4>
    <br>
    <!-- Progress bars / Skills -->
    <table style="width:500px">
    <tr>
    <td><b>오늘 방문수</b></td>
    <td><b>어제 방문수</b></td>
    <td><b>누적 방문수</b></td>
    </tr>
    
    <tr>
    <td>180</td>
    <td>200</td>
    <td>8300</td>
    </tr>
    </table>
    <br><br><br><br>
    
    
    
	<h4><b>방문자 수 그래프</b></h4>
    <div class="container" style="width:70%; float:left;"> 
    	<canvas id="myChart"></canvas> 
    </div>
    
    
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
    <!-- 부트스트랩 --> 
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 				
    		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
    		crossorigin="anonymous">
    </script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
    		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
    		crossorigin="anonymous">
    </script> 
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
    		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" 
    		crossorigin="anonymous">
    </script>
    
    
    <!-- 차트 --> 
    <script> 
    	var ctx = document.getElementById('myChart').getContext('2d'); 
        var chart = new Chart(ctx, 
        	{ // 챠트 종류를 선택 
            	type: 'line', // 챠트를 그릴 데이타 
            	data: { 
                	labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'], 						datasets: [{ 
                    	label: '방문자 수 차트', 
                        backgroundColor: 'transparent', 
                        borderColor: 'red', 
                        data: [400, 100, 500, 1600, 700, 3000, 2000] 
                     }] 
                    }, 
                    // 옵션 
                    options: {} 
                  }); 
    </script>


    
    
    
    <h4><b>수익 목표 달성률</b></h4>
    <br>
    <div class="w3-grey" style="width:70%;">
      <div class="w3-container w3-dark-grey w3-padding w3-center" style="width:65%">65%</div>
    </div>
    <br><br>
    <hr>
    <br><br>
    
    
      <div>
          <h4>How much I charge</h4>
    <!-- Pricing Tables -->

      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white ">
          <li class="w3-black w3-center w3-xlarge w3-padding-32">이번주 인기 상품 품목</li>
          <li class="w3-padding-16"><b>1. MSI GL65 Leopard 10SFK-062 &nbsp;</b><button 
          class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off"  onclick="location.href ='../productPage/detailPage.jsp'" >이동</button></li>
          <li class="w3-padding-16"><b>2. 상품2 &nbsp;</b><button class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off">이동</button></li>
          <li class="w3-padding-16"><b>3. 상품3 &nbsp;</b><button class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off">이동</button></li>
          <li class="w3-padding-16"><b>4. 상품4 &nbsp;</b><button class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off">이동</button></li>
          <li class="w3-padding-16"><b>5. 상품5 &nbsp;</b><button class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off">이동</button></li>
        </ul>
      </div>
      
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white ">
          <li class="w3-black w3-center w3-xlarge w3-padding-32">이번달 인기 상품 품목</li>
          <li class="w3-padding-16"><b>1. 상품1 &nbsp;</b><button class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off">이동</button></li>
          <li class="w3-padding-16"><b>2. 상품2 &nbsp;</b><button class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off">이동</button></li>
          <li class="w3-padding-16"><b>3. 상품3 &nbsp;</b><button class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off">이동</button></li>
          <li class="w3-padding-16"><b>4. 상품4 &nbsp;</b><button class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off">이동</button></li>
          <li class="w3-padding-16"><b>5. 상품5 &nbsp;</b><button class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off">이동</button></li>
        </ul>
      </div>
      
      <div class="w3-third w3-margin-bottom">
        <ul class="w3-ul w3-border w3-white ">
          <li class="w3-black w3-center w3-xlarge w3-padding-32">누적 인기 상품 품목</li>
          <li class="w3-padding-16"><b>1. 상품1 &nbsp;</b><button class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off">이동</button></li>
          
          <li class="w3-padding-16"><b>2. 상품2 &nbsp;</b><button class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off">이동</button></li>
          <li class="w3-padding-16"><b>3. 상품3 &nbsp;</b><button class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off">이동</button></li>
          <li class="w3-padding-16"><b>4. 상품4 &nbsp;</b><button class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off">이동</button></li>
          <li class="w3-padding-16"><b>5. 상품5 &nbsp;</b><button class="w3-button w3-black w3-padding-large  w3-hover-black w3-opacity w3-hover-opacity-off">이동</button></li>
        </ul>
      </div>
      
      

    </div>

      

   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  <br><br>
    <hr>
    <br><br>
  


  <!-- Footer -->
  <footer class="w3-container w3-padding-32 w3-dark-grey">
  <div class="w3-row-padding">
    <div class="w3-third">
      <h3>FOOTER</h3>
      <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
      <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
    </div>
  
    <div class="w3-third">
      <h3>BLOG POSTS</h3>
      <ul class="w3-ul w3-hoverable">
        <li class="w3-padding-16">
          <img src="/w3images/workshop.jpg" class="w3-left w3-margin-right" style="width:50px">
          <span class="w3-large">Lorem</span><br>
          <span>Sed mattis nunc</span>
        </li>
        <li class="w3-padding-16">
          <img src="/w3images/gondol.jpg" class="w3-left w3-margin-right" style="width:50px">
          <span class="w3-large">Ipsum</span><br>
          <span>Praes tinci sed</span>
        </li> 
      </ul>
    </div>

    <div class="w3-third">
      <h3>POPULAR TAGS</h3>
      <p>
        <span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">New York</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">London</span>
        <span class="w3-tag w3-grey w3-small w3-margin-bottom">IKEA</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">NORWAY</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">DIY</span>
        <span class="w3-tag w3-grey w3-small w3-margin-bottom">Ideas</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Baby</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Family</span>
        <span class="w3-tag w3-grey w3-small w3-margin-bottom">News</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Clothing</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Shopping</span>
        <span class="w3-tag w3-grey w3-small w3-margin-bottom">Sports</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Games</span>
      </p>
    </div>

  </div>
  </footer>
  
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