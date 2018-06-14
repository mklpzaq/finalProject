<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>1차 카테고리 목록</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
					$(location).attr('href', './selectListGoodsFacilityCategory?pagePerRow=' + $('#selectPagePerRow > option:selected').val() + '&searchOption=' + $('#moniterSearchOption').text() + '&keyword=' + $('#monitorKeyword').text());
				});
				
				/* 검색버튼을 클릭하면 get방식으로  searchSignal, searchSelect, searchWord값을 넘긴다.*/
				$('#searchButton').click(function(){
					searchOption = $('#selectButtonText').text();
					keyword = $('#keyword').val();
					$(location).attr('href', './selectListGoodsFacilityCategory?searchSignal=y&searchOption=' + searchOption + '&keyword=' + keyword);
				});
				
			});
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="/WEB-INF/views/module/leftGoodsfacilityCategory/leftGoodsfacilityCategoryOneInfo.jsp"/>
				</div>
					<div class="col-sm-8"><br>
						<!-- Begin Content -->
						<div class="panel panel-default">
							<div class="panel-body text-center">
								<div class="text-center">
									<h1>1차 카테고리 목록</h1>
								</div>
								
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
													<li><a href="#">카테고리 코드 </a></li>
													<li><a href="#">물품/시설명 </a></li>
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
								
								<table class="table table-striped">
									<thead>
										<tr>
											<td width="30%">1차 카테고리 코드</td>
											<td width="55%">물품/시설 명</td>	
											<td width="15%">삭제</td>								
										</tr>
									</thead>
								<tbody>									
								<c:forEach var="goodsFacilityCategoryDtoList" items="${goodsFacilityCategoryDtoList}">
										<tbody>
											<tr>
												<th>${goodsFacilityCategoryDtoList.goodsfacilityOneCode}</th>
												<th>${goodsFacilityCategoryDtoList.goodsfacilityOneName}</th>
												<th><a href="${pageContext.request.contextPath}/deleteGoodsFacilityCategoryOne?goodsfacilityOneCode=${goodsFacilityCategoryDtoList.goodsfacilityOneCode}">삭제</a></th>																					
											</tr>
										</tbody>
									</c:forEach>	
								</tbody>
							</table>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<!-- End Content -->
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>
	</body>
</html>