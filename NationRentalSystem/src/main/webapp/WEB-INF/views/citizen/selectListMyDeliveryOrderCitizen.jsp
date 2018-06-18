<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>selectListMyDeliveryOrderCitizen</title>
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
				
				<h2>배달반납신청 조회</h2>
				
					<table class="table table-striped">
						<thead>
							<tr>
								<td width="10%">시설/물품 개별관리코드</td>
								<td width="5%">대여/반납상태 구분</td>
								<td width="10%">시민ID</td>
								<td width="10%">행정기관코드</td>
								<td width="20%">보내는 사람주소</td>
								<td width="20%">받는 사람주소</td>
								<td width="10%">배달신청일</td>
								<td width="5%">배달신청취소여부</td>	
								<c:if test="${memberLevel == '시민'}">	
									<td width="5%">배달반납수정</td>
									<td width="5%">배달신청취소</td>	
								</c:if>									
							</tr>
						</thead>
						<tbody>								
							<c:forEach var="deliveryOrderCitizenDao" items="${list}">
								<tbody>
									<tr>														
										<th>${deliveryOrderCitizenDao.goodsfacilityCode}</th>
										<th>${deliveryOrderCitizenDao.classifyRentalState}</th>
										<td>${deliveryOrderCitizenDao.citizenId}</td>
										<td>${deliveryOrderCitizenDao.adminagencyCode}</td>
										<td>${deliveryOrderCitizenDao.sendAddressSigungu}&nbsp;${deliveryOrderCitizenDao.sendAddressEupmyeon}&nbsp;${deliveryOrderCitizenDao.sendAddressSangse}</td>
										<td>${deliveryOrderCitizenDao.receiveAddressSigungu}&nbsp;${deliveryOrderCitizenDao.receiveAddressEupmyeon}&nbsp;${deliveryOrderCitizenDao.receiveAddressSangse}</td>
										<td>${deliveryOrderCitizenDao.deliveryOrderCitizenDate}</td>
										<td>${deliveryOrderCitizenDao.isCanceledDelivery}</td>
										<c:if test="${memberLevel == '시민'}">
											<td><a href="${pageContext.request.contextPath}/updateViewDeliveryOrderCitizenAddress?deliveryOrderCitizenCode=${deliveryOrderCitizenDao.deliveryOrderCitizenCode}">배달반납수정</a></td>
											<td><a href="${pageContext.request.contextPath}/updateIsCanceledDelivery?deliveryOrderCitizenCode=${deliveryOrderCitizenDao.deliveryOrderCitizenCode}">배달신청취소</a></td>																						
										</c:if>
									</tr>
								</tbody>
							</c:forEach>						
						</tbody>
					</table>
				
				</div>				
				<div class="col-sm-2"></div>
			</div>					
		</div>
		<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>
						
	</body>
</html>