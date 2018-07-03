<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
		<jsp:include page="../module/backgroundImg/backgroundImg.jsp"/>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="margin:15px;">
			<div class="row">
				<div class="col-sm-2">
					<%-- <jsp:include page="../module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">	
				
				
					<div class="panel panel-default">
						<div class="panel-body text-center">
									
							<%-- <div class="text-center">
								<h1>연회비/패키지조회</h1>
								<h2>Nation Integrated Reserve and Rental System</h2>
								<p>The time on the server is ${serverTime}.</p>
							</div> --%>
							<h1>연회비/패키지조회</h1>
							<hr/>
									
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
											<c:if test="${fn:length(returnAnnualfeePakageDto.annualfeePakageAuthority) > 1}">	
												<c:forEach var="annualfeePakageAuthority" items="${returnAnnualfeePakageDto.annualfeePakageAuthority}">
													연회비패키지행정기관적용코드 : ${annualfeePakageAuthority.annualfeePakageAuthorityCode}
													연회비패키지적용행정기관 코드 : ${annualfeePakageAuthority.adminagencyCode}
												</c:forEach>
											</c:if>
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
													연회비패키지행정기관적용코드 : ${annualfeePakageAuthority.annualfeePakageAuthorityCode}
													연회비패키지적용행정기관 코드 : ${annualfeePakageAuthority.adminagencyCode}
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
											<%-- <c:if test="${fn:length(returnAnnualfeePakageDto.annualfeePakageAuthority) > 1}">
												적용시켜보니 무조껀 null값이 셋팅되는 바람에 사이즈값을 구하면 1이상이 나온다 --%>	
												<c:forEach var="annualfeePakageAuthority" items="${returnAnnualfeePakageDto.annualfeePakageAuthority}">
													연회비패키지행정기관적용코드 : ${annualfeePakageAuthority.annualfeePakageAuthorityCode}
													연회비패키지적용행정기관 코드 : ${annualfeePakageAuthority.adminagencyCode}
												</c:forEach>
											<%-- </c:if> --%>
										</div>
									</div>
									<div><a href="${pageContext.request.contextPath}/insertAnnualfeePakageOwnership?annualfeePakageCode=${returnAnnualfeePakageDto.annualfeePakageCode}">구입</a></div>						
								</c:when>	
							</c:choose>
					
							<%-- <form class="form-horizontal">
								<div class="form-group">
									<label for="adminagencyCode" class="col-sm-3 control-label">등록자 ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="adminagencyCode" id="adminagencyCode" value="${unitedAfterserviceRequestDto.adminagencyCode}" placeholder="지자체 기관 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="adminagencyCode" class="col-sm-3 control-label">연회비/패키지 명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="adminagencyCode" id="adminagencyCode" value="${unitedAfterserviceRequestDto.adminagencyCode}" placeholder="지자체 기관 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="adminagencyCode" class="col-sm-3 control-label">연회비/패키지 가격</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="adminagencyCode" id="adminagencyCode" value="${unitedAfterserviceRequestDto.adminagencyCode}" placeholder="지자체 기관 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="adminagencyCode1" class="col-sm-3 control-label">연회비/패키지 설명</label>
									<div class="col-sm-9">
										<textarea id="adminagencyCode1" class="form-control" rows="3" readonly></textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="adminagencyCode" class="col-sm-3 control-label">연회비/패키지 할인율</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="adminagencyCode" id="adminagencyCode" value="${unitedAfterserviceRequestDto.adminagencyCode}" placeholder="지자체 기관 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="adminagencyCode" class="col-sm-3 control-label">연회비/패키지 등록날짜</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="adminagencyCode" id="adminagencyCode" value="${unitedAfterserviceRequestDto.adminagencyCode}" placeholder="지자체 기관 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="adminagencyCode" class="col-sm-3 control-label">연회비/패키지 행정기관적용 코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="adminagencyCode" id="adminagencyCode" value="${unitedAfterserviceRequestDto.adminagencyCode}" placeholder="지자체 기관 코드" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="adminagencyCode" class="col-sm-3 control-label">연회비패키지적용행정기관 코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="adminagencyCode" id="adminagencyCode" value="${unitedAfterserviceRequestDto.adminagencyCode}" placeholder="지자체 기관 코드" readonly>
									</div>
								</div>
							</form> --%>
						
						</div>
					</div><!-- 패널 끝 -->
				</div>			
			</div>
		</div>		
	</body>
</html>