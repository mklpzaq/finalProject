<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	<title>배달신청</title>
</head>
<!-- 배달 반납신청form만 만든다고 가정한다
	대여기능이 아직 구현되지 않았음으로 대여기능이 구현됐다고 가정하고 만든다
	반납신청 이전 화면을 구성해본다
	1. 시민으로 로그인
	2. 대여신청
	3. 자신이 대여한 목록 조회
	4. 대여한 물품중에서 특정 물품을 골라 배달반납신청
	이후 배달신청form으로 온다고 가정한다 
	시설/물품 대여/예약 관리코드(FK)가 있다고 가정
	행정기관코드(FK)와	
	시설/물품개별관리코드(FK)는 
	시설/물품 대여/예약 관리코드(FK)로 가져온다고 가정한다
	대여/반납상태 구분은 반납신청contorller에서는 '반납'을
	대여신청contorller에서는 '대여'를 model에 담아 넘겨주는 것으로 처리한다
	아이디는 session으로 가져온다
	-->

	<body>
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/views/module/top/navbar.jsp"/>
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<%-- <jsp:include page="./module/left/leftnavi.jsp"/> --%>
				</div>
				<div class="col-sm-8">
					<!-- Begin Content -->
					<div class="text-center">
						<h1>배달신청등록</h1>
					</div>
						<div class="panel panel-default">
							<div class="panel-body text-center">
								<form id="insertDistrict" class="form-horizontal" action="${pageContext.request.contextPath}/insertDeliveryOrderCitizen" method="post">
									<div class="form-group">
										<label for="goodsfacilityRentalCode" class="col-sm-3 control-label">시설/물품 대여/예약 신청코드</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="goodsfacilityRentalCode" id="goodsfacilityRentalCode" placeholder="행정기관 코드를 입력해주세요.">
										</div>
									</div>
									<div class="form-group">
										<label for="classifyRentalState" class="col-sm-3 control-label">대여/반납상태 구분</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="classifyRentalState" id="classifyRentalState" placeholder="(대여/반납) 상태를 입력해주세요.">
										</div>
									</div>
									<div class="form-group">
										<label for="goodsfacilityCode" class="col-sm-3 control-label">시설/물품 개별관리코드</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="goodsfacilityCode" id="goodsfacilityCode" placeholder="(대여/반납) 상태를 입력해주세요.">
										</div>
									</div>
									<!-- session처리 이후에 가져오면 됨 <div class="form-group">
										<label for="citizenId" class="col-sm-3 control-label">시민ID</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="citizenId" id="citizenId" placeholder="(대여/반납) 상태를 입력해주세요.">
										</div>
									</div> -->
									<div class="form-group">
										<label for="adminagencyCode" class="col-sm-3 control-label">행정기관코드</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="adminagencyCode" id="adminagencyCode" placeholder="행정기관 코드를 입력해주세요.">
										</div>
									</div>
																
									
									<div>
										<div class="form-group">
											<label for="sample6_postcode" class="col-sm-4 control-label">보내는 사람 도로명주소</label>
											<div class="col-sm-8">
												<input type="text" style="float:left" id="sample6_postcode" placeholder="우편번호">
												<input type="button" style="float:left" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
											</div>
										</div>
										<div class="form-group">
											<label for="sample6_address" class="col-sm-4 control-label"></label>
											<div class="col-sm-8">
												<input type="text" style="float:left" size="40" id="sample6_address" placeholder="도로명주소">
											</div>
										</div>
										<div class="form-group">
											<label for="jibunAddress" class="col-sm-4 control-label">지번주소</label>
											<div class="col-sm-8">
												<input type="text" style="float:left" size="10" id="sido" name="sidoName" placeholder="시도">
												<input type="text" style="float:left" size="10" id="sigungu" name="sendAddressSigungu" placeholder="시군구">
												<input type="text" style="float:left" size="10" id="bname" name="sendAddressEupmyeon" placeholder="읍면동">
												<input type="text" style="float:left" size="30" id="sample6_address2" name="sendAddressSangse" placeholder="상세주소">
											</div>
										</div>
										<br>										
									</div>
									
									<div>
										<div class="form-group">
											<label for="sample6_postcode" class="col-sm-4 control-label">받는 사람 도로명주소</label>
											<div class="col-sm-8">
												<input type="text" style="float:left" id="sample7_postcode" placeholder="우편번호">
												<input type="button" style="float:left" onclick="sample7_execDaumPostcode()" value="우편번호 찾기">
											</div>
										</div>
										<div class="form-group">
											<label for="sample6_address" class="col-sm-4 control-label"></label>
											<div class="col-sm-8">
												<input type="text" style="float:left" size="40" id="sample7_address" placeholder="도로명주소">
											</div>
										</div>
										<div class="form-group">
											<label for="jibunAddress" class="col-sm-4 control-label">지번주소</label>
											<div class="col-sm-8">
												<input type="text" style="float:left" size="10" id="sido2" name="sidoName" placeholder="시도">
												<input type="text" style="float:left" size="10" id="sigungu2" name="receiveAddressSigungu" placeholder="시군구">
												<input type="text" style="float:left" size="10" id="bname2" name="receiveAddressEupmyeon" placeholder="읍면동">
												<input type="text" style="float:left" size="30" id="sample7_address2" name="receiveAddressSangse" placeholder="상세주소">
											</div>
										</div>
										<br>									
									</div>
									
									<div class="form-group">
										<div class="col-sm-12">
											<button type="submit" id="insertButton" class="btn btn-default">등록하기</button>
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