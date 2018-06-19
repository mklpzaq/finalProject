<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>Insert Application</title>

	<script>
		function changehtml(){
			var property = $("#searchOption").val();
			var show = $("#keyword");
			if(property=="order_date"){
				$("#keyword").html('<input type="date" name="keyword">~<input type="date" name="keyword">');
			}else {
				$("#keyword").html('<input type="text" name="keyword">');
			}
		}	
	
	</script>

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
			<div class="panel panel-default">
					<div class="panel-body">
						<h2>대여 & 예약 폼</h2>
						<hr/>
						<div class="panel panel-default">
						<div class="panel-body text-center">
							<form id="insertForm" class="form-horizontal" action="${pageContext.request.contextPath}/applicationRentFrom" method="post">
								<div class="form-group">
									<label for="application" class="col-sm-2 control-label">시설 & 물품 관리코드</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="goodsfacilityCode" name="goodsfacilityCode" value="${goodsFacilityApplication.goodsfacilityCode}">			    	
								    </div>
								</div>
								<div class="form-group">
									<label for="application" class="col-sm-2 control-label">행정기관</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="adminagencyCode" name="adminagencyCode" value="${goodsFacilityApplication.adminagencyCode}">			    	
								    </div>
								</div>
								<div class="form-group">
									<label for="application" class="col-sm-2 control-label">시설 & 물품명</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="goodsfacilityName" name="goodsfacilityName" value="${goodsFacilityApplication.goodsfacilityName}">			    	
								    </div>
								</div>
								<div class="form-group">
									<label for="application" class="col-sm-2 control-label">신청인ID</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="citizenId" name="citizenId" value="${memberDto.memberId}">			    	
								    </div>
								</div>
								<div class="form-group">
									<label for="application" class="col-sm-2 control-label">신청인이름</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="citizenName" name="citizenName" value="${memberDto.memberName}">			    	
								    </div>
								</div>
								<div class="form-group">
									<label for="application" class="col-sm-2 control-label">신청인핸드폰</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="citizenPhone" name="citizenPhone" value="${memberDto.memberPhone}">			    	
								    </div>
								</div>
								<div class="form-group">
									<label for="application" class="col-sm-2 control-label">대관시작일</label>
								    <div class="col-sm-10">
								    	<input type="date" class="form-control" id=goodsfacilityRentalDateStart name="goodsfacilityRentalDateStart">			    	
								    </div>
								</div>
								<div class="form-group">
									<label for="application" class="col-sm-2 control-label">대관종료일</label>
								    <div class="col-sm-10">
								    	<input type="date" class="form-control" id=goodsfacilityRentalDayEnd name="goodsfacilityRentalDayEnd">			    	
								    </div>
								</div>
								<div class="form-group">
								<label for="goodsfacility" class="col-sm-2 control-label">배달신청여부</label>
							    	<div class="col-sm-10">						    	
								   	 	<select id="goodsfacilityRentalIsOrderedDelivery" name="goodsfacilityRentalIsOrderedDelivery" class="form-control">													
												 <option>네</option>
												 <option>아니요</option>						
										</select>		    		    	
						   		 	</div>
								</div>
								
								<div class="form-group">
									 <div class="col-sm-10">	
										<button type="submit" id="insertApplication">대여 & 예약 신청</button>	
									</div>
								</div>						
							
							</form>						
						</div>
						
							<div>
								<form action="<%=request.getContextPath()%>/orderList" method="get">
									<select id="searchOption" name="searchOption" onclick="changehtml();">											
										<option value="member_id" <c:if test="${member_id == 'member_id'}">selected</c:if>>주문아이디</option>
										<option value="item_name"  <c:if test="${item_name == 'item_name'}">selected</c:if>>주문제품</option>											
										<option value="order_date" <c:if test="${order_date == 'order_date'}">selected</c:if>>주문날짜</option>		
									</select>
									<dr id="keyword"></dr>
									<%-- <input id="keyword" name="keyword" value="${keyword}"> --%>
									<input type="submit" value="검색버튼" >
								</form>
							</div>
						
						
						</div>					
					
					</div>
			</div>			
			<!-- End Content -->
			</div>
	<div class="col-sm-2"></div>
	</div>
</body>
</html>