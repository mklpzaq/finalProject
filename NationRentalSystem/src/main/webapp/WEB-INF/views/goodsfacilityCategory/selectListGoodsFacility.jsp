<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>물품/시설 카테고리</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="/WEB-INF/views/module/leftGoodsfacilityCategory/leftGoodsfacilityCategoryInfo.jsp"/>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
					<div class="text-center">
						<h1>물품/시설 카테고리</h1>
					</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<td width="20%">물품/시설 코드</td>
								<td width="30%">1차 물품/시설</td>
								<td width="25%">2차 물품/시설</td>
								<td width="25%">3차 물품/시설</td>								
							</tr>
						</thead>
						<tbody>									
							<c:forEach var="goodsFacilityCategoryDtoList" items="${goodsFacilityCategoryDtoList}">
								<tbody>
									<tr>
										<th>${goodsFacilityCategoryDtoList.goodsfacilityThreeCode}</th>
										<th>${goodsFacilityCategoryDtoList.goodsfacilityOneName}</th>
										<td>${goodsFacilityCategoryDtoList.goodsfacilityTwoName}</td>
										<td>${goodsFacilityCategoryDtoList.goodsfacilityThreeName}</td>																						
									</tr>
								</tbody>
							</c:forEach>	
						</tbody>
					</table>
					<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
			
		</div>
		<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>
	</body>
</html>