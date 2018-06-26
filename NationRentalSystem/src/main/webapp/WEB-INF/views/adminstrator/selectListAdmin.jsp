<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>관리자 계정 관리</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">	
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="/WEB-INF/views/module/leftAdministrator/leftAdministrator.jsp"/>
				</div>
				<div class="col-sm-8"><br>
					<!-- Begin Content -->
					<div class="panel panel-default">	
						<div class="panel-body text-center">
							<div class="text-center">
								<h3>관리자 계정 목록</h3>
							</div>
							<table class="table table-striped">
								<thead>
									<tr>
										<td width="10%">이름</td>
										<td width="20%">아이디</td>
										<td width="25%">공무원번호</td>
										<td width="25%">전화번호</td>
										<td width="20%">등록일자</td>									
									</tr>
								</thead>
								<tbody>									
									<c:forEach var="administratorDto" items="${administratorDtoList}">
										<tbody>
											<tr>
												<th>${administratorDto.adminName}</th>
												<th>${administratorDto.adminId}</th>
												<td>${administratorDto.functionaryNum}</td>
												<td>${administratorDto.adminPhone}</td>	
												<td>${administratorDto.adminDateJoin}</td>																							
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