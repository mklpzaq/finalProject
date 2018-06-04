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
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="../module/left/leftnavi.jsp"/>
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->
				
				
					<a href="${pageContext.request.contextPath}/insertCitizen">시민 회원가입</a> | 
					<a href="${pageContext.request.contextPath}/insertAdminstrator">관리자 회원가입</a> | 
					<a href="${pageContext.request.contextPath}/insertFunctionary">공무원 회원가입</a> | 
					<a href="${pageContext.request.contextPath}/insertAgencyEmployee">직원 회원가입</a>
				
				
				<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		
	</body>
</html>