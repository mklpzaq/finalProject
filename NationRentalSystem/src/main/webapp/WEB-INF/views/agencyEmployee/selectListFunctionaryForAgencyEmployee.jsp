<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Select List Functionary For Agency Employee</title>
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
					Select List Functionary For Agency Employee
					<c:forEach var="functionaryDto" items="${functionaryDtoList}">
						<tr>
							<td>${functionaryDto.functionaryId }</td>
							<td>${functionaryDto.functionaryPw }</td>
							<td>${functionaryDto.functionaryNum }</td>
							<td>${functionaryDto.adminagencyCode }</td>
							<td>${functionaryDto.sidoName }</td>
							<td>${functionaryDto.sigunguName }</td>
							<td>${functionaryDto.eupmyeonName }</td>
							<td>${functionaryDto.adminagencyName }</td>
							<td>${functionaryDto.adminagencyAddressSangse }</td>
							<td>${functionaryDto.functionaryName }</td>
							<td>${functionaryDto.functionaryPhone }</td>
							<td>${functionaryDto.functionaryEmail }</td>
							<td>${functionaryDto.functionaryDateJoin }</td>
						
						</tr>
					</c:forEach>
					
					
					<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>
					
	</body>
</html>