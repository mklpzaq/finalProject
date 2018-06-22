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
				$('#viewFunctionaryBtn').click(function(){
					$(location).attr('href', './viewFunctionaryInfo?functionaryId=' + $('#memberId').val());
				});
				$('#updateFunctionaryBtn').click(function(){
					$(location).attr('href', './updateFunctionnary?functionaryId=' + $('#memberId').val());
				});
				$('#selectFunctionaryBtn').click(function(){
					$(location).attr('href', './selectListFunctionary?functionaryId=' + $('#memberId').val());
				});
				$('#deleteYesBtn').click(function(){
					$(location).attr('href', './deleteFunctionnary?functionaryId=' + $('#memberId').val());
				});
				$('#deleteNoBtn').click(function(){
					$('#deleteAgencyEmployeeModal').hide();
				});
			});
		</script>
		
	</head>
	<body>
		<input type="hidden" id="memberId" value="${member.memberId}"/>
		<div style="width:100%;" class="btn-group-vertical btn-group-lg" role="group" aria-label="Vertical button group">
			<button id="viewFunctionaryBtn" type="button" class="btn btn-default" >회원 정보</button>
			<button id="updateFunctionaryBtn" type="button" class="btn btn-default" >회원 정보 수정</button>
			<button id="selectFunctionaryBtn" type="button" class="btn btn-default" >공무원 회원 검색</button>
			<!-- Button trigger modal -->
			<button type="button" id="deleteFunctionaryModalBtn" class="btn btn-default" data-toggle="modal" data-target="#deleteFunctionaryModal">
				회원 탈퇴
			</button>
			<!-- <button id="deleteAgencyEmployeeBtn" type="button" class="btn btn-default">회원 탈퇴</button> -->
		</div>
		
		<!--Begin Modal -->
		<div class="modal fade" id="deleteFunctionaryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title text-center" id="myModalLabel">정말로 탈퇴하시겠습니까?</h4>
					</div>
					<div class="modal-body text-center">
						<button type="button" class="btn btn-primary" id="deleteYesBtn">탈퇴</button> &emsp; &emsp;
						<button type="button" class="btn btn-primary" id="deleteNoBtn">아니오</button>
					</div>
					<div class="modal-footer">
				
					</div>
				</div>
			</div>
		</div>
		<!--End Modal -->
		
			
	</body>
</html>