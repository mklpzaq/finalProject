<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Insert United Afterservice Request</title>
	</head>
	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		
		<div class="container-fluid" style="height:900px;">
			<jsp:include page="../module/top/navbar.jsp"/>
			<%-- <jsp:include page="./module/top/mainHeader.jsp"/> --%>
			<div class="row" >
				<div class="col-sm-2" style="padding:15px;">
					<%-- <jsp:include page="./module/leftHome/leftHome.jsp"/> --%>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
						
					<div style="margin:15px 0 15px 0;" class="panel panel-default">
						<div class="panel-body text-center">
							<h3 class="text-center">통합 AS 의뢰 신청</h3>
							<hr/>
							<!-- 우선 return_goodsfacility_info 테이블을 select하여 리스트로 보여주어야 한다. 그 다음 옆에 의뢰신청 버튼을 만들어야 한다.-->
							



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