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
		<script type="text/javascript">
		
			/* $(document).ready(function() {
				$('#btn').click(function(){					
					$(location).attr('href', './updateFunctionnary?functionaryId=' + $('#functionaryId'));					
				});				
			}); */
		
		</script>
	</head>

<body>
	<!-- navbar가 위쪽에 고정됨에 따라 기존 컨텐츠가 navbar height만큼 가려지는것 해결하기 위해 div에 navbar height만큼의 높이를 추가한다. -->
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="height:600px;">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="../module/leftFunctionary/leftFunctionaryInfo.jsp"/>
				</div>
				<div style="padding:15px;" class="col-sm-8">
					<!-- Begin Content -->
							
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="text-center">공무원회원 정보</h3>
							<hr/>
							<form class="form-horizontal">
								<div class="form-group">
								<label class="col-sm-2 control-label">ID</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="functionaryId" value="${returnfunctionaryDto.functionaryId}" id="functionaryId" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">소속행정기관</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="adminagencyCode" value="${returnfunctionaryDto.adminagencyName}" id="adminagencyName" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">이름</label>
								<div class="col-sm-10">
								<input type="text" class="form-control" name="functionaryName" value="${returnfunctionaryDto.functionaryName}" id="functionaryName" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">전화번호</label>
								<div class="col-sm-10">
								<input type="text" class="form-control" name="functionaryPhone" value="${returnfunctionaryDto.functionaryPhone}" id="functionaryPhone" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Email</label>
								<div class="col-sm-10">
								<input type="text" class="form-control" name="functionaryEmail" value="${returnfunctionaryDto.functionaryEmail}" id="functionaryEmail" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">가입날짜</label>
								<div class="col-sm-10">
								<input type="text" class="form-control" name="functionaryDateJoin" value="${returnfunctionaryDto.functionaryDateJoin}" id="functionaryDateJoin" readonly>
								</div>								
							</div>							
						</form>
						<!-- End Content -->
						</div>
						<div class="col-sm-2"></div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>
							
</body>
</html>