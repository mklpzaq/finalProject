<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Left Board List</title>
		<script>
			$(document).ready(function(){
				$('#listBoardBtn').click(function(){
					$(location).attr('href', './selectListBoard');
				});
				$('#insertBoardBtn').click(function(){
					if( $('#leftBoardListmemberId').val() === "" ){
						alert('로그인 하셔야 작성 가능합니다.');
					}else{
						$(location).attr('href', './insertBoard?memberId=' + $('#leftBoardListmemberId').val());	
					}
				});
			});
		</script>
	</head>
	<body>
		<input id="leftBoardListmemberId" type="hidden" name="leftBoardListmemberId" value="${member.memberId}">
		<div style="width:100%;" class="btn-group-vertical btn-group-lg" role="group" aria-label="Vertical button group">
			<button id="listBoardBtn" type="button" class="btn btn-default">게시판 전체</button>
			<button id="insertBoardBtn" type="button" class="btn btn-default" >자유 게시물 작성</button>
			<!-- <button id="insertDonationBtn" type="button" class="btn btn-default">총 기부 리스트</button> -->
		</div>
	</body>
</html>