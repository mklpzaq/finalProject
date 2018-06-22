<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">		
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>		
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
		
			$("#idCheckCitizen").click(function(){
			    $.ajax({
			        type:"POST", //통신타입 get, post
			        url:"${pageContext.request.contextPath}/idCheckCitizen",  //요청할 url
			        data : { agencyEmployeeId : $('#checkId').val() },  //넘겨줄 값, 파라메터
			        success: function( JSON ){//데이터를 받아오는데 성공하면 이후에 할 행동				        
				        if(JSON=='T'){
				        	alert('중복되지 않은 아이디입니다');					        	
				    	}else{
							alert('중복된 아이디입니다. 다른 아이디를 입력해주세요.');
				    	}
			        }     
			    });
			});
			
			$("#useId").click(function(){
				$('#CitizenId').val($("#checkId").val());
			});
			
			$("#btn").click(function(){	
				
				var email = $("#citizenEmail").val();
				console.log(email);
		        var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
				
				
			  var citizenForm = true;
				  
	          //아이디 입력여부 검사
	          if ($("#CitizenId").val() == "") {
	              alert("아이디를 입력하지 않았습니다.");
	              $("#CitizenId").focus();		               
	              citizenForm = false;
	              return
	          }
	          
	          if ($("#CitizenId").val().indexOf(" ") > 0) {
	              alert("아이디에 공백이 들어갈 수 없습니다.");
	              $("#CitizenId").focus();
	              $("#CitizenId").select();
	              citizenForm = false;
	              return
	          }
	          
	          for (i = 0; i < $("#CitizenId").val().length; i++) {    
	              ch = $("#CitizenId").val().charAt(i) //지정한 인덱스에 해당하는 문자열의 값을 리턴
	              if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
	                  alert("아이디는 대소문자, 숫자만 입력가능합니다."); 	//!(ch >= '0' && ch <= '9') ch가 0~9사이에 있으면 거짓 없으면 참
	                  $("#CitizenId").val().focus();					//!(ch >= 'a' && ch <= 'z') ch가 a~z사이에 있으면 거짓 없으면 참
	                  $("#CitizenId").val().select();					//!(ch >= 'A' && ch <= 'Z') ch가 A~Z사이에 있으면 거짓 없으면 참
	                  citizenForm = false;
		              return								//참참참이면 alert("아이디는 대소문자, 숫자만 입력가능합니다.")	실행
	              }												//하나라도 거짓이면 즉, 안에 조건이 참이면 no실행
			  }
	          
	          if ($("#CitizenId").val().length<8 || $("#CitizenId").val().length>16) {
	              alert("아이디를 8~16자까지 입력해주세요.");
	              $("#CitizenId").focus();
	              $("#CitizenId").val().select();
	              citizenForm = false;
	              return
	          }
	          
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
	          if ($("#CitizenPw").val() != $("#ReCitizenPW").val()) {
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
	          
	          if ($("#citizenJuminNum").val() == "") {
	              alert("주민번호를 입력하지 않았습니다.");
	              $("#citizenJuminNum").focus();
	              citizenForm = false;
	              return
	          }
	          	/* //해당 isNumeric매서드 실행안됨
	            // 숫자가 아닌 것을 입력한 경우
	            if (!isNumeric($("#functionaryNum").val())) {
	              alert("공무원번호는 숫자로 입력하세요.");
	              $("#functionaryNum").val() = "";
	              $("#functionaryNum").focus();
	              funtionaryForm = false;
	              return
	            } */
	          
	            for (i = 0; i < $("#citizenJuminNum").val().length; i++) {    
		              ch = $("#citizenJuminNum").val().charAt(i) //지정한 인덱스에 해당하는 문자열의 값을 리턴
		              if (!(ch >= '0' && ch <= '9')) {
		                  alert("주민번호는 숫자만 입력가능합니다."); 	
		                  $("#citizenJuminNum").focus();					
		                  $("#citizenJuminNum").val().select();					
		                  citizenForm = false;
			              return							
		              }												
				}
	            
	            /* //연락처 안잡힘
	            if ($("#functionaryPhone").val().length === 11) {
		              alert("연락처는 11자이상 입력하여야합니다.");
		              $("#functionaryPhone").focus();
		              $("#functionaryPhone").select();
		              funtionaryForm = false;
		              return
		          }
	            
	            //연락처 안잡힘
	            for (i = 0; i < $("#functionaryPhone").val().length; i++) {    
		              ch = $("#functionaryPhone").val().charAt(i) //지정한 인덱스에 해당하는 문자열의 값을 리턴
		              if (!(ch >= '0' && ch <= '9')) {
		                  alert("연락처는 숫자만 입력가능합니다."); 	
		                  $("#functionaryPhone").focus();					
		                  $("#functionaryPhone").val().select();					
		                  funtionaryForm = false;
			              return								
		              }												
				} */
	            
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
		                document.getElementById('sidoName').value = data.sido; //시도
		                document.getElementById('sigunguName').value = data.sigungu; //시도
		                document.getElementById('eupmyeonName').value = data.bname; //시도
		            }
		        }).open();
		    }
		
	</script>
 
