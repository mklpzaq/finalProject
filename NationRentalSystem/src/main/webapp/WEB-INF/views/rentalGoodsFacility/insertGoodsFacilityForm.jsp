<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<title>Insert Goods and Facility</title>
	<!-- 다음 주소 API Script -->
		<script>
		$(document).ready(function(){
			/* 첫 화면에서도 바로 적요되게 ajax를 이벤트 발생전에도 실행되게 하였다. */
			/* $.ajax({
				type: "POST"
				,url: "/nationRental/selectOneGoodsFacilityForAjax"
				,data: { goodsfacilityThreeName: $('#goodsfacilityThreeName > option:selected').val() }
				,success:function( JSON ) { // result : String, XML, JSON
					$('#goodsfacilityThreeCode').val(JSON.goodsfacilityThreeCode);
					$('#goodsfacilityThreeName').val(JSON.goodsfacilityThreeName);					
				}
			}); */
			
			$('#selectGoodsfacilityThreeName').change(function() {
				$.ajax({
					type: "POST"
					,url: "${pageContext.request.contextPath}/selectOneGoodsFacilityForAjax"
					,data: { goodsfacilityThreeName: $('#selectGoodsfacilityThreeName > option:selected').val() }
					,success:function( JSON ) { // result : String, XML, JSON						
						$('#goodsfacilityThreeCode').val(JSON.goodsfacilityThreeCode);
						$('#goodsfacilityThreeName').val(JSON.goodsfacilityThreeName);						
					}
				});
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
				<div class="panel panel-default">
					<div class="panel-body">
						<h2> 시설 & 물품 등록 </h2>
						<hr/>
						<!-- ========== -->
						<%-- <div class="panel panel-default">
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
					</div> --%>
						
						
						<!-- ========== -->			
						<form action="${pageContext.request.contextPath}/insertGoodsFacility" method="post" enctype="multipart/form-data">						
						
						<div class="form-group">
								<label for="goodsfacility" class="col-sm-2 control-label">시설 물품 카테고리 이름</label>
						    <div class="col-sm-10">						    	
						    <select id="selectGoodsfacilityThreeName" class="form-control">
									<c:forEach var="goodsfacility" items="${list}"> 					
										 <option value="${goodsfacility.goodsfacilityThreeName}">${goodsfacility.goodsfacilityThreeName}</option>										
									</c:forEach>
								</select>		    		    	
						    </div>
						</div>
						<div class="form-group">
							<label for="goodsfacilityThreeCode" class="col-sm-2 control-label">시설 물품 카테고리 코드</label>
						    <div class="col-sm-10">
						    	<input type="text" class="form-control" id="goodsfacilityThreeCode" name="goodsfacilityThreeCode" placeholder="시설 물품 카테고리 코드">			    	
						    </div>
						</div>
						<div class="form-group">
							<label for="goodsfacilityThreeName" class="col-sm-2 control-label">시설 물품 카테고리 이름</label>
						    <div class="col-sm-10">
						    	<input type="text" class="form-control" id="goodsfacilityThreeName"  placeholder="시설 물품 카테고리 이름">			    	
						    </div>
						</div>
						
						<div class="form-group">
							<label for="goodsfacility" class="col-sm-2 control-label">시설 & 물품 구분</label>
						    <div class="col-sm-10">
						    	<input type="text" class="form-control" id="goodsfacilityClassifyGoodsfacility" name="goodsfacilityClassifyGoodsfacility" placeholder="시설 & 물품 구분">			    	
						    </div>
						</div>
												
						<div class="form-group">
							<label for="goodsfacility" class="col-sm-2 control-label">시설 & 물품 이름</label>
						    <div class="col-sm-10">
						    	<input type="text" class="form-control" id="goodsfacilityName" name="goodsfacilityName" placeholder="시설 & 물품 이름">			    	
						    </div>
						</div>
						
						<div class="form-group">
							<label for="goodsfacility" class="col-sm-2 control-label">시설 & 물품 파일 업로드</label>
						    <div class="col-sm-10">
						    	<input type="file" class="form-control" id="goodsfacilityfile" name="multipartfile">			    	
						    </div>
						</div>					
						
						<div class="form-group">
							<label for="goodsfacility" class="col-sm-2 control-label">시설 & 물품 금액</label>
						    <div class="col-sm-10">
						    	<input type="text" class="form-control" id="goodsfacilityPurchaseprice" name="goodsfacilityPurchaseprice" placeholder="시설 & 물품 금액">			    	
						    </div>
						</div>						
						
						<div class="form-group">
							<label for="goodsfacility" class="col-sm-2 control-label">대여 & 대관료 </label>
						    <div class="col-sm-10">
						    	<input type="text" class="form-control" id="goodsfacilityPriceRental" name="goodsfacilityPriceRental" placeholder="시설 & 물품 금액">			    	
						    </div>
						</div>
						
						<div class="form-group">
							<label for="goodsfacility" class="col-sm-2 control-label">상세내용</label>
							<div class="col-sm-10">	
								<textarea class="form-control" rows="3" id="goodsfacilityTextSangse" name="goodsfacilityTextSangse"></textarea>
							</div>							   
						</div>
						
						<div class="form-group">
								<label for="goodsfacility" class="col-sm-2 control-label">행정 관리 기관코드</label>
						    <div class="col-sm-10">
						    	<input type="text" class="form-control" id="adminagencyCode" name="adminagencyCode" value="${functionaryDto.adminagencyCode}" readonly>	    		    	
						    </div>
						</div>
											
						<div class="form-group">
								<label for="goodsfacility" class="col-sm-2 control-label">시설 위치 시도</label>
						    <div class="col-sm-10">
						    	<input type="text" class="form-control" id="sidoName" name="sidoName" value="${functionaryDto.sidoName}" readonly>	    		    	
						    </div>
						</div>
						
						<div class="form-group">
								<label for="goodsfacility" class="col-sm-2 control-label">시설 위치 시군구</label>
						    <div class="col-sm-10">
						    	<input type="text" class="form-control" id="sigunguName" name="sigunguName" value="${functionaryDto.sigunguName}" readonly>	    		    	
						    </div>
						</div>								
						
						<div class="form-group">
								<label for="goodsfacility" class="col-sm-2 control-label">시설 위치 읍면동</label>
						    <div class="col-sm-10">
						    	<input type="text" class="form-control" id="eupmyeonName" name="eupmyeonName" value="${functionaryDto.eupmyeonName}" readonly>	    		    	
						    </div>
						</div>					
						
						<div class="form-group">
						<label for="goodsfacility" class="col-sm-2 control-label">상세 주소</label>
						    <div class="col-sm-10">
						    	<input type="text" class="form-control" id="goodsfacilityAddressSangse" name="goodsfacilityAddressSangse" value="${functionaryDto.adminagencyAddressSangse}" readonly>
						    </div>
						</div>
						
						<div class="form-group">
						<label for="goodsfacility" class="col-sm-2 control-label">등록 공무원 ID</label>
						    <div class="col-sm-10">
						    	<input type="text" class="form-control" id="functionaryId" name="functionaryId" value="${functionaryDto.functionaryId}" readonly>
						    </div>
						</div>	
						
						<div class="form-group">								
						    <div class="col-sm-10">
						    <label for="goodsfacility" class="col-sm-2 control-label">기부 & 구입여부</label>
						    	<select class="form-control" name="goodsfacilityClassifyDonationpurchase">													
									<option>기부</option>
									<option>구입</option>									
								</select>		    		    	
						    </div>
						</div>				
						
						<div class="form-group">						
						 	<div class="col-sm-10">
						 	<label class="checkbox-inline" class="col-sm-2 control-label" >예비 & 대여 </label>
						 		<select class="form-control" name="goodsfacilityIsExtra">													
									<option>예비</option>
									<option>대여</option>									
								</select>		    	
							</div>
						</div>
						
						<div class="form-group">								
						    <div class="col-sm-10">
						    <label for="goodsfacility" class="col-sm-2 control-label">배달가능여부</label>	
						    	<select class="form-control" name="goodsfacilityIsPossibleDelivery">
									<option>Y</option>
									<option>N</option>		
								</select>		    		    	
						    </div>
						</div>												
						
						<div class="form-group">								
						    <div class="col-sm-10">
						    <label for="goodsfacility" class="col-sm-2 control-label">현제 AS 상태</label>						    	
								<div class="col-sm-10">
						    		<input type="text" class="form-control" id="goodsfacilityStateAfterservice" name="goodsfacilityStateAfterservice" value="일반" readonly>
					    		</div>										    	
						    </div>
						</div>
						
						<div class="form-group">								
						    <div class="col-sm-10">
						    <label for="goodsfacility" class="col-sm-2 control-label">대여 가능 여부</label>
						    	<select class="form-control" name="goodsfacilityIsPossibleRental">
									<option>Y</option>
									<option>N</option>
								</select>		    		    	
						    </div>
						</div>
						
						<div class="form-group">
							 <div class="col-sm-10">	
								<button type="submit" id="insertGoodsfacility">물품 & 시설 등록</button>	
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