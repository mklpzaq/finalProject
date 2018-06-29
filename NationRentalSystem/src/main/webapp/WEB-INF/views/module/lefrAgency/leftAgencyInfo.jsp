<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<title>Left AgencyEmployee Info</title>
		<script>
			$(document).ready(function(){
				$('#selectListContractAgency').click(function(){
					$(location).attr('href', './selectListContractAgency');
				});
				$('#selectListContractClosedAgency').click(function(){
					$(location).attr('href', './selectListContractClosedAgency');
				});
				$('#insertAgency').click(function(){
					$(location).attr('href', './insertAgencyForm');
				});
			});
		</script>
		
	</head>
	<body>
		<input type="hidden" id="memberId" value="${member.memberId}"/>
		<div style="width:100%;" class="btn-group-vertical btn-group-lg" role="group" aria-label="Vertical button group">
			<button id="selectListContractAgency" type="button" class="btn btn-default" >낙찰된 대행업체 조회</button>
			<button id="selectListContractClosedAgency" type="button" class="btn btn-default" >계약해지된 대행업체 조회</button>
			<button id="insertAgency" type="button" class="btn btn-default" >대행업체 등록</button>			
		</div>
		
	</body>
</html>