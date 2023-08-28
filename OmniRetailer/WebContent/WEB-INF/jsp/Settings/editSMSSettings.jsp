<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : Inventory Manager/settings/editSMSSettings.jsp
 * file type		        : JSP
 * description				: The editEmailSettings form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/validation.js"></script>
<script
	src="${pageContext.request.contextPath}/js/cusomerSettings/SMSSettings.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/omniretailer.css">
<%-- <script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	 --%>
<style type="text/css">
/* .col-xs-12 {
	 padding: 5%; 
	 }*/
.form-group {
	margin-bottom: 1px;
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

.btn-primar {
	font-weight: bold;
	color: black;
	/* background-color: rgb(195, 195, 195); */
	background: #777;
	border-color: black;
}

.browsebutton {
	border-radius: 0px;
	padding: 2px;
	height: 28px;
	/* -webkit-box-shadow: none; */
	box-shadow: none;
	/* background: #777; */
	color: #fff;
	font-size: 8px;
	border: 1px solid transparent;
}

.form-group {
	padding-bottom: 3px;
}

.fa-2x {
	margin-top: 2px;
	font-size: 1.7em;
}

a.button {
	position: relative;
	text-decoration: none;
	color: white;
	display: inline-block;
	padding: 2px 27px 26px 16px;
	background: #3c8dbc;
	/* border-radius: 5px; */
	/* box-shadow: 1px 0px 2px #000; */
	cursor: pointer;
	margin-top: 20px;
	height: 23px;
	text-align: center;
	margin-bottom: 1px;
	width: 78%;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	padding: 2px;
}
.glyphicon {
   
    }
    table.formatHTML5 tr.selected {
    background-color: #e92929 !important;
    color:#fff;
    vertical-align: middle;
    padding: 1.5em;
}
    

}

@media (min-width: 1200px)
.col-lg-5 {
    width: 40.666667%;
}
b, strong {
    font-weight: 500;
}
label{
white-space: nowrap;
}

