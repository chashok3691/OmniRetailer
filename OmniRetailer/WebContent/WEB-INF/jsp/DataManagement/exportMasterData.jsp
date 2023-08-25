<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : 
 * file name		        : inventorymanager/retailoutlets/availableSrock.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * Modified By		        : Vijay
 * Modified Date 			: 17-01- 2018productCatelogueSuppliersFrom
 * 
  */ -->



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.swing.JFileChooser"%>
<%@ page import="java.io.File"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Export Data | Omni Retailer</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- DATA TABLES -->
<%-- <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" /> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/controller.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/dataManagement/export.js"></script>
<%-- 		<script type="text/javascript" src="${pageContext.request.contextPath}/js/dataManagement/import.js"></script> --%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<style type="text/css">
.form-group {
	margin-bottom: 5px;
}

.columnpadding {
	padding-left: 0px;
	padding-right: 5px;
}

.marginpaddingpopup {
	padding-left: 5px;
	padding-right: 5px;
	padding-bottom: 5px;
}

@media ( max-width : 1100px) {
	.columnpadding {
		padding-left: 15px;
		padding-right: 15px;
	}
	.menuallignment {
		margin-left: 5px !important;
		width: 50% !important;
	}
	.rowallignment {
		padding-left: 15px;
		padding-right: 15cm;
		height: auto !important;
	}
	.columnallignment {
		padding-left: 15px;
		padding-right: 15px;
		height: auto !important;
	}
	.exportdate {
		width: auto !important;
	}
	.enddate {
		width: auto !important;
	}
	.menuwidth {
		width: auto !important;
	}
}

.browsebutton {
	border-radius: 0px;
	height: 28px;
	padding: 0px 3px;
	font-size: 13px;
	width: 2cm;
}

