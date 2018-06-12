<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>대행업체 업종 수정</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<%-- <jsp:include page="./module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">
					<div class="text-center">
						<h1>업종 수정</h1>
					</div>
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-2"></div>
							<div class="col-sm-8">
								<!-- Begin Content -->
									<div class="panel panel-default">
										<div class="panel-body text-center">
											<form id="insertAgencyBusinesstype" class="form-horizontal" action="${pageContext.request.contextPath}/updateAgencyBusinesstype" method="post">
												<div class="form-group">
													<label for="agencyBusinesstypeCode" class="col-sm-3 control-label">업종명</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="agencyBusinesstypeCode" id="agencyBusinesstypeCode" value="${updateAgencyBusinesstype.agencyBusinesstypeCode}" readonly>
													</div>
												</div>
												<div class="form-group">
													<label for="agencyBusinesstypeName" class="col-sm-3 control-label">업종명</label>
													<div class="col-sm-9">
											 			<input type="text" class="form-control" name="agencyBusinesstypeName" id="agencyBusinesstypeName" value="${updateAgencyBusinesstype.agencyBusinesstypeName}" >
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
				</div>
			</div>
		</div>
	</body>
</html>