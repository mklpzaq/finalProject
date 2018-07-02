<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Insert title here</title>
		<!-- 다음 주소 API Script -->
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		<!-- 다음 주소 API -->
		/* 보내는 사람주소 */
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
		            }
		        }).open();
		    }
		    /* 받는 사람 주소  */
		    function sample7_execDaumPostcode() {
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
		                document.getElementById('sample7_postcode').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('sample7_address').value = fullAddr; //도로명주소
		
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById('sample7_address2').focus(); //상세주소
	
		                // 지번주소(구주소) 정보를 해당 필드에 넣는다.
		                document.getElementById('sido2').value = data.sido; //시도
		                document.getElementById('sigungu2').value = data.sigungu; //시군구
		                document.getElementById('bname2').value = data.bname; //읍면동
		                document.getElementById('sample7_address').value = fullAddr; //상세주소
		            }
		        }).open();
		    }
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
				</div>
				<div style="padding:15px;" class="col-sm-8">
				
					<!-- Begin Content -->					
						<div class="panel panel-default">
							<div class="panel-body text-center">
							<h3 class="text-center">배달반납 주소지수정</h3>
							<hr/>							
							<form id="insertDistrict" class="form-horizontal" action="${pageContext.request.contextPath}/updateDeliveryOrderCitizenAddress" method="post">
								<input hidden="hidden" name="deliveryOrderCitizenCode" value="${returndeliveryOrderCitizenDto.deliveryOrderCitizenCode}">								
								<div>
									<div class="form-group">
										<label for="sample6_postcode" class="col-sm-4 control-label">보내는 사람 도로명주소</label>
										<div class="col-sm-8">
											<input type="text" style="float:left" id="sample6_postcode" placeholder="우편번호">
											<input type="button" style="float:left" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										</div>
									</div>
									<div class="form-group">
										<label for="sample6_address" class="col-sm-4 control-label">도로명주소로 찾으면 지번으로 입력됩니다</label>
										<div class="col-sm-8">
											<input type="text" style="float:left" size="40" id="sample6_address" placeholder="도로명주소">
										</div>
									</div>
									<div class="form-group">
										<label for="jibunAddress" class="col-sm-4 control-label">입력된 보내는 사람 주소</label>
										<div class="col-sm-8">
											<input type="text" style="float:left" size="10" id="sido" name="sidoName" value="${returndeliveryOrderCitizenDto.receiveAddressSigungu}">
											<input type="text" style="float:left" size="10" id="sigungu" name="sendAddressSigungu" value="${returndeliveryOrderCitizenDto.sendAddressSigungu}">
											<input type="text" style="float:left" size="10" id="bname" name="sendAddressEupmyeon" value="${returndeliveryOrderCitizenDto.sendAddressEupmyeon}">
											<input type="text" style="float:left" size="30" id="sample6_address2" name="sendAddressSangse" value="${returndeliveryOrderCitizenDto.sendAddressSangse}">
										</div>
									</div>
									<br>										
								</div>
												
								<div hidden="hidden">
									<div class="form-group">
										<label for="sample6_postcode" class="col-sm-4 control-label">받는 사람 도로명주소</label>
										<div class="col-sm-8">
											<input type="text" style="float:left" id="sample7_postcode" placeholder="우편번호">
											<input type="button" style="float:left" onclick="sample7_execDaumPostcode()" value="우편번호 찾기">
										</div>
									</div>
									<div class="form-group">
										<label for="sample6_address" class="col-sm-4 control-label">도로명주소로 찾으면 지번으로 입력됩니다</label>
										<div class="col-sm-8">
											<input type="text" style="float:left" size="40" id="sample7_address" placeholder="도로명주소">
										</div>
									</div>
									<div class="form-group">
										<label for="jibunAddress" class="col-sm-4 control-label">입력된 받는 사람 주소</label>
										<div class="col-sm-8">
											<input type="text" style="float:left" size="10" id="sido2" name="sidoName" value="${returndeliveryOrderCitizenDto.receiveAddressSigungu}">
											<input type="text" style="float:left" size="10" id="sigungu2" name="receiveAddressSigungu" value="${returndeliveryOrderCitizenDto.receiveAddressSigungu}">
											<input type="text" style="float:left" size="10" id="bname2" name="receiveAddressEupmyeon" value="${returndeliveryOrderCitizenDto.receiveAddressEupmyeon}">
											<input type="text" style="float:left" size="30" id="sample7_address2" name="receiveAddressSangse" value="${returndeliveryOrderCitizenDto.receiveAddressSangse}">
										</div>
									</div>
									<br>									
								</div>
											
								<div class="form-group">
									<div class="col-sm-12">
										<button type="submit" id="insertButton" class="btn btn-default">수정하기</button>
									</div>
								</div>
							</form>
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