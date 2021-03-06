<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">		
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<title>Insert title here</title>
		<script type="text/javascript">
		$(document).ready(function(){
			
			/* 유효성 검사 단하나도 안됨 */
			
			/* $('#myModalclick').click('show.bs.modal', function (event) {
				  var button = $(event.relatedTarget) // Button that triggered the modal
				  var recipient = button.data('whatever') // Extract info from data-* attributes
				  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
				  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
				  var modal = $(this)
				  modal.find('.modal-title').text('New message to ' + recipient)
				  modal.find('.modal-body input').val(recipient)
			}) */
			
			/* $('#myModal').on('shown.bs.modal', function () {
				  $('#myInput').focus()
				}) */
			
			
			
			$('#adminagencyAdd').click(function(){
				$('#addAdminagency').append('<div class="input-group">'
						+'<input type="hidden" class="form-control" id="adminagencyCode" name="adminagencyCode" placeholder="적용되는 행정기관코드">'
						+'<input type="text" class="form-control" id="adminagencyName" name="adminagencyName" placeholder="적용되는 행정기관명" readonly="readonly">'
						+'<span class="input-group-btn">'
						+'<button type="button" id="myModalclick" class="btn btn-primary" data-toggle="modal" data-target="#adminagencyCheckModal">행정기관찾기</button>'
						+'<button type="button" id="del" class="btn btn-danger">삭제</button>'
						+'</span>'
						+'</div>');
								
				$(document).on('click','#del',function(){
					$(this).closest('div').remove();
				});
				/* $('#myModalclick').click(function() {
					alert('츄라이');
					
					$('#adminagencyCheckModal').modal('toggle');
					$('#adminagencyCheckModal').modal('show');
				}); */
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
			/* $('#adminagencyCode').val($(this).children().first().text());
    		$('#adminagencyName').val($(this).children().last().text());	 */		
			/* $('#adminagencyCheckModal').on('hidden.bs.modal', function () {
			$('#checkAdminagency').val("");
			$(".tr").remove();
			$(this).removeData('bs.modal');
			
			$(this).parentsUnitl('#addAdminagency').children('#adminagencyCode').val($(this).children().first().text());
			$(this).parentsUnitl('#addAdminagency').children('#adminagencyName').val($(this).children().last().text());		
			*/
			
			/* 클릭했을시에 modal이 나오게 만든 버튼이 속해있는 div에 값을 채워넣어야한다 */
			/* $('.tr').click(function(){
        		alert('행정기관등록 완료');
        		$('#adminagencyCheckModal').hide();
        		$('#myModalclick').pa$('#adminagencyCode').val($(this).children().first().text());
        		$('#adminagencyName').val($(this).children().last().text());
			}); */
			
			
			
			
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
							<h3 class="text-center">연회비/패키지 등록</h3>
							<hr/>				
							<form class="form-horizontal" action="${pageContext.request.contextPath}/insertAnnualfeePakage" id="insertannualfeePakageForm" method="post">
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">패키지/연회비 명</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="annualfeePakageName" name="annualfeePakageName" placeholder="패키지/연회비 명">							
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-2 control-label">연회비 구입금액</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="annualfeePakagePrice" name="annualfeePakagePrice" placeholder="연회비 구입금액">
									</div>
								</div>					
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">상세설명</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="annualfeePakageTextSangse" name="annualfeePakageTextSangse" placeholder="패키지/연회비 상세설명">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">할인율%</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="annualfeePakageDiscountRate" name="annualfeePakageDiscountRate" placeholder="할인율%">
									</div>
								</div>
								
								<!-- 적용되는 행정기관코드 -->
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">적용되는 행정기관코드</label>								
									<div class="col-sm-10" id="addAdminagency">							
																	
										<!-- <div class="col-sm-10">
											<input type="hidden" class="form-control" id="adminagencyCode" name="adminagencyCode" placeholder="적용되는 행정기관코드">
											<input type="text" class="form-control" id="adminagencyName" name="adminagencyName" placeholder="적용되는 행정기관명" readonly="readonly">
											<button type="button" id="myModalclick" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#adminagencyCheckModal">행정기관찾기</button>
										</div> -->
										
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
								</div>			
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label"></label>
									<div style="float : left">								
										<button type="button" id="adminagencyAdd" class="btn btn-default">행정기관추가</button>														
									</div>	
								</div>
								<div class="text-center">
									<button type="submit" id="btn" class="btn btn-primary">등록</button>								
								</div>
							</form>
						<!-- End Content -->
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<jsp:include page="../module/bottom/bottomContent.jsp"/>
	</body>
</html>