<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>3차 카테고리 목록</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="/WEB-INF/views/module/leftGoodsfacilityCategory/leftGoodsfacilityCategoryThreeInfo.jsp"/>
				</div>
				<div class="col-sm-8"><br>
					<!-- Begin Content -->
					<div class="panel panel-default">
						<div class="panel-body text-center">
						<div class="text-center">
							<h1>3차 카테고리 목록</h1>
						</div>
						<table class="table table-striped">
							<thead>
								<tr>
									<td width="10%">1차 코드</td>
									<td width="20%">물품/시설</td>
										<td width="10%">2차 코드</td>
									<td width="20%">물품/시설</td>
									<td width="10%">3차 코드</td>
									<td width="20%">물품/시설</td>
									<td width="10%">삭제</td>									
								</tr>
							</thead>
							<tbody>									
								<c:forEach var="goodsFacilityCategoryDtoList" items="${goodsFacilityCategoryDtoList}">
									<tbody>
										<tr>
											<th>${goodsFacilityCategoryDtoList.goodsfacilityOneCode}</th>
											<th>${goodsFacilityCategoryDtoList.goodsfacilityOneName}</th>
											<th>${goodsFacilityCategoryDtoList.goodsfacilityTwoCode}</th>
											<th>${goodsFacilityCategoryDtoList.goodsfacilityTwoName}</th>
											<th>${goodsFacilityCategoryDtoList.goodsfacilityThreeCode}</th>
											<th>${goodsFacilityCategoryDtoList.goodsfacilityThreeName}</th>
											<th><a href="${pageContext.request.contextPath}/deleteGoodsFacilityCategoryThree?goodsfacilityThreeCode=${goodsFacilityCategoryDtoList.goodsfacilityThreeCode}">삭제</a></th>																				
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