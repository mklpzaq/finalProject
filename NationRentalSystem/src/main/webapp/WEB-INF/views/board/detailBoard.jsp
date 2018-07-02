<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>detail Board</title>
		<script>
			$(document).ready(function(){
				$('#textUpdateBtn').click(function(){
					if( $('#memberId').val() !== $('#memberIdForChecking').val() ){
						alert('글 작성자만 수정 가능합니다.');
					}else{
						alert('글 작성자입니다.');
						$(location).attr('href', './updateBoard?boardCode=' + $('#boardCode').val());
					}
				});
				$('#textDeletetBtn').click(function(){
					if( $('#memberId').val() !== $('#memberIdForChecking').val() ){
						alert('글 작성자만 삭제 가능합니다.');
					}else{
						alert('글 작성자입니다.');
						$(location).attr('href', './deleteBoard?boardCode=' + $('#boardCode').val());
					}
				});
			});
		
		</script>
	</head>
	<body>
		<jsp:include page="../module/backgroundImg/backgroundImg.jsp"/>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="height:100%; margin:15px 0 0 0;">
			<div class="row" >
				<div class="col-sm-2">
					<jsp:include page="../module/leftBoard/leftBoardList.jsp"/>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
					<input id="memberIdForChecking" type="hidden" value="${member.memberId}">
					<div class="panel panel-default">
						<div class="panel-body">
							<form id="insertForm" class="form-horizontal" action="#" method="post">
								<div class="row form-group">
									<div class="col-sm-3">
										<h5 class="text-left">게시글 코드 : ${boardDto.boardCode}</h5><br/>
										<h5 class="text-left">카테고리 명 : ${boardDto.boardCategoryName}</h5>
									</div>
									<div class="col-sm-6">
										<h3 class="text-center"> ${boardDto.boardName} </h3>
									</div>
									<div class="col-sm-3">
										<h5 class="text-right">작성일 : ${boardDto.dateWriteBoard}</h5><br/>
										<h5 class="text-right">조회수 : ${boardDto.boardHits}</h5>
									</div>
								</div>
								<hr/>
								<div class="form-group hidden">
									<label for="boardCode" class="col-sm-3 control-label">게시글 코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="boardCode" id="boardCode" value="${boardDto.boardCode}" placeholder="게시글 코드" readonly>
									</div>
								</div>
								<div class="form-group hidden">
									<label for="boardCategoryCode" class="col-sm-3 control-label">카테고리 코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="boardCategoryCode" id="boardCategoryCode" value="${boardDto.boardCategoryCode}" placeholder="카테고리 코드" readonly>
									</div>
								</div>
								<div class="form-group hidden">
									<label for="boardCategoryName" class="col-sm-3 control-label">카테고리 명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="boardCategoryName" id="boardCategoryName" value="${boardDto.boardCategoryName}" placeholder="카테고리 명" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="memberId" class="col-sm-3 control-label">작성자 ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="memberId" id="memberId" value="${boardDto.memberId}" placeholder="작성자 ID" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="boardName" class="col-sm-3 control-label">글 제목</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="boardName" id="boardName" value="${boardDto.boardName}" placeholder="글 제목" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="textBoardContent" class="col-sm-3 control-label">글 내용</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="textBoardContent" id="textBoardContent" value="${boardDto.textBoardContent}" placeholder="글 내용" readonly>
									</div>
								</div>
								<div class="form-group hidden">
									<label for="dateWriteBoard" class="col-sm-3 control-label">글 작성일</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="dateWriteBoard" id="dateWriteBoard" value="${boardDto.dateWriteBoard}" placeholder="글 작성일" readonly>
									</div>
								</div>
								<div class="form-group hidden">
									<label for="boardHits" class="col-sm-3 control-label">조회수</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="boardHits" id="boardHits" value="${boardDto.boardHits}" placeholder="조회수" readonly>
									</div>
								</div>
								<div class="text-center">
									<button id="textUpdateBtn" type="button" class="btn btn-primary">수정</button>
									<button id="textDeletetBtn" type="button" class="btn btn-primary">삭제</button>
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