<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>기부 신청서</title>
	</head>
	<body>
		
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		
		<div class="container-fluid" style="height:900px;">
			<jsp:include page="../module/top/navbar.jsp"/>
			<div class="row" >
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="/WEB-INF/views/module/leftDonation/leftDonation.jsp"/>
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->
					<div style="margin:15px;" class="panel panel-default">
						<div class="panel-body">
							<h3 class="text-center">기부 신청서</h3>
							<hr/>
							<form class="form-horizontal" enctype="multipart/form-data">
								<div class="form-group">
									<label for="memberId" class="col-sm-3 control-label">작성자 ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="memberId" id="memberId" value="${member.memberId}" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="donationTitle" class="col-sm-3 control-label">제목</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="donationTitle" id="donationTitle" value="${viewDonation.donationTitle}">
									</div>
								</div>
								<div class="form-group">
									<label for="donationContent" class="col-sm-3 control-label">내용</label>
									<div class="col-sm-9">
										<textarea id="donationContent" name="donationContent" class="form-control" rows="3" >${viewDonation.donationContent}</textarea>
									</div>
								</div>
									<div class="form-group">
									<label for="donationFile" class="col-sm-3 control-label">첨부사진</label>
									<div class="col-sm-9">
										<c:forEach var="donationFile" items="${donationDto.donationFile}">
											<img data-src="holder.js/140x140" class="img-circle" alt="${donationFileDto.donationFileName}${donationFileDto.donationFileExt}" src="${pageContext.request.contextPath}/downloadFile?donationFileName=${DonationFileDto.donationFileName}&donationFileExt=${DonationFileDto.donationFileExt}" data-holder-rendered="true" style="width: 140px; height: 140px;">
										</c:forEach>
									</div>
								</div>
								
						
								<div>
									<!-- 이미지 작업용 forEach안에서만 -->
									<c:forEach var="donationFile" items="${donationDto.donationFile}">
										
									</c:forEach>
								</div>
								<div style="text-align: center;">
									<a href="${pageContext.request.contextPath}/updateDonation?donationRequestCode=${donationDto.donationRequestCode}">
										[수정]
									</a>&nbsp;&nbsp;
									<a href="${pageContext.request.contextPath}/deleteDonation?donationRequestCode=${donationDto.donationRequestCode}">
										[삭제]
									</a>&nbsp;&nbsp;
									<a href="${pageContext.request.contextPath}/selectListDonation">
										[목록]
									</a>
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