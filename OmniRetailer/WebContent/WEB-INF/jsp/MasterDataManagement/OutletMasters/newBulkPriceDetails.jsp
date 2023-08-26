<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vijay
 * Updated By				: Vijay
 * file name		        : 
 * file type		        : JSP
 * description				: 
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | Omni Retailer</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/controller.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/omniretailer.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/excelReader/excelreader.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bulkPriceUpdate.js"></script>

<style type="text/css">
.col-xs-12 {
	padding: 5%;
}

.form-group {
	margin-bottom: 5px;
}

/*  .col-xs-6
{
text-align:right;
}
 */

a.button {
	position: relative;
	text-decoration: none;
	color: white;
	display: inline-block;
	padding: 7px 10px 23px 10px;
	background: #3c8dbc;
	/* border-radius: 5px; */
	/* box-shadow: 1px 0px 2px #000; */
	cursor: pointer;
	margin-top: 15px;
	height: 23px;
	text-align: center;
	margin-bottom: 15px;
	width: 100% !important;
}

a.buttonsearch {
	position: relative;
	text-decoration: none;
	color: white;
	display: inline-block;
	padding: 7px 10px 26px 10px;
	background: #3c8dbc;
	cursor: pointer;
	margin-top: 15px;
	height: 23px;
	text-align: center;
	margin-bottom: 15px;
	width: 100%;
}

.fileUpload {
	position: relative;
	overflow: hidden;
	/*  margin: 10px; */
}

.fileUpload input.upload {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
}

.col-xs-6
{
width: 51% !important;
}

.btn-primar {
	font-weight: normal;
	color: white;
	background-color: rgb(128, 128, 128);
	/* border-color: black; */
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$(this).scrollTop(0);
});
</script>


	

</head>
<body>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12"
				style="padding-top: 0px; padding-bottom: 0px; padding-right: 15px; padding-left: 15px;">
				<div class="box box-primary " style="padding:">
					<div class="box-header" style="text-align: left">
						<h3 align="center" style="margin-top: 10px; margin-bottom: 0px;"> New <spring:message code="bulkPrice.update.label" />
						</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->

					<div class="box-body">
						<div class="row" style="text-align: right; margin-top: 0px;">
							<div id="Error" class="Error"
								style="text-align: center; color: red; font-size: 2; font-weight: bold; margin-bottom: 10px; margin-top: -20px">${error}</div>
							<div id="Success" class="Error"
								style="text-align: center; color: blue; font-size: 2; font-weight: bold; margin-bottom: 10px; margin-top: -20px">${success}</div>

						</div>

						<br>
						<br>

						<div class="form-group col-lg-12 col-md-12">
							<div class="col-lg-3 col-md-3" style="padding: 0px;">
								<input id="filePath" type="text" 
									style="width: 90%; height: 28px;" disabled />
							</div>
							<div class="col-lg-2 col-md-2" style="padding: 0px;">
								<div class="fileUpload btn btn-primar"
									style="font-weight: bold; height: 29px; width: 100px; border-color: ''">

									<span style="font-size: 15px;">Browse...</span> <input
										id="priceExcel" type="file"
										onChange="addNameToTextBox('priceExcel')"
										accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"
										class="upload" />

								</div>
								<br> <span id="groupImageError" class="error"
									style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

							</div>


						</div>
						<div class="form-group col-lg-12 col-md-12">
							<div class="col-lg-3 col-md-3" style="padding: 0px;"></div>
							<div class="col-lg-2 col-md-2" style="padding: 0px;">

								<input type="button" id="submit"
									class="fileUpload btn btn-primar"
									onclick="return uploadPriceExcelData();"
									style="font-weight: bold; height: 29px; width: 100px; border-color: ''"
									value="<spring:message code="upload.label" />">

							</div>
							<br> <span id="uploadError" class="error"
								style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>

						</div>


					</div>
					<div class="col-lg-12">
						<br>
					</div>
					<div class="col-lg-12">
						<br>
					</div>

<div style="padding:15px;">
					<div class="table-responsive">
						<table id="cardDetails" class="table table-bordered table-hover">
							<thead style="background-color: #3c8dbc; color: #ffffff">
								<tr>
									<th><spring:message code="report.sno.label" /></th>
									<th><spring:message code="product.id.label" /></th>
									<th><spring:message code="product.description.label" /></th>
									<th><spring:message code="location.label" /></th>
									<th><spring:message code="category.label" /></th>
									<th><spring:message code="subcategory.label" /></th>
									<th><spring:message code="section.label" /></th>
									<th><spring:message code="createNewArrivals.brandName.label" /></th>
									<th><spring:message code="price.label" /></th>
									<th><spring:message code="updated.price.label" /></th>

								</tr>
							</thead>
							 <tbody style="text-align: center;">

								<c:forEach var="bulkPriceUpdateDetails" items="${priceList}" varStatus="theCount">
									<tr>
										<td>${theCount.count}</td>
										<td>${bulkPriceUpdateDetails.sku_id}</td>
										<td>${bulkPriceUpdateDetails.description}</td>
										<td>${bulkPriceUpdateDetails.store_location}</td>
										<td>${bulkPriceUpdateDetails.category}</td>
										<td>${bulkPriceUpdateDetails.subCategory}</td>
										<td>${bulkPriceUpdateDetails.section}</td>
										<td>${bulkPriceUpdateDetails.brand}</td>
										<td>${bulkPriceUpdateDetails.cost_price}</td>
										<td>${bulkPriceUpdateDetails.sale_price}</td>

									</tr>
								</c:forEach>


							</tbody> 
						</table>


						
					</div>
</div>

<br>

					<div class="row" style="text-align: right; margin-top: 2px;    padding-right: 25px;">
<!-- 						<input type="button" id="submit" class="btnCls" -->
<!-- 							onclick="validateProductGroupMasterForm('new')" -->
<%-- 							value="<spring:message code="submit.label" />">  --%>
							
							
							
							<input
							type="button" class="btnCls buttonMargin" style=""
							onclick="return viewBulkPriceUpdate('BulkPriceUpdate','0','outletLocation');"
							value="<spring:message code="cancel.label" />">


					</div>
					<input type = "hidden" value="${maxRecords}" id="maxRecords"> 
					<input type = "hidden" value="${searchName}" id="searchBulkPriceUpdate"> 
					
					
					<div class="box-footer"></div>
				</div>

			</div>
		</div>
	</section>
	<!-- /.content -->

  <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/datatables/jquery.dataTables.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/datatables/dataTables.bootstrap.js"
		type="text/javascript"></script>
	<script type="text/javascript">
        
     $(function() {
    	 $("#cardDetails").dataTable({
			    "bPaginate": true,
             "bLengthChange": true,
             "bFilter": false,
             "bSort": false,
             "bInfo": false,
             "bAutoWidth": true
			});
     });
 </script>








</body>
</html>