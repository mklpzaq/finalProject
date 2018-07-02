<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">		
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
	</head>

<body>
	<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="height:600px; margin:70px 0;">			
			<div class="col-sm-2"></div>			
			<div class="col-sm-8">				
			<!-- Begin Content -->
				<div class="panel panel-default" style="width:100%; height: 340px;">
					<div class="panel-body">
						<h3 class="text-center">ID 찾기 결과</h3>
						<hr/>
						<h5 class="text-center">해당 이름과 email로 가입된 회원정보</h5>	
						<hr/>		
						<c:if test="${map.adminId != null}">							
							<div class="form-group">
								<label for="inputAdminId" class="col-sm-2 control-label">관리자Id</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="adminId" name="adminId" value="${map.adminId}" readonly="readonly" >													
								</div>						
							</div>
						</c:if>
						<br><br>
						<c:if test="${map.functionaryId != null}">
							<div class="form-group">
								<label for="inputFunctionaryId" class="col-sm-2 control-label">공무원Id</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="functionaryId" name="functionaryId" value="${map.functionaryId}" readonly="readonly">													
								</div>						
							</div>
						</c:if>
						<br>
						<c:if test="${map.agencyEmployeeId != null}">
							<div class="form-group">
								<label for="inputAgencyEmployeeId" class="col-sm-2 control-label">대행업체직원Id</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="agencyEmployeeId" name="agencyEmployeeId" value="${map.agencyEmployeeId}" readonly="readonly">													
								</div>						
							</div>
						</c:if>
						<br>
						<c:if test="${map.citizenId != null}">
							<div class="form-group">
								<label for="inputCitizenId" class="col-sm-2 control-label">시민Id</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputCitizenId" name="inputCitizenId" value="${map.citizenId}" readonly="readonly">													
								</div>						
							</div>
						</c:if>
						<br>
						<div  style="text-align: center;">
							<a href="${pageContext.request.contextPath}/login">
								<button type="button" class="btn btn-warning">로그인 하러가기</button>	
							</a>
						</div>	
					<!-- End Content -->
					</div>
				</div>
			</div>		
			<div class="col-sm-2"></div>			
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>	
	</body>
</html>