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
							<h3 class="text-center">대행업체 등록</h3>
							<hr/>
					
							<form class="form-horizontal" action="${pageContext.request.contextPath}/insertAgency" id="insertAgencyForm" method="post">
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">낙찰번호</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="agencyCod" name="agencyCode" placeholder="낙찰번호">							
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-2 control-label">대행업체명</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="agencyName" name="agencyName" placeholder="대행업체명">
									</div>
								</div>					
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">대행업체 업종분류</label>
									&nbsp;&nbsp;&nbsp;
									<!-- Single button -->
									<div class="btn-group">
									  <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									    대행업체 업종등록 <span class="caret"></span>
									  </button>
									  <ul class="dropdown-menu" role="menu">
									  	<c:forEach var="agencyBusinesstypeDto" items="${list}">
									   		<li value="${agencyBusinesstypeDto.agencyBusinesstypeCode}"><a href="#" >${agencyBusinesstypeDto.agencyBusinesstypeName}</a></li>
									   	</c:forEach>
									  </ul>
									</div>
									
									<%-- <select name="agencyBusinesstypeCode">
										<c:forEach var="agencyBusinesstypeDto" items="${list}">
											<option  value="${agencyBusinesstypeDto.agencyBusinesstypeCode}">${agencyBusinesstypeDto.agencyBusinesstypeName}</option>
										</c:forEach>
									</select> --%>
								</div>
										
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" id="btn" class="btn btn-default">Sign in</button>
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