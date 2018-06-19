<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>결제 정보 등록</title>
	</head>
	<body>
		<body>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;"></div>
				<div class="col-sm-8"><br>
					<!-- Begin Content -->
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<div class="row">
								<div class="col-md-4">
									<h3>물품/시설 카테고리</h3>
								</div>
							</div>
							<hr/>								
							<!-- 대여내역을 보여주는 테이블 시작-->
							<h3>[ 대여 내역 ]</h3>	
							<table class="table table-striped">	
								<thead>
									<tr>
										<td width="40%">상품정보</td>
										<td width="30%">담당기관</td>
										<td width="10%">대여료</td>
										<td width="10%">수량</td>
										<td wudth="10%">적립금</td>								
									</tr>
								</thead>
								<!-- tbody : 예약신청된 내역을 다 불러와야한다. -->
								<tbody>
									<c:forEach var="rentGoodsfacilityDtoList" items="${list}">
										<tbody>
											<tr>
												<th>
													${rentGoodsfacilityDtoList.goodsfacilityCode}${rentGoodsfacilityDtoList.goodsfacilityName}
												</th>
												<th>
													${rentGoodsfacilityDtoList.adminagencyCode}
												</th>
												<td align="right">
													 <fmt:formatNumber pattern="###,###,###" value="${대여료}"/>
												</td>
												<td>
													<input type="number" style="width: 40px" name="amount" value="${수량}" min="1">
						                        	<input type="hidden" name="productId" value="${상품번호}">
												</td>
												<td align="right">	
													 <fmt:formatNumber pattern="###,###,###" value="${적립금}"/>
												</td>																						
											</tr>
										</tbody>
									</c:forEach>	
								</tbody>
								<tfoot>
									<tr>
					                    <td colspan="5" align="right">
											 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${금액합계}"/><br>
											 배송료 : ${map.fee}<br>
											 전체 결제금액  :<fmt:formatNumber pattern="###,###,###" value="${총결제금액}"/>
					                    </td>
					                </tr>
								</tfoot>
							</table>
							<!-- 대여내역을 보여주는 테이블 끝-->
							<!-- 결제 시작 -->
													
							<!-- 결제 종료 -->
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