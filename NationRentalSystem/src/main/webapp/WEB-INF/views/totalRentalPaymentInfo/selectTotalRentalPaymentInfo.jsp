<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>결제완료</title>
	</head>
	<body>
		<body>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;"></div>
				<div class="col-sm-8">
				<div class="text-center"><br>
					<!-- Begin Content -->
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<div class="text-center">
								<h3>총 결제 금액</h3>
							</div>
							<table class="table table-striped">	
								<thead>
									<tr>
										<th>물품코드</th>
										<th>물품명</th>
										<th>대여가격</th>
										<th>대여시작일</th>
										<th>대여종료일</th>
										<th>배달선택</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="rentGoodsfacilityDto" items="${rentGoodsfacilityDtoList}">
										<td>${rentGoodsfacilityDto.goodsfacilityCode}</td>
										<td>${rentGoodsfacilityDto.goodsfacilityName}</td>
										<td>${rentGoodsfacilityDto.#}</td>
										<td>${rentGoodsfacilityDto.goodsfacilityRentalDateStart}</td>
										<td>${rentGoodsfacilityDto.goodsfacilityRentalDayEnd}</td>
										<td>${rentGoodsfacilityDto.goodsfacilityRentalIsOrderedDelivery}</td>
									</c:forEach>
								</tbody>
							</table>
							<table class="table table-striped">	
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
							</table>
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