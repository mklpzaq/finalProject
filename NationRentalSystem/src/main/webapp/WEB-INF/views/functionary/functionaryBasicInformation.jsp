<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>		
		<title>Insert title here</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
			<jsp:include page="/WEB-INF/views/module/top/mainHeader.jsp"/>
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="/WEB-INF/views/module/left/leftnavi.jsp"/>
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->
		
						
						
						
							<div class="form-group">
								<label class="col-sm-2 control-label">ID</label>
								<div class="col-sm-10">
									<p class="form-control-static">${returnfunctionaryDto.functionaryId}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">소속행정기관</label>
								<div class="col-sm-10">
									<p class="form-control-static">${returnfunctionaryDto.adminagencyCode}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">이름</label>
								<div class="col-sm-10">
									<p class="form-control-static">${returnfunctionaryDto.functionaryName}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">전화번호</label>
								<div class="col-sm-10">
									<p class="form-control-static">${returnfunctionaryDto.functionaryPhone}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Email</label>
								<div class="col-sm-10">
									<p class="form-control-static" >${returnfunctionaryDto.functionaryEmail}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">가입날짜</label>
								<div class="col-sm-10">
									<p class="form-control-static">${returnfunctionaryDto.functionaryDateJoin}</p>
								</div>								
							</div>
							
							<button id="btn"><a href="${pageContext.request.contextPath}/updateFunctionnary?functionaryId=${returnfunctionaryDto.functionaryId}">기본정보 수정</a></button>
				
				<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
			
		</div>
		<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>
							
</body>
</html>