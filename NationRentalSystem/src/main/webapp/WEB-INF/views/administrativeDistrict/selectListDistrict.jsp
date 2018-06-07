<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>행정구역 등록</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
					<div class="text-center">
						<h1>행정구역 등록</h1>
					</div>
					<h3><a href="${pageContext.request.contextPath}/insertSido">시도 등록하기</a></h3><br>
					<h3><a href="${pageContext.request.contextPath}/injeungSigungu">시군구 등록하기</a></h3><br> 
					<h3><a href="${pageContext.request.contextPath}/insertEupmyeon">읍면동 등록하기</a></h3><br><br><br>
					
					<table class="table table-striped">
						<thead>
							<tr>
								<td width="20%">읍면동 코드</td>
								<td width="30%">시도</td>
								<td width="25%">시군구</td>
								<td width="25%">읍면동</td>								
							</tr>
						</thead>
						<tbody>									
							<c:forEach var="SidoSigunguEupmyeonDto" items="${SidoSigunguEupmyeonDtoList}">
								<tbody>
									<tr>
										<th>${SidoSigunguEupmyeonDto.eupmyeonCode}</th>
										<th>${SidoSigunguEupmyeonDto.sidoName}</th>
										<td>${SidoSigunguEupmyeonDto.sigunguName}</td>
										<td>${SidoSigunguEupmyeonDto.eupmyeonName}</td>																								
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