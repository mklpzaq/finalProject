<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>대행업체 업종 목록</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="/WEB-INF/views/module/leftAgencyBusinesstype/leftAgencyBusinesstype.jsp"/>
				</div>
				<div class="col-sm-8">
					<div class="text-center">
						<h1>대행업체 업종 목록</h1>
					</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<td width="20%">업종코드</td>
								<td width="40%">업종명</td>
								<td width="20%">수정</td>
								<td width="20%">삭제</td>									
							</tr>
						</thead>
						<tbody>									
							<c:forEach var="agencyBusinesstypeDto" items="${agencyBusinesstypeDto}">
								<tbody>
									<tr>
										<th>${agencyBusinesstypeDto.agencyBusinesstypeCode}</th>
										<th>${agencyBusinesstypeDto.agencyBusinesstypeName}</th>
										<th><a href="${pageContext.request.contextPath}/updateAgencyBusinesstypeForm?agencyBusinesstypeCode=${agencyBusinesstypeDto.agencyBusinesstypeCode}">수정</a></th>																					
										<th><a href="${pageContext.request.contextPath}/deleteAgencyBusinesstype?agencyBusinesstypeCode=${agencyBusinesstypeDto.agencyBusinesstypeCode}">삭제</a></th>
									</tr>
								</tbody>
							</c:forEach>									
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</div>	
	</body>
</html>