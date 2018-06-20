<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>View Image Detail</title>
	
	</head>
	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		<jsp:include page="../module/top/navbar.jsp"/>
			<%-- <jsp:include page="../module/top/mainHeader.jsp"/> --%>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<%-- <jsp:include page="../module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
					<div style="margin:15px 0 0 0;" class="panel panel-default">
						<div class="panel-body text-center">
					
							<h3>시설/물품 상세보기</h3>
							<hr/>
							
							<div class="row">
								<div class="col-sm-4"></div>
								<div class="col-sm-4">
									<div class="panel panel-default">
										<div class="panel-body text-center">
											<c:forEach var="GoodsFacilityFile" items="${GoodsFacilityFile}">
												<h3>&#60;${viewImageDetailOne.goodsfacilityName}&#62;</h3>
												<hr/>
												<img data-src="holder.js/100%x200" alt="${GoodsFacilityFile.goodsfacilityFileName}${GoodsFacilityFile.goodsfacilityFileExt}" src="${pageContext.request.contextPath}/downloadFile?goodsfacilityName=${GoodsFacilityFile.goodsfacilityFileName}&goodsfacilityFileExt=${GoodsFacilityFile.goodsfacilityFileExt}" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">
											</c:forEach>
										</div>
									</div>
								</div>	
								<div class="col-sm-4"></div>	
							</div>
							
							
							<form id="insertForm" class="form-horizontal" action="${pageContext.request.contextPath}/insertTotalRentalPaymentInfo" method="post">
								<div class="form-group">
									<label for="goodsfacilityCode" class="col-sm-3 control-label">시설/물품 코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityCode" value="${viewImageDetailOne.goodsfacilityCode}" id="goodsfacilityCode" placeholder="시설/물품 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityThreeCode" class="col-sm-3 control-label">시설/물품 카테고리 코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityThreeCode" value="${viewImageDetailOne.goodsfacilityThreeCode}" id="goodsfacilityThreeCode" placeholder="시설/물품 카테고리 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityName" class="col-sm-3 control-label">시설/물품 명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityName" value="${viewImageDetailOne.goodsfacilityName}" id="goodsfacilityName" placeholder="시설/물품 명" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityPurchaseprice" class="col-sm-3 control-label">시설/물품 구입금액</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityPurchaseprice" value="${viewImageDetailOne.goodsfacilityPurchaseprice}" id="goodsfacilityPurchaseprice" placeholder="시설/물품 구입금액" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityPriceRental" class="col-sm-3 control-label">대여/대관료</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityPriceRental" value="${viewImageDetailOne.goodsfacilityPriceRental}" id="goodsfacilityPriceRental" placeholder="대여/대관료" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityTextSangse" class="col-sm-3 control-label">상세 내용</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityTextSangse" value="${viewImageDetailOne.goodsfacilityTextSangse}" id="goodsfacilityTextSangse" placeholder="상세 내용" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="adminagencyCode" class="col-sm-3 control-label">지자체 기관 코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="adminagencyCode" value="${viewImageDetailOne.adminagencyCode}" id="adminagencyCode" placeholder="지자체 기관 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="sidoName" class="col-sm-3 control-label">시도 명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="sidoName" value="${viewImageDetailOne.sidoName}" id="sidoName" placeholder="시도 명" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="sigunguName" class="col-sm-3 control-label">시군구 명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="sigunguName" value="${viewImageDetailOne.sigunguName}" id="sigunguName" placeholder="시군구 명" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="eupmyeonName" class="col-sm-3 control-label">읍면동 명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="eupmyeonName" value="${viewImageDetailOne.eupmyeonName}" id="eupmyeonName" placeholder="읍면동 명" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityAddressSangse" class="col-sm-3 control-label">물품/시설 위치 상세주소</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityAddressSangse" value="${viewImageDetailOne.goodsfacilityAddressSangse}" id="goodsfacilityAddressSangse" placeholder="물품/시설 위치 상세주소" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="functionaryId" class="col-sm-3 control-label">등록/관리 공무원 ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="functionaryId" value="${viewImageDetailOne.functionaryId}" id="functionaryId" placeholder="등록/관리 공무원 ID" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityClassifyGoodsfacility" class="col-sm-3 control-label">물품/시설 구분</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityClassifyGoodsfacility" value="${viewImageDetailOne.goodsfacilityClassifyGoodsfacility}" id="goodsfacilityClassifyGoodsfacility" placeholder="물품/시설 구분" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityClassifyDonationpurchase" class="col-sm-3 control-label">기부/구입 구분</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityClassifyDonationpurchase" value="${viewImageDetailOne.goodsfacilityClassifyDonationpurchase}" id="goodsfacilityClassifyDonationpurchase" placeholder="기부/구입 구분" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityIsExtra" class="col-sm-3 control-label">예비상태 여부</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityIsExtra" value="${viewImageDetailOne.goodsfacilityIsExtra}" id="goodsfacilityIsExtra" placeholder="예비상태 여부" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityIsPossibleDelivery" class="col-sm-3 control-label">배달가능 여부</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityIsPossibleDelivery" value="${viewImageDetailOne.goodsfacilityIsPossibleDelivery}" id="goodsfacilityIsPossibleDelivery" placeholder="배달가능 여부" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityStateAfterservice" class="col-sm-3 control-label">현재 AS 상태</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityStateAfterservice" value="${viewImageDetailOne.goodsfacilityStateAfterservice}" id="goodsfacilityStateAfterservice" placeholder="현재 AS 상태" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityIsPossibleRental" class="col-sm-3 control-label">시설/물품 대여가능 여부</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityIsPossibleRental" value="${viewImageDetailOne.goodsfacilityIsPossibleRental}" id="goodsfacilityIsPossibleRental" placeholder="시설/물품 대여가능 여부" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityDateRegistration" class="col-sm-3 control-label">시설/물품 등록일자</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityDateRegistration" value="${viewImageDetailOne.goodsfacilityDateRegistration}" id="goodsfacilityDateRegistration" placeholder="시설/물품 등록일자" readonly>
									</div>
								</div>
								<div class="text-center">
									<button id="insertBtn" type="button" class="btn btn-primary">대여/예약 하기</button>
									<button id="insertBtn" type="button" class="btn btn-primary">장바구니에 담기</button>
								</div>
							</form>
							
							
							
							
								
							<div class="caption">
								<!-- <h3 style="text-align:center;" id="thumbnail-label">이준희<a class="anchorjs-link" href="#thumbnail-label"><span class="anchorjs-icon"></span></a></h3> -->
								<p>"${viewImageDetailOne.goodsfacilityThreeCode}"</p>
								<p>"${viewImageDetailOne.goodsfacilityName}"</p>
								<p>"${viewImageDetailOne.goodsfacilityPurchaseprice}"</p>
								<p>"${viewImageDetailOne.goodsfacilityPriceRental}"</p>
								<p>"${viewImageDetailOne.goodsfacilityTextSangse}"</p>
								<p>"${viewImageDetailOne.adminagencyCode}"</p>
								<p>"${viewImageDetailOne.sigunguName}"</p>
								<p>"${viewImageDetailOne.sidoName}"</p>
								<p>"${viewImageDetailOne.eupmyeonName}"</p>
								<p>"${viewImageDetailOne.goodsfacilityAddressSangse}"</p>
								<p>"${viewImageDetailOne.goodsfacilityIsPossibleDelivery}"</p>
								<p>"${viewImageDetailOne.goodsfacilityIsPossibleRental}"</p>								
								<p><a href="${pageContext.request.contextPath}/applicationRentFrom?goodsfacilityCode=${viewImageDetailOne.goodsfacilityCode}&memberId=${member.memberId}" class="btn btn-primary" role="button">대여/예약으로 가기</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
							</div>								
					
						</div>
					</div>	
	
					<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>
	</body>
</html>