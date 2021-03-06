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
			$(document).ready(function(){
				$('#deleteYesBtn').click(function(){
					$(location).attr('href', './updateAgencyContractClosed?agencyCode=' + $("#agencyModalBtn").val());
				});
				$('#deleteNoBtn').click(function(){
					$('#agencyModal').hide();
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
					<jsp:include page="../module/lefrAgency/leftAgencyInfo.jsp"/>
				</div>
				<div style="padding:15px;" class="col-sm-8">
					<!-- Begin Content -->
							
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="text-center">계약된 대행업체 리스트</h3>
							<hr/>
						</div>										
						<table class="table table-striped">
							<thead>
								<tr>
									<td width="10%">낙찰번호</td>
									<td width="15%">등록 공무원 이름</td>
									<td width="15%">대행업체명</td>
									<td width="15%">대행업체 업종</td>
									<td width="15%">대행업체 낙찰시기</td>
									<td width="15%">대행업체 직원 조회</td>
									<td width="15%">대행업체 계약해지</td>								
								</tr>
							</thead>
							<tbody>									
								<c:forEach var="AgencyDto" items="${List}">
									<tbody>
										<tr>
											<th>${AgencyDto.agencyCode}</th>														
											<th>${AgencyDto.functionaryName}</th>
											<td>${AgencyDto.agencyName}</td>
											<td>${AgencyDto.agencyBusinesstypeName}</td>
											<td>${AgencyDto.agencyDateRegistration}</td>
											<td>
												<a href="${pageContext.request.contextPath}/selectContractAgencyEmployee?agencyCode=${AgencyDto.agencyCode}">
													<button class="btn btn-default">직원조회</button>
												</a>
											</td>
											<td><button type="button" id="agencyModalBtn" value="${AgencyDto.agencyCode}" class="btn btn-default" data-toggle="modal" data-target="#agencyModal">계약해지</button></td>																						
										</tr>
									</tbody>
								</c:forEach>									
							</tbody>
						</table>
						
						<!--Begin Modal -->
							<div class="modal fade" id="agencyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title text-center" id="myModalLabel">정말로 해지하시겠습니까?</h4>
										</div>
										<div class="modal-body text-center">
											<button type="button" class="btn btn-primary" id="deleteYesBtn">해지합니다</button> &emsp; &emsp;
											<button type="button" class="btn btn-primary" id="deleteNoBtn">아니오</button>
										</div>
										<div class="modal-footer">
									
										</div>
									</div>
								</div>
							</div>
						<!--End Modal -->						
					</div>
					<div class="col-sm-2"></div>					
				</div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>
	</body>
</html>