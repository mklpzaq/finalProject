<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>View Agency Employee Info</title>
		<style>
		/* .infoText{padding:12px;} */
		
		</style>
	</head>
	<body>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="../module/leftAgencyEmployee/leftAgencyEmployeeInfo.jsp"/>
				</div>
				<div style="padding:15px;" class="col-sm-8">
					<!-- Begin Content -->
					
					<div class="panel panel-default">
						<div class="panel-body">
							<!-- agencyEmployeeDto -->
							<h3 class="text-center">회원 정보</h3>
							<hr/>
							<div class="row">
								<div class="col-sm-3">소속 대행업체명</div>
								<div class="cos-sm-9">${agencyEmployeeDto.agencyName}</div>
							</div>
							
							
							<%-- <div class="bs-example" data-example-id="horizontal-dl">
								<dl>
									<dt class="col-sm-3 infoText">소속 대행업체명</dt>
									<dd class="col-sm-9 infoText" >${agencyEmployeeDto.agencyName}</dd>
									<dt class="col-sm-3 infoText">직원 아이디</dt>
									<dd class="col-sm-9 infoText">${agencyEmployeeDto.agencyEmployeeId}</dd>
									<dt class="col-sm-3 infoText">직원 비밀번호</dt>
									<dd class="col-sm-9 infoText">${agencyEmployeeDto.agencyEmployeePw}</dd>
									<dt class="col-sm-3 infoText">직원 이름</dt>
									<dd class="col-sm-9 infoText">${agencyEmployeeDto.agencyEmployeeName}</dd>
									<dt class="col-sm-3 infoText">직원 전화번호</dt>
									<dd class="col-sm-9 infoText">${agencyEmployeeDto.agencyEmployeePhone}</dd>
									<dt class="col-sm-3 infoText">직원 이메일</dt>
									<dd class="col-sm-9 infoText">${agencyEmployeeDto.agencyEmployeeEmail}</dd>
									<dt class="col-sm-3 infoText">가입 일자</dt>
									<dd class="col-sm-9 infoText">${agencyEmployeeDto.agencyEmployeeDateJoin}</dd>
								</dl>
							</div> --%>
						</div>
					</div>
				<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>
		
	</body>
</html>