<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>기부 신청하기</title>
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
							<h3 class="text-center">Insert Board</h3>
							<hr/>
							<form class="form-horizontal" action="${pageContext.request.contextPath}/insertDonation" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label for="memberId" class="col-sm-3 control-label">작성자 ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="citizenId" id="memberId" value="${memberId}" placeholder="작성자 ID" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="donationName" class="col-sm-3 control-label">제목</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="donationName" id="donationName" placeholder="제목을 작성해 주십시요.">
									</div>
								</div>
								<div class="form-group">
									<label for="boardPw" class="col-sm-3 control-label">비밀번호</label>
									<div class="col-sm-9">
										<input id="donationPw" type="text" class="form-control" name="donationPw" id="donationPw" placeholder="게시글 비밀번호">
									</div>
								</div>
								<div class="form-group">
									<label for="textContent" class="col-sm-3 control-label">내용</label>
									<div class="col-sm-9">
										<textarea id="textContent" name="textContent" class="form-control" rows="3" placeholder="내용을 작성해 주십시요."></textarea>
									</div>
								</div>
								<div id="addDiv">
									<!-- 파일추가 버튼을 누르면 여기에 파일추가할수 있는 부분이 만들어진다. -->
								</div>
								<div class="form-group">
									<div class="col-sm-3 text-right">
										<button class="btn btn-primary" id="addFileButton" type="button">파일추가</button>
									</div>
									<div class="col-sm-9"></div>
								</div>
								<div class="text-center">
									<button id="insertBtn" type="submit" class="btn btn-primary">입력 완료</button>
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