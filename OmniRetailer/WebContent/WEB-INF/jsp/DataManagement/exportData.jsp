<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : 
 * file name		        : inventorymanager/retailoutlets/availableSrock.jsp
 * file type		        : JSP
 * description				: The new storage system form is displayed using this jsp
 * Modified By		        : Vijay
 * Modified Date 			: 17-01- 2018
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
	$(document).ready(function() {

		debugger
		
		/* $("input:checked").each(function() {
		$("#"+id+"From").attr("disabled","disabled");
		});
		 */
		
		 $('input:checkbox[id^="productCatelogue"]:not(:checked)').each(function () {
			
		
// 			 $('input:checkbox[id^="productCatelogue"]:checked').each(function(){
		/* 	 var id=$(this).attr("id");
			 $("#"+id+"From").removeAttr("disabled"); */
			
// 			 ($(this).attr("id")+"From").removeAttr("disabled");
			 callCalender($(this).attr("id")+"From");
			 callCalender($(this).attr("id")+"To");
			 	
			});
		 
	
		
		/*  $('input:checkbox[id^="productCatelogue"]:checked)').each(function () {
			 var id=$(this).attr("id");
			 $("#"+id+"From").removeAttr("disabled");
			 callCalender($(this).attr("id")+"From");
			 callCalender($(this).attr("id")+"To");
			 	
			});
		  */
		 
		 $('input:checkbox[id^="billing"]:not(:checked)').each(function () {
			 
			 
			 callCalender($(this).attr("id")+"From");
			 callCalender($(this).attr("id")+"To");
			
			});

		 $('input:checkbox[id^="outletCustomerOrders"]:not(:checked)').each(function () {
			 
			 callCalender($(this).attr("id")+"From");
			 callCalender($(this).attr("id")+"To");
			 
			});
 			$('input:checkbox[id^="shipments"]:not(:checked)').each(function () {
			 
			 callCalender($(this).attr("id")+"From");
			 callCalender($(this).attr("id")+"To");
			 
			});
		
 			$('input:checkbox[id^="inventory"]:not(:checked)').each(function () {
 				 
 				 callCalender($(this).attr("id")+"From");
 				 callCalender($(this).attr("id")+"To");
 				 	
 				});
 			$('input:checkbox[id^="dealsAndOffers"]:not(:checked)').each(function () {
 				 
 				 callCalender($(this).attr("id")+"From");
 				 callCalender($(this).attr("id")+"To");
 					
 				});
 			
 			$('input:checkbox[id^="loyaltyProgram"]:not(:checked)').each(function () {
				 
				 callCalender($(this).attr("id")+"From");
				 callCalender($(this).attr("id")+"To");
				 	
				});
 			$('input:checkbox[id^="CRM"]:not(:checked)').each(function () {
				 
				 callCalender($(this).attr("id")+"From");
				 callCalender($(this).attr("id")+"To");
				 	
				});
 			

			$(".subBlock").hide();
	
	
		
	});
	function activateHeader(id, open) {
		debugger;
		$(".subBlock").each(function() {
			$(this).slideUp("fast");
		});
		var headerImg = $("#" + id + "Img").attr("src");
		var subBlockOpened = false;
		if (headerImg.indexOf('right') != -1) {
			subBlockOpened = true;
		}
		var contextPath = $("#contextPath").val();
		var img = contextPath + "/images/leftHeaderIconGreen.png";
		$(".headerImg").each(function() {
			$(this).attr("src", img);
		});
		if (subBlockOpened == true) {
			return;
		}
		$("#" + id + "Img").attr("src",
				contextPath + "/images/rightHeaderIconGreen.png");
		$("." + id).slideDown("fast");
		
	}
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
					<div class="box-header" style="text-align: left;">
						<h3 class="box-title">
							<spring:message code="export.data.label" />
						</h3>
					</div>

					<div class="box-body">

						<div id="Error"
							style="text-align: center; color: red; font-weight: bold;"></div>

						<br>



						<div class="row form-group" style="">






							<!-- 	<div style="margin-top:111px;">
				<input type="button" id="edit" style="position: relative;float:right;margin-right: 2.8%;" class="btn bg-olive btn-inline" onclick="resetFiles();" value="Reset"/>
								  	<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;margin-right:1%;width: 68px;position: relative;float:right" onclick="importFiles();" value="Start" />
								 
								
								  	<input type="button" class="btn bg-olive btn-inline" style="margin-right: 0%;position: relative;float:right" onclick="validateImportPackage('new');" value="SAVE AS PACKAGE" />
								
			</div> -->

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
										onclick="activateHeader('productCatalogue');"
										id="productCatalogueImg" alt=""
										src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
									<div>

										<div class="col-lg-9"
											style="padding-left: 0px; padding-top: 37px;">
											<label style="font-size: 18px;"><spring:message
													code="product.catalogue.label" /></label>
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
										onclick="exportproductcatelouge(this);" value="Start" />
								</div>



							</div>
							<!-- dummy -->
							<div class="subBlock productCatalogue">
								<div class="row">
									<div class="form-group col-lg-12"	style="padding-left: 6%; padding-right: 5%">
										
									
											<div class="col-lg-5" style="padding-left: 0px;">
												<input type="checkbox" id="selectproductCatelogue"
													value="productCatelog" name = "productCatelogue"
													style="zoom: 1.5; margin-left: 0px; vertical-align: -4px;"
													onclick="selectAllExports(this,'productCatelogue')">
												<div
													style="display: inline-block; font-size: 14px; color: #666;">Select
													All</div>
											</div>

										
									</div>
								</div>


								<!-- dummy -->

								<div class="col-lg-10  columnpadding">
									<c:if test="${flow == 'outlet'}">
										<%--    <c:if test="${flow != 'outlet'}">
              <div class="row rowallignment">
                <div class="col-lg-12 columnallignment" style="">
             <!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
             	<div class="form-group col-lg-3 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" name="productCatelogue"  id="productCatelogueProductMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="product.master.label" />
             	</div>
             	<div class="col-lg-5  columnpadding menuallignment">
             	 <div class="form-group col-lg-4  columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option disabled selected><spring:message code="export.select.location.label"/></option>
 				<option value=""><spring:message code="all.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-5  columnpadding exportdate" >
                <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="fromProductMaster" size="20" type="text" onfocus="callCalender('fromProductMaster')" onclick="callCalender('fromProductMaster')" placeholder="Exported Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3  columnpadding enddate" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="toProductMaster" size="20" type="text" onfocus="callCalender('toProductMaster')" onclick="callCalender('toProductMaster')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
			
				</div>
             	<div class="form-group col-lg-4  col-xs-12 columnpadding menuwidth">
             		<div class=" col-lg-12  col-xs-8 columnpadding">
             			 <div class="form-group col-lg-4  columnpadding" >
                <select class="form-control" style="padding: 0px 3px;" name="dealStatus" id="dealStatus">
                <option disabled selected><spring:message code="export.exportType.label"/></option>
                                            <option value="1">Absolute</option>
                                            <option value="0">Incremental</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
	 			<div class="form-group col-lg-3  columnpadding" >
                <select class="form-control" style="padding: 0px 0px;" name="dealStatus" id="productcatelougefileType">
                <option disabled selected><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-5  columnpadding" >
                <select class="form-control" style="padding: 0px 3px;" name="dealStatus" id="exportModeproductcatelouge" onchange="viewftppopup(this,'productCatelogue')">
                <option disabled selected><spring:message code="export.export.mode.label"/></option>
                                            <option value="localdownload">Local Download</option>
                                            <option value="ftp">FTP</option>
                                              <option value="network">Network</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-0">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div></div> </c:if> --%>
										<!-- 	model popup -->


										<!-- 	model popup -->

										<div class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="productCatelogue" id="productCatelogueSkuMasters"
														oninput="enableFilesBrowse(this,'productCatelogueSkuMasters','productCatelogue');"
														onchange="enableFilesBrowse(this,'productCatelogueSkuMasters','productCatelogue');" />&nbsp;&nbsp;&nbsp;
													<spring:message code="sku.master.label" />

												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" disabled
															id="productCatelogueSkuMastersLocation">
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
															 value="" style="background-color: white;"
															id="productCatelogueSkuMastersFrom" size="20" type="text"
															onfocus="callCalender('productCatelogueSkuMastersFrom')" 
															onclick="callCalender('productCatelogueSkuMastersFrom')" 
															placeholder="Exported Date" readonly="readonly" /> <span
															id="dealEndDateError" 
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueSkuMastersTo" size="20" type="text"
															onfocus="callCalender('productCatelogueSkuMastersTo')"
															onclick="callCalender('productCatelogueSkuMastersTo')"  readonly="readonly"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<%--  <div class="form-group col-lg-0 col-sm-0 columnpadding" >
                <select class="form-control displaynone" disabled style="display:none;" name="productCatelogueFileType" id="productCatelogueFileType">
                <option value="" ><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option selected value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>  --%>
												</div>
												<c:if test="${flow =='outlet'}">
													<div
														class="form-group col-lg-4  col-xs-12 columnpadding menuwidth">
														<div class=" col-lg-12  col-xs-8 columnpadding">
															<div class="form-group col-lg-4  columnpadding">
																<select class="form-control" disabled
																	style="padding: 0px 3px;"
																	name="productCatelogueExportType"
																	id="productCatelogueExportType">
																	<option disabled selected><spring:message
																			code="export.exportType.label" /></option>
																	<option selected value="1">Absolute</option>
																	<option value="0">Incremental</option>
																</select> <span id="dealStatusError"
																	style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
															</div>
															<div class="form-group col-lg-3  columnpadding">
																<select class="form-control" disabled
																	style="padding: 0px 0px;"
																	name="productCatelogueFileType"
																	id="productCatelogueFileType">
																	<option disabled selected><spring:message
																			code="export.select.file.type.label" /></option>
																	<option  value="1">JDA</option>
																	<option value="0">CSV</option>
																</select> <span id="dealStatusError"
																	style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
															</div>
															<div class="form-group col-lg-5  columnpadding">
																<select class="form-control" disabled
																	style="padding: 0px 3px;" name="dealStatus"
																	id="productCatelogueExportMode"
																	onchange="viewftppopup(this,'productCatelogue')">
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
														<%-- <div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div> --%>
													</div>
												</c:if>
												<c:if test="${flow != 'outlet'}">
													<div
														class="form-group col-lg-4 col-sm-12 col-xs-12 columnpadding menuwidth">
														<div class=" col-lg-12 col-sm-6 col-xs-8 columnpadding">
															<!-- 	modal popup -->
															<div class="dialogproductCatelogue" style="display: none">
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
												</c:if>
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
										<div id="suppliersProductCatelog" class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!-- <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="productCatelogue" value="productCatelogueSuppliers"
														oninput="enableFilesBrowse(this,'productCatelogueSuppliers','productCatelogue');"
														onchange="enableFilesBrowse(this,'productCatelogueSuppliers','productCatelogue');"
														id="productCatelogueSuppliers" />&nbsp;&nbsp;&nbsp;
													<spring:message code="product.secondary.supplier.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="productCatelogueSuppliersLocation"
															disabled="disabled">
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
															readonly value="" style="background-color: white;"
															id="productCatelogueSuppliersFrom" size="20" type="text"
															onfocus="callCalender('productCatelogueSuppliersFrom')" disabled 
															onclick="callCalender('productCatelogueSuppliersFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueSuppliersTo" size="20" type="text"
															onfocus="callCalender('productCatelogueSuppliersTo')" 
															onclick="callCalender('productCatelogueSuppliersTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>

												</div>

												<div
													class="form-group col-lg-4  col-xs-12 columnpadding menuwidth">
													<div class=" col-lg-12  col-xs-8 columnpadding">
														<div class="form-group col-lg-4  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																disabled name="productCatelogueExportType"
																id="productCatelogueExportType">
																<option disabled><spring:message
																		code="export.exportType.label" /></option>
																<option selected value="1">Absolute</option>
																<option value="0">Incremental</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-3  columnpadding">
															<select class="form-control" style="padding: 0px 0px;"
																disabled name="dealStatus" id="productCatelogueFileType">
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
																id="productCatelogueExportMode"
																onchange="viewftppopup(this,'productCatelogue')">
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
									<c:if test="${flow == 'warehouse'}">
										<div class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="productCatelogue" id="productCatelogueSkuMaster" 
														onchange="enableFilesBrowse(this,'productCatelogueSkuMaster','productCatelogue');"
														/>&nbsp;&nbsp;&nbsp;
													<spring:message code="warehouse.sku.master" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="productCatelogueSkuMasterLocation" disabled="disabled">
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
															style="background-color: white;" id="productCatelogueSkuMasterFrom"
															size="20" type="text"
															onfocus="callCalender('productCatelogueSkuMasterFrom')"
															onclick="callCalender('productCatelogueSkuMasterFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="productCatelogueSkuMasterTo"
															size="20" type="text"
															onfocus="callCalender('productCatelogueSkuMasterTo')" 
															onclick="callCalender('productCatelogueSkuMasterTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>

												</div>
												<c:if test="${flow == 'warehouse'}">
													<div
														class="form-group col-lg-4  col-xs-12 columnpadding menuwidth">
														<div class=" col-lg-12  col-xs-8 columnpadding">
															<div class="form-group col-lg-4  columnpadding">
																<select class="form-control" style="padding: 0px 3px;"
																	name="productCatelogueExportType" disabled="disabled" id="productCatelogueExportType">
																	<option disabled selected><spring:message
																			code="export.exportType.label" /></option>
																	<option value="1">Absolute</option>
																	<option value="0">Incremental</option>
																</select> <span id="dealStatusError"
																	style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
															</div>
															<div class="form-group col-lg-3  columnpadding">
																<select class="form-control" style="padding: 0px 0px;"
																	name="productCatelougeFileType" disabled="disabled" id="productCatelogueFileType">
																	<option disabled selected><spring:message
																			code="export.select.file.type.label" /></option>
																	<option value="1">JDA</option>
																	<option value="0">CSV</option>
																</select> <span id="dealStatusError"
																	style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
															</div>
															<div class="form-group col-lg-5  columnpadding">
																<select class="form-control" style="padding: 0px 3px;"
																	name="productCatelogueExportMode"  disabled="disabled" id="productCatelogueExportMode"
																	onchange="viewftppopup(this,'productCatelogue')">
																	<option disabled selected><spring:message
																			code="export.export.mode.label" /></option>
																	<option value="localdownload">Local Download</option>
																	<option value="ftp">FTP</option>
																	<option value="network">Network</option>
																</select> <span id="dealStatusError"
																	style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
															</div>
														</div>
														<%-- <div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div> --%>
													</div>
												</c:if>
												<%-- <div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-12 col-sm-6 col-xs-8 columnpadding">
	 			<div class="form-group col-lg-6 col-sm-6 columnpadding" >
                <select class="form-control displaynone" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-6 col-sm-6 columnpadding" >
                <select class="form-control displaynone" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div> --%>
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
														name="productCatelogue" id="productCatelogueTaxMaster"
														oninput="enableFilesBrowse(this,'productCatelogueTaxMaster','productCatelogue');"
														onchange="enableFilesBrowse(this,'productCatelogueTaxMaster','productCatelogue');" />&nbsp;&nbsp;&nbsp;
													<spring:message code="data.export.Stockreceipt" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select disabled class="form-control form-group"
															id="productCatelogueTaxMasterLocation">
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
															readonly value="" style="background-color: white;"
															id="productCatelogueTaxMasterFrom" size="20" type="text"
															onfocus="callCalender('productCatelogueTaxMasterFrom')" 
															onclick="callCalender('productCatelogueTaxMasterFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueTaxMasterTo" size="20" type="text"
															onfocus="callCalender('productCatelogueTaxMasterTo')" 
															onclick="callCalender('productCatelogueTaxMasterTo')"
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
												<c:if test="${flow =='generic'}">
													<div
														class="form-group col-lg-4 col-sm-12 col-xs-12 columnpadding menuwidth">
														<div class=" col-lg-12 col-sm-6 col-xs-8 columnpadding">
															<!-- 	modal popup -->
															<div class="dialogproductCatelogue" style="display: none">
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
												</c:if>
												<%-- <div class="form-group col-lg-4 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-12 col-sm-6 col-xs-8 columnpadding">
	 			<div class="form-group col-lg-6 col-sm-6 columnpadding" >
                <select class="form-control displaynone" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-6 col-sm-6 columnpadding" >
                <select class="form-control displaynone" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div> --%>
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
														name="productCatelogue" id="productCatelogueBrandMaster"
														oninput="enableFilesBrowse(this,'productCatelogueBrandMaster','productCatelogue');"
														onchange="enableFilesBrowse(this,'productCatelogueBrandMaster','productCatelogue');" />&nbsp;&nbsp;&nbsp;
													<spring:message code="data.export.brandmaster" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" disabled
															id="productCatelogueBrandMasterLocation">
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
															readonly value="" style="background-color: white;"
															id="productCatelogueBrandMasterFrom" size="20"
															type="text"
															onfocus="callCalender('productCatelogueBrandMasterFrom')"
															onclick="callCalender('productCatelogueBrandMasterFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueBrandMasterTo" size="20" type="text"
															onfocus="callCalender('productCatelogueBrandMasterTo')" 
															onclick="callCalender('productCatelogueBrandMasterTo')"
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
									</c:if>
									<c:if test="${flow != 'generic'}">
										<div class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
													
														name="productCatelogue" id="productCatelogueGroupMaster" onchange="enableFilesBrowse(this,'productCatelogueGroupMaster','productCatelogue');"
														oninput="enableFilesBrowse(this,'productCatelogueGroupMaster','productCatelogue');" />&nbsp;&nbsp;&nbsp;
													<spring:message code="import.group.master.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"  id="productCatelogueGroupMasterLocation" disabled="disabled">
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
															style="background-color: white;" id="productCatelogueGroupMasterFrom"
															size="20" type="text"
															onfocus="callCalender('productCatelogueGroupMasterFrom')" 
															onclick="callCalender('productCatelogueGroupMasterFrom')"
															readonly
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}" 
															style="background-color: white;" id="productCatelogueGroupMasterTo"
															size="20" type="text"
															readonly
															onfocus="callCalender('productCatelogueGroupMasterTo')"
															onclick="callCalender('productCatelogueGroupMasterTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
												<%-- 	<div class="form-group col-lg-0 col-sm-0 columnpadding">
														<select class="form-control displaynone" name="dealStatus"
															id="dealStatus">
															<option value=""><spring:message
																	code="export.select.file.type.label" /></option>
															<option value="1">JDA</option>
															<option value="0">CSV</option>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div> --%>
												</div>
												<div
													class="form-group col-lg-4 col-sm-12 col-xs-12 columnpadding menuwidth">
													<div class=" col-lg-12 col-sm-6 col-xs-8 columnpadding">
														<!-- 	modal popup -->
														<div class="dialogproductCatelogue" style="display: none">
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
												<%-- <div class="form-group col-lg-4 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-12 col-sm-6 col-xs-8 columnpadding">
	 			<div class="form-group col-lg-6 col-sm-6 columnpadding" >
                <select class="form-control displaynone" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-6 col-sm-6 columnpadding" >
                <select class="form-control displaynone" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div> --%>
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
														name="productCatelogue" id="productCatelogueSKUEAN" 
														onchange = "enableFilesBrowse(this,'productCatelogueSKUEAN','productCatelogue');"
														 />&nbsp;&nbsp;&nbsp;
													<spring:message code="import.sku.eans.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" id="productCatelogueSKUEANLocation" disabled = "disabled" >
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
															style="background-color: white;" id="productCatelogueSKUEANFrom"
															size="20" type="text"
															onfocus="callCalender('productCatelogueSKUEANFrom')" 
															onclick="callCalender('productCatelogueSKUEANFrom')" 
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="productCatelogueSKUEANTo" size="20"
															type="text" onfocus="callCalender('productCatelogueSKUEANTo')" 
															onclick="callCalender('productCatelogueSKUEANTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
												<%-- 	<div class="form-group col-lg-0 col-sm-0 columnpadding">
														<select class="form-control displaynone" name="dealStatus"
															id="dealStatus">
															<option value=""><spring:message
																	code="export.select.file.type.label" /></option>
															<option value="1">JDA</option>
															<option value="0">CSV</option>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div> --%>
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
									</c:if>


									<c:if test="${flow != 'generic'}">
										<div class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!--   <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="productCatelogue" id="productCatelogueSKUPriceList" 
														onchange = "enableFilesBrowse(this,'productCatelogueSKUPriceList','productCatelogue');"/>&nbsp;&nbsp;&nbsp;
													<spring:message code="skupriceList.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" id="productCatelogueSKUPriceListLocation" disabled = "disabled">
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
															style="background-color: white;" id="productCatelogueSKUPriceListFrom"
															size="20" type="text"
															onfocus="callCalender('productCatelogueSKUPriceListFrom')" 
															onclick="callCalender('productCatelogueSKUPriceListFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="productCatelogueSKUPriceListTo"
															size="20" type="text"
															onfocus="callCalender('productCatelogueSKUPriceListTo')"
															onclick="callCalender('productCatelogueSKUPriceListTo')" 
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<%-- <div class="form-group col-lg-0 col-sm-0 columnpadding">
														<select class="form-control displaynone" name="dealStatus"
															id="dealStatus">
															<option value=""><spring:message
																	code="export.select.file.type.label" /></option>
															<option value="1">JDA</option>
															<option value="0">CSV</option>
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div> --%>
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
																		code="export.export.mode.label" /></option>
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
									</c:if>

									<div class="row rowallignment">
										<c:if test="${flow == 'generic'}">
											<div class="col-lg-12 columnallignment" style="">
												<!--   <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="productCatelogue" id="productCatelogueDepartments"
														oninput="enableFilesBrowse(this,'productCatelogueDepartments','productCatelogue');"
														onchange="enableFilesBrowse(this,'productCatelogueDepartments','productCatelogue');"/ >&nbsp;&nbsp;&nbsp;
													<spring:message code="import.departments.master.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" disabled
															id="productCatelogueDepartmentsLocation">
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
															readonly value="" style="background-color: white;"
															id="productCatelogueDepartmentsFrom" size="20"
															type="text"
															onfocus="callCalender('productCatelogueDepartmentsFrom')" 
															onclick="callCalender('productCatelogueDepartmentsFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly value="${hotDealsList.endDateStr}"
															style="background-color: white;"
															id="productCatelogueDepartmentsTo" size="20" type="text"
															onfocus="callCalender('productCatelogueDepartmentsTo')" 
															onclick="callCalender('productCatelogueDepartmentsTo')"
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
																		code="export.export.mode.label" /></option>
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
										</c:if>
									</div>

								</div>
								<div class="col-lg-2 columnpadding"
									style="border-left: 1px solid #eee; padding-left: 5px;">
									<div class="col-lg-2"></div>
									<div class="col-lg-10">
										<div class="radio">
											<label><input type="radio" checked value="0"  name="productCatelogRadio">
											<spring:message code="export.run.at.once" /></label>
										</div>
										<div class="radio">
											<label><input type="radio" name="productCatelogRadio" value="1">
											<spring:message code="export.run.as.batch" /></label>
										</div>
									</div>

									<%-- <div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
										style="padding-top: 3.3cm;">
										<input type="button" id="edit"
											class="btn bg-olive btn-inline browsebutton"
											onclick="exportproductcatelouge(this)"
											value="<spring:message code="export.startexport.label" />" />
									</div>
									<div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
										style="padding-top: 3.3cm;">
										<input type="button" id="edit"
											class="btn bg-olive btn-inline browsebutton"
											onclick="activateHeader('productCatalogue');resetOnName('productCatelogue');" value="Cancel" />
									</div> --%>
								</div>
							</div>
							<!--  productCatelogue end -->
							<!-- added by kalyan above  -->

							<div class="row" style="padding-left: 6%; padding-right: 0%">
								<c:if test="${flow == 'outlet'}">
									<div class="form-group col-lg-10"
										style="border-bottom: 1px solid #d2d6de; padding-left: 0px; padding-right: 0px; width: 82%;">
										<img class="headerImg"
											style="float: right; cursor: pointer; margin-right: -5px; margin-top: 2px; margin-bottom: -26px;"
											onclick="activateHeader('billing');" id="billingImg" alt=""
											src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
										<div>
											<div class="col-lg-8"
												style="padding-left: 0px; padding-top: 8px;">
												<label style="font-size: 18px;"><spring:message
														code="billing.label" /></label>
											</div>
											<div class="col-lg-4"
												style="float: right; padding-right: 0px;"></div>
											<%-- <img class="headerImg" style="float: right;cursor: pointer;margin-right: -5px;margin-top: 2px;margin-bottom: -26px;" onclick="activateHeader('billing');" id="billingImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png"> --%>
										</div>
									</div>
									<div class="form-group col-lg-1 "
										style="width: 9%; padding-left: 20px;">
										<input type="button" id="edit"
											class="btn bg-olive btn-inline reset-button"
											onclick="resetOnName('billing');" value="Reset" />
									</div>
									<div class="form-group col-lg-1 " style="width: 9%;">
										<input type="button" id="edit"
											class="btn bg-olive btn-inline start-button" style=""
											onclick="exportBills(this);" value="Start" />
									</div>



								</c:if>
							</div>

							<!-- dummy -->
							<div class="billing subBlock">
								<c:if test="${flow == 'outlet'}">
									<div class="row">

										<div class="form-group col-lg-12"
											style="padding-left: 6%; padding-right: 5%">
											<div class="col-lg-5" style="padding-left: 0px;">
												<input type="checkbox" id="selectbilling" name="billing"
													style="zoom: 1.5; margin-left: 0px; vertical-align: -4px;"
													onclick="selectAllExports(this,'billing')">
												<div
													style="display: inline-block; font-size: 14px; color: #666;">Select	All</div>
											</div>

										</div>
									</div>
								</c:if>

								<c:if test="${flow == 'outlet'}">
									<div class="col-lg-10  columnpadding">

										<div class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="billing" id="billingAll"
															oninput="enableFilesBrowse(this,'billingAll','billing');"
															onchange="enableFilesBrowse(this,'billingAll','billing');">&nbsp;&nbsp;&nbsp;
													
													<spring:message code="export.billing.completed_bills.label" />
												</div>
												<div class="col-lg-5  columnpadding menuallignment">
													<div class="form-group col-lg-4  columnpadding">
														<select class="form-control form-group" id="billingAllLocation" disabled="disabled">
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
															style="background-color: white;" id="billingAllFrom"
															size="20" type="text"
															onfocus="callCalender('billingAllFrom')" 
															onclick="callCalender('billingAllFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div class="form-group col-lg-3  columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="billingAllTo"
															size="20" type="text"
															onfocus="callCalender('billingAllTo')" 
															onclick="callCalender('billingAllTo')"
															placeholder="End Date" /> <span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>

												</div>
												<div
													class="form-group col-lg-4  col-xs-12 columnpadding menuwidth">
													<div class=" col-lg-12  col-xs-8 columnpadding">
														<div class="form-group col-lg-4  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																name="dealStatus" id="billingExportType" disabled="disabled" >
																<option disabled selected><spring:message code="export.exportType.label"  /></option>
																<option value="1">Absolute</option>
																<option value="0">Incremental</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-3  columnpadding">
															<select class="form-control" style="padding: 0px 0px;"
																name="dealStatus" id="billingFileType" disabled="disabled">
																<option disabled selected><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="JDA">JDA</option>
																<option value="CSV">CSV</option>
																<option value="TALLY">Tally</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-5  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																name="dealStatus" id="billingExportMode" disabled="disabled"
																onchange="viewftppopup(this,'billing')">
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
														style="width: 30px" id="billingImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>
										</div>

										<!-- 	model popup -->
										<div class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!-- <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="billing" id="billingReturned" 
															oninput="enableFilesBrowse(this,'billingReturned','billing');"
															onchange="enableFilesBrowse(this,'billingReturned','billing');">&nbsp;&nbsp;&nbsp;
														
														
													<spring:message code="export.billing.returned_bills.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" disabled="disabled" id="billingReturnedLocation">
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
															style="background-color: white;" id="billingReturnedFrom"
															size="20" type="text"
															onfocus="callCalender('billingReturnedFrom');" 
															onclick="callCalender('billingReturnedFrom');"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="billingReturnedTo"
															size="20" type="text"
															onfocus="callCalender('billingReturnedTo')" 
															onclick="callCalender('billingReturnedTo')"
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
													class="form-group col-lg-4 col-sm-12 col-xs-12 columnpadding menuwidth">
													<div class=" col-lg-12 col-sm-6 col-xs-8 columnpadding">
														<div class="dialogbilling" style="display: none">
															<!--  <i class="fa fa-angle-up"></i> -->
															<div class="popupclass">
																<div class="col-lg-12 columnpadding "
																	style="padding-bottom: 7px">
																	<div class="form-group">
																		<div class="col-lg-5 marginpaddingpopup">FTP
																			Server</div>
																		<div class="col-lg-7 columnpadding">
																			<input type="text" class="form-control inputboxsize"
																				id="ftpserverbilling">
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
																				id="portbilling">
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
																				id="loginidbilling">
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
																				class="form-control inputboxsize"
																				id="passwordbilling">
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
												<%-- <div class="form-group col-lg-4 col-sm-12 col-xs-12 columnpadding menuwidth">
             		<div class=" col-lg-12 col-sm-6 col-xs-8 columnpadding">
             	<!-- 	modal popup -->
             	        <div class="dialogoutlet_customerorders" style="display:none">
            <!--  <i class="fa fa-angle-up"></i> -->
            <div class="popupclass">
    			 <div class="col-lg-12 columnpadding " style="padding-bottom:7px">
            <div class="form-group">
             <div class="col-lg-5 marginpaddingpopup">
              FTP Server
             </div>
              <div class="col-lg-7 columnpadding">
              <input type="text" class="form-control inputboxsize" id="pwd">
              </div>
					</div>
            </div>
              <div class="col-lg-12 columnpadding" style="padding-bottom:7px">
                <div class="form-group">
                 <div class="col-lg-5 marginpaddingpopup"style="text-align: right;;">
 				 Port
					</div>
            
              <div class="col-lg-3 columnpadding">
              <input type="text" class="form-control inputboxsize" id="pwd">
              </div>
               <div class="col-lg-4 columnpadding">
               <div class="checkbox" style="    margin-top: 0px;">
  				<label><input type="checkbox" value="">SFTP</label>
				</div>
               </div>
            </div>
            </div>
               <div class="col-lg-12 columnpadding" style="padding-bottom:7px">
            <div class="form-group">
             <div class="col-lg-5 marginpaddingpopup">
             Login ID
             </div>
              <div class="col-lg-7 columnpadding">
              <input type="text" class="form-control inputboxsize" id="pwd">
              </div>
					</div>
            </div>
              <div class="col-lg-12 columnpadding" style="padding-bottom:7px">
            <div class="form-group">
             <div class="col-lg-5 marginpaddingpopup">
              Password
             </div>
              <div class="col-lg-7 columnpadding">
              <input type="password" class="form-control inputboxsize" id="pwd">
              </div>
					</div>
            </div>
  				
			</div>		
			</div>	
             		
	 			<div class="form-group col-lg-6 col-sm-6 columnpadding" >
                <select class="form-control displaynone" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-6 col-sm-6 columnpadding" >
                <select class="form-control displaynone" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div> --%>
												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="billingImg"
														src="${pageContext.request.contextPath}/images/circleWait.gif">
													</span>
												</div>
											</div>
										</div>

										<!-- 	model popup -->

										<div class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="billing" id="billingCancelled"
														
														oninput="enableFilesBrowse(this,'billingCancelled','billing');"
															onchange="enableFilesBrowse(this,'billingCancelled','billing');"
														 />&nbsp;&nbsp;&nbsp;
													<spring:message code="export.billing.cancelled_bills.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="billingCancelledLocation" disabled="disabled">
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
															style="background-color: white;" id="billingCancelledFrom"
															size="20" type="text"
															onfocus="callCalender('billingCancelledFrom')" 
															onclick="callCalender('billingCancelledFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="billingCancelledTo"
															size="20" type="text"
															onfocus="callCalender('billingCancelledTo')" 
															onclick="callCalender('billingCancelledTo')"
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
														<!-- <div class="dialogbilling" style="display:none">
             <i class="fa fa-angle-up"></i>
            <div class="popupclass">
    			 <div class="col-lg-12 columnpadding " style="padding-bottom:7px">
            <div class="form-group">
             <div class="col-lg-5 marginpaddingpopup">
              FTP Server
             </div>
              <div class="col-lg-7 columnpadding">
              <input type="text" class="form-control inputboxsize" id="ftpserverbilling">
              </div>
					</div>
            </div>
              <div class="col-lg-12 columnpadding" style="padding-bottom:7px">
                <div class="form-group">
                 <div class="col-lg-5 marginpaddingpopup"style="text-align: right;;">
 				 Port
					</div>
            
              <div class="col-lg-3 columnpadding">
              <input type="text" class="form-control inputboxsize" id="portbilling">
              </div>
               <div class="col-lg-4 columnpadding">
               <div class="checkbox" style="    margin-top: 0px;">
  				<label><input type="checkbox" value="">SFTP</label>
				</div>
               </div>
            </div>
            </div>
               <div class="col-lg-12 columnpadding" style="padding-bottom:7px">
            <div class="form-group">
             <div class="col-lg-5 marginpaddingpopup">
             Login ID
             </div>
              <div class="col-lg-7 columnpadding">
              <input type="text" class="form-control inputboxsize" id="loginidbilling">
              </div>
					</div>
            </div>
              <div class="col-lg-12 columnpadding"  style="padding-bottom:7px">
            <div class="form-group">
             <div class="col-lg-5 marginpaddingpopup">
              Password
             </div>
              <div class="col-lg-7 columnpadding">
              <input type="password"  class="form-control inputboxsize" id="passwordbilling">
              </div>
					</div>
            </div>
  				
			</div>		
			</div>	 -->

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
														name="billing" id="billingExchanged" 
														oninput="enableFilesBrowse(this,'billingExchanged','billing');"
															onchange="enableFilesBrowse(this,'billingExchanged','billing');"
														
														/>&nbsp;&nbsp;&nbsp;
													<spring:message code="export.billing.exchanged_bills.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="billingExchangedLocation" disabled="disabled">
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
															style="background-color: white;" id="billingExchangedFrom"
															size="20" type="text"
															onfocus="callCalender('billingExchangedFrom')" 
															onclick="callCalender('billingExchangedFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="billingExchangedTo"
															size="20" type="text"
															onfocus="callCalender('billingExchangedTo')" 
															onclick="callCalender('billingExchangedTo')"
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
														name="billing" id="billingCompleted" 
														oninput="enableFilesBrowse(this,'billingCompleted','billing');"
															onchange="enableFilesBrowse(this,'billingCompleted','billing');"
														
														/>&nbsp;&nbsp;&nbsp;
													<spring:message code="data.export.CompletedBills" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="billingCompletedLocation" disabled="disabled">
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
															style="background-color: white;" id="billingCompletedFrom"
															size="20" type="text"
															onfocus="callCalender('billingCompletedFrom')"
															onclick="callCalender('billingCompletedFrom')" 
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="billingCompletedTo"
															size="20" type="text"
															onfocus="callCalender('billingCompletedTo')"
															onclick="callCalender('billingCompletedTo')" 
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
														name="billing" id="billingPending" 
														oninput="enableFilesBrowse(this,'billingPending','billing');"
															onchange="enableFilesBrowse(this,'billingPending','billing');"
														
														/>&nbsp;&nbsp;&nbsp;
														
													<spring:message code="export.billing.pending_bills.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="billingPendingLocation" disabled="disabled">
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
														<input class="form-control calendar_icon form-group endDateHotdeal"
															readonly="readonly" value=""
															style="background-color: white;" id="billingPendingFrom"
															size="20" type="text"
															onfocus="callCalender('billingPendingFrom')" 
															onclick="callCalender('billingPendingFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}" 
															style="background-color: white;" id="billingPendingTo"
															size="20" type="text"
															onfocus="callCalender('billingPendingTo')"
															onclick="callCalender('billingPendingTo')"
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
																name="dealStatus" id="billingExportType">
																<option value=""><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="1">JDA</option>
																<option value="0">CSV</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-6 col-sm-6 columnpadding">
															<select class="form-control displaynone"
																name="dealStatus" id="billingFileType">
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
														style="width: 30px" id="billingImg"
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
												<label><input type="radio" checked  value="0" name="billingRadio">
												<spring:message code="export.run.at.once" /></label>
											</div>
											<div class="radio">
												<label><input type="radio"  value="1" name="billingRadio">
												<spring:message code="export.run.as.batch" /></label>
											</div>
										</div>

										<%-- <div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
											style="padding-top: 3.3cm;">
											<input type="button" id="edit"
												class="btn bg-olive btn-inline browsebutton"
												onclick="exportBills(this);"
												value="<spring:message code="export.startexport.label" />" />
										</div>
										<div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
											style="padding-top: 3.3cm;">
											<input type="button" id="edit"
												class="btn bg-olive btn-inline browsebutton"
												onclick="activateHeader('billing');resetOnName('billing');" value="Cancel"/>
										</div> --%>
									</div>
								</c:if>
							</div>
							<c:if test="${flow != 'generic'}">
								<div class="row" style="padding-left: 6%; padding-right: 0%">
									<div class="form-group col-lg-10"
										style="border-bottom: 1px solid #d2d6de; padding-left: 0px; padding-right: 0px; width: 82%;">
										<img class="headerImg"
											style="float: right; cursor: pointer; margin-right: -8px; margin-top: 3px; margin-bottom: -26px;"
											onclick="activateHeader('customerOrders');"
											id="customerOrdersImg" alt=""
											src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
										<div>
											<div class="col-lg-8"
												style="padding-left: 0px; padding-top: 8px;">
												<label style="font-size: 18px;"><spring:message
														code="outlet_customerorders.label" /></label>
											</div>
											<div class="col-lg-4"
												style="float: right; padding-right: 0px;"></div>
											<!-- 	<div class="form-group col-lg-12 " style="">
               
            </div>  -->
										</div>
									</div>
									<div class="form-group col-lg-1 "
										style="width: 9%; padding-left: 20px;">
										<input type="button" id="edit"
											class="btn bg-olive btn-inline reset-button"
											onclick="resetOnName('outletCustomerOrders');" value="Reset" />
									</div>
									<div class="form-group col-lg-1 " style="width: 9%;">
										<input type="button" id="edit"
											class="btn bg-olive btn-inline start-button" style=""
											onclick="exportCustomerOrders(ele);" value="Start" />
									</div>



								</div>


								<!-- dummy -->
								<div class="customerOrders subBlock">
									<div class="row">
										<div class="form-group col-lg-12"
											style="padding-left: 6%; padding-right: 5%">
											<div class="col-lg-5" style="padding-left: 0px;">
												<input type="checkbox"
													style="zoom: 1.5; margin-left: 0px; vertical-align: -4px;"
													name="outletCustomerOrders" id="selectoutletCustomerOrders"onclick="selectAllExports(this,'outletCustomerOrders')">
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
														name="outletCustomerOrders" id="outletCustomerOrdersNewOrders" 
														oninput="enableFilesBrowse(this,'outletCustomerOrdersNewOrders','outletCustomerOrders');"
														onchange="enableFilesBrowse(this,'outletCustomerOrdersNewOrders','outletCustomerOrders');"
														/>&nbsp;&nbsp;&nbsp;
													<spring:message
														code="export.customer_orders.new_orders.label" />
												</div>
												<div class="col-lg-5  columnpadding menuallignment">
													<div class="form-group col-lg-4  columnpadding">
														<select class="form-control form-group" id="outletCustomerOrdersNewOrdersLocation" disabled="disabled">
															<option disabled selected><spring:message
																	code="export.select.location.label" /></option>
															<option value=""><spring:message
																	code="all.label" /></option>
															<c:forEach var="location" items="${workLocationsList}">
															
																<option value="${location}"${location == selectedLocation ? 'selected' : ''}
																	id="${location}">${location}</option>
															</c:forEach>
															
														</select> <span id="dealStatusError"
															style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
													</div>
													<div class="form-group col-lg-5  columnpadding exportdate">
														<input class="form-control calendar_icon form-group"
															readonly="readonly" value=""
															style="background-color: white;" id="outletCustomerOrdersNewOrdersFrom" size="20"
															type="text" onfocus="callCalender('outletCustomerOrdersNewOrdersFrom')" 
															onclick="callCalender('outletCustomerOrdersNewOrdersFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div class="form-group col-lg-3  columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="outletCustomerOrdersNewOrdersTo" size="20"
															type="text" onfocus="callCalender('outletCustomerOrdersNewOrdersTo')"
															onclick="callCalender('outletCustomerOrdersNewOrdersTo')" placeholder="End Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>

												</div>
												<div
													class="form-group col-lg-4  col-xs-12 columnpadding menuwidth">
													<div class=" col-lg-12  col-xs-8 columnpadding">
														<div class="form-group col-lg-4  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																name="dealStatus" id="outletCustomerOrdersExportType" disabled="disabled">
																<option disabled selected><spring:message
																		code="export.exportType.label" /></option>
																<option value="1">Absolute</option>
																<option value="0">Incremental</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-3  columnpadding">
															<select class="form-control" style="padding: 0px 0px;"
																name="dealStatus" id="outletCustomerOrdersFileType" disabled="disabled">
																<option disabled selected><spring:message
																		code="export.select.file.type.label" /></option>
																<option value="1">JDA</option>
																<option value="0">CSV</option>
															</select> <span id="dealStatusError"
																style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
														</div>
														<div class="form-group col-lg-5  columnpadding">
															<select class="form-control" style="padding: 0px 3px;"
																name="dealStatus" id="outletCustomerOrdersExportMode" disabled="disabled"
																onchange="viewftppopup(this,'outlet_customerorders')">
																<option disabled selected><spring:message
																		code="export.export.mode.label" /></option>
																<option value="localdownload">Local Download</option>
																<option value="ftp">FTP</option>
																<option value="network">Network</option>
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
										<!-- 	model popup -->


										<!-- 	model popup -->

										<div class="row rowallignment">
											<div class="col-lg-12 columnallignment" style="">
												<!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"
														name="outletCustomerOrders" id="outletCustomerOrdersPendingOrders" 
														onchange="enableFilesBrowse(this,'outletCustomerOrdersPendingOrders','outletCustomerOrders');"
														/>&nbsp;&nbsp;&nbsp;
													<spring:message
														code="export.customer_orders.pending_orders.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="outletCustomerOrdersPendingOrdersLocation" disabled="disabled">
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
															style="background-color: white;" id="outletCustomerOrdersPendingOrdersFrom" size="20"
															type="text" onfocus="callCalender('outletCustomerOrdersPendingOrdersFrom')" 
															onclick="callCalender('outletCustomerOrdersPendingOrdersFrom')" placeholder="Exported Date" />
														<span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="outletCustomerOrdersPendingOrdersTo" size="20"
															type="text" onfocus="callCalender('outletCustomerOrdersPendingOrdersTo')" 
															onclick="callCalender('outletCustomerOrdersPendingOrdersTo')" placeholder="End Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div class="form-group col-lg-0 col-sm-0 columnpadding">
														<select class="form-control displaynone"
															style="display: none;" name="dealStatus"
															id="outletCustomerOrdersPendingOrdersFileType" disabled="disabled">
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
														<div class="dialogoutlet_customerorders"
															style="display: none">
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
														style="width: 30px" id="outletCustomerOrdersPendingOrdersImg"
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
														name="outletCustomerOrders" id="outletCustomerOrdersFulfilledOrders" 
														onchange="enableFilesBrowse(this,'outletCustomerOrdersFulfilledOrders','outletCustomerOrders');"
														/>&nbsp;&nbsp;&nbsp;
													<spring:message
														code="export.customer_orders.fulfilled_orders.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" id="outletCustomerOrdersFulfilledOrdersLocation" disabled="disabled">
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
															style="background-color: white;" id="outletCustomerOrdersFulfilledOrdersFrom"
															size="20" type="text"
															onfocus="callCalender('outletCustomerOrdersFulfilledOrdersFrom')" 
															onclick="callCalender('outletCustomerOrdersFulfilledOrdersFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="outletCustomerOrdersFulfilledOrdersTo"
															size="20" type="text"
															onfocus="callCalender('outletCustomerOrdersFulfilledOrdersTo')" 
															onclick="callCalender('outletCustomerOrdersFulfilledOrdersTo')"
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
														style="width: 30px" id="outletCustomerOrdersFulfilledOrdersImg"
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
														name="outletCustomerOrders" id="outletCustomerOrdersCancelledOrders"
														onchange="enableFilesBrowse(this,'outletCustomerOrdersCancelledOrders','outletCustomerOrders');"
														
														 />&nbsp;&nbsp;&nbsp;
													<spring:message code="cancelled.orders.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" id="outletCustomerOrdersCancelledOrdersLocation" disabled="disabled">
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
															style="background-color: white;" id="outletCustomerOrdersCancelledOrdersFrom"
															size="20" type="text"
															onfocus="callCalender('outletCustomerOrdersCancelledOrdersFrom')" 
															onclick="callCalender('outletCustomerOrdersCancelledOrdersFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="outletCustomerOrdersCancelledOrdersTo"
															size="20" type="text"
															onfocus="callCalender('outletCustomerOrdersCancelledOrdersTo')" 
															onclick="callCalender('outletCustomerOrdersCancelledOrdersTo')"
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
											
											
												<label><input type="radio" checked name="outletCustomerOrdersRadio" value="0">
												<spring:message code="export.run.at.once" /></label>
											</div>
											<div class="radio">
												<label><input type="radio" name="outletCustomerOrdersRadio" value="1">
												<spring:message code="export.run.as.batch" /></label>
											</div>
										</div>

										<%-- <div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
											style="padding-top: 3.3cm;">
											<input type="button" id="edit"
												class="btn bg-olive btn-inline browsebutton"
												onclick="importFiles();"
												value="<spring:message code="export.startexport.label" />" />
										</div>
										<div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
											style="padding-top: 3.3cm;">
											<input type="button" id="edit"
												class="btn bg-olive btn-inline browsebutton"
												onclick="activateHeader('customerOrders'); resetOnName('outletCustomerOrders');" value="Cancel" />
										</div> --%>
									</div>
								</div>
								<!--  	customerorders end -->



								<div class="row" style="padding-left: 6%; padding-right: 0%">
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
											onclick="exportShipments(this);" value="Start" />
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
												<!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
												<div class="form-group col-lg-3 columnpadding"
													style="font-size: 14px;">
													<input type="checkbox" style="vertical-align: -2px"	
														name="shipments" id="shipmentsNotes" 
														onchange="enableFilesBrowse(this,'shipmentsNotes','shipments');"
														
														
														/>&nbsp;&nbsp;&nbsp;
													<spring:message code="shipment.notes.label" />
												</div>
												<div class="col-lg-5  columnpadding menuallignment">
													<div class="form-group col-lg-4  columnpadding">
														<select class="form-control form-group" id="shipmentsNotesLocation" disabled="disabled" >
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
															style="background-color: white;" id="shipmentsNotesFrom" size="20"
															type="text" onfocus="callCalender('shipmentsNotesFrom')" 
															onclick="callCalender('shipmentsNotesFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div class="form-group col-lg-3  columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}" 
															style="background-color: white;" id="shipmentsNotesTo" size="20"
															type="text" onfocus="callCalender('shipmentsNotesTo')"
															onclick="callCalender('shipmentsNotesTo')" placeholder="End Date" /> <span
															id="dealEndDateError"
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
                                                            <option  selected  value="0">CSV</option>
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
													<%-- <div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div> --%>
												</div>
												<div class="col-lg-0">
													<span style="visibility: hidden;"> <img
														style="width: 30px" id="shipmentsNotesImg"
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
														name="shipments" id="shipmentsOrders"
														onchange="enableFilesBrowse(this,'shipmentsOrders','shipments');"
														 />&nbsp;&nbsp;&nbsp;
													<spring:message code="warehouse.shipmentirders.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="shipmentsOrdersLocation" disabled="disabled" >
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
															style="background-color: white;" id="shipmentsOrdersFrom" size="20"
															type="text" onfocus="callCalender('shipmentsOrdersFrom')" 
															onclick="callCalender('shipmentsOrdersFrom')" placeholder="Exported Date" />
														<span id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="shipmentsOrdersTo" size="20"
															type="text" onfocus="callCalender('shipmentsOrdersTo')" 
															onclick="callCalender('shipmentsOrdersTo')" placeholder="End Date" /> <span
															id="dealEndDateError"
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
														<div class="dialogwarehouse_shipments"
															style="display: none">
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
														name="shipments" id="shipmentsGatePass" 
														onchange="enableFilesBrowse(this,'shipmentsGatePass','shipments');"
														
														/>&nbsp;&nbsp;&nbsp;
													<spring:message code="warehouse.shipmentgatepass.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" id="shipmentsGatePassLocation" disabled="disabled">
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
															style="" id="shipmentsGatePassFrom"
															size="20" type="text"
															onfocus="callCalender('shipmentsGatePassFrom')" 
															onclick="callCalender('shipmentsGatePassFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}" 
															style="background-color: white;" id="shipmentsGatePassTo"
															size="20" type="text"
															onfocus="callCalender('shipmentsGatePassTo')"
															onclick="callCalender('shipmentsGatePassTo')"
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
														name="shipments" id="shipmentsInvoice" 
														onchange="enableFilesBrowse(this,'shipmentsInvoice','shipments');"
														
														/>&nbsp;&nbsp;&nbsp;
													<spring:message code="warehouse.invoices.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group" id="shipmentsInvoiceLocation" disabled="disabled">
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
															style="background-color: white;" id="shipmentsInvoiceFrom"
															size="20" type="text"
															onfocus="callCalender('shipmentsInvoiceFrom')" 
															onclick="callCalender('shipmentsInvoiceFrom')"
															placeholder="Exported Date" /> <span
															id="dealEndDateError"
															style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
													</div>
													<div
														class="form-group col-lg-3 col-sm-2 columnpadding enddate">
														<input class="form-control calendar_icon endDateHotdeal"
															readonly="readonly" value="${hotDealsList.endDateStr}"
															style="background-color: white;" id="shipmentsInvoiceTo"
															size="20" type="text"
															onfocus="callCalender('shipmentsInvoiceTo')"
															onclick="callCalender('shipmentsInvoiceTo')"
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
														name="shipments" id="shipmentsReturns" 
														
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
														name="shipments" id="shipmentsReciept" 
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
												<label><input type="radio" name="shipmentRadio" checked="checked" value="0">
												<spring:message code="export.run.at.once" /></label>
											</div>
											<div class="radio">
												<label><input type="radio" name="shipmentRadio" value="1">
												<spring:message code="export.run.as.batch" /></label>
											</div>
										</div>

										<%-- <div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
											style="padding-top: 3.3cm;">
											<input type="button" id="edit"
												class="btn bg-olive btn-inline browsebutton"
												onclick="exportShipments(this);"
												value="<spring:message code="export.startexport.label" />" />
										</div>
										<div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
											style="padding-top: 3.3cm;">
											<input type="button" id="edit"
												class="btn bg-olive btn-inline browsebutton"
												onclick="activateHeader('shipments'); resetOnName('shipments');" value="Cancel" />
										</div> --%>
									</div>
								</div>

								<!--   	shippments end -->

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
														code="inventory.management.label" /></label>
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
											onclick="exportInventoryManagement(this);" value="Start" />
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
														name="inventory" id="inventoryStockReceipts" 
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
														name="inventory" id="inventoryStockIssue" 
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
														name="inventory" id="inventoryStockRequest"
														
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
														name="inventory" id="inventoryStockReturn" 
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
														name="inventory" id="inventoryStockVerification"
														onchange="enableFilesBrowse(this,'inventoryStockVerification','inventory');"
														
														 />&nbsp;&nbsp;&nbsp;
													<spring:message code="outlet_stockverification.label" />
												</div>
												<div class="col-lg-5 col-sm-12 columnpadding menuallignment">
													<div class="form-group col-lg-4 col-sm-3 columnpadding">
														<select class="form-control form-group"
															id="inventoryStockVerificationLocation" >
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
														<input class="form-control calendar_icon form-group endDateHotdeal"
															readonly="readonly" value=""
															style="background-color: white;"
															id="inventoryStockVerificationFrom" size="20" type="text"
															onfocus="callCalender('inventoryStockVerificationFrom')" 
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

										<%-- <div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
											style="padding-top: 3.3cm;">
											<input type="button" id="edit"
												class="btn bg-olive btn-inline browsebutton"
												onclick="exportInventoryManagement();"
												value="<spring:message code="export.startexport.label" />" />
										</div>
										<div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
											style="padding-top: 3.3cm;">
											<input type="button" id="edit"
												class="btn bg-olive btn-inline browsebutton"
												onclick="activateHeader('inventoryManagement');resetOnName('inventory')" value="Cancel" />
										</div> --%>
									</div>

								</div>
								<!--  inventory managment end -->
								<c:if test="${flow != 'warehouse'}">
									<div class="row" style="padding-left: 6%; padding-right: 0%">

										<div class="form-group col-lg-10"
											style="border-bottom: 1px solid #d2d6de; padding-left: 0px; padding-right: 0px; width: 82%">
											<img class="headerImg"
												style="float: right; cursor: pointer; margin-right: -8px; margin-top: 3px; margin-bottom: -26px;"
												onclick="activateHeader('deals');" id="dealsImg" alt=""
												src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
											<div>
												<div class="col-lg-8"
													style="padding-left: 0px; padding-top: 8px;">
													<label style="font-size: 18px;"><spring:message
															code="deals.and.offers" /></label>
												</div>
												<div class="col-lg-4"
													style="float: right; padding-right: 0px;"></div>


												<%-- <div class="form-group col-lg-12 slideupAndDown" style="">
                	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('deals');" id="dealsImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
                </div> --%>


											</div>
										</div>

										<div class="form-group col-lg-1 "
											style="width: 9%; padding-left: 20px;">
											<input type="button" id="edit"
												class="btn bg-olive btn-inline reset-button"
												onclick="resetOnName('dealsAndOffers');" value="Reset" />
										</div>
										<div class="form-group col-lg-1 " style="width: 9%;">
											<input type="button" id="edit"
												class="btn bg-olive btn-inline start-button" style=""
												onclick="ExportDealsAndOffers(this);" value="Start" />
										</div>

									</div>
									<!-- dummy -->
									<div class="deals subBlock">
										<div class="row">
											<div class="form-group col-lg-12"
												style="padding-left: 6%; padding-right: 5%">
												<div class="col-lg-5" style="padding-left: 0px;">
													<input type="checkbox"
														style="zoom: 1.5; margin-left: 0px; vertical-align: -4px;"
														name="dealsAndOffers" id="selectdealsAndOffers" onclick="selectAllExports(this,'dealsAndOffers')">
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
															name="dealsAndOffers" id="dealsAndOffersCurrentDeals"														
															onchange="enableFilesBrowse(this,'dealsAndOffersCurrentDeals','dealsAndOffers');"

															/>&nbsp;&nbsp;&nbsp;
														<spring:message code="current.deals.label" />
													</div>
													<div class="col-lg-5  columnpadding menuallignment">
														<div class="form-group col-lg-4  columnpadding">
															<select class="form-control form-group" id="dealsAndOffersCurrentDealsLocation" disabled="disabled">
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
																style="background-color: white;" id="dealsAndOffersCurrentDealsFrom" size="20"
																type="text" onfocus="callCalender('dealsAndOffersCurrentDealsFrom')" 
																onclick="callCalender('dealsAndOffersCurrentDealsFrom')"
																placeholder="Exported Date" /> <span
																id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>
														<div class="form-group col-lg-3  columnpadding enddate">
															<input class="form-control calendar_icon endDateHotdeal"
																readonly="readonly" value="${hotDealsList.endDateStr}" 
																style="background-color: white;" id="dealsAndOffersCurrentDealsTo" size="20"
																type="text" onfocus="callCalender('dealsAndOffersCurrentDealsTo')"
																onclick="callCalender('dealsAndOffersCurrentDealsTo')" placeholder="End Date" />
															<span id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>

													</div>
													<div
														class="form-group col-lg-4  col-xs-12 columnpadding menuwidth">
														<div class=" col-lg-12  col-xs-8 columnpadding">
															<div class="form-group col-lg-4  columnpadding">
																<select class="form-control" style="padding: 0px 3px;"
																	name="dealsAndOffersExportType" id="dealsAndOffersExportType" disabled="disabled">
																	<option disabled selected><spring:message
																			code="export.exportType.label" /></option>
																	<option value="1">Absolute</option>
																	<option value="0">Incremental</option>
																</select> <span id="dealStatusError"
																	style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
															</div>
															<div class="form-group col-lg-3  columnpadding">
																<select class="form-control" style="padding: 0px 0px;"
																	name="dealsAndOffersFileType" id="dealsAndOffersFileType" disabled="disabled">
																	<option disabled selected><spring:message
																			code="export.select.file.type.label" /></option>
																	<option value="1">JDA</option>
																	<option value="0">CSV</option>
																</select> <span id="dealStatusError"
																	style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
															</div>
															<div class="form-group col-lg-5  columnpadding">
																<select class="form-control" style="padding: 0px 3px;"
																	name="dealsAndOffersExportMode" id="dealsAndOffersExportMode" disabled="disabled"
																	onchange="viewftppopup(this,'deals')">
																	<option disabled selected><spring:message
																			code="export.export.mode.label" /></option>
																	<option value="localdownload">Local Download</option>
																	<option value="ftp">FTP</option>
																	<option value="network">Network</option>
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
											<!-- 	model popup -->


											<!-- 	model popup -->

											<div class="row rowallignment">
												<div class="col-lg-12 columnallignment" style="">
													<!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
													<div class="form-group col-lg-3 columnpadding"
														style="font-size: 14px;">
														<input type="checkbox" style="vertical-align: -2px"
															name="dealsAndOffers" id="dealsAndOffersPastDeals" 
															onchange="enableFilesBrowse(this,'dealsAndOffersPastDeals','dealsAndOffers');"
															
															/>&nbsp;&nbsp;&nbsp;
														<spring:message code="past.deals.label" />
													</div>
													<div
														class="col-lg-5 col-sm-12 columnpadding menuallignment">
														<div class="form-group col-lg-4 col-sm-3 columnpadding">
															<select class="form-control form-group"
																id="dealsAndOffersPastDealsLocation" disabled="disabled">
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
																style="background-color: white;" id="dealsAndOffersPastDealsFrom" size="20"
																type="text" onfocus="callCalender('dealsAndOffersPastDealsFrom')" 
																onclick="callCalender('dealsAndOffersPastDealsFrom')" placeholder="Exported Date" />
															<span id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>
														<div
															class="form-group col-lg-3 col-sm-2 columnpadding enddate">
															<input class="form-control calendar_icon endDateHotdeal"
																readonly="readonly" value="${hotDealsList.endDateStr}"
																style="background-color: white;" id="dealsAndOffersPastDealsTo" size="20"
																type="text" onfocus="callCalender('dealsAndOffersPastDealsTo')"
																onclick="callCalender('dealsAndOffersPastDealsTo')" placeholder="End Date" /> <span
																id="dealEndDateError"
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
															<div class="dialogdeals" style="display: none">
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
															name="dealsAndOffers" id="dealsAndOffersPriceList" 
															onchange="enableFilesBrowse(this,'dealsAndOffersPriceList','dealsAndOffers');"
															
															/>&nbsp;&nbsp;&nbsp;
														<spring:message code="data.export.PriceList" />
													</div>
													<div
														class="col-lg-5 col-sm-12 columnpadding menuallignment">
														<div class="form-group col-lg-4 col-sm-3 columnpadding">
															<select class="form-control form-group" id="dealsAndOffersPriceListLocation" disabled="disabled">
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
																style="background-color: white;" id="dealsAndOffersPriceListFrom"
																size="20" type="text"
																onfocus="callCalender('dealsAndOffersPriceListFrom')" 
																onclick="callCalender('dealsAndOffersPriceListFrom')"
																placeholder="Exported Date" /> <span
																id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>
														<div
															class="form-group col-lg-3 col-sm-2 columnpadding enddate">
															<input class="form-control calendar_icon endDateHotdeal"
																readonly="readonly" value="${hotDealsList.endDateStr}" 
																style="background-color: white;" id="dealsAndOffersPriceListTo"
																size="20" type="text"
																onfocus="callCalender('dealsAndOffersPriceListTo')"
																onclick="callCalender('dealsAndOffersPriceListTo')"
																placeholder="End Date" /> <span id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>
														<div class="form-group col-lg-0 col-sm-0 columnpadding">
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
															name="dealsAndOffers" id="dealsAndOffersPastOffers" 
															onchange="enableFilesBrowse(this,'dealsAndOffersPastOffers','dealsAndOffers');"
															
															/>&nbsp;&nbsp;&nbsp;
														<spring:message
															code="export.deals_and_offers.Past_Offers.label" />
													</div>
													<div
														class="col-lg-5 col-sm-12 columnpadding menuallignment">
														<div class="form-group col-lg-4 col-sm-3 columnpadding">
															<select class="form-control form-group" id="dealsAndOffersPastOffersLocation" disabled="disabled">
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
																style="background-color: white;" id="dealsAndOffersPastOffersFrom"
																size="20" type="text"
																onfocus="callCalender('dealsAndOffersPastOffersFrom')" 
																onclick="callCalender('dealsAndOffersPastOffersFrom')"
																placeholder="Exported Date" /> <span
																id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>
														<div
															class="form-group col-lg-3 col-sm-2 columnpadding enddate">
															<input class="form-control calendar_icon endDateHotdeal"
																readonly="readonly" value="${hotDealsList.endDateStr}" 
																style="background-color: white;" id="dealsAndOffersPastOffersTo"
																size="20" type="text"
																onfocus="callCalender('dealsAndOffersPastOffersTo')"
																onclick="callCalender('dealsAndOffersPastOffersTo')"
																placeholder="End Date" /> <span id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>
														<div class="form-group col-lg-0 col-sm-0 columnpadding">
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
													<label><input type="radio" name="dealsAndOffersRadio" value="0" checked="checked">
													<spring:message code="export.run.at.once" /></label>
												</div>
												<div class="radio">
													<label><input type="radio" name="dealsAndOffersRadio" value="1">
													<spring:message code="export.run.as.batch" /></label>
												</div>
											</div>

										<%-- 	<div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
												style="padding-top: 3.3cm;">
												<input type="button" id="edit"
													class="btn bg-olive btn-inline browsebutton"
													onclick="ExportDealsAndOffers();"
													value="<spring:message code="export.startexport.label" />" />
											</div>
											<div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
												style="padding-top: 3.3cm;">
												<input type="button" id="edit"
													class="btn bg-olive btn-inline browsebutton"
													onclick="activateHeader('deals');resetOnName('dealsAndOffers')" value="Cancel" />
											</div> --%>
										</div>

									</div>
									<div class="row" style="padding-left: 6%; padding-right: 0%">
										<div class="form-group col-lg-10"
											style="border-bottom: 1px solid #d2d6de; padding-left: 0px; padding-right: 0px; width: 82%;">
											<img class="headerImg"
												style="float: right; cursor: pointer; margin-right: -8px; margin-top: 3px; margin-bottom: -26px;"
												onclick="activateHeader('loyality');" id="loyalityImg"
												alt=""
												src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
											<div>
												<div class="col-lg-8"
													style="padding-left: 0px; padding-top: 8px;">
													<label style="font-size: 18px;"><spring:message
															code="loyaltyprogram.label" /></label>
												</div>
												<div class="col-lg-4"
													style="float: right; padding-right: 0px;"></div>
												<%--  <div class="form-group col-lg-12 slideupAndDown" style="">
                	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('loyality');" id="loyalityImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
                </div> --%>
											</div>
										</div>
										<div class="form-group col-lg-1 "
											style="width: 9%; padding-left: 20px;">
											<input type="button" id="edit"
												class="btn bg-olive btn-inline reset-button"
												onclick="resetOnName('loyaltyProgram');" value="Reset" />
										</div>
										<div class="form-group col-lg-1 " style="width: 9%;">
											<input type="button" id="edit"
												class="btn bg-olive btn-inline start-button" style=""
												onclick="exportLoyality();" value="Start" />
										</div>



									</div>
									<!-- dummy -->
									<div class="loyality subBlock">
										<div class="row">
											<div class="form-group col-lg-12"
												style="padding-left: 6%; padding-right: 5%">
												<div class="col-lg-5" style="padding-left: 0px;">
													<input type="checkbox"
														style="zoom: 1.5; margin-left: 0px; vertical-align: -4px;"
														name="loyaltyProgram" id="selectloyaltyProgram" onclick="selectAllExports(this,'loyaltyProgram')">
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
															name="loyaltyProgram" id="loyaltyProgramGiftVouchers" 
															onchange="enableFilesBrowse(this,'loyaltyProgramGiftVouchers','loyaltyProgram');"
															/>&nbsp;&nbsp;&nbsp;
														<spring:message code="export.CRM.gift_vouchers.label" />
													</div>
													<div class="col-lg-5  columnpadding menuallignment">
														<div class="form-group col-lg-4  columnpadding">
															<select class="form-control form-group" id="loyaltyProgramGiftVouchersLocation" disabled="disabled">
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
																style="background-color: white;" id="loyaltyProgramGiftVouchersFrom" size="20"
																type="text" onfocus="callCalender('loyaltyProgramGiftVouchersFrom')"
																onclick="callCalender('loyaltyProgramGiftVouchersFrom')"
																placeholder="Exported Date" /> <span
																id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>
														<div class="form-group col-lg-3  columnpadding enddate">
															<input class="form-control calendar_icon endDateHotdeal"
																readonly="readonly" value="${hotDealsList.endDateStr}"
																style="background-color: white;" id="loyaltyProgramGiftVouchersTo" size="20"
																type="text" onfocus="callCalender('loyaltyProgramGiftVouchersTo')"
																onclick="callCalender('loyaltyProgramGiftVouchersTo')" placeholder="End Date" />
															<span id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>

													</div>
													<div
														class="form-group col-lg-4  col-xs-12 columnpadding menuwidth">
														<div class=" col-lg-12  col-xs-8 columnpadding">
															<div class="form-group col-lg-4  columnpadding">
																<select class="form-control" style="padding: 0px 3px;"
																	name="loyaltyProgramExportType" id="loyaltyProgramExportType" disabled="disabled">
																	<option disabled selected><spring:message
																			code="export.exportType.label" /></option>
																	<option value="1">Absolute</option>
																	<option value="0">Incremental</option>
																</select> <span id="dealStatusError"
																	style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
															</div>
															<div class="form-group col-lg-3  columnpadding">
																<select class="form-control" style="padding: 0px 0px;"
																	name="loyaltyProgramFileType" id="loyaltyProgramFileType" disabled="disabled">
																	<option disabled selected><spring:message
																			code="export.select.file.type.label" /></option>
																	<option value="1">JDA</option>
																	<option value="0">CSV</option>
																</select> <span id="dealStatusError"
																	style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
															</div>
															<div class="form-group col-lg-5  columnpadding">
																<select class="form-control" style="padding: 0px 3px;"
																	name="loyaltyProgramExportMode" id="loyaltyProgramExportMode" disabled="disabled"
																	onchange="viewftppopup(this,'loyaltyprogram')">
																	<option disabled selected><spring:message
																			code="export.export.mode.label" /></option>
																	<option value="localdownload">Local Download</option>
																	<option value="ftp">FTP</option>
																	<option value="network">Network</option>
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
											<!-- 	model popup -->


											<!-- 	model popup -->

											<div class="row rowallignment">
												<div class="col-lg-12 columnallignment" style="">
													<!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
													<div class="form-group col-lg-3 columnpadding"
														style="font-size: 14px;">
														<input type="checkbox" style="vertical-align: -2px"
															name="loyaltyProgram" id="loyaltyProgramCoupons" 
															onchange="enableFilesBrowse(this,'loyaltyProgramCoupons','loyaltyProgram');"
															/>&nbsp;&nbsp;&nbsp;
														<spring:message code="export.CRM.coupons.label" />
													</div>
													<div
														class="col-lg-5 col-sm-12 columnpadding menuallignment">
														<div class="form-group col-lg-4 col-sm-3 columnpadding">
															<select class="form-control form-group"
																id="loyaltyProgramCouponsLocation" disabled="disabled">
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
																style="background-color: white;" id="loyaltyProgramCouponsFrom" size="20"
																type="text" onfocus="callCalender('loyaltyProgramCouponsFrom')"
																onclick="callCalender('loyaltyProgramCouponsFrom')" placeholder="Exported Date" />
															<span id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>
														<div
															class="form-group col-lg-3 col-sm-2 columnpadding enddate">
															<input class="form-control calendar_icon endDateHotdeal"
																readonly="readonly" value="${hotDealsList.endDateStr}"
																style="background-color: white;" id="loyaltyProgramCouponsTo" size="20"
																type="text" onfocus="callCalender('loyaltyProgramCouponsTo')"
																onclick="callCalender('loyaltyProgramCouponsTo')" placeholder="End Date" /> <span
																id="dealEndDateError"
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
															<div class="dialogloyaltyprogram" style="display: none">
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
															name="loyaltyProgram" id="loyaltyProgramLoyalityCards"
															onchange="enableFilesBrowse(this,'loyaltyProgramLoyalityCards','loyaltyProgram');"
															 />&nbsp;&nbsp;&nbsp;
														<spring:message code="export.CRM.loyalty_cards.label" />
													</div>
													<div
														class="col-lg-5 col-sm-12 columnpadding menuallignment">
														<div class="form-group col-lg-4 col-sm-3 columnpadding">
															<select class="form-control form-group" id="loyaltyProgramLoyalityCardsLocation" disabled="disabled">
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
																style="background-color: white;" id="loyaltyProgramLoyalityCardsFrom"
																size="20" type="text"
																onfocus="callCalender('loyaltyProgramLoyalityCardsFrom')"
																onclick="callCalender('loyaltyProgramLoyalityCardsFrom')"
																placeholder="Exported Date" /> <span
																id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>
														<div
															class="form-group col-lg-3 col-sm-2 columnpadding enddate">
															<input class="form-control calendar_icon endDateHotdeal"
																readonly="readonly" value="${hotDealsList.endDateStr}" 
																style="background-color: white;" id="loyaltyProgramLoyalityCardsTo"
																size="20" type="text"
																onfocus="callCalender('loyaltyProgramLoyalityCardsTo')"
																onclick="callCalender('loyaltyProgramLoyalityCardsTo')"
																placeholder="End Date" /> <span id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>
														<div class="form-group col-lg-0 col-sm-0 columnpadding">
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
													<label><input type="radio" name="loyaltyProgramRadio" value="0" checked="checked">
													<spring:message code="export.run.at.once" /></label>
												</div>
												<div class="radio">
													<label><input type="radio" name="loyaltyProgramRadio" value="1">
													<spring:message code="export.run.as.batch" /></label>
												</div>
											</div>

											<%-- <div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
												style="padding-top: 3.3cm;">
												<input type="button" id="edit"
													class="btn bg-olive btn-inline browsebutton"
													onclick="exportLoyality();"
													value="<spring:message code="export.startexport.label" />" />
											</div>
											<div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
												style="padding-top: 3.3cm;">
												<input type="button" id="edit"
													class="btn bg-olive btn-inline browsebutton"
													onclick="activateHeader('loyality');resetOnName('loyaltyProgram');" value="Cancel" />
											</div> --%>
										</div>
									</div>

									<!--   deals and offers end -->


									<div class="row" style="padding-left: 6%; padding-right: 0%">
										<div class="form-group col-lg-10"
											style="margin-top: 3px; width: 82%; border-bottom: 1px solid #d2d6de; padding-left: 0px; padding-right: 0px;">
											<img class="headerImg"
												style="float: right; cursor: pointer; margin-right: -8px; margin-top: 3px; margin-bottom: -26px;"
												onclick="activateHeader('customerRelationshipManagement');"
												id="customerRelationshipManagementImg" alt=""
												src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
											<div>
												<div class="col-lg-8"
													style="padding-left: 0px; padding-top: 8px;">
													<label style="font-size: 18px;"><spring:message
															code="customer.relationship.management" /></label>
												</div>
												<div class="col-lg-4"
													style="float: right; padding-right: 0px;"></div>


												<%--  <div class="form-group col-lg-12 slideupAndDown" style="">
                	<img class="headerImg" style="float: right;cursor: pointer;margin-right: -16px;margin-top: -34px;margin-bottom: -26px;" onclick="activateHeader('customerRelationshipManagement');" id="customerRelationshipManagementImg" alt="" src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png">
             
                </div> --%>

											</div>
										</div>
										<div class="form-group col-lg-1 "
											style="width: 9%; padding-left: 20px;">
											<input type="button" id="edit"
												class="btn bg-olive btn-inline reset-button"
												onclick="resetOnName(CRM);" value="Reset" />
										</div>
										<div class="form-group col-lg-1 " style="width: 9%;">
											<input type="button" id="edit"
												class="btn bg-olive btn-inline start-button" style=""
												onclick="exportCRM(this);" value="Start" />
										</div>

									</div>
									<!-- dummy -->
									<div class="customerRelationshipManagement subBlock">
										<div class="row">
											<div class="form-group col-lg-12"
												style="padding-left: 6%; padding-right: 5%">
												<div class="col-lg-5" style="padding-left: 0px;">
													<input type="checkbox"
														style="zoom: 1.5; margin-left: 0px; vertical-align: -4px;"
														name="CRM" id="selectCRM" 	onclick="selectAllExports(this,'CRM')">
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
															name="CRM" id="CRMCustomerProfile" 
															onchange="enableFilesBrowse(this,'CRMCustomerProfile','CRM');"
															/>&nbsp;&nbsp;&nbsp;
														<spring:message
															code="export.Customer_Relationship_Management.customers_profile.label" />
													</div>
													<div class="col-lg-5  columnpadding menuallignment">
														<div class="form-group col-lg-4  columnpadding">
															<select class="form-control form-group" id="CRMCustomerProfileLocation" disabled="disabled">
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
																style="background-color: white;" id="CRMCustomerProfileFrom" size="20"
																type="text" onfocus="callCalender('CRMCustomerProfileFrom')" 
																onclick="callCalender('CRMCustomerProfileFrom')"
																placeholder="Exported Date" /> <span
																id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>
														<div class="form-group col-lg-3  columnpadding enddate">
															<input class="form-control calendar_icon endDateHotdeal"
																readonly="readonly" value="${hotDealsList.endDateStr}"
																style="background-color: white;" id="CRMCustomerProfileTo" size="20"
																type="text" onfocus="callCalender('CRMCustomerProfileTo')"
																onclick="callCalender('CRMCustomerProfileTo')" placeholder="End Date" />
															<span id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>

													</div>
													<div
														class="form-group col-lg-4  col-xs-12 columnpadding menuwidth">
														<div class=" col-lg-12  col-xs-8 columnpadding">
															<div class="form-group col-lg-4  columnpadding">
																<select class="form-control" style="padding: 0px 3px;"
																	name="CRMExportType" id="CRMExportType" disabled>
																	<option disabled selected><spring:message
																			code="export.exportType.label" /></option>
																	<option value="1">Absolute</option>
																	<option value="0">Incremental</option>
																</select> <span id="dealStatusError"
																	style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
															</div>
															<div class="form-group col-lg-3  columnpadding">
																<select class="form-control" style="padding: 0px 0px;"
																	name="CRMFileType" id="CRMFileType" disabled>
																	<option disabled selected><spring:message
																			code="export.select.file.type.label" /></option>
																	<option value="1">JDA</option>
																	<option value="0">CSV</option>
																</select> <span id="dealStatusError"
																	style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
															</div>
															<div class="form-group col-lg-5  columnpadding">
																<select class="form-control" style="padding: 0px 3px;"
																	name="dealStatus" id="CRMExportMode" disabled
																	onchange="viewftppopup(this,'relationship')">
																	<option disabled selected><spring:message
																			code="export.export.mode.label" /></option>
																	<option value="localdownload">Local Download</option>
																	<option value="ftp">FTP</option>
																	<option value="network">Network</option>
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
											<!-- 	model popup -->


											<!-- 	model popup -->

											<div class="row rowallignment">
												<div class="col-lg-12 columnallignment" style="">
													<!--  <div class="form-group col-lg-1" style="font-size: 14px;"></div> -->
													<div class="form-group col-lg-3 columnpadding"
														style="font-size: 14px;">
														<input type="checkbox" style="vertical-align: -2px"
															name="CRM" id="CRMCustomerComplaints" 
															onchange="enableFilesBrowse(this,'CRMCustomerComplaints','CRM');"
															
															/>&nbsp;&nbsp;&nbsp;
														<spring:message
															code="export.Customer_Relationship_Management.customer_complaints.label" />
													</div>
													<div
														class="col-lg-5 col-sm-12 columnpadding menuallignment">
														<div class="form-group col-lg-4 col-sm-3 columnpadding">
															<select class="form-control form-group"
																id="CRMCustomerComplaintsLocation" disabled> 
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
																style="background-color: white;" id="CRMCustomerComplaintsFrom" size="20"
																type="text" onfocus="callCalender('CRMCustomerComplaintsFrom')" 
																onclick="callCalender('CRMCustomerComplaintsFrom')" placeholder="Exported Date" />
															<span id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>
														<div
															class="form-group col-lg-3 col-sm-2 columnpadding enddate">
															<input class="form-control calendar_icon endDateHotdeal"
																readonly="readonly" value="${hotDealsList.endDateStr}" 
																style="background-color: white;" id="CRMCustomerComplaintsTo" size="20"
																type="text" onfocus="callCalender('CRMCustomerComplaintsTo')"
																onclick="callCalender('CRMCustomerComplaintsTo')" placeholder="End Date" /> <span
																id="dealEndDateError"
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
															<div class="dialogrelationship" style="display: none">
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
															name="CRM" id="CRMCustomerFeedback" 
															onchange="enableFilesBrowse(this,'CRMCustomerFeedback','CRM');"
															/>&nbsp;&nbsp;&nbsp;
														<spring:message
															code="export.Customer_Relationship_Management.customer_feedback.label" />
													</div>
													<div
														class="col-lg-5 col-sm-12 columnpadding menuallignment">
														<div class="form-group col-lg-4 col-sm-3 columnpadding">
															<select class="form-control form-group" id="CRMCustomerFeedbackLocation" disabled="disabled">
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
																style="background-color: white;" id="CRMCustomerFeedbackFrom"
																size="20" type="text"
																onfocus="callCalender('CRMCustomerFeedbackFrom')" 
																onclick="callCalender('CRMCustomerFeedbackFrom')"
																placeholder="Exported Date" /> <span
																id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>
														<div
															class="form-group col-lg-3 col-sm-2 columnpadding enddate">
															<input class="form-control calendar_icon endDateHotdeal"
																readonly="readonly" value="${hotDealsList.endDateStr}" 
																style="background-color: white;" id="CRMCustomerFeedbackTo"
																size="20" type="text"
																onfocus="callCalender('CRMCustomerFeedbackTo')"
																onclick="callCalender('CRMCustomerFeedbackTo')"
																placeholder="End Date" /> <span id="dealEndDateError"
																style="text-align: right; color: red; font-size: 2; position: absolute;"></span>
														</div>
														<div class="form-group col-lg-0 col-sm-0 columnpadding">
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
													<label><input type="radio" name="CRMRadio" value="0" checked>
													<spring:message code="export.run.at.once" /></label>
												</div>
												<div class="radio">
													<label><input type="radio" name="CRMRadio" value="1">
													<spring:message code="export.run.as.batch"  /></label>
												</div>
											</div>

											<%-- <div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
												style="padding-top: 3.3cm;">
												<input type="button" id="edit"
													class="btn bg-olive btn-inline browsebutton"
													onclick="importFiles();"
													value="<spring:message code="export.startexport.label" />" />
											</div>
											<div class=" col-lg-6 col-sm-6 col-xs-4 columnpadding"
												style="padding-top: 3.3cm;">
												<input type="button" id="edit"
													class="btn bg-olive btn-inline browsebutton"
													onclick="importFiles();" value="Cancel" />
											</div> --%>
										</div>
									</div>
								</c:if>
							</c:if>

							<!-- crm end -->






							<!-- billing code -->
							<%--  <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.billing.completed_bills.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="fromCompletedBills" size="20" type="text" onfocus="callCalender('fromCompletedBills')" onclick="callCalender('fromCompletedBills')" placeholder="Exported Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="toCompletedBills" size="20" type="text" onfocus="callCalender('toCompletedBills')" onclick="callCalender('toCompletedBills')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" readonly="readonly" placeholder="Choose Path"  />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;" onclick="fileurl()">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" onclick="fileurl()" type="button" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"  class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="exportBills(this)" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div> --%>
						</div>

						<%-- 	   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             		
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             	<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.billing.cancelled_bills.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="fromCancelledBills" size="20" type="text" onfocus="callCalender('fromCancelledBills')" onclick="callCalender('fromCancelledBills')" placeholder="Exported Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="toCancelledBills" size="20" type="text" onfocus="callCalender('toCancelledBills')" onclick="callCalender('toCancelledBills')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path"  />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div> --%>

						<%--    <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.billing.exchanged_bills.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="fromExchangedBills" size="20" type="text" onfocus="callCalender('fromExchangedBills')" onclick="callCalender('fromExchangedBills')" placeholder="Exported Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="toExchangedBills" size="20" type="text" onfocus="callCalender('toExchangedBills')" onclick="callCalender('toExchangedBills')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path"  />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div> --%>
						<%--  <div class="row">
             <div class="form-group col-lg-5" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 18px;"><spring:message code="outlet_customerorders.label" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
             </div>
             <!-- second -->
             <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.customer_orders.new_orders.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="fromNewOrders" size="20" type="text" onfocus="callCalender('fromNewOrders')" onclick="callCalender('fromNewOrders')" placeholder="Exported Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="toNewOrders" size="20" type="text" onfocus="callCalender('toNewOrders')" onclick="callCalender('toNewOrders')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             	
             	   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.customer_orders.pending_orders.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="Exported Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             	
             	   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.customer_orders.fulfilled_orders.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="Exported Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             <div class="row">
             <div class="form-group col-lg-5" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 18px;"><spring:message code="deliveries.label" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
             </div>
              <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.shipments.pending.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="Exported Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             	
             	   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.shipments.shipped.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="Exported Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             	
             	   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.shipments.completed.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="Exported Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             <div class="row">
             <div class="form-group col-lg-5" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 18px;"><spring:message code="inventory_managements.label" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
             </div>
				   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.inventory_management.shipment_receipts.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             	
             	   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.inventory_management.stock_issue.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             	
             	   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.inventory_management.stock_verification.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
           
           
           <div class="row">
             <div class="form-group col-lg-5" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 18px;"><spring:message code="deals.and.offers" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
           </div>
                <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.deals_and_offers.current_deals.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             	
             	   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.deals_and_offers.past_deals.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             	
             	   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="data.export.PriceList" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             	   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.deals_and_offers.Past_Offers.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color:red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             	
             	 
             	
             
           
            
           
           <div class="row">
             <div class="form-group col-lg-5" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 18px;"><spring:message code="loyaltyprogram.label" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
           </div>
            <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.CRM.gift_vouchers.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             	
             	   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.CRM.coupons.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             	
             	   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.CRM.loyalty_cards.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             <div class="row">
             <div class="form-group col-lg-5" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 18px;"><spring:message code="customer.relationship.management" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
           </div>
          
             <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.Customer_Relationship_Management.customers_profile.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             	
             	   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.Customer_Relationship_Management.customer_complaints.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div>
             	
             	   <div class="row">
              <div class="form-group col-lg-1" style="font-size: 14px;"></div>
             	<div class="form-group col-lg-2 columnpadding" style="font-size: 14px;">
             		<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'productMaster');" id="productMaster"/>&nbsp;&nbsp;&nbsp;<spring:message code="export.Customer_Relationship_Management.customer_feedback.label" />
             	</div>
             	<div class="col-lg-5 col-sm-12 columnpadding">
             	 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
               <select class="form-control form-group" id="toLocation" >
 				<option value=""><spring:message code="export.select.location.label"/></option>
  				<c:forEach var="location" items="${workLocationsList}">
			<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
			</c:forEach>
			</select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                 <input class="form-control calendar_icon endDateHotdeal" readonly="readonly" value="${hotDealsList.endDateStr}" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="End Date" />
					<span id="dealEndDateError" style="text-align: right; color: red; font-size: 2; position: absolute;"></span> 
				</div> 
				 <div class="form-group col-lg-3 col-sm-3 columnpadding" >
                <select class="form-control" name="dealStatus" id="dealStatus">
                <option value=""><spring:message code="export.select.file.type.label"/></option>
                                            <option value="1">JDA</option>
                                            <option value="0">CSV</option>
                                            </select>
					<span id="dealStatusError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div> 
				</div>
             	<div class="form-group col-lg-3 col-sm-12 col-xs-12 columnpadding">
             		<div class=" col-lg-8 col-sm-6 col-xs-8 columnpadding">
             		<div class=" col-lg-7 col-sm-8 col-xs-9 " style="padding-left:0px;padding-right: 5px;">
  						<input id="productMasterFile" class="form-control" placeholder="Choose Path" disabled="disabled" />
  					</div>
  					<div class=" col-lg-5 col-sm-4 col-xs-3 columnpadding">
						<div class="fileUpload btn btn-primar browsebutton" style="font-weight: bold;">
			    			<span style="font-size: 15px;"><spring:message code="export.browse.label" /></span>
			    			<input id="productMasterBtn" disabled="disabled" type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="addNameToTextBox('productMaster');" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  
					</div>
					</div>
					<div class=" col-lg-4 col-sm-6 col-xs-4">
					<input type="button" id="edit"  class="btn bg-olive btn-inline browsebutton" onclick="importFiles();" value="<spring:message code="export.startexport.label" />" />
					</div>
					</div>
					<div class="col-lg-1">	<span style="visibility:hidden;">
							<img style="width: 30px" id="productMasterImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span></div>
             	</div> --%>
						<!--              <br> -->
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
						<%--  <div class="row" style="text-align: right;">
				<input type="button" id="edit"  class="btn bg-olive btn-inline" onclick="importFiles();" value="<spring:message code="submit.label" />" />
				<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;margin-right: 2%" onclick="resetFiles();" value="<spring:message code="reset.label" />" />
			</div> --%>
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