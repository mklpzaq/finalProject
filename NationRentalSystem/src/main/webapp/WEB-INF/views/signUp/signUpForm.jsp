<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Sign Up</title>
	</head>
	<body>
		<jsp:include page="../module/backgroundImg/backgroundImg.jsp"/>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="margin:15px 0 0 0; height:680px;">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<%-- <jsp:include page="../module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
					<div class="panel panel-default text-center">
						<div class="panel-body">
							<h3>회원가입</h3>
							<hr/>
							<a style="margin:0 8px" href="${pageContext.request.contextPath}/insertCitizen" class="btn btn-primary btn-lg" role="button">시민 회원가입</a>
							<a style="margin:0 8px" href="${pageContext.request.contextPath}/injeungAdministrator" class="btn btn-primary btn-lg" role="button">관리자 등록</a> 
							<a style="margin:0 8px" href="${pageContext.request.contextPath}/insertFunctionary" class="btn btn-primary btn-lg" role="button">공무원 회원가입</a>
							<a style="margin:0 8px" href="${pageContext.request.contextPath}/goInjeungAgencyEmployee" class="btn btn-primary btn-lg" role="button">직원 회원가입</a>
							<!-- 주소API 연습중 -->
							<%-- <a href="${pageContext.request.contextPath}/addr">주소테스트</a> --%>
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