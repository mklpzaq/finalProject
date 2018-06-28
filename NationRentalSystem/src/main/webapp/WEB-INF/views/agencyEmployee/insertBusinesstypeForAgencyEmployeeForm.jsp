<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Insert Businesstype For AgencyEmployee Form</title>
		<script>
			$(document).ready(function(){
				/* var isIdCheck = 0;
				
				$('#idCheckBtn').click(function(){
					$.ajax({
					      type: "POST"
					      ,url: "${pageContext.request.contextPath}/idCheck"
					      ,data: { agencyEmployeeId: $('#agencyEmployeeId').val() }
					      ,success:function( JSON ) { // result : String, XML, JSON
					    	  if(JSON=='T'){
								alert('중복되지 않는 아이디입니다.');
							  }else{
								alert('중복된 아이디입니다. 다른 아이디를 입력해주세요.');
					    	  }
					      }
					});
				}); */
				
				/* $('#insertBtn').click(function(){
					//다시한번 유효성 검사를 하고 커밋을 시킨다.
					$.ajax({
						type: "POST"
						,url: "${pageContext.request.contextPath}/idCheck"
						,data: { agencyEmployeeId: $('#agencyEmployeeId').val() }
						,success:function( JSON ) { // result : String, XML, JSON
							if(JSON=='T'){
								$('#insertForm').submit();
							}else{
								alert('중복되거나 잘못된 아이디입니다. 다른 아이디를 입력해주세요.');
							}
						}
					});
				}); */
				
				
			});
		</script>
	</head>
	<body>
		<jsp:include page="../module/backgroundImg/backgroundImg.jsp"/>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="height:100%; margin:15px 0 0 0;">
			<div class="row" >
				<div class="col-sm-2">
					<jsp:include page="../module/leftAgencyEmployee/leftAgencyEmployeeInfo.jsp"/>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
					
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="text-center">대행업체 직원 업종 추가 등록</h3>
							<hr/>
							<form id="insertForm" class="form-horizontal" action="${pageContext.request.contextPath}/insertBusinesstypeForAgencyEmployee" method="post">
								<%-- <div class="form-group">
									<div class="col-sm-9">
										<input type="hidden" class="form-control" name="agencyEmployeeInjeungNum" value="${agencyInfo.agencyEmployeeInjeungNum}" id="agencyEmployeeInjeungNum">
									</div>
								</div> --%>
								<div class="form-group">
									<label for="agencyEmployeeId" class="col-sm-3 control-label">현재 대행업체 직원 ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyEmployeeId" value="${agencyInfo.agencyName}" id="agencyEmployeeId"  readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyName" class="col-sm-3 control-label">소속 대행업체명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyName" value="${agencyInfo.agencyName}" id="agencyName"  readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyName" class="col-sm-3 control-label">현재 등록된 업종명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyName" value="${agencyInfo.agencyName}" id="agencyName"  readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyName" class="col-sm-3 control-label">추가 가능 업종 선택</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyName" value="${agencyInfo.agencyName}" id="agencyName"  readonly>
									</div>
								</div>
								
								<div class="text-center">
									<button id="insertBtn" type="button" class="btn btn-default">입력 완료</button>
								</div>
							</form>
						</div>
					</div>
					
					<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>
		
	</body>
</html>