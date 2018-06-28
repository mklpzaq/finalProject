<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
	<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="../module/left/leftnavi.jsp"/>
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->
					
				<div class="text-center">
					<h1>id찾기 확인</h1>
					<h2>Nation Integrated Reserve and Rental System</h2>
					<P>The time on the server is ${serverTime}.</P>
				</div>
				
				<label>관리자 Id</label>
				<table>					
					<tr>
					<td>${map.adminId}</td>
					</tr>
				</table>
				
				<label>공무원 Id</label>
				<table>					
					<tr>
					<td>${map.functionaryId}</td>
					</tr>
				</table>
				
				<label>대행업체 직원 Id</label>
				<table>					
					<tr>
					<td>${map.agencyEmployeeId}</td>
					</tr>
				</table>
				
				<label>시민 Id</label>
				<table>					
					<tr>
					<td>${map.citizenId}</td>
					</tr>
				</table>
										
				</div>				
			</div>
		</div>
</body>
</html>