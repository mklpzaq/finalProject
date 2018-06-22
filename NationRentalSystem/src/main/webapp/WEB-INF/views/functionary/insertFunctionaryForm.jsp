<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Home</title>		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">		
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>		
		<script type="text/javascript">
		
				
			$(document).ready(function(){
			
				
				
				$("#idCheckBtn").click(function(){
				    $.ajax({
				        type:"POST", //통신타입 get, post
				        url:"${pageContext.request.contextPath}/idCheck",  //요청할 url
				        data : { agencyEmployeeId : $('#functionaryId').val() },  //넘겨줄 값, 파라메터
				        success: function( JSON ){//데이터를 받아오는데 성공하면 이후에 할 행동				        
					        if(JSON=='T'){
					        	alert('중복되지 않은 아이디입니다');					        	
					    	}else{
								alert('중복된 아이디입니다. 다른 아이디를 입력해주세요.');
					    	}
				        }     
				    });
				});
				
				$('#insertBtn').click(function(){
					
					var email = $("#functionaryEmail").val();
					console.log(email);
					var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
					
					
					var funtionaryForm = true;
				  
			        //아이디 입력여부 검사
			        if ($("#functionaryId").val() == "") {
			            alert("아이디를 입력하지 않았습니다.");
			            $("#functionaryId").focus();		               
			            funtionaryForm = false;
			            return
			        }
			        //아이디 공백 여부 검사
			        if ($("#functionaryId").val().indexOf(" ") > 0) {
			            alert("아이디에 공백이 들어갈 수 없습니다.");
			            $("#functionaryId").focus();
			            $("#functionaryId").select();
			            funtionaryForm = false;
			            return
			        }
			        //아이디 입력문자조건 검사
			        for (i = 0; i < $("#functionaryId").val().length; i++) {    
			            ch = $("#functionaryId").val().charAt(i) //지정한 인덱스에 해당하는 문자열의 값을 리턴
			            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
			                alert("아이디는 대소문자, 숫자만 입력가능합니다."); 	//!(ch >= '0' && ch <= '9') ch가 0~9사이에 있으면 거짓 없으면 참
			                $("#functionaryId").val().focus();					//!(ch >= 'a' && ch <= 'z') ch가 a~z사이에 있으면 거짓 없으면 참
			                $("#functionaryId").val().select();					//!(ch >= 'A' && ch <= 'Z') ch가 A~Z사이에 있으면 거짓 없으면 참
			                funtionaryForm = false;
			             return								
			            }									
			  		}
			        //아이디 길이 검사
			        if ($("#functionaryId").val().length<8 || $("#functionaryId").val().length>16) {
			            alert("아이디를 8~16자까지 입력해주세요.");
			            $("#functionaryId").focus();
			            $("#functionaryId").val().select();
			            funtionaryForm = false;
			            return
			        }
			        //아이디 비밀번호 일치 검사
			        if ($("#functionaryPw").val() == $("#functionaryId").val()) {
			            alert("아이디와 비밀번호가 같습니다.");
			            $("#functionaryPw").focus();
			            funtionaryForm = false;
			            return
			        }
			        //비밀번호 입력여부 검사
			        if ($("#functionaryPw").val() == "") {
			            alert("비밀번호를 입력하지 않았습니다.");
			            $("#functionaryPw").focus();
			            funtionaryForm = false;
			            return
			        }
			        
			        //비밀번호 길이 체크(4~8자 까지 허용)
			        if ($("#functionaryPw").val().length<4 || $("#functionaryPw").val().length>12) {
			            alert("비밀번호를 4~12자까지 입력해주세요.");
			            $("#functionaryPw").focus();
			            $("#functionaryPw").select();
			            funtionaryForm = false;
			            return
			        }
			 
			        //비밀번호와 비밀번호 확인 일치여부 체크
			        if ($("#functionaryPw").val() != $("#functionaryPw2").val()) {
			            alert("비밀번호가 일치하지 않습니다");
			            $("#functionaryPw") = ""
			            $("#functionaryPw").focus();
			            funtionaryForm = false;
			            return
			        }
			      	//이메일 입력여부 검사
			        if ($("#functionaryEmail").val() == "") {
			            alert("이메일을 입력하지 않았습니다.");
			            $("#functionaryEmail").focus();
			            funtionaryForm = false;
			            return
			        }
			     	//이메일 형식 검사	 			
			        if (regex.test(email) === false) {
			            alert("잘못된 이메일 형식입니다.");
			            $("#functionaryEmail").val() = "" 
			            $("#functionaryEmail").focus();
			            funtionaryForm = false;
			            return
			        }
			    	//이름 입력여부 검사
			        if ($("#functionaryName").val() == "") {
			            alert("이름을 입력하지 않았습니다.");
			            $("#functionaryName").focus();
			            funtionaryForm = false;
			            return
			        }
			     	//이름 길이 검사
			        if($("#functionaryName").val().length<2){
			            alert("이름을 2자 이상 입력해주십시오.");
			            $("#functionaryName").focus();
			            funtionaryForm = false;
			            return
			        }
			      	//공무원번호 입력여부 검사
			        if ($("#functionaryNum").val() == "") {
			            alert("공무원번호를 입력하지 않았습니다.");
			            $("#functionaryNum").focus();
			            funtionaryForm = false;
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
			          
			      	//행정기관 입력여부 검사
			        if ($("#adminagencyName").val() == "") {
			            alert("행정기관을 검색해 주십시오.");
			            $("#myModalclick").focus();
			            funtionaryForm = false;
			            return
			        }
			          
			        //공무원번호 입력조건 검사
					for (i = 0; i < $("#functionaryNum").val().length; i++) {    
						ch = $("#functionaryNum").val().charAt(i) //지정한 인덱스에 해당하는 문자열의 값을 리턴
						if (!(ch >= '0' && ch <= '9')) {
							alert("공무원번호는 숫자만 입력가능합니다."); 	
							$("#functionaryNum").focus();					
							$("#functionaryNum").val().select();					
							funtionaryForm = false;
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
						
						
						/* $('#tr').click(function(){					
							$('#adminagencyName').val($(this).children().last().val());
							$('#adminagencyCode').val($(this).children().first().val());
							jQuery('#adminagencyCheckModal').dialog('close');
						}); */
						
						/*
						$("#adminagencyNameList").click(function(){
							$('#adminagencyName').val($('#adminagencyNameList').val());
						 	$('#adminagencyCode').val($(this).siblings.val());					
						});
						 */
						 
						/* $('#adminagencyList').find('TR>TD').bind('click', function () {
						    $except = $(this);
						    $('#adminagencyName').val($except.val());
						}); */

						
						/* var checkId	 */
						/* $('#idCheckBtn').click(function(){
							$.ajax({
							      type: "POST"
							      ,url: "/nationRental/idCheck"
							      ,data: { agencyEmployeeId: $('#agencyEmployeeId').val() }
							      ,success:function( JSON ) { // result : String, XML, JSON
							    	  if(JSON=='T'){
										alert('중복되지 않는 아이디입니다.');
										 $(location).attr('href', './insertAgencyEmployee'); 
										 $('#injeungAgencyEmployeeForm').submit(); 
							    	  }else{
										alert('중복된 아이디입니다. 다른 아이디를 입력해주세요.');
							    	  }
							      }
							});
						}); */
					
					//모든 유효성 검사를 통과했을 경우 다시한번 id유효성 검사를 하고 커밋을 시킨다.
					if(funtionaryForm = true){
						$.ajax({
							type: "POST"
							,url: "${pageContext.request.contextPath}/idCheck"
							,data: { agencyEmployeeId: $('#functionaryId').val() }
							,success:function( JSON ) { // result : String, XML, JSON
								if(JSON=='T'){
									
										     
									$('#insertfuntionaryForm').submit();
								}else{
									alert('중복되거나 잘못된 아이디입니다. 다시 아이디체크를 해주세요');
								}
							}
						});
					}
				});
			
				//idcheck modal 사용하지 않음
				/* $("#useId").click(function(){
					$('#functionaryId').val($("#checkId").val());
				}); */
				
				$("#adminagencyCheck").click(function(){
				    $.ajax({
				        type:"POST", //통신타입 get, post
				        url:"${pageContext.request.contextPath}/selectAdminagency",  //요청할 url
				        data : { checkAdminagency : $('#checkAdminagency').val() },  //넘겨줄 값, 파라메터
				        success: function( list ){//데이터를 받아오는데 성공하면 이후에 할 행동				        
				        	var list = list;
				        	var str = '';
				        	$.each(list , function(i){
				        		str += '<div class="tr" style="width : 100%;">';
				                str += '<div hidden="hidden">' + list[i].adminagencyCode + '</div><div><button style="width : 100%;" type="button" id="modalAdminagencyName" class="modalAdminagencyName">' + list[i].adminagencyName + '</button></div>';
				                str += '</div><br>';
				          	});
				        	
				        	$("#adminagencyList").append(str);
				        	
				        	$("#adminagencyCheck").click(function(){
				        		$(".tr").remove();				        		
				        	});
				        	
				        	$('.tr').click(function(){
				        		alert('행정기관등록 완료');
				        		$('#adminagencyCheckModal').hide();
				        		$('#adminagencyCode').val($(this).children().first().text());
				        		$('#adminagencyName').val($(this).children().last().text());
							});
				        },
				        error : function(){
				            alert("검색어를 입력해주십시오");
				            
				        }    
				    });
				});
			});		       		
		</script>
	</head>
	
	
	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		<div class="container-fluid">
			<jsp:include page="../module/top/navbar.jsp"/>
			<jsp:include page="../module/top/mainHeader.jsp"/>
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<%-- <jsp:include page="./module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
		
		
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="text-center">공무원 회원가입</h3>
							<hr/>
							<form class="form-horizontal" action="${pageContext.request.contextPath}/insertFunctionary" id="insertfuntionaryForm" method="post">					
								<div class="form-group">
									<label for="functionaryId" class="col-sm-3 control-label">아이디</label>
									<div class="col-sm-9">
										<div class="input-group">
											<input type="text" class="form-control" id="functionaryId" name="functionaryId" placeholder="아이디">
											<span class="input-group-btn">
												<button id="idCheckBtn" class="btn btn-default" type="button">ID 중복검사</button>
											</span>
											
											<!-- //Modal 
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
											        <button type="button" class="btn btn-primary" id="idCheck">아이디체크</button>
											      </div>
											    </div>
											  </div>
											</div> -->
											
										</div>											
									</div>						
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-3 control-label">비밀번호</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="functionaryPw" name="functionaryPw" placeholder="비밀번호">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-3 control-label">비밀번호 확인</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="functionaryPw2" name="functionaryPw2" placeholder="비밀번호 확인">
									</div>
								</div>
								<div class="form-group" hidden="hidden">
									<label for="inputEmail3" class="col-sm-3 control-label">행정기관코드</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="adminagencyCode" name="adminagencyCode" placeholder="행정기관코드" readonly="readonly">								
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">행정기관명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="adminagencyName" name="adminagencyName" placeholder="행정기관명" readonly="readonly">
										<!-- Button trigger modal -->
										<button type="button" id="myModalclick" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#adminagencyCheckModal">
										 행정기관찾기
										</button>
										
										<!-- Modal -->
										<div class="modal fade" id="adminagencyCheckModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										  <div class="modal-dialog">
										    <div class="modal-content">
										      <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        <h4 class="modal-title" id="myModalLabel">행정기관 검색</h4>
										      </div>
										      <div class="modal-body">
										     	<input type="text" id="checkAdminagency">
										     	<button type="button" class="btn btn-primary" id="adminagencyCheck">행정기관검색</button>
										      </div>
										      <div class="modal-footer">
										      	<table id = "adminagencyList" border = "1">
										      	
										      	</table>
										      	<%-- <table class="table table-striped">
													<thead>
														<tr hidden="">
															<td width="50%">행정기관명</td>																		
														</tr>
													</thead>
													<tbody id="callBackAdminagency">									
															<c:forEach var="functionaryDto" items="${list}">										
																<tr>
																	<th><a href="#/${functionaryDto.adminagencyCode}">${functionaryDto.adminagencyName}</a></th>											
																</tr>
															</c:forEach>									
													</tbody>
												</table>	 --%>			        
										      </div>
										    </div>
										  </div>
										</div>
										
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">공무원번호</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="functionaryNum" name="functionaryNum" placeholder="공무원번호">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">이름</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="functionaryName" name="functionaryName" placeholder="이름">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">연락처</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="functionaryPhone" name="functionaryPhone" placeholder="연락처">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">이메일</label>
									<div class="col-sm-9">
										<input type="email" class="form-control" id="functionaryEmail" name="functionaryEmail" placeholder="이메일">
									</div>
								</div>
								
								<div class="text-center">
									<button id="insertBtn" type="button" class="btn btn-default">입력 완료</button>
								</div>
							</form>
				<!-- End Content -->
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	</body>
</html>
