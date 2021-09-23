<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>
<body>
	<div align=center>
		<header><h1><b>KIC 쇼핑몰</b></h1></header>
		<form name=signup action="http://localhost:8080/shopPro/signup/" method="post">
		<table>	
			<tr><th>아이디</th><td><input type="text" name="id" autofocus placeholder="아이디를 입력하세요" required></td></tr>
			
			<tr><th>비밀번호</th><td><input type="password" name="pass" placeholder="비밀번호를 입력하세요" required></td></tr>
			
			<tr><th>주소</th><td><input type="text" name="address"  placeholder="주소를 입력하세요" required></td></tr>
		</table>
		<dl>
			<dd><input type="submit" name="submit" value="회원가입"></dd>
		</dl>
		</form>
	</div>
</body>
</html>