.fileUpload {
	position: absolute;
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

.btn-primar {
	font-weight: bold;
	color: black;
	background-color: rgb(195, 195, 195);
	border-color: black;
}

.rowallignment {
	padding-left: 2.8cm;
	padding-right: 0cm;
	height: 1cm;
}

.popupclass {
	position: relative;
	z-index: 999999999999999;
	background: #eee;
	border: 1px solid #d2d6de;
	float: right;
	width: 6.2cm;
	padding-top: 0.2cm;
	margin-right: 0.15cm;
}

.inputboxsize {
	height: 20px !important;
}

.menuallignment {
	/*  width: 55%; */
	margin-left: -5%;
}

.displaynone {
	display: none;
}

.exportdate {
	width: 38%;
}

.enddate {
	width: 28%;
}

.columnallignment {
	padding-left: 7px;
	padding-right: 0px;
	height: 1cm;
}

.menuwidth {
	width: 37.1%;
}

.exporthistory {
	height: 0.8cm;
	float: right;
	border-radius: 0px;
	width: 100%;
	/* padding-bottom: 11px; */
	margin-bottom: 5px;
	padding: 3px 5px;
}

@media ( min-width :1240px) and (max-width:1440px) {
	.daily {
		width: 20%;
	}
	.fortnight {
		width: 30%;
	}
}

.btn-primar {
	font-weight: bold;
	color: black;
	background-color: rgb(195, 195, 195);
	border-color: black;
}

.reset-button {
	margin-right: 0%;
	margin-top: 5px;
	width: 100%;
	padding: 3px;
	position: relative;
	float: right;
}

.start-button {
	margin-left: 0%;
	margin-right: 22%;
	margin-top: 5px;
	width: 100%;
	padding: 3px;
	position: relative;
	float: right;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<%
		
	%>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-primary">
					<div class="box-header" style="text-align: center;">
						<h3 class="box-title">
							<spring:message code="export.data.label" />
						</h3>
					</div>

					<div class="box-body">

						<div id="Error"
							style="text-align: center; color: red; font-weight: bold;"></div>

						<br>



						<div class="row form-group" style="">



							<div class="row">
								<div class="col-lg-8"></div>
								<div class="col-lg-4"
									style="margin: 0px; padding-bottom: 0px; text-align: center">
									<input type="button" class="btn bg-olive btn-inline"
										style="margin-right: 4.5%; position: relative; float: right; width: 56%;"
										onclick="importFiles();" value="SAVE AS PACKAGE" />

								</div>
							</div>



							<div class="row" style="padding-left: 6%; padding-right: 0%">



								<div class="form-group col-lg-10"
									style="border-bottom: 1px solid #d2d6de; padding-left: 0px; padding-right: 0px; width: 82%;">
									<img class="headerImg"
										style="float: right; cursor: pointer; margin-right: -5px; margin-top: 32px; margin-bottom: -26px;"
										onclick="activateHeader('productCatalogueGeneric');"
										id="productCatalogueGenericImg" alt=""
										src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
									<div>

										<div class="col-lg-9"
											style="padding-left: 0px; padding-top: 37px;">
											<label style="font-size: 18px;"><spring:message
													code="generic.data.label" /></label>
										</div>


									</div>
								</div>

								<div class="form-group col-lg-1"
									style="width: 9%; padding-left: 20px;">
									<input type="button" id="edit"
										class="btn bg-olive btn-inline reset-button"
										style="margin-top: 37px;"
										onclick="resetOnName('productCatelogue');" value="Reset" />
								</div>
								<div class="form-group col-lg-1" style="width: 9%;">
									<input type="button" id="edit"
										class="btn bg-olive btn-inline start-button"
										style="margin-top: 37px;"
										onclick="exportMasters('productCatelogueGeneric');" value="Start" />
								</div>



							</div>
							<!-- dummy -->
							<div class="subBlock productCatalogueGeneric">
								<div class="row">
									<div class="form-group col-lg-12"	style="padding-left: 6%; padding-right: 5%">
										
									
											<div class="col-lg-5" style="padding-left: 0px;">
												<input type="checkbox" id="selectproductCatelogueGeneric"
													value="productCatelogGeneric" name = "productCatelogueGeneric"
													style="zoom: 1.5; margin-left: 0px; vertical-align: -4px;"
													onclick="selectAllExports(this,'productCatelogueGeneric')">
												<div
													style="display: inline-block; font-size: 14px; color: #666;">Select
													All</div>
											</div>

										
									</div>
								</div>


								<!-- dummy -->

								<div class="col-lg-10  columnpadding">
									<c:if test="${flow == 'generic'}">
										<div id="suppliersProductCatelogGeneric" class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!-- <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="productCatelogueGeneric" class = "productCatelogueGeneric" value="Suppliers"
														oninput="enableFilesBrowse(this,'productCatelogueGenericSuppliers','productCatelogueGeneric');"
														onchange="enableFilesBrowse(this,'productCatelogueGenericSuppliers','productCatelogueGeneric');"
														id="productCatelogueGenericSuppliers" />&nbsp;&nbsp;&nbsp;
													<spring:message code="product.secondary.supplier.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="productCatelogueGenericSuppliersLocation"
															disabled="disabled">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${locationBeanList}">
															
																<option value="${location.locationId}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location.locationId}">${location.locationId}</option>
																	
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly value="" style="background-color: white;"
															id="productCatelogueGenericSuppliersFrom" size="20" type="text"
															onfocus="callCalender('productCatelogueGenericSuppliersFrom')"  
															onclick="callCalender('productCatelogueGenericSuppliersFrom')"
															placeholder="Exported Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueGenericSuppliersTo" size="20" type="text"
															onfocus="callCalender('productCatelogueGenericSuppliersTo')" 
															onclick="callCalender('productCatelogueGenericSuppliersTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>

												</div>

												<div
													class="form-group col-lg-4  col-xs-12 columnpadding menuwidth">
													<div class=" col-lg-12  col-xs-8 columnpadding">
														<div class="form-group col-lg-4  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																disabled name="productCatelogueGenericExportType"
																id="productCatelogueGenericExportType">
																<option disabled><spring:message
																		code="export.exportType.label" /></option>
																<option selected value="1">Absolute</option>
																<option value="0">Incremental</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-3  columnpadding">
															<select class="form-control" style="padding: 0px 0px;"
																disabled name="dealStatus" id="productCatelogueGenericFileType">
																<option disabled><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="1">JDA</option>
																<option  value="0">CSV</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-5  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																disabled name="dealStatus"
																id="productCatelogueGenericExportMode"
																onchange="viewftppopup(this,'productCatelogueGeneric')">
																<option disabled selected><spring:message
																		code="export.export.mode.label" /></option>
																<option selected value="localdownload">Local
																	Download</option>
																<option value="ftp">FTP</option>
																<option value="network">Network</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
													</div>

												</div>

												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="productMasterImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>

										</div>
									</c:if>
										<c:if test="${flow == 'generic'}">
										<div class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														class="productCatelogueGeneric" name="productCatelogueGeneric" id="productCatelogueGenericTaxMaster" value="TaxMaster"
														oninput="enableFilesBrowse(this,'productCatelogueGenericTaxMaster','productCatelogueGeneric');"
														onchange="enableFilesBrowse(this,'productCatelogueGenericTaxMaster','productCatelogueGeneric');" />&nbsp;&nbsp;&nbsp;
													<spring:message code="data.export.Stockreceipt" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select disabled class="form-control form-group"
															id="productCatelogueGenericTaxMasterLocation">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${locationBeanList}">
																<option value="${location.locationId}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location.locationId}">${location.locationId}</option>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly value="" style="background-color: white;"
															id="productCatelogueGenericTaxMasterFrom" size="20" type="text"
															onfocus="callCalender('productCatelogueGenericTaxMasterFrom')" 
															onclick="callCalender('productCatelogueGenericTaxMasterFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueGenericTaxMasterTo" size="20" type="text"
															onfocus="callCalender('productCatelogueGenericTaxMasterTo')" 
															onclick="callCalender('productCatelogueGenericTaxMasterTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													</div>
											
												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="productMasterImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>
										</div>
										<div class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														class="productCatelogueGeneric" name="productCatelogueGeneric" id="productCatelogueGenericBrandMaster" value="BrandMaster"
														oninput="enableFilesBrowse(this,'productCatelogueGenericBrandMaster','productCatelogueGeneric');"
														onchange="enableFilesBrowse(this,'productCatelogueGenericBrandMaster','productCatelogueGeneric');" />&nbsp;&nbsp;&nbsp;
													<spring:message code="data.export.brandmaster" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" disabled
															id="productCatelogueGenericBrandMasterLocation">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${locationBeanList}">
																<option value="${location.locationId}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location.locationId}">${location.locationId}</option>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly value="" style="background-color: white;"
															id="productCatelogueGenericBrandMasterFrom" size="20"
															type="text"
															onfocus="callCalender('productCatelogueGenericBrandMasterFrom')"
															onclick="callCalender('productCatelogueGenericBrandMasterFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueGenericBrandMasterTo" size="20" type="text"
															onfocus="callCalender('productCatelogueGenericBrandMasterTo')" 
															onclick="callCalender('productCatelogueGenericBrandMasterTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
												
												</div>
												
												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="productMasterImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>
										</div>
									</c:if>
								
									<div class="row rowallignment">
										<c:if test="${flow == 'generic'}">
											<div class="col-lg-12 columnallignment" style="">
												<!--   <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														class ="productCatelogueGeneric" name="productCatelogueGeneric" id="productCatelogueGenericDepartments" value="Departments"
														oninput="enableFilesBrowse(this,'productCatelogueGenericDepartments','productCatelogueGeneric');"
														onchange="enableFilesBrowse(this,'productCatelogueGenericDepartments','productCatelogueGeneric');" >&nbsp;&nbsp;&nbsp;
													<spring:message code="import.departments.master.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" disabled
															id="productCatelogueGenericDepartmentsLocation">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${locationBeanList}">
																<option value="${location.locationId}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location.locationId}">${location.locationId}</option>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly value="" style="background-color: white;"
															id="productCatelogueGenericDepartmentsFrom" size="20"
															type="text"
															onfocus="callCalender('productCatelogueGenericDepartmentsFrom')" 
															onclick="callCalender('productCatelogueGenericDepartmentsFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueGenericDepartmentsTo" size="20" type="text"
															onfocus="callCalender('productCatelogueGenericDepartmentsTo')" 
															onclick="callCalender('productCatelogueGenericDepartmentsTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
												
												</div>
											
												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="productMasterImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>
										</c:if>
									</div>
									
										<div class="row rowallignment">
										<c:if test="${flow == 'generic'}">
											<div class="col-lg-12 columnallignment" style="">
												<!--   <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														class ="productCatelogueGeneric"  name="productCatelogueGeneric" id="productCatelogueGenericCategory" value="Category"
														oninput="enableFilesBrowse(this,'productCatelogueGenericCategory','productCatelogueGeneric');"
														onchange="enableFilesBrowse(this,'productCatelogueGenericCategory','productCatelogueGeneric');" >&nbsp;&nbsp;&nbsp;
													<spring:message code="category_deals.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" disabled
															id="productCatelogueGenericCategoryLocation">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${locationBeanList}">
																<option value="${location.locationId}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location.locationId}">${location.locationId}</option>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly value="" style="background-color: white;"
															id="productCatelogueGenericCategoryFrom" size="20"
															type="text"
															onfocus="callCalender('productCatelogueGenericCategoryFrom')" 
															onclick="callCalender('productCatelogueGenericCategoryFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueGenericCategoryTo" size="20" type="text"
															onfocus="callCalender('productCatelogueGenericCategoryTo')" 
															onclick="callCalender('productCatelogueGenericCategoryTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													
												</div>
												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="productMasterImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>
										</c:if>
									</div>



<div class="row rowallignment">
										<c:if test="${flow == 'generic'}">
											<div class="col-lg-12 columnallignment" style="">
												<!--   <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														class="productCatelogueGeneric" name="productCatelogueGeneric" id="productCatelogueGenericEmployee" value="Employee"
														oninput="enableFilesBrowse(this,'productCatelogueGenericEmployee','productCatelogueGeneric');"
														onchange="enableFilesBrowse(this,'productCatelogueGenericEmployee','productCatelogueGeneric');" >&nbsp;&nbsp;&nbsp;
													<spring:message code="data.import.employeemaster" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" disabled
															id="productCatelogueGenericEmployeeLocation">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${locationBeanList}">
																<option value="${location.locationId}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location.locationId}">${location.locationId}</option>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly value="" style="background-color: white;"
															id="productCatelogueGenericEmployeeFrom" size="20"
															type="text"
															onfocus="callCalender('productCatelogueGenericEmployeeFrom')" 
															onclick="callCalender('productCatelogueGenericEmployeeFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueGenericEmployeeTo" size="20" type="text"
															onfocus="callCalender('productCatelogueGenericEmployeeTo')" 
															onclick="callCalender('productCatelogueGenericEmployeeTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													
												</div>
											
												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="productMasterImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>
										</c:if>
									</div>


	<div class="row rowallignment">
										<c:if test="${flow == 'generic'}">
											<div class="col-lg-12 columnallignment" style="">
												<!--   <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="productCatelogueGeneric" class="productCatelogueGeneric" id="productCatelogueGenericShipmentRate" value="ShipmentRate"
														oninput="enableFilesBrowse(this,'productCatelogueGenericShipmentRate','productCatelogueGeneric');"
														onchange="enableFilesBrowse(this,'productCatelogueGenericShipmentRate','productCatelogueGeneric');" >&nbsp;&nbsp;&nbsp;
													<spring:message code="shipment.rate.master.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" disabled
															id="productCatelogueGenericShipmentRateLocation">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${locationBeanList}">
																<option value="${location.locationId}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location.locationId}">${location.locationId}</option>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly value="" style="background-color: white;"
															id="productCatelogueGenericShipmentRateFrom" size="20"
															type="text"
															onfocus="callCalender('productCatelogueGenericShipmentRateFrom')" 
															onclick="callCalender('productCatelogueGenericShipmentRateFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueGenericShipmentRateTo" size="20" type="text"
															onfocus="callCalender('productCatelogueGenericShipmentRateTo')" 
															onclick="callCalender('productCatelogueGenericShipmentRateTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													
												</div>
											
												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="productMasterImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>
										</c:if>
									</div>





								</div>
								<div class="col-lg-2 columnpadding"
									style="border-left: 1px solid #eee; padding-left: 5px;">
									<div class="col-lg-2"></div>
									<div class="col-lg-10">
										<div class="radio">
											<label><input type="radio" checked value="0"  name="productCatelogueGenericRadio">
											<spring:message code="export.run.at.once" /></label>
										</div>
										<div class="radio">
											<label><input type="radio" name="productCatelogueGenericRadio" value="1">
											<spring:message code="export.run.as.batch" /></label>
										</div>
									</div>

								</div>
							</div>
					
									
							<div class="row" style="padding-left: 6%; padding-right: 0%">









								<div class="form-group col-lg-10"
									style="border-bottom: 1px solid #d2d6de; padding-left: 0px; padding-right: 0px; width: 82%;">
									<img class="headerImg"
										style="float: right; cursor: pointer; margin-right: -5px; margin-top: 32px; margin-bottom: -26px;"
										onclick="activateHeader('productCatalogueOutlet');"
										id="productCatalogueOutletImg" alt=""
										src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
									<div>

										<div class="col-lg-9"
											style="padding-left: 0px; padding-top: 37px;">
											<label style="font-size: 18px;"><spring:message
													code="masters.label" /></label>
										</div>


									</div>
								</div>

								<div class="form-group col-lg-1"
									style="width: 9%; padding-left: 20px;">
									<input type="button" id="edit"
										class="btn bg-olive btn-inline reset-button"
										style="margin-top: 37px;"
										onclick="resetOnName('productCatelogueOutlet');" value="Reset" />
								</div>
								<div class="form-group col-lg-1" style="width: 9%;">
									<input type="button" id="edit"
										class="btn bg-olive btn-inline start-button"
										style="margin-top: 37px;"
										onclick="exportMasters('productCatelogueOutlet');" value="Start" />
								</div>



							</div>
							<!-- dummy -->
							<div class="subBlock productCatalogueOutlet">
								<div class="row">
									<div class="form-group col-lg-12"	style="padding-left: 6%; padding-right: 5%">
										
											<div class="col-lg-5" style="padding-left: 0px;">
												<input type="checkbox" id="selectproductCatelogueOutlet"
													value="productCatelogOutlet" name = "productCatelogueOutlet"
													style="zoom: 1.5; margin-left: 0px; vertical-align: -4px;"
													onclick="selectAllExports(this,'productCatelogueOutlet')">
												<div
													style="display: inline-block; font-size: 14px; color: #666;">Select
													All</div>
											</div>

										
									</div>
								</div>


								<!-- dummy -->

								<div class="col-lg-10  columnpadding">
									<c:if test="${flow == 'generic'}">
										<div id="bomProductCatelogOutlet" class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!-- <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="productCatelogueOutlet" class="productCatelogueOutlet" value="Bom"
														oninput="enableFilesBrowse(this,'productCatelogueOutletBom','productCatelogueOutlet');"
														onchange="enableFilesBrowse(this,'productCatelogueOutletBom','productCatelogueOutlet');"
														id="productCatelogueOutletBom" />&nbsp;&nbsp;&nbsp;
													<spring:message code="bom.master.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="productCatelogueOutletBomLocation"
															disabled="disabled">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${locationBeanList}">
															<c:if test="${location.businessActivity != 'Warehouse' }">
																<option value="${location.locationId}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location.locationId}">${location.locationId}</option>
																	</c:if>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly value="" style="background-color: white;"
															id="productCatelogueOutletBomFrom" size="20" type="text"
															onfocus="callCalender('productCatelogueOutletBomFrom')"  
															onclick="callCalender('productCatelogueOutletBomFrom')"
															placeholder="Exported Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueOutletBomTo" size="20" type="text"
															onfocus="callCalender('productCatelogueOutletBomTo')" 
															onclick="callCalender('productCatelogueOutletBomTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>

												</div>

												<div
													class="form-group col-lg-4  col-xs-12 columnpadding menuwidth">
													<div class=" col-lg-12  col-xs-8 columnpadding">
														<div class="form-group col-lg-4  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																disabled name="productCatelogueOutletExportType"
																id="productCatelogueOutletExportType">
																<option disabled><spring:message
																		code="export.exportType.label" /></option>
																<option selected value="1">Absolute</option>
																<option value="0">Incremental</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-3  columnpadding">
															<select class="form-control" style="padding: 0px 0px;"
																disabled name="dealStatus" id="productCatelogueOutletFileType">
																<option disabled><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="1">JDA</option>
																<option  value="0">CSV</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-5  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																disabled name="dealStatus"
																id="productCatelogueOutletExportMode"
																onchange="viewftppopup(this,'productCatelogueOutlet')">
																<option disabled selected><spring:message
																		code="export.export.mode.label" /></option>
																<option selected value="localdownload">Local
																	Download</option>
																<option value="ftp">FTP</option>
																<option value="network">Network</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
													</div>

												</div>
											
												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="productMasterImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>

										</div>
									</c:if>
									

					<c:if test="${flow == 'generic'}">
										<div id="productGroupProductCatelogOutlet" class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!-- <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="productCatelogueOutlet" class="productCatelogueOutlet" value="ProductGroup"
														oninput="enableFilesBrowse(this,'productCatelogueOutletProductGroup','productCatelogueOutlet');"
														onchange="enableFilesBrowse(this,'productCatelogueOutletProductGroup','productCatelogueOutlet');"
														id="productCatelogueOutletProductGroup" />&nbsp;&nbsp;&nbsp;
													<spring:message code="product.group.master.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="productCatelogueOutletProductGroupLocation"
															disabled="disabled">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${locationBeanList}">
															<c:if test="${location.businessActivity != 'Warehouse' }">
																<option value="${location.locationId}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location.locationId}">${location.locationId}</option>
																	</c:if>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly value="" style="background-color: white;"
															id="productCatelogueOutletProductGroupFrom" size="20" type="text"
															onfocus="callCalender('productCatelogueOutletProductGroupFrom')"  
															onclick="callCalender('productCatelogueOutletProductGroupFrom')"
															placeholder="Exported Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueOutletProductGroupTo" size="20" type="text"
															onfocus="callCalender('productCatelogueOutletProductGroupTo')" 
															onclick="callCalender('productCatelogueOutletProductGroupTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>

												</div>

											

												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="productMasterImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>

										</div>
									</c:if>
									
									
									
									
									<c:if test="${flow == 'generic'}">
										<div id="priceRangeProductCatelogOutlet" class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!-- <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="productCatelogueOutlet" class="productCatelogueOutlet" value="PriceRange"
														oninput="enableFilesBrowse(this,'productCatelogueOutletPriceRange','productCatelogueOutlet');"
														onchange="enableFilesBrowse(this,'productCatelogueOutletPriceRange','productCatelogueOutlet');"
														id="productCatelogueOutletPriceRange" />&nbsp;&nbsp;&nbsp;
													<spring:message code="pricerange.category.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="productCatelogueOutletPriceRangeLocation"
															disabled="disabled">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${locationBeanList}">
															<c:if test="${location.businessActivity != 'Warehouse' }">
																<option value="${location.locationId}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location.locationId}">${location.locationId}</option>
																	</c:if>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly value="" style="background-color: white;"
															id="productCatelogueOutletPriceRangeFrom" size="20" type="text"
															onfocus="callCalender('productCatelogueOutletPriceRangeFrom')"  
															onclick="callCalender('productCatelogueOutletPriceRangeFrom')"
															placeholder="Exported Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueOutletPriceRangeTo" size="20" type="text"
															onfocus="callCalender('productCatelogueOutletPriceRangeTo')" 
															onclick="callCalender('productCatelogueOutletPriceRangeTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>

												</div>

											

												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="productMasterImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>

										</div>
									</c:if>
									
									
									
									
										<c:if test="${flow == 'generic'}">
										<div id="skuProductCatelogOutlet" class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!-- <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="productCatelogueOutlet" class="productCatelogueOutlet" value="Sku"
														oninput="enableFilesBrowse(this,'productCatelogueOutletSku','productCatelogueOutlet');"
														onchange="enableFilesBrowse(this,'productCatelogueOutletSku','productCatelogueOutlet');"
														id="productCatelogueOutletSku" />&nbsp;&nbsp;&nbsp;
													<spring:message code="sku.master.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="productCatelogueOutletSkuLocation"
															disabled="disabled">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${locationBeanList}">
															<c:if test="${location.businessActivity != 'Warehouse' }">
																<option value="${location.locationId}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location.locationId}">${location.locationId}</option>
																	</c:if>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly value="" style="background-color: white;"
															id="productCatelogueOutletSkuFrom" size="20" type="text"
															onfocus="callCalender('productCatelogueOutletSkuFrom')"  
															onclick="callCalender('productCatelogueOutletSkuFrom')"
															placeholder="Exported Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueOutletSkuTo" size="20" type="text"
															onfocus="callCalender('productCatelogueOutletSkuTo')" 
															onclick="callCalender('productCatelogueOutletSkuTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>

												</div>

											

												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="productMasterImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>

										</div>
									</c:if>
									


								</div>
								<div class="col-lg-2 columnpadding"
									style="border-left: 1px solid #eee; padding-left: 5px;">
									<div class="col-lg-2"></div>
									<div class="col-lg-10">
										<div class="radio">
											<label><input type="radio" checked="checked" value="0"  name="productCatelogOutletRadio">
											<spring:message code="export.run.at.once" /></label>
										</div>
										<div class="radio">
											<label><input type="radio" name="productCatelogOutletRadio" value="1">
											<spring:message code="export.run.as.batch" /></label>
										</div>
									</div>

								</div>
							</div>
					
							<div class="row" style="padding-left: 6%; padding-right: 0%">
								<div class="form-group col-lg-10"
									style="border-bottom: 1px solid #d2d6de; padding-left: 0px; padding-right: 0px; width: 82%;">
									<img class="headerImg"
										style="float: right; cursor: pointer; margin-right: -5px; margin-top: 32px; margin-bottom: -26px;"
										onclick="activateHeader('productCatalogueWarehouse');"
										id="productCatalogueWarehouseImg" alt=""
										src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
									<div>

										<div class="col-lg-9"
											style="padding-left: 0px; padding-top: 37px;">
											<label style="font-size: 18px;"><spring:message
													code="warehouse.master.label" /></label>
										</div>


									</div>
								</div>

								<div class="form-group col-lg-1"
									style="width: 9%; padding-left: 20px;">
									<input type="button" id="edit"
										class="btn bg-olive btn-inline reset-button"
										style="margin-top: 37px;"
										onclick="resetOnName('productCatelogueWarehouse');" value="Reset" />
								</div>
								<div class="form-group col-lg-1" style="width: 9%;">
									<input type="button" id="edit"
										class="btn bg-olive btn-inline start-button"
										style="margin-top: 37px;"
										onclick="exportMasters('productCatelogueWarehouse');" value="Start" />
								</div>



							</div>
							<!-- dummy -->
							<div class="subBlock productCatalogueWarehouse">
								<div class="row">
									<div class="form-group col-lg-12"	style="padding-left: 6%; padding-right: 5%">
										
									
											<div class="col-lg-5" style="padding-left: 0px;">
												<input type="checkbox" id="selectproductCatelogueWarehouse"
													value="productCatelogWarehouse" name = "productCatelogueWarehouse"
													style="zoom: 1.5; margin-left: 0px; vertical-align: -4px;"
													onclick="selectAllExports(this,'productCatelogueWarehouse')">
												<div
													style="display: inline-block; font-size: 14px; color: #666;">Select
													All</div>
											</div>

										
									</div>
								</div>


								<!-- dummy -->

								<div class="col-lg-10  columnpadding">
									<c:if test="${flow == 'generic'}">
										<div id="skuProductCatelogWarehouse" class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!-- <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="productCatelogueWarehouse" class="productCatelogueWarehouse" value="WarehouseSku"
														oninput="enableFilesBrowse(this,'productCatelogueWarehouseSku','productCatelogueWarehouse');"
														onchange="enableFilesBrowse(this,'productCatelogueWarehouseSku','productCatelogueWarehouse');"
														id="productCatelogueWarehouseSku" />&nbsp;&nbsp;&nbsp;
													<spring:message code="sku.master.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="productCatelogueWarehouseSkuLocation"
															disabled="disabled">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${locationBeanList}">
															
															 <c:if test="${location.businessActivity == 'Warehouse' }">
																<option value="${location.locationId}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location.locationId}">${location.locationId}</option>
																	</c:if>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly value="" style="background-color: white;"
															id="productCatelogueWarehouseSkuFrom" size="20" type="text"
															onfocus="callCalender('productCatelogueWarehouseSkuFrom')"  
															onclick="callCalender('productCatelogueWarehouseSkuFrom')"
															placeholder="Exported Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueWarehouseSkuTo" size="20" type="text"
															onfocus="callCalender('productCatelogueWarehouseSkuTo')" 
															onclick="callCalender('productCatelogueWarehouseSkuTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>

												</div>

												<div
													class="form-group col-lg-4  col-xs-12 columnpadding menuwidth">
													<div class=" col-lg-12  col-xs-8 columnpadding">
														<div class="form-group col-lg-4  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																disabled name="productCatelogueWarehouseExportType"
																id="productCatelogueWarehouseExportType">
																<option disabled><spring:message
																		code="export.exportType.label" /></option>
																<option selected value="1">Absolute</option>
																<option value="0">Incremental</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-3  columnpadding">
															<select class="form-control" style="padding: 0px 0px;"
																disabled name="dealStatus" id="productCatelogueWarehouseFileType">
																<option disabled><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="1">JDA</option>
																<option  value="0">CSV</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-5  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																disabled name="dealStatus"
																id="productCatelogueWarehouseExportMode"
																onchange="viewftppopup(this,'productCatelogueWarehouse')">
																<option disabled selected><spring:message
																		code="export.export.mode.label" /></option>
																<option selected value="localdownload">Local
																	Download</option>
																<option value="ftp">FTP</option>
																<option value="network">Network</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
													</div>

												</div>

												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="productMasterImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>

										</div>
									</c:if>
									



								</div>
								<div class="col-lg-2 columnpadding"
									style="border-left: 1px solid #eee; padding-left: 5px;">
									<div class="col-lg-2"></div>
									<div class="col-lg-10">
										<div class="radio">
											<label><input type="radio" checked value="0"  name="productCatelogWarehouseRadio">
											<spring:message code="export.run.at.once" /></label>
										</div>
										<div class="radio">
											<label><input type="radio" name="productCatelogWarehouseRadio" value="1">
											<spring:message code="export.run.as.batch" /></label>
										</div>
									</div>

								</div>
							</div>
					
								
									
									
										</div>

						<br>
						<div class="row">
							<div class="col-lg-8"></div>
							<div class="col-lg-4"
								style="margin: 0px; padding-bottom: 0px; text-align: center">
								<input type="button" class="btn bg-olive btn-inline"
									style="margin-right: 0%; position: relative; float: right; width: 56%;"
									onclick="save();" value="SAVE AS PACKAGE" />

							</div>
						</div>

						<hr
							style="margin-top: 8px; margin-left: 3.9%; margin-right: 2%; border: 1px solid #eee;" />



						<div class="row">

							<div class=" form-group col-lg-3 col-sm-4 col-xs-12"
								style="padding-left: 5%; padding-right: 0px;">
								<div class="row">

									<div class="form-group col-lg-10 col-sm-12 col-xs-12"
										style="padding-right: 0px; margin-bottom: -3px">

										<div class="form-group col-lg-10 col-sm-12 col-xs-11"
											style="padding-left: 0px;">
											<label for=""><spring:message
													code="import.Package_Name.label" /></label> <input type="text"
												class="form-control" id="packageName">
										</div>
									</div>
								</div>



								<div class="row">

									<div class=" col-lg-12 col-sm-12 col-xs-12"
										style="padding-right: 0px; margin-bottom: -3px">

										<div class=" col-lg-12 col-sm-12 col-xs-11"
											style="padding-left: 0px;">
											<label for=""><spring:message
													code="import.Package_Title.label" /></label> <input type="text"
												class="form-control" id="packageTittle">
										</div>
									</div>
								</div>
							</div>




							<div class="col-lg-1"></div>
							<div class=" col-lg-2 form-group">
								<div class="row ">

									<div class="address-group col-lg-11 col-xs-9">
										<label for=""><spring:message
												code="import.Start_Date.label" /></label> <input
											class="form-control calendar_icon" readonly="readonly"
											value="" style="background-color: white;" name="dueDateStr"
											id="date" size="20" type="text"
											onfocus="callCalender('date')" onclick="callCalender('date')"
											placeholder="DD/MM/YYYY" /> <span id="createdDateError"
											style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									</div>
								</div>

								<div class="row form-group">

									<div class="address-group col-lg-11 col-xs-9">
										<label><spring:message code="import.End_Date.label" /></label>
										<input class="form-control calendar_icon" readonly="readonly"
											value="" style="background-color: white;" name="dueDateStr"
											id="edate" size="20" type="text"
											onfocus="callCalender('edate')"
											onclick="callCalender('edate')" placeholder="DD/MM/YYYY" /> <span
											id="lastDateForQuoteStrError"
											style="text-align: right; color: red; font-size: 2; width: 70px; font-weight: bold;"></span>
									</div>
								</div>
							</div>



							<div class="col-lg-1"></div>

							<div class=" col-lg-5">
								<div class=" col-lg-12 ">

									<div class="row ">

										<div class="address-group col-lg-4 col-xs-9">
											<div class="bootstrap-timepicker">
												<label for=""><spring:message
														code="import.Start_Time.label" /></label> <input type="text"
													class=" form-control timepicker" value="00:00:00"
													name="startTime" id="startTime"> <span
													id="createdDateError"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
										</div>
									</div>

									<div class="row">

										<div class="col-lg-3 col-sm-3 col-xs-3"
											style="padding-right: 0px; margin-top: 2px">
											<label style="font-size: 16px"><spring:message
													code="import.Recursive.label" /></label>
										</div>
										<div class="col-lg-7 col-sm-6 col-xs-2"
											style="border: 1px solid rgba(0, 0, 0, 0.1); margin-top: 4px; width: 70%; padding-left: 25px">
											<div class="row">
												<div class="col-lg-2  col-sm-6 daily"
													style="padding-left: 0px; padding-right: 0px;">
													<input type="radio"
														style="vertical-align: -1px; margin-right: 2px" name="x"><label><spring:message
															code="import.Daily.label" /></label>
												</div>
												<div class="col-lg-3 col-sm-6"
													style="padding-left: 0px; padding-right: 0px;">
													<input type="radio"
														style="vertical-align: -1px; margin-right: 2px" name="x"><label><spring:message
															code="import.Weekly.label" /></label>
												</div>
												<div class="col-lg-3 col-sm-6 fortnight"
													style="padding-right: 0px; padding-left: 0px;">
													<input type="radio"
														style="vertical-align: -1px; margin-right: 2px; white-space: nowrap"
														name="x"><label><spring:message
															code="import.Fortnight.label" /></label>
												</div>
												<div class="col-lg-3 col-sm-6"
													style="padding-left: 0px; padding-right: 0px;">
													<input type="radio"
														style="vertical-align: -1px; margin-right: 2px" name="x"><label><spring:message
															code="import.Monthly.label" /></label>
												</div>

												<!-- &nbsp; -->

											</div>
										</div>
									</div>

									<div class="row" style="padding-top: 2px;">

								
										<div class="col-lg-4 col-sm-3 col-xs-3"
											style="padding-right: 0px; margin-top: -2px">
											<label><spring:message code="week.days.label" /></label>
										
										</div>
									</div>
									<div class="row">
										<div class="col-lg-2 col-sm-2 col-xs-2"></div>
										<div class="col-lg-10 col-sm-8 col-xs-10"
											style="margin-top: -20px; padding-left: 8%; white-space: nowrap">
											<div class="col-lg-2 col-sm-4"
												style="padding-right: 0px; padding-left: 0px">
												<input type="checkbox"
													style="vertical-align: -3px; width: 25px; height: 15px;"><label><spring:message
														code="import.Select_Week_Days.Mon.label" /></label>&nbsp;
											</div>
											<div class="col-lg-2 col-sm-4"
												style="padding-left: 0px; padding-right: 0px; margin-top: 0px;">
												<input type="checkbox"
													style="width: 25px; height: 15px; vertical-align: -3px;"><label><spring:message
														code="import.Select_Week_Days.Tue.label" /></label>
											</div>
											<div class="col-lg-2 col-sm-4"
												style="padding-right: 0px; padding-left: 0px">
												<input type="checkbox"
													style="vertical-align: -3px; width: 25px; height: 15px;"><label><spring:message
														code="import.Select_Week_Days.Wed.label" /></label>
											</div>
											<div class="col-lg-2 col-sm-4"
												style="padding-right: 0px; padding-left: 0px">
												<input type="checkbox"
													style="vertical-align: -3px; width: 25px; height: 15px;"><label
													style="width: 25px; height: 15px;"><spring:message
														code="import.Select_Week_Days.Thu.label" /></label>
											</div>
											<div class="col-lg-2 col-sm-4"
												style="padding-right: 0px; padding-left: 0px">
												<input type="checkbox"
													style="vertical-align: -3px; width: 25px; height: 15px;"><label
													style="width: 25px; height: 15px;"><spring:message
														code="import.Select_Week_Days.Fri.label" /></label>
											</div>
											<div class="col-lg-2 col-sm-4"
												style="padding-right: 0px; padding-left: 0px">
												<input type="checkbox"
													style="width: 25px; height: 15px; vertical-align: -3px;"><label><spring:message
														code="import.Select_Week_Days.Sat.label" /></label>
											</div>

										</div>

									</div>
								</div>

							</div>



						</div>

						<div class="row">
							<hr
								style="margin-top: -4px; margin-left: 3.9%; margin-right: 2%; border: 1px solid #eee" />
						</div>
						<div id="Error"
							style="text-align: center; color: red; font-weight: bold;"></div>

						<div id="example1_wrapper" class="dataTables_wrapper form-inline"
							role="grid">
							<table id="example1" class="table table-bordered table-striped"
								style="margin-left: 3.6%; margin-right: 3.6%; width: 94.3%">
								<thead style="background-color: #ccc !important; color: #ffffff">
									<tr>
										<th style="border: 1px solid #444 !important;"><spring:message
												code="report.sno.label" /></th>
										<th style="border: 1px solid #444 !important;"><spring:message
												code="import.Package_Name.label" /></th>
										<th style="border: 1px solid #444 !important;"><spring:message
												code="created.on.label" /></th>
										<th style="border: 1px solid #444 !important;"><spring:message
												code="created.by.label" /></th>
										<th style="border: 1px solid #444 !important;"><spring:message
												code="status.label" /></th>
										<th style="border: 1px solid #444 !important;"><spring:message
												code="EmployeeForm.action" /></th>
									</tr>
								</thead>

								<tbody style="text-align: center;">
									<c:forEach var="item" items="${batchOperationsResponse}"
										varStatus="theCount">
										<tr id="dynamicdiv${theCount.count}">
											<td>${theCount.count}</td>
											<td>${item.batch_title}</td>
											<td>${item.created_onStr}</td>
											<td></td>
											<td></td>
											<td id="Del${theCount.count}"><a href="#"
												style="text-decoration: underline; color: blue" onclick="">Open
													Log</a>&nbsp; <img id="Img${theCount.count}"
												src='${pageContext.request.contextPath}/images/itemdelete.png'
												style='width: 8%; cursor: pointer;'
												onclick='deleteItem(this);' /></td>

										</tr>
									</c:forEach>
								</tbody>

							</table>
						</div>
						<br>
					
						<br />
						<div class="box-footer"></div>
					</div>
				</div>
			</div>
			<!-- /.box -->

		</div>
	</section>
	<!-- /.content -->
</body>
</html>