<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>insert Delivery Order Functionary Form</title>
	</head>
	<script>
			$(document).ready(function(){
				/* 이전 페이지(반납AS에서 AS요청한것인지, 점검AS에서 AS요청한지에 따라서 적용되는 input 이 달라지게 한다.) */
				/* if( $('#beforePageCode').val() === '반납AS' ){
					alert('반납AS에서 요청함.');
					$('#addDiv').append('<label for="returnGoodsfacilityInfoCode" class="col-sm-3 control-label">물품/시설 반납 코드</label><div class="col-sm-9"><input type="text" class="form-control" name="returnGoodsfacilityInfoCode" value="${unitedAfterserviceRequestDto.returnGoodsfacilityInfoCode}" id="returnGoodsfacilityInfoCode"  readonly></div>');
				}else if( $('#beforePageCode').val() === '점검AS'){
					alert('점검AS에서 요청함');
					$('#addDiv').append('<label for="regularCheckCode" class="col-sm-3 control-label">정기점검 코드</label><div class="col-sm-9"><input type="text" class="form-control" name="regularCheckCode" value="${unitedAfterserviceRequestDto.regularCheckCode}" id="regularCheckCode" placeholder="정기점검 코드" readonly></div>');
				} */
				
				/* 첫 화면에서도 바로 적용되게 ajax를 이벤트 발생전에도 실행되게 하였다. */
				/* $.ajax({
					type: "POST"
					,url: "${pageContext.request.contextPath}/selectOneAgencyForAjax"
					,data: { agencyNameAndBusinesstypeName: $('#agencySelect > option:selected').val() }
					,success:function( JSON ) { // result : String, XML, JSON
						$('#agencyCode').val(JSON.agencyCode);
						$('#agencyName').val(JSON.agencyName);
						$('#agencyBusinesstypeCode').val(JSON.agencyBusinesstypeCode);
						$('#agencyBusinesstypeName').val(JSON.agencyBusinesstypeName);
					}
				}); */
				
				$('#agencySelect').change(function() {
					$.ajax({
						type: "POST"
						,url: "${pageContext.request.contextPath}/selectOneAgencyForAjax"
						,data: { agencyNameAndBusinesstypeName: $('#agencySelect > option:selected').val() }
						,success:function( JSON ) { // result : String, XML, JSON
							$('#agencyCode').val(JSON.agencyCode);
							$('#agencyName').val(JSON.agencyName);
							$('#agencyBusinesstypeCode').val(JSON.agencyBusinesstypeCode);
							$('#agencyBusinesstypeName').val(JSON.agencyBusinesstypeName);
						}
					});
				});
				
				$('#insertBtn').click(function(){
					if( $('#agencyCode').val() === "" || $('#agencyName').val() === "" || $('#agencyBusinesstypeCode').val() === "" || $('#agencyBusinesstypeName').val() === ""){
						alert('의뢰할 대행업체를 선택해주십시오.');
					}else{
						$('#insertForm').submit();
					}
				});
			});
		</script>
	<body>
		<jsp:include page="../module/backgroundImg/backgroundImg.jsp"/>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="height:100%; margin:15px 0 0 0;">
			<div class="row" >
				<div class="col-sm-2">
					<jsp:include page="../module/leftUnitedAfterserviceRequest/leftUnitedAfterserviceRequest.jsp"/>
				</div>
				<div class="col-sm-9">
					<!-- Begin Content -->
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="text-center">공무원 배달 의뢰 작성</h3>
							<hr/>
							<form id="insertForm" class="form-horizontal" action="${pageContext.request.contextPath}/insertDeliveryOrderFunctionary" method="post">
								<div class="form-group">
									<label for="deliveryOrderCitizenCode" class="col-sm-3 control-label">시민 배달 신청 코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="deliveryOrderCitizenCode" id="deliveryOrderCitizenCode" value="${deliveryOrderFunctionaryDto.deliveryOrderCitizenCode}" placeholder="시민 배달 신청 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="adminagencyCode" class="col-sm-3 control-label">지자체 기관 코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="adminagencyCode" id="adminagencyCode" value="${deliveryOrderFunctionaryDto.adminagencyCode}" placeholder="행정기관 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityCode" class="col-sm-3 control-label">물품/시설 코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityCode" id="goodsfacilityCode" value="${deliveryOrderFunctionaryDto.goodsfacilityCode}" placeholder="물품/시설 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityClassifyGoodsfacility" class="col-sm-3 control-label">물품/시설 분류</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="goodsfacilityClassifyGoodsfacility" value="${deliveryOrderFunctionaryDto.goodsfacilityClassifyGoodsfacility}" placeholder="물품/시설 분류" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityThreeName" class="col-sm-3 control-label">물품/시설 카테고리</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="goodsfacilityThreeName" value="${deliveryOrderFunctionaryDto.goodsfacilityThreeName}" placeholder="물품/시설 카테고리" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityName" class="col-sm-3 control-label">물품/시설 명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="goodsfacilityName" value="${deliveryOrderFunctionaryDto.goodsfacilityName}" placeholder="물품/시설 명" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="classifyRentalState" class="col-sm-3 control-label">대여/반납 상태</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="classifyRentalState" value="${deliveryOrderFunctionaryDto.classifyRentalState}" placeholder="대여/반납 상태" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="citizenId" class="col-sm-3 control-label">배달 요청 시민 ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="citizenId" value="${deliveryOrderFunctionaryDto.citizenId}" placeholder="배달 요청 시민 ID" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="sendAddress" class="col-sm-3 control-label">보내는 주소</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="sendAddress" value="${deliveryOrderFunctionaryDto.sendAddressSido} ${deliveryOrderFunctionaryDto.sendAddressSigungu} ${deliveryOrderFunctionaryDto.sendAddressEupmyeon} ${deliveryOrderFunctionaryDto.sendAddressSangse}" placeholder="보내는 주소" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="receiveAddress" class="col-sm-3 control-label">받는 주소</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="receiveAddress" value="${deliveryOrderFunctionaryDto.receiveAddressSido} ${deliveryOrderFunctionaryDto.receiveAddressSigungu} ${deliveryOrderFunctionaryDto.receiveAddressEupmyeon} ${deliveryOrderFunctionaryDto.receiveAddressSangse}" placeholder="받는 주소" readonly>
									</div>
								</div>
								
								<hr/>
								<div class="form-group">
									<label for="functionaryId" class="col-sm-3 control-label">의뢰신청 공무원 ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="functionaryId" id="functionaryId" value="${deliveryOrderFunctionaryDto.functionaryId}" placeholder="의뢰신청 공무원 ID" readonly>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">의뢰할 대행업체 선택</label>
									<div class="col-sm-9">
										<!-- <input type="text" class="form-control" name="agencyCode" id="agencyCode" placeholder="의뢰할 대행업체 코드"> -->
										<select id="agencySelect" class="form-control">
											<c:forEach var="agencyList" items="${listAgencyNameAndBusinesstypeName}">
												<option id="agencySelectOption">${agencyList}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyCode" class="col-sm-3 control-label">의뢰할 대행업체 코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyCode" id="agencyCode" placeholder="의뢰할 대행업체 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyName" class="col-sm-3 control-label">의뢰할 대행업체명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyName" id="agencyName" placeholder="의뢰할 대행업체명" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyBusinesstypeCode" class="col-sm-3 control-label">대행업체 업종 분류 코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="agencyBusinesstypeCode" placeholder="대행업체 업종 분류 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyBusinesstypeName" class="col-sm-3 control-label">대행업체 업종 분류명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="agencyBusinesstypeName" placeholder="대행업체 업종 분류명" readonly>
									</div>
								</div>
								<div class="text-center">
									<button id="insertBtn" type="button" class="btn btn-primary">입력 완료</button>
								</div>
							</form>
						</div>
					</div>
					
					<!-- End Content -->
				</div>
				<div class="col-sm-1"></div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>
	</body>
</html>