<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>select List Return Goodsfacility Info For AfterService</title>
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
					$(location).attr('href', './selectListReturnGoodsfacilityInfoForAfterService?pagePerRow=' + $('#selectPagePerRow > option:selected').val() + '&searchSelect=' + $('#monitorSearchSelect').text() + '&searchWord=' + $('#monitorSearchWord').text() + '&adminagencyCode=' + $('#adminagencyCode').val());
				});
				
				/* 검색버튼을 클릭하면 get방식으로  searchSignal, searchSelect, searchWord값을 넘긴다.*/
				$('#searchButton').click(function(){
					searchSelect = $('#selectButtonText').text();
					searchWord = $('#searchWord').val();
					$(location).attr('href', './selectListReturnGoodsfacilityInfoForAfterService?searchSignal=y&searchSelect=' + searchSelect + '&searchWord=' + searchWord + '&adminagencyCode=' + $('#adminagencyCode').val());
				});
				
			});
		</script>
	</head>
	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		
		<div class="container-fluid">
			<jsp:include page="../module/top/navbar.jsp"/>
			<%-- <jsp:include page="./module/top/mainHeader.jsp"/> --%>
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
									<h3>반납 AS의뢰 신청</h3>
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
												<li><a href="#">물품/시설 반납 코드</a></li>
												<li><a href="#">지자체 기관 코드</a></li>
												<li><a href="#">지자체 기관 명</a></li>
												<li><a href="#">반납확인 공무원 ID</a></li>
												<li><a href="#">물품/시설 코드</a></li>
												<li><a href="#">물품/시설 분류</a></li>
												<li><a href="#">물품/시설 카테고리</a></li>
												<li><a href="#">물품/시설 명</a></li>
												<!-- <li><a href="#">물품 상태 코드</a></li> -->
												<li><a href="#">물품 상태</a></li>
												<li><a href="#">AS 상태</a></li>
												<li><a href="#">반납 확인 일자</a></li>
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
										<td><strong>물품/시설 반납 코드</strong></td>
										<td><strong>지자체 기관 코드</strong></td>
										<td><strong>지자체 기관 명</strong></td>
										<td><strong>반납확인 공무원 ID</strong></td>
										<td><strong>물품/시설 코드</strong></td>
										<td><strong>물품/시설 분류</strong></td>
										<td><strong>물품/시설 카테고리</strong></td>
										<td><strong>물품/시설 명</strong></td>
										<!-- <td><strong>물품 상태 코드</strong></td> -->
										<td><strong>물품 상태</strong></td>
										<td><strong>AS 상태</strong></td>
										<td><strong>반납 확인 일자</strong></td>
										<td><strong>AS 의뢰 신청</strong></td>
									</tr>
								</thead>
								<tbody>
									<!--
										현재 selectListReturnGoodsfacilityInfoForAfterService.jsp 페이지에서는,
										(1) 현재 로그인 하고 있는 공무원 계정이 소속된 지자체 기관에 반납된 물품/시설 정보가 보인다.
										(2) <return_goodsfacility_info>테이블에서 물품상태가 "양호"한건 DB에서 가져오지 않는다.
										(3) <return_goodsfacility_info>테이블에서 is_finish_afterservice 속성이 "Y"인건 DB에서 가져오지 않는다.
										(4) <goodsfacility>테이블에서 goodsfacility_state_afterservice 속성이 "일반"("AS중"(X) )인 것만 DB에서 가져온다.
										공무원이 AS를 신청하면,
										<goodsfacility> 테이블에서 goodsfacility_state_afterservice 속성을 "일반"-> "AS중"으로 변경해주고(AS중 으로 update)
										동시에 goodsfacility_is_possible_rental 속성을 "Y" -> "N"으로 변경해준다.(N으로 update)
										
										공무원이  AS를 완료하면, <united_afterservice_request>테이블에 해당되는 FK(ForignKey)를 참조해 AS를 완료한 물품/시설의 
										<united_afterservice_request> , <return_goodsfacility_info>, <regular_check> 테이블에 있는
										is_finish_afterservice 속성을 "N"->"Y"로 변경해준다.
										
									  -->
									<c:forEach var="returnGoodsfacilityInfoDto" items="${list}">
										<tr>
											<td><strong>${returnGoodsfacilityInfoDto.returGoodsfacilityInfoCode}</strong></td>
											<td><strong>${returnGoodsfacilityInfoDto.adminagencyCode}</strong></td>
											<td><strong>${returnGoodsfacilityInfoDto.adminagencyName}</strong></td>
											<td><strong>${returnGoodsfacilityInfoDto.functionaryId}</strong></td>
											<td><strong>${returnGoodsfacilityInfoDto.goodsfacilityCode}</strong></td>
											<td><strong>${returnGoodsfacilityInfoDto.classifyGoodsfacility}</strong></td>
											<td><strong>${returnGoodsfacilityInfoDto.goodsfacilityThreeName}</strong></td>
											<td><strong>${returnGoodsfacilityInfoDto.goodsfacilityName}</strong></td>
											<%-- <td><strong>${returnGoodsfacilityInfoDto.stateGoodsCode}</strong></td> --%>
											<td><strong>${returnGoodsfacilityInfoDto.stateGoods}</strong></td>
											<td><strong>${returnGoodsfacilityInfoDto.goodsfacilityStateAfterservice}</strong></td>
											<td><strong>${returnGoodsfacilityInfoDto.dateReturnCheck}</strong></td>
											<td>
												<c:choose>
													<c:when test="${returnGoodsfacilityInfoDto.stateGoods ne '양호'}">
														<a href="${pageContext.request.contextPath}/insertUnitedAfterserviceRequest?returnGoodsfacilityInfoCode=${returnGoodsfacilityInfoDto.returGoodsfacilityInfoCode}&functionaryId=${member.memberId}&beforePageCode=반납AS" class="btn btn-primary" role="button">AS 의뢰 신청</a>		
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
										<a href="${pageContext.request.contextPath}/selectListReturnGoodsfacilityInfoForAfterService?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li>
										<c:choose>
											<c:when test="${currentPage > 1}">
												<a href="${pageContext.request.contextPath}/selectListReturnGoodsfacilityInfoForAfterService?currentPage=${currentPage-1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}"aria-label="Previous">
													<span aria-hidden="true">&lt;</span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/selectListReturnGoodsfacilityInfoForAfterService?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}"aria-label="Previous">
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
														<li class="active"><a href="${pageContext.request.contextPath}/selectListReturnGoodsfacilityInfoForAfterService?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}">${pageNum}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="${pageContext.request.contextPath}/selectListReturnGoodsfacilityInfoForAfterService?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}">${pageNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach var="pageNum" begin="${beginPageNumForCurrentPage}" end="${lastPage}" step="1">
												<c:choose>
													<c:when test="${pageNum == currentPage}">
														<li class="active"><a href="${pageContext.request.contextPath}/selectListReturnGoodsfacilityInfoForAfterService?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}">${pageNum}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="${pageContext.request.contextPath}/selectListReturnGoodsfacilityInfoForAfterService?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}">${pageNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									<li>
										<c:choose>
											<c:when test="${currentPage < lastPage}">
												<a href="${pageContext.request.contextPath}/selectListReturnGoodsfacilityInfoForAfterService?currentPage=${currentPage+1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}" aria-label="Next">
													<span aria-hidden="true">&gt;</span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/selectListReturnGoodsfacilityInfoForAfterService?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}"aria-label="Next">
													<span aria-hidden="true">&gt;</span>
												</a>
											</c:otherwise>
										</c:choose>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/selectListReturnGoodsfacilityInfoForAfterService?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}" aria-label="Next">
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