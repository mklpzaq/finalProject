<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Left Agency Afterservice Handling</title>
		<script>
			$(document).ready(function(){
				$('#selectListUnitedAfterserviceRequestForAgencyAfterserviceHandlingBtn').click(function(){
					$(location).attr('href', './selectListUnitedAfterserviceRequestForAgencyAfterserviceHandling?adminagencyCode=' + $('#adminagencyCodeForLeft').val() + '&agencyEmployeeId=' + $('#memberIdForLeft').val());
				});
				$('#selectListAgencyAfterserviceHandlingBtn').click(function(){
					$(location).attr('href', './selectListAgencyAfterserviceHandling?adminagencyCode=' + $('#adminagencyCodeForLeft').val() + '&agencyEmployeeId=' + $('#memberIdForLeft').val());
				});
				
			});
		</script>
	</head>
	<body>
		<input id="memberIdForLeft" type="hidden" value="${member.memberId}">
		<input id="adminagencyCodeForLeft" type="hidden" value="${member.adminagencyCode}">
		<%-- <input id="leftBoardListmemberId" type="hidden" name="leftBoardListmemberId" value="${member.memberId}"> --%>
		<div style="width:100%;" class="btn-group-vertical btn-group-lg" role="group" aria-label="Vertical button group">
			<button id="selectListUnitedAfterserviceRequestForAgencyAfterserviceHandlingBtn" type="button" class="btn btn-default">AS 요청 리스트</button>
			<button id="selectListAgencyAfterserviceHandlingBtn" type="button" class="btn btn-default" >수락 AS 리스트</button>
			<button id="insertDonationBtn" type="button" class="btn btn-default">처리 AS 리스트</button>
		</div>
	</body>
</html>