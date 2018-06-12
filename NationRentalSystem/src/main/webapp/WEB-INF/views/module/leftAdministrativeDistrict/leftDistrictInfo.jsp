<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Left District Info</title>
		<script>
			$(document).ready(function(){
				$('#SidoBtn').click(function(){
					$(location).attr('href', './selectListSido').val();
				});
				$('#SigunguBtn').click(function(){
					$(location).attr('href', './selectListSigungu').val();
				});
				$('#EupmyeonBtn').click(function(){
					$(location).attr('href', './selectListEupmyeon').val();
				});
			});
		</script>
		
	</head>
	<body>
		<div style="width:100%;" class="btn-group-vertical btn-group-lg" role="group" aria-label="Vertical button group">
			<button id="SidoBtn" type="button" class="btn btn-default" >시도 목록</button>
			<button id="SigunguBtn" type="button" class="btn btn-default">시군구 목록</button>
			<button id="EupmyeonBtn" type="button" class="btn btn-default">읍면동 목록</button>
		</div>	
	</body>
</html>