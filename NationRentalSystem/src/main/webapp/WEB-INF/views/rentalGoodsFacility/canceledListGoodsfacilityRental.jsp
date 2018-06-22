<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>대여예약결제취소목록</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<!-- <script>
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
					$(location).attr('href', './selectListAgencyBusinesstype?pagePerRow=' + $('#selectPagePerRow > option:selected').val() + '&searchOption=' + $('#moniterSearchOption').text() + '&keyword=' + $('#moniterKeyword').text());
				});
				
				/* 검색버튼을 클릭하면 get방식으로  searchSignal, searchOption, keyword값을 넘긴다.*/
				$('#searchButton').click(function(){
					searchOption = $('#selectButtonText').text();
					keyword = $('#keyword').val();
					$(location).attr('href', './selectListAgencyBusinesstype?=y&searchOption=' + searchOption + '&keyword=' + keyword);
				});
				
			});
		</script>	 -->	
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
				</div>
				<div class="col-sm-8"><br>
					<!-- Begin Content -->
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<div class="row">
								<div class="col-md-4">
									<strong>${currentPage} / ${lastPage} Page</strong><br/>
									<strong>searchOption : </strong><span id="moniterSearchOption">${searchOption}</span><br/>
									<strong>keyword : </strong><span id="monitorKeyword">${keyword}</span><br/>						
								</div>
								<div class="col-md-4">
									<h3>대여예약 결제취소</h3>
								</div>
								<%-- <div class="col-md-4">
									<select id="selectPagePerRow" name="selectPagePerRow">
										<option value="5"<c:if test="${pagePerRow == 5}">selected</c:if>>5</option>
										<option value="10"<c:if test="${pagePerRow == 10}">selected</c:if>>10</option>
										<option value="15"<c:if test="${pagePerRow == 15}">selected</c:if>>15</option>
										<option value="20"<c:if test="${pagePerRow == 20}">selected</c:if>>20</option>
										<option value="30"<c:if test="${pagePerRow == 30}">selected</c:if>>30</option>
										<option value="40"<c:if test="${pagePerRow == 40}">selected</c:if>>40</option>
										<option value="50"<c:if test="${pagePerRow == 50}">selected</c:if>>50</option>
									</select>개씩 보기
								</div> --%>
							</div>
							<hr/>
							<table class="table table-striped">
								<thead>
									<tr>
										<!-- <td width="5%">신청코드</td>
										<td width="10%">주문자</td>
										<td width="10%">물품시설</td>
										<td width="10%">행정기관</td>
										<td width="10%">대여료</td>
										<td width="10%">사용포인트</td>
										<td width="15%">사용패키지</td>
										<td width="10%">배송비</td>	
										<td width="10%">결제금액</td>
										<td width="10%">결제날짜</td> -->
										<td>행정기관코드</td>
										<td>연락처</td>
										<td>시설&물품개별관리코드</td>
										<td>시설&물품명</td>
										<td>대여&대관 시작일</td>
										<td>대여/대관 종료일</td>
										<td>배달신청여부</td>
										<td>신청날짜</td>								
									</tr>
								</thead>
								<tbody>									
									<%-- <c:forEach var="rentalTotalPaymentDtoList" items="${rentalTotalPaymentDtoList}">
										<tbody>
											<tr>
												<td>${rentalTotalPaymentDtoList.goodsfacility_rental_code}신청코드</td>
												<td>${rentalTotalPaymentDtoList.citizen_id}주문자</td>
												<td>${rentalTotalPaymentDtoList.goodsfacility_name}물품시설</td>
												<td>${rentalTotalPaymentDtoList.goodsfacility_price_rental}대여료</td>
												<td>${rentalTotalPaymentDtoList.used_point}사용포인트</td>
												<td>${rentalTotalPaymentDtoList.annualfee_pakage_name}사용패키지</td>
												<td>${rentalTotalPaymentDtoList.delivery_price}배송비</td>	
												<td>${rentalTotalPaymentDtoList.rental_total_payment}결제금액</td>
												<td>${rentalTotalPaymentDtoList.date_payment}결제날짜</td>	
											</tr>
										</tbody>
									</c:forEach>	 --%>	
									<c:forEach var="rentGoodsfacilityDto" items="${list}">
											<tr>	
												<td>${rentGoodsfacilityDto.adminagencyCode}</td>
												<td>${rentGoodsfacilityDto.citizenPhone}</td> 
												<td>${rentGoodsfacilityDto.goodsfacilityCode}</td>
												<td>${rentGoodsfacilityDto.goodsfacilityName}</td>
												<td>${rentGoodsfacilityDto.goodsfacilityRentalDateStart}</td>
												<td>${rentGoodsfacilityDto.goodsfacilityRentalDayEnd}</td>
												<td>${rentGoodsfacilityDto.goodsfacilityRentalIsOrderedDelivery}</td>
												<td>${rentGoodsfacilityDto.goodsfacilityRentalDateRegistration}</td>
												</tr>
										</c:forEach>								
								</tbody>
							</table>
							<!-- 페이징 -->
							<%-- <nav>
								<ul class="pagination">
									<li>
										<a href="${pageContext.request.contextPath}/selectListAgencyBusinesstype?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li>
										<c:choose>
											<c:when test="${currentPage > 1}">
												<a href="${pageContext.request.contextPath}/selectListAgencyBusinesstype?currentPage=${currentPage-1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Previous">
													<span aria-hidden="true">&lt;</span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/selectListAgencyBusinesstype?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Previous">
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
														<li class="active"><a href="${pageContext.request.contextPath}/selectListAgencyBusinesstype?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="${pageContext.request.contextPath}/selectListAgencyBusinesstype?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach var="pageNum" begin="${startPage}" end="${lastPage}" step="1">
												<c:choose>
													<c:when test="${pageNum == currentPage}">
														<li class="active"><a href="${pageContext.request.contextPath}/selectListAgencyBusinesstype?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="${pageContext.request.contextPath}/selectListAgencyBusinesstype?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									<li>
										<c:choose>
											<c:when test="${currentPage < lastPage}">
												<a href="${pageContext.request.contextPath}/selectListAgencyBusinesstype?currentPage=${currentPage+1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Next">
													<span aria-hidden="true">&gt;</span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/selectListAgencyBusinesstype?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Next">
													<span aria-hidden="true">&gt;</span>
												</a>
											</c:otherwise>
										</c:choose>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/selectListAgencyBusinesstype?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</nav> --%>
							<!-- 페이징 끝 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>	
	</body>
</html>