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
		function payment_OnOff(v,id){
			//라디오 버튼 value 값 조건 비교
			//결제수단 : 카드/계좌이체/무통장 입금 라디오 선택
			if(v == "creditCard"){
				document.getElementById('selectCard').style.display = ""; // 보여줌
				document.getElementById('selectAccount').style.display = "none"; //숨김
				document.getElementById('selectCash').style.display = "none";  //숨김 
			}else if(v == "account"){
				document.getElementById('selectCard').style.display = "none";
				document.getElementById('selectAccount').style.display = "";
				document.getElementById('selectCash').style.display = "none";
			}else if(v == "cash"){
				document.getElementById('selectCard').style.display = "none";
				document.getElementById('selectAccount').style.display = "none";
				document.getElementById('selectCash').style.display = "";
			}
		}
			//결제수단 : 계좌이체 현금영수증 라디오 선택
		function cashReceipt1_OnOff(v,id){
			if(v == "yes"){
				document.getElementById('cashReceiptYes1').style.display = "";
				document.getElementById('cashReceiptNo1').style.display = "none";
			}else if(v == "no"){
				document.getElementById('cashReceiptYes1').style.display = "none";
				document.getElementById('cashReceiptNo1').style.display = "";
			}
		}
		//결제수단 : 무통장 입금 현금영수증 라디오 선택
		function cashReceipt2_OnOff(v,id){
			if(v == "yes"){
				document.getElementById('cashReceiptYes2').style.display = ""; 
				document.getElementById('cashReceiptNo2').style.display = "none";
			}else if(v == "no"){
				document.getElementById('cashReceiptYes2').style.display = "none";
				document.getElementById('cashReceiptNo2').style.display = "";
			}
		}
		//배송료 입력해주기
		
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
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
				</div>
				<div class="col-sm-8"><br>
					<form id="insertRentalTotalPayment" class="form-horizontal" action="${pageContext.request.contextPath}/insertRentalTotalPayment" method="post">
						<!-- Begin Content(1 대여예약신청정보) -->
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
											<td></td>
											<td width="20%">상품코드</td>
											<td width="50%">상품이름</td>
											<td width="15%">대여/대관 금액</td>
											<td width="15%">배송선택</td>								
										</tr>
									</thead>
									<tbody>	
										<tr>
											<td>
												<input type="hidden" name="goodsfacilityRentalCode" value="${result.goodsfacilityCode}">
												<input type="hidden" name="goodsfacilityName" value="${result.goodsfacilityName}">
												<input type="hidden" name="citizenId" value="${result.citizenId}">
												<input type="hidden" name="citizenName" value="${result.citizenName}">
												<input type="hidden" name="goodsfacilityRentalIsOrderedDelivery" value="${result.goodsfacilityRentalIsOrderedDelivery}">
												<input type="hidden" name="goodsfacilityPriceRental" value="${result.goodsfacilityPriceRental}">												
											</td>
											<td>${result.goodsfacilityCode}</td>
											<td>${result.goodsfacilityName}</td>
											<td>${result.goodsfacilityPriceRental}</td>
											<td>${result.goodsfacilityRentalIsOrderedDelivery}</td>																					
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="5" style="text-align:right">
												가격
												<strong>${result.goodsfacilityPriceRental}</strong>
												+ 배송비 
												<input type="hidden" name="deliveryPrice" value="${result.goodsfacilityRentalIsOrderedDelivery}">
												<strong>${result.goodsfacilityRentalIsOrderedDelivery}</strong>
												= 합계 : 
												<input type="hidden" name="rentalTotalPayment" value="${result.goodsfacilityPriceRental+result.goodsfacilityRentalIsOrderedDelivery}">
												<strong class="total">${result.goodsfacilityPriceRental+result.goodsfacilityRentalIsOrderedDelivery}</strong>
												원
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
						<!-- End Content(1) -->
						<!-- Begin Content(2 할인정보) -->
					<!-- 	<div class="panel panel-default">
							<div class="panel-body text-center">
								<div class="row">
									<div style="text-align: center">
										<h3>할인정보</h3>
									</div>
								</div>
								<hr/>
								<p style="text-align: center">패키지/연회비 : 
									<input type="text" name="annualfeePakage">
									<button type="button" id="myModalclick" class="btn" data-toggle="modal" data-target="#annualfeePakageCheckModal">선택</button>
								</p>	
								<p style="text-align: center">사용할 포인트 : 
									<input type="text" name="usePoint" value="">
									보유 포인트 :
								</p>
							</div>
						</div> -->
						<!-- End Content(2) -->
						<!-- Begin Content(3 결제정보) -->
						<div class="panel panel-default">
							<div class="panel-body text-center">
								<div class="row">
									<div style="text-align: center">
										<h3>결제 수단</h3>
									</div>
								</div>
								<hr/>
									
									<input type="radio" name="payment" value="creditCard" onclick="payment_OnOff(this.value,'selectCard');">신용카드 &nbsp &nbsp
									<input type="radio" name="payment" value="account" onclick="payment_OnOff(this.value,'selectAccount');">실시간 계좌이체 &nbsp &nbsp
									<input type="radio" name="payment"  value="cash" onclick="payment_OnOff(this.value,'selectCash');">무통장 입금
									<br><br>

									<!-- 신용카드 선택 -->
									<div id="selectCard" style="display:none;">
										카드 선택 : 
											<select name="cardType">
												<option value="hyundai">현대</option>
												<option value="kbstar">국민</option>
												<option value="sinhan">신한</option>
												<option value="lotte">롯데</option>
											</select>
									</div>
									
									<!-- 실시간 계좌이체 선택 -->
									<div id="selectAccount" style="display:none;">
										예금주 명 : 
											<input type="text" name="memberName"><br>
										현금영수증 :
											<input type="radio" name="cashReceipt " value="yes" onclick="cashReceipt1_OnOff(this.value,'cashReceiptYes1');">신청 &nbsp &nbsp
											<input type="radio" name="cashReceipt" value="no" onclick="cashReceipt1_OnOff(this.value,'cashReceiptNo1');">미신청 
										<!-- 현금영수증 신청 선택 -->
										<div id="cashReceiptYes1" style="display:none;">
											휴대폰번호 : <input type="text" name="accountNumber">
										</div>
										<div id="cashReceiptNo1" style="display:none;">
										</div>
									</div>
									
									<!-- 무통장 입금 선택 -->
									<div id="selectCash"style="display:none;">
										입금은행 :
											<select name="selectBank">
												<option value="bank1">농협 : 123-123456-12-123</option>
												<option value="bank2">우체국 : 789-7894-45-78945</option>
											</select>
											<br>
										환불계좌 : 
											<select name="selectBank2">
												<option value="bank1">NH농협</option>
												<option value="bank2">KB국민</option>
												<option value="bank3">신한</option>
												<option value="bank4">우리</option>
												<option value="bank5">하나</option>
												<option value="bank5">IBK기업</option>
												<option value="bank6">외환</option>
												<option value="bank7">SC제일</option>
												<option value="bank8">KEB산업</option>
												<option value="bank9">새마을</option>
												<option value="bank10">대구</option>
												<option value="bank11">광주</option>
												<option value="bank12">신협</option>
												<option value="bank13">전북</option>
												<option value="bank14">경남</option>
												<option value="bank15">부산</option>
												<option value="bank16">수협</option>
												<option value="bank17">제주</option>
												<option value="bank18">저축은행</option>
												<option value="bank19">카카오뱅크</option>
											</select>
											<input type="text" name="accountNumber">
											<br>
										현금영수증 :
											<input type="radio" name="cashReceipt " value="yes" onclick="cashReceipt2_OnOff(this.value,'cashReceiptYes2');">신청 &nbsp &nbsp
											<input type="radio" name="cashReceipt" value="no" onclick="cashReceipt2_OnOff(this.value,'cashReceiptNo2');">미신청 
											
										<!-- 현금영수증 신청 선택 -->
										<div id="cashReceiptYes2" style="display:none;">
											휴대폰번호 : <input type="text" name="accountNumber">
										</div>
										<div id="cashReceiptNo2" style="display:none;">
										</div>
									</div>
							
							</div>
						</div>
						<!-- End Content(3) -->
						<br>
						<div class="form-group">
							<div class="col-sm-12" style="text-align:center">
								<button type="submit" id="insertButton" class="btn btn-default">결제하기</button>
							</div>
						</div>
						
						
					<!-- Begin Modal -->
						<div class="modal fade" id="annualfeePakageCheckModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">보유하고 있는 패키지/연회비 쿠폰</h4>
						      </div>
						      <div class="modal-footer">
					      		<select id="annualfeePakageList" name="annualfeePakageList">
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
					</form>	
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/module/bottom/bottomContent.jsp"/>
	</body>
</html>


