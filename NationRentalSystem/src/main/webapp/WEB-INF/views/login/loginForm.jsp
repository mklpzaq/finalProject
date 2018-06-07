<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>login Form</title>
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
		
		
		
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="text-center">로그인</h3>
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
					<p>
						로그인 샘플 :<br/>
						관리자 : admin / admin<br/>
						시민 : citizen / citizen<br/>
						대행업체 직원 : employee / employee<br/>
						공무원 : functionary / functionary
					</p>
		
				<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		
	</body>
</html>