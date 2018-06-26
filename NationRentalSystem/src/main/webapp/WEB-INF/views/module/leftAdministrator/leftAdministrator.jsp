<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Left GoodsfacilityCategory Info</title>
		<script>
			$(document).ready(function(){
				$('#ListBtn').click(function(){
					$(location).attr('href', './selectListAdministrator').val();
				});
				$('#InfoBtn').click(function(){
					$(location).attr('href', './viewAdminInfo?adminId=' + $('#memberId').val());
				});
				$('#UpdateBtn').click(function(){
					$(location).attr('href', './updateAdministrator?adminId=' + $('#memberId').val());
				});s
			});
		</script>
		
	</head>
	<body>
		<input type="hidden" id="memberId" value="${member.memberId}"/>
		<div style="width:100%;" class="btn-group-vertical btn-group-lg" role="group" aria-label="Vertical button group">
			<button id="ListBtn" type="button" class="btn btn-default" >관리자 리스트</button>
			<button id="InfoBtn" type="button" class="btn btn-default" >내 정보 보기</button>
			<button id="UpdateBtn" type="button" class="btn btn-default">내 정보 수정</button>
		</div>	
	</body>
</html>