</head>

<body>
	<div class="container-fluid">
			<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
			<jsp:include page="/WEB-INF/views/module/top/mainHeader.jsp"/>
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<%-- <jsp:include page="./module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->
				
				<!-- ========== -->
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
	
	<h2> 시민 회원 가입 폼 </h2>
	<form action="${pageContext.request.contextPath}/insertCitizen" id="citizenForm" method="post">
		<div class="form-group">
				<label for="ID" class="col-sm-2 control-label">회원ID</label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" id="CitizenId" name="CitizenId" placeholder="회원ID" readonly>
		    	<!-- Button trigger modal -->
				<button type="button" id="myModalclick" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#idCheckModal">
				 아이디체크
				</button>													
			</div>							    	
		 </div>
	
		<div class="form-group">
				<label for="PW" class="col-sm-2 control-label">회원PW</label>
		    <div class="col-sm-10">
		    	<input type="password" class="form-control" id="CitizenPw" name="citizenPw" placeholder="회원PW">
		    </div>
		</div>
		<div class="form-group">
				<label for="ReCitizenPW" class="col-sm-2 control-label">패스워드 확인</label>
		    <div class="col-sm-10">
		    	<input type="password" class="form-control" id="ReCitizenPW" placeholder="패스워드 확인">
		    </div>
		</div>
		<div class="form-group">
				<label for="Name" class="col-sm-2 control-label">회원이름</label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" id="CitizenName" name="citizenName" placeholder="회원이름">
		    </div>
		</div>
			<div class="form-group">
				  <label class="col-sm-2 control-label" for="inputSuccess5">주민번호</label>				  
				  <div class="col-sm-10">
				  	<input type="text" class="form-control" id="citizenJuminNum" name="citizenJuminNum" aria-describedby="inputSuccess5Status">
				  </div>			  				  
			</div>			
		<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
		    <div class="col-sm-10">
		    	<input type="email" class="form-control" id="citizenEmail" name="citizenEmail" placeholder="Email">
		    </div>
		</div>
		
		<div class="form-group">
				<label for="Address" class="col-sm-2 control-label">시군구</label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" id="sigunguName" name="sigunguName" placeholder="시군구" readonly>
		    </div>
		</div>
		
		<div class="form-group">
				<label for="Address" class="col-sm-2 control-label">시도 </label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" id="sidoName" name="sidoName" placeholder="시도명" readonly>
		    </div>
		</div>
		
		<div class="form-group">
				<label for="Address" class="col-sm-2 control-label">읍면동</label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" id="eupmyeonName" name="eupmyeonName" placeholder="읍면동" readonly>
		    </div>
		</div>
			
		<div class="form-group">
				<label for="Address" class="col-sm-2 control-label">회원 주소</label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" id="citizenAddressSangse" name="citizenAddressSangse" placeholder="Address">
		    </div>
		</div>
		
		<div class="form-group">
				<label for="Phone" class="col-sm-2 control-label">휴대전화번호</label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" id="CitizenPhone" name="citizenPhone" placeholder="CitizenPhone">
		    </div>
		</div>		
		
		<button type="button" class="btn btn-primary btn-lg btn-block" id="btn" >회원가입</button>
		
	</form>
	
	<!-- Modal -->
				<div class="modal fade" id="idCheckModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">아이디 체크</h4>
				      </div>
				      <div class="modal-body">
				     	<input type="text" id="checkId">
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal" id="useId">아이디사용</button>
				        <button type="button" class="btn btn-primary" id="idCheckCitizen">아이디체크</button>
				      </div>
				    </div>
				  </div>
				</div>
				
	<!-- End Content -->
			</div>
				<div class="col-sm-2"></div>
			</div>
			
		</div>
		<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>

</body>
</html>