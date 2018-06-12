<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
			<jsp:include page="../module/top/navbar.jsp"/>
			<jsp:include page="../module/top/mainHeader.jsp"/>
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="/WEB-INF/views/module/left/leftnavi.jsp"/>
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->

						<form action="${pageContext.request.contextPath}/updateFunctionnary" method="post">
							<div class="form-group">
								<label class="col-sm-2 control-label">ID</label>
								<div class="col-sm-10">
									<input type="text" class="form-control-static" name="functionaryId" value="${returnfunctionaryDto.functionaryId}" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">소속행정기관</label>
								<div class="col-sm-10">
									<input type="text" class="form-control-static" name="adminagencyCode" value="${returnfunctionaryDto.adminagencyCode}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control-static" name="functionaryName" value="${returnfunctionaryDto.functionaryName}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">전화번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control-static" name="functionaryPhone" value="${returnfunctionaryDto.functionaryPhone}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Email</label>
								<div class="col-sm-10">
									<input type="text" class="form-control-static" name="functionaryEmail" value="${returnfunctionaryDto.functionaryEmail}">
								</div>
							</div>							
							<div class="form-group">
								<div class="col-sm-10">
									<button type="submit" class="form-control-static">정보수정</button>
								</div>	
							</div>
						</form>
						<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
			
		</div>
		<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>

</body>
</html>