<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
		<title>Home</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		
		<div class="container-fluid" style="height:800px;">
			<jsp:include page="./module/top/navbar.jsp"/>
			<%-- <jsp:include page="./module/top/mainHeader.jsp"/> --%>
			<div class="row" >
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="./module/leftHome/leftHome.jsp"/>
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->
					
					<div style="margin:15px 0 15px 0;" class="panel panel-default">
						<div class="panel-body text-center">
							<h1>국가 통합 대여/예약 시스템</h1>
							<h2>Nation Integrated Reserve and Rental System</h2>
						</div>
					</div>
					
					<img style="margin:0 auto;" src="${pageContext.request.contextPath}/resources/image/bgMain.jpg">
					
					<!-- End Content -->
					</div>
					<div class="col-sm-2"></div>
				</div>
			</div>
			<jsp:include page="./module/bottom/bottomContent.jsp"/>
			
	
	</body>
</html>
