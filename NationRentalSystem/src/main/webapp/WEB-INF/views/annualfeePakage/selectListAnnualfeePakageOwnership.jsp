<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>select List Annualfee Pakage Ownership</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	</head>
	
	<body>
		<jsp:include page="../module/backgroundImg/backgroundImg.jsp"/>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="margin:15px;">
			<div class="row">
				<div class="col-sm-2">
					<%-- <jsp:include page="../module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">
				
					<%-- <div class="text-center">
						<h1>연회비/패키지조회</h1>
						<h2>Nation Integrated Reserve and Rental System</h2>
						<p>The time on the server is ${serverTime}.</p>
					</div> --%>
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<h3>구입한 연회비/패키지 조회</h3>
							<hr/>
							<table class="table table-striped">
								<thead>
									<tr>
										<th width="20%">연회비/패키지명</th>
										<th width="20%">연회비/패키지가격</th>
										<th width="20%">연회비/패키지상세</th>
										<th width="20%">연회비/패키지할인률</th>
										<th width="20%">연회비/패키지등록날짜</th>
									</tr>								
								</thead>
								<tbody>									
									<c:forEach var="annualfeePakageDto" items="${list}">
										<tr>
											<td>${annualfeePakageDto.annualfeePakageName}</td>
											<td>${annualfeePakageDto.annualfeePakagePrice}</td>
											<td>${annualfeePakageDto.annualfeePakageTextSangse}</td>
											<td>${annualfeePakageDto.annualfeePakageDiscountRate}</td>
											<td>${annualfeePakageDto.annualfeePakageDateRegistration}</td>									
										</tr>
									</c:forEach>															
								</tbody>
							</table>
						</div>
					</div><!-- 패널 끝 -->
				</div>			
			</div>
		</div>	
	</body>
</html>