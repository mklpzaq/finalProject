<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>View Image GoodsFacility</title>
		<script>
			$(document).ready(function() {
				var searchOption;
				var keyword;
				
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
					$('#selectButtonText, #moniterSearchOption').text($(this).text());
					$('#selectButton').parent().removeClass('open');
				});
				
				$('#selectPagePerRow').change(function() {
					/* searchSelect = $('#monitorSearchSelect').text();
					searchWord = $('#monitorSearchWord').val(); */
					$(location).attr('href', './viewImageGoodsFacility?pagePerRow=' + $('#selectPagePerRow > option:selected').val() + '&searchOption=' + $('#moniterSearchOption').text() + '&keyword=' + $('#monitorKeyword').text());
				});
				
				/* 검색버튼을 클릭하면 get방식으로  searchSignal, searchSelect, searchWord값을 넘긴다.*/
				$('#searchButton').click(function(){
					searchOption = $('#selectButtonText').text();
					keyword = $('#keyword').val();
					$(location).attr('href', './viewImageGoodsFacility?searchSignal=y&searchOption=' + searchOption + '&keyword=' + keyword);
				});
			});
		</script>
	</head>
	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		<!-- style="height:1500px;" -->
		<div class="container-fluid">
			<jsp:include page="../module/top/navbar.jsp"/>
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<%-- <jsp:include page="../module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->

					<div style="margin:15px 0 0 0;" class="panel panel-default">
							<div class="panel-body text-center">
								<div class="row">
									<div class="col-md-4">
										<strong>${currentPage} / ${lastPage} Page</strong><br/>
										<strong>searchOption : </strong><span id="moniterSearchOption">${searchOption}</span><br/>
										<strong>keyword : </strong><span id="monitorKeyword">${keyword}</span><br/>						
									</div>
									<div class="col-md-4">
										<h3>대여 시설/물품 리스트</h3>
									</div>
									<div class="col-md-4">
										<select id="selectPagePerRow" name="selectPagePerRow">
											<option value="8"<c:if test="${pagePerRow == 8}">selected</c:if>>8</option>
											<option value="12"<c:if test="${pagePerRow == 12}">selected</c:if>>12</option>
											<option value="16"<c:if test="${pagePerRow == 16}">selected</c:if>>16</option>
											<option value="20"<c:if test="${pagePerRow == 20}">selected</c:if>>20</option>
										</select>개씩 보기
										
									</div>
								</div>
								<hr/>
								
								<%-- <!-- Begin Search -->
								<div class="row">
									<div class="col-sm-2"></div>
									<div class="col-sm-8">
										
										<div class="input-group">
											<div class="input-group-btn">
												<button type="button" id="selectButton" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
													<span id="selectButtonText">${searchOption}</span> <span class="caret"></span>
												</button>
												<ul id="dropDownMenu" class="dropdown-menu" role="menu">
													<li><a href="#">시설 & 물품 명</a></li>
													<li><a href="#">주소</a></li>
													<li><a href="#">배달가능여부</a></li>
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
								<!-- End Search --> --%>
								
								<div class="row">
									<c:forEach var="GoodsFacility" items="${list}">
										<div class="col-sm-3">
											<div class="thumbnail">
												<c:forEach var="GoodsFacilityImage"  items="${GoodsFacility.goodsFacilityFile}">
													<img data-src="holder.js/100%x200" alt="${GoodsFacilityImage.goodsfacilityFileName}${GoodsFacilityImage.goodsfacilityFileExt}" src="${pageContext.request.contextPath}/downloadFile?goodsfacilityName=${GoodsFacilityImage.goodsfacilityFileName}&goodsfacilityFileExt=${GoodsFacilityImage.goodsfacilityFileExt}" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">
												</c:forEach>
												<div class="caption">
													<!-- <h3 style="text-align:center;" id="thumbnail-label">이준희<a class="anchorjs-link" href="#thumbnail-label"><span class="anchorjs-icon"></span></a></h3> -->
													<p>"${GoodsFacility.goodsfacilityName}"</p>
													<a href="${pageContext.request.contextPath}/viewImageDetail?goodsfacilityCode=${GoodsFacility.goodsfacilityCode}" class="btn btn-primary" role="button">상세보기 </a>
												</div>										
											</div>
										</div>
									</c:forEach>
								</div>	
								
								
								
								<nav>
									<ul class="pagination">
										<li>
											<a href="${pageContext.request.contextPath}/viewImageGoodsFacility?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
										<li>
											<c:choose>
												<c:when test="${currentPage > 1}">
													<a href="${pageContext.request.contextPath}/viewImageGoodsFacility?currentPage=${currentPage-1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Previous">
														<span aria-hidden="true">&lt;</span>
													</a>
												</c:when>
												<c:otherwise>
													<a href="${pageContext.request.contextPath}/viewImageGoodsFacility?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Previous">
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
															<li class="active"><a href="${pageContext.request.contextPath}/viewImageGoodsFacility?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
														</c:when>
														<c:otherwise>
															<li><a href="${pageContext.request.contextPath}/viewImageGoodsFacility?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach var="pageNum" begin="${beginPageNumForCurrentPage}" end="${lastPage}" step="1">
													<c:choose>
														<c:when test="${pageNum == currentPage}">
															<li class="active"><a href="${pageContext.request.contextPath}/viewImageGoodsFacility?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
														</c:when>
														<c:otherwise>
															<li><a href="${pageContext.request.contextPath}/viewImageGoodsFacility?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										<li>
											<c:choose>
												<c:when test="${currentPage < lastPage}">
													<a href="${pageContext.request.contextPath}/viewImageGoodsFacility?currentPage=${currentPage+1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Next">
														<span aria-hidden="true">&gt;</span>
													</a>
												</c:when>
												<c:otherwise>
													<a href="${pageContext.request.contextPath}/viewImageGoodsFacility?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Next">
														<span aria-hidden="true">&gt;</span>
													</a>
												</c:otherwise>
											</c:choose>
										</li>
										<li>
											<a href="${pageContext.request.contextPath}/viewImageGoodsFacility?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</ul>
								</nav>
							</div>
						</div>					



					<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<div>
			<jsp:include page="../module/bottom/bottomContent.jsp"/>
		</div>
	</body>
</html>