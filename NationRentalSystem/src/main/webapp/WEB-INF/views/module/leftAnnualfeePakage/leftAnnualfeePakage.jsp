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
				$('#insertAnnualfeePakage').click(function(){
					$(location).attr('href', './insertAnnualfeePakage');
				});
				$('#selectListAnnualfeePakage').click(function(){
					$(location).attr('href', './selectListAnnualfeePakage');
				});	
				$('#selectListAnnualfeePakageOwnership').click(function(){
					$(location).attr('href', './selectListAnnualfeePakageOwnership');
				});	
			});
		</script>
		
	</head>
	<body>
		<input type="hidden" id="memberId" value="${member.memberId}"/>
		<div style="width:100%;" class="btn-group-vertical btn-group-lg" role="group" aria-label="Vertical button group">
			<c:choose>
				<c:when test="${member.memberLevel == '공무원'}">
					<button id="insertAnnualfeePakage" type="button" class="btn btn-default" >연회비/패키지 등록</button>
					<button id="selectListAnnualfeePakage" type="button" class="btn btn-default" >연회비/패키지 조회</button>
				</c:when>
				<c:when test="${member.memberLevel == '시민'}">
					<button id="selectListAnnualfeePakage" type="button" class="btn btn-default" >연회비/패키지 조회</button>
					<button id="selectListAnnualfeePakageOwnership" type="button" class="btn btn-default" >구입한 연회비/패키지 조회</button>
				</c:when>
				<c:otherwise>
					<button id="selectListAnnualfeePakage" type="button" class="btn btn-default" >연회비/패키지 조회</button>
				</c:otherwise>
			</c:choose>			
		</div>		
	</body>
</html>