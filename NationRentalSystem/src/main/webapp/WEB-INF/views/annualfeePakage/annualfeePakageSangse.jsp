<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	
	
	<body>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding: 15px">
					<jsp:include page="../module/left/leftnavi.jsp"/>
				</div>
				<div class="col-sm-8">				
					<div class="text-center">
						<h1>연회비/패키지조회</h1>
						<h2>Nation Integrated Reserve and Rental System</h2>
						<p>The time on the server is ${serverTime}.</p>
					</div>
										
					<c:choose>
						<c:when test="${member.memberLevel == '관리자'}">
							<div>						
								<div>등록자id : ${returnAnnualfeePakageDto.functionaryId}</div>
								<div>연회비패키지명 : ${returnAnnualfeePakageDto.annualfeePakageName}</div>
								<div>연회비패키지가격 : ${returnAnnualfeePakageDto.annualfeePakagePrice}</div>
								<div><textarea rows="" cols="" readonly="readonly">${returnAnnualfeePakageDto.annualfeePakageTextSangse}</textarea></div>
								<div>연회비패키지 할인률 : ${returnAnnualfeePakageDto.annualfeePakageDiscountRate}</div>
								<div>연회비패키지 등록날짜 : ${returnAnnualfeePakageDto.annualfeePakageDateRegistration}</div>
								<div>
									<c:forEach var="annualfeePakageAuthority" items="${returnAnnualfeePakageDto.annualfeePakageAuthority}">
										<div>${annualfeePakageAuthority.annualfeePakageAuthorityCode}</div>
										<div>${annualfeePakageAuthority.annualfeePakageCode}</div>
										<div>${annualfeePakageAuthority.adminagencyCode}</div>
									</c:forEach>
								</div>
							</div>
							<div><a href="${pageContext.request.contextPath}/deleteAnnualfeePakage?annualfeePakageCode=${returnAnnualfeePakageDto.annualfeePakageCode}">삭제</a></div>
						</c:when>
						<c:when test="${member.memberLevel == '공무원'}">
							<div>						
								<div>등록자id : ${returnAnnualfeePakageDto.functionaryId}</div>
								<div>연회비패키지명 : ${returnAnnualfeePakageDto.annualfeePakageName}</div>
								<div>연회비패키지가격 : ${returnAnnualfeePakageDto.annualfeePakagePrice}</div>
								<div><textarea rows="" cols="" readonly="readonly">${returnAnnualfeePakageDto.annualfeePakageTextSangse}</textarea></div>
								<div>연회비패키지 할인률 : ${returnAnnualfeePakageDto.annualfeePakageDiscountRate}</div>
								<div>
									<c:forEach var="annualfeePakageAuthority" items="${returnAnnualfeePakageDto.annualfeePakageAuthority}">
										<div>${annualfeePakageAuthority.annualfeePakageAuthorityCode}</div>
										<div>${annualfeePakageAuthority.annualfeePakageCode}</div>
										<div>${annualfeePakageAuthority.adminagencyCode}</div>
									</c:forEach>
								</div>
							</div>
							<c:if test="${member.memberId == returnAnnualfeePakageDto.functionaryId}">
								<div><a href="${pageContext.request.contextPath}/updateAnnualfeePakage?annualfeePakageCode=${returnAnnualfeePakageDto.annualfeePakageCode}">수정</a></div>
								<div><a href="${pageContext.request.contextPath}/deleteAnnualfeePakage?annualfeePakageCode=${returnAnnualfeePakageDto.annualfeePakageCode}">삭제</a></div>
							</c:if>
						</c:when>
						<c:when test="${member.memberLevel == '시민'}">
							<div>						
								<div>등록자id : ${returnAnnualfeePakageDto.functionaryId}</div>
								<div>연회비패키지명 : ${returnAnnualfeePakageDto.annualfeePakageName}</div>
								<div>연회비패키지가격 : ${returnAnnualfeePakageDto.annualfeePakagePrice}</div>
								<div><textarea rows="" cols="" readonly="readonly">${returnAnnualfeePakageDto.annualfeePakageTextSangse}</textarea></div>
								<div>연회비패키지 등록날짜 : ${returnAnnualfeePakageDto.annualfeePakageDiscountRate}</div>
								<div>
									<c:forEach var="annualfeePakageAuthority" items="${returnAnnualfeePakageDto.annualfeePakageAuthority}">
										<div>${annualfeePakageAuthority.annualfeePakageAuthorityCode}</div>
										<div>${annualfeePakageAuthority.annualfeePakageCode}</div>
										<div>${annualfeePakageAuthority.adminagencyCode}</div>
									</c:forEach>
								</div>
							</div>
							<div><a href="${pageContext.request.contextPath}/insertAnnualfeePakageOwnership?annualfeePakageCode=${returnAnnualfeePakageDto.annualfeePakageCode}">구입</a></div>						
						</c:when>	
					</c:choose>
				</div>			
			</div>
		</div>		
	</body>
</html>