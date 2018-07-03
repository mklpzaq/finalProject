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
							<h3 class="text-center">구입한 연회비패키지</h3>
							<hr/>
							<%-- <div class="row">
								<div class="col-md-4 text-left">
									<strong>${currentPage} / ${lastPage} Page</strong><br/>
									<strong>searchOption : </strong><span id="moniterSearchOption">${searchOption}</span><br/>
									<strong>keyword : </strong><span id="moniterKeyword">${keyword}</span><br/>						
								</div>
								<div class="col-md-4 text-center">
									<h3>연회비/패키지 조회</h3>
								</div>
								<div class="col-md-4 text-right">
									<select id="selectPagePerRow" name="selectPagePerRow">
										<option value="5"<c:if test="${pagePerRow == 5}">selected</c:if>>5</option>
										<option value="10"<c:if test="${pagePerRow == 10}">selected</c:if>>10</option>
										<option value="15"<c:if test="${pagePerRow == 15}">selected</c:if>>15</option>
										<option value="20"<c:if test="${pagePerRow == 20}">selected</c:if>>20</option>
										<option value="30"<c:if test="${pagePerRow == 30}">selected</c:if>>30</option>
										<option value="40"<c:if test="${pagePerRow == 40}">selected</c:if>>40</option>
										<option value="50"<c:if test="${pagePerRow == 50}">selected</c:if>>50</option>
									</select>개씩 보기
									
								</div>
							</div> --%>
							<!-- <hr/> -->							
							<%-- <!-- Begin Search -->
							<div class="row">
								<div class="col-sm-2"></div>
								<div class="col-sm-8">
									
									<div class="input-group">
										<div id="selectbox" class="input-group-btn">
											<button type="button" id="selectButton" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
												<span id="selectButtonText">${searchOption}</span> <span class="caret"></span>
											</button>
											<ul id="dropDownMenu" class="dropdown-menu" role="menu">
												<li><a href="#">all</a></li>
												<li><a href="#">annualfee_pakage_name</a></li>
												<li><a href="#">annualfee_pakage_text_sangse</a></li>
											</ul>
										</div>
										<input type="text" id="keyword" class="form-control" placeholder="검색어 입력">
										<span class="input-group-btn">
											<button id="searchButton" class="btn btn-default" type="button">검색</button>
										</span>
									</div>								
								</div>
								<div class="col-sm-2"></div>
							</div> --%>
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
							<%-- <nav class="text-center">
								<ul class="pagination">
									<li>
										<a href="${pageContext.request.contextPath}/selectListAnnualfeePakage?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li>
										<c:choose>
											<c:when test="${currentPage > 1}">
												<a href="${pageContext.request.contextPath}/selectListAnnualfeePakage?currentPage=${currentPage-1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Previous">
													<span aria-hidden="true">&lt;</span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/selectListAnnualfeePakage?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Previous">
													<span aria-hidden="true">&lt;</span>
												</a>
											</c:otherwise>
										</c:choose>
									</li>
									<c:choose>
										<c:when test="${lastPage > startPage + 4}">
											<c:forEach var="pageNum" begin="${startPage}" end="${startPage + 4}" step="1">
												<c:choose>
													<c:when test="${pageNum == currentPage}">
														<li class="active"><a href="${pageContext.request.contextPath}/selectListAnnualfeePakage?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="${pageContext.request.contextPath}/selectListAnnualfeePakage?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach var="pageNum" begin="${startPage}" end="${lastPage}" step="1">
												<c:choose>
													<c:when test="${pageNum == currentPage}">
														<li class="active"><a href="${pageContext.request.contextPath}/selectListAnnualfeePakage?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="${pageContext.request.contextPath}/selectListAnnualfeePakage?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									<li>
										<c:choose>
											<c:when test="${currentPage < lastPage}">
												<a href="${pageContext.request.contextPath}/selectListAnnualfeePakage?currentPage=${currentPage+1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Next">
													<span aria-hidden="true">&gt;</span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/selectListAnnualfeePakage?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Next">
													<span aria-hidden="true">&gt;</span>
												</a>
											</c:otherwise>
										</c:choose>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/selectListAnnualfeePakage?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</nav> --%>
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