legend {
   /* width:100%; */
   text-align: center;
    width: unset;
}
legend.scheduler-border {
    width:inherit; /* Or auto */
    padding:0 10px; /* To give a bit of padding on the left and right */
    border-bottom:none;
}
textarea{
resize: none;
width: 226px;
border: 1px solid #d2d6de;
}
fieldset{
border: 1px solid #d2d6de;
}
.col-lg-4 fieldset{
height:201px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){

});
</script>
</head>
<body>
	<!-- Content Header (Page header) -->
	<%-- <section class="content-header">
   <h1>
     <spring:message code="generic.data.label" />
     <small><spring:message code="tax.master.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('admin');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="generic.data.label" /></li>
       </ol>
 </section> --%>

	<!-- Main content -->
	<section class="content">
		<div class="row">


			<div class="col-xs-12">

				<div class="box box-primary " style="padding:">
				 <div class="box-header" align="center">
               <h3  class="box-title" style="border:1px solid #ccc;padding:7px;font-weight: 600;"><spring:message code="sms.settings.label" /></h3>
           </div>
					<%-- <div class="box-header" style="text-align: left; height: 25px;">
						<h3 align="center">
							<spring:message code="sms.settings.label" />
						</h3>
					</div> --%>
					<!-- /.box-header -->
					<!-- form start -->
					<form>

						<div class="box-body">
							<div class="row" style="text-align: right; margin-top: 0px;">

								<div id="Error" class="Error"
									style="text-align: center; color: red; margin-top: 20px; font-size: 2; font-weight: bold;">${err}</div>
								<div id="Success" class="Error"
									style="text-align: center; color: blue; font-size: 2; margin-top: 20px; font-weight: bold;">${success}</div>
							</div>
							<br>
							<br>

							<div class="row">
								<div class="row" onChange="changeUrl()" style="padding-left: 15px; margin-top:-54px;">
								<div class="col-lg-7">
								<fieldset style="border: 1px solid #d2d6de;">
								<legend  class="scheduler-border"style="text-align:center;"><b>Configure SMS Gateway</b></legend>
									<div class="form-group col-lg-4">
									<br>
										<div class="row">
											<div class="col-lg-12">
												<label><spring:message code="sms.gateway.label" />
													<span style="color: red; font-size: 2">*</span></label> <input
													type="text" class="form-control" id="gateway"
													value="${smsSettings.gateWay}"
													placeholder="<spring:message code="enter.gateway" />" /> 
													<span
													id="gatewayError"
													style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>

										</div>
										<div class="row" style="padding-top: 0px;">

											<div class="col-lg-1">
											
												<c:if test="${smsSettings.enabled == true}">
												 <input	type="checkbox"  id="enabled" checked value="true" />									
													 </c:if>
													 	<c:if test="${smsSettings.enabled != true}">
												 <input	type="checkbox"  id="enabled"  value="true" />									
													 </c:if>
													 </div>
													 <div class="col-lg-9">
												 	<label><spring:message code="enabled.label" />	</label>									
													 </div>
										</div>
										<div class="row">
										
										<div class="col-lg-12">
													<label><spring:message code="sms.url.label" /></label> <input
														type="text" class="form-control" disabled id="smsURL"
														value="" /> 
												</div>
										
										
										
										</div>
										
									</div>
									<br>
									<div class="form-group col-lg-8">
										
										<!-- <fieldset style="border:1px solid black;">
										<legend></legend> -->
										<!-- <div class="row"> -->
											
											<div class="col-lg-6" style="padding: 0px;">
												<div class="col-lg-6">
													<div class="row">

														<div class="col-lg-12 nopadding">
															<label><spring:message
																	code="parameter.name.label" /></label> <input type="text"
																class="form-control" id="parameterName" value="" /> 
														</div>

														
														<div class="col-lg-12 nopadding" style="padding-top:22px;">
															<label><spring:message code="parameter.value.label" /></label> <input type="text"
																class="form-control" id="parameterValue" value="" /> 
														</div>
														</div>
													
													
												<%--  <div class="col-lg-6">
												<div class="col-lg-12" style ="padding-left:0px">
													<label><spring:message code="sms.url.label" /></label> <input
														type="text" class="form-control" disabled id="smsURL"
														value="" /> 
												</div>
											</div> --%>


												</div>
												


												<div class="col-lg-6">
													<div class="row" style="margin-left: -2px;">

														<div class="row">
														&nbsp;&nbsp;<a onclick="addParameters();" class="button"><spring:message
																	code="add.label" />        <span class="glyphicon glyphicon-forward"></span></a>
														</div>


														<div class="row" style="padding-top:22px;">
															&nbsp;&nbsp;<a onclick="removeParameters(this);" class="button" style="white-space: nowrap;"><spring:message
																	code="remove.label" /><span class="glyphicon glyphicon-backward"></span></a>
														</div>
														
													<%--  <div class="col-lg-6">
												<div class="col-lg-12" style ="padding-left:0px">
													<label><spring:message code="sms.url.label" /></label> <input
														type="text" class="form-control" disabled id="smsURL"
														value="" /> 
												</div>
											</div> --%>
													</div>
													
													


												</div>

											</div>
											<!-- </div>
											</div> -->

											<div class="col-lg-6" style="padding: 0px;">
												<div class="col-lg-12" style="padding-left: 0px;">
													<label><spring:message code="parameters.label" /></label>
													<div id="example1_wrapper" class="dataTables_wrapper form-inline" role="grid" style="overflow-x: auto;overflow-y: auto;width:100%;">
													<table id="paramsTable"
														class="table table-bordered table-striped table-hover"
														style="">
														<thead
															style="background-color: #ccc !important; color: #ffffff !important;">
															<tr>
															<th><input id="CheckBoxParent" type = "checkBox"/></th>
																<th><spring:message code="key.label" /></th>
																<th><spring:message code="value.label" /></th>
															</tr>
														</thead>
														<tbody style="text-align: center;">
														<tr></tr>
														</tbody>
													</table>
													</div>
												</div>


											</div>
											
											<%-- <div class="col-lg-12">
												<div class="col-lg-12" style ="padding-left:0px">
													<label><spring:message code="sms.url.label" /></label> <input
														type="text" class="form-control" disabled id="smsURL"
														value="" /> 
												</div>
											</div>  --%>
											</div>
											</fieldset>
											</div>
												<!-- <div class="col-lg-1"></div> -->
											<div class="form-group col-lg-5" style="right:1%;">
											<fieldset style="border: 1px solid #d2d6de;height:226px; margin: 0px 26px;">
											<legend class="scheduler-border" style="text-align:center"><b>Send Test Message</b></legend>
											
											<div class="form-group col-lg-12">
											<div class="row">
											<div class="col-lg-4">
											<label>Mobile Key<span style="color: red; font-size: 2">*</span></label>
											<input type="text" class="form-control" id="mobileKey" value="${smsSettings.mobileKey}"/> 
											<span id="mobileKeyError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											<!-- <div class="col-lg-1"></div> -->
											<div class="col-lg-4">
											<label>Mobile Number<span style="color: red; font-size: 2">*</span></label>
											<input type="text" class="form-control" id="mobilenumber" value="${smsSettings.mobileNumber}"/> 
											<span id="mobilenumberError" style="text-align: right; color: red; font-size: 2; font-weight: bold; white-space:nowrap;"></span>
											</div>
											
											<div class="col-lg-4">
											<label>Template ID<span style="color: red; font-size: 2">*</span></label>
											<input type="text" class="form-control" id="templateId" value="${smsSettings.templateId}"/> 
											<span id="templateIdError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											</div>
											</div>
											<br>
											<div class="row">
											<div class="col-lg-4">
											<label>Message Key<span style="color: red; font-size: 2">*</span></label>
											<input type="text" class="form-control" id="messageKey" value="${smsSettings.messageKey}"/>
											<span id="messageKeyError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span> 
											</div>
											<!-- <div class="col-lg-1"></div> -->
											<div class="col-lg-4">
											<label>Text Message</label>
											<textarea rows="3" cols="3" id="textmessage" style="width:121px;"></textarea>
											</div>
											
											<div class="col-lg-4">
											<%-- <a  data-toggle="modal" data-target="#myModal" class="button"><spring:message code="validate.label" /></a> --%>
											<input type="button" value="Validate" style="margin-top:22px;" class="btn btn-primary"  onclick="validatesetting('edit')">	
											</div>
											</div>
											
											
											
											<%-- <div class="row">
											<div class="col-lg-4">
											<label>Text Message</label>
											<textarea rows="3" cols="" id="messageKey"></textarea>
											</div>
											<div class="col-lg-1"></div>
											<div class="col-lg-4">
											<label><spring:message code="message.key.label" /></label>
											<input type="text" class="form-control" id="messageKey" value="${smsSettings.messageKey}" />
											</div>
											</div> --%>
											
											</div>
											</fieldset>
											</div>
											
											
											<%-- <div class="col-lg-10">
												<div class="col-lg-7 col-xs-6">
													<div class="row">
														<div class="col-lg-12">
															<label>Mobile Number</label>
															<input type="text" class="form-control" id="mobileKey"
																value="${smsSettings.mobileKey}"/> 
																</div>

																<div class="col-lg-12 col-xs-6 col-sm-4">
																<label>Text Message</label>
																<textarea rows="3" cols="" id="messageKey"></textarea>
																</div>
														<div class="col-lg-12">
															<label><spring:message code="message.key.label" /></label>
															<input type="text" class="form-control" id="messageKey"
																value="${smsSettings.messageKey}" /> </div>
													</div>


												</div>



												<div class="col-lg-5 col-xs-6">
													<div class="row" style="margin-left: -2px;">

														<div class="row">
														
														
															<a  data-toggle="modal" data-target="#myModal" class="button"><spring:message
																	code="validate.label" /></a>
															<a onclick="validateUrl();" class="button"><spring:message
																	code="validate.label" /></a>
														</div>


														<div class="row">
															<a onclick="resetSettings();" class="button"><spring:message
																	code="reset.label" /></a>
														</div>
													</div>


												</div>




											</div> --%>
											
											<!-- </fieldset> -->

											<%-- <div class="col-lg-6">
												<div class="col-lg-12" style ="padding-left:0px">
													<label><spring:message code="sms.url.label" /></label> <input
														type="text" class="form-control" disabled id="smsURL"
														value="" /> 
												</div>
											</div> --%>

										</div>
									<div class="col-lg-1"></div>

									</div>

								</div>
								
								<br><br><br>

	<div class="row">
	<%-- <div class="col-lg-12">
										<div class="row" style="text-align: right;margin-top: 15px;padding: 15px;padding-right: 30px;">
											<c:forEach var="accessControl"
												items="${sessionScope.settings}">
												<c:if
													test="${accessControl.appDocument == 'SmsSettings' && accessControl.write == true}">
													
														<input type="button" id="submit"
															style="" class="btnCls"
															data-toggle="modal" data-target="#myModalSave"
															value="<spring:message code="submit.label" />">
															
															<input type="button" id="submit"
															style="" class="btnCls" onclick="Smssettingreset()";
															data-toggle="modal" data-target=""
															value="Reset">
													
												</c:if>
											</c:forEach>
											<input type="button" class="btnCls" style=""
												onclick="showCustomerSettingsFlow();"
												value="<spring:message code="cancel.label" />">
										</div>
									</div> --%>
	
	</div>



								<div class="form-group col-lg-12">
									<div class="row">
										<div class="form-group col-lg-12">
											<div class="form-group col-lg-2"
												style="padding-left: 1px; padding-right: 1px; margin-top: 8px; cursor: pointer; margin-bottom: 0px;"
												onclick="activateHeader('priceList');">
												<span
													style="font-weight: bold; font-size: 16px; color: #666; cursor: pointer;"><spring:message
														code="business.template.label" /></span>
											</div>
											<div class="col-lg-6"></div>
											
											<div class="col-lg-4" style="right:-5%;">
											<div class="col-lg-12">
										<div class="row" style="/* text-align: right;margin-top: 15px;padding: 15px;padding-right: 30px; */">
											<c:forEach var="accessControl"
												items="${sessionScope.settings}">
												<c:if
													test="${accessControl.appDocument == 'SmsSettings' && accessControl.write == true}">
													
														<input type="button" id="submit"
															style="" class="btnCls"
															data-toggle="modal" data-target="#myModalSave"
															value="<spring:message code="submit.label" />">
															
															<input type="button" id="submit"
															style="" class="btnCls" onclick="Smssettingreset()";
															data-toggle="modal" data-target=""
															value="Reset">
													
												</c:if>
											</c:forEach>
											<input type="button" class="btnCls" style=""
												onclick="showCustomerSettingsFlow();"
												value="<spring:message code="cancel.label" />">
										</div>
									</div>
											</div>
											
											<div class="form-group col-lg-10" style="margin-bottom: 4px;">
												<img
													style="float: right; cursor: pointer; margin-right: -16px; margin-top: 0px; margin-bottom: -26px"
													onclick="activateHeader('priceList');" id="priceListImg"
													alt=""<%-- src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png" --%>>
											</div>
											<hr
												style="margin-top: 31px; width: 100%; border-top: 1px solid rgb(181, 230, 29);" />
											<hr
												style="margin-top: -18px; width: 100%; border-top: 1px solid rgb(181, 230, 29);" />
										</div>
									</div>
									<!-- templates start -->




									<!-- Order Management -->
									<div class="form-group col-lg-6 col-sm-12"
										style="margin-left: -1%;">

										<div class="form-group col-lg-5 col-sm-5"
											style="padding-left: 1px; padding-right: 1px; margin-top: 8px; cursor: pointer; margin-bottom: 0px; border-bottom: 1px solid #ddd;"
											onclick="activateHeader('priceList');">
											<span
												style="font-weight: bold; font-size: 16px; color: #666; cursor: pointer;"><spring:message
													code="emailSettings.orderManagement.label" /></span>
										</div>
										<div class="form-group col-lg-10" style="margin-bottom: 8px;">

										</div>


										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													
													<c:choose>
											        <c:when test="${salesOrderB2cStatus == true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'salesOrderB2c');" id="salesOrderB2c"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'salesOrderB2c');" id="salesOrderB2c"/>
											        </c:otherwise>
											      	</c:choose>
											      
													<spring:message
														code="emailSettings.orderManagement.salesOrder_B2C" />
													<input type="hidden" id="salesBilling_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderB2cFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled"
																style="font-size: 12px; padding-right: 0px;"
																value="${salesOrderB2c}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<c:choose>
													        <c:when test="${salesOrderB2cUrl ne null and salesOrderB2cUrl ne '' }" >
													         <%-- <c:when test="${salesOrderB2cStatus == true }" > --%>
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderB2cBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('salesOrderB2c',this);"
																	class="upload" > <input type="hidden"
																	id="salesOrderB2c_refId">
															</div>
													        </c:when>
													        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderB2cBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('salesOrderB2c',this);"
																	class="upload" disabled="disabled" > <input type="hidden"
																	id="salesOrderB2c_refId">
															</div>
													        </c:otherwise>
													      	</c:choose>
															
															

														</div>
													</div>

												</div>

												<c:if
													test="${salesOrderB2cUrl ne null and salesOrderB2cUrl ne '' }">
                                                <%-- <c:if test="${salesOrderB2cStatus == true }"> --%>
													<a href="${salesOrderB2cUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>



<%-- 

										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="salesOrderB2cui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderB2cuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${salesOrderB2cui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderB2cuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('salesOrderB2cui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${salesOrderB2cuiUrl ne null and salesOrderB2cuiUrl ne '' }">

													<a href="${salesOrderB2cuiUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

 --%>






<%-- 


										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.orderManagement.salesOrder_Direct" />
													<input type="hidden" id="salesBilling_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderDirectdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style=""
																value="${salesOrderDirectdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderDirectdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('salesOrderDirectdata',this);"
																	class="upload"> <input type="hidden"
																	id="salesOrderDirectdata_refId">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${salesOrderDirectdataUrl ne null and salesOrderDirectdataUrl ne '' }">
													<a href="${salesOrderDirectdataUrl}"
														style="cursor: pointer;" target="_blank"> <i
														class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

 --%>


<%-- 
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="salesOrderDirectui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderDirectuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${salesOrderDirectui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderDirectuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('salesOrderDirectui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${salesOrderDirectuiUrl ne null and salesOrderDirectuiUrl ne '' }">
													<a href="${salesOrderDirectuiUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>


 --%>

<%-- 



										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.orderManagement.salesOrder_Mobile" />
													<input type="hidden" id="salesBillingdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderMobiledataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style=""
																value="${salesOrderMobiledata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderMobiledataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('salesOrderMobiledata',this);"
																	class="upload"> <input type="hidden"
																	id="salesOrderMobiledata_refId">
															</div>

														</div>
													</div>

												</div>
												<c:if
													test="${salesOrderMobiledataUrl ne null and salesOrderMobiledataUrl ne '' }">
													<a href="${salesOrderMobiledataUrl}"
														style="cursor: pointer;" target="_blank"> <i
														class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

 --%>


