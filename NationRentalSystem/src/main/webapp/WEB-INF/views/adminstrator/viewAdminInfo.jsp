<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>관리자 정보</title>
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
				<div class="col-sm-8">
					<div class="text-center">
						<h2>관리자 정보</h2>
					</div>
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-2"></div>
							<div class="col-sm-8">
								<!-- Begin Content -->
									<div class="panel panel-default">
										<div class="panel-body text-center">
											<form id="insertAdministrator" class="form-horizontal" method="post">
												<div class="form-group">
													<label for="adminId" class="col-sm-3 control-label">ID</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="adminId" id="adminId" value="${viewAdminInfo.adminId}" readonly>
													</div>
												</div>
												<div class="form-group">
													<label for="adminPw" class="col-sm-3 control-label">PW</label>
													<div class="col-sm-9">
														<input type="password" class="form-control" name="adminPw" id="adminPw" value="${viewAdminInfo.adminPw}"readonly>
														<span id="pwIcon"></span>
														<span id="pwHelper"></span>
													</div>
												</div>
												<div class="form-group">
													<label for="adminName" class="col-sm-3 control-label">이름</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="adminName" id="adminName" value="${viewAdminInfo.adminName}" readonly>
													</div>
												</div>
												<div class="form-group">
													<label for="functionaryNum" class="col-sm-3 control-label">공무원번호</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="functionaryNum" id="functionaryNum" value="${viewAdminInfo.functionaryNum}" readonly>
													</div>
												</div>
												<div class="form-group">
													<label for="adminPhone" class="col-sm-3 control-label">전화번호</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="adminPhone" id="adminPhone" value="${viewAdminInfo.adminPhone}" readonly>
													</div>
												</div>
												<br>
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
		<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>	
	</body>
</html>