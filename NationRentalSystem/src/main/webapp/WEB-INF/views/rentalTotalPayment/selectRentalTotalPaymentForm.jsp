<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>대여대관 결제하기</title>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
				</div>
				<div class="col-sm-8"><br>
					<!-- Begin Content(1) -->
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<div class="row">
								<div class="col-md-4">
									<h3>대여/대관 내역</h3>
								</div>
							</div>
							<hr/>
							<table class="table table-striped">
								<thead>
									<tr>
										<td width="20%">상품코드</td>
										<td width="50%">상품이름</td>
										<td width="15%">대여/대관 금액</td>
										<td width="15%">배송선택</td>								
									</tr>
								</thead>
								<tbody>									
									<c:forEach var="rentGoodsfacilityDtoList" items="${rentGoodsfacilityDtoList}">
										<tbody>
											<tr>
												<th>${rentGoodsfacilityDtoList.goodsfacilityCode}</th>
												<th>${rentGoodsfacilityDtoList.goodsfacilityName}</th>
												<td>${rentGoodsfacilityDtoList.goodsfacilityPriceRental}</td>
												<td>${rentGoodsfacilityDtoList.goodsfacilityRentalIsOrderedDelivery}</td>																						
											</tr>
										</tbody>
									</c:forEach>	
								</tbody>
							</table>
						</div>
					</div>
					<!-- End Content(1) -->
					<!-- Begin Content(2) -->
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<div class="row">
								<div class="col-md-4">
									<h3>할인정보</h3>
								</div>
							</div>
							<hr/>
							<table class="table table-striped">
								<thead>
									<tr>
										<th>패키지/연회비 : </th>
										<td></td>
										<td width="50%">상품이름</td>
										<td width="15%">대여/대관 금액</td>
										<td width="15%">배송선택</td>								
									</tr>
								</thead>
								<tbody>									
									<c:forEach var="rentGoodsfacilityDtoList" items="${rentGoodsfacilityDtoList}">
										<tbody>
											<tr>
												<th>${rentGoodsfacilityDtoList.goodsfacilityCode}</th>
												<th>${rentGoodsfacilityDtoList.goodsfacilityName}</th>
												<td>${rentGoodsfacilityDtoList.goodsfacilityPriceRental}</td>
												<td>${rentGoodsfacilityDtoList.goodsfacilityRentalIsOrderedDelivery}</td>																						
											</tr>
										</tbody>
									</c:forEach>	
								</tbody>
							</table>
						</div>
					</div>
					<!-- End Content(2) -->
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>
	</body>
</html>


<%-- <table class="table table-striped">	
								<thead>
									<tr>
										<th>총 결제 금액</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="totalRentalPaymentInfoDto" items="${totalRentalPaymentInfoDtoList}">
										<tr>
											<td>
												총 대여 금액 : <fmt:formatNumber pattern="###,###,###" value="${totalRentalPaymentInfoDto.totalRentalPayment}"/>
											</td>
										</tr>
										<tr>
											<td>
												사용 포인트 : <fmt:formatNumber pattern="###,###,###" value="${totalRentalPaymentInfoDto.usedPoint}"/>
											</td>
										</tr>
										<tr>
											<td>
												배송료 : <fmt:formatNumber pattern="###,###,###" value="${totalRentalPaymentInfoDto.deliveryPrice}"/>
											</td>
										</tr>
										<tr>
											<td>
												총 결제 금액 : <fmt:formatNumber pattern="###,###,###" value="${totalRentalPaymentInfoDto.totalPayment}"/>
											</td>
										</tr>
									</c:forEach>
								</tbody>	
							</table> --%>