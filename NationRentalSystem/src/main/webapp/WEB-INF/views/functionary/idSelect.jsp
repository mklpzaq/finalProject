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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
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
					<h1>공무원회원 가입</h1>
					<h2>Nation Integrated Reserve and Rental System</h2>
					<P>The time on the server is ${serverTime}.</P>
				</div>
				
				
				<form class="form-horizontal" action="${pageContext.request.contextPath}/idSelect" id="idSelect" method="post">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">회원 이름</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="functionaryName" name="functionaryName" placeholder="가입한 분의 성함을 입력해주십시오" >													
						</div>						
					</div>					 
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">가입시 등록한 이메일</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="functionaryEmail" name="functionaryEmail" placeholder="가입시 등록한 email을 입력해주세요" >													
						</div>						
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">가입시 등록한 연락처</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="functionaryPhone" name="functionaryPhone" placeholder="가입시 등록한 연락처를 입력해주세요" >													
						</div>						
					</div>				
				</form>									
				</div>				
			</div>
		</div>
	
	</body>
</html>