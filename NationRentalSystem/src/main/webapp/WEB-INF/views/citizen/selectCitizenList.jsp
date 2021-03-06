<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>Select List</title>

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
					$(location).attr('href', './getCitizenList?pagePerRow=' + $('#selectPagePerRow > option:selected').val() + '&searchOption=' + $('#moniterSearchOption').text() + '&keyword=' + $('#monitorKeyword').text());
				});
				
				/* 검색버튼을 클릭하면 get방식으로  searchSignal, searchSelect, searchWord값을 넘긴다.*/
				$('#searchButton').click(function(){
					searchOption = $('#selectButtonText').text();
					keyword = $('#keyword').val();
					$(location).attr('href', './getCitizenList?searchSignal=y&searchOption=' + searchOption + '&keyword=' + keyword);
				});
				
				//리스트에서 회원 삭제를 위한 체크박스(임가현 작성)
				$(document).ready(function(){
					$("#delbtn").click(function(){
						$('input[name="deleteCheckbox"]:checked').each(function(){							
							var text = $(this).val();				
							$("#deleteCheck").submit();	
						});
					})	
				});
			
				$(document).ready(function(){
					$("#checkboxAll").click(function(){
						if($(this).prop("checked")){
							$("input[type=checkbox]").prop("checked",true);
						}else{
							$("input[type=checkbox]").prop("checked",false);
						}
					});			
				});
				
			});
		</script>
</head>
<body>
		<div class="container-fluid">
				<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
				<jsp:include page="/WEB-INF/views/module/top/mainHeader.jsp"/>
				<div class="row">
					<div class="col-sm-2" style="padding:15px;">
						<%-- <jsp:include page="./module/left/leftnavi.jsp"/> --%>
					</div>
					<div class="col-sm-8">
					<!-- Begin Content -->
					
					<h2>시민 조회</h2>
					
					<div class="panel panel-default">
							<div class="panel-body text-center">
								<div class="row">
									<div class="col-md-4">
										<strong>${currentPage} / ${lastPage} Page</strong><br/>
										<strong>searchOption : </strong><span id="moniterSearchOption">${searchOption}</span><br/>
										<strong>keyword : </strong><span id="monitorKeyword">${keyword}</span><br/>						
									</div>
									<div class="col-md-4">
										<h3>시민회원 List</h3>
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
													<span id="selectButtonText">${searchOption}</span> <span class="caret"></span>
												</button>
												<ul id="dropDownMenu" class="dropdown-menu" role="menu">
													<li><a href="#">citizenId</a></li>
													<li><a href="#">citizenName</a></li>
													<li><a href="#">citizenEmail</a></li>
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
								<form id="deleteCheck" action="${pageContext.request.contextPath}/deleteCitizen" method="get" >
									<table class="table table-striped">
										<thead>
											<tr>
												<td><input type="checkbox" id="checkboxAll" value=""></td>
												<td width="10%">아이디</td>
												<td width="10%">비밀번호</td>
												<td width="10%">이름</td>
												<td width="15%">시군구</td>
												<td width="10%">시도</td>
												<td width="10%">읍면동</td>
												<td width="15%">주소</td>
												<td width="10%">핸드폰번호</td>
												<td width="10%">이메일</td>										
											</tr>
										</thead>
										<tbody>								
											<c:forEach var="citizenDto" items="${list}">
												<tbody>
													<tr>
														<th><input type="checkbox" name="deleteCheckbox" value="${citizenDto.citizenId}"></th>
														<th>${citizenDto.citizenId}</th>
														<th>${citizenDto.citizenPw}</th>
														<td>${citizenDto.citizenName}</td>
														<td>${citizenDto.sigunguName}</td>
														<td>${citizenDto.sidoName}</td>
														<td>${citizenDto.eupmyeonName}</td>
														<td>${citizenDto.citizenAddressSangse}</td>
														<td>${citizenDto.citizenPhone}</td>
														<td>${citizenDto.citizenEmail}</td>																							
													</tr>
												</tbody>
											</c:forEach>						
										</tbody>
									</table>
								</form>	
								<div>
							  		<button id="delbtn">선택 회원 삭제</button>
								</div>
								<nav>
									<ul class="pagination">
										<li>
											<a href="${pageContext.request.contextPath}/getCitizenList?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
										<li>
											<c:choose>
												<c:when test="${currentPage > 1}">
													<a href="${pageContext.request.contextPath}/getCitizenList?currentPage=${currentPage-1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Previous">
														<span aria-hidden="true">&lt;</span>
													</a>
												</c:when>
												<c:otherwise>
													<a href="${pageContext.request.contextPath}/getCitizenList?currentPage=1&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Previous">
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
															<li class="active"><a href="${pageContext.request.contextPath}/getCitizenList?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
														</c:when>
														<c:otherwise>
															<li><a href="${pageContext.request.contextPath}/getCitizenList?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach var="pageNum" begin="${beginPageNumForCurrentPage}" end="${lastPage}" step="1">
													<c:choose>
														<c:when test="${pageNum == currentPage}">
															<li class="active"><a href="${pageContext.request.contextPath}/getCitizenList?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
														</c:when>
														<c:otherwise>
															<li><a href="${pageContext.request.contextPath}/getCitizenList?currentPage=${pageNum}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}">${pageNum}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										<li>
											<c:choose>
												<c:when test="${currentPage < lastPage}">
													<a href="${pageContext.request.contextPath}/getCitizenList?currentPage=${currentPage+1}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Next">
														<span aria-hidden="true">&gt;</span>
													</a>
												</c:when>
												<c:otherwise>
													<a href="${pageContext.request.contextPath}/getCitizenList?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}"aria-label="Next">
														<span aria-hidden="true">&gt;</span>
													</a>
												</c:otherwise>
											</c:choose>
										</li>
										<li>
											<a href="${pageContext.request.contextPath}/getCitizenList?currentPage=${lastPage}&pagePerRow=${pagePerRow}&searchSignal=${searchSignal}&searchOption=${searchOption}&keyword=${keyword}" aria-label="Next">
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
		<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>


</body>
</html>