<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>select List RegularCheck</title>
		<script>
			$(document).ready(function() {
				var searchSelect;
				var searchWord;
				
				/* 드롭다운 박스 클릭시 열고 닫고 이벤트 */
				$('#selectButton').click(function(){
					if($('#selectButton').parent().hasClass('open')){
						$('#selectButton').parent().removeClass('open');
					}else{
						$('#selectButton').parent().addClass('open');
					}
				});
				
				/* 드롭메뉴 클릭했을때 글자 바꾸기와 드롭메뉴 닫기 */
				$('#dropDownMenu > li').click(function(){
					/* searchButton을 누르면 searchWord변수의 값을 get방식으로 getBoardListController로 검색어와 함께 넘길 것이다.
					*  클릭했을때 선택한 select내용의 값을 #selectButtonText에 넣어준다.
					*/
					$('#selectButtonText, #monitorSearchSelect').text($(this).text());
					$('#selectButton').parent().removeClass('open');
				});
				
				$('#selectPagePerRow').change(function() {
					/* searchSelect = $('#monitorSearchSelect').text();
					searchWord = $('#monitorSearchWord').val(); */
					$(location).attr('href', './selectListRegularCheckForAfterService?pagePerRow=' + $('#selectPagePerRow > option:selected').val() + '&searchSelect=' + $('#monitorSearchSelect').text() + '&searchWord=' + $('#monitorSearchWord').text() + '&adminagencyCode=' + $('#adminagencyCode').val());
				});
				
				/* 검색버튼을 클릭하면 get방식으로  searchSignal, searchSelect, searchWord값을 넘긴다.*/
				$('#searchButton').click(function(){
					searchSelect = $('#selectButtonText').text();
					searchWord = $('#searchWord').val();
					$(location).attr('href', './selectListRegularCheckForAfterService?searchSignal=y&searchSelect=' + searchSelect + '&searchWord=' + searchWord + '&adminagencyCode=' + $('#adminagencyCode').val());
				});
				
			});
		</script>
	</head>
	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		
		<div class="container-fluid" style="height:1100px;">
			<jsp:include page="../module/top/navbar.jsp"/>
			<div class="row" >
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="../module/leftUnitedAfterserviceRequest/leftUnitedAfterserviceRequest.jsp"/>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
					<input id="adminagencyCode" type="hidden" value="${member.adminagencyCode}">
					<div style="margin:15px 0 0 0;" class="panel panel-default">
						<div class="panel-body text-center">
							<div class="row">
								<div class="col-md-4">
									<strong>${currentPage} / ${lastPage} Page</strong><br/>
									<strong>searchSelect : </strong><span id="monitorSearchSelect">${searchSelect}</span><br/>
									<strong>searchWord : </strong><span id="monitorSearchWord">${searchWord}</span><br/>						
								</div>
								<div class="col-md-4">
									<h3>점검 AS의뢰 신청</h3>
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
										<div class="input-group-btn">
											<button type="button" id="selectButton" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
												<span id="selectButtonText">${searchSelect}</span> <span class="caret"></span>
											</button>
											<ul id="dropDownMenu" class="dropdown-menu" role="menu">
												<li><a href="#">정기점검 코드</a></li>
												<li><a href="#">지자체 기관 코드</a></li>
												<li><a href="#">지자체 기관 명</a></li>
												<li><a href="#">점검 공무원 ID</a></li>
												<li><a href="#">물품/시설 코드</a></li>
												<li><a href="#">물품/시설 분류</a></li>
												<!-- <li><a href="#">물품/시설 카테고리 코드</a></li> -->
												<li><a href="#">물품/시설 카테고리</a></li>
												<li><a href="#">물품/시설 명</a></li>
												<!-- <li><a href="#">물품/시설 상태 코드</a></li> -->
												<li><a href="#">물품/시설 상태</a></li>
												<li><a href="#">정기점검 결과</a></li>
												<li><a href="#">AS 상태</a></li>
												<li><a href="#">정기점검 결과 날짜</a></li>
											</ul>
										</div>
										<input type="text" id="searchWord" class="form-control" placeholder="검색어 입력">
										<span class="input-group-btn">
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
										<td><strong>정기점검 코드</strong></td>
										<td><strong>지자체 기관 코드</strong></td>
										<td><strong>지자체 기관 명</strong></td>
										<td><strong>점검 공무원 ID</strong></td>
										<td><strong>물품/시설 코드</strong></td>
										<td><strong>물품/시설 분류</strong></td>
										<!-- <td><strong>물품/시설 카테고리 코드</strong></td> -->
										<td><strong>물품/시설 카테고리</strong></td>
										<td><strong>물품/시설 명</strong></td>
										<!-- <td><strong>물품/시설 상태 코드</strong></td> -->
										<td><strong>물품/시설 상태</strong></td>
										<td><strong>정기점검 결과</strong></td>
										<td><strong>AS 상태</strong></td>
										<td><strong>정기점검 결과 날짜</strong></td>
										<td><strong>통합 AS 신청</strong></td>
										<!-- <td><strong>수정</strong></td>
										<td><strong>삭제</strong></td> -->
									</tr>
								</thead>
								<tbody>
									<c:forEach var="regularCheckDto" items="${list}">
										<tr>
											<td><strong>${regularCheckDto.regularCheckCode}</strong></td>
											<td><strong>${regularCheckDto.adminagencyCode}</strong></td>
											<td><strong>${regularCheckDto.adminagencyName}</strong></td>
											<td><strong>${regularCheckDto.functionaryId}</strong></td>
											<td><strong>${regularCheckDto.goodsfacilityCode}</strong></td>
											<td><strong>${regularCheckDto.goodsfacilityClassifyGoodsfacility}</strong></td>
											<%-- <td><strong>${regularCheckDto.goodsfacilityThreeCode}</strong></td> --%>
											<td><strong>${regularCheckDto.goodsfacilityThreeName}</strong></td>
											<td><strong>${regularCheckDto.goodsfacilityName}</strong></td>
											<%-- <td><strong>${regularCheckDto.stateGoodsCode}</strong></td> --%>
											<td><strong>${regularCheckDto.stateGoods}</strong></td>
											<td><strong>${regularCheckDto.textRegularCheck}</strong></td>
											<td><strong>${regularCheckDto.goodsfacilityStateAfterservice}</strong></td>
											<td><strong>${regularCheckDto.dateRegularCheckGoodsfacility}</strong></td>
											<td>
												<c:choose>
													<c:when test="${returnGoodsfacilityInfoDto.stateGoods ne '양호'}">
														<a href="${pageContext.request.contextPath}/insertUnitedAfterserviceRequest?regularCheckCode=${regularCheckDto.regularCheckCode}&functionaryId=${member.memberId}&beforePageCode=점검AS" class="btn btn-primary" role="button">AS 의뢰 신청</a>		
													</c:when>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<nav>
								<ul class="pagination">
									<li>
										<a href="${pageContext.request.contextPath}/selectListRegularCheckForAfterService?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li>
										<c:choose>
											<c:when test="${currentPage > 1}">
												<a href="${pageContext.request.contextPath}/selectListRegularCheckForAfterService?currentPage=${currentPage-1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}"aria-label="Previous">
													<span aria-hidden="true">&lt;</span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/selectListRegularCheckForAfterService?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}"aria-label="Previous">
													<span aria-hidden="true">&lt;</span>
												</a>
											</c:otherwise>
										</c:choose>
									</li>
									<c:choose>
										<c:when test="${lastPage > beginPageNumForCurrentPage + 4}">
											<c:forEach var="pageNum" begin="${beginPageNumForCurrentPage}" end="${beginPageNumForCurrentPage + 4}" step="1">
												<c:choose>
													<c:when test="${pageNum == currentPage}">
														<li class="active"><a href="${pageContext.request.contextPath}/selectListRegularCheckForAfterService?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}">${pageNum}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="${pageContext.request.contextPath}/selectListRegularCheckForAfterService?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}">${pageNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach var="pageNum" begin="${beginPageNumForCurrentPage}" end="${lastPage}" step="1">
												<c:choose>
													<c:when test="${pageNum == currentPage}">
														<li class="active"><a href="${pageContext.request.contextPath}/selectListRegularCheckForAfterService?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}">${pageNum}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="${pageContext.request.contextPath}/selectListRegularCheckForAfterService?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}">${pageNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									<li>
										<c:choose>
											<c:when test="${currentPage < lastPage}">
												<a href="${pageContext.request.contextPath}/selectListRegularCheckForAfterService?currentPage=${currentPage+1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}" aria-label="Next">
													<span aria-hidden="true">&gt;</span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/selectListRegularCheckForAfterService?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}"aria-label="Next">
													<span aria-hidden="true">&gt;</span>
												</a>
											</c:otherwise>
										</c:choose>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/selectListRegularCheckForAfterService?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>					
				
					<p>파일 저장 루트 : ${path}</p>
					
						
						
						
						
						
						
		
		
					<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>
				
		
		
	</body>
</html>