<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<title>selectListMyDeliveryOrderCitizen</title>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#updateYesBtn').click(function(){
				$(location).attr('href', './updateIsCanceledDelivery?deliveryOrderCitizenCode=' + $('#updateIsCanceledDeliveryModalBtn').val());
			});
			$('#updateNoBtn').click(function(){
				$('#updateIsCanceledDeliveryModal').hide();
			});			
		});
		<%-- <a href="${pageContext.request.contextPath}/updateIsCanceledDelivery?deliveryOrderCitizenCode=${deliveryOrderCitizenDao.deliveryOrderCitizenCode}"> --%>								
	</script>
</head>
	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
				</div>
				<div style="padding:15px;" class="col-sm-8">
				
					<!-- Begin Content -->					
						<div class="panel panel-default">
							<div class="panel-body text-center">
							<h3 class="text-center">배달반납 신청리스트</h3>
							<hr/>							
							<table class="table table-striped">
								<thead>
									<tr>
										<td width="10%">시설/물품 개별관리코드</td>
										<td width="5%">대여/반납상태 구분</td>
										<td width="10%">시민ID</td>
										<td width="10%">행정기관코드</td>
										<td width="15%">보내는 사람주소</td>
										<td width="15%">받는 사람주소</td>
										<td width="10%">배달신청일</td>
										<td width="5%">배달신청취소여부</td>	
										<c:if test="${memberLevel == '공무원'}">	
											<td width="10%">배달의뢰 신청</td>
											<td width="10%">배달의뢰 신청취소</td>
										</c:if>								
										<c:if test="${memberLevel == '시민'}">	
											<td width="10%">주소지수정</td>
											<td width="10%">배달신청취소</td>	
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
												<td>${deliveryOrderCitizenDao.sendAddressSido}&nbsp;${deliveryOrderCitizenDao.sendAddressSigungu}&nbsp;${deliveryOrderCitizenDao.sendAddressEupmyeon}&nbsp;${deliveryOrderCitizenDao.sendAddressSangse}</td>
												<td>${deliveryOrderCitizenDao.receiveAddressSido}&nbsp;${deliveryOrderCitizenDao.receiveAddressSigungu}&nbsp;${deliveryOrderCitizenDao.receiveAddressEupmyeon}&nbsp;${deliveryOrderCitizenDao.receiveAddressSangse}</td>
												<td>${deliveryOrderCitizenDao.deliveryOrderCitizenDate}</td>
												<td>${deliveryOrderCitizenDao.isCanceledDelivery}</td>
												<c:if test="${memberLevel == '시민'}">
													<td>
													<a href="${pageContext.request.contextPath}/updateViewDeliveryOrderCitizenAddress?deliveryOrderCitizenCode=${deliveryOrderCitizenDao.deliveryOrderCitizenCode}">
															<button type="button" class="btn btn-default">
															 수정
															</button>
														</a>
													<td>
														<button value="${deliveryOrderCitizenDao.deliveryOrderCitizenCode}" type="button" id="updateIsCanceledDeliveryModalBtn" class="btn btn-default" data-toggle="modal" data-target="#updateIsCanceledDeliveryModal">															
														취소	
														</button>
													</td>
													<!--Begin Modal -->
													<div class="modal fade" id="updateIsCanceledDeliveryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
																	<h4 class="modal-title text-center" id="myModalLabel">배달반납을 취소하시겠습니까?</h4>
																</div>
																<div class="modal-body text-center">
																	<button type="button" class="btn btn-primary" id="updateYesBtn">예</button> &emsp; &emsp;
																	<button type="button" class="btn btn-primary" id="updateNoBtn">아니오</button>
																</div>
																<div class="modal-footer">
															
																</div>
															</div>
														</div>
													</div>
													<!--End Modal -->																							
												</c:if>
												<c:if test="${memberLevel == '공무원'}">
													<td><a href="${pageContext.request.contextPath}/#?	`deliveryOrderCitizenCode=${deliveryOrderCitizenDao.deliveryOrderCitizenCode}">배달의뢰신청</a></td>
													<td><a href="${pageContext.request.contextPath}/#?deliveryOrderCitizenCode=${deliveryOrderCitizenDao.deliveryOrderCitizenCode}">배달의뢰신청취소</a></td>
												</c:if>
											</tr>
										</tbody>
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