<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>행정구역 시군구 목록</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<%-- <jsp:include page="./module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
					<div class="text-center">
						<h1>행정구역 시군구 목록</h1>
					</div>
					<!-- 버튼으로 만들고 싶음 -->
					<a href="${pageContext.request.contextPath}/selectListDistrict">행정구역 전체목록</a>/
					<a href="${pageContext.request.contextPath}/insertSigungu">시군구 추가</a><br><br><br>
					
					<table class="table table-striped">
						<thead>
							<tr>
								<td width="15%">시군구 코드</td>
								<td width="15%">시도 코드</td>
								<td width="25%">시도</td>
								<td width="15%">중분류 코드</td>
								<td width="30%">시군구</td>								
							</tr>
						</thead>
						<tbody>									
							<c:forEach var="sigunguList" items="${sigunguList}">
								<tbody>
									<tr>
										<th>${sigunguList.sigunguCode}</th>
										<th>${sigunguList.sidoCode}</th>
										<th>${sigunguList.sidoName}</th>
										<th>${sigunguList.sigunguMiddleCode}</th>
										<th>${sigunguList.sigunguName}</th>																					
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