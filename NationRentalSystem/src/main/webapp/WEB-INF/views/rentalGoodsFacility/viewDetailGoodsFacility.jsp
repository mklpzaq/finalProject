<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>View Image Detail</title>

</head>
<body>
	<jsp:include page="../module/top/navbar.jsp"/>
		<%-- <jsp:include page="../module/top/mainHeader.jsp"/> --%>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2" style="padding:15px;">
					<jsp:include page="../module/left/leftnavi.jsp"/>
				</div>
				<div class="col-sm-8">
				<!-- Begin Content -->


					<h2>시설 & 물품 상세보기</h2>
					
					<div class="col-sm-3">										
						<div class="thumbnail">						
							<%-- <img data-src="holder.js/100%x200" alt="${GoodsFacilityImage.goodsfacilityFileName}${GoodsFacilityImage.goodsfacilityFileExt}" src="${pageContext.request.contextPath}/downloadFile?goodsfacilityName=${GoodsFacilityImage.goodsfacilityFileName}&goodsfacilityFileExt=${GoodsFacilityImage.goodsfacilityFileExt}" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;"> --%>
						
							<div class="caption">
								<!-- <h3 style="text-align:center;" id="thumbnail-label">이준희<a class="anchorjs-link" href="#thumbnail-label"><span class="anchorjs-icon"></span></a></h3> -->
								<p>"${viewImageGoods.goodsfacilityThreeCode}"</p>
								<p>"${viewImageGoods.goodsfacilityName}"</p>
								<p>"${viewImageGoods.goodsfacilityPurchaseprice}"</p>
								<p>"${viewImageGoods.goodsfacilityPriceRental}"</p>
								<p>"${viewImageGoods.goodsfacilityTextSangse}"</p>
								<p>"${viewImageGoods.adminagencyCode}"</p>
								<p>"${viewImageGoods.sigunguName}"</p>
								<p>"${viewImageGoods.sidoName}"</p>
								<p>"${viewImageGoods.eupmyeonName}"</p>
								<p>"${viewImageGoods.goodsfacilityAddressSangse}"</p>
								<p>"${viewImageGoods.goodsfacilityIsPossibleDelivery}"</p>
								<p>"${viewImageGoods.goodsfacilityIsPossibleRental}"</p>								
								<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
							</div>										
						</div>					
					</div>







				<!-- End Content -->
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	<jsp:include page="../module/bottom/bottomContent.jsp"/>
</body>
</html>