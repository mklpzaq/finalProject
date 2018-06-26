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
				$('#PaymentBtn').click(function(){
					$(location).attr('href', './selectListRentalTotalPayment').val();
				});
				$('#RequestRefundBtn').click(function(){
					$(location).attr('href', './selectListRequestRefund').val();
				});
			});
		</script>
		
	</head>
	<body>
		<div style="width:100%;" class="btn-group-vertical btn-group-lg" role="group" aria-label="Vertical button group">
			<button id="PaymentBtn" type="button" class="btn btn-default" >결제 완료 리스트</button>
			<button id="RequestRefundBtn" type="button" class="btn btn-default">환불 신청 리스트</button>
		</div>	
	</body>
</html>