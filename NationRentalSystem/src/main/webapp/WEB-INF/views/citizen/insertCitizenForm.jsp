<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>Insert Citizen</title>

	<script type="text/javascript">
		/* 
			< 기능 정의 >
			1.아이디는 8글자 이상 12글자 이하 
			2.아이디는 숫자까지만 포함
			3.비밀번호는 8글자 이상 12글자 이하 
			4.비밀번호는 특수문자와 숫자조합을 무조건 해야 한다. 
			5.중복된 아이디값은 쓸 수 없다.
			6.필수정보 입력 데이터는 아이디 비밀번호 주민번호 주소 이름 핸드폰번호 이다.					
		*/
		
		$(document).ready(function(){
			$("#CitizenID").keyup(function(){
				if($("#CitizenID").val().length <= 8) {
					$("#CitizenId").append($("<p/>",{
						id: "checkId",
						title: "8자 이상을 입력해주세요 ",
						text: "8자 이상을 입력해주세요"
					}));					
				}else if($("#CitizenID").val().length >= 12) {
					$("#CitizenId").hide();
				}			
			});
			
			 $('#checkbtn').on('click', function(){
		            $.ajax({
		                type: 'POST',
		                url: '/mate/checkSignup',
		                data: {
		                    "id" : $('#id').val()
		                },
		                success: function(data){
		                    if($.trim(data) == 0){
		                        $('#checkMsg').html('<p style="color:blue">사용가능</p>');
		                    }
		                    else{
		                        $('#checkMsg').html('<p style="color:red">사용불가능</p>');
		                    }
		                }
		            });    //end ajax    
		        });    //end on	
			
		});
		
	</script>

</head>

<body>
	<h2> 시민 회원 가입 폼 </h2>
	<form action="${pageContext.request.contextPath}/insertCitizen" method="post">
		<div class="form-group">
				<label for="CitizenID" class="col-sm-2 control-label">회원ID</label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" id="CitizenID" placeholder="회원ID">
		    	  <button type="submit" id="checkbtn" class="btn btn-default">중복확인</button>
		    	  <div id="checkMsg"></div>		    	 
		    	<div id ="CitizenId"></div>		    	
		    </div>
		</div>
		<div class="form-group">
				<label for="CitizenPW" class="col-sm-2 control-label">회원PW</label>
		    <div class="col-sm-10">
		    	<input type="password" class="form-control" id="CitizenPW" placeholder="회원PW">
		    </div>
		</div>
		<div class="form-group">
				<label for="ReCitizenPW" class="col-sm-2 control-label">패스워드 확인</label>
		    <div class="col-sm-10">
		    	<input type="password" class="form-control" id="ReCitizenPW" placeholder="패스워드 확인">
		    </div>
		</div>
		<div class="form-group">
				<label for="CitizenName" class="col-sm-2 control-label">회원이름</label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" id="CitizenName" placeholder="회원이름">
		    </div>
		</div>
			<div class="form-group">
				  <label class="col-sm-2 control-label" for="inputSuccess5">주민번호 앞자리</label>				  
				  <div class="col-sm-10">
				  	<input type="text" class="form-control" id="inputSuccess5" aria-describedby="inputSuccess5Status">
				  </div>				
				  	<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>				  
			</div>
			<div class="form-group">
				  <label class="col-sm-2 control-label" for="inputGroupSuccess4">주민번호 뒷자리</label>
				<div class="col-sm-10">				   
				    <input type="text" class="form-control" id="inputGroupSuccess4" aria-describedby="inputGroupSuccess4Status">
				</div>
				  <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>				  
			</div>
		<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
		    <div class="col-sm-10">
		    	<input type="email" class="form-control" id="inputEmail3" placeholder="Email">
		    </div>
		</div>
		
		<div class="form-group">
			<label for="sigungu" class="col-sm-2 control-label">시군구코드</label>
			<div class="col-sm-10">
				<select class="form-control">
					  <option>1</option>
					  <option>2</option>
					  <option>3</option>
					  <option>4</option>
					  <option>5</option>
				</select>
			</div>
		</div>		
			
		<div class="form-group">
			<label for="sigungu" class="col-sm-2 control-label">읍면동코드</label>
			<div class="col-sm-10">
				<select class="form-control">
					  <option>1</option>
					  <option>2</option>
					  <option>3</option>
					  <option>4</option>
					  <option>5</option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
				<label for="Address" class="col-sm-2 control-label">회원 주소</label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" id="inputEmail3" placeholder="Address">
		    </div>
		</div>
		
		<div class="form-group">
				<label for="CitizenPhone" class="col-sm-2 control-label">휴대전화번호</label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" id="CitizenPhone" placeholder="CitizenPhone">
		    </div>
		</div>		
		
		<button type="button" class="btn btn-primary btn-lg btn-block" id="InsertCitizen">회원가입</button>
		
	</form>



</body>
</html>