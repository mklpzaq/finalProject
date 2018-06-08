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
	<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="/WEB-INF/views/module/left/leftnavi.jsp"/>
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->
					
				<div class="text-center">
					<h1>대행업체 등록</h1>
					<h2>Nation Integrated Reserve and Rental System</h2>
					<P>The time on the server is ${serverTime}.</P>
				</div>
				
				<form class="form-horizontal" action="${pageContext.request.contextPath}/insertAnnualfeePakage" id="insertannualfeePakageForm" method="post">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">패키지/연회비 명</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="annualfeePakageName" name="annualfeePakageName" placeholder="패키지/연회비 명">							
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">연회비 구입금액</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="annualfeePakagePrice" name="annualfeePakagePrice" placeholder="연회비 구입금액">
							</div>
						</div>					
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">패키지/연회비 상세설명</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="annualfeePakageTextSangse" name="annualfeePakageTextSangse" placeholder="패키지/연회비 상세설명">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">할인율%</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="annualfeePakageDiscountRate" name="annualfeePakageDiscountRate" placeholder="할인율%">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">적용되는 행정기관코드</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="adminagencyCode" name="adminagencyCode" placeholder="적용되는 행정기관코드">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">적용되는 행정기관코드</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="adminagencyCode" name="adminagencyCode" placeholder="적용되는 행정기관코드">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">적용되는 행정기관코드</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="adminagencyCode" name="adminagencyCode" placeholder="적용되는 행정기관코드">
							</div>
						</div>
								
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" id="btn" class="btn btn-default">Sign in</button>
							</div>
						</div>
					</form>
						
				</div>
			</div>
			</div>
	
	</body>
</html>