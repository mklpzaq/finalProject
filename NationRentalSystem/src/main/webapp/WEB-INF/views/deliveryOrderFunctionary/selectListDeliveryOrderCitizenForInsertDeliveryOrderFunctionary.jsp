<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>select List Delivery Order Citizen For Insert Delivery Order Functionary</title>
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
					$(location).attr('href', './selectListDeliveryOrderCitizenForInsertDeliveryOrderFunctionary?pagePerRow=' + $('#selectPagePerRow > option:selected').val() + '&searchSelect=' + $('#monitorSearchSelect').text() + '&searchWord=' + $('#monitorSearchWord').text() + '&adminagencyCode=' + $('#adminagencyCode').val());
				});
				
				/* 검색버튼을 클릭하면 get방식으로  searchSignal, searchSelect, searchWord값을 넘긴다.*/
				$('#searchButton').click(function(){
					searchSelect = $('#selectButtonText').text();
					searchWord = $('#searchWord').val();
					$(location).attr('href', './selectListDeliveryOrderCitizenForInsertDeliveryOrderFunctionary?searchSignal=y&searchSelect=' + searchSelect + '&searchWord=' + searchWord + '&adminagencyCode=' + $('#adminagencyCode').val());
				});
				
			});
		</script>
	</head>
	<body>
		<jsp:include page="../module/backgroundImg/backgroundImg.jsp"/>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="height:100%; margin:15px 0 0 0;">
			<div class="row" >
				<div class="col-sm-2">
					<jsp:include page="../module/leftUnitedAfterserviceRequest/leftUnitedAfterserviceRequest.jsp"/>
				</div>
				<div class="col-sm-9">
					<!-- Begin Content -->
					
					<input id="adminagencyCode" type="hidden" value="${member.adminagencyCode}">
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<div class="row">
								<div class="col-md-4">
									<strong>${currentPage} / ${lastPage} Page</strong><br/>
									<strong>searchSelect : </strong><span id="monitorSearchSelect">${searchSelect}</span><br/>
									<strong>searchWord : </strong><span id="monitorSearchWord">${searchWord}</span><br/>						
								</div>
								<div class="col-md-4">
									<h3>배달 의뢰 신청</h3>
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
												<li><a href="#">시민 배달 신청 코드</a></li>
												<li><a href="#">시설/물품 대여 코드</a></li>
												<li><a href="#">지자체 기관 코드</a></li>
												<li><a href="#">지자체 기관명</a></li>
												<li><a href="#">물품/시설 코드</a></li>
												<li><a href="#">물품/시설 분류</a></li>
												<li><a href="#">물품/시설 카테고리 코드</a></li>
												<!-- <li><a href="#">물품/시설 카테고리</a></li> -->
												<li><a href="#">물품/시설 명</a></li>
												<li><a href="#">대여/반납 상태</a></li>
												<li><a href="#">배달 요청 시민 ID</a></li>
												<!-- <li><a href="#">보내는 주소</a></li>
												<li><a href="#">받는 주소</a></li> -->
												<li><a href="#">배달 취소 여부</a></li>
												<li><a href="#">시민 배달 신청 날짜</a></li>
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
										<td><strong>시민 배달 신청 코드</strong></td>
										<td><strong>시설/물품 대여 코드</strong></td>
										<td><strong>지자체 기관 코드</strong></td>
										<td><strong>지자체 기관명</strong></td>
										<td><strong>물품/시설 코드</strong></td>
										<td><strong>물품/시설 분류</strong></td>
										<!-- <td><strong>물품/시설 카테고리 코드</strong></td> -->
										<td><strong>물품/시설 카테고리</strong></td>
										<td><strong>물품/시설 명</strong></td>
										<td><strong>대여/반납 상태</strong></td>
										<td><strong>배달 요청 시민 ID</strong></td>
										<td><strong>보내는 주소</strong></td>
										<td><strong>받는 주소</strong></td>
										<td><strong>배달 취소 여부</strong></td>
										<td><strong>시민 배달 신청 날짜</strong></td>
										<td><strong>공무원 배달 의뢰 신청</strong></td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="deliveryOrderFunctionaryDto" items="${list}">
										<tr>
											<td><strong>${deliveryOrderFunctionaryDto.deliveryOrderCitizenCode}</strong></td>
											<td><strong>${deliveryOrderFunctionaryDto.goodsfacilityRentalCode}</strong></td>
											<td><strong>${deliveryOrderFunctionaryDto.adminagencyCode}</strong></td>
											<td><strong>${deliveryOrderFunctionaryDto.adminagencyName}</strong></td>
											<td><strong>${deliveryOrderFunctionaryDto.goodsfacilityCode}</strong></td>
											<td><strong>${deliveryOrderFunctionaryDto.goodsfacilityClassifyGoodsfacility}</strong></td>
											<%-- <td><strong>${deliveryOrderFunctionaryDto.goodsfacilityThreeCode}</strong></td> --%>
											<td><strong>${deliveryOrderFunctionaryDto.goodsfacilityThreeName}</strong></td>
											<td><strong>${deliveryOrderFunctionaryDto.goodsfacilityName}</strong></td>
											<td><strong>${deliveryOrderFunctionaryDto.classifyRentalState}</strong></td>
											<td><strong>${deliveryOrderFunctionaryDto.citizenId}</strong></td>
											<td><strong>${deliveryOrderFunctionaryDto.sendAddressSido} ${deliveryOrderFunctionaryDto.sendAddressSigungu} ${deliveryOrderFunctionaryDto.sendAddressEupmyeon} ${deliveryOrderFunctionaryDto.sendAddressSangse}</strong></td>
											<td><strong>${deliveryOrderFunctionaryDto.receiveAddressSido} ${deliveryOrderFunctionaryDto.receiveAddressSigungu} ${deliveryOrderFunctionaryDto.receiveAddressEupmyeon} ${deliveryOrderFunctionaryDto.receiveAddressSangse}</strong></td>
											<td><strong>${deliveryOrderFunctionaryDto.isCanceledDelivery}</strong></td>
											<td><strong>${deliveryOrderFunctionaryDto.deliveryOrderCitizenDate}</strong></td>
											<td>
												<a href="${pageContext.request.contextPath}/insertDeliveryOrderFunctionary?deliveryOrderCitizenCode=${deliveryOrderFunctionaryDto.deliveryOrderCitizenCode}&functionaryId=${member.memberId}&adminagencyCode=${member.adminagencyCode}" class="btn btn-primary" role="button">배달 의뢰 신청</a>
											</td>
											
											
											<!-- <td><a href="#">수정</a></td>
											<td><a href="">삭제</a></td> -->
											<%-- <td><strong>${article.articleId}</strong></td>
											<td>${board.boardTitle}</td>
											<td><a href="${pageContext.request.contextPath}/getDetailArticle?sendNo=${article.articleId}">${article.articleTitle}</a></td>
											<td>${article.articleContent}</td>
											<td><a href="${pageContext.request.contextPath}/updateArticle?sendNo=${article.articleId}">수정</a></td>
											<td><a href="${pageContext.request.contextPath}/deleteArticle?sendNo=${article.articleId}">삭제</a></td> --%>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<nav>
								<ul class="pagination">
									<li>
										<a href="${pageContext.request.contextPath}/selectListDeliveryOrderCitizenForInsertDeliveryOrderFunctionary?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li>
										<c:choose>
											<c:when test="${currentPage > 1}">
												<a href="${pageContext.request.contextPath}/selectListDeliveryOrderCitizenForInsertDeliveryOrderFunctionary?currentPage=${currentPage-1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}"aria-label="Previous">
													<span aria-hidden="true">&lt;</span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/selectListDeliveryOrderCitizenForInsertDeliveryOrderFunctionary?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}"aria-label="Previous">
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
														<li class="active"><a href="${pageContext.request.contextPath}/selectListDeliveryOrderCitizenForInsertDeliveryOrderFunctionary?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}">${pageNum}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="${pageContext.request.contextPath}/selectListDeliveryOrderCitizenForInsertDeliveryOrderFunctionary?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}">${pageNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach var="pageNum" begin="${beginPageNumForCurrentPage}" end="${lastPage}" step="1">
												<c:choose>
													<c:when test="${pageNum == currentPage}">
														<li class="active"><a href="${pageContext.request.contextPath}/selectListDeliveryOrderCitizenForInsertDeliveryOrderFunctionary?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}">${pageNum}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="${pageContext.request.contextPath}/selectListDeliveryOrderCitizenForInsertDeliveryOrderFunctionary?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}">${pageNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									<li>
										<c:choose>
											<c:when test="${currentPage < lastPage}">
												<a href="${pageContext.request.contextPath}/selectListDeliveryOrderCitizenForInsertDeliveryOrderFunctionary?currentPage=${currentPage+1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}" aria-label="Next">
													<span aria-hidden="true">&gt;</span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/selectListDeliveryOrderCitizenForInsertDeliveryOrderFunctionary?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}"aria-label="Next">
													<span aria-hidden="true">&gt;</span>
												</a>
											</c:otherwise>
										</c:choose>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/selectListDeliveryOrderCitizenForInsertDeliveryOrderFunctionary?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchSelect=${searchSelect}&searchWord=${searchWord}&adminagencyCode=${member.adminagencyCode}" aria-label="Next">
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
				<div class="col-sm-1"></div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>
			
					
					
					
					
	</body>
</html>