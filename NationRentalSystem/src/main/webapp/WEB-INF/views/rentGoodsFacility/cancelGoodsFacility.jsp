<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<title>Cancel GoodsFacility Here</title>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<jsp:include page="/WEB-INF/views/module/top/mainHeader.jsp"/>
		<div class="row">
			<div class="col-sm-2" style="padding:15px;">
				<%-- <jsp:include page="./module/left/leftnavi.jsp"/> --%>
			</div>
			<div class="col-sm-8">
			<!-- Begin Content -->
			<h2>대여 & 대관 취소 폼</h2>
			
			
			
			
			<!-- End Content -->
		</div>
			<div class="col-sm-2"></div>
		</div>
		
	</div>
	<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>


</body>
</html>