<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>대여대관 결제하기</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">		
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>		
		<script type="text/javascript">
		
		
		$(document).ready(function(){
			$('#annualfeePakageCheckModal').on('shown.bs.modal', function () {
				  $('#myInput').focus()
				})
				
	/* 		$("#annualfeePakageList").chang(function(){
			    $.ajax({
			        type:"POST", //통신타입 get, post
			        url:"/nationRental/selectListFunctionary",  //요청할 url
			        data : { checkAdminagency : $('#checkAdminagency').val() },  //넘겨줄 값, 파라메터
			        success: function( list ){//데이터를 받아오는데 성공하면 이후에 할 행동				        
			        	var list = list;
			        	var str = '';
			        	$.each(list , function(i){
			        		str += '<TR class="tr">';
			                str += '<TD hidden="hidden">' + list[i].adminagencyCode + '</TD><TD><button type="button" id="modalAdminagencyName" class="modalAdminagencyName">' + list[i].adminagencyName + '</button></TD>';
			                str += '</TR>';
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
			    });
			});
			 */
			
	</script>
	
		
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
				</div>
				<div class="col-sm-8"><br>
					<!-- Begin Content(1) -->
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<div class="row">
								<div class="col-md-4">
									<h3>대여/대관 내역</h3>
								</div>
							</div>
							<hr/>
							<table class="table table-striped">
								<thead>
									<tr>
										<td width="20%">상품코드</td>
										<td width="50%">상품이름</td>
										<td width="15%">대여/대관 금액</td>
										<td width="15%">배송선택</td>								
									</tr>
								</thead>
								<tbody>	
									<tbody>
										<tr>
											<td>${rentGoodsfacilityDto.goodsfacilityCode}</td>
											<td>${rentGoodsfacilityDto.goodsfacilityName}</td>
											<td>${rentGoodsfacilityDto.goodsfacilityPriceRental}</td>
											<td>${rentGoodsfacilityDto.goodsfacilityRentalIsOrderedDelivery}</td>																					
										</tr>
									</tbody>
								</tbody>
							</table>
						</div>
					</div>
					<!-- End Content(1) -->
					<!-- Begin Content(2) -->
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<div class="row">
								<div class="col-md-2">
									<h3>할인정보</h3>
								</div>
							</div>
							<hr/>
							<p style="text-align: left">패키지/연회비 : 
								<input type="text" name="annualfeePakage">
								<button type="button" id="myModalclick" class="btn" data-toggle="modal" data-target="#annualfeePakageCheckModal">선택</button>
							</p>	
							<p style="text-align: left">사용할 포인트 : 
								<input type="text" name="usePoint">
								보유 포인트 :
							</p>
						</div>
					</div>
					<!-- End Content(2) -->
						<!-- Begin Content(3) -->
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<div class="row">
								<div class="col-md-2">
									<h3>결제정보</h3>
								</div>
							</div>
							<hr/>	
							<h4 style="text-align: left">[ 결제 할 금액 ]</h4>
							<p style="text-align: left">총 대여 금액 : </p>
							<p style="text-align: left">사용  포인트 : </p>
							<p style="text-align: left">배    송    비 : </p>
							<p style="text-align: left">총 결제 금액 : </p>
							<hr/>
							<h4 style="text-align: left">[ 결제 수단 선택 ]</h4>
							<form style="text-align: left">
								<input type="radio" name="creditCard" value="creditCard" checked>신용카드 &nbsp &nbsp
								<input type="radio" name="account" value="account ">실시간 계좌이체 &nbsp &nbsp
								<input type="radio" name="cash"  value="cash">무통장 입금
								<div id="creditCard" name="creditCard">
									카드 선택 : 
									<select name="cars">
										<option value="hyundai">현대</option>
										<option value="kbstar">국민</option>
										<option value="sinhan">신한</option>
										<option value="lotte">롯데</option>
									</select>
								</div>
								<div id="accountTransfer" name="accountTransfer">
									예금주 명 : <input type="text" name="accountName"><br>
									현금영수증 :
								</div>
							</form>
						</div>
					</div>
					<!-- End Content(3) -->
					<!-- Begin Modal -->
						<div class="modal fade" id="annualfeePakageCheckModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">보유하고 있는 패키지/연회비 쿠폰</h4>
						      </div>
						      <div class="modal-footer">
					      		<select id="annualfeePakageList" name="goodsfacilityOneCode">
									<option>보유 패키지/연회비 쿠폰</option>
									<c:forEach var="annualfeePakageDto" items="${list}">
										<option value="${annualfeePakageDto.annualfeePakageCode}">${annualfeePakageDto.annualfeePakageName}</option>
									</c:forEach>
								</select>        
						      </div>
						    </div>
						  </div>
						</div>
					<!-- End Modal -->
						
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>
	</body>
</html>


