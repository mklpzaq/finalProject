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
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->
					<div style="margin:15px;" class="panel panel-default">
						<div class="panel-body">
							<h3 class="text-center">기부 신청서</h3>
							<hr/>
							<form id="approvalDonation" class="form-horizontal" action="${pageContext.request.contextPath}/updateApprovalDonation" method="post">
								<div class="form-group">
									<label for="donationRequestCode" class="col-sm-3 control-label">신청코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="donationRequestCode" id="donationRequestCode" value="${viewDonation.donationRequestCode}" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="memberId" class="col-sm-3 control-label">작성자 ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="memberId" id="memberId" value="${viewDonation.memberId}" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="donationTitle" class="col-sm-3 control-label">제목</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="donationTitle" id="donationTitle" value="${viewDonation.donationTitle}" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="donationContent" class="col-sm-3 control-label">내용</label>
									<div class="col-sm-9">
										<textarea id="donationContent" name="donationContent" class="form-control" rows="3" readonly>${viewDonation.donationContent}</textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="donationApproval" class="col-sm-3 control-label">승인여부</label>
							    	<div class="col-sm-5">						    	
								   	 	<select id="donationApproval" name="donationApproval" class="form-control">
							   	 			 <option>-</option>
							   	 			 <option>승인</option>
											 <option>반려</option>																		
										</select>		    		    	
					   		 		</div>
								</div>		
							
								
								<!-- 첨부파일보기 시작 -->
								<%-- <div>
									첨부파일 : <br/>
									<c:forEach var="boardFile" items="${board.boardFile}">
										<div> 
											boardFileId : ${boardFile.boardFileId}<br/>
											boardId : ${boardFile.boardId}<br/>
											boardFileName : ${boardFile.boardFileName}<br/>
											boardFileExt : ${boardFile.boardFileExt}<br/>
											boardFileType : ${boardFile.boardFileType}<br/>
											boardFileSize : ${boardFile.boardFileSize}<br/>
											<a href="${pageContext.request.contextPath}/downloadBoardFile?sendNo=${boardFile.boardId}&fileName=${boardFile.boardFileName}&fileExt=${boardFile.boardFileExt}">파일 다운로드</a>
											 | <a href="${pageContext.request.contextPath}/deleteBoardFile?pageCode=detail&sendNo=${boardFile.boardId}&sendFileNo=${boardFile.boardFileId}&fileName=${boardFile.boardFileName}&fileExt=${boardFile.boardFileExt}">파일 삭제</a>
										</div>
										<hr/>
									</c:forEach>
								</div> --%>
								<!-- 첨부파일보기 종료 -->
								<div class="form-group" style="text-align: center;">
									<div class="col-sm-12">
										<button type="submit" id="updateButton" class="btn btn-default">수정하기</button>
										<button type="submit" id="listButton" class="btn btn-default"><a href="${pageContext.request.contextPath}/approvalListDonation">목록</a></button>
									</div>
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