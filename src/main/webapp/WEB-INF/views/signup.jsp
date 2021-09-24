<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>


	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
	</style>
</head>
<body>
	<div align=center>		
		<h1 onclick="location.href ='/shopPro/main'"><b>KIC 쇼핑몰</b></h1>
		<form name=signup  method="post">
		
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input class="id_input" name="id">
				</div>
				<span class="id_input_re_1"style="color:green">사용가능한 아이디입니다.</span>
				<span class="id_input_re_2"style="color:red">아이디가 이미 존재합니다.</span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" type="password" name="pass" id="pass" required>
				</div>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호확인</div>
				<div class="pw_input_box">
					<input class="pw_input" type="password" id="pass2" required>
				</div>
			</div>
			<div class="add_wrap">
				<div class="add_name">주소</div>
				<div class="add_input_box">
					<input class="add_input" name="address" required>
				</div>
			</div>
			
			
			
	<!-- 		
			<p>
				<label for="id">아이디</label>
				<input type="text" name="id" placeholder="아이디를 입력하세요" required>
				<button type="button" class="idCheck">아이디 확인</button>
			</p>
			<p class="result">
				<span class="msg">중복확인을 해주십시오.</span>
 				
			<p>
				<label for="pass">비밀번호</label>
				<input type="password" name="pass" placeholder="비밀번호를 입력하세요" required>
			</p>
			
			<p>
				<label>비밀번호</label>
				<input type="password" id="pass" name="pass" required>
			</p>
						
			<p>
				<label>비밀번호 확인</label>
				<input type="password" id="pass2" required>
			</p>
			
			<p>
				<label for="address">주소</label>
				<input type="text" name="address"  placeholder="주소를 입력하세요" required>
			</p> -->
			<p>
				<button type="submit" id="submit" >회원가입</button>
			</p>

		
<!-- 		<table>	
			<tr><th>아이디</th><td><input type="text" name="id" autofocus placeholder="아이디를 입력하세요" required></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="pass" placeholder="비밀번호를 입력하세요" required></td></tr>
			
			<tr><th>주소</th><td><input type="text" name="address"  placeholder="주소를 입력하세요" required></td></tr>
		</table>
		<dl>
			<dd><input type="submit" name="submit" value="회원가입"></dd>
		</dl> -->
		</form>
	</div>
<script> 

$("#id").keyup(function(){
	 $(".result .msg").text("아이디를 확인해주십시오.");
	 $(".result .msg").attr("style", "color:#000");
	 
	 $("#submit").attr("disabled", "disabled");
	 
	});
	
//아이디 중복검사
$('.id_input').on("propertychange change keyup paste input", function(){

	var id = $('.id_input').val();			// .id_input에 입력되는 값
	var data = 	{id:id}			// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "memberIdChk",
		data : data,
		success : function(result){
			 console.log("성공 여부" + result);
				// console.log("성공 여부" + result);
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");				
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");				
				}
		}// success 종료
	}); // ajax 종료	

});// function 종료


$(function(){

	//비밀번호 확인
		$('#pass2').blur(function(){
		   if($('#pass').val() != $('#pass2').val()){
		    	if($('#pass2').val()!=''){
			    alert("비밀번호가 일치하지 않습니다.");
		    	    $('#pass2').val('');
		          $('#pass2').focus();
		       }
		    }
		})  	   
	});
/* 	
	
$(".idCheck").click(function(){
 $.ajax({
  url : "idCheck",
  type : "post",
  data : {"id":$('#id').val()},
  success : function(data) {
  
   if(data == 1) {
    $(".result .msg").text("사용 불가");
    $(".result .msg").attr("style", "color:#f00");  
    
    $("#submit").attr("disabled","disabled");
   } else {
    $(".result .msg").text("사용 가능");
    $(".result .msg").attr("style", "color:#00f");
    
    $("#submit").removeAttr("disabled");

   }
  }
 });  // ajax 끝
}); */
</script>
</body>


</html>