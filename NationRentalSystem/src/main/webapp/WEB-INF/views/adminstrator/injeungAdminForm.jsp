<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>관리자 인증페이지</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
						<h1>관리자 인증</h1>
						<h2>Nation Integrated Reserve and Rental System</h2>
					</div>
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-8">
							<!-- Begin Content -->
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="${pageContext.request.contextPath}/injeungAdministrator" method="post">
										<div class="form-group">
											<label for="adminInjeungNum" class="col-sm-3 control-label">인증번호</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" name="adminInjeungNum" id="adminInjeungNum" placeholder="인증번호를 입력하세요.">
											</div>
										</div>
										<div class="text-center">
											<button type="submit" class="btn btn-default">인증</button>
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
	</body>
</html>