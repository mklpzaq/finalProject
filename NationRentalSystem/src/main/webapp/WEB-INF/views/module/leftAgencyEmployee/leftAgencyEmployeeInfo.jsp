<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Left AgencyEmployee Info</title>
		<script>
			$(document).ready(function(){
				$('#updateAgencyEmployeeBtn').click(function(){
					$(location).attr('href', './updateAgencyEmployee?agencyEmployeeId=' + $('#memberId').val());
				});
				$('#deleteAgencyEmployeeBtn').click(function(){
					$(location).attr('href', './deleteAgencyEmployee?agencyEmployeeId=' + $('#memberId').val());
				});
			});
		</script>
		
	</head>
	<body>
		<input type="hidden" id="memberId" value="${member.memberId}"/>
		<div style="width:100%;" class="btn-group-vertical btn-group-lg" role="group" aria-label="Vertical button group">
			<button id="updateAgencyEmployeeBtn" type="button" class="btn btn-default" >회원 정보 수정</button>
			<button id="deleteAgencyEmployeeBtn" type="button" class="btn btn-default">회원 탈퇴</button>
		</div>	
	</body>
</html>