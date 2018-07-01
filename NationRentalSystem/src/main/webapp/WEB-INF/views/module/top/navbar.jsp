<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>navbar</title>
		<script>
			$(document).ready(function(){
				/* $('#angkorTagController li').mouseenter(function(){
					$(this).css('background', '#000000');
					$(this).mouseleave(function(){
						$(this).css('background', '#005EAA');
					});
				}); */
				$('.backgroundColor').mouseenter(function(){
					$(this).css('background', '#000000');
					$(this).mouseleave(function(){
						$(this).css('background', '#005EAA');
					});
				});
			});
			
		
		
		</script>
	</head>
	<body>
		<!-- navbar가 위쪽에 고정됨에 따라 기존 컨텐츠가 navbar height만큼 가려지는것 해결하기 위해 navbarDiv에 navbar height만큼의 높이를 추가한다. script는 아래부분에 위치시켜놓음-->
		<div id="navbarDiv"></div>
		
		<!--  navbar-fixed-top -->
		<nav id="navbar" style="background-color:#005EAA; margin:0;" class="navbar navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="row">
					<!-- <div class="col-sm-2"> </div> -->
					<div id="angkorTagController" class="col-sm-12">
						<!-- Begin Content -->
			
						<div class="navbar-header">
							<a style="color:#FFFFFF" class="navbar-brand" href="${pageContext.request.contextPath}/">Home</a>
						</div>
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li class="backgroundColor">
									<!-- <span class="sr-only">(current)</span> -->
									<a style="color:#FFFFFF" href="${pageContext.request.contextPath}/viewImageGoodsFacility">대여 시설/물품</a>
								</li>
								<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListBoard">게시판</a></li>
								<li class="backgroundColor"><a style="color:#FFFFFF" href="#">통계</a></li>
								<li class="backgroundColor"><a style="color:#FFFFFF" href="#">시설정기점검 조회</a></li>
								<li class="backgroundColor"><a style="color:#FFFFFF" href="#">기부리스트 조회</a></li>
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<li>
									<div style="padding:15px;">
										<c:choose>
											<c:when test="${member != null}">
												<strong style="color:#FFFFFF">${member.memberId} 님 환영합니다. [ ${member.memberLevel} ]</strong>
											</c:when>
											<c:otherwise>
												<strong style="color:#FFFFFF">손님 환영합니다.</strong>
											</c:otherwise>
										</c:choose>
										
									</div>
								</li>
								<li class="">
									<a class="backgroundColor" style="color:#FFFFFF" href="${pageContext.request.contextPath}/goSignUp">회원가입</a>
								</li>
								<c:choose>
									<c:when test="${member != null}">
										<li class="">
											<a class="backgroundColor" style="color:#FFFFFF" href="${pageContext.request.contextPath}/logout">로그아웃</a>
										</li>
									</c:when>
									<c:otherwise>
										<%-- <li style="color:#FFFFFF" class="active"><a href="${pageContext.request.contextPath}/login">로그인</a></li> --%>
										<li class="backgroundColor">
											<a style="color:#FFFFFF" href="${pageContext.request.contextPath}/idSelect">id찾기</a>
										</li>
										<li class="backgroundColor">
											<a style="color:#FFFFFF" href="${pageContext.request.contextPath}/pwSelect">pw찾기</a>
										</li>								
										<li class="backgroundColor">
											<a style="color:#FFFFFF" href="${pageContext.request.contextPath}/login">로그인</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					
						<!-- Begin 권한별 메뉴 -->
						<c:choose>
							<c:when test="${member.memberLevel == '관리자'}">
						        <hr style="margin:0 0 5px 0;"/>
						        <div style="padding:0;" class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
						         <ul class="nav navbar-nav">
						          <!-- 관리자 메뉴 -->
						          <li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListAdministrator">관리자 회원관리</a></li>
						          <li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListDistrict">행정구역 관리</a></li>
						          <li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListAdminagency">행정기관 관리</a></li>
						          <li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListGoodsFacilityCategory">시설/물품 관리</a></li>
						          <li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListAgencyBusinesstype">업종분류 관리</a></li>
						          <li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/getCitizenList">시민계정 조회</a></li>
						          <li class="backgroundColor"><a style="color:#FFFFFF" href="#">물품 재고 파악</a></li> <!-- 시설/물품관리 하위로 들어가면 좋겠다고 생각합니다 -->
						          <li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/insertannualfeePakage">연회비/패키지</a></li>
						          <li class="backgroundColor"><a style="color:#FFFFFF" href="#">상벌관리</a></li>
						          <li class="backgroundColor"><a style="color:#FFFFFF" href="#">대여금지 설정</a></li>
						         </ul>
						        </div>
						       </c:when>
							<c:when test="${member.memberLevel == '공무원'}">
								<hr style="margin:0 0 5px 0;"/>
								<div style="padding:0;" class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
									<ul class="nav navbar-nav">
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/viewFunctionaryInfo?functionaryId=${member.memberId}">공무원 회원관리</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListContractAgency">대행업체 관리</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/approvalListDonation">기부관리</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/insertGoodsFacility?functionaryId=${member.memberId}">물품/시설 관리</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectGoodsFacilityList?functionaryId=${member.memberId}">물품/시설 리스트</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="#">물품/시설 대여/예약 승인</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListRentalTotalPayment">결제/환불 목록</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/insertReturnGoodsfacilityInfoForm?adminagencyCode=${member.adminagencyCode}">물품/시설반납</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListDeliveryOrderCitizen?adminagencyCode=${member.adminagencyCode}">물품 배달 신청 확인</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListReturnGoodsfacilityInfoForAfterService?functionaryId=${member.memberId}&adminagencyCode=${member.adminagencyCode}">통합 AS 의뢰</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="#">시설 정기점검</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="#">물품 재고 등록</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/insertAnnualfeePakage">연회비/패키지 등록</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListAnnualfeePakage">연회비/패키지 조회</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="#">상벌관리</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="#">대여금지</a></li>
									</ul>
								</div>
							</c:when>
							<c:when test="${member.memberLevel == '직원'}">
								<hr style="margin:0 0 5px 0;"/>
								<div style="padding:0;" class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
									<ul class="nav navbar-nav">
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/viewAgencyEmployeeInfo?agencyEmployeeId=${member.memberId}">직원 회원 관리</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListAgencyEmployee?agencyEmployeeId=${member.memberId}">소속 대행업체 직원 조회</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListFunctionaryForAgencyEmployee?agencyEmployeeId=${member.memberId}">계약한 지자체 공무원 조회</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListAgencyNakchalInfo?agencyEmployeeId=${member.memberId}">소속업체 낙찰정보 조회</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListUnitedAfterserviceRequestForAgencyAfterserviceHandling?agencyEmployeeId=${member.memberId}&adminagencyCode=${member.adminagencyCode}">통합 AS 의뢰 리스트</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="#">배달 의뢰 리스트</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="#">의뢰 처리 현황 작성</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="#">의뢰 처리 현황 작성</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="#">의뢰 처리 완료 리스트</a></li>
									</ul>
								</div>
							</c:when>
							<c:when test="${member.memberLevel == '시민'}"> 
								<hr style="margin:0 0 5px 0;"/>
								<div style="padding:0;" class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
									<ul class="nav navbar-nav">
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectOneCitizen?citizenId=${member.memberId}">시민 회원관리</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListDonation?citizenId=${member.memberId}">기부신청</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="#">대여/예약 취소 </a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="#">대여/예약 신청/취소 리스트</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/viewApplicationRentForCitizen?citizenId=${member.memberId}">대여 리스트</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectReturnGoodsfacilityInfo">반납 리스트</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/insertDeliveryOrderCitizen">반납 신청</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="#">운송장 정보 확인</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="${pageContext.request.contextPath}/selectListAnnualfeePakage">연회비/패키지조회</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="#">포인트 조회</a></li>
										<li class="backgroundColor"><a style="color:#FFFFFF" href="#">배상청구 기록 조회</a></li>
									</ul>
								</div>
							</c:when>
							
							
						</c:choose>
						<!-- End 권한별 메뉴 -->
			
						<!-- End Content -->
					</div>
					<!-- <div class="col-sm-2"></div> -->
				</div>
			</div>
			
		</nav>
		<!-- 
			navbar가 위쪽에 고정됨에 따라 기존 컨텐츠가 navbar height만큼 가려지는것 해결하기 위해 div에 navbar height만큼의 높이를 추가한다.
			script를 헤더에 두지 않은 이유는,
			헤더에 두어 $(document).ready(function(){ $('#navbarDiv').height($('#navbar').height()); }); 을 쓸 경우,
			연산속도가 느려져서 F5키를 눌렀을 때, 화면이 위에서 아래로 내려가는(고정된 navbar의 높이를 navbarDiv에 초기화시켜주는) 현상이 눈에 보이므로
			그 현상을 최소화하기 위해 아래 script를 헤더부분에 배치하지 않고 navbar아래쪽에 위치시켜놓았다.
		 -->
		<script>
			$('#navbarDiv').height($('#navbar').height());
		</script>
		
	</body>
</html>

		