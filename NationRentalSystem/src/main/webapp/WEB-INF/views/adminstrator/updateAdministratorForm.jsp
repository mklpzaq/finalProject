<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>관리자 정보수정</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script>
		$(document).ready(function(){
			$('#deleteButton').click(function(){
				confirm("삭제 하시겠습니까?");
			});
		});
		</script>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="/WEB-INF/views/module/left/leftnavi.jsp"/>
				</div>
				<div class="col-sm-8">
					<div class="text-center">
						<h1>관리자 정보수정</h1>
						<h2>Nation Integrated Reserve and Rental System</h2>
					</div>
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-2"></div>
							<div class="col-sm-8">
								<!-- Begin Content -->
									<div class="panel panel-default">
										<div class="panel-body text-center">
											<form id="insertAdministrator" class="form-horizontal" action="${pageContext.request.contextPath}/updateAdministrator" method="post">
												<div class="form-group">
													<label for="adminId" class="col-sm-3 control-label">ID</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="adminId" id="adminId" value="${administratorUpdate.adminId}" readonly>
													</div>
												</div>
												<div class="form-group">
													<label for="adminPw" class="col-sm-3 control-label">PW</label>
													<div class="col-sm-9">
														<input type="password" class="form-control" name="adminPw" id="adminPw" value="${administratorUpdate.adminPw}">
														<span id="pwIcon"></span>
														<span id="pwHelper"></span>
													</div>
												</div>
												<div class="form-group">
													<label for="adminPwCheck" class="col-sm-3 control-label">PW확인</label>
													<div class="col-sm-9">
														<input type="password" class="form-control" name="adminPwCheck" id="adminPwCheck" value="${administratorUpdate.adminPw}">
														<span id="pwCheckIcon"></span>
														<span id="pwCheckHelper"></span>
													</div>
												</div>
												<div class="form-group">
													<label for="adminName" class="col-sm-3 control-label">이름</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="adminName" id="adminName" value="${administratorUpdate.adminName}" readonly>
													</div>
												</div>
												<div class="form-group">
													<label for="functionaryNum" class="col-sm-3 control-label">공무원번호</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="functionaryNum" id="functionaryNum" value="${administratorUpdate.functionaryNum}" readonly>
													</div>
												</div>
												<div class="form-group">
													<label for="adminPhone" class="col-sm-3 control-label">전화번호</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="adminPhone" id="adminPhone" value="${administratorUpdate.adminPhone}">
													</div>
												</div>
												<br>
												<div class="form-group">
													<div class="col-sm-12">
														<button type="submit" id="updateButton" class="btn btn-default">수정하기</button>
														<button type="submit" id="deleteButton" class="btn btn-default">삭제하기</button>
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
				</div>
			</div>
		</div>	
	</body>
</html>