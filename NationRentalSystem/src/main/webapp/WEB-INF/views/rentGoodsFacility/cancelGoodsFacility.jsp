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
			<div class="panel panel-default">
					<div class="panel-body">
						<h2>대여 & 예약 취소</h2>
						<hr/>
						<div class="panel panel-default">
						<div class="panel-body text-center">
							<form id="insertForm" class="form-horizontal" action="${pageContext.request.contextPath}/cancelGoodsFacility" method="post">
								<div class="form-group">
									<label for="application" class="col-sm-2 control-label">시설물품명</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="goodsfacilityName" name="goodsfacilityName" value="${cencelRent.goodsfacilityName}" readonly>			    	
								    </div>
								</div>
								<div class="form-group">
									<label for="application" class="col-sm-2 control-label">신청인아이디</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="citizenId" name="citizenId" value="${cencelRent.citizenId}" readonly>			    	
								    </div>
								</div>
								<div class="form-group">
									<label for="application" class="col-sm-2 control-label">신청인이름</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="citizenName" name="citizenName" value="${cencelRent.citizenName}" readonly>			    	
								    </div>
								</div>
								<div class="form-group">
									<label for="application" class="col-sm-2 control-label">배달금액</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="goodsfacilityRentalIsOrderedDelivery" name="goodsfacilityRentalIsOrderedDelivery" value="${cencelRent.goodsfacilityRentalIsOrderedDelivery}" readonly>			    	
								    </div>
								</div>
								<div class="form-group">
									<label for="application" class="col-sm-2 control-label">신청한날짜</label>
								    <div class="col-sm-10">
								    	<input type="date" class="form-control" id="goodsfacilityRentalDateRegistration" name="goodsfacilityRentalDateRegistration" value="${cencelRent.goodsfacilityRentalDateRegistration}" readonly>			    	
								    </div>
								</div>								
								<div class="form-group">
									 <div class="col-sm-10">	
										<button type="submit" id="insertApplication">대여 & 예약 취소</button>	
									</div>
								</div>						
							
							</form>						
						</div>
					
						</div>					
					
					</div>
			</div>			
			
			
			
			<!-- End Content -->
		</div>
			<div class="col-sm-2"></div>
		</div>
		
	</div>
	<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>

</body>
</html>