<%-- 
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="salesOrderMobileui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderMobileuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${salesOrderMobileui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderMobileuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('salesOrderMobileui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>


												<c:if
													test="${salesOrderMobileuiUrl ne null and salesOrderMobileuiUrl ne '' }">
													<a href="${salesOrderMobileuiUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>



 --%>








<%-- 
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class=" col-lg-4 col-sm-12" style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.orderManagement.salesOrder_Telephone" />
													<input type="hidden" id="salesOrderTelephonicdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 93%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderTelephonicdataFile"
																class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style=""
																value="${salesOrderTelephonicdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderTelephonicdataBtn" type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('salesOrderTelephonicdata',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${salesOrderTelephonicdataUrl ne null and salesOrderTelephonicdataUrl ne '' }">
													<a href="${salesOrderTelephonicdataUrl}"
														style="cursor: pointer;" target="_blank"> <i
														class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div> --%>
										
										
										
										
										
										


<%-- 
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="salesOrderTelephonicui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="salesOrderTelephonicuiFile"
																class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${salesOrderTelephonicui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="salesOrderTelephonicuiBtn" type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('salesOrderTelephonicui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${salesOrderTelephonicuiUrl ne null and salesOrderTelephonicuiUrl ne '' }">
													<a href="${salesOrderTelephonicuiUrl}"
														style="cursor: pointer;" target="_blank"> <i
														class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

 --%>





										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class=" col-lg-4 col-sm-12" style="padding-right: 0px;">
													<%-- <c:if test="${billDetailsdataUrl ne null and billDetailsdataUrl ne '' }">
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'billDetailsdata');" id="billDetailsdata"/>
													</c:if> --%>
													<%-- <c:if test="${billDetailsdataUrl eq null or billDetailsdataUrl eq '' }"> --%>
													<%-- <c:if test="${billDetailsdataUrl eq null or billDetailsdataUrl eq '' }">
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'billDetailsdata');" id="billDetailsdata"/>
													</c:if> --%>
													<c:choose>
													 <c:when test="${billDetailsdataStatus == true }">
													   <input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'billDetailsdata');" id="billDetailsdata"/>

													 </c:when>
													 <c:otherwise>
													 <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'billDetailsdata');" id="billDetailsdata"/>
													 </c:otherwise>
													</c:choose>
													<spring:message code="bill.details.label" />
													<input type="hidden" id="billDetailsdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 93%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="billDetailsdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="" value="${billDetailsdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<c:choose>
															<c:when test="${billDetailsdataUrl ne null and billDetailsdataUrl ne '' }">
															<%-- <c:when test="${billDetailsdataStatus == true }"> --%>
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="billDetailsdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('billDetailsdata',this);"
																	class="upload">
															</div>
															</c:when>
															<c:otherwise >
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="billDetailsdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('billDetailsdata',this);"
																	class="upload" disabled="disabled">
															</div>
															</c:otherwise>
															</c:choose>

														</div>
													</div>

												</div>

												<c:if test="${billDetailsdataUrl ne null and billDetailsdataUrl ne '' }">
												<%-- <c:if test="${billDetailsdataStatus == true }"> --%>
													<a href="${billDetailsdataUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

