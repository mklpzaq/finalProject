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
			$('#addAdminagency').append('<div class="col-sm-10">'
					+'<input type="hidden" class="form-control" id="adminagencyCode" name="adminagencyCode" placeholder="적용되는 행정기관코드">'
					+'<input type="text" class="form-control" id="adminagencyName" name="adminagencyName" placeholder="적용되는 행정기관명" readonly="readonly">'
					+'<button type="button" id="myModalclick" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#adminagencyCheckModal">행정기관찾기</button>'
					+'<button type="button" id="del" class="btn btn-primary btn-lg">삭제</button>'
					+'</div>');
			
			$(document).on('click','#del',function(){
				$(this).closest('div').remove();
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
				                str += '</TR>';
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
			$(this).parent().appendTo('#removeAdminagency');
			
			//$(this).parent().remove();
		});
		
	});
	
	</script>
	</head>
	
	
	<body>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding: 15px">
					<jsp:include page="../module/left/leftnavi.jsp"/>
				</div>
				<div class="col-sm-8">				
					<div class="text-center">
						<h1>연회비/패키지조회</h1>
						<h2>Nation Integrated Reserve and Rental System</h2>
						<p>The time on the server is ${serverTime}.</p>
					</div>
					
					<div>
						<form action="${pageContext.request.contextPath}/updateAnnualfeePakage" method="post">
							<input hidden="hidden" name="annualfeePakageCode" value="${returnAnnualfeePakageDto.annualfeePakageCode}"><!-- 연회비패키지코드 -->
							<div>연회비패키지명 : <input name="annualfeePakageName" value="${returnAnnualfeePakageDto.annualfeePakageName}"></div>
							<div>연회비패키지가격 : <input name="annualfeePakagePrice" value="${returnAnnualfeePakageDto.annualfeePakagePrice}"> </div>
							<div><textarea name="annualfeePakageTextSangse" rows="" cols="">${returnAnnualfeePakageDto.annualfeePakageTextSangse}</textarea></div>
							<div>연회비패키지 할인률 : <input name="annualfeePakageDiscountRate" value="${returnAnnualfeePakageDto.annualfeePakageDiscountRate}"></div>
							<div>
								<!-- 삭제버튼 클릭시 삭제버튼의 부모태그에 속한 value값들을 복사해서 hidden으로 숨겨놓고 해당 태그는 remove -->
								<c:forEach var="annualfeePakageAuthority" items="${returnAnnualfeePakageDto.annualfeePakageAuthority}">
									<div id="deleteAnnualfeePakageAuthority">
										<input name="annualfeePakageAuthorityCode" value="${annualfeePakageAuthority.annualfeePakageAuthorityCode}" readonly="readonly">
										<input value="${annualfeePakageAuthority.adminagencyCode}" readonly="readonly">
										<button class="delete" type="button">삭제</button>
									</div>
								</c:forEach>
							</div>		
							<div id="addAdminagency">
								
							</div>
							<div hidden="hidden" id="removeAdminagency">
							
							</div>							
							<button type="submit">수정</button>										
						</form>						
						<div>
							<button type="button" id="adminagencyAdd" class="btn btn-primary btn-lg">행정기관추가</button>
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
					
				</div>		
			</div>
		</div>		
	</body>
</html>