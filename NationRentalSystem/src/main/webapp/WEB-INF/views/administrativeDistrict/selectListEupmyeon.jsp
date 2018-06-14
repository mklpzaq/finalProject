<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>행정구역 읍면동 목록</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="/WEB-INF/views/module/leftAdministrativeDistrict/leftEupmyeonDistrictInfo.jsp"/>
				</div>
				<div class="col-sm-8"><br>
					<!-- Begin Content -->
					<div class="panel panel-default">	
						<div class="panel-body text-center">
							<div class="text-center">
								<h3>행정구역 읍면동 등록</h3>
							</div>
							<table class="table table-striped">
								<thead>
									<tr>
										<td width="10%">읍면동 코드</td>
										<td width="10%">시도 코드</td>
										<td width="15%">시도</td>
										<td width="10%">중분류 코드</td>
										<td width="15%">시군구</td>
										<td width="10%">소분류 코드</td>
										<td width="15%">읍면동</td>
										<td width="15%">삭제</td>									
									</tr>
								</thead>
								<tbody>									
									<c:forEach var="districtDtoList" items="${districtDtoList}">
										<tbody>
											<tr>
												<th>${districtDtoList.eupmyeonCode}</th>
												<th>${districtDtoList.sidoCode}</th>
												<th>${districtDtoList.sidoName}</th>
												<th>${districtDtoList.sigunguMiddleCode}</th>
												<th>${districtDtoList.sigunguName}</th>
												<th>${districtDtoList.eupmyeonMiddleCode}</th>
												<th>${districtDtoList.eupmyeonName}</th>
												<th></th>																					
											</tr>
										</tbody>
									</c:forEach>	
								</tbody>
							</table>
						</div>
					</div>
					<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>
	</body>
</html>