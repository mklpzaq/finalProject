<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">		
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#btn").click(function(){
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/returnGoodsfacilityInfoCheck",
					data : { goodsfacilityCode : $('#goodsfacilityCode').val() },
					success : function( returnGoodsfacilityInfoDto ){
						if(returnGoodsfacilityInfoDto != null){
							$("#goodsfacilityRentalCode").val(returnGoodsfacilityInfoDto.goodsfacilityRentalCode);	
							$("#citizenId").val(returnGoodsfacilityInfoDto.citizenId);	
							$("#overdueDays").val(returnGoodsfacilityInfoDto.overdueDays);	
							$("#adminagencyCode").val(returnGoodsfacilityInfoDto.adminagencyCode);	
							$("#isRequestedToReturnAsDelivery").val(returnGoodsfacilityInfoDto.isRequestedToReturnAsDelivery);	
							$("#classifyGoodsfacility").val(returnGoodsfacilityInfoDto.classifyGoodsfacility)
						}else {
							alert("이미 반납된 물품입니다");							
						}
					}, error : function(){
			            alert("이미 반납된 물품입니다");
			            $("#goodsfacilityRentalCode").val("");	
						$("#citizenId").val("");	
						$("#overdueDays").val("");	
						$("#adminagencyCode").val("");	
						$("#isRequestedToReturnAsDelivery").val("");	
						$("#classifyGoodsfacility").val("")
					}    
				})
				
			});
			
		});
	
	</script>
	</head>
	
	<body>
		
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		
		<div class="container-fluid" style="height:900px;">
			<jsp:include page="../module/top/navbar.jsp"/>
			<%-- <jsp:include page="../module/top/mainHeader.jsp"/> --%>
			<div class="row" >
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="../module/leftHome/leftHome.jsp"/>
				</div>
				
				<div class="col-sm-8">
					<!-- Begin Content -->
					
					<div style="margin:15px 0 15px 0;" class="panel panel-default">
						<div class="panel-body text-center">
							<h1>대여물품/시설 반납</h1>
						</div>
					</div>
				

					<div class="panel panel-default">
						<div class="panel-body text-center">
							<form id="insertDistrict" class="form-horizontal" action="${pageContext.request.contextPath}/insertReturnGoodsfacilityInfoForm" method="post">
								<div class="form-group">
									<label for="goodsfacilityCode" class="col-sm-3 control-label">물품/시설 개별등록코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityCode" id="goodsfacilityCode" placeholder="">
										<button type="button" id="btn">검색</button>
									</div>
								</div>
								<div class="form-group">
									<label for="goodsfacilityRentalCode" class="col-sm-3 control-label">시설/물품 대여/예약 신청코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="goodsfacilityRentalCode" id="goodsfacilityRentalCode" placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="classifyGoodsfacility" class="col-sm-3 control-label">물품/시설 구분</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="classifyGoodsfacility" id="classifyGoodsfacility">
									</div>
								</div>
								<div class="form-group">
									<label for="citizenId" class="col-sm-3 control-label">시민ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="citizenId" id="citizenId" placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="isRequestedToReturnAsDelivery" class="col-sm-3 control-label">배달반납신청 유무</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="isRequestedToReturnAsDelivery" id="isRequestedToReturnAsDelivery" placeholder="">										
									</div>
									배달반납을 신청하고 일반 반납을 할시에는 변경을 해주시기 바랍니다								
								</div>
								<div class="form-group">
									<label for="overdueDays" class="col-sm-3 control-label">연체일수</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="overdueDays" id="overdueDays" placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label for="adminagencyCode" class="col-sm-3 control-label">행정기관코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="adminagencyCode" id="adminagencyCode" value="${adminagencyCode}" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<label for="stateGoodsCode" class="col-sm-3 control-label">물품상태코드</label>
									<div class="col-sm-9">
										<select name="stateGoodsCode">
											<c:forEach var="stateGoodsDto" items="${list}">
												<option value="${stateGoodsDto.stateGoodsCode}">${stateGoodsDto.stateGoods}</option>											
											</c:forEach>
										</select>										
									</div>
								</div>
								<div class="form-group">
								<div class="col-sm-10">
									<button type="submit" class="form-control-static">반납등록</button>
								</div>	
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