<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">		
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#adminagencyAdd').click(function(){			
			$('#addAdminagency').append('<div id="inputAdminagencyName">'
					+'<label for="inputAdminagencyName" class="col-sm-2 control-label">등록 행정기관명</label>'
					+'<div class="col-sm-10 input-group"">'
					+'<input type="hidden" class="form-control" id="adminagencyCode" name="adminagencyCode" placeholder="적용되는 행정기관코드">'
					+'<input type="text" class="form-control" id="adminagencyName" name="adminagencyName" placeholder="적용되는 행정기관명" readonly="readonly">'
					+'<span class="input-group-btn">'
					+'<button type="button" id="myModalclick" class="btn btn-primary" data-toggle="modal" data-target="#adminagencyCheckModal">행정기관찾기</button>'
					+'<button type="button" id="del" class="btn btn-primary">삭제</button>'
					+'</span>'
					+'</div>'
					+'</div>');
			
			$(document).on('click','#del',function(){
				$(this).closest('#inputAdminagencyName').remove();
			});		
		
			
			$("#myModalclick").click(function(){
				$("#adminagencyCheck").click(function(){
				    $.ajax({
				        type:"POST", //통신타입 get, post
				        url:"/nationRental/selectAdminagency",  //요청할 url
				        data : { checkAdminagency : $('#checkAdminagency').val() },  //넘겨줄 값, 파라메터
				        success: function( list ){//데이터를 받아오는데 성공하면 이후에 할 행동				        
				        	var list = list;
				        	var str = '';
				        	$.each(list , function(i){
				        		str += '<TR class="tr">';
				                str += '<TD hidden="hidden">' + list[i].adminagencyCode + '</TD><TD><button type="button" id="modalAdminagencyName" class="modalAdminagencyName">' + list[i].adminagencyName + '</button></TD>';
				                str += '</TR><br>';
				          	});
				        	
							/* str이 삽입되는 위치 */
				        	$("#adminagencyList").append(str);
				        	
							/* 검색버튼을 누를시에 이전에 검색되었던 tr리스트가 삭제 */
				        	/* $("#adminagencyCheck").click(function(){
				        		$(".tr").remove();				        		
				        	}); */
				        	
				        	
				        	
				        	$('.tr').click(function(){
				        		alert('행정기관등록 완료');
				        		$('#adminagencyCode').val($(this).children().first().text());
				        		$('#adminagencyName').val($(this).children().last().text());					        				        		
				        		$('#adminagencyCheckModal').hide();					        		
				        		$('#checkAdminagency').val("");
				        		$(".tr").remove();
				        		$("#adminagencyCode").removeAttr('id');
				        		$("#adminagencyName").removeAttr('id');						        		
	
				        	});
				        	
				        	
				        },
				        error : function(){
				            alert("검색어를 입력해주십시오");			            
				        }    
				    });
				});
			});
		});	
		
		$('.delete').click(function(){
			$(this).parents('div#deleteDiv').appendTo('#removeAdminagency');
			
			//$(this).parent().remove();
		});
		
		$('#updateAnnualfeePakage').click(function(){			
			$('#updateAnnualfeePakageForm').submit();
		});
		
	});
	
	</script>
	</head>
	
	
	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="height: 700px;">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="../module/leftAnnualfeePakage/leftAnnualfeePakage.jsp"/>
				</div>
				<div style="padding:50px;" class="col-sm-8">		

					<!-- Begin Content -->
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="text-center">연회비/패키지 수정</h3>
							<hr/>					
							<form id="updateAnnualfeePakageForm" action="${pageContext.request.contextPath}/updateAnnualfeePakage" method="post">
								<input hidden="hidden" name="annualfeePakageCode" value="${returnAnnualfeePakageDto.annualfeePakageCode}"><!-- 연회비패키지코드 -->
								<div>
									<label for="functionaryId" class="col-sm-2 control-label">등록자id</label>
									<div class="col-sm-10">					
										<input type="text" class="form-control" id="functionaryId" name="functionaryId" value="${returnAnnualfeePakageDto.functionaryId}">					
									</div>
								</div>
								<br><br>
								<div>
									<label for="annualfeePakageName" class="col-sm-2 control-label">연회비패키지명</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="annualfeePakageName" name="annualfeePakageName" value="${returnAnnualfeePakageDto.annualfeePakageName}">	
									</div>
								</div>
								<br><br>
								<div>
									<label for="annualfeePakagePrice" class="col-sm-2 control-label">연회비패키지가격</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="annualfeePakagePrice" name="annualfeePakagePrice" value="${returnAnnualfeePakageDto.annualfeePakagePrice}">	
									</div>
								</div>
								<br><br>
								<div>
									<label for="annualfeePakageTextSangse" class="col-sm-2 control-label">상세내용</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="annualfeePakageTextSangse" name="annualfeePakageTextSangse" value="${returnAnnualfeePakageDto.annualfeePakageTextSangse}">				
									</div>
								</div>
								<br><br>
								<div>
									<label for="annualfeePakageDiscountRate" class="col-sm-2 control-label">할인률</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="annualfeePakageDiscountRate" name="annualfeePakageDiscountRate" value="${returnAnnualfeePakageDto.annualfeePakageDiscountRate}">			
									</div>
								</div>
								<br><br>		
								<div id="addAdminagency">
										<!-- <label for="inputEmail3" class="col-sm-2 control-label">행정기관명</label>	 -->							
										<!-- <div class="col-sm-10" id="addAdminagency">	 -->								
								</div>
															
								<div hidden="hidden" id="removeAdminagency">
								
								</div>
																
							</form>
							<br>			
							<div>						
								<c:forEach var="annualfeePakageAuthority" items="${returnAnnualfeePakageDto.annualfeePakageAuthority}">	
									<div id="deleteDiv">								
										<label for="adminagencyName" class="col-sm-2 control-label">현재 행정기관명</label>								
										<div class="col-sm-10 input-group">		
											<input type="text" class="form-control" name="adminagencyName"	value= "${annualfeePakageAuthority.adminagencyName}" readonly="readonly">		
											<input hidden="hidden" name="annualfeePakageAuthorityCode" value="${annualfeePakageAuthority.annualfeePakageAuthorityCode}">
											<span class="input-group-btn">
												<button class="delete btn btn-primary" id="delete" type="button">삭제</button>
											</span>
										</div>																
									</div>								
								</c:forEach>								
							</div>
						</div>
					
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
					
					<div class="text-center">
						<button type="button" id="adminagencyAdd" class="btn btn-danger">행정기관추가</button>
						<button id="updateAnnualfeePakage" type="button" class="btn btn-primary">수정</button>
					</div>
					<!-- End Content -->					
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>			
	</body>
</html>