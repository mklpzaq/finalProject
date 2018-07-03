<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Injeung Agency Employee</title>
		<script>
			$(document).ready(function(){
				$('#injeungBtn').click(function(){
					$.ajax({
					      type: "POST"
					      ,url: "${pageContext.request.contextPath}/injeungAgencyEmployee"
					      ,data: { agencyEmployeeInjeungNum: $('#agencyEmployeeInjeungNum').val() }
					      ,success:function( JSON ) { // result : String, XML, JSON
					    	  if(JSON === 'T'){
								alert('인증성공');
								/* $(location).attr('href', './insertAgencyEmployee'); */
								$('#injeungAgencyEmployeeForm').submit();
					    	  }else{
								alert('인증실패');
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
		<div class="container-fluid" style="margin:15px; height:800px;">
			<div class="row">
				<div class="col-sm-2">
					<%-- <jsp:include page="./module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->
					
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<h3>직원회원가입 인증번호 입력</h3>
							<hr/>
							<form id="injeungAgencyEmployeeForm" class="form-horizontal" action="${pageContext.request.contextPath}/getInsertAgencyEmployeeForm" method="post">
								<div class="form-group">
									<label for="agencyEmployeeInjeungNum" class="col-sm-3 control-label">인증번호</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyEmployeeInjeungNum" id="agencyEmployeeInjeungNum" placeholder="인증번호를 입력하세요.">
									</div>
								</div>
								<div class="text-center">
									<button id="injeungBtn" type="button" class="btn btn-primary">인증</button>
								</div>
								sample : 123456
							</form>
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