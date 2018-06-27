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
				
				$('#selectPagePerRow').change(function() {
					/* searchOption = $('#moniterSearchOption').text();
					keyword = $('#moniterKeyword').val(); */
					$(location).attr('href', './selectListFunctionary?pagePerRow=' + $('#selectPagePerRow > option:selected').val() + '&searchOption=' + $('#moniterSearchOption').text() + '&keyword=' + $('#moniterKeyword').text());
				});
				
				/* 검색버튼을 클릭하면 get방식으로  searchSignal, searchOption, keyword값을 넘긴다.*/
				$('#searchButton').click(function(){
					searchOption = $('#selectButtonText').text();
					keyword = $('#keyword').val();
					$(location).attr('href', './selectListFunctionary?=y&searchOption=' + searchOption + '&keyword=' + keyword);
				});
				
				
				
				$("#goodsfacilityListButton").click(function(){
					$("#goodsfacilityList").parent().children().hide();
					$("#goodsfacilityList").show();				
				})
				$("#returnGoodsfacilityInfoListButton").click(function(){
					$("#returnGoodsfacilityInfoList").parent().children().hide();
					$("#returnGoodsfacilityInfoList").show();		
								
				})
				$("#unitedAfterserviceRequestListButton").click(function(){
					$("#unitedAfterserviceRequestList").parent().children().hide();
					$("#unitedAfterserviceRequestList").show();	
								
				})
				$("#agencyListButton").click(function(){
					$("#agencyList").parent().children().hide();
					$("#agencyList").show();		
									
				})
				$("#annualfeePakageListButton").click(function(){
					$("#annualfeePakageList").parent().children().hide();
					$("#annualfeePakageList").show();	
				})
				
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
						<div class="panel-body">
							<h3 class="text-center">업무조회 리스트</h3>
							<hr/>						
								<div class="row">
									<div class="col-md-4">
										<strong>${currentPage} / ${lastPage} Page</strong><br/>
										<strong>searchOption : </strong><span id="moniterSearchOption">${searchOption}</span><br/>
										<strong>keyword : </strong><span id="moniterKeyword">${keyword}</span><br/>						
									</div>
									<div class="col-md-4">
										<h3>Article List</h3>
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
									<button type="button" id="goodsfacilityListButton">대여물품/시설등록조회</button>
									<button type="button" id="returnGoodsfacilityInfoListButton">반납정보등록조회</button>
									<button type="button" id="unitedAfterserviceRequestListButton">AS의뢰신청조회</button>
									<button type="button" id="agencyListButton">대행업체등록조회</button>
									<button type="button" id="annualfeePakageListButton">연회비/패키지 등록 조회</button>
								</div>
								<hr/>
								
								<!-- Begin Search -->
								<div class="row">
									<div class="col-sm-2"></div>
									<div class="col-sm-8">
										
										<div class="input-group">
											<div id="selectbox" class="input-group-btn">
												<button type="button" id="selectButton" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
													<span id="selectButtonText">${searchOption}</span> <span class="caret"></span>
												</button>
												<ul id="dropDownMenu" class="dropdown-menu" role="menu">
													<li><a href="#">전체 검색</a></li>
													<li><a href="#">공무원 이름 검색</a></li>
													<li><a href="#">소속 행정기관 검색</a></li>
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
								<div id="tableckckck">							
									<table id="goodsfacilityList" class="table table-striped">
										<thead>
											<tr>
												<th width="10%">시설/물품 개별관리코드</th>
												<th width="10%">시설/물품명</th>
												<th width="10%">행정기관명</th>
												<th width="10%">등록일자</th>									
											</tr>
										</thead>
										<tbody>									
											<c:forEach var="goodsfacilityDto" items="${map.goodsfacilityList}">
													<tr>
														<td>${goodsfacilityDto.goodsfacilityCode}</td>														
														<td>${goodsfacilityDto.goodsfacilityName}</td>
														<td>${goodsfacilityDto.goodsfacilityPurchaseprice}</td>
														<td>${goodsfacilityDto.goodsfacilityPriceRental}</td>													
													</tr>																						
											</c:forEach>									
										</tbody>
									</table>
									<%-- <table id="returnGoodsfacilityInfoList" class="table table-striped" hidden="hidden">
										<thead>
											<tr>
												<th width="10%">반납등록코드</th>
												<th width="10%">시설/물품명</th>
												<th width="10%">행정기관명</th>
												<th width="10%">반납한 회원명</th>
												<th width="10%">반납확인일</th>										
											</tr>
										</thead>
										<tbody>									
											<c:forEach var="returnGoodsfacilityInfoDto" items="${map.returnGoodsfacilityInfoList}">
													<tr>
														<td>${returnGoodsfacilityInfoDto.returGoodsfacilityInfoCode}</td>														
														<td>${returnGoodsfacilityInfoDto.goodsfacilityName}</td>
														<td>${returnGoodsfacilityInfoDto.adminagencyName}</td>
														<td>${returnGoodsfacilityInfoDto.citizenName}</td>
														<td>${returnGoodsfacilityInfoDto.dateReturnCheck}</td>													
													</tr>																						
											</c:forEach>									
										</tbody>
									</table>
									<table id="unitedAfterserviceRequestList" class="table table-striped" hidden="hidden">
										<thead>
											<tr>
												<th width="10%">AS의뢰신청코드</th>
												<th width="10%">정기/반납</th>
												<th width="10%">행정기관명</th>
												<th width="10%">반납받은 시설/물품명</th>
												<th width="10%">검수결과</th>
												<th width="10%">의뢰받은 대행업체명</th>
												<th width="10%">신청날짜</th>																		
											</tr>
										</thead>
										<tbody>									
											<c:forEach var="unitedAfterserviceRequestDto" items="${map.unitedAfterserviceRequestList}">
													<tr>
														<td>${unitedAfterserviceRequestDto.unitedAfterserviceRequestCode}</td>														
														<td>${unitedAfterserviceRequestDto.requestType}</td>
														<td>${unitedAfterserviceRequestDto.adminagencyName}</td>
														<td>${unitedAfterserviceRequestDto.goodsfacilityName}</td>													
														<td>${unitedAfterserviceRequestDto.textCheckResultGoodsfacility}</td>	
														<td>${unitedAfterserviceRequestDto.agencyName}</td>	
														<td>${unitedAfterserviceRequestDto.dateRequestAfterservice}</td>	
													</tr>																						
											</c:forEach>									
										</tbody>
									</table>
									<table id="agencyList" class="table table-striped" hidden="hidden">
										<thead>
											<tr>
												<th width="10%">대행업체등록코드</th>
												<th width="10%">행정기관명</th>
												<th width="10%">대행업체명</th>											
												<th width="10%">등록일자</th>									
											</tr>
										</thead>
										<tbody>									
											<c:forEach var="agencyDto" items="${map.agencyList}">
													<tr>
														<td>${agencyDto.agencyCode}</td>														
														<td>${agencyDto.adminagencyName}</td>
														<td>${agencyDto.agencyName}</td>
														<td>${agencyDto.goodsfacilityPriceRental}</td>													
													</tr>																						
											</c:forEach>									
										</tbody>
									</table>
									<table id="annualfeePakageList" class="table table-striped" hidden="hidden">
										<thead>
											<tr>
												<th width="10%">연회비/패키지코드</th>
												<th width="10%">연회비/패키지명</th> 
												<th width="10%">적용되는 행정기관명</th>
												<th width="10%">연회비/패키지등록날짜</th>									
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
									</table> --%>
								</div>
								<nav style="text-align:center">
									<ul class="pagination">
										<li>
											<a href="${pageContext.request.contextPath}/selectListFunctionary?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
										<li>
											<c:choose>
												<c:when test="${currentPage > 1}">
													<a href="${pageContext.request.contextPath}/selectListFunctionary?currentPage=${currentPage-1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Previous">
														<span aria-hidden="true">&lt;</span>
													</a>
												</c:when>
												<c:otherwise>
													<a href="${pageContext.request.contextPath}/selectListFunctionary?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Previous">
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
															<li class="active"><a href="${pageContext.request.contextPath}/selectListFunctionary?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
														</c:when>
														<c:otherwise>
															<li><a href="${pageContext.request.contextPath}/selectListFunctionary?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach var="pageNum" begin="${startPage}" end="${lastPage}" step="1">
													<c:choose>
														<c:when test="${pageNum == currentPage}">
															<li class="active"><a href="${pageContext.request.contextPath}/selectListFunctionary?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
														</c:when>
														<c:otherwise>
															<li><a href="${pageContext.request.contextPath}/selectListFunctionary?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										<li>
											<c:choose>
												<c:when test="${currentPage < lastPage}">
													<a href="${pageContext.request.contextPath}/selectListFunctionary?currentPage=${currentPage+1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Next">
														<span aria-hidden="true">&gt;</span>
													</a>
												</c:when>
												<c:otherwise>
													<a href="${pageContext.request.contextPath}/selectListFunctionary?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Next">
														<span aria-hidden="true">&gt;</span>
													</a>
												</c:otherwise>
											</c:choose>
										</li>
										<li>
											<a href="${pageContext.request.contextPath}/selectListFunctionary?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</ul>
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
