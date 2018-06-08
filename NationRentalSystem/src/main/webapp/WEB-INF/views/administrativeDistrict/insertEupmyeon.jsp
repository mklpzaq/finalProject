<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>행정구역 시군구등록</title>
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
						<h1>행정구역 시군구 등록</h1>
					</div>
						<div class="panel panel-default">
							<div class="panel-body text-center">
								<form id="insertDistrict" class="form-horizontal" action="${pageContext.request.contextPath}/insertSigungu" method="post">
									<div class="form-group">
										<label for="sigunguCode" class="col-sm-3 control-label">시도 선택</label>
										<div class="col-sm-9">
											<select id=districtDtoList name="sidoCode">
												<option>시도선택</option>
												<c:forEach var="districtDtoList" items="${districtDtoList}">
													<option value="${districtDtoList.sidoCode}">${districtDtoList.sidoName}</option>
												</c:forEach>
											</select>											
										</div>
									</div>
										<div class="form-group">
										<label for="sigunguCode" class="col-sm-3 control-label">시군구 선택</label>
										<div class="col-sm-9">
											<select id=districtDtoList name="sigunguCode">
												<option>시도선택</option>
												<c:forEach var="districtDtoList" items="${districtDtoList}">
													<option value="${districtDtoList.sigunguCode}">${districtDtoList.sigunguName}</option>
												</c:forEach>
											</select>											
										</div>
									</div>
									<div class="form-group">
										<label for="sigunguCode" class="col-sm-3 control-label">소분류 코드</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="sigunguMiddleCode" id="sigunguMiddleCode" placeholder="소분류 코드를 입력해주세요.">
										</div>
									</div>
									<div class="form-group">
										<label for="sigunguName" class="col-sm-3 control-label">시군구 명</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="sigunguName" id="sigunguName" placeholder="읍면동 이름을 입력해주세요.">
										</div>
									</div>
			
									<br>
									<div class="form-group">
										<div class="col-sm-12">
											<button type="submit" id="insertButton" class="btn btn-default">등록하기</button>
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
		<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>
	</body>
</html>