<%-- 

										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="billDetailscui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="billDetailscuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${billDetailscui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="billDetailscuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('billDetailscui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if test="${billinguiUrl ne null and billinguiUrl ne '' }">
													<a href="${billinguiUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>


 --%>



























										<!-- outlet Stock managment -->
										<div class="form-group col-lg-5 col-sm-5"
											style="padding-left: 1px; padding-right: 1px; margin-top: 8px; cursor: pointer; margin-bottom: 0px; border-bottom: 1px solid #ddd;"
											onclick="activateHeader('priceList');">
											<span
												style="font-weight: bold; /* margin-right: 8px; */ font-size: 16px; color: #666; cursor: pointer;"><spring:message
													code="emailSettings.outlet_stock_management.label" /></span>
										</div>

										<div class="form-group col-lg-10" style="margin-bottom: 10px;">

										</div>


										<div class="form-group col-lg-10" style="margin-bottom: 10px;">

										</div>
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													
													<c:choose>
											        <%-- <c:when test="${stockReceiptdataUrl ne null and stockReceiptdataUrl ne '' }" > --%>
											         <c:when test="${stockReceiptdataStatus == true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockReceiptdata');" id="stockReceiptdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockReceiptdata');" id="stockReceiptdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message
														code="emailSettings.outlet_stock_management.stock_receipt" />
													<input type="hidden" id="stockReceiptdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 2px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockReceiptdataFile" disabled="disabled"
																class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																style="padding-right: 0px;" value="${stockReceiptdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${stockReceiptdataUrl ne null and stockReceiptdataUrl ne '' }" >
													<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReceiptdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('stockReceiptdata',this);"
																	class="upload" >
															</div>
											        </c:when>
											        <c:otherwise>
													<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReceiptdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('stockReceiptdata',this);"
																	class="upload" disabled="disabled" >
													</div>
											        </c:otherwise>
											      	</c:choose>
											      	
														</div>
													</div>

												</div>

												<c:if
													test="${stockReceiptdataUrl ne null and stockReceiptdataUrl ne '' }">
													<a href="${stockReceiptdataUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

<%-- 
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="stockReceiptui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockReceiptuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${stockReceiptui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReceiptuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('stockReceiptui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${stockReceiptuiUrl ne null and stockReceiptuiUrl ne '' }">
													<a href="${stockReceiptuiUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>


 --%>

										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<c:choose>
											       <%--  <c:when test="${stockIssuedataUrl ne null and stockIssuedataUrl ne '' }" > --%>
											        <c:when test="${stockIssuedataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockIssuedata');" id="stockIssuedata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockIssuedata');" id="stockIssuedata"/>
											        </c:otherwise>
											      	</c:choose>
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockIssuedata');" id="stockIssuedata"/>  -->
													<spring:message
														code="emailSettings.outlet_stock_management.stock_issue" />
													<input type="hidden" id="stockIssuedata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockIssuedataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="padding-right: 0px;"
																value="${stockIssuedata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${stockIssuedataUrl ne null and stockIssuedataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockIssuedataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('stockIssuedata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockIssuedataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('stockIssuedata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${stockIssuedataUrl ne null and stockIssuedataUrl ne '' }">
													<a href="${stockIssuedataUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>



<%-- 

										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="stockIssueui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockIssueuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${stockIssueui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockIssueuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('stockIssueui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${stockIssueuiUrl ne null and stockIssueuiUrl ne '' }">
													<a href="${stockIssueuiUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>




 --%>





										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													
													<c:choose>
											        <%-- <c:when test="${stockRequestdataUrl ne null and stockRequestdataUrl ne '' }" > --%>
											        <c:when test="${stockRequestdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockRequestdata');" id="stockRequestdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockRequestdata');" id="stockRequestdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockRequestdata');" id="stockRequestdata"/>  -->
													<spring:message
														code="emailSettings.outlet_stock_management.stock_request" />
													<input type="hidden" id="stockRequestdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockRequestdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="padding-right: 0px;"
																value="${stockRequestdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${stockRequestdataUrl ne null and stockRequestdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockRequestdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('stockRequestdata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockRequestdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('stockRequestdata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	
														</div>
													</div>

												</div>

												<c:if
													test="${stockRequestdataUrl ne null and stockRequestdataUrl ne '' }">
													<a href="${stockRequestdataUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>
											</div>
										</div>

<%-- 
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="stockRequest_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockReceiptuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${stockRequestui }">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReceiptuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('stockRequestui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${stockRequestuiUrl ne null and stockRequestuiUrl ne '' }">
													<a href="${stockRequestuiUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>



 --%>







										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													
													<c:choose>
											       <%--  <c:when test="${stockReturndataUrl ne null and stockReturndataUrl ne '' }" > --%>
											        <c:when test="${stockReturndataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockReturndata');" id="stockReturndata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockReturndata');" id="stockReturndata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockReturndata');" id="stockReturndata"/> -->
													<spring:message
														code="emailSettings.outlet_stock_management.stock_return" />
													<input type="hidden" id="stockReturndata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockReturndataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="padding-right: 0px;"
																value="${stockReturndata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${stockReturndataUrl ne null and stockReturndataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReturndataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('stockReturndata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReturndataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('stockReturndata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	
															

														</div>
													</div>

												</div>

												<c:if
													test="${stockReturndataUrl ne null and stockReturndataUrl ne '' }">
													<a href="${stockReturndataUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>
											</div>
										</div>


<%-- 
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="stockReturnui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockReturnuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${stockReturnui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockReturnuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('stockReturnui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${stockReturnuiUrl ne null and stockReturnuiUrl ne '' }">
													<a href="${stockReturnuiUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>
 --%>










										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'inventoryAlertsdata');" id="inventoryAlertsdata"/> -->
													
													<c:choose>
											        <%-- <c:when test="${inventoryAlertsdataUrl ne null and inventoryAlertsdataUrl ne '' }" > --%>
											        <c:when test="${inventoryAlertsdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'inventoryAlertsdata');" id="inventoryAlertsdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'inventoryAlertsdata');" id="inventoryAlertsdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message
														code="emailSettings.outlet_stock_management.inventory_alerts" />
													<input type="hidden" id="inventoryAlertsdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="inventoryAlertsdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="padding-right: 0px;"
																value="${inventoryAlertsdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${inventoryAlertsdataUrl ne null and inventoryAlertsdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="inventoryAlertsdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('inventoryAlertsdata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="inventoryAlertsdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('inventoryAlertsdata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${inventoryAlertsdataUrl ne null and inventoryAlertsdataUrl ne '' }">
													<a href="${inventoryAlertsdataUrl}"
														style="cursor: pointer;" target="_blank"> <i
														class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

<%-- 
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="inventoryAlertsui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="inventoryAlertsuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${inventoryAlertsui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="inventoryAlertsuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('inventoryAlertsui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${inventoryAlertsuiUrl ne null and inventoryAlertsuiUrl ne '' }">
													<a href="${inventoryAlertsuiUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

 --%>







										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockVerificationdata');" id="stockVerificationdata"/> -->
													<c:choose>
											        <%-- <c:when test="${stockVerificationdataUrl ne null and stockVerificationdataUrl ne '' }" > --%>
											        <c:when test="${stockVerificationdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockVerificationdata');" id="stockVerificationdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'stockVerificationdata');" id="stockVerificationdata"/>
											        </c:otherwise>
											      	</c:choose>
													<spring:message
														code="emailSettings.outlet_stock_management.stock_verification" />
													<input type="hidden" id="stockVerificationdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockVerificationdataFile"
																class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="padding-right: 0px;"
																value="${stockVerificationdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${stockVerificationdataUrl ne null and stockVerificationdataUrl ne '' }" >
													<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockVerificationdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('stockVerificationdata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
													<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockVerificationdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('stockVerificationdata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${stockVerificationdataUrl ne null and stockVerificationdataUrl ne '' }">
													<a href="${stockVerificationdataUrl}"
														style="cursor: pointer;" target="_blank"> <i
														class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>



<%-- 

										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="stockVerificationui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="stockVerificationuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${stockVerificationui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="stockVerificationuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('stockVerificationui',this);"
																	class="upload">
															</div>

														</div>
													</div>
												</div>

												<c:if
													test="${stockVerificationuiUrl ne null and stockVerificationuiUrl ne '' }">
													<a href="${stockVerificationuiUrl}"
														style="cursor: pointer;" target="_blank"> <i
														class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>


 --%>
 
 
 										<div class="form-group col-lg-6 col-sm-6"
											style="padding-left: 1px; padding-right: 1px; margin-top: 8px; cursor: pointer; margin-bottom: 0px; border-bottom: 1px solid #ddd;"
											onclick="activateHeader('priceList');">
											<span
												style="font-weight: bold; /* margin-right: 8px; */ font-size: 16px; color: #666; cursor: pointer;"><spring:message
													code="warehouse.stock.management.label" /></span>
										</div>

										<div class="form-group col-lg-10" style="margin-bottom: 10px;">

										</div>


										<div class="form-group col-lg-10" style="margin-bottom: 10px;">

										</div>
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'whStockReceiptdata');" id="whStockReceiptdata"/> -->
													<c:choose>
											        <%-- <c:when test="${whStockReceiptdataUrl ne null and whStockReceiptdataUrl ne '' }" > --%>
											        <c:when test="${whStockReceiptdataStatus ==  true}" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'whStockReceiptdata');" id="whStockReceiptdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'whStockReceiptdata');" id="whStockReceiptdata"/>
											        </c:otherwise>
											      	</c:choose>
													<spring:message
														code="emailSettings.outlet_stock_management.stock_receipt" />
													<input type="hidden" id="whStockReceiptdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 2px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="whStockReceiptdataFile" disabled="disabled"
																class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																style="padding-right: 0px;" value="${whStockReceiptdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${whStockReceiptdataUrl ne null and whStockReceiptdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="whStockReceiptdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('whStockReceiptdata',this);"
																	class="upload" >
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="whStockReceiptdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('whStockReceiptdata',this);"
																	class="upload" disabled="disabled" >
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${whStockReceiptdataUrl ne null and whStockReceiptdataUrl ne '' }">
													<a href="${whStockReceiptdataUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>


										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'whStockIssuedata');" id="whStockIssuedata"/> -->
													<c:choose>
											        <%-- <c:when test="${whStockIssuedataUrl ne null and whStockIssuedataUrl ne '' }" > --%>
											        <c:when test="${whStockIssuedataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'whStockIssuedata');" id="whStockIssuedata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'whStockIssuedata');" id="whStockIssuedata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message
														code="emailSettings.outlet_stock_management.stock_issue" />
													<input type="hidden" id="whStockIssuedata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="whStockIssuedataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="padding-right: 0px;"
																value="${whStockIssuedata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${whStockIssuedataUrl ne null and whStockIssuedataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="whStockIssuedataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('whStockIssuedata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="whStockIssuedataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('whStockIssuedata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${whStockIssuedataUrl ne null and whStockIssuedataUrl ne '' }">
													<a href="${whStockIssuedataUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>







										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'whStockRequestdata');" id="whStockRequestdata"/> -->
													<c:choose>
											        <%-- <c:when test="${whStockRequestdataUrl ne null and whStockRequestdataUrl ne '' }" > --%>
											        <c:when test="${whStockRequestdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'whStockRequestdata');" id="whStockRequestdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'whStockRequestdata');" id="whStockRequestdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message
														code="emailSettings.outlet_stock_management.stock_request" />
													<input type="hidden" id="whStockRequestdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="whStockRequestdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="padding-right: 0px;"
																value="${whStockRequestdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${whStockRequestdataUrl ne null and whStockRequestdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="whStockRequestdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('whStockRequestdata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
													<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="whStockRequestdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('whStockRequestdata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>

														</div>
													</div>

												</div>

												<c:if
													test="${whStockRequestdataUrl ne null and whStockRequestdataUrl ne '' }">
													<a href="${whStockRequestdataUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>
											</div>
										</div>








										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'whStockReturndata');" id="whStockReturndata"/> -->
													<c:choose>
											       <%--  <c:when test="${whStockReturndataUrl ne null and whStockReturndataUrl ne '' }" > --%>
											       <c:when test="${whStockReturndataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'whStockReturndata');" id="whStockReturndata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'whStockReturndata');" id="whStockReturndata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message
														code="emailSettings.outlet_stock_management.stock_return" />
													<input type="hidden" id="whStockReturndata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="whStockReturndataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="padding-right: 0px;"
																value="${whStockReturndata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${whStockReturndataUrl ne null and whStockReturndataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="whStockReturndataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('whStockReturndata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="whStockReturndataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('whStockReturndata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>

														</div>
													</div>

												</div>

												<c:if
													test="${whStockReturndataUrl ne null and whStockReturndataUrl ne '' }">
													<a href="${whStockReturndataUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>
											</div>
										</div>


										<div class="form-group col-lg-5 col-sm-5"
											style="padding-left: 1px; padding-right: 1px; margin-top: 8px; cursor: pointer; margin-bottom: 0px; border-bottom: 1px solid #ddd;"
											onclick="activateHeader('priceList');">
											<span
												style="font-weight: bold; font-size: 16px; color: #666; cursor: pointer;"><spring:message
													code="emailSettings.B2C_Management.label" /></span>
										</div>
										<div class="form-group col-lg-10" style="margin-bottom: 5px;">

										</div>
										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerRegistrationdata');" id="customerRegistrationdata"/> -->
													<c:choose>
											        <%-- <c:when test="${customerRegistrationdataUrl ne null and customerRegistrationdataUrl ne '' }" > --%>
											        <c:when test="${customerRegistrationdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerRegistrationdata');" id="customerRegistrationdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerRegistrationdata');" id="customerRegistrationdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message code="emailSettings.customerRegistration" />
													<input type="hidden" id="customerRegistrationdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 93%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerRegistrationdataFile"
																class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="padding-right: 0px;"
																value="${customerRegistrationdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${customerRegistrationdataUrl ne null and customerRegistrationdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerRegistrationdataBtn" type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('customerRegistrationdata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerRegistrationdataBtn" type="file"
																	accept=".xml"
																	onchange="addNameToTextBox('customerRegistrationdata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>
															

														</div>
													</div>

												</div>

												<c:if
													test="${customerRegistrationdataUrl ne null and customerRegistrationdataUrl ne '' }">
													<a href="${customerRegistrationdataUrl}"
														style="cursor: pointer;" target="_blank"> <i
														class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>



<%-- 

										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="customerRegistrationui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerRegistrationuiFile"
																class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${customerRegistrationui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerRegistrationuiBtn" type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('customerRegistrationui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${customerRegistrationuiUrl ne null and customerRegistrationuiUrl ne '' }">
													<a href="${customerRegistrationuiUrl}"
														style="cursor: pointer;" target="_blank"> <i
														class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>



 --%>





										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerUpdatedata');" id="customerUpdatedata"/> -->
													<c:choose>
											        <%-- <c:when test="${customerUpdatedataUrl ne null and customerUpdatedataUrl ne '' }" > --%>
											        <c:when test="${customerUpdatedataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerUpdatedata');" id="customerUpdatedata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerUpdatedata');" id="customerUpdatedata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message code="emailSettings.customerProfile_update" />
													<input type="hidden" id="customerUpdatedata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerUpdatedataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="padding-right: 0px;"
																value="${customerUpdatedata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${customerUpdatedataUrl ne null and customerUpdatedataUrl ne '' }" >
													<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerUpdatedataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('customerUpdatedata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
													<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerUpdatedataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('customerUpdatedata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>

														</div>
													</div>

												</div>

												<c:if
													test="${customerUpdatedataUrl ne null and customerUpdatedataUrl ne '' }">
													<a href="${customerUpdatedataUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>


<%-- 

										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="customerUpdateui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerUpdateuiFile" class="form-control"
																placeholder="choose file" disabled="disabled"
																multiple="multiple" style="" value="${customerUpdateui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerUpdateuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('customerUpdateui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${customerUpdateuiUrl ne null and customerUpdateuiUrl ne '' }">
													<a href="${customerUpdateuiUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>


 --%>





										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'loginPassworddata');" id="loginPassworddata"/> -->
													<c:choose>
											        <%-- <c:when test="${loginPassworddataUrl ne null and loginPassworddataUrl ne '' }" > --%>
											        <c:when test="${loginPassworddataStatus ==  true }" >
											         <input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'loginPassworddata');" id="loginPassworddata"/>
											        </c:when>
													
											        
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'loginPassworddata');" id="loginPassworddata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message code="emailSettings.login_password" />
													<input type="hidden" id="loginPassworddata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="loginPassworddataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="padding-right: 0px;"
																value="${loginPassworddata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${loginPassworddataUrl ne null and loginPassworddataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="loginPassworddataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('loginPassworddata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="loginPassworddataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('loginPassworddata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${loginPassworddataUrl ne null and loginPassworddataUrl ne '' }">
													<a href="${loginPassworddataUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>





										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerActivationdata');" id="customerActivationdata"/> -->
													<c:choose>
											        <%-- <c:when test="${customerActivationdataUrl ne null and customerActivationdataUrl ne '' }" > --%>
											        <c:when test="${customerActivationdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerActivationdata');" id="customerActivationdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerActivationdata');" id="customerActivationdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message code="customer.activation.label" />
													<input type="hidden" id="customerActivationdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerActivationdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="padding-right: 0px;"
																value="${customerActivationdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
											        <c:when test="${customerActivationdataUrl ne null and customerActivationdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerActivationdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('customerActivationdata',this);"
																	class="upload" >
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerActivationdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('customerActivationdata',this);"
																	class="upload" disabled="disabled" >
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${customerActivationdataUrl ne null and customerActivationdataUrl ne '' }">
													<a href="${customerActivationdataUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>




										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOTPdata');" id="customerOTPdata"/> -->
													<c:choose>
											        <c:when test="${customerOTPdataStatus == true}" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOTPdata');" id="customerOTPdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOTPdata');" id="customerOTPdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message code="customer.otp.label" />
													<input type="hidden" id="customerOTPdata_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerOTPdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="padding-right: 0px;"
																value="${customerOTPdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${customerOTPdataUrl ne null and customerOTPdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerOTPdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('customerOTPdata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
													<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerOTPdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('customerOTPdata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${customerOTPdataUrl ne null and customerOTPdataUrl ne '' }">
													<a href="${customerOTPdataUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>




<%-- 

										<div style="padding-left: 0px;" class="col-lg-12">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-4 col-sm-12"
													style="padding-right: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="loginPasswordui_refId">
												</div>
												<div
													class="form-group col-lg-6 col-sm-12 col-xs-12 columnpadding"
													style="padding-right: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 93%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="loginPassworduiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${loginPasswordui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="loginPassworduiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('loginPasswordui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${loginPassworduiUrl ne null and loginPassworduiUrl ne '' }">
													<a href="${loginPassworduiUrl}" style="cursor: pointer;"
														target="_blank"> <i class="fa fa-file-code-o  fa-2x"
														aria-hidden="true" style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

 --%>
									</div>
									<div class="form-group col-lg-6 col-sm-12"
										style="margin-left: 1%;">
										<div class="col-lg-1"></div>
										<div class="form-group col-lg-3 col-sm-3"
											style="padding-left: 1px; padding-right: 1px; margin-top: 8px; cursor: pointer; margin-bottom: 0px; border-bottom: 1px solid #ddd; margin-left: 0px;"
											onclick="activateHeader('priceList');">
											<span
												style="font-weight: bold; font-size: 16px; color: #666; cursor: pointer;"><spring:message
													code="emailSettings.procurement.label" /></span>
										</div>
										<div class="form-group col-lg-10 col-sm-4"
											style="margin-bottom: 10px;"></div>

										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'purchaseRequestdata');" id="purchaseRequestdata"/> -->
													<c:choose>
											        <%-- <c:when test="${purchaseRequestdataUrl ne null and purchaseRequestdataUrl ne '' }" > --%>
											        <c:when test="${purchaseRequestdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'purchaseRequestdata');" id="purchaseRequestdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'purchaseRequestdata');" id="purchaseRequestdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message
														code="emailSettings.procurement.purchase_request_for_Quotation.label" />
													<input type="hidden" id="purchaseRequestdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="purchaseRequestdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style=""
																value="${purchaseRequestdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${purchaseRequestdataUrl ne null and purchaseRequestdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="purchaseRequestdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('purchaseRequestdata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="purchaseRequestdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('purchaseRequestdata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${purchaseRequestdataUrl ne null and purchaseRequestdataUrl ne '' }">
													<a href="${purchaseRequestdataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">

														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>


<%-- 
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="purchaseRequestui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="purchaseRequestuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${purchaseRequestui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="purchaseRequestuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('purchaseRequestui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>
												<c:if
													test="${purchaseRequestuiUrl ne null and purchaseRequestuiUrl ne '' }">
													<a href="${purchaseRequestuiUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

 --%>






										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'purchaseOrderdata');" id="purchaseOrderdata"/> -->
													<c:choose>
											       <%--  <c:when test="${purchaseOrderdataUrl ne null and purchaseOrderdataUrl ne '' }" > --%>
											        <c:when test="${purchaseOrderdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'purchaseOrderdata');" id="purchaseOrderdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'purchaseOrderdata');" id="purchaseOrderdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />
													<input type="hidden" id="purchaseOrderdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="purchaseOrderdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" multiple="multiple" style=""
																value="${purchaseOrderdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
													<c:choose>
											        <c:when test="${purchaseOrderdataUrl ne null and purchaseOrderdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="purchaseOrderdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('purchaseOrderdata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="purchaseOrderdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('purchaseOrderdata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${purchaseOrderdataUrl ne null and purchaseOrderdataUrl ne '' }">
													<a href="${purchaseOrderdataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>
										<%-- 
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="purchaseOrderui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="purchaseOrderuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${purchaseOrderui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="purchaseOrderuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('purchaseOrderui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${purchaseOrderuiUrl ne null and purchaseOrderuiUrl ne '' }">
													<a href="${purchaseOrderuiUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>
										 --%>
										
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentNotedata');" id="shippmentNotedata"/> -->
													<c:choose>
											       <%--  <c:when test="${shippmentNotedataUrl ne null and shippmentNotedataUrl ne '' }" > --%>
											        <c:when test="${shippmentNotedataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentNotedata');" id="shippmentNotedata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentNotedata');" id="shippmentNotedata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message
														code="emailSettings.procurement.shipmentNote" />
													<input type="hidden" id="shippmentNotedata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="shippmentNotedataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style=""
																value="${shippmentNotedata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															
													<c:choose>
											        <c:when test="${shippmentNotedataUrl ne null and shippmentNotedataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentNotedataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('shippmentNotedata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentNotedataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('shippmentNotedata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${shippmentNotedataUrl ne null and shippmentNotedataUrl ne '' }">
													<a href="${shippmentNotedataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>
										
										
										
										
										
												<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shipmentReturndata');" id="shipmentReturndata"/> -->
													<c:choose>
											        <%-- <c:when test="${shipmentReturndataUrl ne null and shipmentReturndataUrl ne '' }" > --%>
											        <c:when test="${shipmentReturndataStatus ==  true}" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'shipmentReturndata');" id="shipmentReturndata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shipmentReturndata');" id="shipmentReturndata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message
														code="emailSettings.procurement.shipment_returns" />
													<input type="hidden" id="shipmentReturndata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="shipmentReturndataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style=""
																value="${shipmentReturndata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
											        <c:when test="${shipmentReturndataUrl ne null and shipmentReturndataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shipmentReturndataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('shipmentReturndata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shipmentReturndataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('shipmentReturndata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${shipmentReturndataUrl ne null and shipmentReturndataUrl ne '' }">
													<a href="${shipmentReturndataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>
										
										

<%-- 
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="shippmentNoteui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="shippmentNoteuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${shippmentNoteui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentNoteuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('shippmentNoteui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${shippmentNoteuiUrl ne null and shippmentNoteuiUrl ne '' }">
													<a href="${shippmentNoteuiUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

 --%>


										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentReceiptdata');" id="shippmentReceiptdata"/> -->
													<c:choose>
											        <%-- <c:when test="${shippmentReceiptdataUrl ne null and shippmentReceiptdataUrl ne '' }" > --%>
											        <c:when test="${shippmentReceiptdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentReceiptdata');" id="shippmentReceiptdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentReceiptdata');" id="shippmentReceiptdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message
														code="emailSettings.procurement.shipment_receipt" />
													<input type="hidden" id="shippmentReceiptdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 109%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="shippmentReceiptdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style=""
																value="${shippmentReceiptdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<!--  -->
															
															<c:choose>
											        <c:when test="${shippmentReceiptdataUrl ne null and shippmentReceiptdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentReceiptdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('shippmentReceiptdata',this);"
																	class="upload" >
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentReceiptdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('shippmentReceiptdata',this);"
																	class="upload" disabled="disabled" >
															</div>
											        </c:otherwise>
											      	</c:choose>

														</div>
													</div>

												</div>

												<c:if
													test="${shippmentReceiptdataUrl ne null and shippmentReceiptdataUrl ne '' }">
													<a href="${shippmentReceiptdataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

									<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'whShipmentReceiptdata');" id="whShipmentReceiptdata"/> -->
													<c:choose>
											        <%-- <c:when test="${whShipmentReceiptdataUrl ne null and whShipmentReceiptdataUrl ne '' }" > --%>
											        <c:when test="${whShipmentReceiptdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'whShipmentReceiptdata');" id="whShipmentReceiptdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'whShipmentReceiptdata');" id="whShipmentReceiptdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													Warehouse <spring:message
														code="emailSettings.procurement.shipment_receipt" />
													<input type="hidden" id="whShipmentReceiptdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 109%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="whShipmentReceiptdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style=""
																value="${whShipmentReceiptdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
											        <c:when test="${whShipmentReceiptdataUrl ne null and whShipmentReceiptdataUrl ne '' }" >
													<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="whShipmentReceiptdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('whShipmentReceiptdata',this);"
																	class="upload" >
															</div>
											        </c:when>
											        <c:otherwise>
													<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="whShipmentReceiptdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('whShipmentReceiptdata',this);"
																	class="upload" disabled="disabled" >
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${whShipmentReceiptdataUrl ne null and whShipmentReceiptdataUrl ne '' }">
													<a href="${whShipmentReceiptdataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>




<%-- 
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="shippmentReceiptui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="shippmentReceiptuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${shippmentReceiptui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentReceiptuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('shippmentReceiptui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${shippmentReceiptuiUrl ne null and shippmentReceiptuiUrl ne '' }">
													<a href="${shippmentReceiptuiUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

 --%>





										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentInspectiondata');" id="shippmentInspectiondata"/> -->
													<c:choose>
											        <%-- <c:when test="${shippmentInspectiondataUrl ne null and shippmentInspectiondataUrl ne '' }" > --%>
											        <c:when test="${shippmentInspectiondataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentInspectiondata');" id="shippmentInspectiondata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'shippmentInspectiondata');" id="shippmentInspectiondata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message
														code="emailSettings.procurement.shipment_inspection" />
													<input type="hidden" id="shippmentInspectiondata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="shippmentInspectiondataFile"
																class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style=""
																value="${shippmentInspectiondata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															
													<c:choose>
											        <c:when test="${shippmentInspectiondataUrl ne null and shippmentInspectiondataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentInspectiondataBtn" type="file"
																	accept=".xml" 
																	onchange="addNameToTextBox('shippmentInspectiondata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentInspectiondataBtn" type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('shippmentInspectiondata',this);"
																	class="upload">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${shippmentInspectiondataUrl ne null and shippmentInspectiondataUrl ne '' }">
													<a href="${shippmentInspectiondataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>



<%-- 


										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="shippmentInspectionui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="shippmentInspectionuiFile"
																class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${shippmentInspectionui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="shippmentInspectionuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('shippmentInspectionui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${shippmentInspectionuiUrl ne null and shippmentInspectionuiUrl ne '' }">
													<a href="${shippmentInspectionuiUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>
										 --%>
										
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'invoicingdata');" id="invoicingdata"/> -->
													<c:choose>
											        <%-- <c:when test="${invoicingdataUrl ne null and invoicingdataUrl ne '' }" > --%>
											        <c:when test="${invoicingdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'invoicingdata');" id="invoicingdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'invoicingdata');" id="invoicingdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message code="emailSettings.procurement.invoicing" />
													<input type="hidden" id="invoicingdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="invoicingdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="" value="${invoicingdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<!-- -->
															<c:choose>
											        <c:when test="${invoicingdataUrl ne null and invoicingdataUrl ne '' }" >
													<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="invoicingdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('invoicingdata',this);"
																	class="upload" >
															</div> 
											        </c:when>
											        <c:otherwise>
													<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="invoicingdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('invoicingdata',this);"
																	class="upload" disabled="disabled" >
															</div> 
											        </c:otherwise>
											      	</c:choose>

														</div>
													</div>

												</div>

												<c:if
													test="${invoicingdataUrl ne null and invoicingdataUrl ne '' }">
													<a href="${invoicingdataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

<%-- 
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="invoicingui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="invoicinguiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${invoicingui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="invoicinguiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('invoicingui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${invoicinguiUrl ne null and invoicinguiUrl ne '' }">
													<a href="${invoicinguiUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>


 --%>





										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'paymentsdata');" id="paymentsdata"/> -->
													<c:choose>
											        <%-- <c:when test="${paymentsdataUrl ne null and paymentsdataUrl ne '' }" > --%>
											        <c:when test="${paymentsdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'paymentsdata');" id="paymentsdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'paymentsdata');" id="paymentsdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message code="emailSettings.procurement.payments" />
													<input type="hidden" id="paymentsdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 109%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="paymentsdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="" value="${paymentsdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
											        <c:when test="${paymentsdataUrl ne null and paymentsdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="paymentsdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('paymentsdata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="paymentsdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('paymentsdata',this);"
																	class="upload" disabled="disabled">
															</div>
											        </c:otherwise>
											      	</c:choose>

														</div>
													</div>

												</div>


												<c:if
													test="${paymentsdataUrl ne null and paymentsdataUrl ne '' }">
													<a href="${paymentsdataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>


											</div>
										</div>



<%-- 

										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="paymentsui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="paymentsuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${paymentsui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="paymentsuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('paymentsui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${paymentsuiUrl ne null and paymentsuiUrl ne '' }">
													<a href="${paymentsuiUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>
 --%>
										<div class="col-lg-1"></div>
										<div onclick="activateHeader('priceList');"
											style="padding-left: 1px; padding-right: 1px; margin-top: 8px; cursor: pointer; margin-bottom: 0px; border-bottom: 1px solid #ddd; margin-left: 0px;"
											class="form-group col-lg-1 col-sm-1">
											<span
												style="font-weight: bold; font-size: 16px; color: #666; cursor: pointer;"><spring:message
													code="emailSettings.CRM.label" /></span>
										</div>

										<div class="form-group col-lg-10" style="margin-bottom: 5px;">

										</div>



										<div class="col-lg-12 col-sm-12"
											style="padding-right: 0px; margin-top: 12px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerComplaintsdata');" id="customerComplaintsdata"/> -->
													<c:choose>
											        <%-- <c:when test="${customerComplaintsdataUrl ne null and customerComplaintsdataUrl ne '' }" > --%>
											        <c:when test="${customerComplaintsdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerComplaintsdata');" id="customerComplaintsdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerComplaintsdata');" id="customerComplaintsdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message
														code="emailSettings.customer_complaints.label" />
													<input type="hidden" id="customerComplaintsdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerComplaintsdataFile"
																class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style=""
																value="${customerComplaintsdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
											        <c:when test="${customerComplaintsdataUrl ne null and customerComplaintsdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerComplaintsdataBtn" type="file"
																	accept=".xml" 
																	onchange="addNameToTextBox('customerComplaintsdata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerComplaintsdataBtn" type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('customerComplaintsdata',this);"
																	class="upload">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>


												<c:if
													test="${customerComplaintsdataUrl ne null and customerComplaintsdataUrl ne '' }">
													<a href="${customerComplaintsdataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>



<%-- 
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="customerComplaintsui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerComplaintsuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${customerComplaintsui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerComplaintsuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('customerComplaintsui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${customerComplaintsuiUrl ne null and customerComplaintsuiUrl ne '' }">
													<a href="${customerComplaintsuiUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>
 --%>









										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerFeedbackdata');" id="customerFeedbackdata"/> -->
													
													<c:choose>
											        <%-- <c:when test="${customerFeedbackdataUrl ne null and customerFeedbackdataUrl ne '' }" > --%>
											        <c:when test="${customerFeedbackdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerFeedbackdata');" id="customerFeedbackdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerFeedbackdata');" id="customerFeedbackdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message
														code="emailSettings.customer_feedback.label" />
													<input type="hidden" id="customerFeedbackdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerFeedbackdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style=""
																value="${customerFeedbackdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
											        <c:when test="${customerFeedbackdataUrl ne null and customerFeedbackdataUrl ne '' }" >
													<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerFeedbackdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('customerFeedbackdata',this);"
																	class="upload" >
															</div>
											        </c:when>
											        <c:otherwise>
													<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerFeedbackdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('customerFeedbackdata',this);"
																	class="upload" disabled="disabled" >
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${customerFeedbackdataUrl ne null and customerFeedbackdataUrl ne '' }">
													<a href="${customerFeedbackdataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

<%-- 

										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="customerFeedbackui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="customerFeedbackuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${customerFeedbackui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="customerFeedbackuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('customerFeedbackui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${customerFeedbackuiUrl ne null and customerFeedbackuiUrl ne '' }">
													<a href="${customerFeedbackuiUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>


 --%>





										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'giftCouponsdata');" id="giftCouponsdata"/> -->
													
													<c:choose>
											        <%-- <c:when test="${giftCouponsdataUrl ne null and giftCouponsdataUrl ne '' }" > --%>
											        <c:when test="${giftCouponsdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'giftCouponsdata');" id="giftCouponsdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'giftCouponsdata');" id="giftCouponsdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message code="emailSettings.discount_coupons.label" />
													<input type="hidden" id="giftCouponsdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 109%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="giftCouponsdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="" value="${giftCouponsdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															
															<c:choose>
											        <c:when test="${giftCouponsdataUrl ne null and giftCouponsdataUrl ne '' }" >
													<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="giftCouponsdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('giftCouponsdata',this);"
																	class="upload" >
															</div>
											        </c:when>
											        <c:otherwise>
													<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="giftCouponsdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('giftCouponsdata',this);"
																	class="upload" disabled="disabled" >
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${giftCouponsdataUrl ne null and giftCouponsdataUrl ne '' }">
													<a href="${giftCouponsdataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>




<%-- 
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="giftCouponsui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="giftCouponsuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${giftCouponsui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="giftCouponsuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('giftCouponsui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${giftCouponsuiUrl ne null and giftCouponsuiUrl ne '' }">
													<a href="${giftCouponsuiUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>


 --%>




										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'giftVouchersdata');" id="giftVouchersdata"/> -->
													
													<c:choose>
											        <%-- <c:when test="${giftVouchersdataUrl ne null and giftVouchersdataUrl ne '' }" > --%>
											        <c:when test="${giftVouchersdataStatus ==  true }" > 
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'giftVouchersdata');" id="giftVouchersdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'giftVouchersdata');" id="giftVouchersdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message code="emailSettings.gift_vouchers.label" />
													<input type="hidden" id="giftVouchersdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="giftVouchersdataFile" class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style="" value="${giftVouchersdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
											        <c:when test="${giftVouchersdataUrl ne null and giftVouchersdataUrl ne '' }" >
													<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="giftVouchersdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('giftVouchersdata',this);"
																	class="upload" >
															</div>
											        </c:when>
											        <c:otherwise>
													<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="giftVouchersdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('giftVouchersdata',this);"
																	class="upload" disabled="disabled" >
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${giftVouchersdataUrl ne null and giftVouchersdataUrl ne '' }">
													<a href="${giftVouchersdataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>


											</div>
										</div>

<%-- 
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="giftVouchersui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="giftVouchersuiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${giftVouchersui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="giftVouchersuiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('giftVouchersui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>


												<c:if
													test="${giftVouchersuiUrl ne null and giftVouchersuiUrl ne '' }">
													<a href="${giftVouchersuiUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

 --%>







										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'loyalityRewardingdata');" id="loyalityRewardingdata"/> -->
													
													<c:choose>
											        <%-- <c:when test="${loyalityRewardingdataUrl ne null and loyalityRewardingdataUrl ne '' }" > --%>
											        <c:when test="${loyalityRewardingdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'loyalityRewardingdata');" id="loyalityRewardingdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'loyalityRewardingdata');" id="loyalityRewardingdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message
														code="emailSettings.loyalty_rewarding.label" />
													<input type="hidden" id="loyalityRewardingdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="padding-left: 0px; padding-right: 0px; width: 109%;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="loyalityRewardingdataFile"
																class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style=""
																value="${loyalityRewardingdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
											        <c:when test="${loyalityRewardingdataUrl ne null and loyalityRewardingdataUrl ne '' }" >
														<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="loyalityRewardingdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('loyalityRewardingdata',this);"
																	class="upload" >
															</div>
											        </c:when>
											        <c:otherwise>
														<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="loyalityRewardingdataBtn" type="file" accept=".xml"
																	onchange="addNameToTextBox('loyalityRewardingdata',this);"
																	class="upload" disabled="disabled" >
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${loyalityRewardingdataUrl ne null and loyalityRewardingdataUrl ne '' }">
													<a href="${loyalityRewardingdataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

<%-- 
										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="loyalityRewardingui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="loyalityRewardinguiFile" class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${loyalityRewardingui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="loyalityRewardinguiBtn" type="file" accept=".xsl"
																	onchange="addNameToTextBox('loyalityRewardingui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${loyalityRewardinguiUrl ne null and loyalityRewardinguiUrl ne '' }">
													<a href="${loyalityRewardinguiUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

 --%>






										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'notificationGreetingsdata');" id="notificationGreetingsdata"/> -->
													
													<c:choose>
											        <%-- <c:when test="${notificationGreetingsdataUrl ne null and notificationGreetingsdataUrl ne '' }" > --%>
											        <c:when test="${notificationGreetingsdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'notificationGreetingsdata');" id="notificationGreetingsdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'notificationGreetingsdata');" id="notificationGreetingsdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message code="emailSettings.notification_greetings" />
													<input type="hidden" id="notificationGreetingsdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="notificationGreetingsdataFile"
																class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style=""
																value="${notificationGreetingsdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															<c:choose>
											        <c:when test="${notificationGreetingsdataUrl ne null and notificationGreetingsdataUrl ne '' }" >
															<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="notificationGreetingsdataBtn" type="file"
																	accept=".xml" 
																	onchange="addNameToTextBox('notificationGreetingsdata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="notificationGreetingsdataBtn" type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('notificationGreetingsdata',this);"
																	class="upload">
															</div>
											        </c:otherwise>
											      	</c:choose>
											      	

														</div>
													</div>

												</div>

												<c:if
													test="${notificationGreetingsdataUrl ne null and notificationGreetingsdataUrl ne '' }">
													<a href="${notificationGreetingsdataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

<%-- 

										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="notificationGreetingsui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="notificationGreetingsuiFile"
																class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${notificationGreetingsui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="notificationGreetingsuiBtn" type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('notificationGreetingsui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${notificationGreetingsuiUrl ne null and notificationGreetingsuiUrl ne '' }">
													<a href="${notificationGreetingsuiUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>

 --%>


										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<!-- <div class="col-lg-1"></div> -->
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'notificationCampaignsdata');" id="notificationCampaignsdata"/>  -->
													
													<c:choose>
											        <%-- <c:when test="${notificationCampaignsdataUrl ne null and notificationCampaignsdataUrl ne '' }" > --%>
											        <c:when test="${notificationCampaignsdataStatus ==  true }" >
													<input type="checkbox" checked style="vertical-align: -2px" onchange="enableFileBrowse(this,'notificationCampaignsdata');" id="notificationCampaignsdata"/>
											        </c:when>
											        <c:otherwise>
													<input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'notificationCampaignsdata');" id="notificationCampaignsdata"/>
											        </c:otherwise>
											      	</c:choose>
											      	
													<spring:message code="emailSettings.notification_campaigns" />
													<input type="hidden" id="notificationCampaignsdata_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="notificationCampaignsdataFile"
																class="form-control"
																placeholder="<spring:message code="choose.xml" />"
																disabled="disabled" style=""
																value="${notificationCampaignsdata}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															
															
															<c:choose>
											        <c:when test="${notificationCampaignsdataUrl ne null and notificationCampaignsdataUrl ne '' }" >
													<div class="fileUpload btn btn-primary browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="notificationCampaignsdataBtn" type="file"
																	accept=".xml" 
																	onchange="addNameToTextBox('notificationCampaignsdata',this);"
																	class="upload">
															</div>
											        </c:when>
											        <c:otherwise>
													<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="notificationCampaignsdataBtn" type="file"
																	accept=".xml" disabled="disabled"
																	onchange="addNameToTextBox('notificationCampaignsdata',this);"
																	class="upload">
															</div>
											        </c:otherwise>
											      	</c:choose>

														</div>
													</div>

												</div>

												<c:if
													test="${notificationCampaignsdataUrl ne null and notificationCampaignsdataUrl ne '' }">
													<a href="${notificationCampaignsdataUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>


<%-- 

										<div class="col-lg-12 col-sm-12" style="padding-right: 0px;">

											<div class="row" style="">
												<div class="col-lg-1"></div>
												<div class="form-group col-lg-5 col-sm-12"
													style="padding-right: 0px; padding-left: 0px;">
													<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->
													<spring:message
														code="emailSettings.procurement.purchaseOrder" />&nbsp&nbspUI
													<input type="hidden" id="notificationCampaignsui_refId">
												</div>
												<div
													class="form-group col-lg-5 col-sm-12 col-xs-12 columnpadding"
													style="padding-left: 0px;">
													<div class=" col-lg-8 col-sm-12 col-xs-8 columnpadding"
														style="width: 109%; padding-left: 0px; padding-right: 0px;">
														<div class=" col-lg-9 col-sm-11 col-xs-9 "
															style="padding-left: 0px; padding-right: 2px;">
															<input id="notificationCampaignsuiFile"
																class="form-control"
																placeholder="<spring:message code="choose.xsl" />"
																disabled="disabled" multiple="multiple" style=""
																value="${notificationCampaignsui}">
														</div>
														<div class=" col-lg-3 col-sm-4 col-xs-3 columnpadding"
															style="padding-left: 0px;">
															<div class="fileUpload btn btn-primar browsebutton"
																style="margin-top: 0px; font-weight: bold;">
																<span style="font-size: 15px;">Browse..</span> <input
																	id="notificationCampaignsuiBtn" type="file"
																	accept=".xsl"
																	onchange="addNameToTextBox('notificationCampaignsui',this);"
																	class="upload">
															</div>

														</div>
													</div>

												</div>

												<c:if
													test="${notificationCampaignsuiUrl ne null and notificationCampaignsuiUrl ne '' }">
													<a href="${notificationCampaignsuiUrl}"
														style="cursor: pointer; margin-left: 23px" target="_blank">
														<i class="fa fa-file-code-o  fa-2x" aria-hidden="true"
														style="width: 25px"></i>
													</a>
												</c:if>

											</div>
										</div>


 --%>






									</div>














									<!--   templates end -->
									<%-- 				                  <div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="sales.order.label" />
             	<input type="hidden" id="salesOrder_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7" >
  						<input id="salesOrderFile" class="form-control" value="${salesOrder}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="salesOrderBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('salesOrder',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty salesOrderUrl}">
								<a href="${salesOrderUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
						</span>
					</div>
					</div>
					</div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="sales.billing.label" />
             	<input type="hidden" id="salesBilling_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="salesBillingFile" class="form-control" value="${salesBilling}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="salesBillingBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('salesBilling',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty salesBillingUrl}">
								<a href="${salesBillingUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="salesBillingImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="sales.delivery.shipment.label" />
             	<input type="hidden" id="salesDerliveryShipment_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="salesDerliveryShipmentFile" class="form-control" value="${salesDerliveryShipment}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="salesDerliveryShipmentBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('salesDerliveryShipment',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty salesDerliveryShipmentUrl}">
								<a href="${salesDerliveryShipmentUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="salesDerliveryShipmentImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="sales.invoice.label" />
             	<input type="hidden" id="salesInvoice_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="salesInvoiceFile" class="form-control" value="${salesInvoice}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="salesInvoiceBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('salesInvoice',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty salesInvoiceUrl}">
								<a href="${salesInvoiceUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="salesInvoiceImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
					 <div class="row">
             <div class="form-group col-lg-5" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 18px;"><spring:message code="purchases.label" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
             </div>
             <div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="purchase.rfq.label" />
             	<input type="hidden" id="purchaseRFQ_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="purchaseRFQFile" class="form-control" value="${purchaseRFQ}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="purchaseRFQBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('purchaseRFQ',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty purchaseRFQUrl}">
								<a href="${purchaseRFQUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="purchaseRFQImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
					 <div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'purchaseOrder');" id="purchaseOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="purchase.order.label" />
             	<input type="hidden" id="purchaseOrder_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="purchaseOrderFile" class="form-control" value="${purchaseOrder}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="purchaseOrderBtn"  type="file" accept=".xml" onchange="addNameToTextBox('purchaseOrder',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty purchaseOrderUrl}">
								<a href="${purchaseOrderUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="purchaseOrderImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>

					</div>
             	</div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="purchase.shipment.receipt.label" />
             	<input type="hidden" id="purchaseShipmentReceipt_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="purchaseShipmentReceiptFile" class="form-control" value="${purchaseShipmentReceipt}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="purchaseShipmentReceiptBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('purchaseShipmentReceipt',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty purchaseShipmentReceiptUrl}">
								<a href="${purchaseShipmentReceiptUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="purchaseShipmentReceiptImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="purchase.shipment.Inspection.label" />
             	<input type="hidden" id="purchaseShipmentInspection_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="purchaseShipmentInspectionFile" class="form-control" value="${purchaseShipmentInspection}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="purchaseShipmentInspectionBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('purchaseShipmentInspection',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty purchaseShipmentInspectionUrl}">
								<a href="${purchaseShipmentInspectionUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="purchaseShipmentInspectionImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
				
					<div class="row">
             <div class="form-group col-lg-5" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 18px;"><spring:message code="goods.label" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
             </div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="goods.stock.request.label" />
             	<input type="hidden" id="goodsStockRequest_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="goodsStockRequestFile" class="form-control" value="${goodsStockRequest}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="goodsStockRequestBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('goodsStockRequest',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty goodsStockRequestUrl}">
								<a href="${goodsStockRequestUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="goodsStockRequestImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
					 <div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'goodsIssue');" id="goodsIssue"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="goods.issue.label" />
             	<input type="hidden" id="goodsIssue_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="goodsIssueFile" class="form-control" value="${goodsIssue}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="goodsIssueBtn"  type="file" value="${goodsIssue}" accept=".xml" onchange="addNameToTextBox('goodsIssue',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty goodsIssueUrl}">
								<a href="${goodsIssueUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="goodsIssueImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>

					</div>
             	</div>
             	       <div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'goodsReceipt');" id="goodsReceipt"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="goods.receipt.label" />
             	<input type="hidden" id="goodsReceipt_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="goodsReceiptFile" class="form-control" value="${goodsReceipt}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="goodsReceiptBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('goodsReceipt',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty goodsReceiptUrl}">
								<a href="${goodsReceiptUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="goodsReceiptImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>

					</div>
             	</div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="goods.stock.return.label" />
             	<input type="hidden" id="goodsStockReturn_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="goodsStockReturnFile" class="form-control" value="${goodsStockReturn}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="goodsStockReturnBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('goodsStockReturn',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty goodsStockReturnUrl}">
								<a href="${goodsStockReturnUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="goodsStockReturnImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div>
					<div class="row">
             <div class="form-group col-lg-5" style="padding-left: 5%;padding-right: 5%">
             	<label style="font-weight: bold;font-size: 18px;"><spring:message code="stocks.label" /></label>
                 <hr style="margin-top: -5px;width: 99%;" />
             </div>
             </div>
					<div class="row">
             	<div class="col-lg-1"></div>
             	<div class="form-group col-lg-4" style="padding-left: 5%;font-size: 16px;">
             		<!-- <input type="checkbox" style="vertical-align: -2px" onchange="enableFileBrowse(this,'customerOrder');" id="customerOrder"/> -->&nbsp;&nbsp;&nbsp;<spring:message code="stock.verification.label" />
             	<input type="hidden" id="stocksVerification_refId">
             	</div>
             	<div class="form-group col-lg-6">
             		<div class="form-group col-lg-7">
  						<input id="stocksVerificationFile" class="form-control" value="${stocksVerification}" placeholder="Choose File" disabled="disabled" />
  					</div>
  					<div class="form-group col-lg-5">
						<div class="fileUpload btn btn-primary" style="font-weight: bold;">
			    			<span style="font-size: 15px;">Browse</span>
			    			<input id="stocksVerificationBtn"  type="file"  accept=".xml" onchange="addNameToTextBox('stocksVerification',this);" class="upload" />
						</div> &nbsp;&nbsp;&nbsp;&nbsp;
					  	<a href="${pageContext.request.contextPath}/templatesForDownload/product_master.xls"><img title="Data Format" alt="" style="width: 35px;" src="${pageContext.request.contextPath}/images/xlsblue.png"></a>
					  	&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span style="">
					  		<c:if test="${not empty stocksVerificationUrl}">
								<a href="${stocksVerificationUrl}" title="<spring:message code="view.template.label" />" target="_blank"><img style="width: 30px" id="salesOrderImg" src="${pageContext.request.contextPath}/images/template_icon.jpg"></a>
					  		</c:if>
							<img style="width: 30px" id="stocksVerificationImg" src="${pageContext.request.contextPath}/images/circleWait.gif">
						</span>
					</div>
					</div>
					</div> --%>
								</div>
							<!-- </div> -->
							<div class="row" style="text-align: right; margin-top: 0px;">
								<div class="row">
									<div class="col-lg-12">
										<div class="row" style="text-align: center; margin-top: 15px">
											<c:forEach var="accessControl"
												items="${sessionScope.settings}">
												<c:if
													test="${accessControl.appDocument == 'SmsSettings' && accessControl.write == true}">
													
														<input type="button" id="submit"
															style="margin-right: 25%;" class="btnCls"
															data-toggle="modal" data-target="#myModalSave"
															value="<spring:message code="submit.label" />">
													
												</c:if>
											</c:forEach>
											<input type="button" class="btnCls" style=""
												onclick="showCustomerSettingsFlow();"
												value="<spring:message code="cancel.label" />">
										</div>
									</div>
								</div>
							</div>
							<br><br>
						</div>
						
						
						
						
						<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">SMS Settings</h4>
        </div>
        <div class="modal-body">
          <p>Enter any valid mobile number to verify sms settings. Thank You</p>
          
          <input type = "text" id = "mobileNo"  class="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="business.enquiry.phone.no.label" />"/>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn .btn-info" onclick="validateUrl();"> OK </button>
        </div>
      </div>
      
    </div>
  </div>
  
  
  
  
      <div id="myModalSave" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Customer SMS Settings</h4>
      </div>
      <div class="modal-body">
        <p>Requested to make changes in Customer SMS Settings, do you want to continue and apply?</p>
      </div>
      <div class="modal-footer">
      <div class = "col-lg-6" >
      </div>
         <c:if test="${status == 'new'}">
      <div class = "col-lg-6">
      
        <button type="button" class="btnCls"  onclick="validateSMSSettingsForm('new')"  data-dismiss="modal">Ok</button>
      </div>
      </c:if>
      <c:if test="${status == 'edit'}">
      <div class = "col-lg-6">
        <button type="button" class="btnCls"  onclick="validateSMSSettingsForm('edit')"  data-dismiss="modal">Ok</button>
      </div>
      </c:if>
      </div>
    </div>

  </div>
</div>

</div>

  
						
						
						
						
						
						
						
						 <script type="text/javascript">
						 	var count = 1;
						 </script>
				<c:forEach var="parameters" items="${parametersList}" varStatus="theCount">
             	<input type="hidden" id="parameterName${theCount.count}" value="${parameters.parameterName}"/>
             	<input type="hidden" id="parameterValue${theCount.count}" value="${parameters.parameterValue}"/>
              	
              
              <script type="text/javascript">
             	 addItemIdOnLoad(count);
              	count++;
              </script>
              
            </c:forEach>
						

						<div class="box-footer"></div>
					</form>
				</div>

			</div>
		</div>
	</section>
	<!-- /.content -->
</body>
</html>