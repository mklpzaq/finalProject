<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<title>Insert title here</title>
		<script type="text/javascript">
			$(document).ready(function() {
			/* 드롭다운 박스 클릭시 열고 닫고 이벤트 */
				$('#selectButton').click(function(){
					if($('#selectbox').hasClass('open')){
						$('#selectbox').removeClass('open');
					}else{
						$('#selectbox').addClass('open');
					}
				});
				
				/* 드롭메뉴 클릭했을때 글자 바꾸기와 드롭메뉴 닫기 */
				$('#dropDownMenu > li').click(function(){					
					$('#selectButtonText').text($(this).text());
					$('#selectBusinesstypeCode').val($(this).val());
					$('#selectButton').parent().removeClass('open');
				});
				
				//검색버튼을 클릭하면 get방식으로  searchSignal, searchOption, keyword값을 넘긴다.
				$('#btn').click(function(){
					BusinesstypeCode = $('#selectBusinesstypeCode').val();
					$(location).attr('href', './insertAgency?=y&agencyCode=' + $('#agencyCod').val() + '&agencyName=' + $('#agencyName').val() + '&agencyBusinesstypeCode=' + BusinesstypeCode);
				});
			});
		</script>
	</head>

	<body>
		<div style="position:fixed; z-index:-1; width:100%">
			<img style="width:1900px;" src="${pageContext.request.contextPath}/resources/image/background/bgMain.jpg">
		</div>
		<jsp:include page="../module/top/navbar.jsp"/>
		<div class="container-fluid" style="height:600px; margin:70px 0;">			
			<div class="col-sm-2"></div>			
			<div class="col-sm-8">				
			<!-- Begin Content -->
				<div class="panel panel-default" style="width:100%; height: 340px;">
					<div class="panel-body">
					<h3 class="text-center">회원 ID 찾기</h3>
					<hr/>
						<form class="form-horizontal" action="${pageContext.request.contextPath}/" id="insertAgencyForm" method="post">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">낙찰번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="agencyCod" name="agencyCode" placeholder="낙찰번호">							
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">대행업체명</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="agencyName" name="agencyName" placeholder="대행업체명">
								</div>
							</div>				
							<input hidden="hidden" id="selectBusinesstypeCode"></input>	
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">대행업체 업종분류</label>
								&nbsp;&nbsp;&nbsp;
								<!-- Single button -->
								<div class="btn-group">
								  <button type="button" id="selectbox" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								   <span id="selectButtonText">대행업체 업종분류</span><span class="caret"></span>
								  </button>
								  <ul id="dropDownMenu" class="dropdown-menu" role="menu">
								  	<c:forEach var="agencyBusinesstypeDto" items="${list}">
								   		<li value="${agencyBusinesstypeDto.agencyBusinesstypeCode}">
								   			<a href="#">${agencyBusinesstypeDto.agencyBusinesstypeName}</a>
								   		</li>
								   	</c:forEach>
								  </ul>
								</div>
							</div>
									
							<div class="form-group">
								<div style="text-align: center;">
									<button type="button" id="btn" class="btn btn-primary">대행업체 등록</button>
								</div>
							</div>
						</form>
				
					<!-- End Content -->
					</div>
					<div class="col-sm-2"></div>
				</div>
			</div>
		</div>		
	<jsp:include page="../module/bottom/bottomContent.jsp"/>
	</body>
</html>