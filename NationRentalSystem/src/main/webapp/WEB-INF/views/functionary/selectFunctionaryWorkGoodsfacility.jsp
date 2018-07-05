<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				var searchOption;
				var keyword;
				
				/* 드롭다운 박스 클릭시 열고 닫고 이벤트 */
				
				$('#selectButton').click(function(){
					if($('#selectbox').hasClass('open')){
						$('#selectbox').removeClass('open');
					}else{
						$('#selectbox').addClass('open');
					}
				});
				
				/* 드롭메뉴 클릭했을때 글자 바꾸기와 드롭메뉴 닫기 */
				$('#dropDownMenu > li').click(function(){
					/* searchButton을 누르면 keyword변수의 값을 get방식으로 getBoardListController로 검색어와 함께 넘길 것이다.
					*  클릭했을때 선택한 select내용의 값을 #selectButtonText에 넣어준다.
					*/
					$('#selectButtonText, #moniterSearchOption').text($(this).text());
					$('#selectButton').parent().removeClass('open');
				});
				
				/* 검색시에 검색조건에 select된 공무원의 id 추가 */
				$('#selectPagePerRow').change(function() {
					/* searchOption = $('#moniterSearchOption').text();
					keyword = $('#moniterKeyword').val(); */
					$(location).attr('href', './selectFunctionaryWork?pagePerRow=' 
									+ $('#selectPagePerRow > option:selected').val() 
									+ '&searchOption=' + $('#moniterSearchOption').text() 
									+ '&keyword=' + $('#moniterKeyword').text() 
									+ '&functionaryId=' + $("#functionaryId").val()
									+ '&workType=' + $("#workType").val());
				});
				
				/* 검색버튼을 클릭하면 get방식으로  searchSignal, searchOption, keyword, functionaryId, workType값을 넘긴다.*/
				$('#searchButton').click(function(){
					searchOption = $('#selectButtonText').text();
					keyword = $('#keyword').val();
					$(location).attr('href', './selectFunctionaryWork?searchOption=' + searchOption 
												+ '&keyword=' + keyword 
												+ '&functionaryId=' + $("#functionaryId").val()
												+ '&workType=' + $("#workType").val());
				});
				
			});
		</script>		
	</head>

	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="../module/leftFunctionary/leftFunctionaryInfo.jsp"/>
				</div>
				<div style="padding:15px;" class="col-sm-8">
					<!-- Begin Content -->
					
					<div class="panel panel-default">
						<div class="panel-body text-center">	
							<div class="row">
								<div class="col-md-4">
									<input id="functionaryId" hidden="hidden" value="${functionaryId}">
									<input id="workType" hidden="hidden" value="${workType}">
									<strong>${currentPage} / ${lastPage} Page</strong><br/>
									<strong>searchOption : </strong><span id="moniterSearchOption">${searchOption}</span><br/>
									<strong>keyword : </strong><span id="moniterKeyword">${keyword}</span><br/>						
								</div>
								<div class="col-md-4">
								<h3>업무조회 리스트</h3>								
								</div>
								<div class="col-md-4">
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
							</div>
							<div>
								<a href="${pageContext.request.contextPath}/selectFunctionaryWork?functionaryId=${functionaryId}&workType=시설/물품등록"><button type="button" id="goodsfacilityListButton" class="btn btn-primary">대여물품/시설등록조회</button></a>
								<a href="${pageContext.request.contextPath}/selectFunctionaryWork?functionaryId=${functionaryId}&workType=반납등록"><button type="button" id="returnGoodsfacilityListButton" class="btn btn-success">반납정보등록조회</button></a>
								<a href="${pageContext.request.contextPath}/selectFunctionaryWork?functionaryId=${functionaryId}&workType=의뢰등록"><button type="button" id="unitedAfterserviceRequestListButton" class="btn btn-info">AS의뢰신청조회</button></a>
								<a href="${pageContext.request.contextPath}/selectFunctionaryWork?functionaryId=${functionaryId}&workType=대행업체등록"><button type="button" id="agencyListButton" class="btn btn-warning">대행업체등록조회</button></a>
								<a href="${pageContext.request.contextPath}/selectFunctionaryWork?functionaryId=${functionaryId}&workType=연회비등록"><button type="button" id="annualfeePakageListButton" class="btn btn-danger">연회비/패키지 등록 조회</button></a>
							</div>
							<hr/>
								
							<c:choose>							
								<c:when test="${workType == '시설/물품등록'}">
									<!-- Begin Search -->
									<div class="row">
										<h4>시설/물품등록 업무조회</h4>
										<div class="col-sm-2"></div>
										<div class="col-sm-8">
											<div class="input-group">
												<div id="selectbox" class="input-group-btn">
													<button type="button" id="selectButton" class="btn btn-default dropdown-toggle" data-toggle="#dropDownMenu">
														<span id="selectButtonText">${searchOption}</span> <span class="caret"></span>
													</button>
													<ul id="dropDownMenu" class="dropdown-menu" role="menu">
														<li><a href="#">전체 검색</a></li>
														<li><a href="#">시설/물품명 검색</a></li>
														<li><a href="#">행정기관명 검색</a></li>
														<li><a href="#">등록날짜 검색</a></li>
													</ul>
												</div>
												<input type="text" id="keyword" class="form-control" placeholder="검색어 입력">
												<span class="input-group-btn">
													<button id="searchButton" class="btn btn-default" type="button">검색</button>
												</span>
											</div>									
										</div>
										<div class="col-sm-2"></div>
									</div>
									<!-- End Search -->
									<!-- Begin table -->
									<table id="goodsfacilityList" class="table table-striped">
										<thead>
											<tr>
												<th width="30%" class="text-center">시설/물품명</th>
												<th width="40%" class="text-center">등록 행정기관명</th>
												<th width="30%" class="text-center">등록일자</th>									
											</tr>
										</thead>
										<tbody>									
											<c:forEach var="goodsfacilityDto" items="${list}">
													<tr>													
														<td>${goodsfacilityDto.goodsfacilityName}</td>
														<td>${goodsfacilityDto.adminagencyName}</td>
														<td>${goodsfacilityDto.goodsfacilityDateRegistration}</td>													
													</tr>																						
											</c:forEach>									
										</tbody>
									</table>
									<!-- End table -->
									
								</c:when>
									
								<c:when test="${workType == '반납등록'}">
									<!-- Begin Search -->
									<div class="row">
										<h4>반납등록 업무조회</h4>
										<div class="col-sm-2"></div>
										<div class="col-sm-8">
											<div class="input-group">
												<div id="selectbox" class="input-group-btn">
													<button type="button" id="selectButton" class="btn btn-default dropdown-toggle" data-toggle="#dropDownMenu">
														<span id="selectButtonText">${searchOption}</span> <span class="caret"></span>
													</button>
													<ul id="dropDownMenu" class="dropdown-menu" role="menu">
														<li><a href="#">전체 검색</a></li>
														<li><a href="#">시설/물품명 검색</a></li>
														<li><a href="#">행정기관명 검색</a></li>
														<li><a href="#">회원명 검색</a></li>
														<li><a href="#">등록날짜 검색</a></li>
													</ul>
												</div>
												<input type="text" id="keyword" class="form-control" placeholder="검색어 입력">
												<span class="input-group-btn">
													<button id="searchButton" class="btn btn-default" type="button">검색</button>
												</span>
											</div>									
										</div>
										<div class="col-sm-2"></div>
									</div>
									<!-- End Search -->
									<table id="returnGoodsfacilityInfoList" class="table table-striped">
										<thead>
											<tr>
												<th width="25%" class="text-center">시설/물품명</th>
												<th width="25%" class="text-center">행정기관명</th>
												<th width="25%" class="text-center">반납한 회원명</th>
												<th width="25%" class="text-center">반납확인일</th>										
											</tr>
										</thead>
										<tbody>									
											<c:forEach var="returnGoodsfacilityInfoDto" items="${list}">
													<tr>													
														<td>${returnGoodsfacilityInfoDto.goodsfacilityName}</td>
														<td>${returnGoodsfacilityInfoDto.adminagencyName}</td>
														<td>${returnGoodsfacilityInfoDto.citizenName}</td>
														<td>${returnGoodsfacilityInfoDto.dateReturnCheck}</td>													
													</tr>																						
											</c:forEach>									
										</tbody>
									</table>
									
								</c:when>
								
								<c:when test="${workType == '의뢰등록'}">
								<!-- Begin Search -->
									<div class="row">
										<h4>의뢰등록 업무조회</h4>
										<div class="col-sm-2"></div>
										<div class="col-sm-8">
											<div class="input-group">
												<div id="selectbox" class="input-group-btn">
													<button type="button" id="selectButton" class="btn btn-default dropdown-toggle" data-toggle="#dropDownMenu">
														<span id="selectButtonText">${searchOption}</span> <span class="caret"></span>
													</button>
													<ul id="dropDownMenu" class="dropdown-menu" role="menu">
														<li><a href="#">전체 검색</a></li>
														<li><a href="#">시설/물품명 검색</a></li>
														<li><a href="#">행정기관명 검색</a></li>
														<li><a href="#">정기/반납 검색</a></li>
														<li><a href="#">대행업체명 검색</a></li>
														<li><a href="#">의뢰신청일</a></li>
													</ul>
												</div>
												<input type="text" id="keyword" class="form-control" placeholder="검색어 입력">
												<span class="input-group-btn">
													<button id="searchButton" class="btn btn-default" type="button">검색</button>
												</span>
											</div>									
										</div>
										<div class="col-sm-2"></div>
									</div>
									<!-- End Search -->
									<table id="unitedAfterserviceRequestList" class="table table-striped">
										<thead>
											<tr>												
												<th width="15%" class="text-center">시설/물품명</th>												
												<th width="15%" class="text-center">행정기관명</th>
												<th width="10%" class="text-center">정기/반납</th>
												<th width="15%" class="text-center">검수결과</th>
												<th width="15%" class="text-center">의뢰상태명</th>
												<th width="15%" class="text-center">의뢰받은 대행업체명</th>
												<th width="15%" class="text-center">신청날짜</th>																		
											</tr>
										</thead>
										<tbody>									
											<c:forEach var="unitedAfterserviceRequestDto" items="${list}">
													<tr>
														
														<td>${unitedAfterserviceRequestDto.goodsfacilityName}</td>														
														<td>${unitedAfterserviceRequestDto.adminagencyName}</td>												
														<td>${unitedAfterserviceRequestDto.requestType}</td>													
														<td>${unitedAfterserviceRequestDto.textCheckResultGoodsfacility}</td>
														<td>${unitedAfterserviceRequestDto.stateGoods}</td>	
														<td>${unitedAfterserviceRequestDto.agencyName}</td>	
														<td>${unitedAfterserviceRequestDto.dateRequestAfterservice}</td>	
													</tr>																						
											</c:forEach>									
										</tbody>
									</table>
									
								</c:when>
								
								<c:when test="${workType == '대행업체등록'}">
								<!-- Begin Search -->
									<div class="row">
										<h4>대행업체등록 업무조회</h4>
										<div class="col-sm-2"></div>
										<div class="col-sm-8">
											<div class="input-group">
												<div id="selectbox" class="input-group-btn">
													<button type="button" id="selectButton" class="btn btn-default dropdown-toggle" data-toggle="#dropDownMenu">
														<span id="selectButtonText">${searchOption}</span> <span class="caret"></span>
													</button>
													<ul id="dropDownMenu" class="dropdown-menu" role="menu">
														<li><a href="#">전체 검색</a></li>
														<li><a href="#">행정기관명 검색</a></li>
														<li><a href="#">대행업체명 검색</a></li>
														<li><a href="#">등록날짜 검색</a></li>
													</ul>
												</div>
												<input type="text" id="keyword" class="form-control" placeholder="검색어 입력">
												<span class="input-group-btn">
													<button id="searchButton" class="btn btn-default" type="button">검색</button>
												</span>
											</div>									
										</div>
										<div class="col-sm-2"></div>
									</div>
									<!-- End Search -->
									<table id="agencyList" class="table table-striped">
										<thead>
											<tr>
												<th width="30%" class="text-center">행정기관명</th>
												<th width="30%" class="text-center">대행업체명</th>
												<th width="40%" class="text-center">등록일자</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list}" var="agencyDto">
												<tr>
													<td>${agencyDto.adminagencyName}</td>
													<td>${agencyDto.agencyName}</td>
													<td>${agencyDto.agencyDateRegistration}</td>
												</tr>
											</c:forEach>
										</tbody>									
									</table>
									
								</c:when>
								
								<c:when test="${workType == '연회비등록'}">
								<!-- Begin Search -->
									<div class="row">
										<h4>연회비등록 업무조회</h4>
										<div class="col-sm-2"></div>
										<div class="col-sm-8">
											<div class="input-group">
												<div id="selectbox" class="input-group-btn">
													<button type="button" id="selectButton" class="btn btn-default dropdown-toggle" data-toggle="#dropDownMenu">
														<span id="selectButtonText">${searchOption}</span> <span class="caret"></span>
													</button>
													<ul id="dropDownMenu" class="dropdown-menu" role="menu">
														<li><a href="#">전체 검색</a></li>
														<li><a href="#">시설/물품명 검색</a></li>
														<li><a href="#">행정기관명 검색</a></li>
														<li><a href="#">회원명 검색</a></li>
														<li><a href="#">등록날짜 검색</a></li>
													</ul>
												</div>
												<input type="text" id="keyword" class="form-control" placeholder="검색어 입력">
												<span class="input-group-btn">
													<button id="searchButton" class="btn btn-default" type="button">검색</button>
												</span>
											</div>									
										</div>
										<div class="col-sm-2"></div>
									</div>
									<!-- End Search -->
									<table id="annualfeePakageList" class="table table-striped">
										<thead>
											<tr>
												<th width="10%" class="text-center">연회비/패키지명</th> 
												<th width="10%" class="text-center">적용되는 행정기관명</th>
												<th width="10%" class="text-center">연회비/패키지등록날짜</th>									
											</tr>
										</thead>
										<tbody>									
											<c:forEach var="annualfeePakageDto" items="${map.annualfeePakageList}">
													<tr>
														<td>${annualfeePakageDto.annualfeePakageCode}</td>														
														<td>${annualfeePakageDto.annualfeePakageName}</td>
														<td>${annualfeePakageDto.adminagencyCode}</td>
														<td>${annualfeePakageDto.annualfeePakageDateRegistration}</td>													
													</tr>																						
											</c:forEach>									
										</tbody>
									</table>									
								</c:when>
							</c:choose>
							<!-- Begin paging -->
							<nav style="text-align:center">
								<ul class="pagination">
									<li>
										<a href="${pageContext.request.contextPath}/selectFunctionaryWork?currentPage=1&pagePerRow=${pagePerRow}&searchOption=${searchOption}&keyword=${keyword}&functionaryId=${functionaryId}&workType=${workType}" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li>
										<c:choose>
											<c:when test="${currentPage > 1}">
												<a href="${pageContext.request.contextPath}/selectFunctionaryWork?currentPage=${currentPage-1}&pagePerRow=${pagePerRow}&searchOption=${searchOption}&keyword=${keyword}&functionaryId=${functionaryId}&workType=${workType}"aria-label="Previous">
													<span aria-hidden="true">&lt;</span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/selectFunctionaryWork?currentPage=1&pagePerRow=${pagePerRow}&searchOption=${searchOption}&keyword=${keyword}&functionaryId=${functionaryId}&workType=${workType}"aria-label="Previous">
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
														<li class="active"><a href="${pageContext.request.contextPath}/selectFunctionaryWork?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchOption=${searchOption}&keyword=${keyword}&functionaryId=${functionaryId}&workType=${workType}">${pageNum}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="${pageContext.request.contextPath}/selectFunctionaryWork?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchOption=${searchOption}&keyword=${keyword}&functionaryId=${functionaryId}&workType=${workType}">${pageNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach var="pageNum" begin="${startPage}" end="${lastPage}" step="1">
												<c:choose>
													<c:when test="${pageNum == currentPage}">
														<li class="active"><a href="${pageContext.request.contextPath}/selectFunctionaryWork?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchOption=${searchOption}&keyword=${keyword}&functionaryId=${functionaryId}&workType=${workType}">${pageNum}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="${pageContext.request.contextPath}/selectFunctionaryWork?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchOption=${searchOption}&keyword=${keyword}&functionaryId=${functionaryId}&workType=${workType}">${pageNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									<li>
										<c:choose>
											<c:when test="${currentPage < lastPage}">
												<a href="${pageContext.request.contextPath}/selectFunctionaryWork?currentPage=${currentPage+1}&pagePerRow=${pagePerRow}&searchOption=${searchOption}&keyword=${keyword}&functionaryId=${functionaryId}&workType=${workType}" aria-label="Next">
													<span aria-hidden="true">&gt;</span>
												</a>
											</c:when>
											<c:otherwise>												
												<a href="${pageContext.request.contextPath}/selectFunctionaryWork?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchOption=${searchOption}&keyword=${keyword}&functionaryId=${functionaryId}&workType=${workType}"aria-label="Next">
													<span aria-hidden="true">&gt;</span>
												</a>
											</c:otherwise>
										</c:choose>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/selectFunctionaryWork?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchOption=${searchOption}&keyword=${keyword}&functionaryId=${functionaryId}&workType=${workType}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</nav>
							<!-- End paging -->						
						</div>
						<div class="col-sm-2"></div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>
	</body>
</html>
