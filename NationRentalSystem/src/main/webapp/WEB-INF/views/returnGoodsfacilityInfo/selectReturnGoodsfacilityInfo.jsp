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
				
				
				/* 드롭메뉴 클릭했을때(검색조건 변경) 글자 바꾸기와 드롭메뉴 닫기 */
				$('#dropDownMenu > li').click(function(){
					/* searchButton을 누르면 keyword변수의 값을 get방식으로 getBoardListController로 검색어와 함께 넘길 것이다.
					*  클릭했을때 선택한 select내용의 값을 #selectButtonText에 넣어준다.
					*/
					$('#selectButtonText, #moniterSearchOption').text($(this).text());
											
					if($(this).text() == '반납날짜 검색'){ //날짜검색
						$("#keyword").remove();					
						$("#keywordDiv").html('<input type="date" id="startDate" name="startDate">~<input type="date" id="endDate" name="endDate">');
						/* 검색버튼을 클릭하면 get방식으로  searchSignal, searchOption, keyword값을 넘긴다.*/
						/* $('#searchButton').click(function(){
							searchOption = $('#selectButtonText').text();
							startDate = $('#startDate').val();
							endDate = $('#endDate').val();
							$(location).attr('href', './selectReturnGoodsfacilityInfo?=y&searchOption=' + searchOption + '&startDate=' + startDate + '&endDate=' + endDate);
						});	 */						
					}else if($(this).text() == '시설/물품 구분검색'){ //물품인지 시설인지
						$("#keyword").remove();					
						$("#keywordDiv").html('<select id="keyword"><option>물품</option>	<option>시설</option>	</select>');
						/* 검색버튼을 클릭하면 get방식으로  searchSignal, searchOption, keyword값을 넘긴다.*/
						/* $('#searchButton').click(function(){
							searchOption = $('#selectButtonText').text();
							keyword = $('#keyword').val();
							$(location).attr('href', './selectReturnGoodsfacilityInfo?=y&searchOption=' + searchOption + '&keyword=' + keyword);
						});	 */						
					}else if($(this).text() == '배달반납 신청유무 검색'){ //반납배달인지 아닌지
						$("#keyword").remove();					
						$("#keywordDiv").html('<select id="keyword"><option>배달반납신청</option>	<option>배달반납신청안함</option></select>');
						/* 검색버튼을 클릭하면 get방식으로  searchSignal, searchOption, keyword값을 넘긴다.*/
						/* $('#searchButton').click(function(){
							searchOption = $('#selectButtonText').text();
							keyword = $('#keyword').val();
							$(location).attr('href', './selectReturnGoodsfacilityInfo?=y&searchOption=' + searchOption + '&keyword=' + keyword);
						});	 */						
					}else if($(this).text() == '반납상태 검색'){ //반납상태
						$("#keyword").remove();					
						$("#keywordDiv").html('<select id="keyword"><option>양호</option>	<option>세탁필요</option><option>세척필요</option><option>청소필요</option><option>수리필요</option><option>세탁필요</option></select>');								
						/* 검색버튼을 클릭하면 get방식으로  searchSignal, searchOption, keyword값을 넘긴다.*/
						/* $('#searchButton').click(function(){
							searchOption = $('#selectButtonText').text();
							keyword = $('#keyword').val();
							$(location).attr('href', './selectReturnGoodsfacilityInfo?=y&searchOption=' + searchOption + '&keyword=' + keyword);
						});	 */						
					}else {
						$("#keyword").remove(); //타이핑검색
						$("#keywordDiv").html('<input type="text" id="keyword" class="form-control" placeholder="검색어 입력">');	
						/* 검색버튼을 클릭하면 get방식으로  searchSignal, searchOption, keyword값을 넘긴다.*/
						/* $('#searchButton').click(function(){
							searchOption = $('#selectButtonText').text();
							keyword = $('#keyword').val();
							$(location).attr('href', './selectReturnGoodsfacilityInfo?=y&searchOption=' + searchOption + '&keyword=' + keyword);
						});	 */						
					}						
					$('#selectButton').parent().removeClass('open');						
				});
				
				$('#searchButton').click(function(){
					if($("#moniterSearchOption").text() == '반납날짜 검색'){
						searchOption = $('#selectButtonText').text();
						startDate = $('#startDate').val();
						endDate = $('#endDate').val();
						$(location).attr('href', './selectReturnGoodsfacilityInfo?=y&searchOption=' + searchOption + '&startDate=' + startDate + '&endDate=' + endDate);
					}else if($("#moniterSearchOption").text() == '시설/물품 구분검색'){
						searchOption = $('#selectButtonText').text();
						keyword = $('#keyword').val();
						$(location).attr('href', './selectReturnGoodsfacilityInfo?=y&searchOption=' + searchOption + '&keyword=' + keyword);
					}else if($("#moniterSearchOption").text() == '배달반납 신청유무 검색'){
						searchOption = $('#selectButtonText').text();
						keyword = $('#keyword').val();
						$(location).attr('href', './selectReturnGoodsfacilityInfo?=y&searchOption=' + searchOption + '&keyword=' + keyword);
					}else if($("#moniterSearchOption").text() == '반납상태 검색'){
						searchOption = $('#selectButtonText').text();
						keyword = $('#keyword').val();
						$(location).attr('href', './selectReturnGoodsfacilityInfo?=y&searchOption=' + searchOption + '&keyword=' + keyword);						
					}else{
						searchOption = $('#selectButtonText').text();
						keyword = $('#keyword').val();
						$(location).attr('href', './selectReturnGoodsfacilityInfo?=y&searchOption=' + searchOption + '&keyword=' + keyword);
					}						
				});	
				
				$('#selectPagePerRow').change(function() {
					searchOption = $('#moniterSearchOption').text();
					keyword = $('#moniterKeyword').val();
					startDate = $('#moniterStartDate').val();
					endDate = $('#moniterEndDate').val();
					$(location).attr('href', './selectReturnGoodsfacilityInfo?pagePerRow=' + $('#selectPagePerRow > option:selected').val() + '&searchOption=' + $('#moniterSearchOption').text() + '&keyword=' + $('#moniterKeyword').text());
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
										<div hidden="hidden">
											<strong>${currentPage} / ${lastPage} Page</strong><br/>
											<strong>searchOption : </strong><span id="moniterSearchOption">${searchOption}</span><br/>
											<strong>keyword : </strong><span id="moniterKeyword">${keyword}</span><br/>
											<strong>startDate : </strong><span id="moniterStartDate">${startDate}</span><br/>
											<strong>endDate : </strong><span id="moniterEndDate">${endDate}</span><br/>	
										</div>					
									</div>
									<div class="col-md-4">
										<h3>반납정보 리스트</h3>
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
								<hr/>
								
								<!-- Begin Search -->
								<div class="row">
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
													<li><a href="#">시민명 검색</a></li>
													<li><a href="#">처리 공무원 검색</a></li>
													<li><a href="#">시설/물품 구분검색</a></li>
													<li><a href="#">배달반납 신청유무 검색</a></li>
													<li><a href="#">반납상태 검색</a></li>
													<li><a href="#">반납날짜 검색</a></li>																										
												</ul>
											</div>
											<div id="keywordDiv"><input type="text" id="keyword" class="form-control" placeholder="검색어 입력"></div>										
											<span class="input-group-btn" id="searchButtonSpan">
												<button id="searchButton" class="btn btn-default" type="button">검색</button>
											</span>
										</div>
									
									</div>
									<div class="col-sm-2"></div>
								</div>
								<!-- End Search -->
								
								<table class="table table-striped">
									<thead>
										<tr>
											<th width="10%">시설/물품 반납 정보 코드</th>
											<th width="10%">시설/물품명</th>
											<th width="10%">물품/시설 구분</th>
											<th width="10%">시민ID</th>
											<th width="10%">시민이름</th>
											<th width="10%">배달반납신청 유무</th>
											<th width="10%">연체일수</th>
											<th width="10%">공무원이름</th>
											<th width="10%">물품상태명</th>
											<th width="10%">반납확인일</th>
																				
										</tr>
									</thead>
									<tbody>									
										<c:forEach var="returnGoodsfacilityInfoDto" items="${list}">												
											<tr>
												<td>${returnGoodsfacilityInfoDto.returGoodsfacilityInfoCode}</td>														
												<td>${returnGoodsfacilityInfoDto.goodsfacilityName}</td>
												<td>${returnGoodsfacilityInfoDto.classifyGoodsfacility}</td>
												<td>${returnGoodsfacilityInfoDto.citizenId}</td>
												<td>${returnGoodsfacilityInfoDto.citizenName}</td>
												<td>${returnGoodsfacilityInfoDto.isRequestedToReturnAsDelivery}</td>
												<td>${returnGoodsfacilityInfoDto.overdueDays}</td>
												<td>${returnGoodsfacilityInfoDto.functionaryName}</td>
												<td>${returnGoodsfacilityInfoDto.stateGoods}</td>
												<td>${returnGoodsfacilityInfoDto.dateReturnCheck}</td>																									
											</tr>												
										</c:forEach>									
									</tbody>
								</table>
								
								
										<nav>	
										<c:choose>
											<c:when test="${searchOption == '반납날짜 검색'}">																	
											<ul class="pagination">
												<li>
													<a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&startDate=${startDate}&endDate=${endDate}" aria-label="Previous">
														<span aria-hidden="true">&laquo;</span>
													</a>
												</li>
												<li>
													<c:choose>
														<c:when test="${currentPage > 1}">
															<a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${currentPage-1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&startDate=${startDate}&endDate=${endDate}"aria-label="Previous">
																<span aria-hidden="true">&lt;</span>
															</a>
														</c:when>
														<c:otherwise>
															<a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&startDate=${startDate}&endDate=${endDate}"aria-label="Previous">
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
																	<li class="active"><a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&startDate=${startDate}&endDate=${endDate}">${pageNum}</a></li>
																</c:when>
																<c:otherwise>
																	<li><a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&startDate=${startDate}&endDate=${endDate}">${pageNum}</a></li>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<c:forEach var="pageNum" begin="${startPage}" end="${lastPage}" step="1">
															<c:choose>
																<c:when test="${pageNum == currentPage}">
																	<li class="active"><a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&startDate=${startDate}&endDate=${endDate}">${pageNum}</a></li>
																</c:when>
																<c:otherwise>
																	<li><a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&startDate=${startDate}&endDate=${endDate}">${pageNum}</a></li>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</c:otherwise>
												</c:choose>
												<li>
													<c:choose>
														<c:when test="${currentPage < lastPage}">
															<a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${currentPage+1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&startDate=${startDate}&endDate=${endDate}" aria-label="Next">
																<span aria-hidden="true">&gt;</span>
															</a>
														</c:when>
														<c:otherwise>
															<a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&startDate=${startDate}&endDate=${endDate}"aria-label="Next">
																<span aria-hidden="true">&gt;</span>
															</a>
														</c:otherwise>
													</c:choose>
												</li>
												<li>
													<a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&startDate=${startDate}&endDate=${endDate}" aria-label="Next">
														<span aria-hidden="true">&raquo;</span>
													</a>
												</li>
											</ul>
											</c:when>
											<c:otherwise>										
											<ul class="pagination">
												<li>
													<a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Previous">
														<span aria-hidden="true">&laquo;</span>
													</a>
												</li>
												<li>
													<c:choose>
														<c:when test="${currentPage > 1}">
															<a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${currentPage-1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Previous">
																<span aria-hidden="true">&lt;</span>
															</a>
														</c:when>
														<c:otherwise>
															<a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Previous">
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
																	<li class="active"><a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
																</c:when>
																<c:otherwise>
																	<li><a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<c:forEach var="pageNum" begin="${startPage}" end="${lastPage}" step="1">
															<c:choose>
																<c:when test="${pageNum == currentPage}">
																	<li class="active"><a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
																</c:when>
																<c:otherwise>
																	<li><a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</c:otherwise>
												</c:choose>
												<li>
													<c:choose>
														<c:when test="${currentPage < lastPage}">
															<a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${currentPage+1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Next">
																<span aria-hidden="true">&gt;</span>
															</a>
														</c:when>
														<c:otherwise>
															<a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Next">
																<span aria-hidden="true">&gt;</span>
															</a>
														</c:otherwise>
													</c:choose>
												</li>
												<li>
													<a href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Next">
														<span aria-hidden="true">&raquo;</span>
													</a>
												</li>
											</ul>										
										</c:otherwise>
									</c:choose>	
								</nav>
							</div>
						<div class="col-sm-2"></div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>
	</body>
</html>
