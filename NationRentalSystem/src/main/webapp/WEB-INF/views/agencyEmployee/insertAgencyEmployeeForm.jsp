<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Insert Agency Employee Form</title>
		<script>
			$(document).ready(function(){
				var isIdCheck = 0;
				
				$('#idCheckBtn').click(function(){
					$.ajax({
					      type: "POST"
					      ,url: "${pageContext.request.contextPath}/idCheck"
					      ,data: { agencyEmployeeId: $('#agencyEmployeeId').val() }
					      ,success:function( JSON ) { // result : String, XML, JSON
					    	  if(JSON=='T'){
								alert('중복되지 않는 아이디입니다.');
								/* $(location).attr('href', './insertAgencyEmployee'); */
								/* $('#injeungAgencyEmployeeForm').submit(); */
					    	  }else{
								alert('중복된 아이디입니다. 다른 아이디를 입력해주세요.');
					    	  }
					      }
					});
				});
				
				$('#insertBtn').click(function(){
					//다시한번 유효성 검사를 하고 커밋을 시킨다.
					$.ajax({
						type: "POST"
						,url: "${pageContext.request.contextPath}/idCheck"
						,data: { agencyEmployeeId: $('#agencyEmployeeId').val() }
						,success:function( JSON ) { // result : String, XML, JSON
							if(JSON=='T'){
								$('#insertForm').submit();
							}else{
								alert('중복되거나 잘못된 아이디입니다. 다른 아이디를 입력해주세요.');
							}
						}
					});
				});
				
				
			});
		</script>
	</head>
	<body>
		<jsp:include page="../module/backgroundImg/backgroundImg.jsp"/>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="margin:15px;">
			<div class="row">
				<div class="col-sm-2">
					<%-- <jsp:include page="./module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
		
		
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="text-center">대행업체 직원 회원가입</h3>
							<hr/>
							<form id="insertForm" class="form-horizontal" action="${pageContext.request.contextPath}/insertAgencyEmployee" method="post">
								<div class="form-group">
									<div class="col-sm-9">
										<input type="hidden" class="form-control" name="agencyEmployeeInjeungNum" value="${agencyInfo.agencyEmployeeInjeungNum}" id="agencyEmployeeInjeungNum">
									</div>
								</div>
								<div class="form-group">
									<label for="agencyName" class="col-sm-3 control-label">대행업체 이름</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyName" value="${agencyInfo.agencyName}" id="agencyName"  readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyEmployeeId" class="col-sm-3 control-label">직원 아이디</label>
									<div class="col-sm-9">
										<div class="input-group">
											<input type="text" class="form-control" name="agencyEmployeeId" id="agencyEmployeeId" placeholder="직원 ID 입력">
											<span class="input-group-btn">
												<button id="idCheckBtn" class="btn btn-default" type="button">ID 중복검사</button>
											</span>
										</div><!-- /input-group -->
									</div>
								</div>
								<div class="form-group">
									<label for="agencyEmployeePw" class="col-sm-3 control-label">직원 비밀번호</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyEmployeePw" id="agencyEmployeePw" placeholder="직원 PW 입력">
									</div>
								</div>
								<div class="form-group">
									<label for="agencyEmployeeName" class="col-sm-3 control-label">직원 이름</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyEmployeeName" id="agencyEmployeeName" placeholder="직원 이름 입력">
									</div>
								</div>
								<div class="form-group">
									<label for="agencyEmployeePhone" class="col-sm-3 control-label">직원 전화번호</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyEmployeePhone" id="agencyEmployeePhone" placeholder="직원 전화번호 입력">
									</div>
								</div>
								<div class="form-group">
									<label for="agencyEmployeeEmail" class="col-sm-3 control-label">직원 이메일</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyEmployeeEmail" id="agencyEmployeeEmail" placeholder="직원 이메일 입력">
									</div>
								</div>
								<div class="text-center">
									<button id="insertBtn" type="button" class="btn btn-default">입력 완료</button>
								</div>
							</form>
						</div>
					</div>
					
					

		
					<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	</body>
</html>