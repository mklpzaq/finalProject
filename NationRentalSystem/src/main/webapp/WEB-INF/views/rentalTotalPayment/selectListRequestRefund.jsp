<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>대여대관 환불신청 리스트</title>
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
								<h3>대여대관 환불신청 리스트</h3>
							</div>
							<table class="table table-striped">
								<thead>
									<tr>
										<td width="25%">환불신청코드</td>
										<td width="25%">결제코드</td>
										<td width="25%">시민ID</td>
										<td width="25%">환불신청날짜</td>								
									</tr>
								</thead>
								<tbody>									
									<c:forEach var="requestRefundDtoList" items="${requestRefundDtoList}">
										<tbody>
											<tr>
												<th>${requestRefundDtoList.requestRefundCode}</th>
												<th>${requestRefundDtoList.rentalTotalPaymentCode}</th>
												<td>${requestRefundDtoList.citizenId}</td>
												<td>${requestRefundDtoList.dateRequestRefund}</td>																						
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