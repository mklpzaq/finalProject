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
				$('#introduceBtn').click(function(){
					$(location).attr('href', './viewIntroduce');
				});
				/* $('#deleteAgencyEmployeeBtn').click(function(){
					$(location).attr('href', './deleteAgencyEmployee?agencyEmployeeId=' + $('#memberId').val());
				}); */
			});	
		
		</script>
	</head>
	<body>
	<!-- #E0FF8B -->
		<div style="width:100%; height:800px; background-color:white;">
			<div style="width:100%;" class="btn-group-vertical btn-group-lg" role="group" aria-label="Vertical button group">
				<button id="introduceBtn"type="button" class="btn btn-default" >프로젝트 소개</button>
				<!-- <button type="button" class="btn btn-default">Button</button>
				<button type="button" class="btn btn-default">Button</button>
				<button type="button" class="btn btn-default">Button</button>
				<button type="button" class="btn btn-default" >Button</button>
				<button type="button" class="btn btn-default">Button</button>
				<button type="button" class="btn btn-default">Button</button>
				<button type="button" class="btn btn-default">Button</button> -->
			</div>
		</div>
	</body>
</html>