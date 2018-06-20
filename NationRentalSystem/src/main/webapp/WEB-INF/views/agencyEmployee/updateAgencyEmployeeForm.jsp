<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>View Agency Employee Info</title>
	</head>
	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
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
							<h3 class="text-center">회원 정보 수정</h3>
							<hr/>
							<form id="updateForm" class="form-horizontal" action="${pageContext.request.contextPath}/updateAgencyEmployee" method="post">
								<div class="form-group">
									<label for="agencyName" class="col-sm-3 control-label">소속 대행업체명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyName" value="${agencyEmployeeDto.agencyName}" id="agencyName" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyEmployeeId" class="col-sm-3 control-label">직원 아이디</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyEmployeeId" value="${agencyEmployeeDto.agencyEmployeeId}" id="agencyEmployeeId" placeholder="직원 ID 입력" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyEmployeePw" class="col-sm-3 control-label">직원 비밀번호</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyEmployeePw" value="${agencyEmployeeDto.agencyEmployeePw}" id="agencyEmployeePw" placeholder="직원 PW 입력">
									</div>
								</div>
								<div class="form-group">
									<label for="agencyEmployeeName" class="col-sm-3 control-label">직원 이름</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyEmployeeName" value="${agencyEmployeeDto.agencyEmployeeName}" id="agencyEmployeeName" placeholder="직원 이름 입력" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyEmployeePhone" class="col-sm-3 control-label">직원 전화번호</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyEmployeePhone" value="${agencyEmployeeDto.agencyEmployeePhone}" id="agencyEmployeePhone" placeholder="직원 전화번호 입력">
									</div>
								</div>
								<div class="form-group">
									<label for="agencyEmployeeEmail" class="col-sm-3 control-label">직원 이메일</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyEmployeeEmail" value="${agencyEmployeeDto.agencyEmployeeEmail}" id="agencyEmployeeEmail" placeholder="직원 이메일 입력">
									</div>
								</div>
								<div class="form-group">
									<label for="agencyEmployeeDateJoin" class="col-sm-3 control-label">가입 일자</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyEmployeeDateJoin" value="${agencyEmployeeDto.agencyEmployeeDateJoin}" id="agencyEmployeeDateJoin" placeholder="가입일자" readonly>
									</div>
								</div>
								<div class="text-center">
									<button id="updateBtn" type="submit" class="btn btn-default">회원 정보 수정</button>
								</div>
							</form>
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