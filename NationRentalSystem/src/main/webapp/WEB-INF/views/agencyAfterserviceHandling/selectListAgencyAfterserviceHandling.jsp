<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>select List Agency Afterservice Handling</title>
	</head>
	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		
		<div class="container-fluid">
			<jsp:include page="../module/top/navbar.jsp"/>
			<%-- <jsp:include page="./module/top/mainHeader.jsp"/> --%>
			<div class="row" >
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="../module/leftAgencyAfterserviceHandling/leftAgencyAfterserviceHandling.jsp"/>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
					<div class="panel panel-default" style="margin:15px;">
						<div class="panel-body">
							<h3 class="text-center">AS 수락 리스트</h3>
							<hr/>
							select List Agency Afterservice Handling					
					
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