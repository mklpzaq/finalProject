<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Insert title here</title>
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
				
			});
		</script>	
	</head>
	
	<body>
	<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
				<div class="row">
					<div class="col-sm-2" style="padding:15px;">
						<jsp:include page="/WEB-INF/views/module/left/leftnavi.jsp"/>
					</div>
					<div class="col-sm-8">
					<!-- Begin Content -->
						
						<div class="text-center">
							<h1>공무원회원 조회</h1>
							<h2>Nation Integrated Reserve and Rental System</h2>
							<P>The time on the server is ${serverTime}.</P>
						</div>
							<div><a href="${pageContext.request.contextPath}/selectListContractClosedAgency">계약해지된 업체목록</a></div>										
								<table class="table table-striped">
									<thead>
										<tr>
											<td width="15%">낙찰번호</td>
											<td width="15%">등록 공무원 이름</td>
											<td width="15%">대행업체명</td>
											<td width="15%">대행업체 업종</td>
											<td width="20%">대행업체 낙찰시기</td>
											<td width="20%">대행업체 계약해지</td>								
										</tr>
									</thead>
									<tbody>									
											<c:forEach var="AgencyDto" items="${List}">
												<tbody>
													<tr>
														<th>${AgencyDto.agencyCode}</th>														
														<th>${AgencyDto.functionaryName}</th>
														<td>${AgencyDto.agencyName}</td>
														<td>${AgencyDto.agencyBusinesstypeCode}</td>
														<td>${AgencyDto.agencyDateRegistration}</td>
														<td><a href="#/${AgencyDto.agencyCode}">계약해지</a></td>																						
													</tr>
												</tbody>
											</c:forEach>									
									</tbody>
								</table>								
							</div>
						</div>
				</div>
				</body>
</html>