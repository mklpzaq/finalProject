<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
	<title>UPDATE RENT FORM</title>	
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
			<h2>대여 & 대관 수정 폼</h2>
			<form action="${pageContext.request.contextPath}/updateApplicationForm" method="post">
				<div class="form-group">
						<label for="ID" class="col-sm-2 control-label">회원ID</label>
				    <div class="col-sm-10">
				    	<input type="text" class="form-control" id="CitizenId" name="CitizenId" value="${updateRentApp.citizenId}" readonly>				    	     	
				    </div>
				</div>				
				<div class="form-group">
						<label for="PW" class="col-sm-2 control-label">회원연락처</label>
				    <div class="col-sm-10">
				    	<input type="text" class="form-control" id="citizenPhone" name="citizenPhone" value="${updateRentApp.citizenPhone}">				    	     	
				    </div>
				</div>
				<div class="form-group">
						<label for="RePW" class="col-sm-2 control-label">시설 & 물품명</label>
				    <div class="col-sm-10">
				    	<input type="text" class="form-control" id="goodsfacilityName" name="goodsfacilityName" value="${updateRentApp.goodsfacilityName}" readonly>				    	     	
				    </div>
				</div>
				<div class="form-group">
						<label for="sigungu" class="col-sm-2 control-label">배달 신청여부</label>
				    <div class="col-sm-10">
				    	<input type="text" class="form-control" id="goodsfacilityRentalIsOrderedDelivery" name="goodsfacilityRentalIsOrderedDelivery"  value="${updateRentApp.goodsfacilityRentalIsOrderedDelivery}" readonly>				    	     	
				    </div>
				</div>				
				<button type="submit" class="btn btn-primary btn-lg btn-block" id="btn">수정완료</button>			
			</form>			
			
			
			<!-- End Content -->
		</div>
			<div class="col-sm-2"></div>
		</div>
		
	</div>
	<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>




</body>
</html>