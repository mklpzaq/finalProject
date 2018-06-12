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
				$('#OneBtn').click(function(){
					$(location).attr('href', './selectListGoodsFacilityCategoryOne').val();
				});
				$('#TwoBtn').click(function(){
					$(location).attr('href', './selectListGoodsFacilityCategoryTwo').val();
				});
				$('#ThreeBtn').click(function(){
					$(location).attr('href', './selectListGoodsFacilityCategoryThree').val();
				});
			});
		</script>
		
	</head>
	<body>
		<div style="width:100%;" class="btn-group-vertical btn-group-lg" role="group" aria-label="Vertical button group">
			<button id="OneBtn" type="button" class="btn btn-default" >1차 카테고리 목록</button>
			<button id="TwoBtn" type="button" class="btn btn-default">2차 카테고리 목록</button>
			<button id="ThreeBtn" type="button" class="btn btn-default">3차 카테고리 목록</button>
		</div>	
	</body>
</html>