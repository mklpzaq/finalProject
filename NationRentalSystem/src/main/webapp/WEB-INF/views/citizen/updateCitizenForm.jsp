<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Update Form</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			
			$("#btn").click(function(){	
				
				var email = $("#citizenEmail").val();
				console.log(email);
		        var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
				
				
			  var citizenForm = true;       
	          
	          if ($("#CitizenPw").val() == $("#CitizenId").val()) {
	              alert("아이디와 비밀번호가 같습니다.");
	              $("#CitizenPw").focus();
	              citizenForm = false;
	              return
	          }
	          
	          if ($("#CitizenPw").val() == "") {
	              alert("비밀번호를 입력하지 않았습니다.");
	              $("#CitizenPw").focus();
	              citizenForm = false;
	              return
	          }
	          
	          //비밀번호 길이 체크(4~8자 까지 허용)
	          if ($("#CitizenPw").val().length<4 || $("#CitizenPw").val().length>12) {
	              alert("비밀번호를 4~12자까지 입력해주세요.");
	              $("#CitizenPw").focus();
	              $("#CitizenPw").select();
	              citizenForm = false;
	              return
	          }
	   
	          //비밀번호와 비밀번호 확인 일치여부 체크
	          if ($("#CitizenPw").val() != $("#ReCitizenPw").val()) {
	              alert("비밀번호가 일치하지 않습니다");
	              $("#CitizenPw") = ""
	              $("#CitizenPw").focus();
	              citizenForm = false;
	              return
	          }
	          
	          if ($("#citizenEmail").val() == "") {
	              alert("이메일을 입력하지 않았습니다.");
	              $("#citizenEmail").focus();
	              citizenForm = false;
	              return
	          }
	          
	   			
	          if (regex.test(email) === false) {
	              alert("잘못된 이메일 형식입니다.");
	              $("#citizenEmail").val() = "" 
	              $("#citizenEmail").focus();
	              citizenForm = false;
	              return
	          }
	          if ($("#CitizenName").val() == "") {
	              alert("이름을 입력하지 않았습니다.");
	              $("#CitizenName").focus();
	              citizenForm = false;
	              return
	          }
	          if($("#CitizenName").val().length<2){
	              alert("이름을 2자 이상 입력해주십시오.");
	              $("#CitizenName").focus();
	              citizenForm = false;
	              return
	          }
	                     
	            if(citizenForm){
	            	$("#citizenForm").submit();
	            }
	          
	         });
			
			
		});	
			function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullAddr = ''; // 최종 주소 변수
		                var extraAddr = ''; // 조합형 주소 변수
		
		                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    fullAddr = data.roadAddress;
		
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    fullAddr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		                if(data.userSelectedType === 'R'){
		                    //법정동명이 있을 경우 추가한다.
		                    if(data.bname !== ''){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있을 경우 추가한다.
		                    if(data.buildingName !== ''){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }
		
		                // 우편번호와 도로명 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('sample6_address').value = fullAddr; //도로명주소
		
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById('sample6_address2').focus(); //상세주소
	
		                // 지번주소(구주소) 정보를 해당 필드에 넣는다.
		                document.getElementById('sido').value = data.sido; //시도
		                document.getElementById('sigungu').value = data.sigungu; //시군구
		                document.getElementById('bname').value = data.bname; //읍면동
		                document.getElementById('sample6_address').value = fullAddr; //상세주소
		                document.getElementById('buildingCode').value = data.buildingCode; //상세주소
		                
		                /*========== */	                
		                document.getElementById('sigunguName').value = data.sigungu; //시도
		                document.getElementById('eupmyeonName').value = data.bname; //시도
		            }
		        }).open();
		    }
		
		</script>
		
	</head>
	
	
	
	<body>
		<jsp:include page="../module/backgroundImg/backgroundImg.jsp"/>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<%-- <jsp:include page="/WEB-INF/views/module/top/mainHeader.jsp"/> --%>
		<div class="container-fluid" style="margin:15px;">
			<div class="row">
				<div class="col-sm-2">
					<%-- <jsp:include page="./module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
					
					<!-- ========== -->
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<!-- 전체 패널 시작 -->
							<h3>시민정보 수정</h3>
							<hr/>
							<div class="panel panel-default">
								<div class="panel-body text-center">
									<form id="insertAddr" class="form-horizontal" action="${pageContext.request.contextPath}/insertAdministrator" method="post">
										<div class="form-group">
											<label for="sample6_postcode" class="col-sm-4 control-label">도로명주소</label>
											<div class="col-sm-8">
												<input type="text" style="float:left" id="sample6_postcode" placeholder="우편번호">
												<input type="button" style="float:left" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
											</div>
										</div>
										<div class="form-group">
											<label for="sample6_address" class="col-sm-4 control-label"></label>
											<div class="col-sm-8">
												<input type="text" style="float:left" size="40" id="sample6_address" placeholder="도로명주소">
												<input type="text" style="float:left" size="30" id="sample6_address2" placeholder="상세주소">
											</div>
										</div>
										<div class="form-group">
											<label for="jibunAddress" class="col-sm-4 control-label">지번주소</label>
											<div class="col-sm-8">
												<input type="text" style="float:left" size="10" id="sido" placeholder="시도">
												<input type="text" style="float:left" size="10" id="sigungu" placeholder="시군구">
												<input type="text" style="float:left" size="10" id="bname" placeholder="읍면동">
												<input type="text" style="float:left" size="30" id="sample6_address2" placeholder="상세주소">
											</div>
										</div>
										<div class="form-group">
											<label for="buildingCode" class="col-sm-4 control-label">건물번호</label>
											<div class="col-sm-8">
												<input type="text" style="float:left" size="10" id="buildingCode" placeholder="건물번호">
											</div>
										</div>
									</form>
								</div>
							</div>
						
							<form action="${pageContext.request.contextPath}/updateOneCitizen" id="citizenForm" method="post">
								<div class="form-group">
										<label for="ID" class="col-sm-2 control-label">회원ID</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="CitizenId" name="CitizenId" value="${updateCitizen.citizenId}" readonly>				    	     	
								    </div>
								</div>				
								<div class="form-group">
										<label for="PW" class="col-sm-2 control-label">회원PW</label>
								    <div class="col-sm-10">
								    	<input type="password" class="form-control" id="CitizenPw" name="CitizenPw" value="${updateCitizen.citizenPw}">				    	     	
								    </div>
								</div>
								<div class="form-group">
										<label for="RePW" class="col-sm-2 control-label">확인 회원PW</label>
								    <div class="col-sm-10">
								    	<input type="password" class="form-control" id="ReCitizenPw" name="ReCitizenPw">				    	     	
								    </div>
								</div>
								<div class="form-group">
										<label for="sigungu" class="col-sm-2 control-label">시군구이름</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="sigunguName" name="sigunguName"  value="${updateCitizen.sigunguName}" readonly>				    	     	
								    </div>
								</div>
								<div class="form-group">
										<label for="eupmyeon" class="col-sm-2 control-label">읍면동이름</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="eupmyeonName" name="eupmyeonName" value="${updateCitizen.eupmyeonName}" readonly>				    	     	
								    </div>
								</div>					
								<div class="form-group">
										<label for="citizenAddressSangse" class="col-sm-2 control-label">시민 상세주소</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="citizenAddressSangse" name="citizenAddressSangse" value="${updateCitizen.citizenAddressSangse}">				    	    	
								    </div>
								</div>
								<div class="form-group">
										<label for="citizenPhone" class="col-sm-2 control-label">시민 전화번호</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="citizenPhone" name="citizenPhone" value="${updateCitizen.citizenPhone}">				    	    	
								    </div>
								</div>
								<div class="form-group">
										<label for="citizenEmail" class="col-sm-2 control-label">시민 이메일</label>
								    <div class="col-sm-10">
								    	<input type="text" class="form-control" id="citizenEmail" name="citizenEmail" value="${updateCitizen.citizenEmail}">			    	    	
								    </div>
								</div>
								<button type="button" class="btn btn-primary btn-lg btn-block" id="btn">회원수정완료</button>			
							</form>	
							<!-- 전체 패널 종료 -->		
						</div>
					</div>
				
					<!-- End Content -->
				</div>
				<div>
					<div class="col-sm-2"></div>
				</div>
			
			</div>
			<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>
		</div>
	</body>
</html>