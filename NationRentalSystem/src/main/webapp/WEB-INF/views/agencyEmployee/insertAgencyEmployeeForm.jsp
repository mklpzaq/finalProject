<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Insert Agency Employee Form</title>
	</head>
	<body>
		
		
		<div class="panel panel-default">
			<div class="panel-body">
				<h3 class="text-center">대행업체 직원 회원가입</h3>
				<hr/>
				<form class="form-horizontal" action="${pageContext.request.contextPath}/login" method="post">
					<div class="form-group">
						<label for="memberId" class="col-sm-3 control-label">회원 ID</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="memberId" id="memberId" placeholder="회원 ID 입력">
						</div>
					</div>
					<div class="form-group">
						<label for="memberPw" class="col-sm-3 control-label">회원 PW</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="memberPw" id="memberPw" placeholder="회원 PW 입력">
						</div>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-default">입력 완료</button>
					</div>
				</form>
			</div>
		</div>
		
		
	</body>
</html>