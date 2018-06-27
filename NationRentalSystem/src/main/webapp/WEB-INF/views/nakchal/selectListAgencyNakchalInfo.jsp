<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Select List Agency Nakchal Info</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<jsp:include page="../module/backgroundImg/backgroundImg.jsp"/>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="height:100%; margin:15px 0 0 0;">
			<div class="row" >
				<div class="col-sm-2">
					<%-- <jsp:include page="../module/leftHome/leftHome.jsp"/> --%>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
					
					<div class="panel panel-default">
						<div class="panel-body text-center">
							Select List Agency Nakchal Info
							<hr/>
							
							<c:forEach var="NakchalDto" items="${NakchalDtoList}">
								<td><strong>${NakchalDto.agencyCode}</strong></td>
								<td><strong>${NakchalDto.agencyEmployeeId}</strong></td>
								<td><strong>${NakchalDto.functionaryName}</strong></td>
								<td><strong>${NakchalDto.adminagencyCode}</strong></td>
								<td><strong>${NakchalDto.adminagencyName}</strong></td>
								<td><strong>${NakchalDto.sidoName}</strong></td>
								<td><strong>${NakchalDto.sigunguName}</strong></td>
								<td><strong>${NakchalDto.eupmyeonName}</strong></td>
								<td><strong>${NakchalDto.agencyName}</strong></td>
								<td><strong>${NakchalDto.agencyBusinesstypeCode}</strong></td>
								<td><strong>${NakchalDto.agencyBusinesstypeName}</strong></td>
								<td><strong>${NakchalDto.agencyDateRegistration}</strong></td>
								<td><strong>${NakchalDto.agencyDateContractClosed}</strong></td>
							</c:forEach>
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