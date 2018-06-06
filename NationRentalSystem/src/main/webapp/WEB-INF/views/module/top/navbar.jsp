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
		<div style="height:50px;"></div>
		<nav class="navbar navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="${pageContext.request.contextPath}/">Home</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
						<li class=""><a href="#">쇼핑하기</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							<div style="padding:15px;">
								<c:choose>
									<c:when test="${member != null}">
										<strong>${member.memberId} 님 환영합니다. [ ${member.memberLevel} ]</strong>
									</c:when>
									<c:otherwise>
										<strong>손님 환영합니다.</strong>
									</c:otherwise>
								</c:choose>
								
							</div>
						</li>
						<li class=""><a href="${pageContext.request.contextPath}/goSignUp">회원가입</a></li>
						<c:choose>
							<c:when test="${member != null}">
								<li class=""><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a href="${pageContext.request.contextPath}/login">로그인</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
		
	</body>
</html>

		