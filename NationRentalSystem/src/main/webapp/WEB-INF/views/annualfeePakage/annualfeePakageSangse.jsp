<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="height: 700px;">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="../module/leftAnnualfeePakage/leftAnnualfeePakage.jsp"/>
				</div>
				<div style="padding:50px;" class="col-sm-8">		

					<!-- Begin Content -->
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="text-center">연회비/패키지 상세보기</h3>
							<hr/>				
							<c:choose>
								<c:when test="${member.memberLevel == '관리자'}">						
									<div class="group">
										<label for="functionaryId" class="col-sm-2 control-label">등록자id</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="functionaryId" name="functionaryId" value="${returnAnnualfeePakageDto.functionaryId}">					
										</div>
									</div>
									<div class="group">
										<label for="annualfeePakageName" class="col-sm-2 control-label">연회비패키지명</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="annualfeePakageName" name="annualfeePakageName" value="${returnAnnualfeePakageDto.annualfeePakageName}">	
										</div>
									</div>
									<div class="group">
										<label for="annualfeePakagePrice" class="col-sm-2 control-label">연회비패키지가격</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="annualfeePakagePrice" name="annualfeePakagePrice" value="${returnAnnualfeePakageDto.annualfeePakagePrice}">	
										</div>
									</div>
									<div class="group">
										<label for="annualfeePakageTextSangse" class="col-sm-2 control-label">상세내용</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="annualfeePakageTextSangse" name="annualfeePakageTextSangse" value="${returnAnnualfeePakageDto.annualfeePakageTextSangse}">				
										</div>
									</div>
									<%-- <div><textarea rows="" cols="" readonly="readonly">${returnAnnualfeePakageDto.annualfeePakageTextSangse}</textarea></div> --%>
									<div class="group">
										<label for="annualfeePakageDiscountRate" class="col-sm-2 control-label">연회비패키지 할인률</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="annualfeePakageDiscountRate" name="annualfeePakageDiscountRate" value="${returnAnnualfeePakageDto.annualfeePakageDiscountRate}">			
										</div>
									</div>
									<div class="group">
										<label for="annualfeePakageDateRegistration" class="col-sm-2 control-label">연회비패키지 등록날짜</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="annualfeePakageDateRegistration" name="annualfeePakageDateRegistration" value="${returnAnnualfeePakageDto.annualfeePakageDateRegistration}">			
										</div>
									</div>									
										<div class="group">			
											<label for="adminagencyName" class="col-sm-2 control-label">연회비패키지명</label>
											<c:forEach var="annualfeePakageAuthority" items="${returnAnnualfeePakageDto.annualfeePakageAuthority}">
												<div class="col-sm-10">		
													<input type="text" class="form-control" id="adminagencyName" name="adminagencyName" value="${annualfeePakageAuthority.adminagencyName}">		
												</div>
											</c:forEach>
										</div>									
									<div><a href="${pageContext.request.contextPath}/deleteAnnualfeePakage?annualfeePakageCode=${returnAnnualfeePakageDto.annualfeePakageCode}">삭제</a></div>
								</c:when>
								<c:when test="${member.memberLevel == '공무원'}">						
									<div>
										<label for="functionaryId" class="col-sm-2 control-label">등록자id</label>
										<div class="col-sm-10">					
											<input type="text" class="form-control" id="functionaryId" name="functionaryId" value="${returnAnnualfeePakageDto.functionaryId}" readonly="readonly">					
										</div>
									</div>
									<br><br>
									<div>
										<label for="annualfeePakageName" class="col-sm-2 control-label">연회비패키지명</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="annualfeePakageName" name="annualfeePakageName" value="${returnAnnualfeePakageDto.annualfeePakageName}" readonly="readonly">	
										</div>
									</div>
									<br><br>
									<div>
										<label for="annualfeePakagePrice" class="col-sm-2 control-label">연회비패키지가격</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="annualfeePakagePrice" name="annualfeePakagePrice" value="${returnAnnualfeePakageDto.annualfeePakagePrice}" readonly="readonly">	
										</div>
									</div>
									<br><br>
									<div>
										<label for="annualfeePakageTextSangse" class="col-sm-2 control-label">상세내용</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="annualfeePakageTextSangse" name="annualfeePakageTextSangse" value="${returnAnnualfeePakageDto.annualfeePakageTextSangse}" readonly="readonly">				
										</div>
									</div>
									<br><br>
									<div>
										<label for="annualfeePakageDiscountRate" class="col-sm-2 control-label">할인률</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="annualfeePakageDiscountRate" name="annualfeePakageDiscountRate" value="${returnAnnualfeePakageDto.annualfeePakageDiscountRate}" readonly="readonly">			
										</div>
									</div>
									<br><br>
										<div>
											<label for="adminagencyName" class="col-sm-2 control-label">적용 행정기관명</label>
											<c:forEach var="annualfeePakageAuthority" items="${returnAnnualfeePakageDto.annualfeePakageAuthority}">
												<div class="col-sm-3" style="text-align: right;">		
													<input type="text" class="form-control" id="adminagencyName" name="adminagencyName"	value= "${annualfeePakageAuthority.adminagencyName}" readonly="readonly">		
												</div>
											</c:forEach>
										</div>									
									<br><br>
									<div class="text-center">
										<c:if test="${member.memberId == returnAnnualfeePakageDto.functionaryId}">
											<a href="${pageContext.request.contextPath}/updateAnnualfeePakage?annualfeePakageCode=${returnAnnualfeePakageDto.annualfeePakageCode}">
												<button type="button" class="btn btn-primary">수정</button>
											</a>
											<a href="${pageContext.request.contextPath}/deleteAnnualfeePakage?annualfeePakageCode=${returnAnnualfeePakageDto.annualfeePakageCode}">
												<button type="button" class="btn btn-danger">삭제</button>
											</a>
										</c:if>
									</div>
								</c:when>
								<c:when test="${member.memberLevel == '시민'}">
									<div>
										<label for="functionaryId" class="col-sm-2 control-label">등록자id</label>
										<div class="col-sm-10">					
											<input type="text" class="form-control" id="functionaryId" name="functionaryId" value="${returnAnnualfeePakageDto.functionaryId}" readonly="readonly">					
										</div>
									</div>
									<br><br>
									<div>
										<label for="annualfeePakageName" class="col-sm-2 control-label">연회비패키지명</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="annualfeePakageName" name="annualfeePakageName" value="${returnAnnualfeePakageDto.annualfeePakageName}" readonly="readonly">	
										</div>
									</div>
									<br><br>
									<div>
										<label for="annualfeePakagePrice" class="col-sm-2 control-label">연회비패키지가격</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="annualfeePakagePrice" name="annualfeePakagePrice" value="${returnAnnualfeePakageDto.annualfeePakagePrice}" readonly="readonly">	
										</div>
									</div>
									<br><br>
									<div>
										<label for="annualfeePakageTextSangse" class="col-sm-2 control-label">상세내용</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="annualfeePakageTextSangse" name="annualfeePakageTextSangse" value="${returnAnnualfeePakageDto.annualfeePakageTextSangse}" readonly="readonly">				
										</div>
									</div>
									<br><br>
									<div>
										<label for="annualfeePakageDiscountRate" class="col-sm-2 control-label">할인률</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="annualfeePakageDiscountRate" name="annualfeePakageDiscountRate" value="${returnAnnualfeePakageDto.annualfeePakageDiscountRate}" readonly="readonly">			
										</div>
									</div>
									<br><br>
										<div>
											<label for="adminagencyName" class="col-sm-2 control-label">적용 행정기관명</label>
											<c:forEach var="annualfeePakageAuthority" items="${returnAnnualfeePakageDto.annualfeePakageAuthority}">
												<div class="col-sm-3" style="text-align: right;">		
													<input type="text" class="form-control" id="adminagencyName" name="adminagencyName"	value= "${annualfeePakageAuthority.adminagencyName}" readonly="readonly">		
												</div>
											</c:forEach>
										</div>									
									<br><br>											
									<div class="text-center">								
										<a href="${pageContext.request.contextPath}/insertAnnualfeePakageOwnership?annualfeePakageCode=${returnAnnualfeePakageDto.annualfeePakageCode}">
											<button type="button" class="btn btn-primary">구입</button>
										</a>
									</div>	
								</c:when>	
							</c:choose>
						<!-- End Content -->
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>	
	</body>
</html>