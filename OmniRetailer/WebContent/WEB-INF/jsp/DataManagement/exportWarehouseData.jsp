<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vijay
 * file name		        : inventorymanager/retailoutlets/availableSrock.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * Modified By		        : Vijay
*	 Date 			: 10-11- 2018
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
</head>
<body>
	

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
									<input type="button" class="btn bg-olive btn-inline" style="margin-right: 4.5%; position: relative; float: right; width: 56%;"
										onclick="importFiles();" value="SAVE AS PACKAGE" />

								</div>
							</div>



						
						
							<c:if test="${flow != 'generic'}">
							


								<div class="row" style="padding-left: 6%; padding-right: 0%; padding-top:2%;">
									<div class="form-group col-lg-10"
										style="border-bottom: 1px solid #d2d6de; padding-left: 0px; padding-right: 0px; width: 82%;">
										<img class="headerImg"
											style="float: right; cursor: pointer; margin-right: -8px; margin-top: 2px; margin-bottom: -26px;"
											onclick="activateHeader('shipments');" id="shipmentsImg"
											alt=""
											src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
										<div>
											<div class="col-lg-8"
												style="padding-left: 0px; padding-top: 8px;">
												<label style="font-size: 18px;"><spring:message
														code="warehouse_shipments.label" /></label>
											</div>
											<div class="col-lg-4"
												style="float: right; padding-right: 0px;"></div>

										</div>
									</div>
									<div class="form-group col-lg-1 "
										style="width: 9%; padding-left: 20px;">
										<input type="button" id="edit"
											class="btn bg-olive btn-inline reset-button"
											onclick="resetOnName('shipments');" value="Reset" />
									</div>
									<div class="form-group col-lg-1 " style="width: 9%;">
										<input type="button" id="edit"
											class="btn bg-olive btn-inline start-button" style=""
											onclick="exportMasters('shipments');" value="Start" />
									</div>




								</div>
								<!-- dummy -->
								<div class="shipments subBlock">
									<div class="row">
										<div class="form-group col-lg-12"
											style="padding-left: 6%; padding-right: 5%">
											<div class="col-lg-5" style="padding-left: 0px;">
												<input type="checkbox"
													style="zoom: 1.5; margin-left: 0px; vertical-align: -4px;"
												 name="shipments" id="selectshipments"	onclick="selectAllExports(this,'shipments')">
												<div
													style="display: inline-block; font-size: 14px; color: #666;">Select
													All</div>
											</div>

										</div>
									</div>

									<div class="col-lg-10  columnpadding">
						
									 <div class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!-- <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														class="shipments" name="shipments" id="shipmentsReturns" value="whshipmentsReturns"
														
														onchange="enableFilesBrowse(this,'shipmentsReturns','shipments');"
														
														/>&nbsp;&nbsp;&nbsp;
													<spring:message
														code="emailSettings.procurement.shipment_returns" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" id="shipmentsReturnsLocation" disabled="disabled">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${workLocationsList}">
																<option value="${location}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location}">${location}</option>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly="readonly" value=""
															style="background-color: white;" id="shipmentsReturnsFrom" 
															size="20" type="text"
															onfocus="callCalender('shipmentsReturnsFrom')"
															onclick="callCalender('shipmentsReturnsFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}" 
															style="background-color: white;" id="shipmentsReturnsTo"
															size="20" type="text"
															onfocus="callCalender('shipmentsReturnsTo')"
															onclick="callCalender('shipmentsReturnsTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
												
												</div>
												<div
													class="form-group col-lg-4  col-xs-12 columnpadding menuwidth">
													<div class=" col-lg-12  col-xs-8 columnpadding">
														<div class="form-group col-lg-4  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																name="shipmentsExportType" id="shipmentsExportType" disabled = "disabled">
																<option disabled selected><spring:message
																		code="export.exportType.label" /></option>
																<option value="1">Absolute</option>
																<option value="0">Incremental</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-3  columnpadding">
															<select class="form-control" style="padding: 0px 0px;"
																name="shipmentsFileType" id="shipmentsFileType" Disabled="disabled">
																<option disabled selected><spring:message
																		code="export.select.file.type.label" /></option>
															<option disabled selected  value="1">JDA</option>
                                                            <option disabled selected  value="0">CSV</option>
                                                            <option value="TALLY">Tally</option>
																
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-5  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																name="dealStatus" id="shipmentsExportMode" disabled="disabled"
																onchange="viewftppopup(this,'warehouse_shipments')">
																<option disabled selected><spring:message
																		code="export.export.mode.label" /></option>
																<option value="localdownload">Local Download</option>
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
										<div class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!-- <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														class = "shipments" name="shipments" id="shipmentsReciept" value="shipmentsWHReciept"
														onchange="enableFilesBrowse(this,'shipmentsReciept','shipments');"
														
														/>&nbsp;&nbsp;&nbsp;
													<spring:message code="goods.receipts.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" id="shipmentsRecieptLocation" disabled="disabled">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${workLocationsList}">
																<option value="${location}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location}">${location}</option>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly="readonly" value=""
															style="background-color: white;"
															id="shipmentsRecieptFrom" size="20" type="text"
															onfocus="callCalender('shipmentsRecieptFrom')"
															onclick="callCalender('shipmentsRecieptFrom')" 
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="shipmentsRecieptTo"
															size="20" type="text"
															onfocus="callCalender('shipmentsRecieptTo')"
															onclick="callCalender('shipmentsRecieptTo')"
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
									</div>
									<div class="col-lg-2 columnpadding"
										style="border-left: 1px solid #eee; padding-left: 5px;">
										<div class="col-lg-2"></div>
										<div class="col-lg-10">
											<div class="radio">
												<label><input type="radio" name="shipmentsRadio" checked="checked" value="0">
												<spring:message code="export.run.at.once" /></label>
											</div>
											<div class="radio">
												<label><input type="radio" name="shipmentsRadio" value="1">
												<spring:message code="export.run.as.batch" /></label>
											</div>
										</div>

								
									</div>
								</div>


								<div class="row" style="padding-left: 6%; padding-right: 0%">
									<div class="form-group col-lg-10"
										style="border-bottom: 1px solid #d2d6de; padding-left: 0px; padding-right: 0px; width: 82%;">
										<img class="headerImg"
											style="float: right; cursor: pointer; margin-right: -8px; margin-top: 3px; margin-bottom: -26px;"
											onclick="activateHeader('inventoryManagement');"
											id="inventoryManagementImg" alt=""
											src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
										<div>
											<div class="col-lg-8"
												style="padding-left: 0px; padding-top: 8px;">
												<label style="font-size: 18px;"><spring:message
														code="stockmanagement.label" /></label>
											</div>
											<div class="col-lg-4"
												style="float: right; padding-right: 0px;"></div>

										</div>
									</div>
									<div class="form-group col-lg-1 "
										style="width: 9%; padding-left: 20px;">
										<input type="button" id="edit"
											class="btn bg-olive btn-inline reset-button"
											onclick="resetOnName('inventory');" value="Reset" />
									</div>
									<div class="form-group col-lg-1 " style="width: 9%;">
										<input type="button" id="edit"
											class="btn bg-olive btn-inline start-button" style=""
											onclick="exportMasters('inventory');" value="Start" />
									</div>


								</div>
								<!-- dummy -->
								<div class="inventoryManagement subBlock">
									<div class="row">
										<div class="form-group col-lg-12"
											style="padding-left: 6%; padding-right: 5%">
											<div class="col-lg-5" style="padding-left: 0px;">
												<input type="checkbox"
													style="zoom: 1.5; margin-left: 0px; vertical-align: -4px;"
													name="inventory" id="selectinventory" onclick="selectAllExports(this,'inventory','inventoryManagement')">
												<div
													style="display: inline-block; font-size: 14px; color: #666;">Select
													All</div>
											</div>
										</div>

									</div>

									<div class="col-lg-10  columnpadding">
										<div class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														class ="inventory" name ="inventory" id="inventoryStockReceipts"  value="whStockReceipts"
														onchange="enableFilesBrowse(this,'inventoryStockReceipts','inventory');"
														/>&nbsp;&nbsp;&nbsp;
													<spring:message
														code="export.inventory_management.shipment_receipts.label" />
												</div>
												<div class="col-lg-5  columnpadding menuallignment">
													<div class="form-group col-lg-4  columnpadding">
														<select class="form-control form-group"
															id="inventoryStockReceiptsLocation" disabled="disabled">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${workLocationsList}">
																<option value="${location}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location}">${location}</option>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-5  columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly="readonly" value=""
															style="background-color: white;" id="inventoryStockReceiptsFrom"
															size="20" type="text"
															onfocus="callCalender('inventoryStockReceiptsFrom')" 
															onclick="callCalender('inventoryStockReceiptsFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div class="form-group col-lg-3  columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="inventoryStockReceiptsTo"
															size="20" type="text"
															onfocus="callCalender('inventoryStockReceiptsTo')"
															onclick="callCalender('inventoryStockReceiptsTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>

												</div>
												<div
													class="form-group col-lg-4  col-xs-12 columnpadding menuwidth">
													<div class=" col-lg-12  col-xs-8 columnpadding">
														<div class="form-group col-lg-4  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																name="inventoryExportType" id="inventoryExportType" disabled="disabled">
																<option disabled selected><spring:message
																		code="export.exportType.label" /></option>
																<option value="1">Absolute</option>
																<option value="0">Incremental</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-3  columnpadding">
															<select class="form-control" style="padding: 0px 0px;"
																name="inventoryFileType" id="inventoryFileType" disabled="disabled">
																<option disabled selected><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="1">JDA</option>
																<option value="0">CSV</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-5  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																name="dealStatus" id="inventoryExportMode" disabled="disabled"
																onchange="viewftppopup(this,'inventory')">
																<option disabled selected><spring:message
																		code="export.export.mode.label" /></option>
																<option value="localdownload">Local Download</option>
																<option value="ftp">FTP</option>
																<option value="network">Network</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
													</div>
												</div>
												<%-- <div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div> --%>

												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="inventoryImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>
										</div>
										<!-- 	model popup -->


										<!-- 	model popup -->

										<div class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														class="inventory" name="inventory" id="inventoryStockIssue" value="StockIssue" 
														onchange="enableFilesBrowse(this,'inventoryStockIssue','inventory');"
														
														/>&nbsp;&nbsp;&nbsp;
													<spring:message
														code="export.inventory_management.stock_issue.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="inventoryStockIssueLocation" disabled="disabled">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${workLocationsList}">
																<option value="${location}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location}">${location}</option>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly="readonly" value="" 
															style="background-color: white;" id="inventoryStockIssueFrom"
															size="20" type="text"
															onfocus="callCalender('inventoryStockIssueFrom')"
															onclick="callCalender('inventoryStockIssueFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="inventoryStockIssueTo"
															size="20" type="text" 
															onfocus="callCalender('inventoryStockIssueTo')"
															onclick="callCalender('inventoryStockIssueTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div class="form-group col-lg-0 col-sm-0 columnpadding">
														<select class="form-control displaynone"
															style="display: none;" name="dealStatus"
															id="exportSkuMastertype">
															<option value=""><spring:message
																	code="export.select.file.type.label" /></option>
															<option value="1">JDA</option>
															<option value="0">CSV</option>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
												</div>
												<div
													class="form-group col-lg-4 col-sm-12 col-xs-12 columnpadding menuwidth">
													<div class=" col-lg-12 col-sm-6 col-xs-8 columnpadding">
														<!-- 	modal popup -->
														<div class="dialoginventory" style="display: none">
															<!--  <i class="fa fa-angle-up"></i> -->
															<div class="popupclass">
																<div class="col-lg-12 columnpadding "
																	style="padding-bottom: 7px">
																	<div class="form-group">
																		<div class="col-lg-5 marginpaddingpopup">FTP
																			Server</div>
																		<div class="col-lg-7 columnpadding">
																			<input type="text" class="form-control inputboxsize"
																				id="pwd">
																		</div>
																	</div>
																</div>
																<div class="col-lg-12 columnpadding"
																	style="padding-bottom: 7px">
																	<div class="form-group">
																		<div class="col-lg-5 marginpaddingpopup"
																			style="text-align: right;">Port</div>

																		<div class="col-lg-3 columnpadding">
																			<input type="text" class="form-control inputboxsize"
																				id="pwd">
																		</div>
																		<div class="col-lg-4 columnpadding">
																			<div class="checkbox" style="margin-top: 0px;">
																				<label><input type="checkbox" value="">SFTP</label>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="col-lg-12 columnpadding"
																	style="padding-bottom: 7px">
																	<div class="form-group">
																		<div class="col-lg-5 marginpaddingpopup">Login
																			ID</div>
																		<div class="col-lg-7 columnpadding">
																			<input type="text" class="form-control inputboxsize"
																				id="pwd">
																		</div>
																	</div>
																</div>
																<div class="col-lg-12 columnpadding"
																	style="padding-bottom: 7px">
																	<div class="form-group">
																		<div class="col-lg-5 marginpaddingpopup">
																			Password</div>
																		<div class="col-lg-7 columnpadding">
																			<input type="password"
																				class="form-control inputboxsize" id="pwd">
																		</div>
																	</div>
																</div>
															</div>
														</div>

														<div class="form-group col-lg-6 col-sm-6 columnpadding">
															<select class="form-control displaynone"
																name="dealStatus" id="dealStatus">
																<option value=""><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="1">JDA</option>
																<option value="0">CSV</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-6 col-sm-6 columnpadding">
															<select class="form-control displaynone"
																name="dealStatus" id="dealStatus">
																<option value=""><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="1">JDA</option>
																<option value="0">CSV</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
													</div>
													<%-- <div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div> --%>
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
												<!-- <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														class="inventory" name="inventory" id="inventoryStockRequest" value="StockRequest"
														
														onchange="enableFilesBrowse(this,'inventoryStockRequest','inventory');"
														
														 />&nbsp;&nbsp;&nbsp;
													<spring:message
														code="warehouse.stockrequests.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="inventoryStockRequestLocation" disabled="disabled">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${workLocationsList}">
																<option value="${location}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location}">${location}</option>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly="readonly" value=""
															style="background-color: white;"
															id="inventoryStockRequestFrom" size="20" type="text"
															onfocus="callCalender('inventoryStockRequestFrom')" 
															onclick="callCalender('inventoryStockRequestFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}" 															style="background-color: white;" id="inventoryStockRequestTo"
															size="20" type="text"
															onfocus="callCalender('inventoryStockRequestTo')"
															onclick="callCalender('inventoryStockRequestTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div class="form-group col-lg-0 col-sm-0 columnpadding">
														<select class="form-control displaynone" name="dealStatus"
															id="dealStatus">
															<option value=""><spring:message
																	code="export.select.file.type.label" /></option>
															<option value="1">JDA</option>
															<option value="0">CSV</option>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
												</div>
												<div
													class="form-group col-lg-4 col-sm-12 col-xs-12 columnpadding">
													<div class=" col-lg-12 col-sm-6 col-xs-8 columnpadding">
														<div class="form-group col-lg-6 col-sm-6 columnpadding">
															<select class="form-control displaynone"
																name="dealStatus" id="dealStatus">
																<option value=""><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="1">JDA</option>
																<option value="0">CSV</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-6 col-sm-6 columnpadding">
															<select class="form-control displaynone"
																name="dealStatus" id="dealStatus">
																<option value=""><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="1">JDA</option>
																<option value="0">CSV</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
													</div>
													<%-- <div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div> --%>
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
												<!-- <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="inventory" class="inventory" id="inventoryStockReturn" value="StockReturn" 
														onchange="enableFilesBrowse(this,'inventoryStockReturn','inventory');"
														
														/>&nbsp;&nbsp;&nbsp;
													<spring:message
														code="export.inventory_management.stock_return.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="inventoryStockReturnLocation" disabled="disabled">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${workLocationsList}">
																<option value="${location}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location}">${location}</option>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly="readonly" value=""
															style="background-color: white;" id="inventoryStockReturnFrom"
															size="20" type="text"
															onfocus="callCalender('inventoryStockReturnFrom')" 
															onclick="callCalender('inventoryStockReturnFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}" 
															style="background-color: white;" id="inventoryStockReturnTo"
															size="20" type="text"
															onfocus="callCalender('inventoryStockReturnTo')" 
															onclick="callCalender('inventoryStockReturnTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div class="form-group col-lg-0 col-sm-0 columnpadding">
														<select class="form-control displaynone" name="dealStatus"
															id="dealStatus">
															<option value=""><spring:message
																	code="export.select.file.type.label" /></option>
															<option value="1">JDA</option>
															<option value="0">CSV</option>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
												</div>
												<div
													class="form-group col-lg-4 col-sm-12 col-xs-12 columnpadding">
													<div class=" col-lg-12 col-sm-6 col-xs-8 columnpadding">
														<div class="form-group col-lg-6 col-sm-6 columnpadding">
															<select class="form-control displaynone"
																name="dealStatus" id="dealStatus">
																<option value=""><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="1">JDA</option>
																<option value="0">CSV</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-6 col-sm-6 columnpadding">
															<select class="form-control displaynone"
																name="dealStatus" id="dealStatus">
																<option value=""><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="1">JDA</option>
																<option value="0">CSV</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
													</div>
													<%-- <div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div> --%>
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
												<!-- <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="inventory" class="inventory" id="inventoryStockVerification" value="StockVerification"
														onchange="enableFilesBrowse(this,'inventoryStockVerification','inventory');"
														
														 />&nbsp;&nbsp;&nbsp;
													<spring:message code="outlet_stockverification.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="inventoryStockVerificationLocation" disabled="disabled">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${workLocationsList}">
																<option value="${location}"
																	${location == selectedLocation ? 'selected' : ''}
																	id="${location}">${location}</option>
															</c:forEach>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div
														class="form-group col-lg-5 col-sm-4 columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly="readonly" value=""
															style="background-color: white;"
															id="inventoryStockVerificationFrom" size="20" type="text"
															onfocus="callCalender('inventoryStockVerificationFrom')" disabled="disabled"
															onclick="callCalender('inventoryStockVerificationFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="inventoryStockVerificationTo"
															size="20" type="text"
															onfocus="callCalender('inventoryStockVerificationTo')" 
															onclick="callCalender('inventoryStockVerificationTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div class="form-group col-lg-0 col-sm-0 columnpadding">
														<select class="form-control displaynone" name="dealStatus"
															id="dealStatus">
															<option value=""><spring:message
																	code="export.select.file.type.label" /></option>
															<option value="1">JDA</option>
															<option value="0">CSV</option>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
												</div>
												<div
													class="form-group col-lg-4 col-sm-12 col-xs-12 columnpadding">
													<div class=" col-lg-12 col-sm-6 col-xs-8 columnpadding">
														<div class="form-group col-lg-6 col-sm-6 columnpadding">
															<select class="form-control displaynone"
																name="dealStatus" id="dealStatus">
																<option value=""><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="1">JDA</option>
																<option value="0">CSV</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-6 col-sm-6 columnpadding">
															<select class="form-control displaynone"
																name="dealStatus" id="dealStatus">
																<option value=""><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="1">JDA</option>
																<option value="0">CSV</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
													</div>
													<%-- <div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div> --%>
												</div>
												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="productMasterImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>
										</div>


									</div>
									<div class="col-lg-2 columnpadding"
										style="border-left: 1px solid #eee; padding-left: 5px;">
										<div class="col-lg-2"></div>
										<div class="col-lg-10">
											<div class="radio">
												<label><input type="radio" checked name="inventoryRadio" value="0">
												<spring:message code="export.run.at.once" /></label>
											</div>
											<div class="radio">
												<label><input type="radio" name="inventoryRadio">
												<spring:message code="export.run.as.batch" /></label>
											</div>
										</div>

										
									</div>

								</div>
								</c:if>

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
											<!--  <input type="checkbox" style="vertical-align: -3px"> -->
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

										<!-- <div class="col-lg-8 col-sm-6 col-xs-8" style="margin-bottom: -15px;">
  <br> -->
										<div class="col-lg-4 col-sm-3 col-xs-3"
											style="padding-right: 0px; margin-top: -2px">
											<label><spring:message code="week.days.label" /></label>
											<!-- <hr style="margin-top: -1px;width: 99%;">			   
			  -->
											<!-- </div> -->
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