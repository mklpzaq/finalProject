<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Join Congratulation</title>
	</head>
	<body>
		<div class="container-fluid">
			<jsp:include page="../module/top/navbar.jsp"/>
			<jsp:include page="../module/top/mainHeader.jsp"/>
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<%-- <jsp:include page="./module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->
					
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<h3>회원가입을 축하드립니다.</h3>
							<hr/>
							<a href="${pageContext.request.contextPath}/login">로그인하러 가기</a> | 
							<a href="${pageContext.request.contextPath}/">홈으로</a>
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