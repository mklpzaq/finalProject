<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Insert title here</title>
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
							<h3 class="text-center">회원 정보</h3>
							<hr/>
							<form action="${pageContext.request.contextPath}/updateFunctionnary" method="post">
								<div class="form-group">
									<label class="col-sm-2 control-label">ID</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="functionaryId" value="${returnfunctionaryDto.functionaryId}" readonly="readonly">
									</div>
								</div>
									<br></br>
								<div class="form-group">
									<label class="col-sm-2 control-label">소속행정기관</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="adminagencyCode" value="${returnfunctionaryDto.adminagencyCode}">
									</div>
								</div>
									<br></br>
								<div class="form-group">
									<label class="col-sm-2 control-label">이름</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="functionaryName" value="${returnfunctionaryDto.functionaryName}">
									</div>
								</div>
									<br></br>
								<div class="form-group">
									<label class="col-sm-2 control-label">전화번호</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="functionaryPhone" value="${returnfunctionaryDto.functionaryPhone}">
									</div>
								</div>
									<br></br>
								<div class="form-group">
									<label class="col-sm-2 control-label">Email</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="functionaryEmail" value="${returnfunctionaryDto.functionaryEmail}">
									</div>
								</div>	
									<br></br>		
								<div class="form-group">
									<div class="col-sm-12 text-center">
										<button type="submit" class="btn btn-default">정보수정</button>
									</div>	
								</div>
							</form>
						<!-- End Content -->
						</div>
						<div class="col-sm-2"></div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>
	</body>
</html>