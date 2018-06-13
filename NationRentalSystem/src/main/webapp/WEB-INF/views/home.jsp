<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
		<title>Home</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
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
			
			/* 프로젝트 소개 페이지 이동 버튼 */
			$('#projectInfoBtn').click(function(){
				$(location).attr('href', './viewIntroduce');
			});
		});
	
	</script>
	
	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		
		<div class="container-fluid" style="height:900px;">
			<jsp:include page="./module/top/navbar.jsp"/>
			<%-- <jsp:include page="./module/top/mainHeader.jsp"/> --%>
			<div class="row" >
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="./module/leftHome/leftHome.jsp"/>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
					
					<div style="margin:15px 0 15px 0;" class="panel panel-default">
						<div class="panel-body text-center">
							<h1>국가 통합 대여/예약 시스템</h1>
							<h2>Nation Integrated Reserve and Rental System</h2>
						</div>
					</div>
					
					<!-- Begin 자동 로그인 창 -->
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<h3 class="text-center">자동 로그인</h3>
							<h4>(각각의 권한마다 상단의 nav창이 달라집니다.)</h4>
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
							<button id="employeeLoginBtn" type="button" class="btn btn-primary btn-lg">직원 로그인</button>
							
							<%-- <form style="margin:14px;" class="form-horizontal" action="${pageContext.request.contextPath}/login" method="post">
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
									<button type="submit" class="btn btn-default">로그인</button>
								</div>
							</form> --%>
						</div>
					</div>
					<!-- End 자동 로그인 -->
					
					<!-- 프로젝트 소개 페이지 이동 -->
					<div style="margin:15px 0 15px 0;" class="panel panel-default">
						<div class="panel-body text-center">
							<h3 class="text-center">프로젝트 소개 페이지 이동</h3>
							<hr/>
							<button id="projectInfoBtn" type="button" class="btn btn-primary btn-lg">프로젝트 소개</button>
						</div>
					</div>
					
					
					
					
					<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<jsp:include page="./module/bottom/bottomContent.jsp"/>
			
	
	</body>
</html>
