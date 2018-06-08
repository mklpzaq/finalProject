<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Update Form</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	
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
			
			<form action="${pageContext.request.contextPath}/updateOneCitizen" method="post">
				<div class="form-group">
						<label for="ID" class="col-sm-2 control-label">회원ID</label>
				    <div class="col-sm-10">
				    	<input type="text" class="form-control" id="CitizenId" name="CitizenId" value="${updateCitizen.citizenId}" readonly>				    	     	
				    </div>
				</div>				
				<div class="form-group">
						<label for="PW" class="col-sm-2 control-label">회원PW</label>
				    <div class="col-sm-10">
				    	<input type="password" class="form-control" id="CitizenPw" name="CitizenPw" value="${updateCitizen.citizenPw}">				    	     	
				    </div>
				</div>
				<div class="form-group">
						<label for="RePW" class="col-sm-2 control-label">확인 회원PW</label>
				    <div class="col-sm-10">
				    	<input type="password" class="form-control" id="ReCitizenPw" name="ReCitizenPw">				    	     	
				    </div>
				</div>
				<div class="form-group">
					<label for="sigungu" class="col-sm-2 control-label">시군구코드</label>
					<div class="col-sm-10">
						<select class="form-control" name="sigunguCode" value="${updateCitizen.sigunguCode}">
							  <option>1</option>
							  <option>2</option>
							  <option>3</option>
							  <option>4</option>
							  <option>5</option>
						</select>
					</div>
				</div>				
				<div class="form-group">
					<label for="sigungu" class="col-sm-2 control-label">읍면동코드</label>
					<div class="col-sm-10">
						<select class="form-control" name="eupmyeonCode" value="${updateCitizen.eupmyeonCode}">
							  <option>1</option>
							  <option>2</option>
							  <option>3</option>
							  <option>4</option>
							  <option>5</option>
						</select>
					</div>
				</div>								
				<div class="form-group">
						<label for="citizenAddressSangse" class="col-sm-2 control-label">시민 상세주소</label>
				    <div class="col-sm-10">
				    	<input type="text" class="form-control" id="citizenAddressSangse" name="citizenAddressSangse" value="${updateCitizen.citizenAddressSangse}">				    	    	
				    </div>
				</div>
				<div class="form-group">
						<label for="citizenPhone" class="col-sm-2 control-label">시민 전화번호</label>
				    <div class="col-sm-10">
				    	<input type="text" class="form-control" id="citizenPhone" name="citizenPhone" value="${updateCitizen.citizenPhone}">				    	    	
				    </div>
				</div>
				<div class="form-group">
						<label for="citizenEmail" class="col-sm-2 control-label">시민 이메일</label>
				    <div class="col-sm-10">
				    	<input type="text" class="form-control" id="citizenEmail" name="citizenEmail" value="${updateCitizen.citizenEmail}">			    	    	
				    </div>
				</div>
				<button type="submit" class="btn btn-primary btn-lg btn-block" id="updateCitizen">회원수정완료</button>			
			</form>			
			
			
			<!-- End Content -->
		</div>
			<div class="col-sm-2"></div>
		</div>
		
	</div>
	<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>


</body>
</html>