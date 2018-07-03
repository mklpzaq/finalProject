<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Select One Citizen</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	
	<body>
		<jsp:include page="../module/backgroundImg/backgroundImg.jsp"/>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid" style="margin:15px;">
		
		<%-- <jsp:include page="/WEB-INF/views/module/top/mainHeader.jsp"/> --%>
		
			<div class="row">
				<div class="col-sm-2">
					<jsp:include page="/WEB-INF/views/module/leftCitizen/leftCitizenList.jsp"/>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
					<div class="panel panel-default">
						<div class="panel-body">
							<h2 class="text-center"> 시민 정보 보기  </h2>
							<hr/>
							<div class="bs-example" data-example-id="striped-table">
							    <table class="table table-striped">
								      <thead>
									        <tr>
									          <th>#</th>
									          <th>기본정보</th>						        
									        </tr>
									  </thead>
									  <tbody>
									        <tr>
									          <th scope="row">시민명</th>
									          <td>${OneCitizenDto.citizenName}</td>						         
									        </tr>						       
									        <tr>
									          <th scope="row">시민 상세주소</th>
									          <td>${OneCitizenDto.citizenAddressSangse}</td>						         
									        </tr>
									        <tr>
									          <th scope="row">시민 전화번호</th>
									          <td>${OneCitizenDto.citizenPhone}</td>						         
									        </tr>
									        <tr>
									          <th scope="row">시민 이메일</th>
									          <td>${OneCitizenDto.citizenEmail}</td>						         
									        </tr>
									        <tr>
									          <th scope="row">수정 버튼</th>
									          <td>
									          	<a href="${pageContext.request.contextPath}/updateOneCitizen?citizenId=${member.memberId}">수정버튼</a>
									          </td>						         
									        </tr>										        
							      	</tbody>
							    </table>
						  	</div>
				  		</div>
				  	</div>
					<!-- End Content -->
				</div>
				<div>
					<div class="col-sm-2"></div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>
		</div>

	</body>
</html>