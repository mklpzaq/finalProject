<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Insert title here</title>
	</head>
	
	<body>
	<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
				<div class="row">
					<div class="col-sm-2" style="padding:15px;">
						<jsp:include page="/WEB-INF/views/module/left/leftnavi.jsp"/>
					</div>
					<div class="col-sm-8">
					<!-- Begin Content -->
					
						<div class="text-center">
							<h1>계약된 낙찰업체</h1>
							<h2>Nation Integrated Reserve and Rental System</h2>
							<P>The time on the server is ${serverTime}.</P>
						</div>
																
						<table class="table table-striped">
							<thead>
								<tr>
									<td width="15%">직원ID</td>
									<td width="15%">대행업체명</td>
									<td width="15%">직원이름</td>
									<td width="15%">직원 전화번호</td>
									<td width="20%">직원 이메일</td>
									<td width="20%">직원 가입일자</td>							
								</tr>
							</thead>
							<tbody>									
									<c:forEach var="agencyEmployeeDto" items="${agencyEmployeeDto}">
										<tbody>
											<tr>
												<th>${agencyEmployeeDto.agencyEmployeeId}</th>														
												<th>${agencyEmployeeDto.agencyName}</th>
												<td>${agencyEmployeeDto.agencyEmployeeName}</td>
												<td>${agencyEmployeeDto.agencyEmployeePhone}</td>
												<td>${agencyEmployeeDto.agencyEmployeeEmail}</td>
												<td>${agencyEmployeeDto.agencyEmployeeDateJoin}</td>																																	
											</tr>
										</tbody>
									</c:forEach>									
							</tbody>
						</table>								
					</div>
				</div>					
		</div>	
	</body>
</html>