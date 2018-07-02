<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">		
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
	</head>


	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="height:600px; margin:70px 0;">			
			<div class="col-sm-2"></div>			
			<div class="col-sm-8">				
			<!-- Begin Content -->
				<div class="panel panel-default" style="width:100%; height: 340px;">
					<div class="panel-body">
						<h3 class="text-center">회원 ID 찾기</h3>
						<hr/>					
						<form class="form-horizontal" action="${pageContext.request.contextPath}/idSelect" id="idSelect" method="post">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">회원 이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="memberName" name="memberName" placeholder="가입한 분의 성함을 입력해주십시오" >													
								</div>						
							</div>
							<br><br>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">가입시 등록한 연락처</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="memberPhone" name="memberPhone" placeholder="가입시 등록한 연락처를 입력해주세요" >													
								</div>						
							</div>
							<br>
							<div style="text-align: center">				
								<button class="btn btn-success" type="submit">찾기</button>
							</div>				
						</form>									
					<!-- End Content -->
					</div>
				</div>
			</div>		
			<div class="col-sm-2"></div>			
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>	
	</body>
</html>