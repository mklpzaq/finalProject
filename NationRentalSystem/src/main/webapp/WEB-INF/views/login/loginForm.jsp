<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>login Form</title>
		<script>
			$(document).ready(function(){
				/* 자동 로그인 버튼 */
				$('#citizenLoginBtn').click(function(){
					$('#citizenLoginForm').submit();
				});
				$('#functionaryLoginBtn').click(function(){
					$('#functionaryLoginForm').submit();
				});
				$('#adminLoginBtn').click(function(){
					$('#adminLoginForm').submit();
				});
				$('#employeeLoginBtn').click(function(){
					$('#employeeLoginForm').submit();
				});
				$('#homeLogoutBtn').click(function(){
					$(location).attr('href', './logout');
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="../module/backgroundImg/backgroundImg.jsp"/>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="margin:15px 0 0 0;">
			<div class="row">
				<div class="col-sm-2">
					<%-- <jsp:include page="../module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->
		
					<div class="panel panel-default text-center">
						<div class="panel-body">
							<h3>로그인</h3>
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
									<button type="submit" class="btn btn-primary btn-lg">입력 완료</button>
								</div>
							</form>
							<hr/>
							<h3 class="text-center">자동 로그인</h3>
							<h4>(각각의 권한마다 상단의 nav창이 달라집니다.)</h4>
							<h4>(버튼 클릭시 로그인 되며, Home화면으로 이동됩니다.)</h4>
							<hr/>
							<form id="citizenLoginForm" action="${pageContext.request.contextPath}/login" method="post">
								<input type="hidden" name="memberId" id="memberId" value="citizen">
								<input type="hidden" name="memberPw" id="memberPw" value="citizen">
							</form>
							<form id="functionaryLoginForm" action="${pageContext.request.contextPath}/login" method="post">
								<input type="hidden" name="memberId" id="memberId" value="functionary">
								<input type="hidden" name="memberPw" id="memberPw" value="functionary">
							</form>
							<form id="adminLoginForm" action="${pageContext.request.contextPath}/login" method="post">
								<input type="hidden" name="memberId" id="memberId" value="admin">
								<input type="hidden" name="memberPw" id="memberPw" value="admin">
							</form>
							<form id="employeeLoginForm" action="${pageContext.request.contextPath}/login" method="post">
								<input type="hidden" name="memberId" id="memberId" value="employee">
								<input type="hidden" name="memberPw" id="memberPw" value="employee">
							</form>
							
							<button id="citizenLoginBtn" type="button" class="btn btn-primary btn-lg">시민 로그인</button> &nbsp;&nbsp;
							<button id="functionaryLoginBtn" type="button" class="btn btn-primary btn-lg">공무원 로그인</button> &nbsp;&nbsp;
							<button id="adminLoginBtn" type="button" class="btn btn-primary btn-lg">관리자 로그인</button> &nbsp;&nbsp;
							<button id="employeeLoginBtn" type="button" class="btn btn-primary btn-lg">직원 로그인</button> &nbsp;&nbsp;
							<button id="homeLogoutBtn" type="button" class="btn btn-danger btn-lg">로그아웃</button>
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