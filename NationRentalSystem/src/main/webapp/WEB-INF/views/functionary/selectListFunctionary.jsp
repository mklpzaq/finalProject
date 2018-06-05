<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
						<h1>공무원회원 조회</h1>
						<h2>Nation Integrated Reserve and Rental System</h2>
						<P>The time on the server is ${serverTime}.</P>
					</div>
					
					<table class="table table-striped">
								<thead>
									<tr>
										<td width="20%">이름</td>
										<td width="25%">행정기관코드</td>
										<td width="25%">전화번호</td>
										<td width="30%">이메일</td>										
									</tr>
								</thead>
								<tbody>									
										<c:forEach var="functionaryDto" items="${functionaryDtoList}">
											<tbody>
												<tr>
													<th>${functionaryDto.functionaryName}</th>
													<th>${functionaryDto.adminagencyCode}</th>
													<td>${functionaryDto.functionaryPhone}</td>
													<td>${functionaryDto.functionaryEmail}</td>																							
												</tr>
											</tbody>
										</c:forEach>									
								</tbody>
							</table>
											
				</div>
			</div>
		
		</body>
	</html>
