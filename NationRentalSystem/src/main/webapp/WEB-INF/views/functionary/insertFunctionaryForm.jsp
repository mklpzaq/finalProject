<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
		<title>Home</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				
				var email = $("#functionaryEmail").val();
		        var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;		        
				
				$("#btn").click(function(){		          		          
		          //아이디 입력여부 검사
		          if ($("#id").val() == "") {
		              alert("아이디를 입력하지 않았습니다.");
		              $("#id").focus();
		              return false;
		          }
		          
		          if ($("#id").val().indexOf(" ") > 0) {
		              alert("아이디에 공백이 들어갈 수 없습니다.");
		              $("#id").focus();
		              $("#id").select();
		              return false;
		          }
		          
		          for (i = 0; i < $("#id").val().length; i++) {    
		              ch = $("#id").val().charAt(i) //지정한 인덱스에 해당하는 문자열의 값을 리턴
		              if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
		                  alert("아이디는 대소문자, 숫자만 입력가능합니다."); 	//!(ch >= '0' && ch <= '9') ch가 0~9사이에 있으면 거짓 없으면 참
		                  $("#id").val().focus();					//!(ch >= 'a' && ch <= 'z') ch가 a~z사이에 있으면 거짓 없으면 참
		                  $("#id").val().select();					//!(ch >= 'A' && ch <= 'Z') ch가 A~Z사이에 있으면 거짓 없으면 참
		                  return false;								//참참참이면 alert("아이디는 대소문자, 숫자만 입력가능합니다.")	실행
		              }												//하나라도 거짓이면 즉, 안에 조건이 참이면 no실행
					}
		          
		          if ($("#id").val().length<8 || $("#id").val().length>16) {
		              alert("아이디를 4~12자까지 입력해주세요.");
		              $("#id").val().focus();
		              $("#id").val().select();
		              return false;
		          }
		          
		          if ($("#Password1").val() == $("#id").val()) {
		              alert("아이디와 비밀번호가 같습니다.");
		              $("#Password1").focus();
		              return false;
		          }
		          
		          if ($("#Password1").val() == "") {
		              alert("비밀번호를 입력하지 않았습니다.");
		              $("#Password1").focus();
		              return false;
		          }
		          
		          //비밀번호 길이 체크(4~8자 까지 허용)
		          if ($("#Password1").val().length<4 || $("#Password1").val().length>12) {
		              alert("비밀번호를 4~12자까지 입력해주세요.");
		              $("#Password1").focus();
		              $("#Password1").select();
		              return false;
		          }
		   
		          //비밀번호와 비밀번호 확인 일치여부 체크
		          if ($("#Password1").val() != $("#Password2").val()) {
		              alert("비밀번호가 일치하지 않습니다");
		              $("#Password1").val() = ""
		              $("#Password1").focus();
		              return false;
		          }
		          
		          if ($("#functionaryEmail").val() == "") {
		              alert("이메일을 입력하지 않았습니다.");
		              $("#functionaryEmail").focus();
		              return false;
		          }
		          
		   
		          if (regex.test(email) === false) {
		              alert("잘못된 이메일 형식입니다.");
		              $("#functionaryEmail").val()="";
		              $("#functionaryEmail").focus();
		              return false;
		          }
		          if ($("#functionaryName").val() == "") {
		              alert("이름을 입력하지 않았습니다.");
		              $("#functionaryName").focus();
		              return false;
		          }
		          if($("#functionaryName").val().length<2){
		              alert("이름을 2자 이상 입력해주십시오.");
		              $("#functionaryName").focus();
		              return false;
		          }
		          
		          if ($("#functionaryNum").val() == "") {
		              alert("공무원번호를 입력하지 않았습니다.");
		              $("#functionaryNum").focus();
		              return false;
		          }
		          		      
		            // 숫자가 아닌 것을 입력한 경우
		            if (!isNumeric($("#functionaryNum").val())) {
		              alert("공무원번호는 숫자로 입력하세요.");
		              $("#functionaryNum").val() = "";
		              $("#functionaryNum").focus();
		              return false;
		            }
		          
		         });
			});			
		</script>
	</head>
	
	
	<body>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="/WEB-INF/views/module/left/leftnavi.jsp"/>
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->
					
				<div class="text-center">
					<h1>공무원회원 가입</h1>
					<h2>Nation Integrated Reserve and Rental System</h2>
					<P>The time on the server is ${serverTime}.</P>
				</div>
				
				<form class="form-horizontal" action="" id="funtionaryForm">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="id" placeholder="아이디">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="Password1" placeholder="비밀번호">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">비밀번호 확인</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="Password2" placeholder="비밀번호 확인">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">행정기관명</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="adminagencyCode" placeholder="행정기관명">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">공무원번호</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="functionaryNum" placeholder="공무원번호">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">이름</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="functionaryName" placeholder="이름">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">연락처</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="functionaryPhone" placeholder="연락처">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">이메일</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="functionaryEmail" placeholder="이메일">
						</div>
					</div>
				
					<!-- <div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label>
								<input type="checkbox"> Remember me
								</label>
							</div>
						</div>
					</div> -->
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" id="btn" class="btn btn-default">Sign in</button>
						</div>
					</div>
				</form>
					
			</div>
		</div>
	
	</body>
</html>
