<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>left United Afterservice Request</title>
		<script>
			$(document).ready(function(){
				$('#returnAfterserviceBtn').click(function(){
					$(location).attr('href', './selectListReturnGoodsfacilityInfoForAfterService?adminagencyCode=' + $('#adminagencyCodeForLeft').val());
				});
				$('#regularChecAfterserviceBtn').click(function(){
					$(location).attr('href', './selectListRegularCheckForAfterService');
				});
				$('#listAfterserviceRequestBtn').click(function(){
					$(location).attr('href', './selectListUnitedAfterserviceRequest');
				});
			});	
		</script>
	</head>
	<body>
		<input id="adminagencyCodeForLeft" type="hidden" value="${member.adminagencyCode}">
		<div style="width:100%;" class="btn-group-vertical btn-group-lg" role="group" aria-label="Vertical button group">
			<button id="returnAfterserviceBtn" type="button" class="btn btn-default" >반납 AS 신청</button>
			<button id="regularChecAfterserviceBtn"type="button" class="btn btn-default">점검 AS 신청</button>
			<button id="listAfterserviceRequestBtn" type="button" class="btn btn-default">AS 신청 List</button>
		</div>
	</body>
</html>