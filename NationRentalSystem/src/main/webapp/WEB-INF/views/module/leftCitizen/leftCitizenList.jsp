<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>left</title>
		<script>
			$(document).ready(function(){
				$('#homeBtn').click(function(){
					$(location).attr('href', './');
				});
				$('#introduceBtn').click(function(){
					$(location).attr('href', './viewIntroduce');
				});
			});	
		
		</script>
	</head>
	<body>
	<!-- #E0FF8B -->
		<div style="width:100%;">
			<div style="width:100%;" class="btn-group-vertical btn-group-lg" role="group" aria-label="Vertical button group">
				<button id="homeBtn" type="button" class="btn btn-default">Home</button>
				<a href="${pageContext.request.contextPath}/deleteSelfCitizen?citizenId=${member.memberId}" class="btn btn-primary" role="button">탈퇴</a>
				<!-- <button type="button" class="btn btn-default">Button</button>
				<button type="button" class="btn btn-default">Button</button>
				<button type="button" class="btn btn-default" >Button</button>
				<button type="button" class="btn btn-default">Button</button>
				<button type="button" class="btn btn-default">Button</button>
				<button type="button" class="btn btn-default">Button</button> -->
			</div>
		</div>
	</body>
</html>