<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>대여대관 결제완료 리스트</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">	
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="/WEB-INF/views/module/leftRentalTotalPayment/leftRentalTotalPayment.jsp"/>
				</div>
				<div class="col-sm-8"><br>
					<!-- Begin Content -->
					<div class="panel panel-default">	
						<div class="panel-body text-center">
							<div class="text-center">
								<h3>대여대관 결제리스트</h3>
							</div>
							<table class="table table-striped">
								<thead>
									<tr>
										<td width="5%">결제코드</td>
										<td width="10%">신청인ID</td>
										<td width="15%">물품/시설명</td>
										<td width="10%">대여금액</td>
										<td width="10%">사용포인트</td>
										<td width="10%">사용패키지</td>
										<td width="10%">배송료</td>
										<td width="10%">총결제금액</td>
										<td width="20%">결제날짜</td>									
									</tr>
								</thead>
								<tbody>									
									<c:forEach var="rentalTotalPaymentDtoList" items="${rentalTotalPaymentDtoList}">
										<tbody>
											<tr>
												<th>${rentalTotalPaymentDtoList.rentalTotalPaymentCode}</th>
												<th>${rentalTotalPaymentDtoList.citizenId}</th>
												<td>${rentalTotalPaymentDtoList.goodsfacilityName}</td>
												<td>${rentalTotalPaymentDtoList.goodsfacilityPriceRental}</td>	
												<td>${rentalTotalPaymentDtoList.usedPoint}</td>
												<th>${rentalTotalPaymentDtoList.annualfeePakageName}</th>
												<th>${rentalTotalPaymentDtoList.deliveryPrice}</th>
												<td>${rentalTotalPaymentDtoList.rentalTotalPayment}</td>
												<td>${rentalTotalPaymentDtoList.datePayment}</td>																							
											</tr>
										</tbody>
									</c:forEach>									
								</tbody>
							</table>		
						</div>
					<div class="col-sm-2"></div>
				</div>
				<!-- End Content -->
			</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>
	</body>
</html>