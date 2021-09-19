<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Header -->
<header id="portfolio">
    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container">
    	<c:url value="/main" var="url"/>
	    <h1 onclick="location.href='${url}'"><b>쇼핑몰</b></h1>
	    <div class="w3-section w3-bottombar w3-padding-16">
	      <span class="w3-margin-right">카테고리:</span> 
	      <button class="w3-button w3-black">전체</button>
	      <button class="w3-button w3-white"><i class="fa fa-diamond w3-margin-right"></i>문구</button>
	      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-photo w3-margin-right"></i>유아</button>
	      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-map-pin w3-margin-right"></i>이지윤</button>
	      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-map-pin w3-margin-right"></i>신발</button>
	      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-map-pin w3-margin-right"></i>가구</button>
	    </div>
    </div>
</header>