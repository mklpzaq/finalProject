<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Insert Agency AfterService Handling Form</title>
		<script>
			/* 첫 화면에서도 바로 적요되게 ajax를 이벤트 발생전에도 실행되게 하였다. */
			$('#AgencyBusinesstypeDtoSelect').change(function() {
				$.ajax({
					type: "POST"
					,url: "/nationRental/selectOneAgencyBusinesstypeForAjax"
					,data: { agencyBusinesstypeName: $('#AgencyBusinesstypeDtoSelect > option:selected').val() }
					,success:function( JSON ) { // result : String, XML, JSON
						alert(JSON);
						/* $('#agencyCode').val(JSON.agencyCode);
						$('#agencyName').val(JSON.agencyName);
						$('#agencyBusinesstypeCode').val(JSON.agencyBusinesstypeCode);
						$('#agencyBusinesstypeName').val(JSON.agencyBusinesstypeName); */
					}
				});
			});
			
			$(document).ready(function(){
				$('#AgencyBusinesstypeDtoSelect').change(function() {
					$.ajax({
						type: "POST"
						,url: "/nationRental/selectOneAgencyBusinesstypeForAjax"
						,data: { agencyBusinesstypeName: $('#AgencyBusinesstypeDtoSelect > option:selected').val() }
						,success:function( JSON ) { // result : String, XML, JSON
							alert(JSON);
							/* $('#agencyCode').val(JSON.agencyCode);
							$('#agencyName').val(JSON.agencyName);
							$('#agencyBusinesstypeCode').val(JSON.agencyBusinesstypeCode);
							$('#agencyBusinesstypeName').val(JSON.agencyBusinesstypeName); */
						}
					});
				});
			});
		</script>
	</head>
	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		
		<div class="container-fluid">
			<jsp:include page="../module/top/navbar.jsp"/>
			<%-- <jsp:include page="./module/top/mainHeader.jsp"/> --%>
			<div class="row" >
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="../module/leftAgencyAfterserviceHandling/leftAgencyAfterserviceHandling.jsp"/>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
					
					<div class="panel panel-default" style="margin:15px;">
						<div class="panel-body">
							<h3 class="text-center">AS 수락 작성</h3>
							<hr/>
							<form id="insertForm" class="form-horizontal" action="${pageContext.request.contextPath}/insertUnitedAfterserviceRequest" method="post">
								<div class="form-group">
									<label for="unitedAfterserviceRequestCode" class="col-sm-3 control-label">AS 요청 코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="unitedAfterserviceRequestCode" value="${unitedAfterserviceRequestDto.unitedAfterserviceRequestCode}" id="unitedAfterserviceRequestCode" placeholder="AS 요청 코드" readonly>
									</div>
								</div>
								<c:if test="${unitedAfterserviceRequestDto.returnGoodsfacilityInfoCode ne 0}">
									<div class="form-group">
										<label for="returnGoodsfacilityInfoCode" class="col-sm-3 control-label">반납 물품/시설 코드</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="returnGoodsfacilityInfoCode" value="${unitedAfterserviceRequestDto.returnGoodsfacilityInfoCode}" id="returnGoodsfacilityInfoCode" placeholder="반납 물품/시설 코드" readonly>
										</div>
									</div>
								</c:if>
								<c:if test="${unitedAfterserviceRequestDto.regularCheckCode ne 0}">
									<div class="form-group">
										<label for="regularCheckCode" class="col-sm-3 control-label">정기점검 코드</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="regularCheckCode" value="${unitedAfterserviceRequestDto.regularCheckCode}" id="regularCheckCode" placeholder="정기점검 코드" readonly>
										</div>
									</div>
								</c:if>
								
								<div class="form-group hidden">
									<label for="adminagencyCode" class="col-sm-3 control-label">지자체기관 코드</label>
									<div class="col-sm-9">
										<input type="hidden" class="form-control" name="adminagencyCode" id="adminagencyCode" value="${unitedAfterserviceRequestDto.adminagencyCode}" placeholder="지자체 기관 코드" readonly>
									</div>
								</div>
								 
								<div class="form-group">
									<label for="adminagencyName" class="col-sm-3 control-label">지자체 기관명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="adminagencyName" id="adminagencyName" value="${unitedAfterserviceRequestDto.adminagencyName}" placeholder="지자체 기관명" readonly>
									</div>
								</div>
								
								
								<div class="form-group hidden">
									<label for="goodsfacilityThreeCode" class="col-sm-3 control-label">물품/시설 카테고리 코드</label>
									<div class="col-sm-9">
										<input type="hidden" class="form-control" name="goodsfacilityThreeCode" id="goodsfacilityThreeCode" value="${unitedAfterserviceRequestDto.goodsfacilityThreeCode}" placeholder="물품/시설 카테고리 코드" readonly>
									</div>
								</div>
								
								
								<div class="form-group">
									<label for="goodsfacilityThreeName" class="col-sm-3 control-label">물품/시설 카테고리 명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityThreeName" id="goodsfacilityThreeName" value="${unitedAfterserviceRequestDto.goodsfacilityThreeName}" placeholder="물품/시설 카테고리 명" readonly>
									</div>
								</div>
								
								<div class="form-group hidden">
									<label for="goodsfacilityCode" class="col-sm-3 control-label hidden">물품/시설 코드</label>
									<div class="col-sm-9">
										<input type="hidden" class="form-control" name="goodsfacilityCode" id="goodsfacilityCode" value="${unitedAfterserviceRequestDto.goodsfacilityCode}" placeholder="물품/시설 코드" readonly>
									</div>
								</div>
							
								<div class="form-group">
									<label for="goodsfacilityName" class="col-sm-3 control-label">물품/시설 명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityName" id="goodsfacilityName" value="${unitedAfterserviceRequestDto.goodsfacilityName}" placeholder="물품/시설 명" readonly>
									</div>
								</div>
									
								<div class="form-group">
									<label for="functionaryId" class="col-sm-3 control-label">AS 요청 공무원 ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="functionaryId" id="functionaryId" value="${unitedAfterserviceRequestDto.functionaryId}" placeholder="AS 요청 공무원 ID" readonly>
									</div>
								</div>
								
								<div class="form-group hidden">
									<label for="stateGoodsCode" class="col-sm-3 control-label hidden">물품/시설 상태 코드</label>
									<div class="col-sm-9">
										<input type="hidden" class="form-control" name="stateGoodsCode" id="stateGoodsCode" value="${unitedAfterserviceRequestDto.stateGoodsCode}" placeholder="물품/시설 상태 코드" readonly>
									</div>
								</div>
								
								<div class="form-group">
									<label for="stateGoods" class="col-sm-3 control-label">물품/시설 상태 명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="stateGoods" id="stateGoods" value="${unitedAfterserviceRequestDto.stateGoods}" placeholder="물품/시설 상태명" readonly>
									</div>
								</div>
								
								<div class="form-group">
									<label for="textCheckResultGoodsfacility" class="col-sm-3 control-label">공무원 검수 판단</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="textCheckResultGoodsfacility" value="${unitedAfterserviceRequestDto.textCheckResultGoodsfacility}" id="textCheckResultGoodsfacility" placeholder="공무원 검수 판단" readonly>
									</div>
								</div>
								
								<div class="form-group hidden">
									<label for="agencyCode" class="col-sm-3 control-label hidden">의뢰한 대행업체 코드</label>
									<div class="col-sm-9">
										<input type="hidden" class="form-control" name="agencyCode" value="${unitedAfterserviceRequestDto.agencyCode}" id="agencyCode" placeholder="의뢰할 대행업체 코드" readonly>
									</div>
								</div>
								
								<div class="form-group">
									<label for="agencyName" class="col-sm-3 control-label">의뢰한 대행업체명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyName" value="${unitedAfterserviceRequestDto.agencyName}" id="agencyName" placeholder="의뢰할 대행업체명" readonly>
									</div>
								</div>
								
								<div class="form-group hidden">
									<label for="agencyBusinesstypeCodeBefore" class="col-sm-3 control-label hidden">대행업체 업종 분류 코드</label>
									<div class="col-sm-9">
										<input type="hidden" class="form-control" value="${unitedAfterserviceRequestDto.agencyBusinesstypeCode}" id="agencyBusinesstypeCodeBefore" placeholder="대행업체 업종 분류 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyBusinesstypeNameBefore" class="col-sm-3 control-label">대행업체 업종 분류명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" value="${unitedAfterserviceRequestDto.stateGoods}" id="agencyBusinesstypeNameBefore" placeholder="대행업체 업종 분류명" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="dateRequestAfterservice" class="col-sm-3 control-label">AS의뢰 요청일</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="dateRequestAfterservice" value="${unitedAfterserviceRequestDto.dateRequestAfterservice}" id="dateRequestAfterservice" placeholder="AS의뢰 요청일" readonly>
									</div>
								</div>
								<hr/>
								<div class="form-group">
									<label for="agencyEmployeeId" class="col-sm-3 control-label">현재 대행업체 직원 ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyEmployeeId" value="${unitedAfterserviceRequestDto.agencyEmployeeId}" id="agencyEmployeeId" placeholder="현재 대행업체 직원 ID" readonly>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">소속 대행업체 업종 선택</label>
									<div class="col-sm-9">
										<!-- <input type="text" class="form-control" name="agencyCode" id="agencyCode" placeholder="의뢰할 대행업체 코드"> -->
										<select id="AgencyBusinesstypeDtoSelect" class="form-control">
											<c:forEach var="AgencyBusinesstypeDto" items="${listAgencyBusinesstypeDto}">
												<option id="AgencyBusinesstypeDtoSelectOption">${AgencyBusinesstypeDto.agencyBusinesstypeName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyBusinesstypeCode" class="col-sm-3 control-label">선택한 대행업체 업종분류 코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyBusinesstypeCode" id="agencyBusinesstypeCode" placeholder="선택한 대행업체 업종분류 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyBusinesstypeName" class="col-sm-3 control-label">선택한 대행업체 업종분류 명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyBusinesstypeName" id="agencyBusinesstypeName" placeholder="선택한 대행업체 업종분류 명" readonly>
									</div>
								</div>
								
								<div class="text-center">
									<button id="insertBtn" type="submit" class="btn btn-primary">AS 요청 수락</button>
								</div>
							</form>
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