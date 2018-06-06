<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		
		
		
		<!-- navbar가 위쪽에 고정됨에 따라 기존 컨텐츠가 50px만큼 가려지는것 해결하기 위해 div에 50px를 추가하였다. -->
		<!-- <div style="height:50px;"></div> -->
		<!--  navbar-fixed-top -->
		<nav style="background-color:#005EAA;" class="navbar navbar navbar-default">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-2"> </div>
					<div class="col-sm-8">
						<!-- Begin Content -->
			
						<div class="navbar-header">
							<a style="color:#FFFFFF" class="navbar-brand" href="${pageContext.request.contextPath}/">Home</a>
						</div>
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li class="">
									<!-- <span class="sr-only">(current)</span> -->
									<a style="color:#FFFFFF" href="#">대여/예약</a>
								</li>
								<li class="">
									<a style="color:#FFFFFF" href="#">게시판</a>
								</li>
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
									<a style="color:#FFFFFF" href="${pageContext.request.contextPath}/goSignUp">회원가입</a>
								</li>
								<c:choose>
									<c:when test="${member != null}">
										<li class="">
											<a style="color:#FFFFFF" href="${pageContext.request.contextPath}/logout">로그아웃</a>
										</li>
									</c:when>
									<c:otherwise>
										<%-- <li style="color:#FFFFFF" class="active"><a href="${pageContext.request.contextPath}/login">로그인</a></li> --%>
										<li class="">
											<a style="color:#FFFFFF" href="${pageContext.request.contextPath}/login">로그인</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
						<hr style="margin:0 0 5px 0;"/>
						
						<!-- 권한별 메뉴 -->
						<div style="padding:0;" class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
							<ul class="nav navbar-nav">
								<!-- 관리자 메뉴 -->
								<li class="">
									<!-- <span class="sr-only">(current)</span> -->
									<a style="color:#FFFFFF" href="#">관리자 회원관리</a>
								</li>
								<li><a style="color:#FFFFFF" href="#">행정구역 등록</a></li>
								<li><a style="color:#FFFFFF" href="#">지자체 기관 등록</a></li>
								<li><a style="color:#FFFFFF" href="#">시설/물품 카테고리 등록</a></li>
								<li><a style="color:#FFFFFF" href="#">업종분류코드 등록</a></li>
								<li><a style="color:#FFFFFF" href="#">시민계정 조회</a></li>
							</ul>
							
						</div>
			
						<!-- End Content -->
					</div>
					<div class="col-sm-2"></div>
				</div>
			</div>
			
		</nav>
		
	</body>
</html>

		