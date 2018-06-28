<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Insert Businesstype For AgencyEmployee Form</title>
		<style>
			input[type=checkbox]{
				/* Double-sized Checkboxes */
				-ms-transform: scale(2); /* IE */
				-moz-transform: scale(2); /* FF */
				-webkit-transform: scale(2); /* Safari and Chrome */
				-o-transform: scale(2); /* Opera */
				padding: 10px;
			}
		</style>
		<script>
			$(document).ready(function(){
				
				    if($('input').hasClass('addAgencyBusinesstypeListCheckBox')){
			            /* alert('존재함'); */
			            $('#insertBtn').click(function(){
			            	if(0 === $(".addAgencyBusinesstypeListCheckBox:checked").length){
			            		alert('추가 가능 업종을 선택해 해주십시요.');
			            	}else{
			            		alert('추가업종 1개이상 체크 완료');
			            		$('#insertForm').submit();
			            	}
			            });
				    }else{
						/* alert('더이상 추가할 업종이 없습니다.'); */
						$('#helper').removeClass('hide');
						$('#insertBtn').click(function(){
							alert('더이상 추가할 업종이 없습니다.');
						});
				    }
				
				
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
										<input type="text" class="form-control" name="agencyEmployeeId" value="${businessTypeForAgencyEmployeeDto.agencyEmployeeId}" id="agencyEmployeeId"  readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="agencyName" class="col-sm-3 control-label">소속 대행업체명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="agencyName" value="${businessTypeForAgencyEmployeeDto.agencyName}" id="agencyName"  readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="allAgencyBusinesstype" class="col-sm-3 control-label">소속 대행업체 전체 권한</label>
								</div>
								<c:forEach var="allAgencyBusinesstype" items="${businessTypeForAgencyEmployeeDto.allAgencyBusinesstypeList}">
									<div class="form-group">
										<label for="allAgencyBusinesstype" class="col-sm-3 control-label"></label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="allAgencyBusinesstype" value="${allAgencyBusinesstype}" id="allAgencyBusinesstype"  readonly>
										</div>
									</div>
								</c:forEach>
								<div class="form-group">
									<label for="agencyName" class="col-sm-3 control-label">현재 직원에 등록된 업종명</label>
								</div>
								<c:forEach var="nowAgencyBusinesstype" items="${businessTypeForAgencyEmployeeDto.nowAgencyBusinesstypeListForAgencyEmployee}">
									<div class="form-group">
										<label for="nowAgencyBusinesstype" class="col-sm-3 control-label"></label>
										<div class="col-sm-9">
											<input type="text" class="form-control" value="${nowAgencyBusinesstype}" id="nowAgencyBusinesstype"  readonly>
										</div>
									</div>
								</c:forEach>
								<div class="form-group">
									<label for="addAgencyBusinesstypeList" class="col-sm-3 control-label">추가 가능 업종 선택</label>
									<div class="col-sm-9">
										<input id="helper" type="text" class="form-control hide" value="더 이상 추가할 업종이 없습니다." readonly>
									</div>
								</div>
								<div class="form-group">
									<c:forEach var="addAgencyBusinesstype" items="${businessTypeForAgencyEmployeeDto.addAgencyBusinesstypeList}">
										<label for="addAgencyBusinesstypeList" class="col-sm-3 control-label"></label>
										<div id="addAgencyBusinesstypeListDiv" class="col-sm-9">
											<div class="checkbox">
												<label>
													<input class="addAgencyBusinesstypeListCheckBox" name="addAgencyBusinesstypeList" value="${addAgencyBusinesstype}" type="checkbox">${addAgencyBusinesstype}
												</label>
											</div>
										</div>
									</c:forEach>
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