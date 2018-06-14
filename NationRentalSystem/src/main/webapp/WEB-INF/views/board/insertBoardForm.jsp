<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Insert Board Form</title>
		<script>
			$(document).ready(function(){
				$('#boardPasswordToggleBtn').click(function(){
					if( $('#boardPasswordBox').hasClass('hidden') ){
						$('#boardPasswordBox').removeClass('hidden');
						$('#boardPasswordToggleBtn').text('글 비밀번호 사용 [닫기]');
						
					}else{
						$('#boardPasswordBox').addClass('hidden');
						$('#boardPw').val('');
						$('#boardPasswordToggleBtn').text('글 비밀번호 사용 [열기]');
					}
				});
				
				
				$('#addFileButton').click(function(){
					$('#addDiv').append('<div class="form-group"><label for="multipartFile" class="col-sm-3 control-label">파일 업로드</label><div class="col-sm-9"><input type="file" name="multipartFile"><p class="help-block">업로드할 파일을 선택하세요</p></div></div>');
				});
			});
		</script>
	</head>
	<body>
		
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		
		<div class="container-fluid" style="height:900px;">
			<jsp:include page="../module/top/navbar.jsp"/>
			<%-- <jsp:include page="./module/top/mainHeader.jsp"/> --%>
			<div class="row" >
				<div class="col-sm-2" style="padding:15px;">
					<%-- <jsp:include page="../module/leftHome/leftHome.jsp"/> --%>
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->
					<!-- boardCategoryList -->
					<div style="margin:15px;" class="panel panel-default">
						<div class="panel-body">
							<h3 class="text-center">Insert Board</h3>
							<hr/>
							<form class="form-horizontal" action="${pageContext.request.contextPath}/insertBoard" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label for="memberId" class="col-sm-3 control-label">작성자 ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="memberId" id="memberId" value="${memberId}" placeholder="작성자 ID" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="boardName" class="col-sm-3 control-label">카테고리</label>
									<div class="col-sm-9">
										<select class="form-control" name="">
											<option >
												
											</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="boardName" class="col-sm-3 control-label">글 제목</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="boardName" id="boardName" placeholder="게시글 제목">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-3 text-right">
										<button id="boardPasswordToggleBtn" type="button" class="btn btn-primary">글 비밀번호 사용 [열기]</button>
									</div>
								</div>
								<div id="boardPasswordBox" class="form-group hidden">
									<label for="boardPw" class="col-sm-3 control-label">글 비밀번호 설정</label>
									<div class="col-sm-9">
										<input id="boardPw" type="text" class="form-control" name="boardPw" id="boardPw" placeholder="게시글 암호">
									</div>
								</div>
								<div class="form-group">
									<label for="textBoardContent" class="col-sm-3 control-label">글 내용</label>
									<div class="col-sm-9">
										<!-- <input type="text" class="form-control" name="boardContent" id="boardContent" placeholder="boardContent"> -->
										<textarea id="textBoardContent" name="textBoardContent" class="form-control" rows="3" placeholder="게시글 내용"></textarea>
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