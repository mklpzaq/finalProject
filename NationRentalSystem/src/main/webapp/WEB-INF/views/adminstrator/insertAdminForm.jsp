<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>관리자 등록</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		
		<!-- 
			< 기능 정의 >
			1.아이디는 8글자 이상 12글자 이하 
			2.아이디는 숫자까지만 포함
			3.비밀번호는 8글자 이상 12글자 이하 
			4.비밀번호는 특수문자와 숫자조합을 무조건 해야 한다. 
			5.중복된 아이디값은 쓸 수 없다.
			6.필수정보 입력 데이터는 아이디 비밀번호 주민번호 주소 이름 핸드폰번호 이다.					
		 -->
		
<!-- 		<script>
			$(document).ready(function(){
				$('#adminId').keyup(function(){
					if($('#adminId').val().length >= 8){
						$('#adminId').parent().removeClass('has-success has-feedback').addClass('has-error has-feedback');
						$('#idIcon').removeClass('glyphicon glyphicon-ok form-control-feedback').addClass('glyphicon glyphicon-remove form-control-feedback');
						$('#idHelper').text('ID를 8자 이상 입력해주세요.');
					}else{
						$('#adminId').parent().removeClass('has-error has-feedback').addClass('has-success has-feedback');
						$('#idIcon').removeClass('glyphicon glyphicon-remove form-control-feedback').addClass('glyphicon glyphicon-ok form-control-feedback');
						$('#idHelper').text('');
					}
				});
				
				$('#adminPw').keyup(function(){
					if($('#adminPw').val().length >= 8){
						$('#adminPw').parent().removeClass('has-success has-feedback').addClass('has-error has-feedback');
						$('#pwIcon').removeClass('glyphicon glyphicon-ok form-control-feedback').addClass('glyphicon glyphicon-remove form-control-feedback');
						$('#pwHelper').text('PW를 8자 이상 입력해주세요.');
					}else{
						$('#adminPw').parent().removeClass('has-error has-feedback').addClass('has-success has-feedback');
						$('#pwIcon').removeClass('glyphicon glyphicon-remove form-control-feedback').addClass('glyphicon glyphicon-ok form-control-feedback');
						$('#pwHelper').text('');
					}
				});
					
				$('#adminPwCheck').keyup(function(){
					if($('#adminPwCheck').val() != $('#adminPw').val()){
						$('#adminPwCheck').parent().removeClass('has-success has-feedback').addClass('has-error has-feedback');
						$('#pwCheckIcon').removeClass('glyphicon glyphicon-ok form-control-feedback').addClass('glyphicon glyphicon-remove form-control-feedback');
						$('#pwCheckHelper').text('입력한 PW와 동일하게 입력해주세요.');
					}else{
						$('#memberPwCheck').parent().removeClass('has-error has-feedback').addClass('has-success has-feedback');
						$('#pwCheckIcon').removeClass('glyphicon glyphicon-remove form-control-feedback').addClass('glyphicon glyphicon-ok form-control-feedback');
						$('#pwCheckHelper').text('');
					}
				});
		</script> -->
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="/WEB-INF/views/module/left/leftnavi.jsp"/>
				</div>
				<div class="col-sm-8">
					<div class="text-center">
						<h1>관리자 등록</h1>
						<h2>Nation Integrated Reserve and Rental System</h2>
					</div>
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-2"></div>
							<div class="col-sm-8">
								<!-- Begin Content -->
									<div class="panel panel-default">
										<div class="panel-body text-center">
											<form id="insertAdministrator" class="form-horizontal" action="${pageContext.request.contextPath}/insertAdministrator" method="post">
												<div class="form-group">
													<label for="adminId" class="col-sm-3 control-label">ID</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="adminId" id="adminId" placeholder="ID를 입력해주세요.">
														<span id="idIcon"></span>
														<span id="idHelper"></span>
													</div>
												</div>
												<div class="form-group">
													<label for="adminPw" class="col-sm-3 control-label">PW</label>
													<div class="col-sm-9">
														<input type="password" class="form-control" name="adminPw" id="adminPw" placeholder="PW를 입력해주세요.">
														<span id="pwIcon"></span>
														<span id="pwHelper"></span>
													</div>
												</div>
												<div class="form-group">
													<label for="adminPwCheck" class="col-sm-3 control-label">PW확인</label>
													<div class="col-sm-9">
														<input type="password" class="form-control" id="adminPwCheck" placeholder="PW를 다시 입력해주세요.">
														<span id="pwCheckIcon"></span>
														<span id="pwCheckHelper"></span>
													</div>
												</div>
												<div class="form-group">
													<label for="adminName" class="col-sm-3 control-label">이름</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="adminName" placeholder="이름을 입력해주세요.">
													</div>
												</div>
												<div class="form-group">
													<label for="functionaryNum" class="col-sm-3 control-label">공무원번호</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="functionaryNum" placeholder="공무원번호를 입력해주세요.">
													</div>
												</div>
												<div class="form-group">
													<label for="adminPhone" class="col-sm-3 control-label">전화번호</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="adminPhone" placeholder="전화번호를 입력해주세요.">
													</div>
												</div>
												<br>
												<div class="form-group">
													<div class="col-sm-12">
														<button type="submit" id="insertButton" class="btn btn-default">등록하기</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								<!-- End Content -->
							</div>
							<div class="col-sm-2"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>