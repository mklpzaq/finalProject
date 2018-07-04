<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
		<title>Insert title here</title>
		<script type="text/javascript">
			$(document).ready(function(){
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
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="height:600px;">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="../module/leftFunctionary/leftFunctionaryInfo.jsp"/>
				</div>
				<div style="padding:15px;" class="col-sm-8">
					<!-- Begin Content -->
								
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="text-center">공무원회원 정보수정</h3>
							<hr/>
							<form action="${pageContext.request.contextPath}/updateFunctionnary" method="post">
								<div class="form-group">
									<label class="col-sm-2 control-label">ID</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="functionaryId" value="${returnfunctionaryDto.functionaryId}" readonly="readonly">
									</div>
								</div>
									<br></br>
								<div class="form-group">
									<label class="col-sm-2 control-label">소속행정기관</label>
									<div class="col-sm-10">
										<div class="input-group">
											<input hidden="hidden" id="adminagencyCode" name="adminagencyCode">
											<input type="text" class="form-control" id="adminagencyName" name="adminagencyName" value="${returnfunctionaryDto.adminagencyName}" readonly="readonly">
											<span class="input-group-btn">
												<button type="button" id="myModalclick" class="btn btn-primary" data-toggle="modal" data-target="#adminagencyCheckModal">행정기관찾기</button>
											</span>
										</div>
									</div>
								</div>
									<br></br>
								<div class="form-group">
									<label class="col-sm-2 control-label">이름</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="functionaryName" value="${returnfunctionaryDto.functionaryName}">
									</div>
								</div>
									<br></br>
								<div class="form-group">
									<label class="col-sm-2 control-label">전화번호</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="functionaryPhone" value="${returnfunctionaryDto.functionaryPhone}">
									</div>
								</div>
									<br></br>
								<div class="form-group">
									<label class="col-sm-2 control-label">Email</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="functionaryEmail" value="${returnfunctionaryDto.functionaryEmail}">
									</div>
								</div>	
									<br></br>		
								<div class="text-center">
									<button type="submit" class="btn btn-primary">정보수정</button>									
								</div>
							</form>
							<!-- End Content -->
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
							      			        
							      </div>
							    </div>
							  </div>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>
	</body>
</html>